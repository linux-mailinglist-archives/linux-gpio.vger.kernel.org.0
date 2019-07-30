Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094777A6F5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730083AbfG3Lai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 07:30:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:20371 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730101AbfG3Lai (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 07:30:38 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 04:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; 
   d="scan'208";a="190841166"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 30 Jul 2019 04:30:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 30 Jul 2019 14:30:33 +0300
Date:   Tue, 30 Jul 2019 14:30:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: add support for fetching descriptors from
 static properties
Message-ID: <20190730113033.GJ28600@kuha.fi.intel.com>
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
 <20190713075259.243565-3-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713075259.243565-3-dmitry.torokhov@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dmitry,

On Sat, Jul 13, 2019 at 12:52:59AM -0700, Dmitry Torokhov wrote:
> Now that static device properties understand notion of child nodes, let's
> teach gpiolib to tie such children and machine GPIO descriptor tables.
> We will continue using a single table for entire device, but instead of
> using connection ID as a lookup key in the GPIO descriptor table directly,
> we will perform additional translation: fwnode_get_named_gpiod() when
> dealing with property_set-backed fwnodes will try parsing string property
> with name matching connection ID and use result of the lookup as the key in
> the table:
> 
> static const struct property_entry dev_child1_props[] __initconst = {
> 	...
> 	PROPERTY_ENTRY_STRING("gpios",		"child-1-gpios"),
> 	{ }
> };
> 
> static struct gpiod_lookup_table dev_gpiod_table = {
> 	.dev_id = "some-device",
> 	.table = {
> 		...
> 		GPIO_LOOKUP_IDX("B", 1, "child-1-gpios", 1, GPIO_ACTIVE_LOW),
> 		...
> 	},
> };

We don't need struct gpiod_lookup_table anymore. We can mimic DT with
the software nodes now that we have those "reference properties". A
gpio reference with the software nodes would look something like this:

        enum {
                GPIO_CONTROLLER,
                MY_DEVICE
        };

        static const struct software_node nodes[];

        static const struct software_node_ref_args reset_gpio_ref = {
                .node = &nodes[GPIO_CONTROLLER],
                .nargs = 2,
                .args = {
                        14,                     /* line number */
                        GPIO_ACTIVE_HIGH        /* flags */
                }
        };

        static const struct software_node_reference my_refs[] = {
                { "reset-gpios", 1, &reset_gpio_ref }
        };

        /* Optionally, we could support gpiochip finding by name... */
        static const struct property_entry my_props[] = {
                PROPERTY_ENTRY_STRING("gpio-controller", "name_of_the_controller")
        };

        static const struct software_node nodes[] = {
                [GPIO_CONTROLLER]       = { "gpio_controller" },
                [MY_DEVICE]             = { "my_device", NULL, my_props, my_refs }
        };

        void my_init(void)
        {
                ...
                ret = software_node_register_nodes(nodes);
                ...
        }

In gpiolib we should now be able to access that reference with
fwnode_property_get_references_args():

        static int gpiochip_match_fwnode(struct gpio_chip *chip, void *fwnode)
        {
                /* The fwnode member needs to be added to struct gpio_chip */
                return chip->fwnode == fwnode;
        }

        static struct gpio_desc *gpiod_find(struct device *dev,
                                            const char *con_id,
                                            unsigned int idx,
                                            unsigned long flags)
        {
                struct fwnode_reference_args args;
                struct gpio_chip *chip;
                struct gpio_desc *desc;
                const char *name;
                int ret;

                ret = fwnode_property_get_refernce_args(dev_fwnode(dev), con_id,
                                                        NULL, idx, &args);
                ...

                /* Let's find the gpiochip */
                chip = gpiochip_find(args.fwnode, gpiochip_match_fwnode);
                ...

                /* Or optionally with find_chip_by_name() */
                //ret = device_property_read_string(dev, "gpio-controller", &name);
                ...
                //chip = find_chip_by_name(name);
                ...

                /* I'm assuming hwnum is the same as line number? */
                desc = gpiochip_get_desc(chip, args.args[0]);
                *flags = args.args[1];

                return desc;
        }

The above is just an example, but I'm pretty sure that something like
it (with a little bit of tuning) is all that we need.

thanks,

-- 
heikki

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFC930A802
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 13:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhBAMvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 07:51:13 -0500
Received: from mga14.intel.com ([192.55.52.115]:13776 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231192AbhBAMvL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Feb 2021 07:51:11 -0500
IronPort-SDR: JySUS6VJvGHgLeZtYHo2NGLXdbvZU/IY6D/G9EiclaTcWkhZyea99TunYfwOAhuU7Gi4IIdM6P
 KkqjmKiyXcDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="179900463"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="179900463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:49:25 -0800
IronPort-SDR: rQPWLJvvDfkweprUpyUVhNYKDhJj2qGern6r918qtBA6LpzkXIvTEVNg39JK28JnKjEt0vnKyO
 qOAjDeHaH1qQ==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="506837237"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:49:22 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6Ydq-0018IG-CI; Mon, 01 Feb 2021 14:49:18 +0200
Date:   Mon, 1 Feb 2021 14:49:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
Message-ID: <YBf4zjo7JJaw5iu1@smile.fi.intel.com>
References: <20210129134624.9247-1-brgl@bgdev.pl>
 <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com>
 <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
 <YBfX38JBa0psBizQ@smile.fi.intel.com>
 <CAMRc=Mfgw5oA-TA2PN-Z+ape0POAtLwVeDJnzH1iuzKw5wYQ5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfgw5oA-TA2PN-Z+ape0POAtLwVeDJnzH1iuzKw5wYQ5Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 01, 2021 at 11:59:31AM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 1, 2021 at 11:28 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:

...

> > > > > +static int gpio_sim_set_config(struct gpio_chip *gc,
> > > > > +                               unsigned int offset, unsigned long config)
> > > > > +{
> > > > > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > > > > +
> > > > > +     switch (pinconf_to_config_param(config)) {
> > > >
> > > > > +     case PIN_CONFIG_BIAS_PULL_UP:
> > > > > +             return gpio_sim_apply_pull(chip, offset, 1);
> > > > > +     case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > +             return gpio_sim_apply_pull(chip, offset, 0);
> > > >
> > > > But aren't we got a parameter (1 or 0) from config? And hence
> > > >
> > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > >                 return gpio_sim_apply_pull(chip, offset, <param>);
> > > >
> > > > ?
> > >
> > > I believe this is more explicit and so easier to read if you don't
> > > know the GPIO and pinctrl internals.
> >
> > If we ever go to change meanings of the values in param, it will require to fix
> > this occurrence which seems to me suboptimal.
> >
> 
> Why would we do it? This is internal to this driver.
> 
> > > > > +     default:
> > > > > +             break;
> > > > > +     }
> > > > > +
> > > > > +     return -ENOTSUPP;
> > > > > +}

Up to you.
My personal vote for using the embedded param, because it makes code consistent
and if anybody takes this driver as an example for something, it will be better
example in such case..

...

> > > > > +static ssize_t gpio_sim_sysfs_line_store(struct device *dev,
> > > > > +                                      struct device_attribute *attr,
> > > > > +                                      const char *buf, size_t len)
> > > > > +{
> > > > > +     struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> > > > > +     struct gpio_sim_chip *chip = dev_get_drvdata(dev);
> > > > > +     int ret, val;
> > > >
> > > > > +     ret = kstrtoint(buf, 0, &val);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +     if (val != 0 && val != 1)
> > > > > +             return -EINVAL;
> > > >
> > > > kstrtobool() ?
> > > >
> > >
> > > No, we really only want 0 or 1, no yes, Y etc.
> >
> > Side note: But you allow 0x00001, for example...
> 
> Good point. In that case we should check if len > 2 and if buf[0] ==
> '1' or '0' and that's all we allow.

Up to you also. I don't like such a strictness. OTOH we can relax afterwards if
needed.

> > Then why not to use unsigned type from the first place and add a comment?
> >
> > > > > +     ret = gpio_sim_apply_pull(chip, line_attr->offset, val);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     return len;
> > > > > +}

...

> > > > > +struct gpio_sim_chip_config {
> > > > > +     struct config_item item;
> > > > > +
> > > > > +     /*
> > > > > +      * If pdev is NULL, the item is 'pending' (waiting for configuration).
> > > > > +      * Once the pointer is assigned, the device has been created and the
> > > > > +      * item is 'live'.
> > > > > +      */
> > > > > +     struct platform_device *pdev;
> > > >
> > > > Are you sure
> > > >
> > > >         struct device *dev;
> > > >
> > > > is not sufficient?
> > > >
> > >
> > > It may be but I really prefer those simulated devices to be on the platform bus.
> >
> > My point here is that there is no need to keep specific bus devices type,
> > because you may easily derive it from the struct device pointer. Basically if
> > you are almost using struct device in your code (seems to me the case), you
> > won't need to carry bus specific one and dereference it each time.
> 
> But don't we need a bus to even register a device? I haven't checked
> in a long time but IIRC it's mandatory.
> 
> Let me give you a different argument - the platform device offers a
> very simple API for registering devices with properties being
> duplicated behind the scenes etc. It seems to me that registering a
> bare struct device * would take more boiler-plate code for not much
> gain.

Yes, I'm not objecting the platform bus choice. I'm objecting the keeping of
the pointer to the bus specific structure.

There are helpers like to_platform_device() which make the bus specific
pointers go away from the structures and easier code when you use exactly
pointer to struct device rather than bus specific one.

Anyway, up to you.

-- 
With Best Regards,
Andy Shevchenko



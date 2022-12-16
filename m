Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEC164ECC2
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 15:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiLPOQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 09:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiLPOQc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 09:16:32 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8794554F7;
        Fri, 16 Dec 2022 06:16:31 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320147224"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320147224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 06:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="651957349"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="651957349"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2022 06:16:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6BVg-00At6F-2G;
        Fri, 16 Dec 2022 16:16:24 +0200
Date:   Fri, 16 Dec 2022 16:16:24 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 08/11] platform/x86: int3472/discrete: Create a LED
 class device for the privacy LED
Message-ID: <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216113013.126881-9-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 12:30:10PM +0100, Hans de Goede wrote:
> On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
> X1 Nano gen 2 there is no clock-enable pin, triggering the:
> "No clk GPIO. The privacy LED won't work" warning and causing the privacy
> LED to not work.
> 
> Fix this by modeling the privacy LED as a LED class device rather then
> integrating it with the registered clock.
> 
> Note this relies on media subsys changes to actually turn the LED on/off
> when the sensor's v4l2_subdev's s_stream() operand gets called.

...

> +	struct int3472_pled {
> +		char name[INT3472_LED_MAX_NAME_LEN];
> +		struct led_lookup_data lookup;

> +		struct led_classdev classdev;

Why not putting this as a first member in the struct, so any container_of()
against it become no-op at compile time?

> +		struct gpio_desc *gpio;
> +	} pled;

...

> +	if (IS_ERR(int3472->pled.gpio)) {
> +		ret = PTR_ERR(int3472->pled.gpio);
> +		return dev_err_probe(int3472->dev, ret, "getting privacy LED GPIO\n");

	return dev_err_probe(...);

> +	}

...

> +	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
> +	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
> +		 "%s::privacy_led", acpi_dev_name(int3472->sensor));

> +	for (i = 0; int3472->pled.name[i]; i++) {
> +		if (int3472->pled.name[i] == ':') {
> +			int3472->pled.name[i] = '_';
> +			break;
> +		}
> +	}

NIH strreplace().

...

> +void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
> +{
> +	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
> +		return;

This dups the check inside the _unregister() below, right?

> +	led_remove_lookup(&int3472->pled.lookup);

With list_del_init() I believe the above check can be droped.

> +	led_classdev_unregister(&int3472->pled.classdev);
> +	gpiod_put(int3472->pled.gpio);
> +}

-- 
With Best Regards,
Andy Shevchenko



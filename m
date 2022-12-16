Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFF164F023
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 18:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbiLPROQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 12:14:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbiLPROK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 12:14:10 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E988E6F4B7;
        Fri, 16 Dec 2022 09:14:08 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383346555"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="383346555"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 09:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="978661077"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="978661077"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2022 09:14:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6EHY-00Awm4-2m;
        Fri, 16 Dec 2022 19:14:00 +0200
Date:   Fri, 16 Dec 2022 19:14:00 +0200
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
Message-ID: <Y5ynWBqkhLB2cHYU@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-9-hdegoede@redhat.com>
 <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
 <d3d28b30-a364-66eb-7870-06c43d683bb7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d28b30-a364-66eb-7870-06c43d683bb7@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 05:29:13PM +0100, Hans de Goede wrote:
> On 12/16/22 15:16, Andy Shevchenko wrote:
> > On Fri, Dec 16, 2022 at 12:30:10PM +0100, Hans de Goede wrote:

...

> >> +	if (IS_ERR(int3472->pled.gpio)) {
> >> +		ret = PTR_ERR(int3472->pled.gpio);
> >> +		return dev_err_probe(int3472->dev, ret, "getting privacy LED GPIO\n");
> > 
> > 	return dev_err_probe(...);
> 
> That goes over 100 chars.

The point is you don't need ret to be initialized. Moreover, no-one prevents
you to split the line to two.

> >> +	}

...

> >> +	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
> >> +	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
> >> +		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> > 
> >> +	for (i = 0; int3472->pled.name[i]; i++) {
> >> +		if (int3472->pled.name[i] == ':') {
> >> +			int3472->pled.name[i] = '_';
> >> +			break;
> >> +		}
> >> +	}
> > 
> > NIH strreplace().
> 
> Please look more careful, quoting from the strreplace() docs:
> 
>  * strreplace - Replace all occurrences of character in string.
> 
> Notice the *all* and we only want to replace the first ':' here,
> because the ':' char has a special meaning in LED class-device-names.

It's still possible to use that, but anyway, the above is still
something NIH.

	char *p;

	p = strchr(name, ':');
	*p = '_';

But either code has an issue if by some reason you need to check if : is ever
present in acpi_dev_name().

The more robust is either to copy acpi_dev_name(), call strreplace(), so you
will be sure that _all_ : from ACPI device name will be covered and then attach
the rest.

...

> >> +void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
> >> +{
> >> +	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
> >> +		return;
> > 
> > This dups the check inside the _unregister() below, right?
> 
> Right.
> 
> >> +	led_remove_lookup(&int3472->pled.lookup);
> > 
> > With list_del_init() I believe the above check can be droped.
> 
> No it cannot, list_del_init() inside led_remove_lookup() would
> protect against double led_remove_lookup() calls.
> 
> But here we may have a completely uninitialized list_head on
> devices without an INT3472 privacy-led, which will trigger
> either __list_del_entry_valid() errors or lead to NULL
> pointer derefs.

But we can initialize that as well...

> >> +	led_classdev_unregister(&int3472->pled.classdev);
> >> +	gpiod_put(int3472->pled.gpio);
> >> +}

-- 
With Best Regards,
Andy Shevchenko



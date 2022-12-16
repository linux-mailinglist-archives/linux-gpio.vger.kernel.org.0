Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4FC64EC8A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 15:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiLPODa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 09:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiLPOD3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 09:03:29 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AD7A1A6;
        Fri, 16 Dec 2022 06:03:27 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320857507"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320857507"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 06:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="718360916"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="718360916"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2022 06:02:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6BIW-00Asqn-29;
        Fri, 16 Dec 2022 16:02:48 +0200
Date:   Fri, 16 Dec 2022 16:02:48 +0200
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
Subject: Re: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code
 enable/disable the privacy LED if present
Message-ID: <Y5x6iHdMj6Dx0Buf@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216113013.126881-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 12:30:08PM +0100, Hans de Goede wrote:
> Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
> for sensors with a privacy LED, rather then having to duplicate this code
> in all the sensor drivers.

...

> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
> +{
> +	if (!sd->dev)
> +		return;
> +
> +	/* Try to get privacy-led once, at first s_stream() */
> +	if (!sd->privacy_led)
> +		sd->privacy_led = led_get(sd->dev, "privacy-led");

> +

Redundant blank line?

> +	if (IS_ERR(sd->privacy_led))
> +		return;

I'm not sure I have got the logic right. Let's assume we call it with
_led == NULL. Then in case of error, we feel it with the error pointer.
If we call again, we check for NULL, and return error pointer.

So, we won't try the second time. Is it by design? Or should it be

	struct ... *led;

	if (!privacy_led) {
		led = ...
		if (IS_ERR())
			return;
		privacy_led = led;
	}

?

> +}

-- 
With Best Regards,
Andy Shevchenko



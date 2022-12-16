Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8099764ED2E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 15:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiLPO5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 09:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiLPO5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 09:57:11 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15936FD14;
        Fri, 16 Dec 2022 06:57:10 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="298651717"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="298651717"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 06:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="627584664"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="627584664"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2022 06:57:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6C90-00AtsE-36;
        Fri, 16 Dec 2022 16:57:02 +0200
Date:   Fri, 16 Dec 2022 16:57:02 +0200
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
Subject: Re: [PATCH v3 11/11] platform/x86: int3472/discrete: Get the
 polarity from the _DSM entry
Message-ID: <Y5yHPvXG/4pWivEG@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-12-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216113013.126881-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 12:30:13PM +0100, Hans de Goede wrote:
> According to:
> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
> 
> Bits 31-24 of the _DSM pin entry integer value codes the active-value,

Here and in the code you actually can refer to it as 3rd byte.

> that is the actual physical signal (0 or 1) which needs to be output on
> the pin to turn the sensor chip on (to make it active).
> 
> So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
> pin needs to be 0 to take the chip out of reset. IOW in this case the reset
> signal is active-high rather then the default active-low.
> 
> And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
> pin needs to be 0 to enable the clk. So in this case the clk-en signal
> is active-low rather then the default active-high.
> 
> IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
> is inverted.
> 
> Add a check for this and also propagate this new polarity to the clock
> registration.

...

> +	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */

> +	active_value = obj->integer.value >> 24;
> +	if (!active_value)

Not sure why you need a temporary variable for this. Just use
GENMASK()/GENMASK_ULL()?

	if (obj->integer.value & GENMASK(31, 24));

In this case you even don't need to repeat bit numbers in the comment.

> +		polarity ^= GPIO_ACTIVE_LOW;

> +	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
> +		agpio->resource_source.string_ptr, agpio->pin_table[0],
> +		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");

Yet another high/low :-)

-- 
With Best Regards,
Andy Shevchenko



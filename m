Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AD42B0703
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 14:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgKLNvX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 08:51:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:22864 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbgKLNvX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 08:51:23 -0500
IronPort-SDR: VSPQV4mzvmifCkQ0BLEwLuixs49jnzgeZedxiVKj6wVCW/H41dmZVzRsL7/OkSYXxMF0NyKbBs
 uWDsKdBBL4Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149582172"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="149582172"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 05:51:22 -0800
IronPort-SDR: IccrygatTsh8yvG3Y1Zq4ntpzQasz92HXdACcW43KFQ5DqTn1XIsgWUoE5yE8hewWm+zlfWD9H
 aYX1VqCPFIqw==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="357094954"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 05:51:19 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kdD1R-006DVS-9V; Thu, 12 Nov 2020 15:52:21 +0200
Date:   Thu, 12 Nov 2020 15:52:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     caizhaopeng@uniontech.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhangyueqian <zhangyueqian@uniontech.com>,
        Zhangshuang <zhangshuang@uniontech.com>,
        Hualet Wang <wangyaohua@uniontech.com>,
        Zhanglei <zhanglei@uniontech.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] pinctrl: add IRQF_EARLY_RESUME flags with gpio irq
 for elan touchpad.
Message-ID: <20201112135221.GC4077@smile.fi.intel.com>
References: <20200424091201.568-1-caizhaopeng@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424091201.568-1-caizhaopeng@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


+Cc: Hans.

I can't speak for AMD, but I think it may be useful for Intel pin control.
However, I didn't check what may be the side effects of this change and neither
contributor answered to my comments...

So, just heads up.

On Fri, Apr 24, 2020 at 05:12:01PM +0800, caizhaopeng@uniontech.com wrote:
> From: Caicai <caizhaopeng@uniontech.com>
> 
> I had tested two Notebook machines, the Intel i5(or amd ryzen)
> with elan touchpad, and there's a probability that the touchpad
> won't work after going to the S3/S4 to wake up, that it would
> appear no more than 15 times. I found that there's no interrupt
> to check for /proc/interrupt. It was found that the gpio
> interrupt of i2c was also not on top. By adding the gpio
> interrupt flags with IRQF_EARLY_RESUME, now the touchpad tested
> 200 + times works well.
> 
> Signed-off-by: Caicai <caizhaopeng@uniontech.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
>  drivers/pinctrl/pinctrl-amd.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 8fb6c9668c37..a350dade6aa0 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1189,7 +1189,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  	 * controllers share the same interrupt line.
>  	 */
>  	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
> -			       IRQF_SHARED | IRQF_NO_THREAD,
> +			       IRQF_SHARED | IRQF_NO_THREAD | IRQF_EARLY_RESUME,
>  			       dev_name(pctrl->dev), pctrl);
>  	if (ret) {
>  		dev_err(pctrl->dev, "failed to request interrupt\n");
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 977792654e01..70c37f4da2b1 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -937,7 +937,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
> -			       IRQF_SHARED, KBUILD_MODNAME, gpio_dev);
> +			       IRQF_SHARED | IRQF_EARLY_RESUME | IRQF_NO_THREAD, KBUILD_MODNAME, gpio_dev);
>  	if (ret)
>  		goto out2;
>  
> -- 
> 2.20.1
> 
> 
> 

-- 
With Best Regards,
Andy Shevchenko



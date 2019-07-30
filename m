Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84947B205
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 20:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbfG3Scz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 14:32:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:50992 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387563AbfG3Scw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 14:32:52 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 11:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; 
   d="scan'208";a="176911387"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga006.jf.intel.com with ESMTP; 30 Jul 2019 11:32:49 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hsWvX-0007II-UA; Tue, 30 Jul 2019 21:32:47 +0300
Date:   Tue, 30 Jul 2019 21:32:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v6 34/57] pinctrl: intel: Remove dev_err() usage after
 platform_get_irq()
Message-ID: <20190730183247.GI23480@smile.fi.intel.com>
References: <20190730181557.90391-1-swboyd@chromium.org>
 <20190730181557.90391-35-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730181557.90391-35-swboyd@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 11:15:34AM -0700, Stephen Boyd wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
> 
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
> 
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
> 
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
> 
> While we're here, remove braces on if statements that only have one
> statement (manually).

Also, per file, but I will do it myself when applying, thanks!

> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Please apply directly to subsystem trees
> 
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 4 +---
>  drivers/pinctrl/intel/pinctrl-intel.c      | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 03ec7a5d9d0b..cd4a69b4c5a8 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1703,10 +1703,8 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
>  		return PTR_ERR(pctrl->regs);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "failed to get interrupt number\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	pctrl->pctldesc = chv_pinctrl_desc;
>  	pctrl->pctldesc.name = dev_name(&pdev->dev);
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index a18d6eefe672..0487e8dc7654 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1354,10 +1354,8 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  	}
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "failed to get interrupt number\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	ret = intel_pinctrl_pm_init(pctrl);
>  	if (ret)
> -- 
> Sent by a computer through tubes
> 

-- 
With Best Regards,
Andy Shevchenko



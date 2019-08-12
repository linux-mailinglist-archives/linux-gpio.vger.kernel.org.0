Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7A28A53F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 20:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfHLSDm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 14:03:42 -0400
Received: from mga11.intel.com ([192.55.52.93]:50215 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbfHLSDl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 14:03:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 10:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; 
   d="scan'208";a="375329917"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 12 Aug 2019 10:52:16 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxEUQ-0001WK-Fq; Mon, 12 Aug 2019 20:52:14 +0300
Date:   Mon, 12 Aug 2019 20:52:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] pinctrl: intel: baytrail: Pass irqchip when adding
 gpiochip
Message-ID: <20190812175214.GR30120@smile.fi.intel.com>
References: <20190812141446.1090-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812141446.1090-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 04:14:46PM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.

Pushed to my review and testing queue, thanks!

> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Andy: when you're happy with this you can either supply an
> ACK and I will merge it or you can merge it into your tree
> for a later pull request, just tell me what you prefer.
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 38 ++++++++++++++----------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index e5a112a8e067..57faddca3710 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1533,6 +1533,28 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>  	if (!vg->saved_context)
>  		return -ENOMEM;
>  #endif
> +
> +	/* set up interrupts  */
> +	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
> +	if (irq_rc && irq_rc->start) {
> +		struct gpio_irq_chip *girq;
> +
> +		byt_gpio_irq_init_hw(vg);
> +
> +		girq = &gc->irq;
> +		girq->chip = &byt_irqchip;
> +		girq->parent_handler = byt_gpio_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		girq->parents[0] = (unsigned int)irq_rc->start;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_bad_irq;
> +	}
> +
>  	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
>  	if (ret) {
>  		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
> @@ -1546,22 +1568,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>  		return ret;
>  	}
>  
> -	/* set up interrupts  */
> -	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
> -	if (irq_rc && irq_rc->start) {
> -		byt_gpio_irq_init_hw(vg);
> -		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
> -					   handle_bad_irq, IRQ_TYPE_NONE);
> -		if (ret) {
> -			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
> -			return ret;
> -		}
> -
> -		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
> -					     (unsigned)irq_rc->start,
> -					     byt_gpio_irq_handler);
> -	}
> -
>  	return ret;
>  }
>  
> -- 
> 2.21.0
> 

-- 
With Best Regards,
Andy Shevchenko



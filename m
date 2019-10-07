Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4194BCDCDC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 10:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfJGIIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 04:08:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:10704 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbfJGIIv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Oct 2019 04:08:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 01:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,265,1566889200"; 
   d="scan'208";a="192220136"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 07 Oct 2019 01:08:49 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iHO4W-0004yz-Eo; Mon, 07 Oct 2019 11:08:48 +0300
Date:   Mon, 7 Oct 2019 11:08:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2] pinctrl: intel: baytrail: Pass irqchip when adding
 gpiochip
Message-ID: <20191007080848.GI32742@smile.fi.intel.com>
References: <20191005204747.8952-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005204747.8952-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 05, 2019 at 10:47:47PM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rebase on v5.4-rc1

I would like to push it to my tree, I need to understand if the for-next is
the okay target for it.

> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 38 ++++++++++++++----------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 9ffb22211d2b..64a59fc08b63 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1528,6 +1528,28 @@ static int byt_gpio_probe(struct byt_gpio *vg)
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

For consistency I would use this below.
I will update when applying.

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
> @@ -1541,22 +1563,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
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



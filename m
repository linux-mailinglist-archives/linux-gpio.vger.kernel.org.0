Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C3DCDCE5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 10:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfJGILW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 04:11:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:10900 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbfJGILW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Oct 2019 04:11:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 01:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,265,1566889200"; 
   d="scan'208";a="193028913"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2019 01:11:20 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iHO6x-00050s-Lo; Mon, 07 Oct 2019 11:11:19 +0300
Date:   Mon, 7 Oct 2019 11:11:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Pass irqchip when adding gpiochip
Message-ID: <20191007081119.GJ32742@smile.fi.intel.com>
References: <20191006005949.30849-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006005949.30849-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 06, 2019 at 02:59:49AM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> This is an unchained irqchip so we use the method from
> drivers/gpio/gpio-mt7621.c that also requests its interrupt
> instead if chaining the interrupt handler.

One comment below, after addressing,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is based on Andy's patch to dynamically allocate the
> irqchio. Mika maybe you want to queue it with the rest of
> the stuff so you can sync fixes and new development?

My Rb tag Mika may use for fixes stuff in this cycle.

> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 52 ++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index bc013599a9a3..d63566e57f4c 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1206,6 +1206,37 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  	pctrl->irqchip.irq_set_wake = intel_gpio_irq_wake;
>  	pctrl->irqchip.flags = IRQCHIP_MASK_ON_SUSPEND;
>  
> +	/*
> +	 * We need to request the interrupt here (instead of using a
> +	 * chained handler) because on some platforms several GPIO
> +	 * controllers share the same interrupt line.
> +	 */
> +	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
> +			       IRQF_SHARED | IRQF_NO_THREAD,
> +			       dev_name(pctrl->dev), pctrl);

> +	if (!ret) {

Why not positive condition?

> +		struct gpio_irq_chip *girq;
> +
> +		girq = &pctrl->chip.irq;
> +		girq->chip = &pctrl->irqchip;
> +		/*
> +		 * This is an unchained interrupt. Compare to
> +		 * drivers/gpio/gpio-mt7621.c that also does this:
> +		 * assign no parents.
> +		 *
> +		 * FIXME: make the gpiolib flag this and handle unchained
> +		 * GPIO interrupts better if need be.
> +		 */
> +		girq->parent_handler = NULL;
> +		girq->num_parents = 0;
> +		girq->parents = NULL;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_bad_irq;
> +	} else {
> +		/* Skip irqchip, register gpiochip anyway */
> +		dev_err(pctrl->dev, "failed to request interrupt\n");
> +	}
> +
>  	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
>  	if (ret) {
>  		dev_err(pctrl->dev, "failed to register gpiochip\n");
> @@ -1222,27 +1253,6 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  		}
>  	}
>  
> -	/*
> -	 * We need to request the interrupt here (instead of providing chip
> -	 * to the irq directly) because on some platforms several GPIO
> -	 * controllers share the same interrupt line.
> -	 */
> -	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
> -			       IRQF_SHARED | IRQF_NO_THREAD,
> -			       dev_name(pctrl->dev), pctrl);
> -	if (ret) {
> -		dev_err(pctrl->dev, "failed to request interrupt\n");
> -		return ret;
> -	}
> -
> -	ret = gpiochip_irqchip_add(&pctrl->chip, &pctrl->irqchip, 0,
> -				   handle_bad_irq, IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(pctrl->dev, "failed to add irqchip\n");
> -		return ret;
> -	}
> -
> -	gpiochip_set_chained_irqchip(&pctrl->chip, &pctrl->irqchip, irq, NULL);
>  	return 0;
>  }
>  
> -- 
> 2.21.0
> 

-- 
With Best Regards,
Andy Shevchenko



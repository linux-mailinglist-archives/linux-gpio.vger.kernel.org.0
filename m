Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89879F17CD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfKFOAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:00:11 -0500
Received: from mga06.intel.com ([134.134.136.31]:43039 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbfKFOAL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:00:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="212778378"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 06 Nov 2019 06:00:07 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 06 Nov 2019 16:00:06 +0200
Date:   Wed, 6 Nov 2019 16:00:06 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 7/7] pinctrl: baytrail: Pass irqchip when adding
 gpiochip
Message-ID: <20191106140006.GU2552@lahna.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191105203557.78562-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105203557.78562-8-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:35:57PM +0200, Andy Shevchenko wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward conversion.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 43 ++++++++++++++----------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index b4d0e945e8c2..1234fe5f2a27 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1450,9 +1450,9 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>  	 */
>  }
>  
> -static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
> +static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
>  {
> -	struct gpio_chip *gc = &vg->chip;
> +	struct byt_gpio *vg = gpiochip_get_data(chip);
>  	struct device *dev = &vg->pdev->dev;
>  	void __iomem *reg;
>  	u32 base, value;
> @@ -1476,7 +1476,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  
>  		value = readl(reg);
>  		if (value & BYT_DIRECT_IRQ_EN) {
> -			clear_bit(i, gc->irq.valid_mask);
> +			clear_bit(i, chip->irq.valid_mask);
>  			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
>  		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
>  			byt_gpio_clear_triggering(vg, i);
> @@ -1504,6 +1504,8 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  				"GPIO interrupt error, pins misconfigured. INT_STAT%u: 0x%08x\n",
>  				base / 32, value);
>  	}
> +
> +	return 0;
>  }
>  
>  static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
> @@ -1542,26 +1544,31 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>  	if (!vg->saved_context)
>  		return -ENOMEM;
>  #endif
> -	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
> -	if (ret) {
> -		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
> -		return ret;
> -	}
>  
>  	/* set up interrupts  */
>  	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
>  	if (irq_rc && irq_rc->start) {
> -		byt_gpio_irq_init_hw(vg);
> -		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
> -					   handle_bad_irq, IRQ_TYPE_NONE);
> -		if (ret) {
> -			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
> -			return ret;
> -		}
> +		struct gpio_irq_chip *girq;
> +
> +		girq = &gc->irq;
> +		girq->chip = &byt_irqchip;
> +		girq->init_hw = byt_gpio_irq_init_hw;
> +		girq->parent_handler = byt_gpio_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);

Here also

		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
					     sizeof(*girq->parents), GFP_KERNEL);


Regardless of that,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

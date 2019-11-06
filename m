Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70863F17B9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 14:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfKFN4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 08:56:23 -0500
Received: from mga04.intel.com ([192.55.52.120]:59426 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727324AbfKFN4W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 08:56:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 05:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; 
   d="scan'208";a="212777577"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 06 Nov 2019 05:56:19 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 06 Nov 2019 15:56:19 +0200
Date:   Wed, 6 Nov 2019 15:56:18 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 5/7] gpio: merrifield: Pass irqchip when adding
 gpiochip
Message-ID: <20191106135618.GS2552@lahna.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191105203557.78562-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105203557.78562-6-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:35:55PM +0200, Andy Shevchenko wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward conversion.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Tiny nit below.

> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-merrifield.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index e96d8e517e26..60d6ad012881 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -362,8 +362,9 @@ static void mrfld_irq_handler(struct irq_desc *desc)
>  	chained_irq_exit(irqchip, desc);
>  }
>  
> -static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
> +static int mrfld_irq_init_hw(struct gpio_chip *chip)
>  {
> +	struct mrfld_gpio *priv = gpiochip_get_data(chip);
>  	void __iomem *reg;
>  	unsigned int base;
>  
> @@ -375,6 +376,8 @@ static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
>  		reg = gpio_reg(&priv->chip, base, GFER);
>  		writel(0, reg);
>  	}
> +
> +	return 0;
>  }
>  
>  static const char *mrfld_gpio_get_pinctrl_dev_name(struct mrfld_gpio *priv)
> @@ -420,6 +423,7 @@ static int mrfld_gpio_add_pin_ranges(struct gpio_chip *chip)
>  
>  static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
> +	struct gpio_irq_chip *girq;
>  	struct mrfld_gpio *priv;
>  	u32 gpio_base, irq_base;
>  	void __iomem *base;
> @@ -467,24 +471,27 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>  
>  	raw_spin_lock_init(&priv->lock);
>  
> +	girq = &priv->chip.irq;
> +	girq->chip = &mrfld_irqchip;
> +	girq->init_hw = mrfld_irq_init_hw;
> +	girq->parent_handler = mrfld_irq_handler;
> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
> +				     sizeof(*girq->parents),
> +				     GFP_KERNEL);

Maybe write it using only two lines:

	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
				     sizeof(*girq->parents), GFP_KERNEL);


> +	if (!girq->parents)
> +		return -ENOMEM;
> +	girq->parents[0] = pdev->irq;
> +	girq->first = irq_base;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_bad_irq;
> +
>  	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
>  	if (retval) {
>  		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
>  		return retval;
>  	}
>  
> -	retval = gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip, irq_base,
> -				      handle_bad_irq, IRQ_TYPE_NONE);
> -	if (retval) {
> -		dev_err(&pdev->dev, "could not connect irqchip to gpiochip\n");
> -		return retval;
> -	}
> -
> -	mrfld_irq_init_hw(priv);
> -
> -	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip, pdev->irq,
> -				     mrfld_irq_handler);
> -
>  	pci_set_drvdata(pdev, priv);
>  	return 0;
>  }
> -- 
> 2.24.0.rc1

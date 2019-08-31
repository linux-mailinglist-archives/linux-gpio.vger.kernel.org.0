Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEF9A45CD
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2019 20:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbfHaSmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Aug 2019 14:42:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52172 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbfHaSma (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Aug 2019 14:42:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id k1so10590416wmi.1
        for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2019 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGFsEtz89hN3lBusWaGo4CbccBce3LLWPMtzDE4Rg5c=;
        b=gqR5KLEDVU9AXi7mZgfvnxH3E+DAHnjAMM3k+E5Slibrrbi89y3UCVnIicANzQk+eX
         bWMyJ3XHo0aa6CN+QQLqumbcX3wcC6b3D+mqu71QgzOpRcwDKx4zFt1gmsdAK1PGwO9g
         ijOwoWmdTqFO9cwzRCfl1logJ/uF8qL+Xhbuh6OjGOkYf3mlVenXNZwjXDxdJ8k0jh4L
         xNLWpQ64jI+swdxtzUXnEL1twPD3bZjRBR9TkJzGYLUTk6csf4/VrX0HcVm6PkQ8HKOl
         NBMC0irvUQ8SfPRug0GO/MRCyNz6CVdwzBqysCea/eVVhS9HJJzHkQXwpfRRJuqGmemJ
         hV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGFsEtz89hN3lBusWaGo4CbccBce3LLWPMtzDE4Rg5c=;
        b=m+qnlRGorvLChTY0t/ipIrL3xQQKaL/CkX4eBVCrzL3tWrZs+2cxK8Y/1FmAiMuvSO
         gSNotTMGqkNhFPyIDky1cK8xXX4SnlDvRZIlEZ4jzcdblCP7y9mE7ifx6kpU8pCdz/+b
         7+RYrGP/R9H6ovz6UVpZu/IDOtTZ25w2+kETw9nq5INuGS472f3riHvawc0+j9ZEmgpg
         BUR5RE5UJDqduswqx6bFaMKSg0v/Fe0Br2A/6Lx03zHYXvZlPMJ3I3EIe2Yx1DepZydn
         mUOh/YkPEfNr6pEWjWYrJAlbVMyHCxwf/gHmB953lwwrAA1YgBv9l0Ic+Fwpg3X2xR6w
         F35w==
X-Gm-Message-State: APjAAAW9ok79Surwpjuw0NvSFk3qB3W3YFnhHwpwFW0nS6YfGLlEFcTf
        Fnmo9ndxkumWUyv6tOO7vBk45ujA
X-Google-Smtp-Source: APXvYqwY31HVzsGTOERWRCxxWHPmm4fGGUNqOSGw6gYbslWq04+X17FGv0b9Hx2xDH6Y76wR/kEdrQ==
X-Received: by 2002:a05:600c:305:: with SMTP id q5mr11562313wmd.141.1567276947773;
        Sat, 31 Aug 2019 11:42:27 -0700 (PDT)
Received: from giga-mm ([195.245.49.151])
        by smtp.gmail.com with ESMTPSA id w5sm7111190wmm.43.2019.08.31.11.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2019 11:42:27 -0700 (PDT)
Date:   Sat, 31 Aug 2019 20:42:25 +0200
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: ep93xx: Pass irqchip when adding gpiochip
Message-Id: <20190831204225.2caf59076ea2d83fe893e51c@gmail.com>
In-Reply-To: <20190812130000.22252-1-linus.walleij@linaro.org>
References: <20190812130000.22252-1-linus.walleij@linaro.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, 12 Aug 2019 15:00:00 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Thierry Reding <treding@nvidia.com>

The only new thing I see with this patch is this one:
gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.

But as we already had this one before the patch:
gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.

Seems, both of them could be fixed in another patch.
I unfortunately don't have a use-case for IRQs, but
at least GPIOs continue to work as before.

Other than above, looks good to me,
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-ep93xx.c | 140 +++++++++++++++++++------------------
>  1 file changed, 73 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index a90870a60c15..226da8df6f10 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -269,56 +269,6 @@ static struct irq_chip ep93xx_gpio_irq_chip = {
>  	.irq_set_type	= ep93xx_gpio_irq_type,
>  };
>  
> -static int ep93xx_gpio_init_irq(struct platform_device *pdev,
> -				struct ep93xx_gpio *epg)
> -{
> -	int ab_parent_irq = platform_get_irq(pdev, 0);
> -	struct device *dev = &pdev->dev;
> -	int gpio_irq;
> -	int ret;
> -	int i;
> -
> -	/* The A bank */
> -	ret = gpiochip_irqchip_add(&epg->gc[0], &ep93xx_gpio_irq_chip,
> -                                   64, handle_level_irq,
> -                                   IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(dev, "Could not add irqchip 0\n");
> -		return ret;
> -	}
> -	gpiochip_set_chained_irqchip(&epg->gc[0], &ep93xx_gpio_irq_chip,
> -				     ab_parent_irq,
> -				     ep93xx_gpio_ab_irq_handler);
> -
> -	/* The B bank */
> -	ret = gpiochip_irqchip_add(&epg->gc[1], &ep93xx_gpio_irq_chip,
> -                                   72, handle_level_irq,
> -                                   IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(dev, "Could not add irqchip 1\n");
> -		return ret;
> -	}
> -	gpiochip_set_chained_irqchip(&epg->gc[1], &ep93xx_gpio_irq_chip,
> -				     ab_parent_irq,
> -				     ep93xx_gpio_ab_irq_handler);
> -
> -	/* The F bank */
> -	for (i = 0; i < 8; i++) {
> -		gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
> -		irq_set_chip_data(gpio_irq, &epg->gc[5]);
> -		irq_set_chip_and_handler(gpio_irq, &ep93xx_gpio_irq_chip,
> -					 handle_level_irq);
> -		irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
> -	}
> -
> -	for (i = 1; i <= 8; i++)
> -		irq_set_chained_handler_and_data(platform_get_irq(pdev, i),
> -						 ep93xx_gpio_f_irq_handler,
> -						 &epg->gc[i]);
> -	return 0;
> -}
> -
> -
>  /*************************************************************************
>   * gpiolib interface for EP93xx on-chip GPIOs
>   *************************************************************************/
> @@ -328,26 +278,33 @@ struct ep93xx_gpio_bank {
>  	int		dir;
>  	int		base;
>  	bool		has_irq;
> +	bool		has_hierarchical_irq;
> +	unsigned int	irq_base;
>  };
>  
> -#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq)	\
> +#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq, _has_hier, _irq_base) \
>  	{							\
>  		.label		= _label,			\
>  		.data		= _data,			\
>  		.dir		= _dir,				\
>  		.base		= _base,			\
>  		.has_irq	= _has_irq,			\
> +		.has_hierarchical_irq = _has_hier,		\
> +		.irq_base	= _irq_base,			\
>  	}
>  
>  static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
> -	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true), /* Bank A has 8 IRQs */
> -	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true), /* Bank B has 8 IRQs */
> -	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false),
> -	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false),
> -	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false),
> -	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, true), /* Bank F has 8 IRQs */
> -	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false),
> -	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false),
> +	/* Bank A has 8 IRQs */
> +	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
> +	/* Bank B has 8 IRQs */
> +	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
> +	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
> +	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
> +	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
> +	/* Bank F has 8 IRQs */
> +	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
> +	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
> +	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
>  };
>  
>  static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
> @@ -369,12 +326,15 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
>  	return EP93XX_GPIO_F_IRQ_BASE + offset;
>  }
>  
> -static int ep93xx_gpio_add_bank(struct gpio_chip *gc, struct device *dev,
> +static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
> +				struct platform_device *pdev,
>  				struct ep93xx_gpio *epg,
>  				struct ep93xx_gpio_bank *bank)
>  {
>  	void __iomem *data = epg->base + bank->data;
>  	void __iomem *dir = epg->base + bank->dir;
> +	struct device *dev = &pdev->dev;
> +	struct gpio_irq_chip *girq;
>  	int err;
>  
>  	err = bgpio_init(gc, dev, 1, data, NULL, NULL, dir, NULL, 0);
> @@ -384,8 +344,59 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc, struct device *dev,
>  	gc->label = bank->label;
>  	gc->base = bank->base;
>  
> -	if (bank->has_irq)
> +	girq = &gc->irq;
> +	if (bank->has_irq || bank->has_hierarchical_irq) {
>  		gc->set_config = ep93xx_gpio_set_config;
> +		girq->chip = &ep93xx_gpio_irq_chip;
> +	}
> +
> +	if (bank->has_irq) {
> +		int ab_parent_irq = platform_get_irq(pdev, 0);
> +
> +		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_level_irq;
> +		girq->parents[0] = ab_parent_irq;
> +		girq->first = bank->irq_base;
> +	}
> +
> +	/* Only bank F has especially funky IRQ handling */
> +	if (bank->has_hierarchical_irq) {
> +		int gpio_irq;
> +		int i;
> +
> +		/*
> +		 * FIXME: convert this to use hierarchical IRQ support!
> +		 * this requires fixing the root irqchip to be hierarchial.
> +		 */
> +		girq->parent_handler = ep93xx_gpio_f_irq_handler;
> +		girq->num_parents = 8;
> +		girq->parents = devm_kcalloc(dev, 8,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		/* Pick resources 1..8 for these IRQs */
> +		for (i = 1; i <= 8; i++)
> +			girq->parents[i - 1] = platform_get_irq(pdev, i);
> +		for (i = 0; i < 8; i++) {
> +			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
> +			irq_set_chip_data(gpio_irq, &epg->gc[5]);
> +			irq_set_chip_and_handler(gpio_irq,
> +						 &ep93xx_gpio_irq_chip,
> +						 handle_level_irq);
> +			irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
> +		}
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_level_irq;
> +		gc->to_irq = ep93xx_gpio_f_to_irq;
> +	}
>  
>  	return devm_gpiochip_add_data(dev, gc, epg);
>  }
> @@ -407,16 +418,11 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
>  		struct gpio_chip *gc = &epg->gc[i];
>  		struct ep93xx_gpio_bank *bank = &ep93xx_gpio_banks[i];
>  
> -		if (ep93xx_gpio_add_bank(gc, &pdev->dev, epg, bank))
> +		if (ep93xx_gpio_add_bank(gc, pdev, epg, bank))
>  			dev_warn(&pdev->dev, "Unable to add gpio bank %s\n",
>  				 bank->label);
> -		/* Only bank F has especially funky IRQ handling */
> -		if (i == 5)
> -			gc->to_irq = ep93xx_gpio_f_to_irq;
>  	}
>  
> -	ep93xx_gpio_init_irq(pdev, epg);
> -
>  	return 0;
>  }
>  
> -- 
> 2.21.0
> 

-- 
Alexander Sverdlin.

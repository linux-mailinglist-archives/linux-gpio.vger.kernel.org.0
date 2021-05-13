Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75E637FF75
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 22:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbhEMUuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 May 2021 16:50:16 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33068 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233149AbhEMUuQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 May 2021 16:50:16 -0400
Received: from p5b127fd3.dip0.t-ipconnect.de ([91.18.127.211] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lhIGR-0006yX-OO; Thu, 13 May 2021 22:48:59 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 6/7] gpio/rockchip: always enable clock for gpio controller
Date:   Thu, 13 May 2021 22:48:58 +0200
Message-ID: <7622756.lOV4Wx5bFT@phil>
In-Reply-To: <20210510063722.506009-1-jay.xu@rock-chips.com>
References: <20210510063602.505829-1-jay.xu@rock-chips.com> <20210510063722.506009-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 10. Mai 2021, 08:37:22 CEST schrieb Jianqun Xu:
> Since gate and ungate pclk of gpio has very litte benifit for system
> power consumption, just keep it always ungate.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I do agree with the reasoning and as an added benefit, we
also drop all the clk_enable calls that don't do proper error
handling right now ;-)


> ---
>  drivers/gpio/gpio-rockchip.c | 68 +++++-------------------------------
>  1 file changed, 9 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 92aaf1848449..048e7eecddba 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -139,17 +139,8 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip,
>  {
>  	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
>  	u32 data;
> -	int ret;
>  
> -	ret = clk_enable(bank->clk);
> -	if (ret < 0) {
> -		dev_err(bank->drvdata->dev,
> -			"failed to enable clock for bank %s\n", bank->name);
> -		return ret;
> -	}
>  	data = rockchip_gpio_readl_bit(bank, offset, bank->gpio_regs->port_ddr);
> -	clk_disable(bank->clk);
> -
>  	if (data & BIT(offset))
>  		return GPIO_LINE_DIRECTION_OUT;
>  
> @@ -163,11 +154,9 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
>  	unsigned long flags;
>  	u32 data = input ? 0 : 1;
>  
> -	clk_enable(bank->clk);
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> -	clk_disable(bank->clk);
>  
>  	return 0;
>  }
> @@ -178,11 +167,9 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
>  	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
>  	unsigned long flags;
>  
> -	clk_enable(bank->clk);
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> -	clk_disable(bank->clk);
>  }
>  
>  static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
> @@ -190,11 +177,10 @@ static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
>  	u32 data;
>  
> -	clk_enable(bank->clk);
>  	data = readl(bank->reg_base + bank->gpio_regs->ext_port);
> -	clk_disable(bank->clk);
>  	data >>= offset;
>  	data &= 1;
> +
>  	return data;
>  }
>  
> @@ -315,9 +301,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
>  	if (!bank->domain)
>  		return -ENXIO;
>  
> -	clk_enable(bank->clk);
>  	virq = irq_create_mapping(bank->domain, offset);
> -	clk_disable(bank->clk);
>  
>  	return (virq) ? : -ENXIO;
>  }
> @@ -409,7 +393,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
>  	unsigned long flags;
>  	int ret = 0;
>  
> -	clk_enable(bank->clk);
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  
>  	rockchip_gpio_writel_bit(bank, d->hwirq, 0,
> @@ -480,7 +463,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
>  out:
>  	irq_gc_unlock(gc);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> -	clk_disable(bank->clk);
>  
>  	return ret;
>  }
> @@ -490,10 +472,8 @@ static void rockchip_irq_suspend(struct irq_data *d)
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank = gc->private;
>  
> -	clk_enable(bank->clk);
>  	bank->saved_masks = irq_reg_readl(gc, bank->gpio_regs->int_mask);
>  	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
> -	clk_disable(bank->clk);
>  }
>  
>  static void rockchip_irq_resume(struct irq_data *d)
> @@ -501,27 +481,7 @@ static void rockchip_irq_resume(struct irq_data *d)
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank = gc->private;
>  
> -	clk_enable(bank->clk);
>  	irq_reg_writel(gc, bank->saved_masks, bank->gpio_regs->int_mask);
> -	clk_disable(bank->clk);
> -}
> -
> -static void rockchip_irq_enable(struct irq_data *d)
> -{
> -	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> -	struct rockchip_pin_bank *bank = gc->private;
> -
> -	clk_enable(bank->clk);
> -	irq_gc_mask_clr_bit(d);
> -}
> -
> -static void rockchip_irq_disable(struct irq_data *d)
> -{
> -	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> -	struct rockchip_pin_bank *bank = gc->private;
> -
> -	irq_gc_mask_set_bit(d);
> -	clk_disable(bank->clk);
>  }
>  
>  static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
> @@ -530,19 +490,11 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
>  	struct irq_chip_generic *gc;
>  	int ret;
>  
> -	ret = clk_enable(bank->clk);
> -	if (ret) {
> -		dev_err(bank->dev, "failed to enable clock for bank %s\n",
> -			bank->name);
> -		return -EINVAL;
> -	}
> -
>  	bank->domain = irq_domain_add_linear(bank->of_node, 32,
>  					&irq_generic_chip_ops, NULL);
>  	if (!bank->domain) {
>  		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
>  			 bank->name);
> -		clk_disable(bank->clk);
>  		return -EINVAL;
>  	}
>  
> @@ -554,7 +506,6 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
>  		dev_err(bank->dev, "could not alloc generic chips for bank %s\n",
>  			bank->name);
>  		irq_domain_remove(bank->domain);
> -		clk_disable(bank->clk);
>  		return -EINVAL;
>  	}
>  
> @@ -571,8 +522,8 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
>  	gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
>  	gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
>  	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
> -	gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
> -	gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
> +	gc->chip_types[0].chip.irq_enable = irq_gc_mask_clr_bit;
> +	gc->chip_types[0].chip.irq_disable = irq_gc_mask_set_bit;
>  	gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
>  	gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
>  	gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
> @@ -591,7 +542,6 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
>  
>  	irq_set_chained_handler_and_data(bank->irq,
>  					 rockchip_irq_demux, bank);
> -	clk_disable(bank->clk);
>  
>  	return 0;
>  }
> @@ -695,7 +645,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  		if (IS_ERR(bank->db_clk)) {
>  			dev_err(bank->dev, "cannot find debounce clk\n");
>  			bank->db_clk = NULL;
> -			clk_disable(bank->clk);
>  			return -EINVAL;
>  		}
>  	} else {
> @@ -703,7 +652,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  		bank->gpio_type = GPIO_TYPE_V1;
>  	}
>  
> -	clk_disable(bank->clk);
>  	return 0;
>  }
>  
> @@ -756,15 +704,17 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	ret = rockchip_gpiolib_register(bank);
> -	if (ret) {
> -		clk_disable_unprepare(bank->clk);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_clk;
>  
>  	platform_set_drvdata(pdev, bank);
>  	dev_info(dev, "probed %pOF\n", np);
>  
>  	return 0;
> +err_clk:
> +	clk_disable_unprepare(bank->clk);
> +
> +	return ret;
>  }
>  
>  static int rockchip_gpio_remove(struct platform_device *pdev)
> 





Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 703EAD4599
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 18:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfJKQjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 12:39:47 -0400
Received: from mailfilter02-out31.webhostingserver.nl ([141.138.168.75]:31964
        "EHLO mailfilter02-out31.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727125AbfJKQjq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Oct 2019 12:39:46 -0400
X-Halon-ID: 7ce266c9-ec43-11e9-9fd3-001a4a4cb922
Received: from s198.webhostingserver.nl (unknown [195.211.72.171])
        by mailfilter02.webhostingserver.nl (Halon) with ESMTPSA
        id 7ce266c9-ec43-11e9-9fd3-001a4a4cb922;
        Fri, 11 Oct 2019 18:23:41 +0200 (CEST)
Received: from cust-178-250-146-69.breedbanddelft.nl ([178.250.146.69] helo=[10.8.0.10])
        by s198.webhostingserver.nl with esmtpa (Exim 4.92.3)
        (envelope-from <fntoth@gmail.com>)
        id 1iIxhd-003Gdd-7Y; Fri, 11 Oct 2019 18:23:41 +0200
Subject: Re: [PATCH 5/5] gpio: merrifield: Move hardware initialization to
 callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <20191009165056.76580-6-andriy.shevchenko@linux.intel.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <d8e63299-55f2-6704-cb04-b49e232b5db6@gmail.com>
Date:   Fri, 11 Oct 2019 18:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009165056.76580-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SendingUser: hidden
X-SendingServer: hidden
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Authenticated-Id: hidden
X-SendingUser: hidden
X-SendingServer: hidden
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Op 09-10-19 om 18:50 schreef Andy Shevchenko:
> The driver wants to initialize related registers before IRQ chip will be added.
> That's why move it to a corresponding callback. It also fixes the NULL pointer
> dereference.
> 
> Fixes: 8f86a5b4ad67 ("gpio: merrifield: Pass irqchip when adding gpiochip")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Fixes boot when applied to 5.4-rc2

Tested-by: Ferry Toth <fntoth@gmail.com>
> ---
>   drivers/gpio/gpio-merrifield.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index 9596024c9161..2f1e9da81c1e 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -362,8 +362,9 @@ static void mrfld_irq_handler(struct irq_desc *desc)
>   	chained_irq_exit(irqchip, desc);
>   }
>   
> -static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
> +static int mrfld_irq_init_hw(struct gpio_chip *chip)
>   {
> +	struct mrfld_gpio *priv = gpiochip_get_data(chip);
>   	void __iomem *reg;
>   	unsigned int base;
>   
> @@ -375,6 +376,8 @@ static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
>   		reg = gpio_reg(&priv->chip, base, GFER);
>   		writel(0, reg);
>   	}
> +
> +	return 0;
>   }
>   
>   static const char *mrfld_gpio_get_pinctrl_dev_name(struct mrfld_gpio *priv)
> @@ -447,6 +450,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>   
>   	girq = &priv->chip.irq;
>   	girq->chip = &mrfld_irqchip;
> +	girq->init_hw = mrfld_irq_init_hw;
>   	girq->parent_handler = mrfld_irq_handler;
>   	girq->num_parents = 1;
>   	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
> @@ -459,8 +463,6 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>   	girq->default_type = IRQ_TYPE_NONE;
>   	girq->handler = handle_bad_irq;
>   
> -	mrfld_irq_init_hw(priv);
> -
>   	pci_set_drvdata(pdev, priv);
>   	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
>   	if (retval) {
> 


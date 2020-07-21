Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BA82286CC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 19:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbgGURJF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 13:09:05 -0400
Received: from mga09.intel.com ([134.134.136.24]:24103 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbgGURJD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 13:09:03 -0400
IronPort-SDR: hfLppdfePl0WA5I0n5Z43RqWxPovfCFhaOFua4KnThFfw5CjqG5gVJ8GlQa8QFPq732h9huPxM
 4TXv332aUqFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="151520760"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; 
   d="scan'208";a="151520760"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 10:08:57 -0700
IronPort-SDR: ONqxd9l8Ez5dPb7fMmUCSs6BTrKWOeWhIqnU/Si9eyaAsHUhJKQC2YRDnI2ukcnl5Io0AHW+L7
 zOUS5XUw4UJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; 
   d="scan'208";a="392415420"
Received: from ddperry-mobl.amr.corp.intel.com (HELO [10.254.78.60]) ([10.254.78.60])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2020 10:08:57 -0700
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
References: <20200721140153.369171-1-linus.walleij@linaro.org>
From:   "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <50c79c0d-3942-c248-fef0-27fa3592b89c@linux.intel.com>
Date:   Tue, 21 Jul 2020 10:08:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721140153.369171-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/21/20 7:01 AM, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
Looks good to me.
     Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>

> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->V2:
> - Fixed a variable name ch->cg
> ---
>   drivers/gpio/gpio-crystalcove.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
> index 14d1f4c933b6..39349b0e6923 100644
> --- a/drivers/gpio/gpio-crystalcove.c
> +++ b/drivers/gpio/gpio-crystalcove.c
> @@ -330,6 +330,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>   	int retval;
>   	struct device *dev = pdev->dev.parent;
>   	struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
> +	struct gpio_irq_chip *girq;
>   
>   	if (irq < 0)
>   		return irq;
> @@ -353,14 +354,15 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>   	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
>   	cg->regmap = pmic->regmap;
>   
> -	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> -	if (retval) {
> -		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> -		return retval;
> -	}
> -
> -	gpiochip_irqchip_add_nested(&cg->chip, &crystalcove_irqchip, 0,
> -				    handle_simple_irq, IRQ_TYPE_NONE);
> +	girq = &cg->chip.irq;
> +	girq->chip = &crystalcove_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_simple_irq;
> +	girq->threaded = true;
>   
>   	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
>   				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
> @@ -370,7 +372,11 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>   		return retval;
>   	}
>   
> -	gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
> +	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> +	if (retval) {
> +		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> +		return retval;
> +	}
>   
>   	return 0;
>   }
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

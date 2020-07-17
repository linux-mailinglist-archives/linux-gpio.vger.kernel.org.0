Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838C422453C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 22:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgGQUes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 16:34:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:2284 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726815AbgGQUes (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 16:34:48 -0400
IronPort-SDR: Kt4+wAiEMRx1YO7bwZxAXZSwJvbebmKcRra4AVlubP0taZY2SGpfeyNz0ROvkqLFVaN5gky2Rm
 d6GP3C2lYlPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="148838410"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; 
   d="scan'208";a="148838410"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 13:34:47 -0700
IronPort-SDR: TOlJj/GSlNIpHdg9hPLz31RH//0hydm7VXeiHGp1K2SlPiOvZ/wMLWQk24pYengqAZF0NdAYUm
 eGfk+ynMhNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; 
   d="scan'208";a="282897232"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2020 13:34:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jwX4A-002PgJ-Af; Fri, 17 Jul 2020 23:34:46 +0300
Date:   Fri, 17 Jul 2020 23:34:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
Message-ID: <20200717203446.GB3703480@smile.fi.intel.com>
References: <20200717144040.63253-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200717144040.63253-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 04:40:40PM +0200, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pca953x.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 9c90cf3aac5a..ab22152bf3e8 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -834,6 +834,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>  	struct irq_chip *irq_chip = &chip->irq_chip;
>  	DECLARE_BITMAP(reg_direction, MAX_LINE);
>  	DECLARE_BITMAP(irq_stat, MAX_LINE);
> +	struct gpio_irq_chip *girq;
>  	int ret;
>  
>  	if (dmi_first_match(pca953x_dmi_acpi_irq_info)) {
> @@ -883,16 +884,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>  	irq_chip->irq_set_type = pca953x_irq_set_type;
>  	irq_chip->irq_shutdown = pca953x_irq_shutdown;
>  
> -	ret = gpiochip_irqchip_add_nested(&chip->gpio_chip, irq_chip,
> -					  irq_base, handle_simple_irq,
> -					  IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(&client->dev,
> -			"could not connect irqchip to gpiochip\n");
> -		return ret;
> -	}
> -
> -	gpiochip_set_nested_irqchip(&chip->gpio_chip, irq_chip, client->irq);
> +	girq = &chip->gpio_chip.irq;
> +	girq->chip = irq_chip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_simple_irq;
> +	girq->threaded = true;
> +	girq->first = irq_base; /* FIXME: get rid of this */
>  
>  	return 0;
>  }
> @@ -1080,11 +1081,11 @@ static int pca953x_probe(struct i2c_client *client,
>  	if (ret)
>  		goto err_exit;
>  
> -	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
> +	ret = pca953x_irq_setup(chip, irq_base);
>  	if (ret)
>  		goto err_exit;
>  
> -	ret = pca953x_irq_setup(chip, irq_base);
> +	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
>  	if (ret)
>  		goto err_exit;
>  
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko



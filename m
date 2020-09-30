Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FC827E6F9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 12:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgI3Krk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 06:47:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43846 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3Krj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 06:47:39 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08UAlVaH099494;
        Wed, 30 Sep 2020 05:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601462851;
        bh=nwXBsOO9FdkbC8o8ZEzJTsMzypejnwytkAVkevCkuQw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=BYlSrXOZ6o3y7kHQRUhAkG0z8isO3NLjQPAtkgq//iKGSDnw+SyaAErZhz8yy7foa
         KFI+0KSywno/ytzEi+DOqBW5659+OaAFf6aGHaJnbDoChjwX7YxsIfpNynp+ZKkKr9
         EWzWa21X7yx4oAol1yK0LWjOvC05HeeOf6KQFbZI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08UAlVEg108217
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 05:47:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 05:47:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 05:47:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UAlTOr022401;
        Wed, 30 Sep 2020 05:47:30 -0500
Date:   Wed, 30 Sep 2020 16:17:29 +0530
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
Message-ID: <20200930104729.ajufkrklfhf25d55@NiksLab>
References: <20200717144040.63253-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200717144040.63253-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16:40-20200717, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hi,
I am getting a kernel crash on K3 j721e common processor board
when HDMI is plugged in. Following is the full log with crash
for NULL pointer derefence

https://pastebin.ubuntu.com/p/wBPS2ymmqR/

Upon inspection, I found that the "irq_find_mapping" call
in the "pca953x_irq_handler" returns 0 and the same is passed
to "handle_nested_irq"


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

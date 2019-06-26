Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3165658D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZJQf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:16:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56201 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZJQf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:16:35 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hg42b-0000go-JQ; Wed, 26 Jun 2019 11:16:33 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hg42b-000148-3s; Wed, 26 Jun 2019 11:16:33 +0200
Date:   Wed, 26 Jun 2019 11:16:33 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 3/5] gpio: siox: Pass irqchip when adding gpiochip
Message-ID: <20190626091633.dw4w7uaavi2bdkkm@pengutronix.de>
References: <20190626084407.27976-1-linus.walleij@linaro.org>
 <20190626084407.27976-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190626084407.27976-3-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 10:44:05AM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Split out bugfixes to separate patches.
> ---
>  drivers/gpio/gpio-siox.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 40067e1535d3..31749c058e33 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -211,6 +211,7 @@ static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
>  static int gpio_siox_probe(struct siox_device *sdevice)
>  {
>  	struct gpio_siox_ddata *ddata;
> +	struct gpio_irq_chip *girq;
>  	int ret;
>  
>  	ddata = devm_kzalloc(&sdevice->dev, sizeof(*ddata), GFP_KERNEL);
> @@ -239,6 +240,11 @@ static int gpio_siox_probe(struct siox_device *sdevice)
>  	ddata->ichip.irq_unmask = gpio_siox_irq_unmask;
>  	ddata->ichip.irq_set_type = gpio_siox_irq_set_type;
>  
> +	girq = &ddata->gchip.irq;
> +	girq->chip = &ddata->ichip;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_level_irq;
> +
>  	ret = gpiochip_add(&ddata->gchip);
>  	if (ret) {
>  		dev_err(&sdevice->dev,
> @@ -246,13 +252,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
>  		return ret;
>  	}
>  
> -	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
> -				   0, handle_level_irq, IRQ_TYPE_NONE);
> -	if (ret)
> -		dev_err(&sdevice->dev,
> -			"Failed to register irq chip (%d)\n", ret);
> -
> -	return ret;
> +	return 0;
>  }

You can simplify this a bit further from:

	if (ret) {
		...
		return ret;
	}
	return 0;

to

	if (ret) {
		...
	}
	return ret;

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

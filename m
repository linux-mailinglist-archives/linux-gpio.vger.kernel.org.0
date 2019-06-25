Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FE2557CF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 21:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfFYTdb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 15:33:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40479 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfFYTdb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 15:33:31 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hfrC5-0002K3-CH; Tue, 25 Jun 2019 21:33:29 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hfrC4-0004yS-2j; Tue, 25 Jun 2019 21:33:28 +0200
Date:   Tue, 25 Jun 2019 21:33:28 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>
Subject: Re: [PATCH] gpio: siox: Pass irqchip when adding gpiochip
Message-ID: <20190625193328.sxvhastsatc62msh@pengutronix.de>
References: <20190625105346.3267-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190625105346.3267-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On Tue, Jun 25, 2019 at 12:53:46PM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> The siox GPIO driver passes a IRQ_TYPE_EDGE_RISING as
> default IRQ trigger type which seems wrong, as consumers
> should explicitly set this up, so set IRQ_TYPE_NONE instead.
> 
> Also gpiochip_remove() was called on the errorpath if
> gpiochip_add() failed: this is wrong, if the chip failed
> to add it is not there so it should not be removed.

So we have a bugfix (gpiochip_remove() in error path), a change of
default behaviour (IRQ_TYPE_EDGE_RISING -> IRQ_TYPE_NONE) and a cleanup
for an API change (I'm guessing here) in a single patch. :-|

@Thorsten: I'm not entirely sure if there is code relying on the default
IRQ_TYPE_EDGE_RISING. Do you know off-hand?

Best regards
Uwe

> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index fb4e318ab028..e5c85dc932e8 100644
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
> @@ -239,20 +240,16 @@ static int gpio_siox_probe(struct siox_device *sdevice)
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
>  			"Failed to register gpio chip (%d)\n", ret);
> -		goto err_gpiochip;
> -	}
> -
> -	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
> -				   0, handle_level_irq, IRQ_TYPE_EDGE_RISING);
> -	if (ret) {
> -		dev_err(&sdevice->dev,
> -			"Failed to register irq chip (%d)\n", ret);
> -err_gpiochip:
> -		gpiochip_remove(&ddata->gchip);
> +		return ret;
>  	}
>  
>  	return ret;

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

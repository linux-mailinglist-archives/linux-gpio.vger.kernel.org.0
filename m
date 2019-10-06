Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0F1CCD63
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 02:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfJFALQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 20:11:16 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:38322 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfJFALQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 20:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1570320674; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZwyYTWl+byyhQf+rKbXIlXWzl5dDboJUgu9UTDN45dc=;
        b=YO8Vr5i7J1VX3E7HZbaDLQXl2BnlITFeRVXUasAVp2KCx3pW7UxTB9oP/X138y6f3dqdux
        T3iECNAx8rq55RMDFlXqybYXF8Q+1XGlmRbl//KXqyJZGnNV3RZXmH1IleKwxd4LMlLGOS
        yDepDzTgQGtgMp/Wl/3zc06NK5ZyC5Q=
Date:   Sun, 06 Oct 2019 02:11:09 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Thierry Reding <thierry.reding@gmail.com>
Message-Id: <1570320669.3.1@crapouillou.net>
In-Reply-To: <20191001133209.17164-1-linus.walleij@linaro.org>
References: <20191001133209.17164-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Le mar., oct. 1, 2019 at 15:32, Linus Walleij=20
<linus.walleij@linaro.org> a =E9crit :
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>=20
> For chained irqchips this is a pretty straight-forward
> conversion.
>=20
> Cc: Zhou Yanjie <zhouyanjie@zoho.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

> ---
>  drivers/pinctrl/pinctrl-ingenic.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 6e2683016c1f..06cae38f6daf 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -1940,6 +1940,7 @@ static int __init ingenic_gpio_probe(struct=20
> ingenic_pinctrl *jzpc,
>  {
>  	struct ingenic_gpio_chip *jzgc;
>  	struct device *dev =3D jzpc->dev;
> +	struct gpio_irq_chip *girq;
>  	unsigned int bank;
>  	int err;
>=20
> @@ -1982,10 +1983,6 @@ static int __init ingenic_gpio_probe(struct=20
> ingenic_pinctrl *jzpc,
>  		jzgc->gc.free =3D gpiochip_generic_free;
>  	}
>=20
> -	err =3D devm_gpiochip_add_data(dev, &jzgc->gc, jzgc);
> -	if (err)
> -		return err;
> -
>  	jzgc->irq =3D irq_of_parse_and_map(node, 0);
>  	if (!jzgc->irq)
>  		return -EINVAL;
> @@ -2000,13 +1997,22 @@ static int __init ingenic_gpio_probe(struct=20
> ingenic_pinctrl *jzpc,
>  	jzgc->irq_chip.irq_set_wake =3D ingenic_gpio_irq_set_wake;
>  	jzgc->irq_chip.flags =3D IRQCHIP_MASK_ON_SUSPEND;
>=20
> -	err =3D gpiochip_irqchip_add(&jzgc->gc, &jzgc->irq_chip, 0,
> -			handle_level_irq, IRQ_TYPE_NONE);
> +	girq =3D &jzgc->gc.irq;
> +	girq->chip =3D &jzgc->irq_chip;
> +	girq->parent_handler =3D ingenic_gpio_irq_handler;
> +	girq->num_parents =3D 1;
> +	girq->parents =3D devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +				     GFP_KERNEL);
> +	if (!girq->parents)
> +		return -ENOMEM;
> +	girq->parents[0] =3D jzgc->irq;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_level_irq;
> +
> +	err =3D devm_gpiochip_add_data(dev, &jzgc->gc, jzgc);
>  	if (err)
>  		return err;
>=20
> -	gpiochip_set_chained_irqchip(&jzgc->gc, &jzgc->irq_chip,
> -			jzgc->irq, ingenic_gpio_irq_handler);
>  	return 0;
>  }
>=20
> --
> 2.21.0
>=20

=


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EE6229E6F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 19:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgGVRYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 13:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgGVRYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 13:24:11 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73091C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:24:11 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id j187so2707244qke.11
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oLvlNKK7qiqDizqDJgZ400Fzp4Ak2mx5YYOQ0DKM9wE=;
        b=WtMU3/yWsleif+ouDQC2zccwkQowTITYpMyz3AIhoJi7DY51QQNCVwFktf2yVmLioi
         Y/AdKs17HLZUIqVoUmBrwE9na+7JfIgTvsAA31i8StVG/dFjgfuDRy2vqUqKWPQgXEQE
         ma1Dd0NJOy4aujZs1MQlBwlMFJK3P3RUGND145lO9b46jqWgcMInT4y8cgsc61UG82pw
         TlEyIUoWCegZAcDJQVGhUoHVrLxUQ3vsA2TuxVEML0L76YMHdl5/cDMo7sgD1nIQX5f2
         aSF2Bpsyg5xLHUOBtyPzrK3X01DADwYk4nv8PINMXnHVCJV7mCEIbAWrc3+n9DOgPe/D
         x9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oLvlNKK7qiqDizqDJgZ400Fzp4Ak2mx5YYOQ0DKM9wE=;
        b=KuLnSYEaoi0L7SBUa17L1MWzSpH/TV3Y8u9Xz2b4SaO1s5DfKlLwOdfH+dA9329Pya
         JOwMajrRQ8ER6ZTES2MjWR/urJvuxkkhSOsouAh//y7tqwvlssVu/g7oxDNLLwagEqI5
         nxEuvLnu7uiJYOkgLvc1Fvh1FySW8PPyjVN8jqrMIHhbEYfwkRjJ3Yd7nTNGCPg7ZgcZ
         SSEmvzIMWUGHe4IDTwc/26YB2Yx/sZrf+bZu44tCj/gKwvCqvymmDUm91bqajjEVUTZ7
         PSzxeZNzhGeroV7fFF/cyb6kpX3v33NRHbDR5Aakq6u5MXBLyY7eNFTRnHpoNV+t2YFW
         l8fg==
X-Gm-Message-State: AOAM531dgYhKLVmY93ORiKlauzfeRuRrMfyctkYa+ZTzgiEmKHhHNv1x
        d7RU8in2VRvWkXe8LkUi1ow=
X-Google-Smtp-Source: ABdhPJxK3OmAj3jfUdrQwINFUlzRsKrRuyguoO0EvLoEiBUbVHoiKGvS1bMvjQUARz12ZchYUG9H2A==
X-Received: by 2002:a05:620a:958:: with SMTP id w24mr1108609qkw.20.1595438650723;
        Wed, 22 Jul 2020 10:24:10 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id u6sm267094qtc.34.2020.07.22.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:24:09 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:24:07 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: 104-idio-16: Use irqchip template
Message-ID: <20200722172407.GD93793@shinobu>
References: <20200722105517.186137-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <20200722105517.186137-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:55:17PM +0200, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit call to gpiochip_irqchip_add().
>=20
> The irqchip is instead added while adding the gpiochip.
> Also move the IRQ initialization to the special .init_hw()
> callback.
>=20
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/gpio/gpio-104-idio-16.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio=
-16.c
> index 5752d9dab148..50ad0280fd78 100644
> --- a/drivers/gpio/gpio-104-idio-16.c
> +++ b/drivers/gpio/gpio-104-idio-16.c
> @@ -224,10 +224,22 @@ static const char *idio_16_names[IDIO_16_NGPIO] =3D=
 {
>  	"IIN8", "IIN9", "IIN10", "IIN11", "IIN12", "IIN13", "IIN14", "IIN15"
>  };
> =20
> +static int idio_16_irq_init_hw(struct gpio_chip *gc)
> +{
> +	struct idio_16_gpio *const idio16gpio =3D gpiochip_get_data(gc);
> +
> +	/* Disable IRQ by default */
> +	outb(0, idio16gpio->base + 2);
> +	outb(0, idio16gpio->base + 1);
> +
> +	return 0;
> +}
> +
>  static int idio_16_probe(struct device *dev, unsigned int id)
>  {
>  	struct idio_16_gpio *idio16gpio;
>  	const char *const name =3D dev_name(dev);
> +	struct gpio_irq_chip *girq;
>  	int err;
> =20
>  	idio16gpio =3D devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
> @@ -256,6 +268,16 @@ static int idio_16_probe(struct device *dev, unsigne=
d int id)
>  	idio16gpio->base =3D base[id];
>  	idio16gpio->out_state =3D 0xFFFF;
> =20
> +	girq =3D &idio16gpio->chip.irq;
> +	girq->chip =3D &idio_16_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_edge_irq;
> +	girq->init_hw =3D idio_16_irq_init_hw;
> +
>  	raw_spin_lock_init(&idio16gpio->lock);
> =20
>  	err =3D devm_gpiochip_add_data(dev, &idio16gpio->chip, idio16gpio);
> @@ -264,17 +286,6 @@ static int idio_16_probe(struct device *dev, unsigne=
d int id)
>  		return err;
>  	}
> =20
> -	/* Disable IRQ by default */
> -	outb(0, base[id] + 2);
> -	outb(0, base[id] + 1);
> -
> -	err =3D gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
> -		handle_edge_irq, IRQ_TYPE_NONE);
> -	if (err) {
> -		dev_err(dev, "Could not add irqchip (%d)\n", err);
> -		return err;
> -	}
> -
>  	err =3D devm_request_irq(dev, irq[id], idio_16_irq_handler, 0, name,
>  		idio16gpio);
>  	if (err) {
> --=20
> 2.26.2
>=20

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8YdjcACgkQhvpINdm7
VJKb1Q//XQP9uHpVHOub6qxIV2JrBDQYZGEhcPtvM/pFFAfb23tLk3vbz7fZdv4B
RepFMM0qUb1svU5suo3KarbB0p/+1yJVakth2axijIxbmcJAEWMPm6iJfY/MPKAz
beLN534V99cVDueAJUkKvtmcZpqz0MpSwEY2/Qu356Zp2vegvYdZ7NHhPo9YyZfS
I8WJ3JFWGy6navAe5b3axzPKHg6VOKidEMIbantUffXX+N9jh3VZK+BvbRnnTfFg
lRZZMzw1FVIPNudBI8z01bhF6pxeJNgdC3213aQlrKFqZQP3d4MakDpZp0S4ThSj
gwJrA3AEeGJ1lBwg1IHUgTjRZD41Dtj9Ql9px36cPt2CZxQduKPl6vN9voQk0ktd
rkr1jXXfP9ako/3dOV3gdfJnWHUNEMwJXjJ1O2GHbyMHDSvyAWZbpVFST8SX5SRD
9sxOguYXB1ATVhEapMvlie69bQtd8cNUj/TcnZ5jT5+A1H+Q8XjIh3dTZRXbind6
JCOXL6FNKFI9f1yke6Kzzjq7vqiL1o0Lm2nL0G1ie+GNFLHO8L/5YDOLcwLo55+y
145ma3YJ7LMzVUR4FGVc9QLvgfLV1xqinoAKcJNVgTGO7x+K2G/8zm+fzvukjy9T
TxPaeqSZPUCLq1k7SooUiedC3REdKG47uINMN5GKX5/UrP/9mTc=
=GyI9
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--

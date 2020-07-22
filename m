Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DEB229E69
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 19:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGVRWk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 13:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgGVRWj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 13:22:39 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BD9C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:22:39 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 11so2772155qkn.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CNRpaQ7BFVF8L0ySWpJ42EFSFrc/qGUfBQXX9pxWDQo=;
        b=bFXMtt5zI6461NG242jNw/xsgR7DfM2vEPfjIvLJOFexIBCqgyoHbArRO/BaEFFwWX
         D0YWxeJFRYM8xnT7ZUEY/m4JdPDt0EMc5ccIHSvIs4KM2eSlN9OpjvGbTd0gvjy8KAsh
         dVyulHdiVbzHskIrD8MnbGBEYu/b2I92CV0pyy3ezu3nGxkg9tVCByj/iPPcpMbaIW16
         TsBf2SOBWJpb1AMk1hWDSrNJMmVg/xDecGXFaeEAxpSE4ob1NSouY3Pzp/4ecpesGPft
         Q6Ej2pb6ikP4GpFuvnJQm8ked+P1/SdJ9bgbFLVjUqBYuqQHcMKOohCL8UvQcNif1sa2
         8Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CNRpaQ7BFVF8L0ySWpJ42EFSFrc/qGUfBQXX9pxWDQo=;
        b=FXN11T5s09Anopqh6q9jjCZgZgQDcla9VDMrm8dHH9oa0lY807TzBL6fg/qWZvmnwX
         lRLQWp9b2vVs15QiYKfN8iJgW++z5Gd8FvV1/6E2/Uft+mymCPL/WAa6SN3OhZXOnCRZ
         5QCuE3rNK0RV3Txlr8LcYcY4SqfGKkMKzyz/MYzJou7maLqG+qK3jh6dX1Ao05n7qPxd
         6JMRhsPBYp70kwa4BueuEYsr9fz1p2VKfQz55dpHA++JTPC3mmPVSzFIbdYP2Zvdjqbh
         COT6cUWkFjU/4bi7xo/XyYtWLKNC15KXE2bf7zpWuzbcR8LymhbVFc2W7sH4u0XY5Avo
         TWbw==
X-Gm-Message-State: AOAM5312CKTDwyZLKr2Ni9OgBTA9FjVGL3L53+cchOudKFpTAjKhTDKr
        6S+8Zf3ISa2dCNmwJgQvL7Y=
X-Google-Smtp-Source: ABdhPJxedV6w/VMreQcRXnhED0C5ep6IGBqCkRFU3yeFijSL/3aowq8gmrB/msPw5yXp6AJ7baFBqw==
X-Received: by 2002:a05:620a:1355:: with SMTP id c21mr1093383qkl.378.1595438559028;
        Wed, 22 Jul 2020 10:22:39 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id b22sm396498qka.43.2020.07.22.10.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:22:37 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:22:36 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: 104-dio-48e: Use irqchip template
Message-ID: <20200722172236.GB93793@shinobu>
References: <20200722103915.162156-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <20200722103915.162156-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:39:15PM +0200, Linus Walleij wrote:
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
>  drivers/gpio/gpio-104-dio-48e.c | 35 ++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-=
48e.c
> index 1f7d9bbec0fc..7a9021c4fa48 100644
> --- a/drivers/gpio/gpio-104-dio-48e.c
> +++ b/drivers/gpio/gpio-104-dio-48e.c
> @@ -368,10 +368,21 @@ static const char *dio48e_names[DIO48E_NGPIO] =3D {
>  	"PPI Group 1 Port C 5", "PPI Group 1 Port C 6", "PPI Group 1 Port C 7"
>  };
> =20
> +static int dio48e_irq_init_hw(struct gpio_chip *gc)
> +{
> +	struct dio48e_gpio *const dio48egpio =3D gpiochip_get_data(gc);
> +
> +	/* Disable IRQ by default */
> +	inb(dio48egpio->base + 0xB);
> +
> +	return 0;
> +}
> +
>  static int dio48e_probe(struct device *dev, unsigned int id)
>  {
>  	struct dio48e_gpio *dio48egpio;
>  	const char *const name =3D dev_name(dev);
> +	struct gpio_irq_chip *girq;
>  	int err;
> =20
>  	dio48egpio =3D devm_kzalloc(dev, sizeof(*dio48egpio), GFP_KERNEL);
> @@ -399,13 +410,17 @@ static int dio48e_probe(struct device *dev, unsigne=
d int id)
>  	dio48egpio->chip.set_multiple =3D dio48e_gpio_set_multiple;
>  	dio48egpio->base =3D base[id];
> =20
> -	raw_spin_lock_init(&dio48egpio->lock);
> +	girq =3D &dio48egpio->chip.irq;
> +	girq->chip =3D &dio48e_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_edge_irq;
> +	girq->init_hw =3D dio48e_irq_init_hw;
> =20
> -	err =3D devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
> -	if (err) {
> -		dev_err(dev, "GPIO registering failed (%d)\n", err);
> -		return err;
> -	}
> +	raw_spin_lock_init(&dio48egpio->lock);
> =20
>  	/* initialize all GPIO as output */
>  	outb(0x80, base[id] + 3);
> @@ -419,13 +434,9 @@ static int dio48e_probe(struct device *dev, unsigned=
 int id)
>  	outb(0x00, base[id] + 6);
>  	outb(0x00, base[id] + 7);
> =20
> -	/* disable IRQ by default */
> -	inb(base[id] + 0xB);
> -
> -	err =3D gpiochip_irqchip_add(&dio48egpio->chip, &dio48e_irqchip, 0,
> -		handle_edge_irq, IRQ_TYPE_NONE);
> +	err =3D devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
>  	if (err) {
> -		dev_err(dev, "Could not add irqchip (%d)\n", err);
> +		dev_err(dev, "GPIO registering failed (%d)\n", err);
>  		return err;
>  	}
> =20
> --=20
> 2.26.2
>=20

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8YddsACgkQhvpINdm7
VJKjDhAA5Xp7O8I8NG8Cxivz5LqbD81ABaDyGvWkgG9xcmzjq/S6I+X0Jazap20N
QchB+EzrotsmP7VYeLAq9HUPySAvFDJvwmaGXZdVh36KTS/PRGwVO5kblhCNSkcL
qko6Izb4BRocp5SAfuFxjGtF5CTuCrozr3S4e6oKSstD56LFSTTNLOYXb0wZVGej
TIe/rXHsVIo5hVyhjOy6u3nxI8k31hZC5r5cwX46O3fj38OuJIBLYTi0ywYmboVh
X9w2IdggmjI5kOtmFUjGbgCZrCUvLRVDHXWp5VIkHvLiPr5t8A5sTwax0x+6FmmF
xN0GNPw4+iJbxoLMQbA+vYLFeMk9B+FVM3r7XD6IbtaEGgwy0CMiOvAB7UkE5xr+
94WN4ctX1W+n0rHApxIFvboOROJEOZYc0X392+DIUarVJqEm1WuNrRHEzWohbgbz
RZLz7HFgzae3BLsN3LQuwgXK4wrYqMIQM6VpIwJbYWzzF4u77zfxcn4HtUOFWXnj
vo5CQhJHvHB+up1ZNWrn8b+nObbxHY7c3CCjeZEDkCJYDelI4mIF29oA2xQ+dnf0
6kwTWnW3gtQyFy9MrXLbGEEySBaEUTyy/rlrS1IOKHcDZKm3/1qWGLnqTLDFElmU
60NuoIeJkpxIMEp89VKyGkXpXK6kUvnaTXspNwHpgoSEK23uyrg=
=+ogM
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

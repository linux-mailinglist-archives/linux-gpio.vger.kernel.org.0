Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEEA1229E43
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 19:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgGVRSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 13:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgGVRSh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 13:18:37 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C299C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:18:37 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id w9so2381969qts.6
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZZb8TlibHAMckFqGI5V7+l/kUw6QzMnFDNu3fVytjIo=;
        b=ndWNeFh9gT7nJxASjXN3xk9Djtl5m3d1CG8ryqYLBpHwTxRrMpnl3/uutxvkEZDN+E
         0nk1pmz0mil13NEBgW8jLfNNwRhsKiZlBr0sRTC2mK8vZIhMtbp+qBn7FTgUMDYYufrK
         I0D8gc/RuWx+EHHfJH2A0F+OerWGCvCVewa1y7Y1QR4WkACvSb9ZMN9uDrWHqWYmUC8G
         EfL9qreYlkRfaIdMidwzgjBlp/TTJt6BF1AH7wgstxleDG+GpTTFTRGBSFRDVegwVxzE
         z8vZUyZDcXx5rV1VGjRY7G2e8pivLHwy+dAgEGt27vnxqHUTDfRa/p6LtD2gQobkF7fI
         brdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZZb8TlibHAMckFqGI5V7+l/kUw6QzMnFDNu3fVytjIo=;
        b=fDVpBfh+S9bMMnjcabr/FvJ2zrXCjgnn01QMyykgptN3jZlRuh7hBir0RcQIKDYFlH
         D7KdZ91ZE6tdksSeEoK1Eu57TJHxkocq8rUMpRAgslFZjN+LydiR3xUFnUfwYQ0kywcB
         DjkTN3yr+LVxf4MTFrCyk4KCPz4ZViefObq5McIIxftmtyThZkjZjURG8QEZbGreOp4l
         Bi4HWV4jWsSsHl7hI2fArGBTJBM8GJBt8tPIyxXyBdJ1DPhCCZ+IhaO8YUaCGkBsfeOJ
         ND7reZ/s9ZWfsLmqLBZbx3snq8Bt4c04b97+Sh9TbL+0iPIcbMGRA/qTY54vFfAFcMY2
         2dfw==
X-Gm-Message-State: AOAM530hYQAzp0eNrbFEx3tBiFdb/g6q7HH3vB+OZUuL5Fn25bO5mnH2
        6zsmsOv5ewAKA1+jCA38G/s=
X-Google-Smtp-Source: ABdhPJy9l5WyAoai+OMRa4TadjwFpLQ1JblY7SW5BcQPcENCcb76os+J2EutnJG93qwzvS83oJ8aQw==
X-Received: by 2002:ac8:774d:: with SMTP id g13mr324052qtu.317.1595438316414;
        Wed, 22 Jul 2020 10:18:36 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id u22sm267174qtb.23.2020.07.22.10.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:18:35 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:18:20 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: ws16c48: Use irqchip template
Message-ID: <20200722171820.GA93793@shinobu>
References: <20200722101938.151265-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20200722101938.151265-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:19:38PM +0200, Linus Walleij wrote:
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
>  drivers/gpio/gpio-ws16c48.c | 39 ++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
> index cb510df2b014..2d89d0529135 100644
> --- a/drivers/gpio/gpio-ws16c48.c
> +++ b/drivers/gpio/gpio-ws16c48.c
> @@ -365,10 +365,25 @@ static const char *ws16c48_names[WS16C48_NGPIO] =3D=
 {
>  	"Port 5 Bit 4", "Port 5 Bit 5", "Port 5 Bit 6", "Port 5 Bit 7"
>  };
> =20
> +static int ws16c48_irq_init_hw(struct gpio_chip *gc)
> +{
> +	struct ws16c48_gpio *const ws16c48gpio =3D gpiochip_get_data(gc);
> +
> +	/* Disable IRQ by default */
> +	outb(0x80, ws16c48gpio->base + 7);
> +	outb(0, ws16c48gpio->base + 8);
> +	outb(0, ws16c48gpio->base + 9);
> +	outb(0, ws16c48gpio->base + 10);
> +	outb(0xC0, ws16c48gpio->base + 7);
> +
> +	return 0;
> +}
> +
>  static int ws16c48_probe(struct device *dev, unsigned int id)
>  {
>  	struct ws16c48_gpio *ws16c48gpio;
>  	const char *const name =3D dev_name(dev);
> +	struct gpio_irq_chip *girq;
>  	int err;
> =20
>  	ws16c48gpio =3D devm_kzalloc(dev, sizeof(*ws16c48gpio), GFP_KERNEL);
> @@ -396,6 +411,16 @@ static int ws16c48_probe(struct device *dev, unsigne=
d int id)
>  	ws16c48gpio->chip.set_multiple =3D ws16c48_gpio_set_multiple;
>  	ws16c48gpio->base =3D base[id];
> =20
> +	girq =3D &ws16c48gpio->chip.irq;
> +	girq->chip =3D &ws16c48_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_edge_irq;
> +	girq->init_hw =3D ws16c48_irq_init_hw;
> +
>  	raw_spin_lock_init(&ws16c48gpio->lock);
> =20
>  	err =3D devm_gpiochip_add_data(dev, &ws16c48gpio->chip, ws16c48gpio);
> @@ -404,20 +429,6 @@ static int ws16c48_probe(struct device *dev, unsigne=
d int id)
>  		return err;
>  	}
> =20
> -	/* Disable IRQ by default */
> -	outb(0x80, base[id] + 7);
> -	outb(0, base[id] + 8);
> -	outb(0, base[id] + 9);
> -	outb(0, base[id] + 10);
> -	outb(0xC0, base[id] + 7);
> -
> -	err =3D gpiochip_irqchip_add(&ws16c48gpio->chip, &ws16c48_irqchip, 0,
> -		handle_edge_irq, IRQ_TYPE_NONE);
> -	if (err) {
> -		dev_err(dev, "Could not add irqchip (%d)\n", err);
> -		return err;
> -	}
> -
>  	err =3D devm_request_irq(dev, irq[id], ws16c48_irq_handler, IRQF_SHARED,
>  		name, ws16c48gpio);
>  	if (err) {
> --=20
> 2.26.2
>=20

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8YdNMACgkQhvpINdm7
VJKW8w//XtTt5eSucWS0IbDg/p8wjp41s0E0rGv+8Zkx12bTMU6xlNwHhq9rjUHN
mZqBh/E1SZ4DCQxvbUNfk+2UQOgBWaujuAjCpshd5/h5CbxtdoamEDBrQEs723Jx
njfb4mgk/SNbronbLz94QBpCKf1TYOE6GaXQ2UX8nem9nB4Y/pPqasoCxlpcUg3W
gzFOasg3SVsyeKedulPr/hojagnRxG7cTIrgvKF0Qlj6ZCuzDb2XmLgT9F5nPx86
NcuM1xZpGAV3HemuO6Fk5dEkQSequdWhYcTKKf8q2D3QD2U6b1CcjmcSZFn34a9t
5GTSUctQ8O/1khOg4Pr/eBMKogzGTHtqLDI0JxCdVdJLP9L14VhlEGgo0AAfoiVR
guGmVGRPVNKiP9CLl2H1UbymI58SC1s84UiZZnq2x5k/LW90sXQdz1g/g2BWQb1n
2c3ix2hrf7mNrunPNjUqfBvc3J+Fd+DJ9X1eIWxgt9Mru9eVGy6fQNQYhGLmAiH3
nPFLCIwTImSEpclFl9Cf8osJM9nsiNmGagS/3/irXU5QhGhcy92w+zTe/QMlgY33
iRPxRCdinX7l0jE9s24bbhzMAGfIL8YZcbHggwx+NvFOsV9FffSX3Gt2UHE7Er+D
Eo5yKi3J0fiUZMqDskFZWgQuQm8FQtWqSAxHBBJGGvvvTVxYz9w=
=MHxl
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

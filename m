Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE79229E9D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 19:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgGVRe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 13:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgGVReZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 13:34:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D77C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:34:25 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 11so2811249qkn.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fxvRN1d7N9EXxel4+X5Gw9Tb3U1I+2Z50QZ2BJaRWLA=;
        b=clbsG2fqQRATZruPKSoUVN8r3kf2DpMl64W6MbeDQjUeinLWIFAGCev+olVsjJu/8t
         eE6gGgAD/iO9whPipx9DTfwq8I+EAfua9ZGjMsuCz6TLmyZ/mTcip2GaR+Z/ikGAb3Mr
         wbJB0iWzv85HleN9otvnE8Z6Sy7t7b1mc0F86O3gHvDXOf2MDJOCa6YMWpYr7IXf65Dk
         IgKFm8KAvL//ntrPCvueWcYDDra+SbM9vml1iECPfyyJx9LN8QCDN3P6oVTtqSaeeFgN
         I/hUf6ZmuK7+QPpH3bqm0gxldg6Cehv5RP+fYv7dEhmKdhmveueCyxHUm5etHJk2Y6QA
         zH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fxvRN1d7N9EXxel4+X5Gw9Tb3U1I+2Z50QZ2BJaRWLA=;
        b=ItzKNMRKvK3f40+VV7Mol0GXQAe5ojs5wBlJLAG2z4wUR+QGmdOZykeNVaqknIfNXm
         GCujr6IzCWS/b71d5kmeKOetU3h/SH24MPrLYeMMGFuNQKk84ppMWkKOabmzAPqAZKa3
         HhyLvuB6gWahjo0i9S7J5V3q9MF/nf9QiPFKtYpYrVEuHzVdFkTCcOl/Wa8N5K+cVHew
         NLXIogaqWe25g9+wwA1AEKv0aC0KwNccdXHF25Nl28fI5cROVcWgUHawrmY7lp4G8WnQ
         GbsomMJC1oNmFORTRI5u/w/SmxRgaKrNwbMebsvXJGSIvqmJLV1BKf6leGaAqHIiUUqU
         AFFg==
X-Gm-Message-State: AOAM532naA5lXnEkTwh5oKBHXcrnOU1YPUJGxcoIeHMrQsW/YH35jd6k
        ljqM6oym0+E34GzAzlM8F+U=
X-Google-Smtp-Source: ABdhPJzjzfiPDlYfLGyagNv6HIdps/EbhvQWPF9cLsvUkG++hg5k1vq/Ll/jM2l8aYq7m6YMrIBNuA==
X-Received: by 2002:a05:620a:3de:: with SMTP id r30mr1008457qkm.221.1595439264993;
        Wed, 22 Jul 2020 10:34:24 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id a5sm284131qtc.44.2020.07.22.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:34:23 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:34:22 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: pci-idio-16: Use irqchip template
Message-ID: <20200722173422.GF93793@shinobu>
References: <20200722110649.202223-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y1L3PTX8QE8cb2T+"
Content-Disposition: inline
In-Reply-To: <20200722110649.202223-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Y1L3PTX8QE8cb2T+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 01:06:49PM +0200, Linus Walleij wrote:
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
>  drivers/gpio/gpio-pci-idio-16.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio=
-16.c
> index 638d6656ce73..9acec76e0b51 100644
> --- a/drivers/gpio/gpio-pci-idio-16.c
> +++ b/drivers/gpio/gpio-pci-idio-16.c
> @@ -280,6 +280,17 @@ static const char *idio_16_names[IDIO_16_NGPIO] =3D {
>  	"IIN8", "IIN9", "IIN10", "IIN11", "IIN12", "IIN13", "IIN14", "IIN15"
>  };
> =20
> +static int idio_16_irq_init_hw(struct gpio_chip *gc)
> +{
> +	struct idio_16_gpio *const idio16gpio =3D gpiochip_get_data(gc);
> +
> +	/* Disable IRQ by default and clear any pending interrupt */
> +	iowrite8(0, &idio16gpio->reg->irq_ctl);
> +	iowrite8(0, &idio16gpio->reg->in0_7);
> +
> +	return 0;
> +}
> +
>  static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_i=
d *id)
>  {
>  	struct device *const dev =3D &pdev->dev;
> @@ -287,6 +298,7 @@ static int idio_16_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>  	int err;
>  	const size_t pci_bar_index =3D 2;
>  	const char *const name =3D pci_name(pdev);
> +	struct gpio_irq_chip *girq;
> =20
>  	idio16gpio =3D devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
>  	if (!idio16gpio)
> @@ -323,6 +335,16 @@ static int idio_16_probe(struct pci_dev *pdev, const=
 struct pci_device_id *id)
>  	idio16gpio->chip.set =3D idio_16_gpio_set;
>  	idio16gpio->chip.set_multiple =3D idio_16_gpio_set_multiple;
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
> @@ -331,17 +353,6 @@ static int idio_16_probe(struct pci_dev *pdev, const=
 struct pci_device_id *id)
>  		return err;
>  	}
> =20
> -	/* Disable IRQ by default and clear any pending interrupt */
> -	iowrite8(0, &idio16gpio->reg->irq_ctl);
> -	iowrite8(0, &idio16gpio->reg->in0_7);
> -
> -	err =3D gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
> -		handle_edge_irq, IRQ_TYPE_NONE);
> -	if (err) {
> -		dev_err(dev, "Could not add irqchip (%d)\n", err);
> -		return err;
> -	}
> -
>  	err =3D devm_request_irq(dev, pdev->irq, idio_16_irq_handler, IRQF_SHAR=
ED,
>  		name, idio16gpio);
>  	if (err) {
> --=20
> 2.26.2
>=20

--Y1L3PTX8QE8cb2T+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8YeJ0ACgkQhvpINdm7
VJI8lQ/+Ihm6cON5Llcwk+Y297rE/tdeHc3ywxRYNclFYrnOyJIt1kzZZv3iO8Po
/eGnoMosL9sqVxOAhA2pg1u5gcEKWbUhzHcYMb8LfDjCsWclwKjWPdqzobJL0LbU
5o/AyrQZsy7uD9WjyCpHhw5XUO0yPEnle3CA5xFDYSJAZlON/ogUHw39yDup6woh
1Q7MGxWjs+LPGkgcWRNr9l/nBy7jfHO0BgtIbzXa9fZVigUjusU/RAYVuTlqcNSY
1THOn8N9ngHAF+5/qy6Egnoynvz4jmXiwsCFIi13UsAdeLm/M5aOtyjr/gvastVA
MoG433vwqyu6rchHUebPho1QA8aaXMJxIuvZV3+FVDeMPIBV+Paq8psDTMWduNz3
eSOiHY29Gv5PxawQczFWibeZDQ2qw9LDgrtDMY9oomYsNAiokMM9Juqx/114s+h1
61H+jLqMY4TwWV507RzBKMp269L8HDWAGGmMMGAqYGnWcZMPWTYRrmYyXQQTWCFP
ZiEZC2/sirhXgzaS4UabpiRgKr4E/R5MOtmO+w2K9MHEJH4y1ldPjOFfsVtLYwBV
nd26L/KBiSkvyGSPmHWZmYbaVpZspYp29x4TYsCojmW+HPz2YPNsA2SI+Ay+wzcH
wU2lJh1oEtj+sl5uYx0r3j/mWdynyeDGMTS674dNhAMi8OJ1sEs=
=88Sz
-----END PGP SIGNATURE-----

--Y1L3PTX8QE8cb2T+--

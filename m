Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8998C229E86
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 19:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgGVRaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 13:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgGVRaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 13:30:07 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43A0C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:30:07 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id e7so2435614qti.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+8Sc3B5GUB1+j4j3DOSwc8LUtirRyu8jdtxduEXI0ms=;
        b=Ws2wYQtnIISzn7EyfzajCO4toYDcv0NxSNOIPAA7m6GGui6HjGpFOVy1moFexNdUTz
         ZY1B09pjnriJbYYQ5G9AUNLWtKPmmzraShJWb/oUXCC1ZPmwEOvoDyJ/0ocfkcQCQgwr
         Lb1D64wwpHnnPUIzpWhWx2hmdR5VD5OYeYqS5amM6cDxtIiNXpTiS8IaEFG50wGkw1x9
         UNgtjmU0cIagbEkDoczAjaF1rj1VcznkCm3LOjoh78Ndeb3J9YrILlFbOEl4+Y0BAxT7
         VWiTu73CPzFvcmSeX5XaaCEx7UHp29XmoTBhGoBSctoeXXyIva5zTblnZuBTMhDUaviz
         rMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+8Sc3B5GUB1+j4j3DOSwc8LUtirRyu8jdtxduEXI0ms=;
        b=a5ASHa9IrXls+QhjfBG38GIbSIQn2SHhJo6yOB0gjk++ffSSy3YMRBWlgfjn4+WY3/
         fPg6bvZooVgUFyfu86L2WDvw3xJb/WZdQcszfRo0e1HVOLtFTiMn0iGl87fyxjEX3/Gm
         cppCZ5b/5X/9ndcJyWpTy65eTP16ZvfFXSbaM8nqQHxgn9n1TGnncfX+X2oYAwPtWfec
         vwbC1ZTTAGocMNvotLM7QT+dQO5S+hmzPLGmEi4Jr7aWSPBkSYOCisI2YGesYycno/DG
         5f4byOaDmrhDOgFDVjoCkrbtrOdM+AukUj6xPV0KV6FWCnTckDfvDIFNa52DrpY86rm5
         Je/A==
X-Gm-Message-State: AOAM532Mr7GoTpi1IzPnakxl2JWv1rnCH4dIaa2akvWCdExv00KjQnoD
        sDJ9XgTSAYjKIhBATx2w/9Gsbd/6DVY=
X-Google-Smtp-Source: ABdhPJxNN3DsYWPeKrTFiZSa62BJUoIcaMs7RYw6csSs3XwjV0HPr1gUDz06ihlnbxw5nVvd34A2EA==
X-Received: by 2002:ac8:6d24:: with SMTP id r4mr430711qtu.43.1595439006886;
        Wed, 22 Jul 2020 10:30:06 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id k2sm437317qkf.127.2020.07.22.10.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:30:05 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:30:03 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: pcie-idio-24: Use irqchip template
Message-ID: <20200722173003.GE93793@shinobu>
References: <20200722110027.192782-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VdOwlNaOFKGAtAAV"
Content-Disposition: inline
In-Reply-To: <20200722110027.192782-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--VdOwlNaOFKGAtAAV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 01:00:27PM +0200, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit call to gpiochip_irqchip_add().
>=20
> The irqchip is instead added while adding the gpiochip.
>=20
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/gpio/gpio-pcie-idio-24.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-id=
io-24.c
> index 1d475794a50f..a68941d19ac6 100644
> --- a/drivers/gpio/gpio-pcie-idio-24.c
> +++ b/drivers/gpio/gpio-pcie-idio-24.c
> @@ -457,6 +457,7 @@ static int idio_24_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>  	int err;
>  	const size_t pci_bar_index =3D 2;
>  	const char *const name =3D pci_name(pdev);
> +	struct gpio_irq_chip *girq;
> =20
>  	idio24gpio =3D devm_kzalloc(dev, sizeof(*idio24gpio), GFP_KERNEL);
>  	if (!idio24gpio)
> @@ -490,6 +491,15 @@ static int idio_24_probe(struct pci_dev *pdev, const=
 struct pci_device_id *id)
>  	idio24gpio->chip.set =3D idio_24_gpio_set;
>  	idio24gpio->chip.set_multiple =3D idio_24_gpio_set_multiple;
> =20
> +	girq =3D &idio24gpio->chip.irq;
> +	girq->chip =3D &idio_24_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_edge_irq;
> +
>  	raw_spin_lock_init(&idio24gpio->lock);
> =20
>  	/* Software board reset */
> @@ -501,13 +511,6 @@ static int idio_24_probe(struct pci_dev *pdev, const=
 struct pci_device_id *id)
>  		return err;
>  	}
> =20
> -	err =3D gpiochip_irqchip_add(&idio24gpio->chip, &idio_24_irqchip, 0,
> -		handle_edge_irq, IRQ_TYPE_NONE);
> -	if (err) {
> -		dev_err(dev, "Could not add irqchip (%d)\n", err);
> -		return err;
> -	}
> -
>  	err =3D devm_request_irq(dev, pdev->irq, idio_24_irq_handler, IRQF_SHAR=
ED,
>  		name, idio24gpio);
>  	if (err) {
> --=20
> 2.26.2
>=20

--VdOwlNaOFKGAtAAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8Yd5sACgkQhvpINdm7
VJKFgw//Vhp6l+AerYHsLZxtlb7uiSiAwFVicvzJcNaApYDVQfVhWCtrhvxREeqr
8zDjNfmbfzzjvifSzi39SXpQWWEKVIu0F8qCpQWqcq97fUFSNlgxRxwEIvmTTCWV
DFrPUxhyCtq7WB70oihg3mwn/MEszo5YsNxbtn1fM0IuNh/vCLbs6M+MNIDyqCxT
8moqQc80m9zAD8bd7n8GCgqBl7qwCvOXnpvjRvgjCG3RCt3ufqxtHM6LpyPj+HK3
8EZUPwmGCVV0hMM20VqObgKRsyEdowgUlWBIgzOxozN+sS2wsRgcrF2lFxZwmKmF
b/Zndwq3QIzwJWMwsUDOLGDm8w2XcVqF4/FDb270PYFlA5BBPZO/54AmraGCGJi2
TN9irym/ZBBarYuABxCwXhvk6OtGrLoS1QccU6IYTLECu5FJzD22UXEY2rDtdNIu
fA1CUnztcxPLry+1Q0K3CqUFH2cUDRdhLM1zamuxQx7IFUmJVeRlypW2GNCXmpMR
46fLqjMm9zArqQLe2alZxe+paLd4dIuac5u3ItuenclnmL9AhTElnYpdAc54O2zx
BF5VNTDqzAq/qwUKPvN8o111zLy41FM8MQioSXqB1e5OnsGGAW5/hWuD3ZqPAiNG
l90xS7aVjZ3+l6oEisJqkq+P6A1ckBN3z94iV2HbhkIj+hwntJ4=
=sw4H
-----END PGP SIGNATURE-----

--VdOwlNaOFKGAtAAV--

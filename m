Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C380229E6A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 19:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgGVRX2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 13:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbgGVRX2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 13:23:28 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3B7C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:23:28 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so2399138qtg.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0W0E55g1hEQvJsjLvwibqhUy9sFv+/QJoh4iaeOrnRo=;
        b=QOkrxR81EYoUlHb8rCpx+y90hYM2u7/7rZ3WS897mF0x7OvfnNaUe9AI0bietO0d7p
         KJ0RdLD0mKYmxACDekpOW5YEuYbVgilrfBmIHBjsnGe7U+Qz7/jWw2FkLK5uzk78DNEu
         Xe8VGMc1gRPoYJHPBO6ZRRaFFjL0bs27lgauHM6KWRrTTFpzLb5NhjTxI/VJiiL0xTCy
         ad2raTzARuaCosCQUKH/PLYGvbpf53bEMcl+kVNMkv7MyRPAQ9gX8Nwha0CwLx5RzgXB
         yaPZgLGnBLsw39Nu8BpCJ6jEd6x/Xr2AcsrkZoHzF2eiDU5dTENtILuUFlani3kJVqaq
         upvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0W0E55g1hEQvJsjLvwibqhUy9sFv+/QJoh4iaeOrnRo=;
        b=DMYXgOIMFTPcEjpd4EmS0vwgzVCYu8h4qt6f6u/vQ9dAV4Gmo7x5Q/uzWYyvJ/h6vu
         6lSzfLt9SfXfwI1pGPQpGU+gfl8k1tV/iPfUkwmy0ZVZMTZiHSwzSkRVYMJk4JH0D1+N
         ME2E0TMNXSqUlGvPyiybgL+BAQ5S1JFVUiAub5KpwAvWp0/tehVX57cosCBauoWk+j1/
         Th3VubvKLyKZajefx9TIis5gkiPAmqCJhRofCMFjCiXoTbyaw7txqhsi9YVrNRTEgB8G
         QCFcK/ZsEYlptsNlCrYTbvpOOxhwLBURAKFjMF8EKtYZcFWeLZrc6JhodoyrM4ywdqAH
         OK8A==
X-Gm-Message-State: AOAM533QyD+iLfzka6EEjqgD7eBQa2JrjIYQ+QZBOp6sJtyHtjWKTXaH
        KxkK9RTlaCTvfu5DxGLcTg9/9NRO1eo=
X-Google-Smtp-Source: ABdhPJzqSSw0blFGBuKjob9m1Zuc471CZDwD8mtaA2SNRWV7SzfEpSJzlbVTGqdlx/prGo0atd13Dw==
X-Received: by 2002:ac8:2a3d:: with SMTP id k58mr356735qtk.265.1595438607440;
        Wed, 22 Jul 2020 10:23:27 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id x36sm236389qtb.78.2020.07.22.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 10:23:26 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:23:24 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: 104-idi-48: Use irqchip template
Message-ID: <20200722172324.GC93793@shinobu>
References: <20200722104820.174654-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <20200722104820.174654-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 12:48:20PM +0200, Linus Walleij wrote:
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
>  drivers/gpio/gpio-104-idi-48.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-4=
8.c
> index d350ac0de06b..94c3a9bc4e75 100644
> --- a/drivers/gpio/gpio-104-idi-48.c
> +++ b/drivers/gpio/gpio-104-idi-48.c
> @@ -247,10 +247,22 @@ static const char *idi48_names[IDI48_NGPIO] =3D {
>  	"Bit 18 B", "Bit 19 B", "Bit 20 B", "Bit 21 B", "Bit 22 B", "Bit 23 B"
>  };
> =20
> +static int idi_48_irq_init_hw(struct gpio_chip *gc)
> +{
> +	struct idi_48_gpio *const idi48gpio =3D gpiochip_get_data(gc);
> +
> +	/* Disable IRQ by default */
> +	outb(0, idi48gpio->base + 7);
> +	inb(idi48gpio->base + 7);
> +
> +	return 0;
> +}
> +
>  static int idi_48_probe(struct device *dev, unsigned int id)
>  {
>  	struct idi_48_gpio *idi48gpio;
>  	const char *const name =3D dev_name(dev);
> +	struct gpio_irq_chip *girq;
>  	int err;
> =20
>  	idi48gpio =3D devm_kzalloc(dev, sizeof(*idi48gpio), GFP_KERNEL);
> @@ -275,6 +287,16 @@ static int idi_48_probe(struct device *dev, unsigned=
 int id)
>  	idi48gpio->chip.get_multiple =3D idi_48_gpio_get_multiple;
>  	idi48gpio->base =3D base[id];
> =20
> +	girq =3D &idi48gpio->chip.irq;
> +	girq->chip =3D &idi_48_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_edge_irq;
> +	girq->init_hw =3D idi_48_irq_init_hw;
> +
>  	raw_spin_lock_init(&idi48gpio->lock);
>  	spin_lock_init(&idi48gpio->ack_lock);
> =20
> @@ -284,17 +306,6 @@ static int idi_48_probe(struct device *dev, unsigned=
 int id)
>  		return err;
>  	}
> =20
> -	/* Disable IRQ by default */
> -	outb(0, base[id] + 7);
> -	inb(base[id] + 7);
> -
> -	err =3D gpiochip_irqchip_add(&idi48gpio->chip, &idi_48_irqchip, 0,
> -		handle_edge_irq, IRQ_TYPE_NONE);
> -	if (err) {
> -		dev_err(dev, "Could not add irqchip (%d)\n", err);
> -		return err;
> -	}
> -
>  	err =3D devm_request_irq(dev, irq[id], idi_48_irq_handler, IRQF_SHARED,
>  		name, idi48gpio);
>  	if (err) {
> --=20
> 2.26.2
>=20

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8YdgwACgkQhvpINdm7
VJImMA/+LkROe6VEpO/6979skOYx1cMfr19ShRLS4pb6NdbpgLoU8nWpqIUtunwL
zxM5LMhVV7Cw/9x/JMkJ+Cmd35hsruPZXtDMOEceSG1DK++PsqEdc0fnD6ejYNFp
4DGPd9cxFy68MB50G6QCxqxEibG3F+25XClfekrd7Hqb39foEoSUIdEZFixFShOi
CfyhTZ87pE7z/emCfnOZkw0pXlzl8xvBSy3+AH2qgq4CTBJjU5QNzJNdCX5d/v2S
Y1GMzBsNEzelfOA+X9Slx7UVssINTr/5jkVerZN+tcoelpEVbd15jNSeD/GsQUMP
L/bjniFoCQlQcyrLH9j5UVmlK05vfc3GMATSenzc+D20HH8CD8klj07RprAqKTYC
2PON178+gD4EqlwGbG9dRpOUsesE3nt5RtaV9CfX+BapQmz44Ljua6nhSFKYwmW2
tYPvoopyK0LNqRiPSd4+3nNhx4xPOWgBi8FpdXnnj4PWpZDUHrN400+1DH7jKtsd
Tc1wPndxpWopHf/nFMJQMJNSW6Ju1hblp6fmNFhjKNfeOqwQihn4/9ZAwD62scFv
cMXxX/QQvlCEyTS/Fx9qQK9ugTfQsNMzwi/peS2xHaM9UIsTKd4UAs6UaYwJPuPV
goBbUPGpbHk/GmoY0Y67az3WjopBfjHxyCGQBHvXJ0slBOCLMa4=
=4rzJ
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--

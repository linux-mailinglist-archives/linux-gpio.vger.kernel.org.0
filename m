Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8972A6803
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgKDPrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgKDPrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:47:31 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF13C0613D3;
        Wed,  4 Nov 2020 07:47:30 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id w5so10080408qvn.12;
        Wed, 04 Nov 2020 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x6vxFkDD7hV+0Avi7ULZiknIZLLix6hbaToLilLhuZY=;
        b=nBbEtbdM2PIrK6SJxhb5wNHMhHfjDa5/QZLgjE2ET62g7ur+wfFYnLmM47z7uWArtF
         J0zqdMcuetgo9aEXFcl1ier6xSj1zEtJ0G9ASzOLdQoNDzDAIKFvn68cmZGRbfCnnUNI
         NULBhUpuZAuinEp2gj9xumdBKTlxmoMRqWX5c5a7kYj/wCmoR91uRluFIlH4FejNGdVY
         RwieHSr7UKb3TjlrQC35FEvSteA6aAgzEskQljEFlfctFeVV4mThigPzi0sbRNhAL3vh
         U5nNBvOdPinT1ohRTiuh1RqXzhDCqDZIa7y7gsHt7x6BQOPhgxkbHQUIkbGpyvM1Mtxc
         Vkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x6vxFkDD7hV+0Avi7ULZiknIZLLix6hbaToLilLhuZY=;
        b=mPz93ncRb5XOJwfPUQMrlNXbo2URpTh3w55zaoV7S1N/MrlkwmRP6F6ioF/+Rx97bt
         jz9Beu3vAe9wkp1x57ILtmZkGXymAyHZwvLzbPsoqREdfdsC+tUoQwAyPkmXK+KovHRt
         Q7fvYkh+5klOlfHkdgg0Bzu3aroFcW9GcuXQLE87zEE9q2lZezSqDJlzqPhzbHGgxn7H
         RcU6D6uhlmWi50tALPkprs0mrTaDLH0H2oGLhAFKwOEZDeiJZeu72JqrVHHwe9hDLpNz
         ufc9963BycZE0muln7rj5J1cjiGmf5sQUi1zE7Lv9Rx52dCxkxBLVvKG9a0BYaYxCPwd
         ymJA==
X-Gm-Message-State: AOAM530rmjGq2Np/4UlVpo9wMF0CQYzaeHsQuIcujpKaNv2j+FAFASvP
        fhkXeCnjhdaTMxh9TBSu03A=
X-Google-Smtp-Source: ABdhPJwZJzqUYt7WIKEH85RtMlZjnqpaQfEFNXU8H3NQMLuzJKwTaEts+l/0jvnkLYLfRKX1Fpk8KA==
X-Received: by 2002:ad4:4142:: with SMTP id z2mr34053615qvp.20.1604504850230;
        Wed, 04 Nov 2020 07:47:30 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id s23sm18339qke.11.2020.11.04.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:47:29 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:47:27 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnaud de Turckheim <quarium@gmail.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: pcie-idio-24: Fix IRQ Enable Register value
Message-ID: <20201104154727.GC406355@shinobu>
References: <20201104152455.40627-1-quarium@gmail.com>
 <20201104152455.40627-3-quarium@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <20201104152455.40627-3-quarium@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 04:24:54PM +0100, Arnaud de Turckheim wrote:
> This fixes the COS Enable Register value for enabling/disabling the
> corresponding IRQs bank.
>=20
> Fixes: 585562046628 ("gpio: Add GPIO support for the ACCES PCIe-IDIO-24 f=
amily")
> Signed-off-by: Arnaud de Turckheim <quarium@gmail.com>

Reviewed-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/gpio/gpio-pcie-idio-24.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-id=
io-24.c
> index 5ea517416366..a61de14d09b6 100644
> --- a/drivers/gpio/gpio-pcie-idio-24.c
> +++ b/drivers/gpio/gpio-pcie-idio-24.c
> @@ -334,13 +334,13 @@ static void idio_24_irq_mask(struct irq_data *data)
>  	unsigned long flags;
>  	const unsigned long bit_offset =3D irqd_to_hwirq(data) - 24;
>  	unsigned char new_irq_mask;
> -	const unsigned long bank_offset =3D bit_offset/8 * 8;
> +	const unsigned long bank_offset =3D bit_offset / 8;
>  	unsigned char cos_enable_state;
> =20
>  	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
> =20
>  	idio24gpio->irq_mask &=3D ~BIT(bit_offset);
> -	new_irq_mask =3D idio24gpio->irq_mask >> bank_offset;
> +	new_irq_mask =3D idio24gpio->irq_mask >> bank_offset * 8;
> =20
>  	if (!new_irq_mask) {
>  		cos_enable_state =3D ioread8(&idio24gpio->reg->cos_enable);
> @@ -363,12 +363,12 @@ static void idio_24_irq_unmask(struct irq_data *dat=
a)
>  	unsigned long flags;
>  	unsigned char prev_irq_mask;
>  	const unsigned long bit_offset =3D irqd_to_hwirq(data) - 24;
> -	const unsigned long bank_offset =3D bit_offset/8 * 8;
> +	const unsigned long bank_offset =3D bit_offset / 8;
>  	unsigned char cos_enable_state;
> =20
>  	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
> =20
> -	prev_irq_mask =3D idio24gpio->irq_mask >> bank_offset;
> +	prev_irq_mask =3D idio24gpio->irq_mask >> bank_offset * 8;
>  	idio24gpio->irq_mask |=3D BIT(bit_offset);
> =20
>  	if (!prev_irq_mask) {
> --=20
> 2.25.1
>=20

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+izQ8ACgkQhvpINdm7
VJKHpw/+MC3fq/T5zj3uFY2JBthS51uPW8xzGy5P02F9N5M7eXct++QYLlv4SsB+
KpM0KtdK6/erqrizP8uCuWSRs8OyBxhqmmP0RIY9XQU1Rtwx9m2nkl9V1/WKbsOq
quWQlFXbA6axjZnOr1UeImlGH6eGaXELhHS2/WVNrBp3XVEGkkHpNsmvhTbYAk5q
yWHauGWjyxMjgup3inlZ6AWZZ+e7FU6s2OTO9TJW9n40CpcPpxAvD/hD6fFqqKz/
aCq9pdYfaB32LIY1lNr4SqzsBEPuVAuLgTELwzQjKZsftrBFVVS7PHFqTJ1pOJND
/oPheJJ7Ij9cfQLl4kbYbhyzh8FTScvpePtOGnxCWKCgKrAr4GPBl7i0SPNcXYBv
iVylrReabo6Pxd+1fZZ4gt82lYUiCgexuFYaUnL7qzqLhxyDwKlC39pmw5iQkjoP
YyL9Vs8AX9FZxs1AJxAe4tQJMS8Z6G0xB8AxJajrzMzaxzQ1AB+WgHZvjL5SPDxq
6TKeEYtJw03vJXbBen0gAk8NyeeUgOM41SCvS0sQD1e6Y1tnTEB39nm1YFM1cdV/
VQvjd3lnbwEnCR8ZFl+8sJtSXtnJQA+lwlIbyHubES443uUEPlifxL8IbC7wp6aN
Z3918Ef0JeyN/UL7mymsYxiSPXPqwvl3VUikIj6pSW4WGsxDHa0=
=8Mwy
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558AD3903B1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhEYORf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbhEYORa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:17:30 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F618C06138A;
        Tue, 25 May 2021 07:16:00 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 27so21551393pgy.3;
        Tue, 25 May 2021 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zjs+viGYJSBPdaXcUJflx56vXCP2+1+o5OUv2OcmjvY=;
        b=iH7IFVvebQALbm9bW20P712uRvQYiimEHUSWxc5ad9Ho7pBjgQi/MVpSgcibzfEG/E
         oK4wgI3LahUeuvA6MjJ7nrlMx1k+QO4D7xtHHi+g2Zxza7XvIG1AvuyvIdtST9ggI7Pi
         c+a5aCPsP7dCSRW3c7qK7jvD4ql9eEjk/xy15bGoUgGQXTPE91UMTFovYZ7NNM9KdWe0
         y4f7dl437tKTLAN5eB1OTp20dVK5n30H+Y3mfcJkDG4VJ4lR+m9OiLRsXLFfITQBe6ME
         OBwn3S+gkS6Ecja70pDMZAEXMuDMHHDT2lJUr5szGmtKb+bkeOyOcNwS8xG82lQSxjd/
         SagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zjs+viGYJSBPdaXcUJflx56vXCP2+1+o5OUv2OcmjvY=;
        b=mDcVaukemEm751s0rdUY+WQwszqQXbs9d2Yszk5AtVFa1WCua5tIhiprb3Du4b/ThH
         Sn96IxEBGTGw5n2OwAXi4pwmRlYbgDRn0bX2o7N9FmoAIylol1gjdzxM+gVWD6bw21hJ
         RS9bHLwmI7K/O6yjN/54txJh35TKi4kxu5ulF6hgXgFX1Li/CpPojDGrc/VS/vEcYI2N
         fPQFCvvSU012T7EQhNj4m9dT7ewCjvi1jVooYVR0WgKu86HtSZ/KzJNo2o0NwfPGwLED
         5ul2eZRw4oe0GrKX5YcAmoz3M6XTrB7aGQag6QEPl5aZuQygD32P02qybyS5zddJhvKO
         Wz4g==
X-Gm-Message-State: AOAM532uHDEPB/NzngCgmmJKklHkYAjxK1L5fjD1KOHvh6E/KjyONYgn
        sjco/hSZSl/4OpXF1iSGocI=
X-Google-Smtp-Source: ABdhPJyU9XZrSxOKNCEf8MQQk9MHRoqfuYszJ+WPth1cuLHIbH2RFC9UfQDqrs0VeFjwedMM17P7rQ==
X-Received: by 2002:a62:1a10:0:b029:28d:1590:d204 with SMTP id a16-20020a621a100000b029028d1590d204mr30258506pfa.78.1621952160074;
        Tue, 25 May 2021 07:16:00 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
        by smtp.gmail.com with ESMTPSA id y76sm12066987pfb.74.2021.05.25.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 07:15:59 -0700 (PDT)
Date:   Tue, 25 May 2021 23:15:54 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Navin Sankar Velliangiri <navin@linumiz.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com
Subject: Re: [PATCH] gpio: 104-idio-16: Fix coding style issues
Message-ID: <YK0Gmqf4IrR9qX6a@shinobu>
References: <20210525045717.20652-1-navin@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LKIMFHI51zCGpcMP"
Content-Disposition: inline
In-Reply-To: <20210525045717.20652-1-navin@linumiz.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--LKIMFHI51zCGpcMP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 10:27:17AM +0530, Navin Sankar Velliangiri wrote:
> Fixed multiple bare uses of 'unsigned' without int.
> Reported by checkpatch.
>=20
> Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/gpio/gpio-104-idio-16.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio=
-16.c
> index 50ad0280fd78..55b40299ebfa 100644
> --- a/drivers/gpio/gpio-104-idio-16.c
> +++ b/drivers/gpio/gpio-104-idio-16.c
> @@ -44,11 +44,12 @@ struct idio_16_gpio {
>  	struct gpio_chip chip;
>  	raw_spinlock_t lock;
>  	unsigned long irq_mask;
> -	unsigned base;
> -	unsigned out_state;
> +	unsigned int base;
> +	unsigned int out_state;
>  };
> =20
> -static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned o=
ffset)
> +static int idio_16_gpio_get_direction(struct gpio_chip *chip,
> +				      unsigned int offset)
>  {
>  	if (offset > 15)
>  		return GPIO_LINE_DIRECTION_IN;
> @@ -56,22 +57,23 @@ static int idio_16_gpio_get_direction(struct gpio_chi=
p *chip, unsigned offset)
>  	return GPIO_LINE_DIRECTION_OUT;
>  }
> =20
> -static int idio_16_gpio_direction_input(struct gpio_chip *chip, unsigned=
 offset)
> +static int idio_16_gpio_direction_input(struct gpio_chip *chip,
> +					unsigned int offset)
>  {
>  	return 0;
>  }
> =20
>  static int idio_16_gpio_direction_output(struct gpio_chip *chip,
> -	unsigned offset, int value)
> +	unsigned int offset, int value)
>  {
>  	chip->set(chip, offset, value);
>  	return 0;
>  }
> =20
> -static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
> +static int idio_16_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct idio_16_gpio *const idio16gpio =3D gpiochip_get_data(chip);
> -	const unsigned mask =3D BIT(offset-16);
> +	const unsigned int mask =3D BIT(offset-16);
> =20
>  	if (offset < 16)
>  		return -EINVAL;
> @@ -96,10 +98,11 @@ static int idio_16_gpio_get_multiple(struct gpio_chip=
 *chip,
>  	return 0;
>  }
> =20
> -static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, in=
t value)
> +static void idio_16_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			     int value)
>  {
>  	struct idio_16_gpio *const idio16gpio =3D gpiochip_get_data(chip);
> -	const unsigned mask =3D BIT(offset);
> +	const unsigned int mask =3D BIT(offset);
>  	unsigned long flags;
> =20
>  	if (offset > 15)
> @@ -180,7 +183,7 @@ static void idio_16_irq_unmask(struct irq_data *data)
>  	}
>  }
> =20
> -static int idio_16_irq_set_type(struct irq_data *data, unsigned flow_typ=
e)
> +static int idio_16_irq_set_type(struct irq_data *data, unsigned int flow=
_type)
>  {
>  	/* The only valid irq types are none and both-edges */
>  	if (flow_type !=3D IRQ_TYPE_NONE &&
> --=20
> 2.31.1
>=20

--LKIMFHI51zCGpcMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmCtBoIACgkQhvpINdm7
VJKCEg//fusSfdxeeRrqUHz5kd30lBWIq6bo5khxw2hmi7Ng+fNK/NfogbrqY+ws
LSgsFROi/EAvqgefw8NaA8r2Hg5x4L/J5E+L8zAcdZH9iToz1f20iiAoROgIBkVK
opTcujViXRpaKVMdmEpT9BqvR1XIB/6SthXKTwdio5N5hfpE/oOL+SREecDxiXWu
IDtKmGHzte0sChZYYFGDTIDs+CpNgOrmuMvnygP5gdUnFr14ykXTlmMV6J6Ka6b3
oRP8P06K8y74dMUPT7gNzVfNV9I97/IfjUyu4W4BNJae1+sDpFTEziRfUm+GB/cR
dsQgU88aSPv+gkSWx+xip/L+NiSRcmosbPxp80XfTNUva13n3sTAk7n+QYUUC8Gq
SPaTyUlAPE0VTSEiFSxct3/loFecoHX2iDAafg/XgDS2slRv4PpVEQfvTajmYYwU
bnZX/91sY5ZgAmymiMO62pHJFbAQ7Q3wnzvgQkYOrz+aqzVpf70ule4NSrnpC4R9
ujfVJXPa9iTj6mCNNc8r3AVLlYYBP32y9CqQyabXN4XKEvdX8wsYXvloVUO0Ubtc
ObUZMqNtru5zx1MaXKjYgMxUwNQ2TNZdugzceXG9ltZiJfcYoeMAYQW7f48Ca+f+
ed3O9+7bVcACW+E2TTUfe6mtkel3BOg6I9aaz0y3dD7fDZ+XKPc=
=IdTt
-----END PGP SIGNATURE-----

--LKIMFHI51zCGpcMP--

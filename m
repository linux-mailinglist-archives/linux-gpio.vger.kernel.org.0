Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD7C1C27E9
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2020 21:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgEBTEL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 15:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728450AbgEBTEL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 15:04:11 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4087C061A0C;
        Sat,  2 May 2020 12:04:09 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id f13so1128416qkh.2;
        Sat, 02 May 2020 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NCkYmcZHW96yoAmdNeGIwLYX03v3lBdaBnxjiFgb2Tw=;
        b=F3LXI5S3+KmP+lqTW4V5BD9oG1d/7FfFHT8v/kkMqZYbKRFzk7Qcj01aGgD/HOgy5M
         QGTLk/VkEPOQsPRL4BacdeWTgroqUUEzNiqEBOUN9Trc9MAna1tuHR6QosR4aA3nuWOl
         zK2tAiNIEVM8c7g1ht4G4AKT42I9tJN7rZM3LQkZuRNZlJE/1nqTiJ3sgSsXkQsR3bn2
         B0I3IDwT5cwgPpBM8OgCQpiztboHxWKD+Z/VH1pzMAsaIHfgJC8DKP1m8RA2aCO2CTVc
         SF7gUFD0HlXqqp5gQLlKQ/C8jMJHGCXDCTrqX6SEDFYXVQ1jDAZw6JU8RdMLybVpDBGY
         FoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NCkYmcZHW96yoAmdNeGIwLYX03v3lBdaBnxjiFgb2Tw=;
        b=qbJyFk0i+AmNfDqlHftFxdDNuhDtjBm72gBONG3NJafi8qMi6lnFB4RztAAsp8CBky
         3V0MpI96LNxq7iAW8bIYMJJdBcdnfOa0uhGCIheMkBtWgQAh1EyaBCedn47b7ToPK1Bm
         iDuhNMQn7WCUMnJOqvUkr6Mojzl6lSdPxkArLlPQW5B1Y8mLb64eNVNaAKo/9/0+IXwA
         fv1js/m/OEK4OayA74Ym37KoCXGSOnXoEBk5Tnb5fTMKJHxq60BW+75TuvEQuntT/Tqm
         X+lLqpS7b6FfjY5+RZnpHUqctGgNPF6mAnM7GA6U3nKnpA5OeiHnficcf2lmLycSyZ+9
         m4GQ==
X-Gm-Message-State: AGi0PubE0vJeliTg4Kb1bbTLuAxn0hZ8/WGf/yRxej5GPqTWG2tjzslv
        cZhZLfUGG5/CqUOi1eLcxaw=
X-Google-Smtp-Source: APiQypIVG5ntpxByj4VpuQirn7n+AhI+45xStyXtk83ebcFqZOjDv7wHeXipdbqhYhw1eGf37Mxosw==
X-Received: by 2002:a37:67c6:: with SMTP id b189mr9289153qkc.188.1588446248756;
        Sat, 02 May 2020 12:04:08 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id p24sm6391558qtp.59.2020.05.02.12.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 12:04:07 -0700 (PDT)
Date:   Sat, 2 May 2020 15:03:54 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200502190354.GA6513@shinobu>
References: <cover.1588443578.git.syednwaris@gmail.com>
 <366a64f80ee9fe1c644ea038ac112ead9766d5c8.1588443578.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <366a64f80ee9fe1c644ea038ac112ead9766d5c8.1588443578.git.syednwaris@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2020 at 12:21:54AM +0530, Syed Nayyar Waris wrote:
> This patch reimplements the xgpio_set_multiple function in
> drivers/gpio/gpio-xilinx.c to use the new for_each_set_clump macro.
> Instead of looping for each bit in xgpio_set_multiple
> function, now we can check each channel at a time and save cycles.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v4:
>  - Minor change: Hardcode value for better code readability.
>=20
> Changes in v3:
>  - No change.
>=20
> Changes in v2:
>  - No change.
>=20
>  drivers/gpio/gpio-xilinx.c | 64 ++++++++++++++++++++------------------
>  1 file changed, 34 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 67f9f82e0db0..67c5eeaf1bb9 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -136,39 +136,43 @@ static void xgpio_set(struct gpio_chip *gc, unsigne=
d int gpio, int val)
>  static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			       unsigned long *bits)
>  {
> -	unsigned long flags;
> +	unsigned long flags[2];
>  	struct xgpio_instance *chip =3D gpiochip_get_data(gc);
> -	int index =3D xgpio_index(chip, 0);
> -	int offset, i;
> -
> -	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> -
> -	/* Write to GPIO signals */
> -	for (i =3D 0; i < gc->ngpio; i++) {
> -		if (*mask =3D=3D 0)
> -			break;
> -		/* Once finished with an index write it out to the register */
> -		if (index !=3D  xgpio_index(chip, i)) {
> -			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
> -				       index * XGPIO_CHANNEL_OFFSET,
> -				       chip->gpio_state[index]);
> -			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> -			index =3D  xgpio_index(chip, i);
> -			spin_lock_irqsave(&chip->gpio_lock[index], flags);
> -		}
> -		if (__test_and_clear_bit(i, mask)) {
> -			offset =3D  xgpio_offset(chip, i);
> -			if (test_bit(i, bits))
> -				chip->gpio_state[index] |=3D BIT(offset);
> -			else
> -				chip->gpio_state[index] &=3D ~BIT(offset);
> -		}
> +	u32 *const state =3D chip->gpio_state;
> +	unsigned int *const width =3D chip->gpio_width;
> +	const unsigned long state_size =3D 32;
> +	const unsigned long total_state_bits =3D state_size * 2;

Hello Syed,

I don't think there's much need for these two variables either. You can
remove the state_size and total_state_bits variables, and instead inline
32 and 64 directly in your code below.

William Breathitt Gray

> +	unsigned long offset, clump;
> +	size_t index;
> +
> +	DECLARE_BITMAP(old, 64);
> +	DECLARE_BITMAP(new, 64);
> +	DECLARE_BITMAP(changed, 64);
> +
> +	spin_lock_irqsave(&chip->gpio_lock[0], flags[0]);
> +	spin_lock_irqsave(&chip->gpio_lock[1], flags[1]);
> +
> +	bitmap_set_value(old, state[0], 0, width[0]);
> +	bitmap_set_value(old, state[1], width[0], width[1]);
> +	bitmap_replace(new, old, bits, mask, gc->ngpio);
> +
> +	bitmap_set_value(old, state[0], 0, state_size);
> +	bitmap_set_value(old, state[1], state_size, state_size);
> +	state[0] =3D bitmap_get_value(new, 0, width[0]);
> +	state[1] =3D bitmap_get_value(new, width[0], width[1]);
> +	bitmap_set_value(new, state[0], 0, state_size);
> +	bitmap_set_value(new, state[1], state_size, state_size);
> +	bitmap_xor(changed, old, new, total_state_bits);
> +
> +	for_each_set_clump(offset, clump, changed, total_state_bits, state_size=
) {
> +		index =3D offset / state_size;
> +		xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
> +				index * XGPIO_CHANNEL_OFFSET,
> +				state[index]);
>  	}
> =20
> -	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
> -		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
> -
> -	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +	spin_unlock_irqrestore(&chip->gpio_lock[1], flags[1]);
> +	spin_unlock_irqrestore(&chip->gpio_lock[0], flags[0]);
>  }
> =20
>  /**
> --=20
> 2.26.2
>=20

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl6tw/0ACgkQhvpINdm7
VJILNxAAizO1hWD+T2Ay9Zlch1hjNpo3iqmseCGBISXOB6SsfaYr0KwfbEpzxbHb
pqVfmPg7JqG/CUiEeXPX74QnAL4aLSRUQXO+Sbm0uPMxcl8mPwsmHhyVqrd0+iJi
lB0boE968Hatex9T6PUOe5O97BvNPOBqL9Us66+ji1Iexrq/4n0KykRSyhrQegFE
h3j5YkrfxgPxYePfDnn+wj5zsA8pgMcfGVFAuDI2jQi/S8px+Z2/NRDQSF8rFB7b
nChHKmhMscEqbChCuFsIOO6Rg65nwTIsDUQbCdFhhruAj8Q1v2fqkbEmTGQiu/nz
luKwt5mphkRoTCZLscYSZBhIjaq+xv14rM9Qn4nDtpun/PH4QRH0/PkJf2eaarJy
M1dMHEvS7vDwTx17YUXcXJy0qfVeBsPgTZxcOtTawO51+JmSPwSGpmvFA9wHb7iA
uT15Ba3IcR66z6nDJkMyzVNVRtZoTEEP200LBzYXvrCOIgypykRBn3edFshct2qo
Yup1vzFG69Z/PtninV3tei5QAqnwWkfyBgnzTUiCa57aPM026uxcoDABHbYDnkxk
WwtWn61px3tW5dRYrpxkgWyQ9YBfTfynQNldh2Ls+Kb+Mka1jIi1UqtTfNJdM73w
T7tYHxdR8b2X0qu3qxWW279D6RP1ied04gqzsfPdMa0RmMxMSe4=
=aFyG
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--

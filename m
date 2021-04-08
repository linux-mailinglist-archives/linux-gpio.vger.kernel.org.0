Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87903581AB
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 13:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhDHLZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 07:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhDHLZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 07:25:17 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEEEC061760;
        Thu,  8 Apr 2021 04:25:05 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id u11so592624uaw.2;
        Thu, 08 Apr 2021 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Oh5VckWZohfZEK8mPjwjs9T2uitl8EFFlzRM7bu3+mg=;
        b=I4lR3jhWA0Czc6cSB5v20+wc/ik1NdQPC8ptPryV3b8E2W4aNS3bwr12cQcTYZHHdr
         0ctJY/6vpUAWknljrJYDtSzvRruCVhoudQKt95BJHsb7VuXxMEb9uIxcSfMPDuv+///i
         2boWlU3JhJcrDZKa4dyeLWP7f7UTALYifsPV/4UylQhqOC/iheusL8boSOxFw9dRVnl0
         U6JEtgLPuARfW/RI7giG0zMSv+xpfzIQPXNo+5hT8wxiEZuhOh3MnS2H6Nqitd0VBGNT
         grPmG7Ppz9Kgy8rQaCoQjNSXROnS/GO5JSNN4Y++m33plvN+251VGhwnq2I5XpiYSL7t
         yoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oh5VckWZohfZEK8mPjwjs9T2uitl8EFFlzRM7bu3+mg=;
        b=uLJqOvoXHYcx76QPbrB5hEzIwEhl7qYV6W9iqKG7RRvlKhuSriTtRBivlIQ0/1h0Mi
         1QL+Wda7XUXN+7DSgkHqS9FVbkYQADERhGnMZaqkLMixX+wFuBqqz4s9XOk9/Ghr7+7Z
         UzXU8a0J1VMcJbJT8ED8GovBWZTETLuTa1dIiyQOSTdCZmyJydrP0oTE6DLfuoIHCP/M
         fdf0+l9kDROY6MjhDLgKv6ikNlp3QObL56/Uz/VN7e8wN9UQzeK+8nkB0QB5lBzLNbze
         laeS8FaX/8vjO+kPOduO6GZ2KQ/QZ5Lxa3LMCaQBOgaw2kXWl13jNFSoSvEqJO/0lo+2
         TN3Q==
X-Gm-Message-State: AOAM530yinXatssM9KOsqDHHWuWJbxg7ySEwC37sdU3BOrwRnsG/e/d7
        h2jiGjirXj+KsmOCKYdNGgEfkhKdL8zsEw==
X-Google-Smtp-Source: ABdhPJyhbo/1XaZ/O4QLbWNt7kOq/vd9sFx9kz0vwkh4KPW5Mk5IGKCiuag8f4bn5xgOJu06ho6rfA==
X-Received: by 2002:ab0:2104:: with SMTP id d4mr5114601ual.105.1617881104746;
        Thu, 08 Apr 2021 04:25:04 -0700 (PDT)
Received: from shinobu ([193.27.12.133])
        by smtp.gmail.com with ESMTPSA id n14sm2697240vkk.14.2021.04.08.04.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:25:03 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:24:48 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Barney Goette <barneygoette@gmail.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpio-104-dio-48e: Fixed coding style issues
Message-ID: <YG7oAA5UljjPE/Gf@shinobu>
References: <20210408024900.1937-1-barneygoette@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3NjGEMkKFEtIs/h"
Content-Disposition: inline
In-Reply-To: <20210408024900.1937-1-barneygoette@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--/3NjGEMkKFEtIs/h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 09:49:00PM -0500, Barney Goette wrote:
> Fixed multiple bare uses of 'unsigned' without 'int'.
> Fixed space around '*' operator.
> Fixed function parameter alignment to opening parenthesis.
> Reported by checkpatch.
>=20
> Signed-off-by: Barney Goette <barneygoette@gmail.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

I am all right with this cleanup in order to pacify the checkpatch
warnings, so you may add my Acked-by line to this commit; however, I do
have a couple comments inline below.

> ---
>  drivers/gpio/gpio-104-dio-48e.c | 53 +++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-=
48e.c
> index 7a9021c4fa48..38badc421c32 100644
> --- a/drivers/gpio/gpio-104-dio-48e.c
> +++ b/drivers/gpio/gpio-104-dio-48e.c
> @@ -49,15 +49,15 @@ struct dio48e_gpio {
>  	unsigned char out_state[6];
>  	unsigned char control[2];
>  	raw_spinlock_t lock;
> -	unsigned base;
> +	unsigned int base;
>  	unsigned char irq_mask;
>  };
> =20
> -static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned of=
fset)
> +static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned in=
t offset)
>  {
>  	struct dio48e_gpio *const dio48egpio =3D gpiochip_get_data(chip);
> -	const unsigned port =3D offset / 8;
> -	const unsigned mask =3D BIT(offset % 8);
> +	const unsigned int port =3D offset / 8;
> +	const unsigned int mask =3D BIT(offset % 8);
> =20
>  	if (dio48egpio->io_state[port] & mask)
>  		return  GPIO_LINE_DIRECTION_IN;
> @@ -65,14 +65,15 @@ static int dio48e_gpio_get_direction(struct gpio_chip=
 *chip, unsigned offset)
>  	return GPIO_LINE_DIRECTION_OUT;
>  }
> =20
> -static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned =
offset)
> +static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned =
int offset)
>  {
>  	struct dio48e_gpio *const dio48egpio =3D gpiochip_get_data(chip);
> -	const unsigned io_port =3D offset / 8;
> +	const unsigned int io_port =3D offset / 8;
>  	const unsigned int control_port =3D io_port / 3;
> -	const unsigned control_addr =3D dio48egpio->base + 3 + control_port*4;
> -	unsigned long flags;
> -	unsigned control;
> +	const unsigned int control_addr =3D dio48egpio->base + 3 + control_port=
 * 4;
> +

This empty line is not necessary and can be removed.

> +	unsigned int long flags;

This is "unsigned long" so I don't think there is a need to change it.

William Breathitt Gray

> +	unsigned int control;
> =20
>  	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> =20
> @@ -104,17 +105,17 @@ static int dio48e_gpio_direction_input(struct gpio_=
chip *chip, unsigned offset)
>  	return 0;
>  }
> =20
> -static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned=
 offset,
> -	int value)
> +static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned=
 int offset,
> +					int value)
>  {
>  	struct dio48e_gpio *const dio48egpio =3D gpiochip_get_data(chip);
> -	const unsigned io_port =3D offset / 8;
> +	const unsigned int io_port =3D offset / 8;
>  	const unsigned int control_port =3D io_port / 3;
> -	const unsigned mask =3D BIT(offset % 8);
> -	const unsigned control_addr =3D dio48egpio->base + 3 + control_port*4;
> -	const unsigned out_port =3D (io_port > 2) ? io_port + 1 : io_port;
> +	const unsigned int mask =3D BIT(offset % 8);
> +	const unsigned int control_addr =3D dio48egpio->base + 3 + control_port=
 * 4;
> +	const unsigned int out_port =3D (io_port > 2) ? io_port + 1 : io_port;
>  	unsigned long flags;
> -	unsigned control;
> +	unsigned int control;
> =20
>  	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> =20
> @@ -154,14 +155,14 @@ static int dio48e_gpio_direction_output(struct gpio=
_chip *chip, unsigned offset,
>  	return 0;
>  }
> =20
> -static int dio48e_gpio_get(struct gpio_chip *chip, unsigned offset)
> +static int dio48e_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct dio48e_gpio *const dio48egpio =3D gpiochip_get_data(chip);
> -	const unsigned port =3D offset / 8;
> -	const unsigned mask =3D BIT(offset % 8);
> -	const unsigned in_port =3D (port > 2) ? port + 1 : port;
> +	const unsigned int port =3D offset / 8;
> +	const unsigned int mask =3D BIT(offset % 8);
> +	const unsigned int in_port =3D (port > 2) ? port + 1 : port;
>  	unsigned long flags;
> -	unsigned port_state;
> +	unsigned int port_state;
> =20
>  	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> =20
> @@ -202,12 +203,12 @@ static int dio48e_gpio_get_multiple(struct gpio_chi=
p *chip, unsigned long *mask,
>  	return 0;
>  }
> =20
> -static void dio48e_gpio_set(struct gpio_chip *chip, unsigned offset, int=
 value)
> +static void dio48e_gpio_set(struct gpio_chip *chip, unsigned int offset,=
 int value)
>  {
>  	struct dio48e_gpio *const dio48egpio =3D gpiochip_get_data(chip);
> -	const unsigned port =3D offset / 8;
> -	const unsigned mask =3D BIT(offset % 8);
> -	const unsigned out_port =3D (port > 2) ? port + 1 : port;
> +	const unsigned int port =3D offset / 8;
> +	const unsigned int mask =3D BIT(offset % 8);
> +	const unsigned int out_port =3D (port > 2) ? port + 1 : port;
>  	unsigned long flags;
> =20
>  	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
> @@ -306,7 +307,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
>  	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
>  }
> =20
> -static int dio48e_irq_set_type(struct irq_data *data, unsigned flow_type)
> +static int dio48e_irq_set_type(struct irq_data *data, unsigned int flow_=
type)
>  {
>  	const unsigned long offset =3D irqd_to_hwirq(data);
> =20
> --=20
> 2.25.1
>=20

--/3NjGEMkKFEtIs/h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmBu5/YACgkQhvpINdm7
VJK5lA/+PARqvDPVR3XIR4CACnXlAu03T6XEIwXreM98u2kOF7AmL6DeMx6UCvhJ
WDspMPot/eGYuhUZfmlIplcZAFDs8wYksQIqhsvtDmDSJLfWO5Ozvv6HdtCGbbDM
aphg6mdYfKOiDNwvoSeiQaUYwMgqIxWntGfqHoZQlWNfB5SyieSS/iMpl9H7Xbcg
cKe4cNbxoyYgteYKTLEpEUsfS7zrfi6h8DZAA35Xb6LUH3w0cWUFCYdS0IGSXQCI
Vbn+AbV2GVtmQWOEafR5rKsEECko+WbnYBIaBIQrEYKJPkvtZ/R7pqSzO9Ek+Lrq
ChyHSIko/9toUg+TeeyAd5v8m+SP10kn5ZUOtezXEubrorgCZnkI/JPWnKz2LwrI
gi7GADc4Y1UNkSCd//3Bk2MdjUZDFrHMFhOSljJeHakBaPsk4fICKXGc3UBKJW5X
NM/mNND7Lle77EhXUT1ittUT3HHszABSjFTg4EwvQjrfW4OZzSHDwHBbuvn/nAC2
7qol9uDSYv2s08bSsMV2mLfXCGtQyCQmUYcjBco5XM9F9cXyD7P9FPXXiU6SGkwn
mNJo08KFrOyr4JpmbXciq3dSBuS6JGao+fy8V5ab3SAxYKzScWa9E5MIVKrp2SWr
XJU/ayDpS0NeGNvaD6edBY1hhKxG0JOFNEuu3QmEcRDRZMrHufI=
=K8Pm
-----END PGP SIGNATURE-----

--/3NjGEMkKFEtIs/h--

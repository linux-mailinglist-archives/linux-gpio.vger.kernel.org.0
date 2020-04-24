Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B46C1B7798
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 15:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgDXNzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 09:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726301AbgDXNzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 09:55:52 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06675C09B045;
        Fri, 24 Apr 2020 06:55:51 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id s63so10184703qke.4;
        Fri, 24 Apr 2020 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0nELBLZup0s5D1l0Lv39Pqz1btCovto3LKkmzE5O0+w=;
        b=eo/CklfQwdjbJROv6WH8PW6uO9wFkpbUcBox0L1RitBiDj87hf2e94X7/YajUdB9hY
         f/eMhEGXetxB1YrKuF4wLNdhjNWVga0YmioO8CwiH0uDJsBEFoXxN4NmRXfwO3RkAXFI
         CffzGNga2pEomFdprTyBBAVPLXzx65lLLYMKKvXgEh02WIl/kwkuMm7O6bZ8DeWblile
         THaSCaZJ12j2b31pX3mVbydeofpsBQ9MBemhvGVioiMt+Mt97mo+GUTLPd6nGt5ZvjB8
         plesxp4MSPk6b1XBqpMVA9nkHwLL/mmV5u1u9lnCKz6+cAEq5cVe2rXLzHmI2IWkifC0
         dXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0nELBLZup0s5D1l0Lv39Pqz1btCovto3LKkmzE5O0+w=;
        b=d2rMg53aA6is2cZsEYrJ7RUVAoN6tYsS2FFXUQEXEXDnQZvBq7ua1bEOui9lQaPX/9
         LRel+6IwiFNezX2cqzhv8pchavy5LFWmlFz76QwxQSO/h6N/1xKnoCVn8zg6RbQ65gAg
         oQFY9aUW2Y2dKBjs/27bSLHQIX6Gk8h/DjINfw80U6VlmY2yndYvnX1c1Yx2Llh9dFRH
         Ds1Tq73XMwsmftjN/lduWUiOZL8jwD26HccPndhSy1deScB9sq0oqiaUIbMotTBTLYYs
         X8DNVyWm+WadJuYIbm04LsUxRJWmrZX4a124Kddm345niDCtuwcirOzhEaC82BhFsHuv
         nh4Q==
X-Gm-Message-State: AGi0PuaHwCO/m+44KfLs284vPqKkmPmDMb79nNKaizRO13AOPmiac1K8
        3wgLDIrXYetLsGrot2Ds20X3KBb0gp6aFQ==
X-Google-Smtp-Source: APiQypIR5FVhNg4j6f5oUEc6Tpr/lQCwmz0mLuwo9n/RE6PP4h34A7xiJvb1Hm+Is636H9iQmFGacg==
X-Received: by 2002:a37:4d43:: with SMTP id a64mr9203064qkb.491.1587736550183;
        Fri, 24 Apr 2020 06:55:50 -0700 (PDT)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id c41sm4013966qta.96.2020.04.24.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 06:55:49 -0700 (PDT)
Date:   Fri, 24 Apr 2020 09:55:47 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <20200424135547.GB3255@icarus>
References: <20200424123050.GA5653@syed>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <20200424123050.GA5653@syed>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 06:00:50PM +0530, Syed Nayyar Waris wrote:
> This patch reimplements the thunderx_gpio_set_multiple function in
> drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
> Instead of looping for each bank in thunderx_gpio_set_multiple
> function, now we can skip bank which is not set and save cycles.
>=20
> Cc: Robert Richter <rrichter@marvell.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/gpio/gpio-thunderx.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> index 9f66dea..74aea25 100644
> --- a/drivers/gpio/gpio-thunderx.c
> +++ b/drivers/gpio/gpio-thunderx.c
> @@ -275,12 +275,16 @@ static void thunderx_gpio_set_multiple(struct gpio_=
chip *chip,
>  				       unsigned long *bits)
>  {
>  	int bank;
> -	u64 set_bits, clear_bits;
> +	u64 set_bits, clear_bits, gpio_mask;
> +	const unsigned long bank_size =3D 64;
> +	unsigned long offset;
> +
>  	struct thunderx_gpio *txgpio =3D gpiochip_get_data(chip);
> =20
> -	for (bank =3D 0; bank <=3D chip->ngpio / 64; bank++) {
> -		set_bits =3D bits[bank] & mask[bank];
> -		clear_bits =3D ~bits[bank] & mask[bank];
> +	for_each_set_clump(offset, gpio_mask, mask, chip->ngpio, bank_size) {
> +		bank =3D offset / bank_size;
> +		set_bits =3D bits[bank] & gpio_mask;
> +		clear_bits =3D ~bits[bank] & gpio_mask;
>  		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO=
_TX_SET);
>  		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GP=
IO_TX_CLR);
>  	}
> --=20
> 2.7.4

We noticed in the original code that this set_multiple callback does not
appear to work correctly on systems where BITS_PER_LONG =3D=3D 32. On those
systems, the bits and mask values are 32-bit, but the for loop jumps 64
bits at a time -- that means the loop is skipping the upper 32 gpio
lines of every iteration.

Is the gpio-thunderx driver only intended for 64-bit systems? Or this
behavior a bug?

William Breathitt Gray

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl6i7+IACgkQhvpINdm7
VJJJ3g/+JasEZX7QcLN4AyHOdz21hlsLd6YpzdrSHjuSozMOoe4wmQsLaZ3fIvMc
SAVdRMuKMtHxbDJrXyRIjvSB5h9Vk7iRt5l/CNawV38gnqaIgm25NLfRgFb6hUW3
zxihXU6l3pSvx2ddyGLC2pxEliZe50Dba8m7D/KQnXu3CZLexk4BRdhyUZXvgDDB
j1AbJGpISfdXGiD9A6bi6fmGj98+VusLQG71nN3NludQbTA6Sh8PzyyVs9zz72Ba
nI628LxR+9057u0Jz3tWM9/8lxAqsFbHQyAnxBAo47KCgZvjtglMsWgqjT/sPqoY
7ni1fYKcNyJgU2vAAkrxy7n3wFJty3/l/n53bqlR2DDFQ7HHKTC3S6tCeAIYLw8q
MuYMNvmS3FdOd+cuj8+p1K15jlLcsYc/jz62piHgi9y59PE42aF5iyug4pXBC7Px
RWokxksL9AszWvTan5fy09H1KQ8ZNufoqHsofIwRLPMb3sGIEETW1XCAMjkDfJcB
5bPe+hXmOo35sRlpcqA7xg8d+UGrvmQh79hRAqa/9t08TjcEWj61XcXuz3hkPgeS
xu3BfTGZSZF9/kEubfWqyPJ3MBe1iqqXeqyHruj097axD2SX7Leov6Ue0a4XKu9u
v4BDQSmn7Hb6xdu0NWW8YYYxEh3eTKltY+hb3hvb3EeMWokV7CU=
=0274
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--

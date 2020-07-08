Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9358B218813
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 14:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgGHMyn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 08:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgGHMym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 08:54:42 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD6AC08C5DC;
        Wed,  8 Jul 2020 05:54:42 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c30so37450896qka.10;
        Wed, 08 Jul 2020 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FigRipMzj+8SYJPiAiqqyolx+NOkjpAqI8ePBffI6HY=;
        b=IIKIEat+iMxiT0kEcRgY5YSOHkj0N3SuRUV1+LclSBDx3uZVBP3BDNGOThWWj2Y29f
         McLpZKmSl/hzEwKXssf+r9f416f0ZqUDgnF5vvdND9ZOAAgbHl7FV4SlOoU+f700G1sA
         perj+d7hQgWl43AX2PNZGx4paANP8Ur1x+Fn4gHqPHB00AvHUPJcllqmd+RB14PKgmhH
         xBaSB+HJQ8mnz3uU2hRoYNfNqGQpOgJ7ljtN6W4/kCKnsUYATmqTXaXJVy+VDy/V6O2B
         DXVBUSCt/n38jILCWslY1+kOnHMpDK/Fv5XlvsSis3J5HWeo4nes7BGWcQzCZIlWqplS
         L+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FigRipMzj+8SYJPiAiqqyolx+NOkjpAqI8ePBffI6HY=;
        b=HnQegnQ3XL7jo5dbGwBylemwq6bQXLVOnPStkabdCQj1VB9fBc3ViQF/ODWme1ynGg
         5ZDOSPXLavDj3SIqST0JuTBWUk4/LJgUIln1KT4Qp81vKOYkQhVw/eSwmDFME1J/DP9t
         vqP9klwCndo3o+gV/rnxcRJCdBW0tkWV5mWyWnaVeQhQ8NPMbTmOdVhpY4wyKO4S21Et
         0pbwFyYZuymgDKZ9M2sU/2UrDp4CNRSspa8dzHM3WVCHjszduYGcx8McoWqQGmMJ3O3r
         9UayuLcTyCmuHlg4q5rhlkoZvXiKCsGbaNav9mKE2HC9UEuX+IaP0mryO3RQcV89UElg
         8s1A==
X-Gm-Message-State: AOAM5317tFGGNQCJ3DYU2QHVvBlJEpcji0XMTmIZ2mdFd9SFfpR9IQC4
        VSP/W1vkB9+TyM4DBoAt9Sg=
X-Google-Smtp-Source: ABdhPJxpfU40MOta06TYylM+gnexyvbyJllDVPOy6Usi9QNIUqgJ8fkew4TsiwuNfG0eH9LrbGTRnQ==
X-Received: by 2002:a37:8b07:: with SMTP id n7mr52779086qkd.98.1594212881808;
        Wed, 08 Jul 2020 05:54:41 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id x26sm27454404qtr.4.2020.07.08.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:54:40 -0700 (PDT)
Date:   Wed, 8 Jul 2020 08:54:38 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value.
Message-ID: <20200708125438.GB5221@shinobu>
References: <cover.1593243079.git.syednwaris@gmail.com>
 <0a35c10d1613aff43038bc7d4d6f95061d9d80d3.1593243081.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <0a35c10d1613aff43038bc7d4d6f95061d9d80d3.1593243081.git.syednwaris@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2020 at 01:44:23PM +0530, Syed Nayyar Waris wrote:
> This patch reimplements the xgpio_set_multiple function in
> drivers/gpio/gpio-xilinx.c to use the new generic functions:
> bitmap_get_value and bitmap_set_value. The code is now simpler
> to read and understand. Moreover, instead of looping for each bit
> in xgpio_set_multiple function, now we can check each channel at
> a time and save cycles.
> ---
> Changes in v9:
>  - Remove looping of 'for_each_set_clump' and instead process two
>    halves of a 64-bit bitmap separately or individually. Use normal spin_=
lock=20
>    call for second inner lock. And take the spin_lock_init call outside t=
he 'if'
>    condition in the 'probe' function of driver.
>=20
> Changes in v8:
>  - No change.
>=20
> Changes in v7:
>  - No change.
>=20
> Changes in v6:
>  - No change.
>=20
> Changes in v5:
>  - Minor change: Inline values '32' and '64' in code for better
>    code readability.
>=20
> Changes in v4:
>  - Minor change: Inline values '32' and '64' in code for better
>    code readability.
>=20
> Changes in v3:
>  - No change.
>=20
> Changes in v2:
>  - No change
>=20
>  drivers/gpio/gpio-xilinx.c | 66 +++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 67f9f82e0db0..48393d06fb55 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -136,39 +136,39 @@ static void xgpio_set(struct gpio_chip *gc, unsigne=
d int gpio, int val)
>  static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			       unsigned long *bits)
>  {
> -	unsigned long flags;
> +	unsigned long flag;

Hi Syed,

I have a couple minor suggestions in case you submit a version 10. Leave
this variable named "flags" because it refers to CPU flags which will
likely be more than one flag anyway.

> @@ -292,6 +292,7 @@ static int xgpio_probe(struct platform_device *pdev)
>  		chip->gpio_width[0] =3D 32;
> =20
>  	spin_lock_init(&chip->gpio_lock[0]);
> +	spin_lock_init(&chip->gpio_lock[1]);
> =20
>  	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
>  		is_dual =3D 0;
> @@ -314,7 +315,6 @@ static int xgpio_probe(struct platform_device *pdev)
>  					 &chip->gpio_width[1]))
>  			chip->gpio_width[1] =3D 32;
> =20

Remove this whitespace as well.

Thanks,

William Breathitt Gray

> -		spin_lock_init(&chip->gpio_lock[1]);
>  	}
> =20
>  	chip->gc.base =3D -1;
> --=20
> 2.26.2
>=20

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8Fwg4ACgkQhvpINdm7
VJJ8kQ/+L3sMhxucxZch0OlspO/vaRblsi64ksYyIrx0pKKuHqq4OQ5cLqgdLdn1
cGkSm7WwfA+Zj+o2E3KrPMkJH8ZFSG4c2IKkzQ9A8lW7rjdfuvdYbQSDIJ6ztjnp
siys93AM00j4+D5+ugvNTVYMeJKPRUjXPHpGmOKKemuq8N8h3tSw1lgYoNi3deI0
FgXJmi/PuF8LGETmRyBpdn2X/ROU5M8iilm5j+y0BmsN+DF9M1MINL0aLvQXeSXk
H3KZ7LlDKCOPR7fi0BQFjzeaTpYBOvjpTvudTLtnHVsL6IxkczCu4o4nvHd8agms
hS0vX5+QUZ4p26f3uqiTV0S7xK0Bf1Ig4WiY8YMw52QOedY275blmah7feD3CmkW
FHDeiPZ77DXfaHGcUeqeMpIotsJNQTkoRgjgI+l2PampcCUIrRhWZf6sGFBTOEao
Y4qA2woZYaQ7SFqdL98OhzLyhgzjcO1zrPFaUwdE84HT89aCPpZfMPmR2NhfoDiW
agOYRI8bYlN1j5vX4GVAqAzrzKjYFO5judhkb5UuDZ3ft6r/geNeSZzTTQoPQnx3
FtAjnCPTA9arJqAsA43xZIhGV6nT/n7zrxM+zdel3EB6LbTI0mRY1lbOL6WJ9rl2
ToIeFx1shURZcjnGBA+vYK8sSp/Kj6EFX53+wG1MBmZ0qHJcwao=
=xP7Y
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--

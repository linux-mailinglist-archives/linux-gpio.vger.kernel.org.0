Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD77630917A
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jan 2021 03:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbhA3CJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jan 2021 21:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbhA3CHH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jan 2021 21:07:07 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074DCC0613ED;
        Fri, 29 Jan 2021 18:05:18 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id j12so7344899pfj.12;
        Fri, 29 Jan 2021 18:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ha7cDz5klKkhTpo5euIGmAiyN3F0x/AzncqZSAgqejk=;
        b=gXR8TWL/GSbd+BTSOP7hYzzftfT6KysHK8MDtcvvrv7lkJwp6yDYfopWO2YQtSFU/z
         qCbuQWYuQLiEZwNsg3CYEffQ7uaPbZaAgGYGVFAAfqG0vvF1JjM+xw1HxpILhoVSnzrA
         EykpOAobH6zmXt6HEo9kpDu0g6SFLJfn7tMylftAHI8hIIluwA0+djpJIK6VuIgqr+BL
         AvPb7LwunNl57GE7hk8NrZKwfbcf2HnF2bP/IhPGmGJpQPIXrEB2w6qZizc162ww5bHc
         oS8BfU6429CXAjnLRlHqmaYwCKhHabOzkLV0n31o4tQ0L5/Xq7Xj8MR2BdbrGXCcexZH
         wYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ha7cDz5klKkhTpo5euIGmAiyN3F0x/AzncqZSAgqejk=;
        b=HAfCM1z66SRBiZhDOyDa7SxlGgYHP0A8/R8TyGGMUm1t6eoHFCMMNUW8RXZth1pHIO
         o9uSTvCLWGacb8cZLLiOQdLEleCAD1D+UW2UKaAfF/x2Xp2ywdq1mbUG7ngm9sIIpvxc
         v4m4YWaX8VEb4q0oz7t0iJ/Mn2o8IjYEFtmV93J+4xsquvqW2WFgG84SyBWjvVf30/Cb
         X/EiNzkb7qM7M9SNoxgQODvctJ68p9ketlrtUsZq6saKMiLdErq/zrNslTyssBWoNthm
         AZo/smMV5epXdtaIEuUDKDhv84g0Ys4KtOuhB2XfmZbIDiUeINZF9skz0bitI85otGPX
         yOQg==
X-Gm-Message-State: AOAM530QsUc/S0ow40dR0dS/ekVCYx5vDTF7KEV3S+9pWig3X8ZFd0ly
        DFbq6UDXJ/sialrV0o0W5ReN45gyn7m//g==
X-Google-Smtp-Source: ABdhPJx0EIXCj480w9Vp1E2CYYaLdZyMWKfY3IJeVtmActSGPlYN2Ja1peCL+8dcxWIfJ8557FG1Tw==
X-Received: by 2002:a63:34c8:: with SMTP id b191mr7133032pga.405.1611972318297;
        Fri, 29 Jan 2021 18:05:18 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
        by smtp.gmail.com with ESMTPSA id q15sm8101034pfk.181.2021.01.29.18.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 18:05:17 -0800 (PST)
Date:   Sat, 30 Jan 2021 11:05:08 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com, syednwaris@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH V5 5/5] gpio: gpio-xilinx: Add check if width exceeds 32
Message-ID: <YBS+1EljcGLDq8U+@shinobu>
References: <1611930410-25747-1-git-send-email-srinivas.neeli@xilinx.com>
 <1611930410-25747-6-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5ks6C7Cgywkx2xlR"
Content-Disposition: inline
In-Reply-To: <1611930410-25747-6-git-send-email-srinivas.neeli@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5ks6C7Cgywkx2xlR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 07:56:50PM +0530, Srinivas Neeli wrote:
> Add check to see if gpio-width property does not exceed 32.
> If it exceeds then return -EINVAL.
>=20
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
> Changes in V5:
> -None
> Changes in V4:
> -New patch.
> ---
>  drivers/gpio/gpio-xilinx.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index acd574779ca6..b411d3156e0b 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -589,6 +589,9 @@ static int xgpio_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
>  		chip->gpio_width[0] =3D 32;
> =20
> +	if (chip->gpio_width[0] > 32)
> +		return -EINVAL;
> +
>  	spin_lock_init(&chip->gpio_lock);
> =20
>  	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
> @@ -613,6 +616,8 @@ static int xgpio_probe(struct platform_device *pdev)
>  					 &chip->gpio_width[1]))
>  			chip->gpio_width[1] =3D 32;
> =20
> +		if (chip->gpio_width[1] > 32)
> +			return -EINVAL;
>  	}
> =20
>  	chip->gc.base =3D -1;
> --=20
> 2.7.4
>=20

--5ks6C7Cgywkx2xlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAUvrwACgkQhvpINdm7
VJJ4nxAAzRkaHQUnewnwSrydk2mHrYamMVGPzFWsrG5heOgcxrEaAbJ9rOwBatxf
dD7LHpGbskMBf00hNxa7iUOjBUFAje2upwxTtlNRjguNzufAGvSlmk4EVC7PKndp
1fLAgx3Id7tXhfPIxcYxfcXNB+gtdfN/LLzPj0kNEXButa+gP28o70WcRNdiHnq0
2j0zb/GGzGF9asVrYD5GlGUGyMNEMHLZO7SPTAvZZgAzjGK9zzYjbZqNvTKOXocZ
l0WTrm9H1TqSXeC0nSRQjAmB8TyKPuiSVXCmIag8GZGqw3l9l5YT6095eLu0kH8Z
dP6ffXa56z/gwURT2cjr38862tRdAmGetpe5lynOKJYgosUTgsgvmZ809QtRUr7d
oX7t7CAkOi71h3crUFwPacaxqtlyXL/75nfBksCVfsmMBZvWDS+xGuMNYwRb27R8
lEPzZogvr1LLZ9BtJkHK8p1B/9M2d0hPCEXLiLxqGcVyXml2m1xAamTO6JEvLNmi
OdDZSs9NqHtF0tg8C2+VHhGk12urEp3xMU2BnEX8iHOZ7LvGNkAUpfdP6I8pbpE4
1xx5DImBicQ4M7vI9w2M0058rPuwkSSVMOcRpmeXkjg9LezpWevT6hq/rrOEIhWo
fKFpB1KKoMYZl92sK1D4p1mjINxbNI9Mn0zUtIQp4shRE2A59Z8=
=utiP
-----END PGP SIGNATURE-----

--5ks6C7Cgywkx2xlR--

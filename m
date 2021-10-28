Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47EB43E429
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 16:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhJ1OuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 10:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhJ1OuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 10:50:00 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E8AC061570;
        Thu, 28 Oct 2021 07:47:32 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so1238641wme.4;
        Thu, 28 Oct 2021 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I5Bet0R+OjkCRvvzkiFO2gNiYpCesc+RRed2o3q0Pn4=;
        b=R1P5A1TDoPIGnG87dMlW5m/mvpF2ouGzMdwUb7B/d9IT8y5r9NGAhuf5h4scr0U3Aa
         RSsCncvbuHPhKJYC118/e7TnusfF4QAJmACgbPzBP+5HDiNz0NyGM3LMGG4iNh5PEw6/
         rJnypNV6ld2msVdpYCIVtekmEtcBjRNRy5OxCBHbTKNR3pqbvbuVrhwyp38W75tleXoM
         h9LrRq9DmD0drcmPOfxHrHj1bW9dixm8uTgWNLvQypR+97zoAaQC77GTNp6aFHapGKvb
         wwjNzyE4vaBJqI/qRqA7qH0d95cgE/1obz3rLj+iX6/+XcOnZVsNIM/clCA/h4D6wxE8
         PlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I5Bet0R+OjkCRvvzkiFO2gNiYpCesc+RRed2o3q0Pn4=;
        b=v0MV1p/F6LbKa17/8p0lBOr2AD/mfCRlm/aIXjM03KSDoY2xy/epRJiNpSFfS0xwFj
         0m9IIvFH7twpb1Nk6c8o/xEFc5X/EDrx9IrBa6eDA6i0xhGmdyS45GtYMWIM0/QFetjo
         cxGlnjJnh/kl4y9NzX1kTvjj0k4e5nJop01p89E5/0NXqEH8z+JRUa7sz2BTmLAk7C+A
         yyFOFdaF65jimO/wHLDxyoLLr0SINoi5wGNjR5OckVoqa9GIWTnCnJf3fRBfUGrhH1Wo
         DK6GtBxBwA8mRpUFQnJEgZA8++7Z0fDuatY3vHIDfAPcLZqCg5gBoELmvhNipBhueO8Q
         f75A==
X-Gm-Message-State: AOAM532ps6DdhFBdmP3n3rcdv4G8MZNWc1q0DLyrmRtiroKdUWUMkFZp
        Lcu5X3kYAcbFSuzuykujypEc/BYAbtwwRQ==
X-Google-Smtp-Source: ABdhPJz5eF/l7nbotdTvE8haTa2LL+jlt98/1RN9rhkfWlMmOAMzzZstKJL+mkabMBsD+mh6LWIOdg==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr5152097wmr.136.1635432451444;
        Thu, 28 Oct 2021 07:47:31 -0700 (PDT)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l124sm6881388wml.8.2021.10.28.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:47:30 -0700 (PDT)
Date:   Thu, 28 Oct 2021 16:47:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
Message-ID: <YXq3/1AXX7KiwpTy@orome.fritz.box>
References: <20211021123021.9602-1-pshete@nvidia.com>
 <20211021123021.9602-2-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iS6lgSRrM0W6rQOm"
Content-Disposition: inline
In-Reply-To: <20211021123021.9602-2-pshete@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--iS6lgSRrM0W6rQOm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 06:00:21PM +0530, Prathamesh Shete wrote:
> Add support for the Tegra234 GPIO bank configuration.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 74 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index d38980b9923a..edcc91b35e1e 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -14,6 +14,7 @@
> =20
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
> +#include <dt-bindings/gpio/tegra234-gpio.h>
> =20
>  /* security registers */
>  #define TEGRA186_GPIO_CTL_SCR 0x0c
> @@ -877,6 +878,73 @@ static const struct tegra_gpio_soc tegra194_aon_soc =
=3D {
>  	.instance =3D 1,
>  };
> =20
> +#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> +	[TEGRA234_MAIN_GPIO_PORT_##_name] =3D {			\
> +		.name =3D #_name,					\
> +		.bank =3D _bank,					\
> +		.port =3D _port,					\
> +		.pins =3D _pins,					\
> +	}
> +
> +static const struct tegra_gpio_port tegra234_main_ports[] =3D {
> +	TEGRA234_MAIN_GPIO_PORT(A, 0, 0, 8),
> +	TEGRA234_MAIN_GPIO_PORT(B, 0, 3, 1),
> +	TEGRA234_MAIN_GPIO_PORT(C, 5, 1, 8),
> +	TEGRA234_MAIN_GPIO_PORT(D, 5, 2, 4),
> +	TEGRA234_MAIN_GPIO_PORT(E, 5, 3, 8),
> +	TEGRA234_MAIN_GPIO_PORT(F, 5, 4, 6),
> +	TEGRA234_MAIN_GPIO_PORT(G, 4, 0, 8),
> +	TEGRA234_MAIN_GPIO_PORT(H, 4, 1, 8),
> +	TEGRA234_MAIN_GPIO_PORT(I, 4, 2, 7),
> +	TEGRA234_MAIN_GPIO_PORT(J, 5, 0, 6),
> +	TEGRA234_MAIN_GPIO_PORT(K, 3, 0, 8),
> +	TEGRA234_MAIN_GPIO_PORT(L, 3, 1, 4),
> +	TEGRA234_MAIN_GPIO_PORT(M, 2, 0, 8),
> +	TEGRA234_MAIN_GPIO_PORT(N, 2, 1, 8),
> +	TEGRA234_MAIN_GPIO_PORT(P, 2, 2, 8),
> +	TEGRA234_MAIN_GPIO_PORT(Q, 2, 3, 8),
> +	TEGRA234_MAIN_GPIO_PORT(R, 2, 4, 6),

I stumbled across an old patch I had created a couple of months ago that
is very similar to this one. However, at the time I had added a couple
more ports here, namely S, T, U and V. Is there a reason why you're not
including those here?

Thierry

--iS6lgSRrM0W6rQOm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmF6t/sACgkQ3SOs138+
s6GDkhAAjPsr2qma9X2pR1YFSFis3qLvOKm1liz8t4WqKFI+AbWHi551aqi+gvDb
E+U8g3kxdwpEa0xRPc6HAGmP+SJR3PYsXHUt6g6GCMohDSASMZJnPxqX4Lks7FHq
Si247nbXJHeFuhJC6EGtW8b8gNKYfLW9A2J3i34X9hVn4Aq3XkV83IMSrATczvgQ
UD2CKY+cVsBYnu/F3y9mObzuKxscyLJsRweryiwqMk99RaYPW5n9zklIfsSeBOcl
HOjEaFTxgAN4wT3G1yjeRIhjov9mLHS3SHK+GY19l0sYRkelvpE3U9hOivoOYX+Z
JQbYEhtk3GhL2ulxxOBNkkpnq0uBoqwTYrVkfK90wgMQ2WgmFs30tqkaZ8keIGxa
r/v0YTtSdj11p+E4r5f9fkD6Z040vl44AgHZomrDuYrxiZUXW5+I13yYXxVKcAyu
/hKE3CC5Z5byT3V7msTPSqAXRfhZb31jiORaMuCoLTDORvbW5vORx09FH5JYz8lv
eb1nIS2BOMrkUgzXNQ2TEtiw7gAHWorzPbIsV6EZPAZ0ksvQ9gH+QXq7FXAzCN8S
8mlLJq8N+mNz/Va69QZH/0VyqLnWl4VY/rurIN57WUU0p5i2/wZBPzdq/ugaVRou
xzeyi87WkQpiekYuyV2MM+BtOzu1w3B1aCpB+HrOYhdEF/PwRe0=
=p+Cd
-----END PGP SIGNATURE-----

--iS6lgSRrM0W6rQOm--

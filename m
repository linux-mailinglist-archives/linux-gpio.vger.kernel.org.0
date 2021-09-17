Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070DF40F634
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 12:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241138AbhIQKsl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 06:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240486AbhIQKsi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 06:48:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D18C061574;
        Fri, 17 Sep 2021 03:47:16 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso6587331wme.0;
        Fri, 17 Sep 2021 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iCw4+IxAxvyU7nzm5YQ8bVS9L5c+G6GvKi5TnnSw9Jc=;
        b=HL6I1MjxrfkWbfJuHnenAK0UPCEsD5fcsxo8fLQhpkzDiTrZ2KVvN8+uOxp6bjGVi0
         cP9Jw9mOeeAiKOe9UTdRcSuzZojsaFSycJbJ8hA3dCfUE4XLLIoQ0ChTftBWvOEq8kMA
         gtBHnMu3nw14GvBzDA8w4E5xUXvZTp4NH47UmQ2QxtAfC4/Ay4LNgg2ns00l9vO55AV2
         N7Ziq4nKUUHZqqowfi4jyTZ/xeQgyC7dGD4JPsQAW7gLVXeYCzisEiSxhrtAgfMAo3JR
         MPsj+KFmtdN4+u+ZPoHfhwsSlXJcjXrgcUP4n7R2m48ALVY7WOqrgr0zF1Rj0WR7fqgx
         yPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iCw4+IxAxvyU7nzm5YQ8bVS9L5c+G6GvKi5TnnSw9Jc=;
        b=AKJ5/QNV1GavcooJVsYOn8syz+AtDkOnPmNqjykYEoEVToxXO88CNPSipKM7wK1w9g
         SCmRLBW48ul7VboiNio8MhF+/148lKT/Y0Ah0AbLaIuxBTbWRaKeM4UtGZYgaow7NBHv
         yMDjJXmTvyX4b17iNpuJTc3z3craZ95VPxxYjLvc9TgaAJ3g9JkTo5CcrO+eSN7il55j
         pdHShoElEMlNbmMVnwGdg1ja8BM8CB0Ch1QXQwQi9/AScc9HZZoQoy1X7T2CpIPLi4Iy
         951WNoocUPneI19rdbaxwl6r71N5PVnXNVpvV6rKodf6M6dQK6ps3FsJmC0ARlS/uLEA
         E+LQ==
X-Gm-Message-State: AOAM531TBEifYuYbxeV03H/+LLUlvpkM6tnFIiyySpDKH23F+V9hvqZU
        CJXPhuACarY3dI6l+4zX6KY=
X-Google-Smtp-Source: ABdhPJzHY1ulKmDh7+GL/X/DNZciUgmduLjrkLrePJrWZSbKesfWDfGr8ypwEkCo9l8iVuE7FLIzNg==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr9453593wml.109.1631875634906;
        Fri, 17 Sep 2021 03:47:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u13sm6517315wrt.41.2021.09.17.03.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 03:47:13 -0700 (PDT)
Date:   Fri, 17 Sep 2021 12:47:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH v3 1/2] gpio: tegra: add multiple interrupt support
Message-ID: <YURyMAsWVYH+/0UI@orome.fritz.box>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073224.3070-1-pshete@nvidia.com>
 <20210907073224.3070-2-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HnxrYzzyqk5bRhw5"
Content-Disposition: inline
In-Reply-To: <20210907073224.3070-2-pshete@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--HnxrYzzyqk5bRhw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 01:02:23PM +0530, Prathamesh Shete wrote:
> From: pshete <pshete@nvidia.com>
>=20
> T19x GPIO controller's support multiple interrupts. The GPIO
> controller is capable to route 8 interrupts per controller in
> case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.
> This is new feature starting Tegra194
> The interrupt route map determines which interrupt line is to be used.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index d38980b9923a..c1172da9aebf 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2016-2017 NVIDIA Corporation
> + * Copyright (c) 2016-2021 NVIDIA Corporation
>   *
>   * Author: Thierry Reding <treding@nvidia.com>
>   */
> @@ -68,6 +68,7 @@ struct tegra_gpio_soc {
>  	unsigned int num_ports;
>  	const char *name;
>  	unsigned int instance;
> +	bool multi_ints;
> =20
>  	const struct tegra186_pin_range *pin_ranges;
>  	unsigned int num_pin_ranges;
> @@ -450,7 +451,8 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
>  	struct irq_domain *domain =3D gpio->gpio.irq.domain;
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	unsigned int parent =3D irq_desc_get_irq(desc);
> -	unsigned int i, offset =3D 0;
> +	unsigned int i, j, offset =3D 0;
> +	int intr_cntr;
> =20
>  	chained_irq_enter(chip, desc);
> =20
> @@ -462,9 +464,20 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
> =20
>  		base =3D gpio->base + port->bank * 0x1000 + port->port * 0x200;
> =20
> -		/* skip ports that are not associated with this bank */
> -		if (parent !=3D gpio->irq[port->bank])
> -			goto skip;
> +		if (!gpio->soc->multi_ints) {
> +			/* skip ports that are not associated with this bank */
> +			if (parent !=3D gpio->irq[port->bank])
> +				goto skip;
> +
> +		} else {
> +			intr_cntr =3D 0;
> +			for (j =3D 0; j < 8; j++) {
> +				if (parent !=3D gpio->irq[(port->bank * 8) + j])

Again, I don't see how this would work. Currently the DT for Tegra194
(where you set multi_ints =3D true) lists 6 interrupts. So as soon as j
goes beyond 5, this will end up accessing data beyond the bounds of
the gpio->irq array.

I've revised the patches that I created to support this a while ago and
which I had sent earlier as a counter-proposal that keeps compatibility
with earlier device trees. I've now tested it and found a few issues I
had not run into earlier, but it should now work correctly with older
and updated device trees.

Thierry

--HnxrYzzyqk5bRhw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFEci0ACgkQ3SOs138+
s6HTUBAAjbZPhVNXUhwHLEvEulWMN1Us7ADh4FVZNKoi3U/qcsGv56R2gnGENbn7
jXy9tLgkIFcBAmz8pEvcC5E2NohXuFlUGcdpgJZhZTn5bfqtdteZUIKzVS9RcJi4
nI9NGy4zn8Y0as/GiwBPFBV1pJ7lp9xeBl981i1bQtQNiJP7702YtWdtD8cjekU2
m9hvCw0ffvpaIO661pVJWom0wNgNszS2AGckSHJ5R2k/k04rMsZvr6pxkBy5eoRn
DfnLqKr9B16BYDKSDieM2q2arU+wvbfnPPXX+7je7Ug2qu5iu/1y9APCrFE3Lenz
Yr+fB42QBtyeSjXGGh+JKIYorAQarEvaSkSfsnI2UzEUB4zwlhYJYaUifobY7QHL
SgWo5eKqQ1uu+uLQvKL0vXDLcba8XEj/XOlBgxjg8W+Ny8swHvahE4R2MXr2aXjR
Ag4Dy49ehgzL08kW0q0GlCrZqM1e3KaGdcF9YxTdcInDuNtcOn8LnAhpiIor3qRI
41gAxWRpYz59JC4h3NYdw5PxIrIa/tIhbnBbM6+6SSXD1isewlLYfcMDJ3/71AkO
YVfPpD7qt4LqZq2yfXakZRMgr26vR1GcZGqdwi5ukiLztaK4c5+nmEiEPo/qUCm4
maqovp0Tl0qWEhKwgBuLcJvC6IC/9PoaoWTmjTacvVmNYwleNiY=
=rwO/
-----END PGP SIGNATURE-----

--HnxrYzzyqk5bRhw5--

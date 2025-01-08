Return-Path: <linux-gpio+bounces-14589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC7A05550
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 09:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8C03A288A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 08:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27641DFD85;
	Wed,  8 Jan 2025 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE4LJ276"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B31D13B288;
	Wed,  8 Jan 2025 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324890; cv=none; b=q8yUB+dmXo+VPkPIynQW3iQlWVHY6e09FoGKeatnGHQEpCLzA8lheluaorqYgIgLu4F/YHfc/RZ3qHG+0qAzZo5Lx0kb5LgGezV+W8EZzBXI9QjfaSCBgq3SkKFiwPdyAmD29nuWsyxQlU/Tf9AMBmtj6q0WmuRNXFJ4kdLkEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324890; c=relaxed/simple;
	bh=QljudXw3ihE/DLa17ZBwP9SrShKjfS0N3iJrBeglYT4=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=qS6a39RhmlaCpUIvlnCrsdqyVswqQZSBIzFj5k6Q2DoQ6/Hc8Tu/qTU/9qnZEVRbxyQkzMnRQkZ5eDIIjJk7CN/OUssgI1kShjoJtGF75wJNGPAsUmHHq1SOqiqty4cfwYNMOWGsyToBvEkBaoqzPwC2NDFhMEoBCrSgEcj4V18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE4LJ276; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A04C4CEE0;
	Wed,  8 Jan 2025 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736324889;
	bh=QljudXw3ihE/DLa17ZBwP9SrShKjfS0N3iJrBeglYT4=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=JE4LJ276DLZQkwylsQsmpthi8pqrSiBBKb1X0gaS60zopziL+lLnioX/X1trjvh63
	 SQLcMrlmjCXnRqcuAO4BnvqNC9ntmjXXn7Nc7QL9l5b7W+m54lF4/bJs4oR6c5zgaY
	 UyEr+fROrRbQmI4HPCnE/8DP710pAqs+JgGZlb2LIj2kXlb2FA14siRltLRMaj20Kk
	 JV/L73fTgl2D0zdQqEs3NTX75ADHMd9iraPjG5RFPPJi/phFvSqOC2uhiPcSoFH3FP
	 QxmH4sreH8y+Ib3c6QkVcoVZv4cGZxsSyRiIkbKH7Z5EogCc3L+QLYaSVmcMiMB5Ok
	 nL1XElx4TYUGA==
Content-Type: multipart/signed;
 boundary=d709b24d24a9630d89a6a0877c9a8973a0d3762b4169a824cfee7ddbf9af;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 08 Jan 2025 09:28:05 +0100
Message-Id: <D6WJSWR2776G.31DIV7I8QR42J@kernel.org>
Cc: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 <jonas.gorski@gmail.com>, <kylehendrydev@gmail.com>,
 <florian.fainelli@broadcom.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sander Vanheule" <sander@svanheule.net>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: regmap: Use generic request/free ops
X-Mailer: aerc 0.16.0
References: <20250107201621.12467-1-sander@svanheule.net>
In-Reply-To: <20250107201621.12467-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--d709b24d24a9630d89a6a0877c9a8973a0d3762b4169a824cfee7ddbf9af
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jan 7, 2025 at 9:16 PM CET, Sander Vanheule wrote:
> Set the gpiochip request and free ops to the generic implementations.
> This way a user can provide a gpio-ranges property defined for a pinmux,
> easing muxing of gpio functions. Provided that the pin controller
> implementents the pinmux op .gpio_request_enable(), pins will
> automatically be muxed to their GPIO function when requested.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Sounds fine, although I don't have time to test it right now. I'd
appreciate if Linus could give a short comment, too.

Acked-by: Michael Walle <mwalle@kernel.org>

-michael

> ---
> =C3=81lvaro has submitted a similar patch today. My implementation's impa=
ct
> is more limited, but I hadn't gotten around to submitting it yet.
>
> For the original (short) discussion, see:
> https://lore.kernel.org/linux-gpio/20250107102735.317446-1-noltari@gmail.=
com/T/#t
>
>  drivers/gpio/gpio-regmap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index f716eb069b25..82da0f1d78c3 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -270,6 +270,8 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>  	chip->label =3D config->label ?: dev_name(config->parent);
>  	chip->can_sleep =3D regmap_might_sleep(config->regmap);
> =20
> +	chip->request =3D gpiochip_generic_request;
> +	chip->free =3D gpiochip_generic_free;
>  	chip->get =3D gpio_regmap_get;
>  	if (gpio->reg_set_base && gpio->reg_clr_base)
>  		chip->set =3D gpio_regmap_set_with_clear;


--d709b24d24a9630d89a6a0877c9a8973a0d3762b4169a824cfee7ddbf9af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ343FhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jUtgF+IRdx/SGeGgifNWi4eGsC/s9K2Pcn4kgv
q3YemTvNq4LklgMVNmvn7Xqc2ryA6HIvAX4jbr3wYP/VB3Q0sT5QTO2iPa3AI15N
z3G3kS+h3+RBDyGF6fU4CWap8ZwF4USWeWs=
=LG6U
-----END PGP SIGNATURE-----

--d709b24d24a9630d89a6a0877c9a8973a0d3762b4169a824cfee7ddbf9af--


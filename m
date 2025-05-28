Return-Path: <linux-gpio+bounces-20624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFBAC62BC
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 09:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717713AA1C8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 07:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BEC22AE45;
	Wed, 28 May 2025 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrJmZD+e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213DB10E0;
	Wed, 28 May 2025 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416568; cv=none; b=JHnnEV9IlhbbUBeJBuHSochPhvs1MDXn/EfncxLxevbE9a1h07q9ITqHSpMWRemX70v32Qp4eYrO8jvbt5gjjKB6VjpZ6PShGdrdALdANioE37BBzoPEjKxRyCI79go+41xU12jLKIiCwVtG1opqQdfujpiCq+0ol2n4sKjhkgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416568; c=relaxed/simple;
	bh=K9xLFL3YjxEg/yT53Mbd2sI0G3a9mzJ1vSU6/nzZZGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb9+35uZAQP50pHpT4lGxNq/tDC1yZkl2vtZNHOVvXE2o8bPUyAwxarWR3Hs5vtzexv+skxUutKibaehJ3cP6K09h5GXBpOeVNn9Ss/ebqIhEBj6Pu6RPi+IV89l3QfGKawzgkGGnxR0mgf+lQ60Nj/wLdGwjnHZmaAwdlPW6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrJmZD+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC15C4CEE7;
	Wed, 28 May 2025 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748416567;
	bh=K9xLFL3YjxEg/yT53Mbd2sI0G3a9mzJ1vSU6/nzZZGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrJmZD+eu3rGOkhdZyxN4JM0eL8FuhebF+ryNOrcZ3k1MneHJ1X5+eEXS7NrupIye
	 wA5u5eQFtYyQuPWcieS+EjiAS5elaLKloPDwlUe9b6vJBmF1sWotJ45tquAxoX47KP
	 ao5OXqAWHI+6evaZxj0jDiKgTEEPTST6erF+kpU7erw3SKEuo7IU48OTDJW2u/3lng
	 u2P/FTign5MUZqI4L/xBu9AqdJBd86+DU0xYw0yu6xeGuoC6ONgeweeRJk6PcHWB+p
	 ROe0CE/Xk8BE0qKGzovhVkhfKPVBhYf2Oq5fXfqZDBdNXudraKMyoJEco5YK1XljO8
	 xw2DClFYdtBRg==
Date: Wed, 28 May 2025 09:16:04 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: airoha: fix wrong PHY LED mux value for
 LED1 GPIO46
Message-ID: <aDa4NCTzyzw0mnfE@lore-desk>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CoT/qmCue5gfNYHx"
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-2-ansuelsmth@gmail.com>


--CoT/qmCue5gfNYHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
> the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.
>=20
> This wasn't notice as there were no board that made use of the
> secondary PHY LED but looking at the internal Documentation the actual
> value should be LED1_MODE_MASK similar to the other GPIO entry.
>=20
> Fix the wrong value to apply the correct MUX configuration.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index b97b28ebb37a..8ef7f88477aa 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -1752,8 +1752,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1816,8 +1816,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1880,8 +1880,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1944,8 +1944,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> +			GPIO_LAN3_LED1_MODE_MASK,
> +			GPIO_LAN3_LED1_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> --=20
> 2.48.1
>=20

--CoT/qmCue5gfNYHx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDa4NAAKCRA6cBh0uS2t
rOCOAQDIlVEn3j31KLCPSoLJ6jFOUiwWCNqW5qOv7UtW1mOCagEAh6LZiTafRxQs
HXf7z9JkF4bcnAu1w5WH7iDwvjnpNw0=
=lKi2
-----END PGP SIGNATURE-----

--CoT/qmCue5gfNYHx--


Return-Path: <linux-gpio+bounces-20628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16AAC645B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226139E56D8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19099246764;
	Wed, 28 May 2025 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpUYyQrZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7F10E0;
	Wed, 28 May 2025 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420545; cv=none; b=CRlDgU64eLsstE4CHDXV+KW2ACENpc6XzNh58G2Q2R0He1Bn+PusEMPbKFM+kVUMb/EPZKMWdOUqaHKSalGp3SR+Y8GYJxBVRrylpsRJ7lbHs5fb/udYfb+vjZlW+Urh25iIoaHyFxr+KCA+NsHrXgNZ6KHDgyvfMZX5/agYWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420545; c=relaxed/simple;
	bh=Yuh6vKmjflKKUWIV791akrOKQPbvecxt/YxWPJHHypo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oc0cFiMvQTAwI0vV1VjWbtOVvinjZEc1b4yyP/V/CnjRaKmTuKvMYZrb25thIHaH9A7sl7C7yM9ZEjgObcWAHisv+RcWQslpa/uGAmwCO73v1Ux72ZNe4JnxEhK4OqbybJeQCpde881C92dSwQIFt5AL266dYtEDV/hm3a0+bxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpUYyQrZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F66C4CEED;
	Wed, 28 May 2025 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748420545;
	bh=Yuh6vKmjflKKUWIV791akrOKQPbvecxt/YxWPJHHypo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpUYyQrZpuwEgT4UeSvaqF6xrvgMm8nlBAo7tsr5KFPBzwGej4XAT4C2wov0Focah
	 n4MuPct3BUv6yNBkaW8LdC0uVaRwXykWaa+7lF6pWKgDDB9dAHht+iICvYsKPSy7nd
	 pg2bbIEzdjwg5yYLaE4GCWaVyK55PHoa/DMivrUSkitloVksIyCKuZgNzxAShj9Iow
	 sq/9NkZSBaHGvd7DVuh6anc6gmP9dMkwX7feKyPEni4FF3QFIzPKZsxHZpgWqOxXTE
	 Yf8XxxLGH1qo5DnFBTAX4nUC+Lx1mg2qVj75gP507jEUgd5R78sskRV5fyVBBqrfII
	 xMzBybg41VtTA==
Date: Wed, 28 May 2025 10:22:22 +0200
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] pinctrl: airoha: convert PWM GPIO to macro
Message-ID: <aDbHvjPII0jlua18@lore-desk>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CPM4ZnGQOjRXXEPR"
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-5-ansuelsmth@gmail.com>


--CPM4ZnGQOjRXXEPR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The PWM GPIO struct definition follow the same pattern for every GPIO
> pin hence it can be converted to a macro.
>=20
> Create 2 macro one for normal mux and one for ext mux and convert all
> the entry to these new macro to reduce code size.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 465 ++++------------------
>  1 file changed, 68 insertions(+), 397 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 2b532334d759..8c8d5b598f4f 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -1075,404 +1075,75 @@ static const struct airoha_pinctrl_func_group pc=
ie_reset_func_group[] =3D {
>  };
> =20
>  /* PWM */
> +#define AIROHA_PINCTRL_PWM(gpio, mux_val)		\
> +	{						\
> +		.name =3D (gpio),				\
> +		.regmap[0] =3D {				\
> +			AIROHA_FUNC_PWM_MUX,		\
> +			REG_GPIO_FLASH_MODE_CFG,	\
> +			(mux_val),			\
> +			(mux_val)			\
> +		},					\
> +		.regmap_size =3D 1,			\
> +	}						\
> +
> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)		\
> +	{						\
> +		.name =3D (gpio),				\
> +		.regmap[0] =3D {				\
> +			AIROHA_FUNC_PWM_EXT_MUX,	\
> +			REG_GPIO_FLASH_MODE_CFG_EXT,	\
> +			(mux_val),			\
> +			(mux_val)			\
> +		},					\
> +		.regmap_size =3D 1,			\
> +	}						\
> +
>  static const struct airoha_pinctrl_func_group pwm_func_group[] =3D {
> -	{
> -		.name =3D "gpio0",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO0_FLASH_MODE_CFG,
> -			GPIO0_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio1",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO1_FLASH_MODE_CFG,
> -			GPIO1_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio2",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO2_FLASH_MODE_CFG,
> -			GPIO2_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio3",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO3_FLASH_MODE_CFG,
> -			GPIO3_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio4",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO4_FLASH_MODE_CFG,
> -			GPIO4_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio5",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO5_FLASH_MODE_CFG,
> -			GPIO5_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio6",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO6_FLASH_MODE_CFG,
> -			GPIO6_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio7",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO7_FLASH_MODE_CFG,
> -			GPIO7_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio8",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO8_FLASH_MODE_CFG,
> -			GPIO8_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio9",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO9_FLASH_MODE_CFG,
> -			GPIO9_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio10",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO10_FLASH_MODE_CFG,
> -			GPIO10_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio11",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO11_FLASH_MODE_CFG,
> -			GPIO11_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio12",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO12_FLASH_MODE_CFG,
> -			GPIO12_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio13",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO13_FLASH_MODE_CFG,
> -			GPIO13_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio14",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO14_FLASH_MODE_CFG,
> -			GPIO14_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio15",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_MUX,
> -			REG_GPIO_FLASH_MODE_CFG,
> -			GPIO15_FLASH_MODE_CFG,
> -			GPIO15_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio16",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO16_FLASH_MODE_CFG,
> -			GPIO16_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio17",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO17_FLASH_MODE_CFG,
> -			GPIO17_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio18",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO18_FLASH_MODE_CFG,
> -			GPIO18_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio19",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO19_FLASH_MODE_CFG,
> -			GPIO19_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio20",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO20_FLASH_MODE_CFG,
> -			GPIO20_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio21",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO21_FLASH_MODE_CFG,
> -			GPIO21_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio22",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO22_FLASH_MODE_CFG,
> -			GPIO22_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio23",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO23_FLASH_MODE_CFG,
> -			GPIO23_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio24",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO24_FLASH_MODE_CFG,
> -			GPIO24_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio25",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO25_FLASH_MODE_CFG,
> -			GPIO25_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio26",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO26_FLASH_MODE_CFG,
> -			GPIO26_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio27",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO27_FLASH_MODE_CFG,
> -			GPIO27_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio28",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO28_FLASH_MODE_CFG,
> -			GPIO28_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio29",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO29_FLASH_MODE_CFG,
> -			GPIO29_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio30",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO30_FLASH_MODE_CFG,
> -			GPIO30_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio31",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO31_FLASH_MODE_CFG,
> -			GPIO31_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio36",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO36_FLASH_MODE_CFG,
> -			GPIO36_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio37",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO37_FLASH_MODE_CFG,
> -			GPIO37_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio38",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO38_FLASH_MODE_CFG,
> -			GPIO38_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio39",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO39_FLASH_MODE_CFG,
> -			GPIO39_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio40",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO40_FLASH_MODE_CFG,
> -			GPIO40_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio41",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO41_FLASH_MODE_CFG,
> -			GPIO41_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO42_FLASH_MODE_CFG,
> -			GPIO42_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO43_FLASH_MODE_CFG,
> -			GPIO43_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO44_FLASH_MODE_CFG,
> -			GPIO44_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO45_FLASH_MODE_CFG,
> -			GPIO45_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO46_FLASH_MODE_CFG,
> -			GPIO46_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	}, {
> -		.name =3D "gpio47",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_PWM_EXT_MUX,
> -			REG_GPIO_FLASH_MODE_CFG_EXT,
> -			GPIO47_FLASH_MODE_CFG,
> -			GPIO47_FLASH_MODE_CFG
> -		},
> -		.regmap_size =3D 1,
> -	},
> +	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
> +	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
>  };
> =20
>  #define AIROHA_PINCTRL_PHY_LED(gpio, mux_val, map_mask, map_val)	\
> --=20
> 2.48.1
>=20

--CPM4ZnGQOjRXXEPR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDbHvgAKCRA6cBh0uS2t
rBJZAQD7+oRzhJuZS59u7A4b7Xcyz2xWC0arWJEeABCRH+xEIAEAkcZZZRhjb4Ps
1Ah0XFL6GNNxmJ7KNNr2JzqkmGeuHQY=
=GTx/
-----END PGP SIGNATURE-----

--CPM4ZnGQOjRXXEPR--


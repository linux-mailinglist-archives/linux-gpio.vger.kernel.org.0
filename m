Return-Path: <linux-gpio+bounces-20626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF1AC6456
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A3CF163029
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 08:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5132459EA;
	Wed, 28 May 2025 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlwWHoM0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A918C034;
	Wed, 28 May 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420467; cv=none; b=Mf89LwPNgs0rgEXNPQ70qdO+M1xSjqcX7MnTDiszvU6DvhAoZxSilHvsFNSzQBzWLiJFGCOMTWtUplt9VGN7Amcghnj3+QAjp27hTBoOtHK9+h+hSM3frCLWbXC2FyTJaVWIkptaVUIXenQd3lktJ5K+NbsSq/xn3pBUm582h7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420467; c=relaxed/simple;
	bh=/Gne2VTfI+xQQ5m1d2vLN8pRlBpucC8Gc7xkCOfzMBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq8yzqB8BPYLJNEg5DcbgzMO2eA7IBGfdb0HYcd9tcQjeAGK1QW/WABtb9OOA2ZrLC7xlxxgHYRWkKaWZjMScBw+GdXsUTfK4unNHLtsJvyo4XcUGCAyFMpv3tIXjSoK7CyWRLDnsNfaQSEfU7yOVw9O8qBUiPyFoZdIVnMeSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlwWHoM0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD26C4CEE7;
	Wed, 28 May 2025 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748420466;
	bh=/Gne2VTfI+xQQ5m1d2vLN8pRlBpucC8Gc7xkCOfzMBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlwWHoM0qknnmD95VX6gM87GKsdV1HlNJCv3nffKAzcXJZ7ioTjmxxnYtKGN+H/yK
	 f8ue9TIU/OBOL7s/XsDYDoo6shMAef/oEytMD5GImMOevUURw96+EtAst4LXMNNTRj
	 TlPT9JQyoVbjtrcZvQTZq3YaXWZeFRfB87HyhSrh4solFZN+2P7KcVGlbS1K8att+X
	 HJv2f1z5bFXYRVRTlFibQGV8OxB/M/hr2MmlfHP7S/7B2F7VNOj1ROe4kuWjBT2rU1
	 r+vTjtXGwYliGiMTjQV/p3vNNvsaEV9j1OGrBtTGxp7wp6DeOQT5UHSmwsYciqHuOx
	 wa3leWEWH0+Mw==
Date: Wed, 28 May 2025 10:21:03 +0200
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
Subject: Re: [PATCH 3/6] pinctrl: airoha: convert PHY LED GPIO to macro
Message-ID: <aDbHb4q44BWwHQpE@lore-desk>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uHLHnWQWrDq34LLB"
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-4-ansuelsmth@gmail.com>


--uHLHnWQWrDq34LLB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> PHY LED GPIO pinctrl struct definition is very similar across the
> different 4 PHY and 2 LED and it can be generelized to a macro.
>=20
> To reduce code size, convert them to a common macro.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 570 ++++------------------
>  1 file changed, 82 insertions(+), 488 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 8af9109db992..2b532334d759 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -1475,516 +1475,110 @@ static const struct airoha_pinctrl_func_group p=
wm_func_group[] =3D {
>  	},
>  };
> =20
> +#define AIROHA_PINCTRL_PHY_LED(gpio, mux_val, map_mask, map_val)	\
> +	{								\
> +		.name =3D (gpio),						\
> +		.regmap[0] =3D {						\
> +			AIROHA_FUNC_MUX,				\
> +			REG_GPIO_2ND_I2C_MODE,				\
> +			(mux_val),					\
> +			(mux_val),					\
> +		},							\
> +		.regmap[1] =3D {						\
> +			AIROHA_FUNC_MUX,				\
> +			REG_LAN_LED0_MAPPING,				\
> +			(map_mask),					\
> +			(map_val),					\
> +		},							\
> +		.regmap_size =3D 2,					\
> +	}
> +
>  static const struct airoha_pinctrl_func_group phy1_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy2_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy3_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy4_led0_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio33",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED0_MODE_MASK,
> -			GPIO_LAN0_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio34",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED0_MODE_MASK,
> -			GPIO_LAN1_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio35",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED0_MODE_MASK,
> -			GPIO_LAN2_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio42",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED0_MODE_MASK,
> -			GPIO_LAN3_LED0_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy1_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(0)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy2_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(1)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy3_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(2)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
> =20
>  static const struct airoha_pinctrl_func_group phy4_led1_func_group[] =3D=
 {
> -	{
> -		.name =3D "gpio43",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN0_LED1_MODE_MASK,
> -			GPIO_LAN0_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN0_LED_MAPPING_MASK,
> -			LAN0_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio44",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN1_LED1_MODE_MASK,
> -			GPIO_LAN1_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio45",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN2_LED1_MODE_MASK,
> -			GPIO_LAN2_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	}, {
> -		.name =3D "gpio46",
> -		.regmap[0] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_LAN3_LED1_MODE_MASK,
> -			GPIO_LAN3_LED1_MODE_MASK
> -		},
> -		.regmap[1] =3D {
> -			AIROHA_FUNC_MUX,
> -			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY_LED_MAP(3)
> -		},
> -		.regmap_size =3D 2,
> -	},
> +	AIROHA_PINCTRL_PHY_LED("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> +			       LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> +			       LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> +			       LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +	AIROHA_PINCTRL_PHY_LED("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> +			       LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
> =20
>  static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] =3D {
> --=20
> 2.48.1
>=20

--uHLHnWQWrDq34LLB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDbHbwAKCRA6cBh0uS2t
rPDhAP9JrT1Z/SFeEmV1XY6nhsWgx267nYFw+Nz/SI76T5BqTQEA/EWsQKh5VR+t
PatEzhmW8pegCWvsjTFOtVdpj4pifwk=
=VXYP
-----END PGP SIGNATURE-----

--uHLHnWQWrDq34LLB--


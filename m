Return-Path: <linux-gpio+bounces-18103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5817BA75649
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 13:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E08C1892312
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 12:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BFA1C5D72;
	Sat, 29 Mar 2025 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzQu3r6e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870EE1A3150;
	Sat, 29 Mar 2025 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743252766; cv=none; b=nksR5aH3hh4lzarABIFLerQ5Lfh/UmqcFolIyuPNuTsBkCqqFG9YGe3tkJE7AbZS8eDEYTYCXbc7JdhRzLzrCTcPqNLshmaGn/16mY1aJimVlaw3SdTfMMpmeYpYXsaCLRQ85J/CxyAfuTRsPJoocHrgMfmquKEa2Rj++VbS96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743252766; c=relaxed/simple;
	bh=eZpiFhvDtIwHjX2CuR9smL6njxD51RMyHgmPsElPOQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ0PU0u61a1VB6ExtPLMOsAwTHfDOpktKr+o6fv4pCEnWVp1irlGaXYoIguANkQNMJAxvbjS+ZM1iJI3aAjjmPKUg3CMH2acJGWbclZduWWuzZZ2oDpEmAJwnhXqo5XWRAirdBPGrJRKSrANS+WgbbUcLfYnxYDSG1ApP94eXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzQu3r6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA34C4CEE2;
	Sat, 29 Mar 2025 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743252766;
	bh=eZpiFhvDtIwHjX2CuR9smL6njxD51RMyHgmPsElPOQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzQu3r6ebDUh73MnwZ00Fiz+g1sNIgrk8UZikLEmwGEu1nGTlMxhDehG9hkjhRt6r
	 DVgBs84IOKvkU6XwXBzdK28PFQhrQS23ezp5npi1KLYoU+d2oTp/s/mR/Bh65EOXtp
	 mJiBCyCh3zu5ypb6m94nvenRAT4sOmyMyyGoNI1BMWZVXIDTLosZBYueVnWY2lYdqU
	 oau4HRbL7E7C8jXBVwpYKGLlm12oXiuQCLSa7FhVLtDuVdJu6CfKQZb/SODYQfMP9w
	 ZfoaNEhgxpPb5jwK9o/Vxz+WG5I8nRaXWffNi0ZH1S3BlawPgQneu7deMk0/+zKfQM
	 5kFXsQkWSm3nw==
Date: Sat, 29 Mar 2025 13:52:41 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED
 defines
Message-ID: <Z-ftGYXl01tg9I0n@lore-rh-laptop>
References: <20250326122359.27504-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxBCDseondUIzNHf"
Content-Disposition: inline
In-Reply-To: <20250326122359.27504-1-ansuelsmth@gmail.com>


--bxBCDseondUIzNHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The current PHY2 LED define are wrong and actually set BITs outside the
> related mask. Fix it and set the correct value. While at it, also use
> FIELD_PREP_CONST macro to make it simple to understand what values are
> actually applied for the mask.
>=20
> Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
> the register define mapping for 5 PHY port, starting from 0. The mapping
> was wrongly defined starting from PHY1. Reorder the function group to
> start from PHY0. PHY4 is actually never supported as we don't have a
> GPIO pin to assign.

Hi Christian,

This patch is fine, just a nit inline

Regards,
Lorenzo

>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 179 +++++++++++-----------
>  1 file changed, 90 insertions(+), 89 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 547a798b71c8..9099ad34aa29 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <dt-bindings/pinctrl/mt65xx.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/gpio/driver.h>
> @@ -112,39 +113,39 @@
>  #define REG_LAN_LED1_MAPPING			0x0280
> =20
>  #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
> -#define LAN4_PHY4_LED_MAP			BIT(18)
> -#define LAN4_PHY2_LED_MAP			BIT(17)
> -#define LAN4_PHY1_LED_MAP			BIT(16)
> -#define LAN4_PHY0_LED_MAP			0
> -#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
> +#define LAN4_PHY4_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x4)
> +#define LAN4_PHY3_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x3)
> +#define LAN4_PHY2_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x2)
> +#define LAN4_PHY1_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x1)
> +#define LAN4_PHY0_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x0)

What about doing something like:

#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))


> =20
>  #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
> -#define LAN3_PHY4_LED_MAP			BIT(14)
> -#define LAN3_PHY2_LED_MAP			BIT(13)
> -#define LAN3_PHY1_LED_MAP			BIT(12)
> -#define LAN3_PHY0_LED_MAP			0
> -#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
> +#define LAN3_PHY4_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x4)
> +#define LAN3_PHY3_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x3)
> +#define LAN3_PHY2_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x2)
> +#define LAN3_PHY1_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x1)
> +#define LAN3_PHY0_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x0)
> =20
>  #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
> -#define LAN2_PHY4_LED_MAP			BIT(12)
> -#define LAN2_PHY2_LED_MAP			BIT(11)
> -#define LAN2_PHY1_LED_MAP			BIT(10)
> -#define LAN2_PHY0_LED_MAP			0
> -#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
> +#define LAN2_PHY4_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x4)
> +#define LAN2_PHY3_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x3)
> +#define LAN2_PHY2_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x2)
> +#define LAN2_PHY1_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x1)
> +#define LAN2_PHY0_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x0)
> =20
>  #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
> -#define LAN1_PHY4_LED_MAP			BIT(6)
> -#define LAN1_PHY2_LED_MAP			BIT(5)
> -#define LAN1_PHY1_LED_MAP			BIT(4)
> -#define LAN1_PHY0_LED_MAP			0
> -#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
> +#define LAN1_PHY4_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x4)
> +#define LAN1_PHY3_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x3)
> +#define LAN1_PHY2_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x2)
> +#define LAN1_PHY1_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x1)
> +#define LAN1_PHY0_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x0)
> =20
>  #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
> -#define LAN0_PHY4_LED_MAP			BIT(3)
> -#define LAN0_PHY2_LED_MAP			BIT(2)
> -#define LAN0_PHY1_LED_MAP			BIT(1)
> -#define LAN0_PHY0_LED_MAP			0
> -#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
> +#define LAN0_PHY4_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x4)
> +#define LAN0_PHY3_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x3)
> +#define LAN0_PHY2_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x2)
> +#define LAN0_PHY1_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x1)
> +#define LAN0_PHY0_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x0)
> =20
>  /* CONF */
>  #define REG_I2C_SDA_E2				0x001c
> @@ -1476,8 +1477,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY1_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1491,8 +1492,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY1_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1506,8 +1507,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY1_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1521,8 +1522,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY1_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1540,8 +1541,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY2_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1555,8 +1556,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY2_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1570,8 +1571,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY2_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1585,8 +1586,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY2_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1604,8 +1605,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY3_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1619,8 +1620,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY3_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1634,8 +1635,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY3_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1649,8 +1650,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY3_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1668,8 +1669,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY4_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1683,8 +1684,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY4_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1698,8 +1699,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY4_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1713,8 +1714,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY4_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1732,8 +1733,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY1_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1747,8 +1748,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY1_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1762,8 +1763,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY1_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1777,8 +1778,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY1_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY0_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1796,8 +1797,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY2_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1811,8 +1812,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY2_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1826,8 +1827,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY2_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1841,8 +1842,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY2_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY1_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1860,8 +1861,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY3_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1875,8 +1876,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY3_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1890,8 +1891,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY3_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1905,8 +1906,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY3_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY2_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1924,8 +1925,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY4_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1939,8 +1940,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY4_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1954,8 +1955,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY4_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1969,8 +1970,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY4_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY3_LED_MAP
>  		},
>  		.regmap_size =3D 2,
>  	},
> --=20
> 2.48.1
>=20

--bxBCDseondUIzNHf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ+ftFgAKCRA6cBh0uS2t
rA3jAQC3DuuDUXFJE6ZIunnmBsWsnWDVyyuB2dClQt002JIXcQEAiac4v+IAntq8
nQ3BuM2ng3XlSqEIu12K9X4Xkuobzwo=
=x72S
-----END PGP SIGNATURE-----

--bxBCDseondUIzNHf--


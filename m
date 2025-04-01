Return-Path: <linux-gpio+bounces-18155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D079A77CEB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 15:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4DC53A6988
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24FC204680;
	Tue,  1 Apr 2025 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7vdGmO5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6964DC2C6;
	Tue,  1 Apr 2025 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515766; cv=none; b=WqEAveKG5Q1FcSb7at+UQd1fImuUHC0UmzYNPI70uQuqcJ0FFau0rHDkv/yBxQc8/Vc8M62ybaUO3+Z2gsNMCy9pqHHe/TA5zBwMeeMMTWLnzzy3taOMchcDwVx7x920PNUIQ+H0nWe2QaFjP5oPsjQOmMmA41tDLj+zIqaoBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515766; c=relaxed/simple;
	bh=vOJVAGJTEuAy1vm3ddszdLsD3QriX/nzRc5+pSlCs8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9gaVHLMQJLnTayHaoDgo6kd9MxT0/rHWOk8YQpYnhOUknSJ38aA1IKjJd9SIEGFBMr123rEAMFTG+qEjSsggFcxpuvhb6zpI/j9uAKJ1eM+ZMKuCSvKWnuSoJXA3tbZI/XQcKQLXGXlmiR87xbdOvzXoWd8S/8JqirYlIPOO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7vdGmO5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA44C4CEE4;
	Tue,  1 Apr 2025 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743515765;
	bh=vOJVAGJTEuAy1vm3ddszdLsD3QriX/nzRc5+pSlCs8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7vdGmO5begJnV+11RKXwxfNoFckttAv6bpYAXo6O7e0SIal3YfNWFJx1zL7arTDI
	 GGLFdXXBuxCbnOhN3RJJsMEOf6y+mvz4WFuPK86w8PAoN27ZkFEXD+qCQuBBnMaDBL
	 rLLD/is2izh7sREvpuBdMFEvQ3Nf8xWGIXt6h8KbgpH9J1QNmpT0BflvJcFLJ8LI/9
	 3R7v9iRyt9JQ0rRQOslh57IgWE1WSboFb/+vuf0yjrB38RHGQHoN0SVtheXma09cSd
	 GgbE+ouoZ1v1luADVo+lkIumppiAn/OD6Aup93HVQpPtfKgJH+s06ThxLefnTVfexy
	 +3pICuc63w+Cg==
Date: Tue, 1 Apr 2025 15:56:03 +0200
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
Subject: Re: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2
 LED defines
Message-ID: <Z-vwczLnmAkswNeD@lore-desk>
References: <20250401135026.18018-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRYz62PYEOHq01AT"
Content-Disposition: inline
In-Reply-To: <20250401135026.18018-1-ansuelsmth@gmail.com>


--nRYz62PYEOHq01AT
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
>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes v2:
> - Add Reviewed-by tag
> - Use more symbolic macro
>=20
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 159 ++++++++++------------
>  1 file changed, 70 insertions(+), 89 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 547a798b71c8..5d84a778683d 100644
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
> @@ -112,39 +113,19 @@
>  #define REG_LAN_LED1_MAPPING			0x0280
> =20
>  #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
> -#define LAN4_PHY4_LED_MAP			BIT(18)
> -#define LAN4_PHY2_LED_MAP			BIT(17)
> -#define LAN4_PHY1_LED_MAP			BIT(16)
> -#define LAN4_PHY0_LED_MAP			0
> -#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
> +#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
> -#define LAN3_PHY4_LED_MAP			BIT(14)
> -#define LAN3_PHY2_LED_MAP			BIT(13)
> -#define LAN3_PHY1_LED_MAP			BIT(12)
> -#define LAN3_PHY0_LED_MAP			0
> -#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
> +#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
> -#define LAN2_PHY4_LED_MAP			BIT(12)
> -#define LAN2_PHY2_LED_MAP			BIT(11)
> -#define LAN2_PHY1_LED_MAP			BIT(10)
> -#define LAN2_PHY0_LED_MAP			0
> -#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
> +#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
> -#define LAN1_PHY4_LED_MAP			BIT(6)
> -#define LAN1_PHY2_LED_MAP			BIT(5)
> -#define LAN1_PHY1_LED_MAP			BIT(4)
> -#define LAN1_PHY0_LED_MAP			0
> -#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
> +#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (=
_n))
> =20
>  #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
> -#define LAN0_PHY4_LED_MAP			BIT(3)
> -#define LAN0_PHY2_LED_MAP			BIT(2)
> -#define LAN0_PHY1_LED_MAP			BIT(1)
> -#define LAN0_PHY0_LED_MAP			0
> -#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
> +#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (=
_n))
> =20
>  /* CONF */
>  #define REG_I2C_SDA_E2				0x001c
> @@ -1476,8 +1457,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY1_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1491,8 +1472,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY1_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1506,8 +1487,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY1_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1521,8 +1502,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY1_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1540,8 +1521,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY2_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1555,8 +1536,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY2_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1570,8 +1551,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY2_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1585,8 +1566,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY2_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1604,8 +1585,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY3_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1619,8 +1600,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY3_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1634,8 +1615,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY3_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1649,8 +1630,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY3_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1668,8 +1649,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY4_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1683,8 +1664,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY4_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1698,8 +1679,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY4_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1713,8 +1694,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led0_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED0_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY4_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1732,8 +1713,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY1_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1747,8 +1728,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY1_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1762,8 +1743,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY1_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1777,8 +1758,8 @@ static const struct airoha_pinctrl_func_group phy1_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY1_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(0)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1796,8 +1777,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY2_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1811,8 +1792,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY2_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1826,8 +1807,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY2_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1841,8 +1822,8 @@ static const struct airoha_pinctrl_func_group phy2_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY2_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(1)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1860,8 +1841,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY3_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1875,8 +1856,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY3_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1890,8 +1871,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY3_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1905,8 +1886,8 @@ static const struct airoha_pinctrl_func_group phy3_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY3_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(2)
>  		},
>  		.regmap_size =3D 2,
>  	},
> @@ -1924,8 +1905,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN1_LED_MAPPING_MASK,
> -			LAN1_PHY4_LED_MAP
> +			LAN0_LED_MAPPING_MASK,
> +			LAN0_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1939,8 +1920,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN2_LED_MAPPING_MASK,
> -			LAN2_PHY4_LED_MAP
> +			LAN1_LED_MAPPING_MASK,
> +			LAN1_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1954,8 +1935,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN3_LED_MAPPING_MASK,
> -			LAN3_PHY4_LED_MAP
> +			LAN2_LED_MAPPING_MASK,
> +			LAN2_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	}, {
> @@ -1969,8 +1950,8 @@ static const struct airoha_pinctrl_func_group phy4_=
led1_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_LAN_LED1_MAPPING,
> -			LAN4_LED_MAPPING_MASK,
> -			LAN4_PHY4_LED_MAP
> +			LAN3_LED_MAPPING_MASK,
> +			LAN3_PHY_LED_MAP(3)
>  		},
>  		.regmap_size =3D 2,
>  	},
> --=20
> 2.48.1
>=20

--nRYz62PYEOHq01AT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ+vwcwAKCRA6cBh0uS2t
rNMvAQCC3qXkUGBbmTKpqXtmDpcfFfy2GUHnM7lnNIMj6NxI0QD+PpG0H5XNZ3VI
kk0XQB0c2gUlQ6n+H1HB33xvyJTafAE=
=u1TQ
-----END PGP SIGNATURE-----

--nRYz62PYEOHq01AT--


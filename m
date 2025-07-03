Return-Path: <linux-gpio+bounces-22724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1EAF73D8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB5E4A20BB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C152E6122;
	Thu,  3 Jul 2025 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ApsTurDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EAE2E54BF;
	Thu,  3 Jul 2025 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545167; cv=none; b=XIYCckHbd742AMN0kypwtpFuC0y0CBLW/dt5f+gS6Ct1+iH9V9gVkNqBfRVsyaHBh7e3AeonalGhVUVjW6DuZoNvckac6ydgXcmWkYqUMDP2i6470/n8sCFMAAazwB0xJorjq2/cyaPvCmlYVRL7XlSn2Ss1zzZQPOqgfq+SaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545167; c=relaxed/simple;
	bh=Zt3vfI96YWKkUOhKmCDh4scykPQVsxPo4DdchFLuVLc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A4E7TwN3qsPFMZ9nCc+tEbAaVgnZf4s0iAuz8ZybIDqjbtjmPB9YW+GMcPYGuapIjfCaYN1RIzZZeRxlwOd4qxCjDsXaBuxSWmcQVAfK0mE3Qt3tQfWEuuiephfGZL8Tbhtz8deW1ZsHUmfWoK/f2U5Ygh+ub380czEtnJewH9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ApsTurDC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751545160;
	bh=Zt3vfI96YWKkUOhKmCDh4scykPQVsxPo4DdchFLuVLc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ApsTurDChGHad3aJC65f4RjUBN9jJbwF4BCli9Mp1Mpn13Z6+8FMLNchomAz2Cq9T
	 qycr15KdvkiXFn0VifrYdeHpuxKNGO9Pth2gfvO/Bm/hubK6Q63qZ72jJxH0sNMKtA
	 we/1CE3dLkoErfXH5iVPb0s3ecJlNLZZW9iYUtHHcZF1VbePcI17Y3zzIel30LhA+j
	 zAEXXMPdjq3s6GXHw9ot2gAifTQjlk29R3/4a3z9yBI5yt0NxojJ1boUo5acea2ps6
	 S+PKPf4MDgcqtYMHteE8tchIq101CYiLtRZ/aYCIJ6OHjk/d+sp/vvCbEtvVRIlf4X
	 iPbH4bmpn8nLA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85Cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 072A017E080D;
	Thu,  3 Jul 2025 14:19:19 +0200 (CEST)
Message-ID: <ab41191cb9aab730414c4a93a2d37ccabd394fe0.camel@collabora.com>
Subject: Re: [PATCH v5 20/24] media: i2c: maxim-serdes: add MAX9296A driver
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Thu, 03 Jul 2025 14:19:19 +0200
In-Reply-To: <20250702132104.1537926-21-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <20250702132104.1537926-21-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> Add a new MAX9296A driver that also supports MAX96714, MAX96714F,
> MAX96714R, MAX96716A and MAX96792A.
>=20
> Integrate it with the common Deserializer framework, while keeping
> compatibility with existing usecases, avoiding code duplication, and
> also enabling more features across all chips.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
> =C2=A0drivers/media/i2c/maxim-serdes/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 12 +
> =C2=A0drivers/media/i2c/maxim-serdes/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 1 +
> =C2=A0drivers/media/i2c/maxim-serdes/max9296a.c | 1354 ++++++++++++++++++=
+++
> =C2=A03 files changed, 1367 insertions(+)
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
>=20
> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/m=
axim-serdes/Kconfig
> index 2acd96cdbfa4..05868624f3b6 100644
> --- a/drivers/media/i2c/maxim-serdes/Kconfig
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -41,3 +41,15 @@ config VIDEO_MAX96724
> =C2=A0
> =C2=A0	=C2=A0 To compile this driver as a module, choose M here: the modu=
le
> =C2=A0	=C2=A0 will be called max96724.
> +
> +config VIDEO_MAX9296A
> +	tristate "Maxim MAX9296A Dual Deserializer support"
> +	select VIDEO_MAXIM_SERDES
> +	help
> +	=C2=A0 This driver supports the Maxim MAX9296A, MAX96716A, MAX96792A
> +	=C2=A0 Dual Deserializers, and the MAX96714, MAX96714F, MAX96714R
> +	=C2=A0 Single Deserializers, which=C2=A0 convert from up to two GMSL2/3
> +	=C2=A0 links to up to two MIPI D-PHY outputs.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the module
> +	=C2=A0 will be called max9296a.
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/=
maxim-serdes/Makefile
> index b6d5aebfaee1..ae306bc33bfb 100644
> --- a/drivers/media/i2c/maxim-serdes/Makefile
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -3,3 +3,4 @@ max-serdes-objs :=3D max_serdes.o max_ser.o max_des.o
> =C2=A0obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D max-serdes.o
> =C2=A0obj-$(CONFIG_VIDEO_MAX96717) +=3D max96717.o
> =C2=A0obj-$(CONFIG_VIDEO_MAX96724) +=3D max96724.o
> +obj-$(CONFIG_VIDEO_MAX9296A) +=3D max9296a.o
> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2=
c/maxim-serdes/max9296a.c
> new file mode 100644
> index 000000000000..946fdc402829
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
> @@ -0,0 +1,1354 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim MAX9296A Quad GMSL2 Deserializer Driver
> + *
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +
> +#include "max_des.h"
> +
> +#define MAX9296A_REG0				0x0
> +
> +#define MAX9296A_REG1				0x1
> +#define MAX9296A_REG1_RX_RATE_A			GENMASK(1, 0)
> +#define MAX9296A_REG1_RX_RATE_3GBPS		0b01
> +#define MAX9296A_REG1_RX_RATE_6GBPS		0b10
> +#define MAX9296A_REG1_RX_RATE_12GBPS		0b11
> +
> +#define MAX9296A_REG2				0x2
> +#define MAX9296A_REG2_VID_EN(p)			BIT((p) + 4)
> +
> +#define MAX9296A_REG4				0x4
> +#define MAX9296A_REG4_GMSL3_X(x)		BIT((x) + 6)
> +#define MAX9296A_REG4_RX_RATE_B			GENMASK(1, 0)
> +
> +#define MAX9296A_REG6				0x6
> +#define MAX9296A_REG6_GMSL2_X(x)		BIT((x) + 6)
> +
> +#define MAX9296A_CTRL0				0x10
> +#define MAX9296A_CTRL0_LINK_CFG			GENMASK(1, 0)
> +#define MAX9296A_CTRL0_AUTO_LINK		BIT(4)
> +#define MAX9296A_CTRL0_RESET_ONESHOT		BIT(5)
> +#define MAX9296A_CTRL0_RESET_ALL		BIT(7)
> +
> +#define MAX9296A_CTRL2				0x12
> +#define MAX9296A_CTRL2_RESET_ONESHOT_B		BIT(5)
> +
> +#define MAX9296A_MIPI_TX0(x)			(0x28 + (x) * 0x5000)
> +#define MAX9296A_MIPI_TX0_RX_FEC_EN		BIT(1)
> +
> +#define MAX9296A_IO_CHK0			0x38
> +#define MAX9296A_IO_CHK0_PIN_DRV_EN_0		GENMASK(1, 0)
> +#define MAX9296A_IO_CHK0_PIN_DRV_EN_0_25MHZ	0b00
> +#define MAX9296A_IO_CHK0_PIN_DRV_EN_0_75MHZ	0b01
> +#define MAX9296A_IO_CHK0_PIN_DRV_EN_0_USE_PIPE	0b10
> +
> +#define MAX9296A_RX50(p)			(0x50 + (p))
> +#define MAX9296A_RX50_STR_SEL			GENMASK(1, 0)
> +
> +#define MAX9296A_VIDEO_PIPE_EN			0x160
> +#define MAX9296A_VIDEO_PIPE_EN_MASK(p)		BIT(p)
> +
> +#define MAX9296A_VIDEO_PIPE_SEL			0x161
> +#define MAX9296A_VIDEO_PIPE_SEL_STREAM(p)	(GENMASK(1, 0) << ((p) * 3))
> +#define MAX9296A_VIDEO_PIPE_SEL_LINK(p)		BIT(2 + (p) * 3)
> +
> +#define MAX9296A_VPRBS(p)			(0x1fc + (p) * 0x20)
> +#define MAX9296A_VPRBS_VIDEO_LOCK		BIT(0)
> +#define MAX9296A_VPRBS_PATGEN_CLK_SRC		BIT(7)
> +#define MAX9296A_VPRBS_PATGEN_CLK_SRC_150MHZ	0b0
> +#define MAX9296A_VPRBS_PATGEN_CLK_SRC_600MHZ	0b1
> +
> +#define MAX9296A_PATGEN_0			0x240
> +#define MAX9296A_PATGEN_0_VTG_MODE		GENMASK(1, 0)
> +#define MAX9296A_PATGEN_0_VTG_MODE_FREE_RUNNING	0b11
> +#define MAX9296A_PATGEN_0_DE_INV		BIT(2)
> +#define MAX9296A_PATGEN_0_HS_INV		BIT(3)
> +#define MAX9296A_PATGEN_0_VS_INV		BIT(4)
> +#define MAX9296A_PATGEN_0_GEN_DE		BIT(5)
> +#define MAX9296A_PATGEN_0_GEN_HS		BIT(6)
> +#define MAX9296A_PATGEN_0_GEN_VS		BIT(7)
> +
> +#define MAX9296A_PATGEN_1			0x241
> +#define MAX9296A_PATGEN_1_PATGEN_MODE		GENMASK(5, 4)
> +#define MAX9296A_PATGEN_1_PATGEN_MODE_DISABLED	0b00
> +#define MAX9296A_PATGEN_1_PATGEN_MODE_CHECKER	0b11
> +#define MAX9296A_PATGEN_1_PATGEN_MODE_GRADIENT	0b10
> +
> +#define MAX9296A_VS_DLY_2			0x242
> +#define MAX9296A_VS_HIGH_2			0x245
> +#define MAX9296A_VS_LOW_2			0x248
> +#define MAX9296A_V2H_2				0x24b
> +#define MAX9296A_HS_HIGH_1			0x24e
> +#define MAX9296A_HS_LOW_1			0x250
> +#define MAX9296A_HS_CNT_1			0x252
> +#define MAX9296A_V2D_2				0x254
> +#define MAX9296A_DE_HIGH_1			0x257
> +#define MAX9296A_DE_LOW_1			0x259
> +#define MAX9296A_DE_CNT_1			0x25b
> +#define MAX9296A_GRAD_INCR			0x25d
> +#define MAX9296A_CHKR_COLOR_A_L			0x25e
> +#define MAX9296A_CHKR_COLOR_B_L			0x261
> +#define MAX9296A_CHKR_RPT_A			0x264
> +#define MAX9296A_CHKR_RPT_B			0x265
> +#define MAX9296A_CHKR_ALT			0x266
> +
> +#define MAX9296A_BACKTOP12			0x313
> +#define MAX9296A_BACKTOP12_CSI_OUT_EN		BIT(1)
> +
> +#define MAX9296A_BACKTOP21			0x31c
> +#define MAX9296A_BACKTOP21_BPP8DBL(p)		BIT(4 + (p))
> +
> +#define MAX9296A_BACKTOP22(x)			(0x31d + (x) * 0x3)
> +#define MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL	GENMASK(4, 0)
> +#define MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL_EN	BIT(5)
> +
> +#define MAX9296A_BACKTOP24			0x31f
> +#define MAX9296A_BACKTOP24_BPP8DBL_MODE(p)	BIT(4 + (p))
> +
> +#define MAX9296A_BACKTOP32			0x327
> +#define MAX9296A_BACKTOP32_BPP10DBL(p)		BIT(p)
> +#define MAX9296A_BACKTOP32_BPP10DBL_MODE(p)	BIT(4 + (p))
> +
> +#define MAX9296A_BACKTOP33			0x328
> +#define MAX9296A_BACKTOP32_BPP12DBL(p)		BIT(p)
> +
> +#define MAX9296A_MIPI_PHY0			0x330
> +#define MAX9296A_MIPI_PHY0_FORCE_CSI_OUT_EN	BIT(7)
> +
> +#define MAX9296A_MIPI_PHY2			0x332
> +#define MAX9296A_MIPI_PHY2_PHY_STDBY_N(x)	(GENMASK(5, 4) << ((x) * 2))
> +
> +#define MAX9296A_MIPI_PHY3(x)			(0x333 + (x))
> +#define MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4	GENMASK(7, 0)
> +
> +#define MAX9296A_MIPI_PHY5(x)			(0x335 + (x))
> +#define MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1	GENMASK(1, 0)
> +#define MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3	GENMASK(4, 3)
> +#define MAX9296A_MIPI_PHY5_PHY_POL_MAP_CLK(x)	BIT((x) =3D=3D 0 ? 5 : 2)
> +
> +#define MAX9296A_MIPI_PHY18			0x342
> +#define MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(x)	(GENMASK(3, 0) << (4 * (x=
)))
> +
> +#define MAX9296A_MIPI_PHY20(x)			(0x344 + (x))
> +
> +#define MAX9296A_MIPI_TX3(x)			(0x403 + (x) * 0x40)
> +#define MAX9296A_MIPI_TX3_DESKEW_INIT_8X32K	FIELD_PREP(GENMASK(2, 0), 0b=
001)
> +#define MAX9296A_MIPI_TX3_DESKEW_INIT_AUTO	BIT(7)
> +
> +#define MAX9296A_MIPI_TX4(x)			(0x404 + (x) * 0x40)
> +#define MAX9296A_MIPI_TX4_DESKEW_PER_2K		FIELD_PREP(GENMASK(2, 0), 0b001=
)
> +#define MAX9296A_MIPI_TX4_DESKEW_PER_AUTO	BIT(7)
> +
> +#define MAX9296A_MIPI_TX10(x)			(0x40a + (x) * 0x40)
> +#define MAX9296A_MIPI_TX10_CSI2_LANE_CNT	GENMASK(7, 6)
> +#define MAX9296A_MIPI_TX10_CSI2_CPHY_EN		BIT(5)
> +
> +#define MAX9296A_MIPI_TX11(p)			(0x40b + (p) * 0x40)
> +#define MAX9296A_MIPI_TX12(p)			(0x40c + (p) * 0x40)
> +
> +#define MAX9296A_MIPI_TX13(p, x)		(0x40d + (p) * 0x40 + (x) * 0x2)
> +#define MAX9296A_MIPI_TX13_MAP_SRC_DT		GENMASK(5, 0)
> +#define MAX9296A_MIPI_TX13_MAP_SRC_VC		GENMASK(7, 6)
> +
> +#define MAX9296A_MIPI_TX14(p, x)		(0x40e + (p) * 0x40 + (x) * 0x2)
> +#define MAX9296A_MIPI_TX14_MAP_DST_DT		GENMASK(5, 0)
> +#define MAX9296A_MIPI_TX14_MAP_DST_VC		GENMASK(7, 6)
> +
> +#define MAX9296A_MIPI_TX45(p, x)		(0x42d + (p) * 0x40 + (x) / 4)
> +#define MAX9296A_MIPI_TX45_MAP_DPHY_DEST(x)	(GENMASK(1, 0) << (2 * ((x) =
% 4)))
> +
> +#define MAX9296A_MIPI_TX51(x)			(0x433 + (x) * 0x40)
> +#define MAX9296A_MIPI_TX51_ALT_MEM_MAP_12	BIT(0)
> +#define MAX9296A_MIPI_TX51_ALT_MEM_MAP_8	BIT(1)
> +#define MAX9296A_MIPI_TX51_ALT_MEM_MAP_10	BIT(2)
> +#define MAX9296A_MIPI_TX51_ALT2_MEM_MAP_8	BIT(4)
> +
> +#define MAX9296A_MIPI_TX52(x)			(0x434 +=C2=A0 (x) * 0x40)
> +#define MAX9296A_MIPI_TX52_TUN_DEST		BIT(1)
> +#define MAX9296A_MIPI_TX52_TUN_EN		BIT(0)
> +
> +#define MAX9296A_GMSL1_EN			0xf00
> +#define MAX9296A_GMSL1_EN_LINK_EN		GENMASK(1, 0)
> +
> +#define MAX9296A_RLMS3E(x)			(0x143e + (x) * 0x100)
> +#define MAX9296A_RLMS3F(x)			(0x143f + (x) * 0x100)
> +#define MAX9296A_RLMS49(x)			(0x1449 + (x) * 0x100)
> +#define MAX9296A_RLMS7E(x)			(0x147e + (x) * 0x100)
> +#define MAX9296A_RLMS7F(x)			(0x147f + (x) * 0x100)
> +#define MAX9296A_RLMSA3(x)			(0x14a3 + (x) * 0x100)
> +#define MAX9296A_RLMSA5(x)			(0x14a5 + (x) * 0x100)
> +#define MAX9296A_RLMSD8(x)			(0x14d8 + (x) * 0x100)
> +
> +#define MAX9296A_DPLL_0(x)			(0x1c00 + (x) * 0x100)
> +#define MAX9296A_DPLL_0_CONFIG_SOFT_RST_N	BIT(0)
> +
> +#define MAX9296A_PIPES_NUM			4
> +#define MAX9296A_PHYS_NUM			2
> +
> +static const struct regmap_config max9296a_i2c_regmap =3D {
> +	.reg_bits =3D 16,
> +	.val_bits =3D 8,
> +};
> +
> +struct max9296a_priv {
> +	struct max_des des;
> +	const struct max9296a_chip_info *info;
> +
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +
> +	struct gpio_desc *gpiod_pwdn;
> +};
> +
> +struct max9296a_chip_info {
> +	const struct max_des_ops *ops;
> +	unsigned int max_register;
> +	unsigned int pipe_hw_ids[MAX9296A_PIPES_NUM];
> +	unsigned int phy_hw_ids[MAX9296A_PHYS_NUM];
> +	bool use_atr;
> +	bool has_per_link_reset;
> +	bool phy0_lanes_0_1_on_second_phy;
> +	bool polarity_on_physical_lanes;
> +	bool supports_cphy;
> +	bool supports_phy_log;
> +	bool adjust_rlms;
> +};
> +
> +#define des_to_priv(_des) \
> +	container_of(_des, struct max9296a_priv, des)
> +
> +static int max9296a_wait_for_device(struct max9296a_priv *priv)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		unsigned int val;
> +
> +		ret =3D regmap_read(priv->regmap, MAX9296A_REG0, &val);
> +		if (!ret && val)
> +			return 0;
> +
> +		msleep(100);
> +
> +		dev_err(priv->dev, "Retry %u waiting for deserializer: %d\n", i, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int max9296a_reset(struct max9296a_priv *priv)
> +{
> +	int ret;
> +
> +	ret =3D max9296a_wait_for_device(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(priv->regmap, MAX9296A_CTRL0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX9296A_CTRL0_RESET_ALL);
> +	if (ret)
> +		return ret;
> +
> +	msleep(100);
> +
> +	return max9296a_wait_for_device(priv);
> +}
> +
> +static unsigned int max9296a_pipe_id(struct max9296a_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe)
> +{
> +	return priv->info->pipe_hw_ids[pipe->index];
> +}
> +
> +static unsigned int max9296a_phy_id(struct max9296a_priv *priv,
> +				=C2=A0=C2=A0=C2=A0 struct max_des_phy *phy)
> +{
> +	return priv->info->phy_hw_ids[phy->index];
> +}
> +
> +static int max9296a_reg_read(struct max_des *des, unsigned int reg,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *val)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +
> +	return regmap_read(priv->regmap, reg, val);
> +}
> +
> +static int max9296a_reg_write(struct max_des *des, unsigned int reg,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +
> +	return regmap_write(priv->regmap, reg, val);
> +}
> +
> +static int max9626a_log_pipe_status(struct max_des *des,
> +				=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(priv->regmap, MAX9296A_VPRBS(index), &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tvideo_lock: %u\n",
> +		 !!(val & MAX9296A_VPRBS_VIDEO_LOCK));
> +
> +	return 0;
> +}
> +
> +static int max9296a_log_phy_status(struct max_des *des,
> +				=C2=A0=C2=A0 struct max_des_phy *phy)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D phy->index;
> +	unsigned int val;
> +	int ret;
> +
> +	if (!priv->info->supports_phy_log)
> +		return 0;
> +
> +	ret =3D regmap_read(priv->regmap, MAX9296A_MIPI_PHY18, &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tcsi2_pkt_cnt: %lu\n",
> +		 field_get(MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(index), val));
> +
> +	ret =3D regmap_read(priv->regmap, MAX9296A_MIPI_PHY20(index), &val);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "\tphy_pkt_cnt: %u\n", val);
> +
> +	return 0;
> +}
> +
> +static int max9296a_set_enable(struct max_des *des, bool enable)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP12,
> +				=C2=A0 MAX9296A_BACKTOP12_CSI_OUT_EN, enable);
> +}
> +
> +static int max9296a_init_tpg(struct max_des *des)
> +{
> +	const struct reg_sequence regs[] =3D {
> +		{ MAX9296A_GRAD_INCR, MAX_SERDES_GRAD_INCR },
> +		REG_SEQUENCE_3_LE(MAX9296A_CHKR_COLOR_A_L,
> +				=C2=A0 MAX_SERDES_CHECKER_COLOR_A),
> +		REG_SEQUENCE_3_LE(MAX9296A_CHKR_COLOR_B_L,
> +				=C2=A0 MAX_SERDES_CHECKER_COLOR_B),
> +		{ MAX9296A_CHKR_RPT_A, MAX_SERDES_CHECKER_SIZE },
> +		{ MAX9296A_CHKR_RPT_B, MAX_SERDES_CHECKER_SIZE },
> +		{ MAX9296A_CHKR_ALT, MAX_SERDES_CHECKER_SIZE },
> +	};
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +
> +	return regmap_multi_reg_write(priv->regmap, regs, ARRAY_SIZE(regs));
> +}
> +
> +static int max9296a_init(struct max_des *des)
> +{
> +	return max9296a_init_tpg(des);
> +}
> +
> +static int max9296a_init_phy(struct max_des *des, struct max_des_phy *ph=
y)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	bool is_cphy =3D phy->bus_type =3D=3D V4L2_MBUS_CSI2_CPHY;
> +	unsigned int num_data_lanes =3D phy->mipi.num_data_lanes;
> +	unsigned int dpll_freq =3D phy->link_frequency * 2;
> +	unsigned int num_hw_data_lanes;
> +	unsigned int hw_index =3D max9296a_phy_id(priv, phy);
> +	unsigned int index =3D phy->index;
> +	unsigned int used_data_lanes =3D 0;
> +	unsigned int val;
> +	unsigned int i;
> +	int ret;
> +
> +	if (is_cphy && !priv->info->supports_cphy) {
> +		dev_err(priv->dev, "CPHY not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	num_hw_data_lanes =3D max_des_phy_hw_data_lanes(des, phy);
> +
> +	/*
> +	 * MAX9296A has four PHYs, but does not support single-PHY configuratio=
ns,
> +	 * only double-PHY configurations, even when only using two lanes.
> +	 * For PHY 0 + PHY 1, PHY 1 is the master PHY.
> +	 * For PHY 2 + PHY 3, PHY 2 is the master PHY.
> +	 * Clock is always on the master PHY.
> +	 * For first pair of PHYs, first lanes are on the master PHY.
> +	 * For second pair of PHYs, first lanes are on the master PHY too.
> +	 *
> +	 * PHY 0 + 1
> +	 * CLK =3D PHY 1
> +	 * PHY1 Lane 0 =3D D0
> +	 * PHY1 Lane 1 =3D D1
> +	 * PHY0 Lane 0 =3D D2
> +	 * PHY0 Lane 1 =3D D3
> +	 *
> +	 * PHY 2 + 3
> +	 * CLK =3D PHY 2
> +	 * PHY2 Lane 0 =3D D0
> +	 * PHY2 Lane 1 =3D D1
> +	 * PHY3 Lane 0 =3D D2
> +	 * PHY3 Lane 1 =3D D3
> +	 *
> +	 * MAX96714 only has two PHYs which cannot support single-PHY configura=
tions.
> +	 * Clock is always on the master PHY, first lanes are on PHY 0, even if
> +	 * PHY 1 is the master PHY.
> +	 *
> +	 * PHY 0 + 1
> +	 * CLK =3D PHY 1
> +	 * PHY0 Lane 0 =3D D0
> +	 * PHY0 Lane 1 =3D D1
> +	 * PHY1 Lane 0 =3D D2
> +	 * PHY1 Lane 1 =3D D3
> +	 */
> +
> +	/* Configure a lane count. */
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_MIPI_TX10(hw_index),
> +				 MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
> +				 FIELD_PREP(MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
> +					=C2=A0=C2=A0=C2=A0 num_data_lanes - 1));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX10(hw_index),
> +				 MAX9296A_MIPI_TX10_CSI2_CPHY_EN, is_cphy);
> +	if (ret)
> +		return ret;
> +
> +	/* Configure lane mapping. */
> +	/*
> +	 * The lane of each PHY can be mapped to physical lanes 0, 1, 2, and 3.
> +	 * This mapping is exclusive, multiple lanes, even if unused cannot be
> +	 * mapped to the same physical lane.
> +	 * Each lane mapping is represented as two bits.
> +	 */
> +	val =3D 0;
> +	for (i =3D 0; i < num_hw_data_lanes ; i++) {
> +		unsigned int map;
> +
> +		if (i < num_data_lanes)
> +			map =3D phy->mipi.data_lanes[i] - 1;
> +		else
> +			map =3D ffz(used_data_lanes);
> +
> +		val |=3D map << (i * 2);
> +		used_data_lanes |=3D BIT(map);
> +	}
> +
> +	if (phy->index =3D=3D 0 && priv->info->phy0_lanes_0_1_on_second_phy)
> +		val =3D ((val & 0xf) << 4) | ((val >> 4) & 0xf);
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY3(index),
> +				 MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4,
> +				 FIELD_PREP(MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4, val));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Configure lane polarity.
> +	 *
> +	 * PHY 0 and 1 are on register 0x335.
> +	 * PHY 2 and 3 are on register 0x336.
> +	 *
> +	 * Each PHY has 3 bits of polarity configuration.
> +	 *
> +	 * On MAX9296A, each bit represents the lane polarity of logical lanes.
> +	 * Each of these lanes can be mapped to any physical lane.
> +	 * 0th bit is for lane 0.
> +	 * 1st bit is for lane 1.
> +	 * 2nd bit is for clock lane.
> +	 *
> +	 * On MAX96714, each bit represents the lane polarity of physical lanes=
.
> +	 * 0th bit for physical lane 0.
> +	 * 1st bit for physical lane 1.
> +	 * 2nd bit for clock lane of PHY 0, the slave PHY, which is unused.
> +	 *
> +	 * 3rd bit for physical lane 2.
> +	 * 4th bit for physical lane 3.
> +	 * 5th bit for clock lane of PHY 1, the master PHY.
> +	 */
> +
> +	for (i =3D 0, val =3D 0; i < num_data_lanes; i++) {
> +		unsigned int map;
> +
> +		if (!phy->mipi.lane_polarities[i + 1])
> +			continue;
> +
> +		/*
> +		 * The numbers inside the data_lanes array specify the hardware
> +		 * lane each logical lane maps to.
> +		 * If polarity is set for the physical lanes, retrieve the
> +		 * physical lane matching the logical lane from data_lanes.
> +		 * Otherwise, when polarity is set for the logical lanes
> +		 * the index of the polarity can be used.
> +		 */
> +
> +		if (priv->info->polarity_on_physical_lanes)
> +			map =3D phy->mipi.data_lanes[i] - 1;
> +		else
> +			map =3D i;
> +
> +		val |=3D BIT(map);
> +	}
> +
> +	if (phy->index =3D=3D 0 && priv->info->phy0_lanes_0_1_on_second_phy)
> +		val =3D ((val & 0x3) << 2) | ((val >> 2) & 0x3);
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
> +				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1 |
> +				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3,
> +				 FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1, val) |
> +				 FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3, val >> 2));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
> +				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_CLK(index),
> +				 phy->mipi.lane_polarities[0]);
> +	if (ret)
> +		return ret;
> +
> +	/* Put DPLL block into reset. */
> +	ret =3D regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
> +				MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> +	if (ret)
> +		return ret;
> +
> +	/* Set DPLL frequency. */
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_BACKTOP22(index),
> +				 MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL,
> +				 FIELD_PREP(MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL,
> +					=C2=A0=C2=A0=C2=A0 div_u64(dpll_freq, 100000000)));
> +	if (ret)
> +		return ret;
> +
> +	/* Enable DPLL frequency. */
> +	ret =3D regmap_set_bits(priv->regmap, MAX9296A_BACKTOP22(index),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL_EN)=
;
> +	if (ret)
> +		return ret;
> +
> +	/* Pull DPLL block out of reset. */
> +	ret =3D regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> +	if (ret)
> +		return ret;
> +
> +	if (dpll_freq > 1500000000ull) {
> +		/* Enable initial deskew with 2 x 32k UI. */
> +		ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX3(hw_index),
> +				=C2=A0=C2=A0 MAX9296A_MIPI_TX3_DESKEW_INIT_AUTO |
> +				=C2=A0=C2=A0 MAX9296A_MIPI_TX3_DESKEW_INIT_8X32K);
> +		if (ret)
> +			return ret;
> +
> +		/* Enable periodic deskew with 2 x 1k UI.. */
> +		ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX4(hw_index),
> +				=C2=A0=C2=A0 MAX9296A_MIPI_TX4_DESKEW_PER_AUTO |
> +				=C2=A0=C2=A0 MAX9296A_MIPI_TX4_DESKEW_PER_2K);
> +		if (ret)
> +			return ret;
> +	} else {
> +		/* Disable initial deskew. */
> +		ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX3(hw_index), 0x0);
> +		if (ret)
> +			return ret;
> +
> +		/* Disable periodic deskew. */
> +		ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX4(hw_index), 0x0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max9296a_set_phy_mode(struct max_des *des, struct max_des_phy=
 *phy,
> +				 struct max_des_phy_mode *mode)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int phy_id =3D max9296a_phy_id(priv, phy);
> +	int ret;
> +
> +	/* Set alternate memory map modes. */
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
> +				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_12,
> +				 mode->alt_mem_map12);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
> +				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_8,
> +				 mode->alt_mem_map8);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
> +				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_10,
> +				 mode->alt_mem_map10);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
> +				=C2=A0 MAX9296A_MIPI_TX51_ALT2_MEM_MAP_8,
> +				=C2=A0 mode->alt2_mem_map8);
> +}
> +
> +static int max9296a_set_phy_enable(struct max_des *des, struct max_des_p=
hy *phy,
> +				=C2=A0=C2=A0 bool enable)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_PHY2,
> +				=C2=A0 MAX9296A_MIPI_PHY2_PHY_STDBY_N(phy->index), enable);
> +}
> +
> +static int max9296a_set_pipe_remap(struct max_des *des,
> +				=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0 unsigned int i,
> +				=C2=A0=C2=A0 struct max_des_remap *remap)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	struct max_des_phy *phy =3D &des->phys[remap->phy];
> +	unsigned int phy_id =3D max9296a_phy_id(priv, phy);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +	int ret;
> +
> +	/* Set source Data Type and Virtual Channel. */
> +	/* TODO: implement extended Virtual Channel. */
> +	ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX13(index, i),
> +			=C2=A0=C2=A0 FIELD_PREP(MAX9296A_MIPI_TX13_MAP_SRC_DT,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remap->from_dt) |
> +			=C2=A0=C2=A0 FIELD_PREP(MAX9296A_MIPI_TX13_MAP_SRC_VC,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remap->from_vc));
> +	if (ret)
> +		return ret;
> +
> +	/* Set destination Data Type and Virtual Channel. */
> +	/* TODO: implement extended Virtual Channel. */
> +	ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX14(index, i),
> +			=C2=A0=C2=A0 FIELD_PREP(MAX9296A_MIPI_TX14_MAP_DST_DT,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remap->to_dt) |
> +			=C2=A0=C2=A0 FIELD_PREP(MAX9296A_MIPI_TX14_MAP_DST_VC,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remap->to_vc));
> +	if (ret)
> +		return ret;
> +
> +	/* Set destination PHY. */
> +	return regmap_update_bits(priv->regmap, MAX9296A_MIPI_TX45(index, i),
> +				=C2=A0 MAX9296A_MIPI_TX45_MAP_DPHY_DEST(i),
> +				=C2=A0 field_prep(MAX9296A_MIPI_TX45_MAP_DPHY_DEST(i),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 phy_id));
> +}
> +
> +static int max9296a_set_pipe_remaps_enable(struct max_des *des,
> +					=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +					=C2=A0=C2=A0 unsigned int mask)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +	int ret;
> +
> +	ret =3D regmap_write(priv->regmap, MAX9296A_MIPI_TX11(index), mask);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, MAX9296A_MIPI_TX12(index), mask >> 8)=
;
> +}
> +
> +static int max9296a_set_pipe_enable(struct max_des *des, struct max_des_=
pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0 bool enable)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_REG2,
> +				=C2=A0 MAX9296A_REG2_VID_EN(index), enable);
> +}
> +
> +static int max96714_set_pipe_enable(struct max_des *des, struct max_des_=
pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0 bool enable)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_VIDEO_PIPE_EN,
> +				=C2=A0 MAX9296A_VIDEO_PIPE_EN_MASK(index - 1), enable);
> +}
> +
> +static int max96714_set_pipe_tunnel_enable(struct max_des *des,
> +					=C2=A0=C2=A0 struct max_des_pipe *pipe, bool enable)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX52(index),
> +				=C2=A0 MAX9296A_MIPI_TX52_TUN_EN, enable);
> +}
> +
> +static int max9296a_set_pipe_stream_id(struct max_des *des, struct max_d=
es_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int stream_id)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +
> +	return regmap_update_bits(priv->regmap, MAX9296A_RX50(index), MAX9296A_=
RX50_STR_SEL,
> +				=C2=A0 FIELD_PREP(MAX9296A_RX50_STR_SEL, pipe->stream_id));
> +}
> +
> +static int max96714_set_pipe_stream_id(struct max_des *des, struct max_d=
es_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int stream_id)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D pipe->index;
> +
> +	return regmap_update_bits(priv->regmap, MAX9296A_VIDEO_PIPE_SEL,
> +				=C2=A0 MAX9296A_VIDEO_PIPE_SEL_STREAM(index),
> +				=C2=A0 field_prep(MAX9296A_VIDEO_PIPE_SEL_STREAM(index),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 stream_id));
> +}
> +
> +static int max96716a_set_pipe_link(struct max_des *des, struct max_des_p=
ipe *pipe,
> +				=C2=A0=C2=A0 struct max_des_link *link)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D pipe->index;
> +
> +	return regmap_update_bits(priv->regmap, MAX9296A_VIDEO_PIPE_SEL,
> +				=C2=A0 MAX9296A_VIDEO_PIPE_SEL_LINK(index),
> +				=C2=A0 field_prep(MAX9296A_VIDEO_PIPE_SEL_LINK(index),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 link->index));
> +}
> +
> +static int max96716a_set_pipe_tunnel_phy(struct max_des *des,
> +					 struct max_des_pipe *pipe,
> +					 struct max_des_phy *phy)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX52(index),
> +				=C2=A0 MAX9296A_MIPI_TX52_TUN_DEST, phy->index);
> +}
> +
> +static int max9296a_set_pipe_mode(struct max_des *des,
> +				=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0 struct max_des_pipe_mode *mode)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +	int ret;
> +
> +	/* Set 8bit double mode. */
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP21,
> +				 MAX9296A_BACKTOP21_BPP8DBL(index), mode->dbl8);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP24,
> +				 MAX9296A_BACKTOP24_BPP8DBL_MODE(index),
> +				 mode->dbl8mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Set 10bit double mode. */
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP32,
> +				 MAX9296A_BACKTOP32_BPP10DBL(index), mode->dbl10);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP32,
> +				 MAX9296A_BACKTOP32_BPP10DBL_MODE(index),
> +				 mode->dbl10mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Set 12bit double mode. */
> +	/* TODO: check support for double mode on MAX96714. */
> +	return regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP33,
> +				=C2=A0 MAX9296A_BACKTOP32_BPP12DBL(index), mode->dbl12);
> +}
> +
> +static int max9296a_reset_link(struct max9296a_priv *priv, unsigned int =
index)
> +{
> +	unsigned int reg, mask;
> +
> +	if (index =3D=3D 0) {
> +		reg =3D MAX9296A_CTRL0;
> +		mask =3D MAX9296A_CTRL0_RESET_ONESHOT;
> +	} else {
> +		reg =3D MAX9296A_CTRL2;
> +		mask =3D MAX9296A_CTRL2_RESET_ONESHOT_B;
> +	}
> +
> +	return regmap_set_bits(priv->regmap, reg, mask);
> +}
> +
> +static int max9296a_init_link_rlms(struct max9296a_priv *priv,
> +				=C2=A0=C2=A0 struct max_des_link *link)
> +{
> +	unsigned int index =3D link->index;
> +	/*
> +	 * These register writes are described as required in MAX96714 datashee=
t
> +	 * Page 53, Section Register Map, to optimize link performance in 6Gbps
> +	 * and 3Gbps links for all cable lengths.
> +	 */
> +	const struct reg_sequence regs[] =3D {
> +		{ MAX9296A_RLMS3E(index), 0xfd },
> +		{ MAX9296A_RLMS3F(index), 0x3d },
> +		{ MAX9296A_RLMS49(index), 0xf5 },
> +		{ MAX9296A_RLMS7E(index), 0xa8 },
> +		{ MAX9296A_RLMS7F(index), 0x68 },
> +		{ MAX9296A_RLMSA3(index), 0x30 },
> +		{ MAX9296A_RLMSA5(index), 0x70 },
> +		{ MAX9296A_RLMSD8(index), 0x07 },
> +	};
> +	int ret;
> +
> +	ret =3D regmap_multi_reg_write(priv->regmap, regs, ARRAY_SIZE(regs));
> +	if (ret)
> +		return ret;
> +
> +	return max9296a_reset_link(priv, link->index);
> +}
> +
> +static int max9296a_init_link(struct max_des *des, struct max_des_link *=
link)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	int ret;
> +
> +	if (priv->info->adjust_rlms) {
> +		ret =3D max9296a_init_link_rlms(priv, link);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max9296a_select_links(struct max_des *des, unsigned int mask)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	int ret;
> +
> +	if (des->ops->num_links =3D=3D 1)
> +		return 0;
> +
> +	if (!mask) {
> +		dev_err(priv->dev, "Disable all links unsupported\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_GMSL1_EN,
> +				 MAX9296A_GMSL1_EN_LINK_EN,
> +				 FIELD_PREP(MAX9296A_GMSL1_EN_LINK_EN, mask));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_CTRL0,
> +				 MAX9296A_CTRL0_AUTO_LINK |
> +				 MAX9296A_CTRL0_LINK_CFG |
> +				 MAX9296A_CTRL0_RESET_ONESHOT,
> +				 FIELD_PREP(MAX9296A_CTRL0_LINK_CFG, mask) |
> +				 FIELD_PREP(MAX9296A_CTRL0_RESET_ONESHOT, 1));
> +	if (ret)
> +		return ret;
> +
> +	if (priv->info->has_per_link_reset) {
> +		ret =3D max9296a_reset_link(priv, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	msleep(200);
> +
> +	return 0;
> +}
> +
> +static int max9296a_set_link_version(struct max_des *des,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link *link,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 enum max_serdes_gmsl_version version)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D link->index;
> +	bool gmsl3_en =3D version =3D=3D MAX_SERDES_GMSL_3;
> +	unsigned int reg, mask, val;
> +	int ret;
> +
> +	if (des->ops->needs_single_link_version)
> +		index =3D 0;
> +
> +	if (index =3D=3D 0) {
> +		reg =3D MAX9296A_REG1;
> +		mask =3D MAX9296A_REG1_RX_RATE_A;
> +	} else {
> +		reg =3D MAX9296A_REG4;
> +		mask =3D MAX9296A_REG4_RX_RATE_B;
> +	}
> +
> +	if (version =3D=3D MAX_SERDES_GMSL_3)
> +		val =3D MAX9296A_REG1_RX_RATE_12GBPS;
> +	else if (version =3D=3D MAX_SERDES_GMSL_2_6GBPS)
> +		val =3D MAX9296A_REG1_RX_RATE_6GBPS;
> +	else
> +		val =3D MAX9296A_REG1_RX_RATE_3GBPS;
> +
> +	ret =3D regmap_update_bits(priv->regmap, reg, mask, field_prep(mask, va=
l));
> +	if (ret)
> +		return ret;
> +
> +	if (!(des->ops->versions & BIT(MAX_SERDES_GMSL_3)))
> +		return 0;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX0(index),
> +				 MAX9296A_MIPI_TX0_RX_FEC_EN, gmsl3_en);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_REG6,
> +				 MAX9296A_REG6_GMSL2_X(index), !gmsl3_en);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_REG4,
> +				=C2=A0 MAX9296A_REG4_GMSL3_X(index), gmsl3_en);
> +}
> +
> +static int max9296a_set_tpg_timings(struct max9296a_priv *priv,
> +				=C2=A0=C2=A0=C2=A0 const struct max_serdes_tpg_timings *tm)
> +{
> +	const struct reg_sequence regs[] =3D {
> +		REG_SEQUENCE_3(MAX9296A_VS_DLY_2, tm->vs_dly),
> +		REG_SEQUENCE_3(MAX9296A_VS_HIGH_2, tm->vs_high),
> +		REG_SEQUENCE_3(MAX9296A_VS_LOW_2, tm->vs_low),
> +		REG_SEQUENCE_3(MAX9296A_V2H_2, tm->v2h),
> +		REG_SEQUENCE_2(MAX9296A_HS_HIGH_1, tm->hs_high),
> +		REG_SEQUENCE_2(MAX9296A_HS_LOW_1, tm->hs_low),
> +		REG_SEQUENCE_2(MAX9296A_HS_CNT_1, tm->hs_cnt),
> +		REG_SEQUENCE_3(MAX9296A_V2D_2, tm->v2d),
> +		REG_SEQUENCE_2(MAX9296A_DE_HIGH_1, tm->de_high),
> +		REG_SEQUENCE_2(MAX9296A_DE_LOW_1, tm->de_low),
> +		REG_SEQUENCE_2(MAX9296A_DE_CNT_1, tm->de_cnt),
> +	};
> +	int ret;
> +
> +	ret =3D regmap_multi_reg_write(priv->regmap, regs, ARRAY_SIZE(regs));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, MAX9296A_PATGEN_0,
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_VTG_MODE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX9296A_PATGEN_0_VTG_MODE_FREE=
_RUNNING) |
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_DE_INV, tm->de_inv) |
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_HS_INV, tm->hs_inv) |
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_VS_INV, tm->vs_inv) |
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_GEN_DE, tm->gen_de) |
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_GEN_HS, tm->gen_hs) |
> +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(MAX9296A_PATGEN_0_GEN_VS, tm->gen_vs));
> +}
> +
> +static int max9296a_set_tpg_clk(struct max9296a_priv *priv, u32 clock)
> +{
> +	bool patgen_clk_src =3D 0;
> +	u8 pin_drv_en;
> +	int ret;
> +
> +	switch (clock) {
> +	case 25000000:
> +		pin_drv_en =3D MAX9296A_IO_CHK0_PIN_DRV_EN_0_25MHZ;
> +		break;
> +	case 75000000:
> +		pin_drv_en =3D MAX9296A_IO_CHK0_PIN_DRV_EN_0_75MHZ;
> +		break;
> +	case 150000000:
> +		pin_drv_en =3D MAX9296A_IO_CHK0_PIN_DRV_EN_0_USE_PIPE;
> +		patgen_clk_src =3D MAX9296A_VPRBS_PATGEN_CLK_SRC_150MHZ;
> +		break;
> +	case 600000000:
> +		pin_drv_en =3D MAX9296A_IO_CHK0_PIN_DRV_EN_0_USE_PIPE;
> +		patgen_clk_src =3D MAX9296A_VPRBS_PATGEN_CLK_SRC_600MHZ;
> +		break;
> +	case 0:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * TPG data is always injected on link 0, which is always routed to
> +	 * pipe 0.
> +	 */
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_VPRBS(0),
> +				 MAX9296A_VPRBS_PATGEN_CLK_SRC,
> +				 FIELD_PREP(MAX9296A_VPRBS_PATGEN_CLK_SRC,
> +					=C2=A0=C2=A0=C2=A0 patgen_clk_src));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(priv->regmap, MAX9296A_IO_CHK0,
> +				=C2=A0 MAX9296A_IO_CHK0_PIN_DRV_EN_0,
> +				=C2=A0 FIELD_PREP(MAX9296A_IO_CHK0_PIN_DRV_EN_0,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 pin_drv_en));
> +}
> +
> +static int max9296a_set_tpg_mode(struct max9296a_priv *priv, bool enable=
)
> +{
> +	unsigned int patgen_mode;
> +
> +	switch (priv->des.tpg_pattern) {
> +	case MAX_SERDES_TPG_PATTERN_GRADIENT:
> +		patgen_mode =3D MAX9296A_PATGEN_1_PATGEN_MODE_GRADIENT;
> +		break;
> +	case MAX_SERDES_TPG_PATTERN_CHECKERBOARD:
> +		patgen_mode =3D MAX9296A_PATGEN_1_PATGEN_MODE_CHECKER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, MAX9296A_PATGEN_1,
> +				=C2=A0 MAX9296A_PATGEN_1_PATGEN_MODE,
> +				=C2=A0 FIELD_PREP(MAX9296A_PATGEN_1_PATGEN_MODE,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 enable ? patgen_mode
> +						=C2=A0=C2=A0=C2=A0 : MAX9296A_PATGEN_1_PATGEN_MODE_DISABLED));
> +}
> +
> +static int max9296a_set_tpg(struct max_des *des,
> +			=C2=A0=C2=A0=C2=A0 const struct max_serdes_tpg_entry *entry)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	struct max_serdes_tpg_timings timings =3D { 0 };
> +	int ret;
> +
> +	ret =3D max_serdes_get_tpg_timings(entry, &timings);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max9296a_set_tpg_timings(priv, &timings);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max9296a_set_tpg_clk(priv, timings.clock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max9296a_set_tpg_mode(priv, entry);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_PHY0,
> +				=C2=A0 MAX9296A_MIPI_PHY0_FORCE_CSI_OUT_EN, !!entry);
> +}
> +
> +static const struct max_serdes_tpg_entry max9296a_tpg_entries[] =3D {
> +	MAX_TPG_ENTRY_640X480P60_RGB888,
> +	MAX_TPG_ENTRY_1920X1080P30_RGB888,
> +	MAX_TPG_ENTRY_1920X1080P60_RGB888,
> +};
> +
> +static const struct max_des_ops max9296a_common_ops =3D {
> +	.num_remaps_per_pipe =3D 16,
> +	.tpg_entries =3D {
> +		.num_entries =3D ARRAY_SIZE(max9296a_tpg_entries),
> +		.entries =3D max9296a_tpg_entries,
> +	},
> +	.tpg_patterns =3D BIT(MAX_SERDES_TPG_PATTERN_CHECKERBOARD) |
> +			BIT(MAX_SERDES_TPG_PATTERN_GRADIENT),
#ifdef CONFIG_VIDEO_ADV_DEBUG
> +	.reg_read =3D max9296a_reg_read,
> +	.reg_write =3D max9296a_reg_write,
#endif

To make it clear that the registers are not read or modified outside of thi=
s file ?

> +	.log_pipe_status =3D max9626a_log_pipe_status,
> +	.log_phy_status =3D max9296a_log_phy_status,
> +	.set_enable =3D max9296a_set_enable,
> +	.init =3D max9296a_init,
> +	.init_phy =3D max9296a_init_phy,
> +	.set_phy_mode =3D max9296a_set_phy_mode,
> +	.set_phy_enable =3D max9296a_set_phy_enable,
> +	.set_pipe_remap =3D max9296a_set_pipe_remap,
> +	.set_pipe_remaps_enable =3D max9296a_set_pipe_remaps_enable,
> +	.set_pipe_mode =3D max9296a_set_pipe_mode,
> +	.set_tpg =3D max9296a_set_tpg,
> +	.init_link =3D max9296a_init_link,
> +	.select_links =3D max9296a_select_links,
> +	.set_link_version =3D max9296a_set_link_version,
> +};
> +
> +static int max9296a_probe(struct i2c_client *client)
> +{
> +	struct regmap_config i2c_regmap =3D max9296a_i2c_regmap;
> +	struct device *dev =3D &client->dev;
> +	struct max9296a_priv *priv;
> +	struct max_des_ops *ops;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ops =3D devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
> +	if (!ops)
> +		return -ENOMEM;
> +
> +	priv->info =3D device_get_match_data(dev);
> +	if (!priv->info) {
> +		dev_err(dev, "Failed to get match data\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->dev =3D dev;
> +	priv->client =3D client;
> +	i2c_set_clientdata(client, priv);
> +
> +	i2c_regmap.max_register =3D priv->info->max_register;
> +	priv->regmap =3D devm_regmap_init_i2c(client, &i2c_regmap);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	priv->gpiod_pwdn =3D devm_gpiod_get_optional(&client->dev, "powerdown",
> +						=C2=A0=C2=A0 GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->gpiod_pwdn))
> +		return PTR_ERR(priv->gpiod_pwdn);
> +
> +	if (priv->gpiod_pwdn) {
> +		/* PWDN must be held for 1us for reset */
> +		udelay(1);
> +
> +		gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> +		/* Maximum power-up time (tLOCK) 4ms */
> +		usleep_range(4000, 5000);
> +	}
> +
> +	*ops =3D max9296a_common_ops;
> +
> +	ops->versions =3D priv->info->ops->versions;
> +	ops->modes =3D priv->info->ops->modes;
> +	ops->needs_single_link_version =3D priv->info->ops->needs_single_link_v=
ersion;
> +	ops->needs_unique_stream_id =3D priv->info->ops->needs_unique_stream_id=
;
> +	ops->fix_tx_ids =3D priv->info->ops->fix_tx_ids;
> +	ops->num_phys =3D priv->info->ops->num_phys;
> +	ops->num_pipes =3D priv->info->ops->num_pipes;
> +	ops->num_links =3D priv->info->ops->num_links;
> +	ops->phys_configs =3D priv->info->ops->phys_configs;
> +	ops->set_pipe_enable =3D priv->info->ops->set_pipe_enable;
> +	ops->set_pipe_stream_id =3D priv->info->ops->set_pipe_stream_id;
> +	ops->set_pipe_tunnel_phy =3D priv->info->ops->set_pipe_tunnel_phy;
> +	ops->set_pipe_tunnel_enable =3D priv->info->ops->set_pipe_tunnel_enable=
;
> +	ops->use_atr =3D priv->info->ops->use_atr;
> +	ops->tpg_mode =3D priv->info->ops->tpg_mode;
> +	priv->des.ops =3D ops;
> +
> +	ret =3D max9296a_reset(priv);
> +	if (ret)
> +		return ret;
> +
> +	return max_des_probe(client, &priv->des);
> +}
> +
> +static void max9296a_remove(struct i2c_client *client)
> +{
> +	struct max9296a_priv *priv =3D i2c_get_clientdata(client);
> +
> +	max_des_remove(&priv->des);
> +
> +	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
> +}
> +
> +static const struct max_serdes_phys_config max9296a_phys_configs[] =3D {
> +	{ { 4, 4 } },
> +};
> +
> +static const struct max_serdes_phys_config max96714_phys_configs[] =3D {
> +	{ { 4 } },
> +};
> +
> +static const struct max_des_ops max9296a_ops =3D {
> +	.versions =3D BIT(MAX_SERDES_GMSL_2_3GBPS) |
> +		=C2=A0=C2=A0=C2=A0 BIT(MAX_SERDES_GMSL_2_6GBPS),
> +	.modes =3D BIT(MAX_SERDES_GMSL_PIXEL_MODE),
> +	.set_pipe_stream_id =3D max9296a_set_pipe_stream_id,
> +	.set_pipe_enable =3D max9296a_set_pipe_enable,
> +	.needs_single_link_version =3D true,
> +	.needs_unique_stream_id =3D true,
> +	.phys_configs =3D {
> +		.num_configs =3D ARRAY_SIZE(max9296a_phys_configs),
> +		.configs =3D max9296a_phys_configs,
> +	},
> +	.fix_tx_ids =3D true,
> +	.num_pipes =3D 4,
> +	.num_phys =3D 2,
> +	.num_links =3D 2,
> +};
> +
> +static const struct max9296a_chip_info max9296a_info =3D {
> +	.ops =3D &max9296a_ops,
> +	.max_register =3D 0x1f00,
> +	.use_atr =3D true,
> +	.phy0_lanes_0_1_on_second_phy =3D true,
> +	.pipe_hw_ids =3D { 0, 1, 2, 3 },
> +	.phy_hw_ids =3D { 1, 2 },
> +};
> +
> +static const struct max_des_ops max96714_ops =3D {
> +	.versions =3D BIT(MAX_SERDES_GMSL_2_3GBPS) |
> +		=C2=A0=C2=A0=C2=A0 BIT(MAX_SERDES_GMSL_2_6GBPS),
> +	.modes =3D BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
> +		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
> +	.set_pipe_stream_id =3D max96714_set_pipe_stream_id,
> +	.set_pipe_enable =3D max96714_set_pipe_enable,
> +	.set_pipe_tunnel_enable =3D max96714_set_pipe_tunnel_enable,
> +	.phys_configs =3D {
> +		.num_configs =3D ARRAY_SIZE(max96714_phys_configs),
> +		.configs =3D max96714_phys_configs,
> +	},
> +	.tpg_mode =3D MAX_SERDES_GMSL_PIXEL_MODE,
> +	.num_pipes =3D 1,
> +	.num_phys =3D 1,
> +	.num_links =3D 1,
> +};
> +
>=20
>=20
static const struct reg_sequence max96714_rlms_reg_sequence[] =3D {
		{ MAX9296A_RLMS3E(index), 0xfd },
		{ MAX9296A_RLMS3F(index), 0x3d },
		{ MAX9296A_RLMS49(index), 0xf5 },
		{ MAX9296A_RLMS7E(index), 0xa8 },
		{ MAX9296A_RLMS7F(index), 0x68 },
		{ MAX9296A_RLMSA3(index), 0x30 },
		{ MAX9296A_RLMSA5(index), 0x70 },
		{ MAX9296A_RLMSD8(index), 0x07 },
};
> +static const struct max9296a_chip_info max96714_info =3D {
> +	.ops =3D &max96714_ops,
> +	.max_register =3D 0x5011,
> +	.polarity_on_physical_lanes =3D true,
> +	.supports_phy_log =3D true,
> +	.adjust_rlms =3D true,
Instead of having a boolean here and a max96714 specific reg_sequence
in max9296a_init_link_rlms,
then you can have
        .rlms_adjust_sequence =3D &max96714_rlms_reg_sequence,
> +	.pipe_hw_ids =3D { 1 },
> +	.phy_hw_ids =3D { 1 },
> +};
> +
> +static const struct max_des_ops max96714f_ops =3D {
> +	.versions =3D BIT(MAX_SERDES_GMSL_2_3GBPS),
> +	.modes =3D BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
> +		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
> +	.set_pipe_stream_id =3D max96714_set_pipe_stream_id,
> +	.set_pipe_enable =3D max96714_set_pipe_enable,
> +	.set_pipe_tunnel_enable =3D max96714_set_pipe_tunnel_enable,
> +	.phys_configs =3D {
> +		.num_configs =3D ARRAY_SIZE(max96714_phys_configs),
> +		.configs =3D max96714_phys_configs,
> +	},
> +	.tpg_mode =3D MAX_SERDES_GMSL_PIXEL_MODE,
> +	.num_pipes =3D 1,
> +	.num_phys =3D 1,
> +	.num_links =3D 1,
> +};
> +
> +static const struct max9296a_chip_info max96714f_info =3D {
> +	.ops =3D &max96714f_ops,
> +	.max_register =3D 0x5011,
> +	.polarity_on_physical_lanes =3D true,
> +	.supports_phy_log =3D true,
> +	.adjust_rlms =3D true,
> +	.pipe_hw_ids =3D { 1 },
> +	.phy_hw_ids =3D { 1 },
> +};
> +
> +static const struct max_des_ops max96716a_ops =3D {
> +	.versions =3D BIT(MAX_SERDES_GMSL_2_3GBPS) |
> +		=C2=A0=C2=A0=C2=A0 BIT(MAX_SERDES_GMSL_2_6GBPS),
> +	.modes =3D BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
> +		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
> +	.set_pipe_stream_id =3D max96714_set_pipe_stream_id,
> +	.set_pipe_link =3D max96716a_set_pipe_link,
> +	.set_pipe_enable =3D max96714_set_pipe_enable,
> +	.set_pipe_tunnel_phy =3D max96716a_set_pipe_tunnel_phy,
> +	.set_pipe_tunnel_enable =3D max96714_set_pipe_tunnel_enable,
> +	.use_atr =3D true,
> +	.phys_configs =3D {
> +		.num_configs =3D ARRAY_SIZE(max9296a_phys_configs),
> +		.configs =3D max9296a_phys_configs,
> +	},
> +	.tpg_mode =3D MAX_SERDES_GMSL_PIXEL_MODE,
> +	.num_pipes =3D 2,
> +	.num_phys =3D 2,
> +	.num_links =3D 2,
> +};
> +
> +static const struct max9296a_chip_info max96716a_info =3D {
> +	.ops =3D &max96716a_ops,
> +	.max_register =3D 0x52d6,
> +	.has_per_link_reset =3D true,
> +	.phy0_lanes_0_1_on_second_phy =3D true,
> +	.supports_cphy =3D true,
> +	.supports_phy_log =3D true,
> +	.pipe_hw_ids =3D { 1, 2 },
> +	.phy_hw_ids =3D { 1, 2 },
> +};
> +
> +static const struct max_des_ops max96792a_ops =3D {
> +	.versions =3D BIT(MAX_SERDES_GMSL_2_3GBPS) |
> +		=C2=A0=C2=A0=C2=A0 BIT(MAX_SERDES_GMSL_2_6GBPS) |
> +		=C2=A0=C2=A0=C2=A0 BIT(MAX_SERDES_GMSL_3),
> +	.modes =3D BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
> +		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
> +	.set_pipe_stream_id =3D max96714_set_pipe_stream_id,
> +	.set_pipe_enable =3D max96714_set_pipe_enable,
> +	.set_pipe_tunnel_phy =3D max96716a_set_pipe_tunnel_phy,
> +	.set_pipe_tunnel_enable =3D max96714_set_pipe_tunnel_enable,
> +	.use_atr =3D true,
> +	.phys_configs =3D {
> +		.num_configs =3D ARRAY_SIZE(max9296a_phys_configs),
> +		.configs =3D max9296a_phys_configs,
> +	},
> +	.tpg_mode =3D MAX_SERDES_GMSL_PIXEL_MODE,
> +	.num_pipes =3D 2,
> +	.num_phys =3D 2,
> +	.num_links =3D 2,
> +};
> +
> +static const struct max9296a_chip_info max96792a_info =3D {
> +	.ops =3D &max96792a_ops,
> +	.max_register =3D 0x52d6,
> +	.has_per_link_reset =3D true,
> +	.phy0_lanes_0_1_on_second_phy =3D true,
> +	.supports_cphy =3D true,
> +	.supports_phy_log =3D true,
> +	.pipe_hw_ids =3D { 1, 2 },
> +	.phy_hw_ids =3D { 1, 2 },
> +};
> +
> +static const struct of_device_id max9296a_of_table[] =3D {
> +	{ .compatible =3D "maxim,max9296a", .data =3D &max9296a_info },
> +	{ .compatible =3D "maxim,max96714", .data =3D &max96714_info },
> +	{ .compatible =3D "maxim,max96714f", .data =3D &max96714f_info },
> +	{ .compatible =3D "maxim,max96714r", .data =3D &max96714f_info },
> +	{ .compatible =3D "maxim,max96716a", .data =3D &max96716a_info },
> +	{ .compatible =3D "maxim,max96792a", .data =3D &max96792a_info },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, max9296a_of_table);
> +
> +static struct i2c_driver max9296a_i2c_driver =3D {
> +	.driver	=3D {
> +		.name =3D "max9296a",
> +		.of_match_table	=3D max9296a_of_table,
> +	},
> +	.probe =3D max9296a_probe,
> +	.remove =3D max9296a_remove,
> +};
> +
> +module_i2c_driver(max9296a_i2c_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX9296A Quad GMSL2 Deserializer Driver");
> +MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
> +MODULE_LICENSE("GPL");
Regards,
--=20
Julien


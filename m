Return-Path: <linux-gpio+bounces-9206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 875259601CA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 08:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4024E284325
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 06:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4EE13DB99;
	Tue, 27 Aug 2024 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ge1yeaLP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UM6KNC0W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C33219F;
	Tue, 27 Aug 2024 06:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724740369; cv=none; b=KS1GVavrCOTZJAsmVHn8ThgGSGCC0TFYKWvu2Q/9nxaytnm2WpdDkgxDviFj8ljYlXYJqd7YOr1MbF1sl/M1YdHksvLh4HL5S7j97iMzWudr6fwubbXYo7eTbF+6FGiFzmp58LIIo99LH1MivaAwq+aieLTw1I2mgP2/P/1bxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724740369; c=relaxed/simple;
	bh=oqhohexmivqpv/r0MfNjYEf1UzFcS47iCDf/WuDns0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iStfphMEpapoIlqWESAKrhkU0oOCo0P4U50Vu5D/xzR+OZl2i5Ck8YYlgRLzvkpNCD5LFE65ryUmQNgw0hwcX/TpxAclJxrKDp4yjxKZLgQQF+Q2YvZGyW+yeVE5ZgrR1s13+1WSMqnwjpu2AQ0/YJZBI6YK/Fj3xYgrZ0aAWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ge1yeaLP; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UM6KNC0W reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724740366; x=1756276366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AWf/X8T0g51HjMP3gIZPDeOC7hcQD1g5niD15IzYbHk=;
  b=ge1yeaLPXmc0w1IL5uJLTPVewId+O+HXEyDW4GtNH/JHjoVKa88z4Ac7
   xplt2rkXMj2pyfkpIUU1roelkG6xBC1q8eYt4dneGr47ay6f60pB2VRHa
   qXrPDhCtihO4L4HKSP7fw4lmq7gCt/I/LgmLkdiegoFCxUyWS0mtlfiDQ
   eK3F2CbbGFloHZZxUb5OmggmU/sOTwuChDA5hBSux8zoD5Bq1l+za39Mk
   kNnZCz9srroIvs8zIdl7b6AeQyB20xnF6VAtJ78tU3UgTibTgcFoB5EAz
   U5p64QF6+8xUFqwpxVCcffUuTGLID5HtYCCwSBvhZDYIuZyewzFL5migm
   Q==;
X-CSE-ConnectionGUID: Fxg9LzmWTa+y65QrfQddoA==
X-CSE-MsgGUID: W1Dqb243Q7Gi5sdFRYlFNw==
X-IronPort-AV: E=Sophos;i="6.10,179,1719871200"; 
   d="scan'208";a="38600415"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Aug 2024 08:32:37 +0200
X-CheckPoint: {66CD7305-6-22BB8E18-F5F6D0B4}
X-MAIL-CPID: 66B23A0ADD8C2EB7A0B5398854B54F7A_5
X-Control-Analysis: str=0001.0A782F18.66CD7305.008D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E999160A3A;
	Tue, 27 Aug 2024 08:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724740352;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AWf/X8T0g51HjMP3gIZPDeOC7hcQD1g5niD15IzYbHk=;
	b=UM6KNC0WuUZcqlXr5a3F3GASbmsSoiv0PEa9mWgtBCoHu4T7f4Cm8YEBj0HoBoJt/IKRSg
	LbC4eJXlqvIXNBFhL35Dg4CrHLaM4xbCi+27LqwGcSTUOI5h0y66JI6MUK3sPdZvG5bKDQ
	ICqK1BIsH3y7RUBzhBjPKhTiUjJE+G9Hz/IIg8YELUm6253uXh9uwTIfDypFPm1xrnZKJy
	t7zDL/Me9bmh9zkRjcEES18yUgUyuCaH7GbN5e4e85rdFhed2s2JS4lr0RjPT5x1gsSu8y
	EA1UOi2yJoxNs9vL5KX3rHk20vUaYOJDs1peU0Hy1c6NWGNH4NJ/pbIRphheFg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, David Leonard <David.Leonard@digi.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: ls1012a: Add pinctrl driver support
Date: Tue, 27 Aug 2024 08:32:31 +0200
Message-ID: <12507116.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com>
References: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 27. August 2024, 04:05:24 CEST schrieb David Leonard:
> Add QorIQ LS1012A pinctrl driver, allowing i2c-core to exert
> GPIO control over the second I2C bus.

Can you please elaborate? AFAIK the pinmuxing is set by the RCW on layersca=
pe.
How can you change the pinmuxing at runtime. How is this related to i2c
controlling GPIO?

Best regards,
Alexander

> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---
>   drivers/pinctrl/freescale/Kconfig           |   8 +
>   drivers/pinctrl/freescale/Makefile          |   1 +
>   drivers/pinctrl/freescale/pinctrl-ls1012a.c | 381 ++++++++++++++++++++
>   3 files changed, 390 insertions(+)
>   create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1012a.c
>=20
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescal=
e/Kconfig
> index 3b59d7189004..a2038042eeae 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -209,6 +209,14 @@ config PINCTRL_IMX93
>   	help
>   	  Say Y here to enable the imx93 pinctrl driver
>=20
> +config PINCTRL_LS1012A
> +	tristate "LS1012A pinctrl driver"
> +	depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	help
> +	  Say Y here to enable the ls1012a pinctrl driver
> +
>   config PINCTRL_VF610
>   	bool "Freescale Vybrid VF610 pinctrl driver"
>   	depends on SOC_VF610
> diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freesca=
le/Makefile
> index d27085c2b4c4..6926529d8635 100644
> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_PINCTRL_IMX25)	+=3D pinctrl-imx25.o
>   obj-$(CONFIG_PINCTRL_IMX28)	+=3D pinctrl-imx28.o
>   obj-$(CONFIG_PINCTRL_IMXRT1050)	+=3D pinctrl-imxrt1050.o
>   obj-$(CONFIG_PINCTRL_IMXRT1170)	+=3D pinctrl-imxrt1170.o
> +obj-$(CONFIG_PINCTRL_LS1012A)	+=3D pinctrl-ls1012a.o
> diff --git a/drivers/pinctrl/freescale/pinctrl-ls1012a.c b/drivers/pinctr=
l/freescale/pinctrl-ls1012a.c
> new file mode 100644
> index 000000000000..d4c535ed6c07
> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller for NXP QorIQ LS1012A.
> + *
> + * Copyright (c) 2024 Digi International, Inc.
> + * Author: David Leonard <David.Leonard@digi.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/of.h>
> +#include <linux/io.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +#include <linux/sys_soc.h>
> +
> +struct ls1012a_pinctrl_pdata {
> +	struct pinctrl_dev *pctl_dev;
> +	void __iomem *cr0mem;
> +	bool big_endian;
> +	u32 ssc;
> +};
> +
> +/* Bitfield macros for masks and values that follow the datasheet's
> + * bit numbering schemes for registers of different bit-endianess. */
> +#define BITV_BE(hi, v)	((v) << (31 - (hi) % 32))
> +#define BITM_BE(hi, lo)	(((1 << ((hi) - (lo) + 1)) - 1) << (31 - (hi) % =
32))
> +#define BITV_LE(lo, v)	((v) << ((lo) % 32))
> +#define BITM_LE(lo, hi)	(((1 << ((hi) - (lo) + 1)) - 1) << ((lo) % 32))
> +
> +/* SCFG PMUXCR0 pinmux control register */
> +#define SCFG_PMUXCR0			0x430
> +#define QSPI_MUX_OVRD_MASK		BITM_BE(0, 0)	/* [0] */
> +#define QSPI_MUX_DISABLE		BITV_BE(0, 0)	/*  use RCW */
> +#define QSPI_MUX_ENABLE			BITV_BE(0, 1)	/*  use PMUXCR0 */
> +#define QSPI_DATA0_GPIO_OVR_MASK	BITM_BE(1, 1)	/* [1] */
> +#define QSPI_DATA0_GPIO_SEL_SPI		BITV_BE(1, 0)	/*  DATA0,SCK,CS0 */
> +#define QSPI_DATA0_GPIO_SEL_GPIO	BITV_BE(1, 1)	/*  GPIO1[4,11,5] */
> +#define QSPI_DATA1_GPIO_OVR_MASK	BITM_BE(3, 2)	/* [3:2] */
> +#define QSPI_DATA1_GPIO_SEL_SPI		BITV_BE(3, 0)	/*  DATA1 */
> +#define QSPI_DATA1_GPIO_SEL_GPIO	BITV_BE(3, 1)	/*  GPIO1[12] */
> +#define QSPI_IIC2_OVR_MASK		BITM_BE(5, 4)	/* [5:4] */
> +#define QSPI_IIC2_SEL_GPIO		BITV_BE(5, 0)	/*  GPIO1[13,14] */
> +#define QSPI_IIC2_SEL_I2C		BITV_BE(5, 1)	/*  SCL,SDA (rev0) */
> +#define QSPI_IIC2_SEL_SPI		BITV_BE(5, 2)	/*  DATA2,DATA3 */
> +
> +/* RCW SoC-specific configuration (read-only) */
> +#define DCFG_RCWSR			0x100
> +#define SOC_SPEC_CONFIG			416		/* word 13 */
> +#define DCFG_SSC_REG			(DCFG_RCWSR + SOC_SPEC_CONFIG / 8)
> +#define SSC_DATA0_GPIO_MASK		BITM_LE(421, 421)
> +#define SSC_DATA0_GPIO_SEL_SPI		BITV_LE(421, 0)	/*  DATA0,SCK,CS0 */
> +#define SSC_DATA0_GPIO_SEL_GPIO		BITV_LE(421, 1)	/*  GPIO1[11,4,5] */
> +#define SSC_DATA1_GPIO_MASK		BITM_LE(422, 423)
> +#define SSC_DATA1_GPIO_SEL_SPI		BITV_LE(422, 0)	/*  DATA1 */
> +#define SSC_DATA1_GPIO_SEL_GPIO		BITV_LE(422, 2)	/*  GPIO1[12] */
> +#define SSC_IIC2_MASK			BITM_LE(424, 425)
> +#define SSC_IIC2_SEL_GPIO		BITV_LE(424, 0)	/*  GPIO1[13,14] */
> +#define SSC_IIC2_SEL_I2C		BITV_LE(424, 2)	/*  SCL,SDA */
> +#define SSC_IIC2_SEL_SPI		BITV_LE(424, 1)	/*  DATA2,DATA3 */
> +#define SSC_IIC2_SEL_GPIO_RESET		BITV_LE(424, 3)	/*  GPIO1[13],RESET_REQ=
_B*/
> +
> +const struct pinctrl_pin_desc ls1012a_pins[] =3D {
> +	PINCTRL_PIN(60, "QSPI_A_DATA3/GPIO1_14/IIC2_SDA/RESET_REQ_B"),
> +	PINCTRL_PIN(61, "QSPI_A_DATA1/GPIO1_12"),
> +	PINCTRL_PIN(62, "QSPI_A_SCK/GPIO1_04"),
> +	PINCTRL_PIN(122, "QSPI_A_DATA2/GPIO1_13/IIC2_SCL"),
> +	PINCTRL_PIN(123, "QSPI_A_DATA0/GPIO1_11"),
> +	PINCTRL_PIN(124, "QSPI_A_CS0/GPIO1_05"),
> +};
> +
> +static const unsigned int qspi_1_grp[] =3D { 62, 123, 124 };
> +static const unsigned int qspi_2_grp[] =3D { 61 };
> +static const unsigned int qspi_3_grp[] =3D { 122, 60 };
> +
> +#define GRP_qspi_1	0	/* SCK,CS0,DATA0 */
> +#define GRP_qspi_2	1	/* DATA1 */
> +#define GRP_qspi_3	2	/* DATA2,DATA3 */
> +#define _GRP_max	3
> +
> +#define _PINGROUP(name) \
> +	[GRP_##name] =3D PINCTRL_PINGROUP(#name "_grp", name##_grp, ARRAY_SIZE(=
name##_grp))
> +static const struct pingroup ls1012a_groups[] =3D {
> +	_PINGROUP(qspi_1),
> +	_PINGROUP(qspi_2),
> +	_PINGROUP(qspi_3),
> +};
> +
> +
> +static void ls1012a_write_cr0(struct ls1012a_pinctrl_pdata *pd, u32 val)
> +{
> +	if (pd->big_endian)
> +		iowrite32be(val, pd->cr0mem);
> +	else
> +		iowrite32(val, pd->cr0mem);
> +}
> +
> +static u32 ls1012a_read_cr0(struct ls1012a_pinctrl_pdata *pd)
> +{
> +	return pd->big_endian ? ioread32be(pd->cr0mem) : ioread32(pd->cr0mem);
> +}
> +
> +static int ls1012a_get_groups_count(struct pinctrl_dev *pcdev)
> +{
> +	return ARRAY_SIZE(ls1012a_groups);
> +}
> +
> +static const char *ls1012a_get_group_name(struct pinctrl_dev *pcdev,
> +	unsigned int selector)
> +{
> +	return ls1012a_groups[selector].name;
> +}
> +
> +static int ls1012a_get_group_pins(struct pinctrl_dev *pcdev,
> +	unsigned int selector, const unsigned int **pins, unsigned int *npins)
> +{
> +	*pins =3D ls1012a_groups[selector].pins;
> +	*npins =3D ls1012a_groups[selector].npins;
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops ls1012a_pinctrl_ops =3D {
> +	.get_groups_count =3D ls1012a_get_groups_count,
> +	.get_group_name =3D ls1012a_get_group_name,
> +	.get_group_pins =3D ls1012a_get_group_pins,
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_group,
> +	.dt_free_map =3D pinconf_generic_dt_free_map,
> +};
> +
> +static const char * const i2c_groups[] =3D { "qspi_3_grp" };
> +static const char * const spi_groups[] =3D { "qspi_1_grp", "qspi_2_grp",=
 "qspi_3_grp" };
> +static const char * const gpio_groups[] =3D { "qspi_1_grp", "qspi_2_grp"=
, "qspi_3_grp" };
> +static const char * const gpio_reset_groups[] =3D { "qspi_3_grp" };
> +
> +#define FUNC_i2c	0
> +#define FUNC_spi	1
> +#define FUNC_gpio	2
> +#define FUNC_gpio_reset 3
> +#define _FUNC_max	4
> +
> +#define _PINFUNC(name) \
> +	[FUNC_##name] =3D PINCTRL_PINFUNCTION(#name, name##_groups, ARRAY_SIZE(=
name##_groups))
> +static const struct pinfunction ls1012a_functions[] =3D {
> +	_PINFUNC(i2c),
> +	_PINFUNC(spi),
> +	_PINFUNC(gpio),
> +	_PINFUNC(gpio_reset),
> +};
> +
> +static int ls1012a_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	return ARRAY_SIZE(ls1012a_functions);
> +}
> +
> +static const char *ls1012a_get_function_name(struct pinctrl_dev *pctldev=
, unsigned int func)
> +{
> +	return ls1012a_functions[func].name;
> +}
> +
> +static int ls1012a_get_function_groups(struct pinctrl_dev *pctldev, unsi=
gned int func,
> +	const char * const **groups,
> +	unsigned int * const ngroups)
> +{
> +	*groups =3D ls1012a_functions[func].groups;
> +	*ngroups =3D ls1012a_functions[func].ngroups;
> +	return 0;
> +}
> +
> +/*
> + * LS1012A
> + *    Group: qspi_1             qspi_2      qspi_3
> + *           =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + *    Pin:   62    123    124   61          122    60
> + *           ----- ------ ----- ----------- ------ ------
> + * i2c                                      SCL    SDA    (RCW only)
> + * spi       SCK   DATA0
> + * spi       SCK   DATA0        DATA1
> + * spi       SCK   DATA0        DATA1       DATA2  DATA3
> + * gpio      GPIO4 GPIO11 GPIO5
> + * gpio                         GPIO12
> + * gpio                                     GPIO13 GPIO14
> + * gpio_reset                               GPIO13 REQ_B  (RCW only)
> + */
> +
> +static const struct ls1012a_func_mux {
> +	u32 cr0mask, cr0; /* mux control */
> +	u32 sscmask, ssc; /* equivalent in RCW */
> +} ls1012a_func_mux[_FUNC_max][_GRP_max] =3D {
> +	[FUNC_i2c] =3D {
> +		[GRP_qspi_3] =3D {
> +			.sscmask =3D SSC_IIC2_MASK,
> +			.ssc =3D     SSC_IIC2_SEL_I2C,
> +		},
> +	},
> +	[FUNC_spi] =3D {
> +		[GRP_qspi_1] =3D {
> +			.cr0mask =3D QSPI_DATA0_GPIO_OVR_MASK,
> +			.cr0 =3D     QSPI_DATA0_GPIO_SEL_SPI,
> +			.sscmask =3D SSC_DATA0_GPIO_MASK,
> +			.ssc =3D     SSC_DATA0_GPIO_SEL_SPI
> +		},
> +		[GRP_qspi_2] =3D {
> +			.cr0mask =3D QSPI_DATA1_GPIO_OVR_MASK,
> +			.cr0 =3D     QSPI_DATA1_GPIO_SEL_SPI,
> +			.sscmask =3D SSC_DATA1_GPIO_MASK,
> +			.ssc =3D     SSC_DATA1_GPIO_SEL_SPI,
> +		},
> +		[GRP_qspi_3] =3D {
> +			.cr0mask =3D QSPI_IIC2_OVR_MASK,
> +			.cr0 =3D     QSPI_IIC2_SEL_SPI,
> +			.sscmask =3D SSC_IIC2_MASK,
> +			.ssc =3D     SSC_IIC2_SEL_SPI,
> +		},
> +	},
> +	[FUNC_gpio] =3D {
> +		[GRP_qspi_1] =3D {
> +			.cr0mask =3D QSPI_DATA0_GPIO_OVR_MASK,
> +			.cr0 =3D     QSPI_DATA0_GPIO_SEL_GPIO,
> +			.sscmask =3D SSC_DATA0_GPIO_MASK,
> +			.ssc =3D     SSC_DATA0_GPIO_SEL_GPIO,
> +		},
> +		[GRP_qspi_2] =3D {
> +			.cr0mask =3D QSPI_DATA1_GPIO_OVR_MASK,
> +			.cr0 =3D     QSPI_DATA1_GPIO_SEL_GPIO,
> +			.sscmask =3D SSC_DATA1_GPIO_MASK,
> +			.ssc =3D     SSC_DATA1_GPIO_SEL_GPIO,
> +		},
> +		[GRP_qspi_3] =3D {
> +			.cr0mask =3D QSPI_IIC2_OVR_MASK,
> +			.cr0 =3D     QSPI_IIC2_SEL_GPIO,
> +			.sscmask =3D SSC_IIC2_MASK,
> +			.ssc =3D     SSC_IIC2_SEL_GPIO,
> +		},
> +	},
> +	[FUNC_gpio_reset] =3D {
> +		[GRP_qspi_3] =3D {
> +			.sscmask =3D SSC_IIC2_MASK,
> +			.ssc =3D     SSC_IIC2_SEL_GPIO_RESET,
> +		},
> +	},
> +};
> +
> +static int ls1012a_set_mux(struct pinctrl_dev *pcdev,
> +	unsigned int func, unsigned int group)
> +{
> +	struct ls1012a_pinctrl_pdata *pd =3D pinctrl_dev_get_drvdata(pcdev);
> +	const struct ls1012a_func_mux *fm =3D &ls1012a_func_mux[func][group];
> +	u32 cr0 =3D ls1012a_read_cr0(pd);
> +
> +	if (!fm->cr0mask) {
> +		if ((pd->ssc & fm->sscmask) !=3D fm->ssc)
> +			return -EOPNOTSUPP;
> +		cr0 =3D (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_DISABLE;
> +	} else {
> +		cr0 =3D (cr0 & ~fm->cr0mask) | fm->cr0;
> +		if ((pd->ssc & fm->sscmask) !=3D fm->ssc)
> +			cr0 =3D (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_ENABLE;
> +	}
> +	ls1012a_write_cr0(pd, cr0);
> +	return 0;
> +}
> +
> +static void ls1012a_init_mux(struct ls1012a_pinctrl_pdata *pd)
> +{
> +	unsigned int func, group;
> +	const struct ls1012a_func_mux *fm;
> +	u32 cr0;
> +
> +	cr0 =3D ls1012a_read_cr0(pd);
> +	if ((cr0 & QSPI_MUX_OVRD_MASK) =3D=3D QSPI_MUX_DISABLE) {
> +		/*
> +		 * Prepare a disabled MUXCR0 to have a same/similar
> +		 * configuration as RCW SSC, and leave it disabled.
> +		 */
> +		for (func =3D 0; func < _FUNC_max; func++) {
> +			for (group =3D 0; group < _GRP_max; group++) {
> +				fm =3D &ls1012a_func_mux[func][group];
> +				if (fm->sscmask &&
> +				    fm->ssc =3D=3D (pd->ssc & fm->sscmask)) {
> +					cr0 &=3D ~fm->cr0mask;
> +					cr0 |=3D fm->cr0;
> +				}
> +			}
> +		}
> +		ls1012a_write_cr0(pd, cr0);
> +	}
> +}
> +
> +static const struct pinmux_ops ls1012a_pinmux_ops =3D {
> +	.get_functions_count =3D ls1012a_get_functions_count,
> +	.get_function_name =3D ls1012a_get_function_name,
> +	.get_function_groups =3D ls1012a_get_function_groups,
> +	.set_mux =3D ls1012a_set_mux,
> +};
> +
> +static struct pinctrl_desc ls1012a_pinctrl_desc =3D {
> +	.name =3D "ls1012a",
> +	.pins =3D ls1012a_pins,
> +	.npins =3D ARRAY_SIZE(ls1012a_pins),
> +	.pctlops =3D &ls1012a_pinctrl_ops,
> +	.pmxops =3D &ls1012a_pinmux_ops,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static int ls1012a_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct ls1012a_pinctrl_pdata *pd;
> +	int ret;
> +	u32 dcfg_ssc;
> +	struct regmap *dcfg_regmap;
> +
> +	pd =3D devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, pd);
> +
> +	pd->big_endian =3D device_is_big_endian(&pdev->dev);
> +
> +	/* SCFG PMUX0 */
> +	pd->cr0mem =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pd->cr0mem))
> +		return PTR_ERR(pd->cr0mem);
> +	dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
> +		pd->big_endian ? "be" : "le");
> +
> +	/* DCFG RCW SSC */
> +	dcfg_regmap =3D syscon_regmap_lookup_by_phandle(
> +		dev_of_node(&pdev->dev), "dcfg-regmap");
> +	if (IS_ERR(dcfg_regmap)) {
> +		dev_err(&pdev->dev, "dcfg regmap: %pe\n", dcfg_regmap);
> +		return -EINVAL;
> +	}
> +	ret =3D regmap_read(dcfg_regmap, DCFG_SSC_REG, &dcfg_ssc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "dcfg-regmap read: %d\n", ret);
> +		return ret;
> +	}
> +	pd->ssc =3D swab32(dcfg_ssc); /* untwist RCW fields */
> +
> +	dev_dbg(&pdev->dev, "dcfg ssc =3D %08x (grp1=3D%s grp2=3D%s grp3=3D%s)\=
n",
> +		pd->ssc,
> +		(pd->ssc & SSC_DATA0_GPIO_MASK) =3D=3D SSC_DATA0_GPIO_SEL_SPI ? "spi" =
: "gpio",
> +		(pd->ssc & SSC_DATA1_GPIO_MASK) =3D=3D SSC_DATA1_GPIO_SEL_SPI ? "spi"
> +		: (pd->ssc & SSC_DATA1_GPIO_MASK) =3D=3D SSC_DATA1_GPIO_SEL_GPIO ? "gp=
io"
> +		: (pd->ssc & SSC_DATA1_GPIO_MASK) =3D=3D 0x80 ? "10" : "11",
> +		(pd->ssc & SSC_IIC2_MASK) =3D=3D SSC_IIC2_SEL_GPIO ? "gpio"
> +		: (pd->ssc & SSC_IIC2_MASK) =3D=3D SSC_IIC2_SEL_I2C ? "i2c"
> +		: (pd->ssc & SSC_IIC2_MASK) =3D=3D SSC_IIC2_SEL_SPI ? "spi"
> +		: "gpio+reset");
> +
> +	ls1012a_init_mux(pd);
> +
> +	ret =3D devm_pinctrl_register_and_init(&pdev->dev, &ls1012a_pinctrl_des=
c,
> +		pd, &pd->pctl_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
> +
> +	pinctrl_enable(pd->pctl_dev);
> +	return ret;
> +}
> +
> +static const struct of_device_id ls1012a_pinctrl_match_table[] =3D {
> +	{ .compatible =3D "fsl,ls1012a-pinctrl" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver ls1012a_pinctrl_driver =3D {
> +	.driver =3D {
> +		.name =3D "ls1012a_pinctrl",
> +		.of_match_table =3D ls1012a_pinctrl_match_table,
> +	},
> +	.probe =3D ls1012a_pinctrl_probe,
> +};
> +
> +builtin_platform_driver(ls1012a_pinctrl_driver)
> +
> +MODULE_DESCRIPTION("LS1012A pinctrl driver");
> +MODULE_LICENSE("GPL");
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




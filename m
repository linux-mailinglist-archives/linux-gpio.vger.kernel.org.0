Return-Path: <linux-gpio+bounces-13751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 566419ECC77
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 13:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9B11889FE3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9C123FD10;
	Wed, 11 Dec 2024 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6Q/DwlT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0323FD05;
	Wed, 11 Dec 2024 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921167; cv=none; b=S/aUGSA0uCRlC0dr1XeCe0Xv9PjvkHSNmbvHYPRztacSZ1wxM8Pkoi5gmUapylMegJBNSlHZWZU9QKaZkHfBWslC/5a/Qq8xfkaRezdi2jjZmISXt0HDKHQEu1uL5YvyqRYb/8el0OjYqtyw0jqsFjvH5YjScEajF8owWIR9waE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921167; c=relaxed/simple;
	bh=XsQvw05l+MBKEe/OKXoMtCsjqTCUKENBllGOtwUyk9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbNqaoQ8Fut5YHURzl9p25S0XFOWvxYgogEeGyyKM3+7mxSpjnbybkmxLwzmxb8h4sVo5K9NGrELMvQZa6elYzSQ+mro3iSi01Hz5CrMd0VsRmkrmbrTWDJQuxqsAEgZ5vEUloLAHzRmQI1VbLoZdIS8IgwcbPb5OzUbwoNWH9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6Q/DwlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB52DC4CED2;
	Wed, 11 Dec 2024 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733921166;
	bh=XsQvw05l+MBKEe/OKXoMtCsjqTCUKENBllGOtwUyk9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6Q/DwlTGe5OkvLAIpwvVkRcMbf6XssAOG4upS+/LYwfipH5phdUQha3us8aauUJv
	 qhgPWeAq5QkvjOGN0IkT7sMdJ1d9M8xB/0nA6h7KCHLZfvJHY5AHndy/n07kwucwiu
	 d8R2tHkV3RZbt5RiUL86faGRndQmWvwv5EZlLoNdg3RMIo9qsnDxEoAE6TwydID5yr
	 7sgiLT3sjsVIysvxsbRsM7vBFPfnpHM2QF3+cfl/P6PVR/euMhIQzh3lossZCdzH+n
	 vmndyvvQQsqr/T61FucYVE6/7hPJOG2QudbHFcfcOsJ4IFJ7w9aHaSoTF8y/mSBzdJ
	 k1iXBDSDNnSAg==
Date: Wed, 11 Dec 2024 12:45:56 +0000
From: Lee Jones <lee@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <20241211124454.GE7139@google.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>

Mark,

Seeing as the vast majority of this 400 line driver pertains to Regmap
handling (!), would you be kind enough to cast your expert eye over it
please?

On Wed, 13 Nov 2024, Andrei Stefanescu wrote:

> SIUL2 (System Integration Unit Lite) is a hardware module which
> implements various functionalities:
> - reading SoC information
> - pinctrl
> - GPIO (including interrupts)
> 
> This commit only adds support for pinctrl&GPIO(one cell). Further
> commits will add nvmem functionality(a second cell).

It's not an MFD until it has more than one device.

Please add that now or it cannot be accepted.

[pausing my review here for the time being]

> There are multiple register types in the SIUL2 module:
> - MIDR (MCU ID Register)
> 	* contains information about the SoC.
> - Interrupt related registers
> 	* There are 32 interrupts named EIRQ. An EIRQ
> 	  may be routed to one or more GPIOs. Not all
> 	  GPIOs have EIRQs associated with them
> - MSCR (Multiplexed Signal Configuration Register)
> 	* handle pinmuxing and pinconf
> - IMCR (Input Multiplexed Signal Configuration Register)
> 	* are part of pinmuxing
> - PGPDO/PGPDI (Parallel GPIO Pad Data Out/In Register)
> 	* Write/Read the GPIO value
> 
> There are two SIUL2 modules in the S32G SoC. This driver handles
> both because functionality is shared between them. For example:
> some GPIOs in SIUL2_0 have interrupt capability but the registers
> configuring this are in SIUL2_1.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/mfd/Kconfig           |  12 +
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/nxp-siul2.c       | 410 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nxp-siul2.h |  55 +++++
>  4 files changed, 478 insertions(+)
>  create mode 100644 drivers/mfd/nxp-siul2.c
>  create mode 100644 include/linux/mfd/nxp-siul2.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index f9325bcce1b9..fc590789e8b3 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1098,6 +1098,18 @@ config MFD_NTXEC
>  	  certain e-book readers designed by the original design manufacturer
>  	  Netronix.
>  
> +config MFD_NXP_SIUL2
> +	tristate "NXP SIUL2 MFD driver"
> +	select MFD_CORE
> +	select REGMAP_MMIO
> +	depends on ARCH_S32 || COMPILE_TEST
> +	help
> +	  Select this to get support for the NXP SIUL2 (System Integration
> +	  Unit Lite) module. This hardware block contains registers for
> +	  SoC information, pinctrl and GPIO functionality. This will
> +	  probe a MFD driver which will contain cells for a combined
> +	  pinctrl&GPIO driver and nvmem drivers for the SoC information.
> +
>  config MFD_RETU
>  	tristate "Nokia Retu and Tahvo multi-function device"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2a9f91e81af8..7b19ea014221 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -226,6 +226,7 @@ obj-$(CONFIG_MFD_INTEL_PMC_BXT)	+= intel_pmc_bxt.o
>  obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
>  obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_NTXEC)		+= ntxec.o
> +obj-$(CONFIG_MFD_NXP_SIUL2) 	+= nxp-siul2.o
>  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
>  obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
>  obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
> diff --git a/drivers/mfd/nxp-siul2.c b/drivers/mfd/nxp-siul2.c
> new file mode 100644
> index 000000000000..7751992e4df3
> --- /dev/null
> +++ b/drivers/mfd/nxp-siul2.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SIUL2(System Integration Unit Lite) MFD driver
> + *
> + * Copyright 2024 NXP
> + */
> +#include <linux/init.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nxp-siul2.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#define S32G_NUM_SIUL2 2
> +
> +#define S32_REG_RANGE(start, end, name, access)		\
> +	{						\
> +		.reg_name = (name),			\
> +		.reg_start_offset = (start),		\
> +		.reg_end_offset = (end),		\
> +		.reg_access = (access),			\
> +		.valid = true,				\
> +	}
> +
> +#define S32_INVALID_REG_RANGE		\
> +	{				\
> +		.reg_name = NULL,	\
> +		.reg_access = NULL,	\
> +		.valid = false,		\
> +	}
> +
> +static const struct mfd_cell nxp_siul2_devs[] = {
> +	{
> +		.name = "s32g-siul2-pinctrl",
> +	}
> +};
> +
> +/**
> + * struct nxp_siul2_reg_range_info: a register range in SIUL2
> + * @reg_name: the name for the register range
> + * @reg_start_offset: the first valid register offset
> + * @reg_end_offset: the last valid register offset
> + * @reg_access: the read/write access tables if not NULL
> + * @valid: whether the register range is valid or not
> + */
> +struct nxp_siul2_reg_range_info {
> +	const char *reg_name;
> +	unsigned int reg_start_offset;
> +	unsigned int reg_end_offset;
> +	const struct regmap_access_table *reg_access;
> +	bool valid;
> +};
> +
> +static const struct regmap_range s32g2_siul2_0_imcr_reg_ranges[] = {
> +	/* IMCR0 - IMCR1 */
> +	regmap_reg_range(0, 4),
> +	/* IMCR3 - IMCR61 */
> +	regmap_reg_range(0xC, 0xF4),
> +	/* IMCR68 - IMCR83 */
> +	regmap_reg_range(0x110, 0x14C)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_0_imcr = {
> +	.yes_ranges = s32g2_siul2_0_imcr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_imcr_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_0_pgpd_reg_ranges[] = {
> +	/* PGPD*0 - PGPD*5 */
> +	regmap_reg_range(0, 0xA),
> +	/* PGPD*6 - PGPD*6 */
> +	regmap_reg_range(0xE, 0xE),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_0_pgpd = {
> +	.yes_ranges = s32g2_siul2_0_pgpd_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_0_pgpd_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_irq_reg_ranges[] = {
> +	/* DISR0 */
> +	regmap_reg_range(0x10, 0x10),
> +	/* DIRER0 */
> +	regmap_reg_range(0x18, 0x18),
> +	/* DIRSR0 */
> +	regmap_reg_range(0x20, 0x20),
> +	/* IREER0 */
> +	regmap_reg_range(0x28, 0x28),
> +	/* IFEER0 */
> +	regmap_reg_range(0x30, 0x30),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_irq = {
> +	.yes_ranges = s32g2_siul2_1_irq_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_reg_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_irq_volatile_reg_range[] = {
> +	/* DISR0 */
> +	regmap_reg_range(0x10, 0x10)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_irq_volatile = {
> +	.yes_ranges = s32g2_siul2_1_irq_volatile_reg_range,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_irq_volatile_reg_range),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_mscr_reg_ranges[] = {
> +	/* MSCR112 - MSCR122 */
> +	regmap_reg_range(0, 0x28),
> +	/* MSCR144 - MSCR190 */
> +	regmap_reg_range(0x80, 0x138)
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_mscr = {
> +	.yes_ranges = s32g2_siul2_1_mscr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_mscr_reg_ranges),
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_imcr_reg_ranges[] = {
> +	/* IMCR119 - IMCR121 */
> +	regmap_reg_range(0, 8),
> +	/* IMCR128 - IMCR129 */
> +	regmap_reg_range(0x24, 0x28),
> +	/* IMCR143 - IMCR151 */
> +	regmap_reg_range(0x60, 0x80),
> +	/* IMCR153 - IMCR161 */
> +	regmap_reg_range(0x88, 0xA8),
> +	/* IMCR205 - IMCR212 */
> +	regmap_reg_range(0x158, 0x174),
> +	/* IMCR224 - IMCR225 */
> +	regmap_reg_range(0x1A4, 0x1A8),
> +	/* IMCR233 - IMCR248 */
> +	regmap_reg_range(0x1C8, 0x204),
> +	/* IMCR273 - IMCR274 */
> +	regmap_reg_range(0x268, 0x26C),
> +	/* IMCR278 - IMCR281 */
> +	regmap_reg_range(0x27C, 0x288),
> +	/* IMCR283 - IMCR286 */
> +	regmap_reg_range(0x290, 0x29C),
> +	/* IMCR288 - IMCR294 */
> +	regmap_reg_range(0x2A4, 0x2BC),
> +	/* IMCR296 - IMCR302 */
> +	regmap_reg_range(0x2C4, 0x2DC),
> +	/* IMCR304 - IMCR310 */
> +	regmap_reg_range(0x2E4, 0x2FC),
> +	/* IMCR312 - IMCR314 */
> +	regmap_reg_range(0x304, 0x30C),
> +	/* IMCR316 */
> +	regmap_reg_range(0x314, 0x314),
> +	/* IMCR 318 */
> +	regmap_reg_range(0x31C, 0x31C),
> +	/* IMCR322 - IMCR340 */
> +	regmap_reg_range(0x32C, 0x374),
> +	/* IMCR343 - IMCR360 */
> +	regmap_reg_range(0x380, 0x3C4),
> +	/* IMCR363 - IMCR380 */
> +	regmap_reg_range(0x3D0, 0x414),
> +	/* IMCR383 - IMCR393 */
> +	regmap_reg_range(0x420, 0x448),
> +	/* IMCR398 - IMCR433 */
> +	regmap_reg_range(0x45C, 0x4E8),
> +	/* IMCR467 - IMCR470 */
> +	regmap_reg_range(0x570, 0x57C),
> +	/* IMCR473 - IMCR475 */
> +	regmap_reg_range(0x588, 0x590),
> +	/* IMCR478 - IMCR480*/
> +	regmap_reg_range(0x59C, 0x5A4),
> +	/* IMCR483 - IMCR485 */
> +	regmap_reg_range(0x5B0, 0x5B8),
> +	/* IMCR488 - IMCR490 */
> +	regmap_reg_range(0x5C4, 0x5CC),
> +	/* IMCR493 - IMCR495 */
> +	regmap_reg_range(0x5D8, 0x5E0),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_imcr = {
> +	.yes_ranges = s32g2_siul2_1_imcr_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_imcr_reg_ranges)
> +};
> +
> +static const struct regmap_range s32g2_siul2_1_pgpd_reg_ranges[] = {
> +	/* PGPD*7 */
> +	regmap_reg_range(0xC, 0xC),
> +	/* PGPD*9 */
> +	regmap_reg_range(0x10, 0x10),
> +	/* PDPG*10 - PGPD*11 */
> +	regmap_reg_range(0x14, 0x16),
> +};
> +
> +static const struct regmap_access_table s32g2_siul2_1_pgpd = {
> +	.yes_ranges = s32g2_siul2_1_pgpd_reg_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(s32g2_siul2_1_pgpd_reg_ranges)
> +};
> +
> +static const struct nxp_siul2_reg_range_info
> +s32g2_reg_ranges[S32G_NUM_SIUL2][SIUL2_NUM_REG_TYPES] = {
> +	/* SIUL2_0 */
> +	{
> +		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_0_MPIDR", NULL),
> +		/* Interrupts are to be controlled from SIUL2_1 */
> +		[SIUL2_IRQ] = S32_INVALID_REG_RANGE,
> +		[SIUL2_MSCR] = S32_REG_RANGE(0x240, 0x3D4, "SIUL2_0_MSCR",
> +					     NULL),
> +		[SIUL2_IMCR] = S32_REG_RANGE(0xA40, 0xB8C, "SIUL2_0_IMCR",
> +					     &s32g2_siul2_0_imcr),
> +		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x170E,
> +					      "SIUL2_0_PGPDO",
> +					      &s32g2_siul2_0_pgpd),
> +		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x174E,
> +					      "SIUL2_0_PGPDI",
> +					      &s32g2_siul2_0_pgpd),
> +	},
> +	/* SIUL2_1 */
> +	{
> +		[SIUL2_MPIDR] = S32_REG_RANGE(4, 8, "SIUL2_1_MPIDR", NULL),
> +		[SIUL2_IRQ] = S32_REG_RANGE(0x10, 0xC0, "SIUL2_1_IRQ",
> +					    &s32g2_siul2_1_irq),
> +		[SIUL2_MSCR] = S32_REG_RANGE(0x400, 0x538, "SIUL2_1_MSCR",
> +					     &s32g2_siul2_1_mscr),
> +		[SIUL2_IMCR] = S32_REG_RANGE(0xC1C, 0x11FC, "SIUL2_1_IMCR",
> +					     &s32g2_siul2_1_imcr),
> +		[SIUL2_PGPDO] = S32_REG_RANGE(0x1700, 0x1716,
> +					      "SIUL2_1_PGPDO",
> +					      &s32g2_siul2_1_pgpd),
> +		[SIUL2_PGPDI] = S32_REG_RANGE(0x1740, 0x1756,
> +					      "SIUL2_1_PGPDI",
> +					      &s32g2_siul2_1_pgpd),
> +	},
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_irq_conf = {
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +	.volatile_table = &s32g2_siul2_1_irq_volatile,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_generic_conf = {
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_pgpdo_conf = {
> +	.val_bits = 16,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 2,
> +	.cache_type = REGCACHE_FLAT,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config nxp_siul2_regmap_pgpdi_conf = {
> +	.val_bits = 16,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.reg_bits = 32,
> +	.reg_stride = 2,
> +	.cache_type = REGCACHE_NONE,
> +	.use_raw_spinlock = true,
> +};
> +
> +static int nxp_siul2_init_regmap(struct platform_device *pdev,
> +				 void __iomem *base, unsigned int siul)
> +{
> +	const struct regmap_config *regmap_configs[SIUL2_NUM_REG_TYPES] = {
> +		[SIUL2_MPIDR]	= &nxp_siul2_regmap_generic_conf,
> +		[SIUL2_IRQ]	= &nxp_siul2_regmap_irq_conf,
> +		[SIUL2_MSCR]	= &nxp_siul2_regmap_generic_conf,
> +		[SIUL2_IMCR]	= &nxp_siul2_regmap_generic_conf,
> +		[SIUL2_PGPDO]	= &nxp_siul2_regmap_pgpdo_conf,
> +		[SIUL2_PGPDI]	= &nxp_siul2_regmap_pgpdi_conf,
> +	};
> +	const struct nxp_siul2_reg_range_info *tmp_range;
> +	struct regmap_config tmp_conf;
> +	struct nxp_siul2_info *info;
> +	struct nxp_siul2_mfd *priv;
> +	void __iomem *reg_start;
> +	int i;
> +
> +	priv = platform_get_drvdata(pdev);
> +	info = &priv->siul2[siul];
> +
> +	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
> +		if (!s32g2_reg_ranges[siul][i].valid)
> +			continue;
> +
> +		tmp_range = &s32g2_reg_ranges[siul][i];
> +		tmp_conf = *regmap_configs[i];
> +		tmp_conf.name = tmp_range->reg_name;
> +		tmp_conf.max_register =
> +			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
> +
> +		if (tmp_conf.cache_type != REGCACHE_NONE)
> +			tmp_conf.num_reg_defaults_raw =
> +				tmp_conf.max_register / tmp_conf.reg_stride;
> +
> +		if (tmp_range->reg_access) {
> +			tmp_conf.wr_table = tmp_range->reg_access;
> +			tmp_conf.rd_table = tmp_range->reg_access;
> +		}
> +
> +		reg_start = base + tmp_range->reg_start_offset;
> +		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
> +							 &tmp_conf);
> +		if (IS_ERR(info->regmaps[i]))
> +			return dev_err_probe(&pdev->dev,
> +					     PTR_ERR(info->regmaps[i]),
> +					     "regmap %d init failed: %ld\n", i,
> +					     PTR_ERR(info->regmaps[i]));
> +	}
> +
> +	return 0;
> +}
> +
> +static int nxp_siul2_parse_dtb(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct of_phandle_args pinspec;
> +	struct nxp_siul2_mfd *priv;
> +	void __iomem *base;
> +	char reg_name[16];
> +	int i, ret;
> +
> +	priv = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < priv->num_siul2; i++) {
> +		ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
> +		if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
> +			return ret;
> +
> +		base = devm_platform_ioremap_resource_byname(pdev, reg_name);
> +		if (IS_ERR(base))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(base),
> +					     "Failed to get MEM resource: %s\n",
> +					     reg_name);
> +
> +		ret = nxp_siul2_init_regmap(pdev, base, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +						       i, &pinspec);
> +		if (ret)
> +			return ret;
> +
> +		of_node_put(pinspec.np);
> +
> +		if (pinspec.args_count != 3)
> +			return dev_err_probe(&pdev->dev, -EINVAL,
> +					     "Invalid pinspec count: %d\n",
> +					     pinspec.args_count);
> +
> +		priv->siul2[i].gpio_base = pinspec.args[1];
> +		priv->siul2[i].gpio_num = pinspec.args[2];
> +	}
> +
> +	return 0;
> +}
> +
> +static int nxp_siul2_probe(struct platform_device *pdev)
> +{
> +	struct nxp_siul2_mfd *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num_siul2 = S32G_NUM_SIUL2;
> +	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
> +				   sizeof(*priv->siul2), GFP_KERNEL);
> +	if (!priv->siul2)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	ret = nxp_siul2_parse_dtb(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id nxp_siul2_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-siul2" },
> +	{ .compatible = "nxp,s32g3-siul2" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
> +
> +static struct platform_driver nxp_siul2_mfd_driver = {
> +	.driver = {
> +		.name		= "nxp-siul2-mfd",
> +		.of_match_table	= nxp_siul2_dt_ids,
> +	},
> +	.probe = nxp_siul2_probe,
> +};
> +
> +module_platform_driver(nxp_siul2_mfd_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("NXP SIUL2 MFD driver");
> +MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>");
> diff --git a/include/linux/mfd/nxp-siul2.h b/include/linux/mfd/nxp-siul2.h
> new file mode 100644
> index 000000000000..238c812dba29
> --- /dev/null
> +++ b/include/linux/mfd/nxp-siul2.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * S32 SIUL2 core definitions
> + *
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __DRIVERS_MFD_NXP_SIUL2_H
> +#define __DRIVERS_MFD_NXP_SIUL2_H
> +
> +#include <linux/regmap.h>
> +
> +/**
> + * enum nxp_siul2_reg_type - an enum for SIUL2 reg types
> + * @SIUL2_MPIDR - SoC info
> + * @SIUL2_IRQ - IRQ related registers, only valid in SIUL2_1
> + * @SIUL2_MSCR - used for pinmuxing and pinconf
> + * @SIUL2_IMCR - used for pinmuxing
> + * @SIUL2_PGPDO - writing the GPIO value
> + * @SIUL2_PGPDI - reading the GPIO value
> + */
> +enum nxp_siul2_reg_type {
> +	SIUL2_MPIDR,
> +	SIUL2_IRQ,
> +	SIUL2_MSCR,
> +	SIUL2_IMCR,
> +	SIUL2_PGPDO,
> +	SIUL2_PGPDI,
> +
> +	SIUL2_NUM_REG_TYPES
> +};
> +
> +/**
> + * struct nxp_siul2_info - details about one SIUL2 hardware instance
> + * @regmaps: the regmaps for each register type for a SIUL2 hardware instance
> + * @gpio_base: the first GPIO in this SIUL2 module
> + * @gpio_num: the number of GPIOs in this SIUL2 module
> + */
> +struct nxp_siul2_info {
> +	struct regmap *regmaps[SIUL2_NUM_REG_TYPES];
> +	u32 gpio_base;
> +	u32 gpio_num;
> +};
> +
> +/**
> + * struct nxp_siul2_mfd - driver data
> + * @siul2: info about the SIUL2 modules present
> + * @num_siul2: number of siul2 modules
> + */
> +struct nxp_siul2_mfd {
> +	struct nxp_siul2_info *siul2;
> +	u8 num_siul2;
> +};
> +
> +#endif /* __DRIVERS_MFD_NXP_SIUL2_H */
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]


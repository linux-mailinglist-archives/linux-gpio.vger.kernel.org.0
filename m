Return-Path: <linux-gpio+bounces-22722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC728AF7393
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E784E7756
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDDF2E54A3;
	Thu,  3 Jul 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IEjvp4Ml"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB42E424E;
	Thu,  3 Jul 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545009; cv=none; b=Qo9pJ0qmmzEmnp2C0/H5TnB7LFQxpZ8tZuGwmkNk8DVXkUwz+tJtdbkXfFffeTmKyYAI9Io1GodPZPt2SEfTFgFn24p/WKY5d5kfVynkDC4yzL8ZdlRUnO841QpMGzVnHE8nwkJ5oAaiKtBhqVXUNdiapllk+cACHQkr0OXFwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545009; c=relaxed/simple;
	bh=j9N2ws6dgjGzhCmAui7+2Nfv44CSBzj66BikGMKCX9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uf5vClW4lqvtLrLdtWyPCze31ZgVBZtnm3Xniu3IPTv4cIjYmdftEwWgGqIp2zTk7KRxEuBrXP/u277jsNaPGO+/1T7K2HfFd+nV2q9N+KZ6fTPhPfY40Du6r2dVSWmr2BlYSjtWUBt2A0nrg7/3iOgkx+xXlwOQff8PLQKEbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IEjvp4Ml; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751545005;
	bh=j9N2ws6dgjGzhCmAui7+2Nfv44CSBzj66BikGMKCX9s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IEjvp4MlpjczQfOnQ9pprmduaxPsC0BNR76fjMIHgLFk7snO9h8Vhxa0k5cAS1scT
	 UxoY9vU2cRtYkiL+9e4q1/N94Roz6tJEPsyb0aRXdhVS4l7aawT64V0X5WSUkZPiev
	 MjVx1vGiFPdfi5eGPcwBzoMP3B13l4cq5AbeMZR0/4eHlUI4OlvFkjPXTotNkc+l4S
	 Y2nRzNUb7TiuY6UWrQIUBng/olCChmgjORo5UokoA7zOl3afMpujUyshzJDV963DXq
	 cH4mRbSP7GkCzeMazhxo8m+jhsK2H7M0tvNhFjh2tG/BEEgx2zVamOO6MkiUQi6oXm
	 lNZmoMIPlheIQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8F85cF092D4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 055F217E07FF;
	Thu,  3 Jul 2025 14:16:44 +0200 (CEST)
Message-ID: <b591e7daf1e351fbfee181fcce399db08b28faf9.camel@collabora.com>
Subject: Re: [PATCH v5 18/24] media: i2c: maxim-serdes: add MAX96717 driver
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
Date: Thu, 03 Jul 2025 14:16:44 +0200
In-Reply-To: <20250702132104.1537926-19-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <20250702132104.1537926-19-demonsingur@gmail.com>
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
> Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
> MAX96793.
>=20
> Integrate it with the common serializer framework, while keeping
> compatibility with existing usecases, avoiding code duplication, and
> also enabling more features across all chips.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
> =C2=A0drivers/media/i2c/maxim-serdes/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 16 +
> =C2=A0drivers/media/i2c/maxim-serdes/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 1 +
> =C2=A0drivers/media/i2c/maxim-serdes/max96717.c | 1685 ++++++++++++++++++=
+++
> =C2=A03 files changed, 1702 insertions(+)
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
>=20
> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/m=
axim-serdes/Kconfig
> index cae1d5a1293e..648cb891eefe 100644
> --- a/drivers/media/i2c/maxim-serdes/Kconfig
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -14,3 +14,19 @@ config VIDEO_MAXIM_SERDES
> =C2=A0
> =C2=A0	=C2=A0 To compile this driver as a module, choose M here: the modu=
le
> =C2=A0	=C2=A0 will be called max_serdes.
> +
> +config VIDEO_MAX96717
> +	tristate "Maxim MAX96717 Serializer support"
> +	depends on COMMON_CLK
> +	select VIDEO_MAXIM_SERDES
> +	select GENERIC_PINCONF
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +	help
> +	=C2=A0 This driver supports the Maxim MAX9295A, MAX96717, MAX96717F,
> +	=C2=A0 MAX96793 Serializers, which receive video on a MIPI CSI-2
> +	=C2=A0 interface and output it on a GMSL2/3 link.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the module
> +	=C2=A0 will be called max96717.
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/=
maxim-serdes/Makefile
> index b54326a5c81b..04abda6a5437 100644
> --- a/drivers/media/i2c/maxim-serdes/Makefile
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -1,3 +1,4 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0max-serdes-objs :=3D max_serdes.o max_ser.o max_des.o
> =C2=A0obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D max-serdes.o
> +obj-$(CONFIG_VIDEO_MAX96717) +=3D max96717.o
> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 000000000000..60b285e547b7
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
> @@ -0,0 +1,1685 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim MAX96717 GMSL2 Serializer Driver
> + *
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/regmap.h>
> +
> +#include "max_ser.h"
> +
> +#define MAX96717_REG0				0x0
> +
> +#define MAX96717_REG2				0x2
> +#define MAX96717_REG2_VID_TX_EN_P(p)		BIT(4 + (p))
> +
> +#define MAX96717_REG3				0x3
> +#define MAX96717_REG3_RCLKSEL			GENMASK(1, 0)
> +#define MAX96717_REG3_RCLK_ALT			BIT(2)
> +
> +#define MAX96717_REG6				0x6
> +#define MAX96717_REG6_RCLKEN			BIT(5)
> +
> +#define MAX96717_I2C_2(x)			(0x42 + (x) * 0x2)
> +#define MAX96717_I2C_2_SRC			GENMASK(7, 1)
> +
> +#define MAX96717_I2C_3(x)			(0x43 + (x) * 0x2)
> +#define MAX96717_I2C_3_DST			GENMASK(7, 1)
> +
> +#define MAX96717_TX3(p)				(0x53 + (p) * 0x4)
> +#define MAX96717_TX3_TX_STR_SEL			GENMASK(1, 0)
> +
> +#define MAX96717_VIDEO_TX0(p)			(0x100 + (p) * 0x8)
This is a bit confusing, looks like this register address is valid for MAX9=
295a VIDEO_TX0
but not for MAX96717, VIDEO_TX0 (Z) is at 0x110.



--=20
Julien


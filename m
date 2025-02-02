Return-Path: <linux-gpio+bounces-15185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792CA24FAA
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Feb 2025 20:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3261883728
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Feb 2025 19:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3864B1FE44D;
	Sun,  2 Feb 2025 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TCmPGtHf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308C635;
	Sun,  2 Feb 2025 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738523348; cv=none; b=aAAT1EF1jKBbzCeFHKxUn95IYapTi138v/bp99Vn6oN3eRnLeS7Y0FsNZszwQwO9S2SbU5AZqTyVYOa5qepyWOkkqYdR0tZPtDSMmZOObU0KeFfNfYh8x2vSd6sH89MRVcsnfGBbAnFZI0y06OqOApUWFiHL5A+kpd1XRSjq6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738523348; c=relaxed/simple;
	bh=uZPnvPpJWT6jieto24uQtfNE/WGiMaBy8XW8tZAAa5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtEUHAgj1PrIhc1Q8iesok7fF5yQfmf1IsRh6UcO4E0LVN+1Bl8zs7OwWASoSzWDUIBZcMqMAe4mojQkiurAfNWxw5th/x8cdDW0DHGB82MXkf+p8BXDKxnDMezPJBVpBRfZpXZWRyYZVcf0WPnXgcOI1OSumkdVW2cMmIrcdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TCmPGtHf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BFE8025B4D;
	Sun,  2 Feb 2025 20:09:03 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R78ycfH2rEdc; Sun,  2 Feb 2025 20:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738523339; bh=uZPnvPpJWT6jieto24uQtfNE/WGiMaBy8XW8tZAAa5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TCmPGtHf33Hh1MO6RvRQV8fdoJeuB8jU38nVb9WuD2Od65unGQAANvP4e82tHr76E
	 /tMKfwUmWTmQXXwDAwq43Imx5NL8wU1ygm2wMTxjhawWvbIRTnhaxOALlxkPxRQy5Y
	 uRDqvnN1EH0TyITorxQHkuPKpu+SrdlwFkIXPT8b6VKjLE0CIIGQ6peis1JdlR4qL0
	 cY2Hmj78ebblz861lJjz0+zppXpDxJ3oWE7j20YEBaszP2PG9OTg48vbjgsMfEu8lb
	 U4lubAXwPjHpvk48mCLpNgUtqE3scV/I6Lnek8cwFhvm5HU2/1MQ+GMd9ccUnwLARz
	 6/VphTJwyoiow==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Vivek Gautam <gautam.vivek@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 02/33] dt-bindings: clock: add clock definitions for exynos7870 CMU
Date: Mon,  3 Feb 2025 00:37:58 +0530
Message-ID: <20250202190758.14986-1-kauschluss@disroot.org>
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sergey Lisov <sleirsgoevy@gmail.com>

Add unique identifiers for exynos7870 clocks for every bank. It adds all
clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
CMU_PERI.

Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 include/dt-bindings/clock/exynos7870.h

diff --git a/include/dt-bindings/clock/exynos7870.h b/include/dt-bindings/clock/exynos7870.h
new file mode 100644
index 000000000000..eab01948033f
--- /dev/null
+++ b/include/dt-bindings/clock/exynos7870.h
@@ -0,0 +1,324 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2015 Samsung Electronics Co., Ltd.
+ * Author: Sergey Lisov <sleirsgoevy@gmail.com>
+ *
+ * Device Tree binding constants for Exynos7870 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS7870_H
+#define _DT_BINDINGS_CLOCK_EXYNOS7870_H
+
+/* CMU_MIF */
+#define CLK_DOUT_MIF_APB				1
+#define CLK_DOUT_MIF_BUSD				2
+#define CLK_DOUT_MIF_CMU_DISPAUD_BUS			3
+#define CLK_DOUT_MIF_CMU_DISPAUD_DECON_ECLK		4
+#define CLK_DOUT_MIF_CMU_DISPAUD_DECON_VCLK		5
+#define CLK_DOUT_MIF_CMU_FSYS_BUS			6
+#define CLK_DOUT_MIF_CMU_FSYS_MMC0			7
+#define CLK_DOUT_MIF_CMU_FSYS_MMC1			8
+#define CLK_DOUT_MIF_CMU_FSYS_MMC2			9
+#define CLK_DOUT_MIF_CMU_FSYS_USB20DRD_REFCLK		10
+#define CLK_DOUT_MIF_CMU_G3D_SWITCH			11
+#define CLK_DOUT_MIF_CMU_ISP_CAM			12
+#define CLK_DOUT_MIF_CMU_ISP_ISP			13
+#define CLK_DOUT_MIF_CMU_ISP_SENSOR0			14
+#define CLK_DOUT_MIF_CMU_ISP_SENSOR1			15
+#define CLK_DOUT_MIF_CMU_ISP_SENSOR2			16
+#define CLK_DOUT_MIF_CMU_ISP_VRA			17
+#define CLK_DOUT_MIF_CMU_MFCMSCL_MFC			18
+#define CLK_DOUT_MIF_CMU_MFCMSCL_MSCL			19
+#define CLK_DOUT_MIF_CMU_PERI_BUS			20
+#define CLK_DOUT_MIF_CMU_PERI_SPI0			21
+#define CLK_DOUT_MIF_CMU_PERI_SPI1			22
+#define CLK_DOUT_MIF_CMU_PERI_SPI2			23
+#define CLK_DOUT_MIF_CMU_PERI_SPI3			24
+#define CLK_DOUT_MIF_CMU_PERI_SPI4			25
+#define CLK_DOUT_MIF_CMU_PERI_UART0			26
+#define CLK_DOUT_MIF_CMU_PERI_UART1			27
+#define CLK_DOUT_MIF_CMU_PERI_UART2			28
+#define CLK_DOUT_MIF_HSI2C				29
+#define CLK_FOUT_MIF_BUS_PLL				30
+#define CLK_FOUT_MIF_MEDIA_PLL				31
+#define CLK_FOUT_MIF_MEM_PLL				32
+#define CLK_GOUT_MIF_CMU_DISPAUD_BUS			33
+#define CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK		34
+#define CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK		35
+#define CLK_GOUT_MIF_CMU_FSYS_BUS			36
+#define CLK_GOUT_MIF_CMU_FSYS_MMC0			37
+#define CLK_GOUT_MIF_CMU_FSYS_MMC1			38
+#define CLK_GOUT_MIF_CMU_FSYS_MMC2			39
+#define CLK_GOUT_MIF_CMU_FSYS_USB20DRD_REFCLK		40
+#define CLK_GOUT_MIF_CMU_G3D_SWITCH			41
+#define CLK_GOUT_MIF_CMU_ISP_CAM			42
+#define CLK_GOUT_MIF_CMU_ISP_ISP			43
+#define CLK_GOUT_MIF_CMU_ISP_SENSOR0			44
+#define CLK_GOUT_MIF_CMU_ISP_SENSOR1			45
+#define CLK_GOUT_MIF_CMU_ISP_SENSOR2			46
+#define CLK_GOUT_MIF_CMU_ISP_VRA			47
+#define CLK_GOUT_MIF_CMU_MFCMSCL_MFC			48
+#define CLK_GOUT_MIF_CMU_MFCMSCL_MSCL			49
+#define CLK_GOUT_MIF_CMU_PERI_BUS			50
+#define CLK_GOUT_MIF_CMU_PERI_SPI0			51
+#define CLK_GOUT_MIF_CMU_PERI_SPI1			52
+#define CLK_GOUT_MIF_CMU_PERI_SPI2			53
+#define CLK_GOUT_MIF_CMU_PERI_SPI3			54
+#define CLK_GOUT_MIF_CMU_PERI_SPI4			55
+#define CLK_GOUT_MIF_CMU_PERI_UART0			56
+#define CLK_GOUT_MIF_CMU_PERI_UART1			57
+#define CLK_GOUT_MIF_CMU_PERI_UART2			58
+#define CLK_GOUT_MIF_CP_PCLK_HSI2C			59
+#define CLK_GOUT_MIF_CP_PCLK_HSI2C_BAT_0		60
+#define CLK_GOUT_MIF_CP_PCLK_HSI2C_BAT_1		61
+#define CLK_GOUT_MIF_HSI2C_AP_PCLKM			62
+#define CLK_GOUT_MIF_HSI2C_AP_PCLKS			63
+#define CLK_GOUT_MIF_HSI2C_CP_PCLKM			64
+#define CLK_GOUT_MIF_HSI2C_CP_PCLKS			65
+#define CLK_GOUT_MIF_HSI2C_IPCLK			66
+#define CLK_GOUT_MIF_HSI2C_ITCLK			67
+#define CLK_GOUT_MIF_MUX_BUSD				68
+#define CLK_GOUT_MIF_MUX_BUS_PLL			69
+#define CLK_GOUT_MIF_MUX_BUS_PLL_CON			70
+#define CLK_GOUT_MIF_MUX_CMU_DISPAUD_BUS		71
+#define CLK_GOUT_MIF_MUX_CMU_DISPAUD_DECON_ECLK		72
+#define CLK_GOUT_MIF_MUX_CMU_DISPAUD_DECON_VCLK		73
+#define CLK_GOUT_MIF_MUX_CMU_FSYS_BUS			74
+#define CLK_GOUT_MIF_MUX_CMU_FSYS_MMC0			75
+#define CLK_GOUT_MIF_MUX_CMU_FSYS_MMC1			76
+#define CLK_GOUT_MIF_MUX_CMU_FSYS_MMC2			77
+#define CLK_GOUT_MIF_MUX_CMU_FSYS_USB20DRD_REFCLK	78
+#define CLK_GOUT_MIF_MUX_CMU_ISP_CAM			79
+#define CLK_GOUT_MIF_MUX_CMU_ISP_ISP			80
+#define CLK_GOUT_MIF_MUX_CMU_ISP_SENSOR0		81
+#define CLK_GOUT_MIF_MUX_CMU_ISP_SENSOR1		82
+#define CLK_GOUT_MIF_MUX_CMU_ISP_SENSOR2		83
+#define CLK_GOUT_MIF_MUX_CMU_ISP_VRA			84
+#define CLK_GOUT_MIF_MUX_CMU_MFCMSCL_MFC		85
+#define CLK_GOUT_MIF_MUX_CMU_MFCMSCL_MSCL		86
+#define CLK_GOUT_MIF_MUX_CMU_PERI_BUS			87
+#define CLK_GOUT_MIF_MUX_CMU_PERI_SPI0			88
+#define CLK_GOUT_MIF_MUX_CMU_PERI_SPI1			89
+#define CLK_GOUT_MIF_MUX_CMU_PERI_SPI2			90
+#define CLK_GOUT_MIF_MUX_CMU_PERI_SPI3			91
+#define CLK_GOUT_MIF_MUX_CMU_PERI_SPI4			92
+#define CLK_GOUT_MIF_MUX_CMU_PERI_UART0			93
+#define CLK_GOUT_MIF_MUX_CMU_PERI_UART1			94
+#define CLK_GOUT_MIF_MUX_CMU_PERI_UART2			95
+#define CLK_GOUT_MIF_MUX_MEDIA_PLL			96
+#define CLK_GOUT_MIF_MUX_MEDIA_PLL_CON			97
+#define CLK_GOUT_MIF_MUX_MEM_PLL			98
+#define CLK_GOUT_MIF_MUX_MEM_PLL_CON			99
+#define CLK_GOUT_MIF_WRAP_ADC_IF_OSC_SYS		100
+#define CLK_GOUT_MIF_WRAP_ADC_IF_PCLK_S0		101
+#define CLK_GOUT_MIF_WRAP_ADC_IF_PCLK_S1		102
+#define CLK_MOUT_MIF_BUSD				103
+#define CLK_MOUT_MIF_CMU_DISPAUD_BUS			104
+#define CLK_MOUT_MIF_CMU_DISPAUD_DECON_ECLK		105
+#define CLK_MOUT_MIF_CMU_DISPAUD_DECON_VCLK		106
+#define CLK_MOUT_MIF_CMU_FSYS_BUS			107
+#define CLK_MOUT_MIF_CMU_FSYS_MMC0			108
+#define CLK_MOUT_MIF_CMU_FSYS_MMC1			109
+#define CLK_MOUT_MIF_CMU_FSYS_MMC2			110
+#define CLK_MOUT_MIF_CMU_FSYS_USB20DRD_REFCLK		111
+#define CLK_MOUT_MIF_CMU_ISP_CAM			112
+#define CLK_MOUT_MIF_CMU_ISP_ISP			113
+#define CLK_MOUT_MIF_CMU_ISP_SENSOR0			114
+#define CLK_MOUT_MIF_CMU_ISP_SENSOR1			115
+#define CLK_MOUT_MIF_CMU_ISP_SENSOR2			116
+#define CLK_MOUT_MIF_CMU_ISP_VRA			117
+#define CLK_MOUT_MIF_CMU_MFCMSCL_MFC			118
+#define CLK_MOUT_MIF_CMU_MFCMSCL_MSCL			119
+#define CLK_MOUT_MIF_CMU_PERI_BUS			120
+#define CLK_MOUT_MIF_CMU_PERI_SPI0			121
+#define CLK_MOUT_MIF_CMU_PERI_SPI1			122
+#define CLK_MOUT_MIF_CMU_PERI_SPI2			123
+#define CLK_MOUT_MIF_CMU_PERI_SPI3			124
+#define CLK_MOUT_MIF_CMU_PERI_SPI4			125
+#define CLK_MOUT_MIF_CMU_PERI_UART0			126
+#define CLK_MOUT_MIF_CMU_PERI_UART1			127
+#define CLK_MOUT_MIF_CMU_PERI_UART2			128
+#define MIF_NR_CLK					129
+
+/* CMU_DISPAUD */
+#define CLK_DOUT_DISPAUD_APB					1
+#define CLK_DOUT_DISPAUD_DECON_ECLK				2
+#define CLK_DOUT_DISPAUD_DECON_VCLK				3
+#define CLK_DOUT_DISPAUD_MI2S					4
+#define CLK_DOUT_DISPAUD_MIXER					5
+#define CLK_FOUT_DISPAUD_AUD_PLL				6
+#define CLK_FOUT_DISPAUD_PLL					7
+#define CLK_GOUT_DISPAUD_APB_AUD				8
+#define CLK_GOUT_DISPAUD_APB_AUD_AMP				9
+#define CLK_GOUT_DISPAUD_APB_DISP				10
+#define CLK_GOUT_DISPAUD_BUS					11
+#define CLK_GOUT_DISPAUD_BUS_DISP				12
+#define CLK_GOUT_DISPAUD_BUS_PPMU				13
+#define CLK_GOUT_DISPAUD_CON_AUD_I2S_BCLK_BT_IN			14
+#define CLK_GOUT_DISPAUD_CON_AUD_I2S_BCLK_FM_IN			15
+#define CLK_GOUT_DISPAUD_CON_CP2AUD_BCK				16
+#define CLK_GOUT_DISPAUD_CON_EXT2AUD_BCK_GPIO_I2S		17
+#define CLK_GOUT_DISPAUD_DECON_ECLK				18
+#define CLK_GOUT_DISPAUD_DECON_VCLK				19
+#define CLK_GOUT_DISPAUD_MI2S_AMP_I2SCODCLKI			20
+#define CLK_GOUT_DISPAUD_MI2S_AUD_I2SCODCLKI			21
+#define CLK_GOUT_DISPAUD_MIXER_AUD_SYSCLK			22
+#define CLK_GOUT_DISPAUD_MUX_AUD_PLL				23
+#define CLK_GOUT_DISPAUD_MUX_AUD_PLL_CON			24
+#define CLK_GOUT_DISPAUD_MUX_BUS_USER				25
+#define CLK_GOUT_DISPAUD_MUX_DECON_ECLK				26
+#define CLK_GOUT_DISPAUD_MUX_DECON_ECLK_USER			27
+#define CLK_GOUT_DISPAUD_MUX_DECON_VCLK				28
+#define CLK_GOUT_DISPAUD_MUX_DECON_VCLK_USER			29
+#define CLK_GOUT_DISPAUD_MUX_MI2S				30
+#define CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER		31
+#define CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER_CON		32
+#define CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER		33
+#define CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER_CON	34
+#define CLK_GOUT_DISPAUD_MUX_PLL				35
+#define CLK_GOUT_DISPAUD_MUX_PLL_CON				36
+#define CLK_MOUT_DISPAUD_BUS_USER				37
+#define CLK_MOUT_DISPAUD_DECON_ECLK				38
+#define CLK_MOUT_DISPAUD_DECON_ECLK_USER			39
+#define CLK_MOUT_DISPAUD_DECON_VCLK				40
+#define CLK_MOUT_DISPAUD_DECON_VCLK_USER			41
+#define CLK_MOUT_DISPAUD_MI2S					42
+#define DISPAUD_NR_CLK						43
+
+/* CMU_FSYS */
+#define CLK_FOUT_FSYS_USB_PLL				1
+#define CLK_GOUT_FSYS_BUSP3_HCLK			2
+#define CLK_GOUT_FSYS_MMC0_ACLK				3
+#define CLK_GOUT_FSYS_MMC1_ACLK				4
+#define CLK_GOUT_FSYS_MMC2_ACLK				5
+#define CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER	6
+#define CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER_CON	7
+#define CLK_GOUT_FSYS_MUX_USB_PLL			8
+#define CLK_GOUT_FSYS_MUX_USB_PLL_CON			9
+#define CLK_GOUT_FSYS_PDMA0_ACLK_PDMA0			10
+#define CLK_GOUT_FSYS_PPMU_ACLK				11
+#define CLK_GOUT_FSYS_PPMU_PCLK				12
+#define CLK_GOUT_FSYS_SROMC_HCLK			13
+#define CLK_GOUT_FSYS_UPSIZER_BUS1_ACLK			14
+#define CLK_GOUT_FSYS_USB20DRD_ACLK_HSDRD		15
+#define CLK_GOUT_FSYS_USB20DRD_HCLK_USB20_CTRL		16
+#define CLK_GOUT_FSYS_USB20DRD_HSDRD_REF_CLK		17
+#define FSYS_NR_CLK					18
+
+/* CMU_G3D */
+#define CLK_DOUT_G3D_APB		1
+#define CLK_DOUT_G3D_BUS		2
+#define CLK_FOUT_G3D_PLL		3
+#define CLK_GOUT_G3D_ASYNCS_D0_CLK	4
+#define CLK_GOUT_G3D_ASYNC_PCLKM	5
+#define CLK_GOUT_G3D_CLK		6
+#define CLK_GOUT_G3D_MUX		7
+#define CLK_GOUT_G3D_MUX_PLL		8
+#define CLK_GOUT_G3D_MUX_PLL_CON	9
+#define CLK_GOUT_G3D_MUX_SWITCH_USER	10
+#define CLK_GOUT_G3D_PPMU_ACLK		11
+#define CLK_GOUT_G3D_PPMU_PCLK		12
+#define CLK_GOUT_G3D_QE_ACLK		13
+#define CLK_GOUT_G3D_QE_PCLK		14
+#define CLK_GOUT_G3D_SYSREG_PCLK	15
+#define CLK_MOUT_G3D			16
+#define CLK_MOUT_G3D_SWITCH_USER	17
+#define G3D_NR_CLK			18
+
+/* CMU_ISP */
+#define CLK_DOUT_ISP_APB				1
+#define CLK_DOUT_ISP_CAM_HALF				2
+#define CLK_FOUT_ISP_PLL				3
+#define CLK_GOUT_ISP_CAM				4
+#define CLK_GOUT_ISP_CAM_HALF				5
+#define CLK_GOUT_ISP_ISPD				6
+#define CLK_GOUT_ISP_ISPD_PPMU				7
+#define CLK_GOUT_ISP_MUX_CAM				8
+#define CLK_GOUT_ISP_MUX_CAM_USER			9
+#define CLK_GOUT_ISP_MUX_ISP				10
+#define CLK_GOUT_ISP_MUX_ISPD				11
+#define CLK_GOUT_ISP_MUX_PLL				12
+#define CLK_GOUT_ISP_MUX_PLL_CON			13
+#define CLK_GOUT_ISP_MUX_RXBYTECLKHS0_SENSOR0_USER	14
+#define CLK_GOUT_ISP_MUX_RXBYTECLKHS0_SENSOR0_USER_CON	15
+#define CLK_GOUT_ISP_MUX_RXBYTECLKHS0_SENSOR1_USER	16
+#define CLK_GOUT_ISP_MUX_RXBYTECLKHS0_SENSOR1_USER_CON	17
+#define CLK_GOUT_ISP_MUX_USER				18
+#define CLK_GOUT_ISP_MUX_VRA				19
+#define CLK_GOUT_ISP_MUX_VRA_USER			20
+#define CLK_GOUT_ISP_VRA				21
+#define CLK_MOUT_ISP_CAM				22
+#define CLK_MOUT_ISP_CAM_USER				23
+#define CLK_MOUT_ISP_ISP				24
+#define CLK_MOUT_ISP_ISPD				25
+#define CLK_MOUT_ISP_USER				26
+#define CLK_MOUT_ISP_VRA				27
+#define CLK_MOUT_ISP_VRA_USER				28
+#define ISP_NR_CLK					29
+
+/* CMU_MFCMSCL */
+#define CLK_DOUT_MFCMSCL_APB		1
+#define CLK_GOUT_MFCMSCL_MFC		2
+#define CLK_GOUT_MFCMSCL_MSCL		3
+#define CLK_GOUT_MFCMSCL_MSCL_BI	4
+#define CLK_GOUT_MFCMSCL_MSCL_D		5
+#define CLK_GOUT_MFCMSCL_MSCL_JPEG	6
+#define CLK_GOUT_MFCMSCL_MSCL_POLY	7
+#define CLK_GOUT_MFCMSCL_MSCL_PPMU	8
+#define CLK_GOUT_MFCMSCL_MUX_MFC_USER	9
+#define CLK_GOUT_MFCMSCL_MUX_MSCL_USER	10
+#define CLK_MOUT_MFCMSCL_MFC_USER	11
+#define CLK_MOUT_MFCMSCL_MSCL_USER	12
+#define MFCMSCL_NR_CLK			13
+
+/* CMU_PERI */
+#define CLK_GOUT_PERI_BUSP1_PERIC0_HCLK		1
+#define CLK_GOUT_PERI_GPIO2_PCLK		2
+#define CLK_GOUT_PERI_GPIO5_PCLK		3
+#define CLK_GOUT_PERI_GPIO6_PCLK		4
+#define CLK_GOUT_PERI_GPIO7_PCLK		5
+#define CLK_GOUT_PERI_HSI2C1_IPCLK		6
+#define CLK_GOUT_PERI_HSI2C2_IPCLK		7
+#define CLK_GOUT_PERI_HSI2C3_IPCLK		8
+#define CLK_GOUT_PERI_HSI2C4_IPCLK		9
+#define CLK_GOUT_PERI_HSI2C5_IPCLK		10
+#define CLK_GOUT_PERI_HSI2C6_IPCLK		11
+#define CLK_GOUT_PERI_I2C0_PCLK			12
+#define CLK_GOUT_PERI_I2C1_PCLK			13
+#define CLK_GOUT_PERI_I2C2_PCLK			14
+#define CLK_GOUT_PERI_I2C3_PCLK			15
+#define CLK_GOUT_PERI_I2C4_PCLK			16
+#define CLK_GOUT_PERI_I2C5_PCLK			17
+#define CLK_GOUT_PERI_I2C6_PCLK			18
+#define CLK_GOUT_PERI_I2C7_PCLK			19
+#define CLK_GOUT_PERI_I2C8_PCLK			20
+#define CLK_GOUT_PERI_MCT_PCLK			21
+#define CLK_GOUT_PERI_PWM_MOTOR_OSCCLK		22
+#define CLK_GOUT_PERI_PWM_MOTOR_PCLK_S0		23
+#define CLK_GOUT_PERI_SFRIF_TMU_CPUCL0_PCLK	24
+#define CLK_GOUT_PERI_SFRIF_TMU_CPUCL1_PCLK	25
+#define CLK_GOUT_PERI_SFRIF_TMU_PCLK		26
+#define CLK_GOUT_PERI_SPI0_PCLK			27
+#define CLK_GOUT_PERI_SPI0_SPI_EXT_CLK		28
+#define CLK_GOUT_PERI_SPI1_PCLK			29
+#define CLK_GOUT_PERI_SPI1_SPI_EXT_CLK		30
+#define CLK_GOUT_PERI_SPI2_PCLK			31
+#define CLK_GOUT_PERI_SPI2_SPI_EXT_CLK		32
+#define CLK_GOUT_PERI_SPI3_PCLK			33
+#define CLK_GOUT_PERI_SPI3_SPI_EXT_CLK		34
+#define CLK_GOUT_PERI_SPI4_PCLK			35
+#define CLK_GOUT_PERI_SPI4_SPI_EXT_CLK		36
+#define CLK_GOUT_PERI_TMU_CLK			37
+#define CLK_GOUT_PERI_TMU_CPUCL0_CLK		38
+#define CLK_GOUT_PERI_TMU_CPUCL1_CLK		39
+#define CLK_GOUT_PERI_UART0_EXT_UCLK		40
+#define CLK_GOUT_PERI_UART0_PCLK		41
+#define CLK_GOUT_PERI_UART1_EXT_UCLK		42
+#define CLK_GOUT_PERI_UART1_PCLK		43
+#define CLK_GOUT_PERI_UART2_EXT_UCLK		44
+#define CLK_GOUT_PERI_UART2_PCLK		45
+#define CLK_GOUT_PERI_WDT_CPUCL0_PCLK		46
+#define CLK_GOUT_PERI_WDT_CPUCL1_PCLK		47
+#define PERI_NR_CLK				48
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS7870_H */
-- 
2.48.1



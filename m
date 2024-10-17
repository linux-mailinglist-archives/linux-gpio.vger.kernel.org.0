Return-Path: <linux-gpio+bounces-11481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC69A1694
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D45DB21E82
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371CF168BE;
	Thu, 17 Oct 2024 00:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="kKT+MYsx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2167AD2F;
	Thu, 17 Oct 2024 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123721; cv=none; b=mczJkYwhyYMrJoi/7IYDeeSfBk947+ZKGYvLM13HY+eYE7ahT0XdkriQ3DH+Da9al2iRjDS4QX9qhzywocF57tS/+gGy5ChYmRC4yibiAFWcWJ5VMiCuU0bt3Pfz4YdOmZ/+9M7LifZFTrKzvZrSmyBKgAiWaluNfDEM0NhS+8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123721; c=relaxed/simple;
	bh=R2JzNyrFNQb1ce6shu+s1IXJUDq5c6Ipi7fmCvEApSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThCr7KGXWumExocufduPdIZBUfE/ErRtyz3ENdAmOlJft07m4tQSGhZY4qsN6i2gIJ1qQA4RT8WSr+NblEgMRW4kWr/+GX73pwT1yBG+lje1BtCDUSvFw1xGwaW6ziHTRpi3Ug44Rs910DpCAlqehfO6Ax6K3JBICn0TAlvxI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=kKT+MYsx; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A804D88E3A;
	Thu, 17 Oct 2024 02:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123715;
	bh=KX3aYgZsEO4G1mEvZatIK/9EtQdFScVZlH3wnhG2cmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKT+MYsxdql8s2C77uyVw6BIulEybj1A8GDHnbzAXCo9I3lDuijPKu4bdq3+T6KZc
	 Hra86PDtW4f9+lOKLkA8FyCFtnnTGSI3IVzOgWTUGARJXFp0mD/wvr0aYmc36Es8Br
	 SWuU4v5OFOU9JaC3V8/3TVoa8X7R5GStfC1jIdEE7FdXPRz2fXiS/ul+HDqBaA46hm
	 BMVwb/kCXK/6TnOsUDK20sqJBHuYtVvx8/cJCV/Vyy4kotswwaiOtR67z+ZYjgsKRd
	 XYJQyyfpDsh9/Gg8pA2gMwb1u6jhSi+18aH31bAYMNL7/lWYS3ewOxfWGqai7ldMmA
	 K4qW/xBm+iGHw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 10/12] ARM: dts: imx6sl: imx6sll: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:56 +0200
Message-ID: <20241017000801.149276-10-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017000801.149276-1-marex@denx.de>
References: <20241017000801.149276-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Bindings expect pin configuration nodes in pinctrl to match certain
naming and not be part of another fake node:

pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Drop the wrapping node and adjust the names to have "grp" prefix.
Diff looks big but this should have no functional impact, use e.g.
git show -w to view the diff.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
---
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts      | 480 +++++++++---------
 .../dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |   8 +-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine3.dts |   8 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts     |  12 +-
 .../boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |   8 +-
 5 files changed, 257 insertions(+), 259 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
index 7c899291ab0da..b7009fd5b6629 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
@@ -287,271 +287,269 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6sl-evk {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6SL_PAD_KEY_ROW7__GPIO4_IO07    0x17059
-				MX6SL_PAD_KEY_COL7__GPIO4_IO06    0x17059
-				MX6SL_PAD_SD2_DAT7__GPIO5_IO00    0x17059
-				MX6SL_PAD_SD2_DAT6__GPIO4_IO29    0x17059
-				MX6SL_PAD_REF_CLK_32K__GPIO3_IO22 0x17059
-				MX6SL_PAD_KEY_COL4__GPIO4_IO00	0x80000000
-				MX6SL_PAD_KEY_COL5__GPIO4_IO02	0x80000000
-				MX6SL_PAD_AUD_MCLK__AUDIO_CLK_OUT 0x4130b0
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6SL_PAD_KEY_ROW7__GPIO4_IO07    0x17059
+			MX6SL_PAD_KEY_COL7__GPIO4_IO06    0x17059
+			MX6SL_PAD_SD2_DAT7__GPIO5_IO00    0x17059
+			MX6SL_PAD_SD2_DAT6__GPIO4_IO29    0x17059
+			MX6SL_PAD_REF_CLK_32K__GPIO3_IO22 0x17059
+			MX6SL_PAD_KEY_COL4__GPIO4_IO00	0x80000000
+			MX6SL_PAD_KEY_COL5__GPIO4_IO02	0x80000000
+			MX6SL_PAD_AUD_MCLK__AUDIO_CLK_OUT 0x4130b0
+		>;
+	};
 
-		pinctrl_audmux3: audmux3grp {
-			fsl,pins = <
-				MX6SL_PAD_AUD_RXD__AUD3_RXD	  0x4130b0
-				MX6SL_PAD_AUD_TXC__AUD3_TXC	  0x4130b0
-				MX6SL_PAD_AUD_TXD__AUD3_TXD	  0x4110b0
-				MX6SL_PAD_AUD_TXFS__AUD3_TXFS	  0x4130b0
-			>;
-		};
+	pinctrl_audmux3: audmux3grp {
+		fsl,pins = <
+			MX6SL_PAD_AUD_RXD__AUD3_RXD	  0x4130b0
+			MX6SL_PAD_AUD_TXC__AUD3_TXC	  0x4130b0
+			MX6SL_PAD_AUD_TXD__AUD3_TXD	  0x4110b0
+			MX6SL_PAD_AUD_TXFS__AUD3_TXFS	  0x4130b0
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO	0x100b1
-				MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI	0x100b1
-				MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK	0x100b1
-				MX6SL_PAD_ECSPI1_SS0__GPIO4_IO11	0x80000000
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO	0x100b1
+			MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI	0x100b1
+			MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK	0x100b1
+			MX6SL_PAD_ECSPI1_SS0__GPIO4_IO11	0x80000000
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX6SL_PAD_FEC_MDC__FEC_MDC		0x1b0b0
-				MX6SL_PAD_FEC_MDIO__FEC_MDIO		0x1b0b0
-				MX6SL_PAD_FEC_CRS_DV__FEC_RX_DV		0x1b0b0
-				MX6SL_PAD_FEC_RXD0__FEC_RX_DATA0	0x1b0b0
-				MX6SL_PAD_FEC_RXD1__FEC_RX_DATA1	0x1b0b0
-				MX6SL_PAD_FEC_TX_EN__FEC_TX_EN		0x1b0b0
-				MX6SL_PAD_FEC_TXD0__FEC_TX_DATA0	0x1b0b0
-				MX6SL_PAD_FEC_TXD1__FEC_TX_DATA1	0x1b0b0
-				MX6SL_PAD_FEC_REF_CLK__FEC_REF_OUT	0x4001b0a8
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX6SL_PAD_FEC_MDC__FEC_MDC		0x1b0b0
+			MX6SL_PAD_FEC_MDIO__FEC_MDIO		0x1b0b0
+			MX6SL_PAD_FEC_CRS_DV__FEC_RX_DV		0x1b0b0
+			MX6SL_PAD_FEC_RXD0__FEC_RX_DATA0	0x1b0b0
+			MX6SL_PAD_FEC_RXD1__FEC_RX_DATA1	0x1b0b0
+			MX6SL_PAD_FEC_TX_EN__FEC_TX_EN		0x1b0b0
+			MX6SL_PAD_FEC_TXD0__FEC_TX_DATA0	0x1b0b0
+			MX6SL_PAD_FEC_TXD1__FEC_TX_DATA1	0x1b0b0
+			MX6SL_PAD_FEC_REF_CLK__FEC_REF_OUT	0x4001b0a8
+		>;
+	};
 
-		pinctrl_fec_sleep: fecgrp-sleep {
-			fsl,pins = <
-				MX6SL_PAD_FEC_MDC__GPIO4_IO23      0x3080
-				MX6SL_PAD_FEC_CRS_DV__GPIO4_IO25   0x3080
-				MX6SL_PAD_FEC_RXD0__GPIO4_IO17     0x3080
-				MX6SL_PAD_FEC_RXD1__GPIO4_IO18     0x3080
-				MX6SL_PAD_FEC_TX_EN__GPIO4_IO22    0x3080
-				MX6SL_PAD_FEC_TXD0__GPIO4_IO24     0x3080
-				MX6SL_PAD_FEC_TXD1__GPIO4_IO16     0x3080
-				MX6SL_PAD_FEC_REF_CLK__GPIO4_IO26  0x3080
-			>;
-		};
+	pinctrl_fec_sleep: fecgrp-sleep {
+		fsl,pins = <
+			MX6SL_PAD_FEC_MDC__GPIO4_IO23      0x3080
+			MX6SL_PAD_FEC_CRS_DV__GPIO4_IO25   0x3080
+			MX6SL_PAD_FEC_RXD0__GPIO4_IO17     0x3080
+			MX6SL_PAD_FEC_RXD1__GPIO4_IO18     0x3080
+			MX6SL_PAD_FEC_TX_EN__GPIO4_IO22    0x3080
+			MX6SL_PAD_FEC_TXD0__GPIO4_IO24     0x3080
+			MX6SL_PAD_FEC_TXD1__GPIO4_IO16     0x3080
+			MX6SL_PAD_FEC_REF_CLK__GPIO4_IO26  0x3080
+		>;
+	};
 
-		pinctrl_hp: hpgrp {
-			fsl,pins = <
-				MX6SL_PAD_FEC_RX_ER__GPIO4_IO19	  0x1b0b0
-			>;
-		};
+	pinctrl_hp: hpgrp {
+		fsl,pins = <
+			MX6SL_PAD_FEC_RX_ER__GPIO4_IO19	  0x1b0b0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6SL_PAD_I2C1_SCL__I2C1_SCL	0x4001b8b1
-				MX6SL_PAD_I2C1_SDA__I2C1_SDA	0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6SL_PAD_I2C1_SCL__I2C1_SCL	0x4001b8b1
+			MX6SL_PAD_I2C1_SDA__I2C1_SDA	0x4001b8b1
+		>;
+	};
 
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6SL_PAD_I2C2_SCL__I2C2_SCL	0x4001b8b1
-				MX6SL_PAD_I2C2_SDA__I2C2_SDA	0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6SL_PAD_I2C2_SCL__I2C2_SCL	0x4001b8b1
+			MX6SL_PAD_I2C2_SDA__I2C2_SDA	0x4001b8b1
+		>;
+	};
 
-		pinctrl_kpp: kppgrp {
-			fsl,pins = <
-				MX6SL_PAD_KEY_ROW0__KEY_ROW0    0x1b010
-				MX6SL_PAD_KEY_ROW1__KEY_ROW1    0x1b010
-				MX6SL_PAD_KEY_ROW2__KEY_ROW2    0x1b0b0
-				MX6SL_PAD_KEY_COL0__KEY_COL0    0x110b0
-				MX6SL_PAD_KEY_COL1__KEY_COL1    0x110b0
-				MX6SL_PAD_KEY_COL2__KEY_COL2    0x110b0
-			>;
-		};
+	pinctrl_kpp: kppgrp {
+		fsl,pins = <
+			MX6SL_PAD_KEY_ROW0__KEY_ROW0    0x1b010
+			MX6SL_PAD_KEY_ROW1__KEY_ROW1    0x1b010
+			MX6SL_PAD_KEY_ROW2__KEY_ROW2    0x1b0b0
+			MX6SL_PAD_KEY_COL0__KEY_COL0    0x110b0
+			MX6SL_PAD_KEY_COL1__KEY_COL1    0x110b0
+			MX6SL_PAD_KEY_COL2__KEY_COL2    0x110b0
+		>;
+	};
 
-		pinctrl_lcd: lcdgrp {
-			fsl,pins = <
-				MX6SL_PAD_LCD_DAT0__LCD_DATA00 0x1b0b0
-				MX6SL_PAD_LCD_DAT1__LCD_DATA01 0x1b0b0
-				MX6SL_PAD_LCD_DAT2__LCD_DATA02 0x1b0b0
-				MX6SL_PAD_LCD_DAT3__LCD_DATA03 0x1b0b0
-				MX6SL_PAD_LCD_DAT4__LCD_DATA04 0x1b0b0
-				MX6SL_PAD_LCD_DAT5__LCD_DATA05 0x1b0b0
-				MX6SL_PAD_LCD_DAT6__LCD_DATA06 0x1b0b0
-				MX6SL_PAD_LCD_DAT7__LCD_DATA07 0x1b0b0
-				MX6SL_PAD_LCD_DAT8__LCD_DATA08 0x1b0b0
-				MX6SL_PAD_LCD_DAT9__LCD_DATA09 0x1b0b0
-				MX6SL_PAD_LCD_DAT10__LCD_DATA10 0x1b0b0
-				MX6SL_PAD_LCD_DAT11__LCD_DATA11 0x1b0b0
-				MX6SL_PAD_LCD_DAT12__LCD_DATA12 0x1b0b0
-				MX6SL_PAD_LCD_DAT13__LCD_DATA13 0x1b0b0
-				MX6SL_PAD_LCD_DAT14__LCD_DATA14 0x1b0b0
-				MX6SL_PAD_LCD_DAT15__LCD_DATA15 0x1b0b0
-				MX6SL_PAD_LCD_DAT16__LCD_DATA16 0x1b0b0
-				MX6SL_PAD_LCD_DAT17__LCD_DATA17 0x1b0b0
-				MX6SL_PAD_LCD_DAT18__LCD_DATA18 0x1b0b0
-				MX6SL_PAD_LCD_DAT19__LCD_DATA19 0x1b0b0
-				MX6SL_PAD_LCD_DAT20__LCD_DATA20 0x1b0b0
-				MX6SL_PAD_LCD_DAT21__LCD_DATA21 0x1b0b0
-				MX6SL_PAD_LCD_DAT22__LCD_DATA22 0x1b0b0
-				MX6SL_PAD_LCD_DAT23__LCD_DATA23 0x1b0b0
-				MX6SL_PAD_LCD_CLK__LCD_CLK 0x1b0b0
-				MX6SL_PAD_LCD_ENABLE__LCD_ENABLE 0x1b0b0
-				MX6SL_PAD_LCD_HSYNC__LCD_HSYNC 0x1b0b0
-				MX6SL_PAD_LCD_VSYNC__LCD_VSYNC 0x1b0b0
-			>;
-		};
+	pinctrl_lcd: lcdgrp {
+		fsl,pins = <
+			MX6SL_PAD_LCD_DAT0__LCD_DATA00 0x1b0b0
+			MX6SL_PAD_LCD_DAT1__LCD_DATA01 0x1b0b0
+			MX6SL_PAD_LCD_DAT2__LCD_DATA02 0x1b0b0
+			MX6SL_PAD_LCD_DAT3__LCD_DATA03 0x1b0b0
+			MX6SL_PAD_LCD_DAT4__LCD_DATA04 0x1b0b0
+			MX6SL_PAD_LCD_DAT5__LCD_DATA05 0x1b0b0
+			MX6SL_PAD_LCD_DAT6__LCD_DATA06 0x1b0b0
+			MX6SL_PAD_LCD_DAT7__LCD_DATA07 0x1b0b0
+			MX6SL_PAD_LCD_DAT8__LCD_DATA08 0x1b0b0
+			MX6SL_PAD_LCD_DAT9__LCD_DATA09 0x1b0b0
+			MX6SL_PAD_LCD_DAT10__LCD_DATA10 0x1b0b0
+			MX6SL_PAD_LCD_DAT11__LCD_DATA11 0x1b0b0
+			MX6SL_PAD_LCD_DAT12__LCD_DATA12 0x1b0b0
+			MX6SL_PAD_LCD_DAT13__LCD_DATA13 0x1b0b0
+			MX6SL_PAD_LCD_DAT14__LCD_DATA14 0x1b0b0
+			MX6SL_PAD_LCD_DAT15__LCD_DATA15 0x1b0b0
+			MX6SL_PAD_LCD_DAT16__LCD_DATA16 0x1b0b0
+			MX6SL_PAD_LCD_DAT17__LCD_DATA17 0x1b0b0
+			MX6SL_PAD_LCD_DAT18__LCD_DATA18 0x1b0b0
+			MX6SL_PAD_LCD_DAT19__LCD_DATA19 0x1b0b0
+			MX6SL_PAD_LCD_DAT20__LCD_DATA20 0x1b0b0
+			MX6SL_PAD_LCD_DAT21__LCD_DATA21 0x1b0b0
+			MX6SL_PAD_LCD_DAT22__LCD_DATA22 0x1b0b0
+			MX6SL_PAD_LCD_DAT23__LCD_DATA23 0x1b0b0
+			MX6SL_PAD_LCD_CLK__LCD_CLK 0x1b0b0
+			MX6SL_PAD_LCD_ENABLE__LCD_ENABLE 0x1b0b0
+			MX6SL_PAD_LCD_HSYNC__LCD_HSYNC 0x1b0b0
+			MX6SL_PAD_LCD_VSYNC__LCD_VSYNC 0x1b0b0
+		>;
+	};
 
-		pinctrl_led: ledgrp {
-			fsl,pins = <
-				MX6SL_PAD_HSIC_STROBE__GPIO3_IO20 0x17059
-			>;
-		};
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX6SL_PAD_HSIC_STROBE__GPIO3_IO20 0x17059
+		>;
+	};
 
-		pinctrl_pwm1: pwmgrp {
-			fsl,pins = <
-				MX6SL_PAD_PWM1__PWM1_OUT 0x110b0
-			>;
-		};
+	pinctrl_pwm1: pwmgrp {
+		fsl,pins = <
+			MX6SL_PAD_PWM1__PWM1_OUT 0x110b0
+		>;
+	};
 
-		pinctrl_reg_lcd_3v3: reglcd3v3grp {
-			fsl,pins = <
-				MX6SL_PAD_KEY_ROW5__GPIO4_IO03    0x17059
-			>;
-		};
+	pinctrl_reg_lcd_3v3: reglcd3v3grp {
+		fsl,pins = <
+			MX6SL_PAD_KEY_ROW5__GPIO4_IO03    0x17059
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6SL_PAD_UART1_RXD__UART1_RX_DATA	0x1b0b1
-				MX6SL_PAD_UART1_TXD__UART1_TX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6SL_PAD_UART1_RXD__UART1_RX_DATA	0x1b0b1
+			MX6SL_PAD_UART1_TXD__UART1_TX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg1: usbotg1grp {
-			fsl,pins = <
-				MX6SL_PAD_EPDC_PWRCOM__USB_OTG1_ID	0x17059
-			>;
-		};
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <
+			MX6SL_PAD_EPDC_PWRCOM__USB_OTG1_ID	0x17059
+		>;
+	};
 
-		pinctrl_usdhc1: usdhc1grp {
-			fsl,pins = <
-				MX6SL_PAD_SD1_CMD__SD1_CMD		0x17059
-				MX6SL_PAD_SD1_CLK__SD1_CLK		0x10059
-				MX6SL_PAD_SD1_DAT0__SD1_DATA0		0x17059
-				MX6SL_PAD_SD1_DAT1__SD1_DATA1		0x17059
-				MX6SL_PAD_SD1_DAT2__SD1_DATA2		0x17059
-				MX6SL_PAD_SD1_DAT3__SD1_DATA3		0x17059
-				MX6SL_PAD_SD1_DAT4__SD1_DATA4		0x17059
-				MX6SL_PAD_SD1_DAT5__SD1_DATA5		0x17059
-				MX6SL_PAD_SD1_DAT6__SD1_DATA6		0x17059
-				MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x17059
-			>;
-		};
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6SL_PAD_SD1_CMD__SD1_CMD		0x17059
+			MX6SL_PAD_SD1_CLK__SD1_CLK		0x10059
+			MX6SL_PAD_SD1_DAT0__SD1_DATA0		0x17059
+			MX6SL_PAD_SD1_DAT1__SD1_DATA1		0x17059
+			MX6SL_PAD_SD1_DAT2__SD1_DATA2		0x17059
+			MX6SL_PAD_SD1_DAT3__SD1_DATA3		0x17059
+			MX6SL_PAD_SD1_DAT4__SD1_DATA4		0x17059
+			MX6SL_PAD_SD1_DAT5__SD1_DATA5		0x17059
+			MX6SL_PAD_SD1_DAT6__SD1_DATA6		0x17059
+			MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x17059
+		>;
+	};
 
-		pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
-			fsl,pins = <
-				MX6SL_PAD_SD1_CMD__SD1_CMD		0x170b9
-				MX6SL_PAD_SD1_CLK__SD1_CLK		0x100b9
-				MX6SL_PAD_SD1_DAT0__SD1_DATA0		0x170b9
-				MX6SL_PAD_SD1_DAT1__SD1_DATA1		0x170b9
-				MX6SL_PAD_SD1_DAT2__SD1_DATA2		0x170b9
-				MX6SL_PAD_SD1_DAT3__SD1_DATA3		0x170b9
-				MX6SL_PAD_SD1_DAT4__SD1_DATA4		0x170b9
-				MX6SL_PAD_SD1_DAT5__SD1_DATA5		0x170b9
-				MX6SL_PAD_SD1_DAT6__SD1_DATA6		0x170b9
-				MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x170b9
-			>;
-		};
+	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
+		fsl,pins = <
+			MX6SL_PAD_SD1_CMD__SD1_CMD		0x170b9
+			MX6SL_PAD_SD1_CLK__SD1_CLK		0x100b9
+			MX6SL_PAD_SD1_DAT0__SD1_DATA0		0x170b9
+			MX6SL_PAD_SD1_DAT1__SD1_DATA1		0x170b9
+			MX6SL_PAD_SD1_DAT2__SD1_DATA2		0x170b9
+			MX6SL_PAD_SD1_DAT3__SD1_DATA3		0x170b9
+			MX6SL_PAD_SD1_DAT4__SD1_DATA4		0x170b9
+			MX6SL_PAD_SD1_DAT5__SD1_DATA5		0x170b9
+			MX6SL_PAD_SD1_DAT6__SD1_DATA6		0x170b9
+			MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x170b9
+		>;
+	};
 
-		pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
-			fsl,pins = <
-				MX6SL_PAD_SD1_CMD__SD1_CMD		0x170f9
-				MX6SL_PAD_SD1_CLK__SD1_CLK		0x100f9
-				MX6SL_PAD_SD1_DAT0__SD1_DATA0		0x170f9
-				MX6SL_PAD_SD1_DAT1__SD1_DATA1		0x170f9
-				MX6SL_PAD_SD1_DAT2__SD1_DATA2		0x170f9
-				MX6SL_PAD_SD1_DAT3__SD1_DATA3		0x170f9
-				MX6SL_PAD_SD1_DAT4__SD1_DATA4		0x170f9
-				MX6SL_PAD_SD1_DAT5__SD1_DATA5		0x170f9
-				MX6SL_PAD_SD1_DAT6__SD1_DATA6		0x170f9
-				MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x170f9
-			>;
-		};
+	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
+		fsl,pins = <
+			MX6SL_PAD_SD1_CMD__SD1_CMD		0x170f9
+			MX6SL_PAD_SD1_CLK__SD1_CLK		0x100f9
+			MX6SL_PAD_SD1_DAT0__SD1_DATA0		0x170f9
+			MX6SL_PAD_SD1_DAT1__SD1_DATA1		0x170f9
+			MX6SL_PAD_SD1_DAT2__SD1_DATA2		0x170f9
+			MX6SL_PAD_SD1_DAT3__SD1_DATA3		0x170f9
+			MX6SL_PAD_SD1_DAT4__SD1_DATA4		0x170f9
+			MX6SL_PAD_SD1_DAT5__SD1_DATA5		0x170f9
+			MX6SL_PAD_SD1_DAT6__SD1_DATA6		0x170f9
+			MX6SL_PAD_SD1_DAT7__SD1_DATA7		0x170f9
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6SL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6SL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6SL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6SL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6SL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6SL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6SL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6SL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6SL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6SL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+		>;
+	};
 
-		pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
-			fsl,pins = <
-				MX6SL_PAD_SD2_CMD__SD2_CMD		0x170b9
-				MX6SL_PAD_SD2_CLK__SD2_CLK		0x100b9
-				MX6SL_PAD_SD2_DAT0__SD2_DATA0		0x170b9
-				MX6SL_PAD_SD2_DAT1__SD2_DATA1		0x170b9
-				MX6SL_PAD_SD2_DAT2__SD2_DATA2		0x170b9
-				MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
-			>;
-		};
+	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX6SL_PAD_SD2_CMD__SD2_CMD		0x170b9
+			MX6SL_PAD_SD2_CLK__SD2_CLK		0x100b9
+			MX6SL_PAD_SD2_DAT0__SD2_DATA0		0x170b9
+			MX6SL_PAD_SD2_DAT1__SD2_DATA1		0x170b9
+			MX6SL_PAD_SD2_DAT2__SD2_DATA2		0x170b9
+			MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
+		>;
+	};
 
-		pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
-			fsl,pins = <
-				MX6SL_PAD_SD2_CMD__SD2_CMD		0x170f9
-				MX6SL_PAD_SD2_CLK__SD2_CLK		0x100f9
-				MX6SL_PAD_SD2_DAT0__SD2_DATA0		0x170f9
-				MX6SL_PAD_SD2_DAT1__SD2_DATA1		0x170f9
-				MX6SL_PAD_SD2_DAT2__SD2_DATA2		0x170f9
-				MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170f9
-			>;
-		};
+	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX6SL_PAD_SD2_CMD__SD2_CMD		0x170f9
+			MX6SL_PAD_SD2_CLK__SD2_CLK		0x100f9
+			MX6SL_PAD_SD2_DAT0__SD2_DATA0		0x170f9
+			MX6SL_PAD_SD2_DAT1__SD2_DATA1		0x170f9
+			MX6SL_PAD_SD2_DAT2__SD2_DATA2		0x170f9
+			MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170f9
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6SL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6SL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6SL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6SL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6SL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6SL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6SL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6SL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6SL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6SL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+		>;
+	};
 
-		pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
-			fsl,pins = <
-				MX6SL_PAD_SD3_CMD__SD3_CMD		0x170b9
-				MX6SL_PAD_SD3_CLK__SD3_CLK		0x100b9
-				MX6SL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
-				MX6SL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
-				MX6SL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
-				MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
-			>;
-		};
+	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX6SL_PAD_SD3_CMD__SD3_CMD		0x170b9
+			MX6SL_PAD_SD3_CLK__SD3_CLK		0x100b9
+			MX6SL_PAD_SD3_DAT0__SD3_DATA0		0x170b9
+			MX6SL_PAD_SD3_DAT1__SD3_DATA1		0x170b9
+			MX6SL_PAD_SD3_DAT2__SD3_DATA2		0x170b9
+			MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x170b9
+		>;
+	};
 
-		pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
-			fsl,pins = <
-				MX6SL_PAD_SD3_CMD__SD3_CMD		0x170f9
-				MX6SL_PAD_SD3_CLK__SD3_CLK		0x100f9
-				MX6SL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
-				MX6SL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
-				MX6SL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
-				MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
-			>;
-		};
+	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX6SL_PAD_SD3_CMD__SD3_CMD		0x170f9
+			MX6SL_PAD_SD3_CLK__SD3_CLK		0x100f9
+			MX6SL_PAD_SD3_DAT0__SD3_DATA0		0x170f9
+			MX6SL_PAD_SD3_DAT1__SD3_DATA1		0x170f9
+			MX6SL_PAD_SD3_DAT2__SD3_DATA2		0x170f9
+			MX6SL_PAD_SD3_DAT3__SD3_DATA3		0x170f9
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
index 03d6965f01495..7f65aacad706a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
@@ -456,7 +456,7 @@ MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x17059
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD2_CMD__SD2_CMD		0x170b9
 			MX6SL_PAD_SD2_CLK__SD2_CLK		0x130b9
@@ -467,7 +467,7 @@ MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp-200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD2_CMD__SD2_CMD		0x170f9
 			MX6SL_PAD_SD2_CLK__SD2_CLK		0x130f9
@@ -500,7 +500,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3	0x11059
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD3_CMD__SD3_CMD	0x170b9
 			MX6SL_PAD_SD3_CLK__SD3_CLK	0x170b9
@@ -511,7 +511,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD3_CMD__SD3_CMD	0x170f9
 			MX6SL_PAD_SD3_CLK__SD3_CLK	0x170f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
index db5d8509935f1..f4aae64574e2c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts
@@ -190,7 +190,7 @@ MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x17059
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD2_CMD__SD2_CMD		0x170b9
 			MX6SL_PAD_SD2_CLK__SD2_CLK		0x130b9
@@ -201,7 +201,7 @@ MX6SL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp-200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD2_CMD__SD2_CMD		0x170f9
 			MX6SL_PAD_SD2_CLK__SD2_CLK		0x130f9
@@ -234,7 +234,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3	0x11059
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD3_CMD__SD3_CMD	0x170b9
 			MX6SL_PAD_SD3_CLK__SD3_CLK	0x170b9
@@ -245,7 +245,7 @@ MX6SL_PAD_SD3_DAT3__SD3_DATA3	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX6SL_PAD_SD3_CMD__SD3_CMD	0x170f9
 			MX6SL_PAD_SD3_CLK__SD3_CLK	0x170f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index febc2dd9967de..05d6827ea2af3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -461,7 +461,7 @@ MX6SLL_PAD_SD1_DATA3__SD1_DATA3	0x17059
 		>;
 	};
 
-	pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD1_CMD__SD1_CMD	0x170b9
 			MX6SLL_PAD_SD1_CLK__SD1_CLK	0x130b9
@@ -472,7 +472,7 @@ MX6SLL_PAD_SD1_DATA3__SD1_DATA3	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc1_200mhz: usdhc1grp-200mhz {
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD1_CMD__SD1_CMD	0x170f9
 			MX6SLL_PAD_SD1_CLK__SD1_CLK	0x130f9
@@ -499,7 +499,7 @@ MX6SLL_PAD_GPIO4_IO21__SD2_STROBE	0x13059
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD2_CMD__SD2_CMD		0x170b9
 			MX6SLL_PAD_SD2_CLK__SD2_CLK		0x130b9
@@ -515,7 +515,7 @@ MX6SLL_PAD_GPIO4_IO21__SD2_STROBE	0x130b9
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp-200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD2_CMD__SD2_CMD		0x170f9
 			MX6SLL_PAD_SD2_CLK__SD2_CLK		0x130f9
@@ -549,7 +549,7 @@ MX6SLL_PAD_REF_CLK_32K__GPIO3_IO22	0x17059
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD3_CMD__SD3_CMD		0x170a1
 			MX6SLL_PAD_SD3_CLK__SD3_CLK		0x130a1
@@ -561,7 +561,7 @@ MX6SLL_PAD_REF_CLK_32K__GPIO3_IO22	0x17059
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD3_CMD__SD3_CMD		0x170e9
 			MX6SLL_PAD_SD3_CLK__SD3_CLK		0x130f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index c7cfe0b70f04e..71511ba671428 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -200,7 +200,7 @@ MX6SLL_PAD_SD2_DATA3__SD2_DATA3		0x17059
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD2_CMD__SD2_CMD		0x170b9
 			MX6SLL_PAD_SD2_CLK__SD2_CLK		0x130b9
@@ -211,7 +211,7 @@ MX6SLL_PAD_SD2_DATA3__SD2_DATA3		0x170b9
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp-200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD2_CMD__SD2_CMD		0x170f9
 			MX6SLL_PAD_SD2_CLK__SD2_CLK		0x130f9
@@ -244,7 +244,7 @@ MX6SLL_PAD_SD3_DATA3__SD3_DATA3	0x11059
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD3_CMD__SD3_CMD	0x170b9
 			MX6SLL_PAD_SD3_CLK__SD3_CLK	0x170b9
@@ -255,7 +255,7 @@ MX6SLL_PAD_SD3_DATA3__SD3_DATA3	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX6SLL_PAD_SD3_CMD__SD3_CMD	0x170f9
 			MX6SLL_PAD_SD3_CLK__SD3_CLK	0x170f9
-- 
2.45.2



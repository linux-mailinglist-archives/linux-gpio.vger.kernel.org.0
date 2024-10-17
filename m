Return-Path: <linux-gpio+bounces-11570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E5E9A2F50
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62DD91F22B04
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74E71EE013;
	Thu, 17 Oct 2024 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="PFccxXT5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629681EE00E;
	Thu, 17 Oct 2024 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199593; cv=none; b=Y8vsHrafFRstYfb1t3Q2dhO0cQK/91+Fs35ca19VskUvN4UW0T9I834vPVi9VnneXir520T6pswZKw0BOlwBflSxejVnCEV+RYd7+SC84hd3dIwLMR0zVQfAn1ZSY9hR7vM2/wMlaI5fNJgBRTDViT8QLYfqmVK+jdSeVxnKYnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199593; c=relaxed/simple;
	bh=De7Ys9orl8VO6Q0P4ju4gcqjccDt5zNvZFW1wBcUTl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwVf9hKH62IbJJaZzfRrmdbL1am4tf7R2qPayOCRDqCACt2gpPDW2Np/4o8FoUhYX37YVGOJUuVvA283KYeFeBCHDfREcBOt9xYFYvFTDWjotLGm9X2Mv7d9fw2ITMpoqpBDcPZZno1xEzssc1La3Z2/+GNpDTSnF0Cnk1zVK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=PFccxXT5; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 909058902A;
	Thu, 17 Oct 2024 23:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199588;
	bh=pMrhoyFh++zwBnxbH6RQrJpajKY0DntvaneHVpZGTY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFccxXT5OO7DvSDN3in0eIzbzrDM/e4YEUqRlBcIJsyQosBjh8yiAjbHncaDFRCJw
	 BwIvcEPFVqnmLLLuoyoUWdoOtX6KNjz0SzgkDEst5SUqljO+B/UuRB7s/9R/i0D5tn
	 xg/U/d8z7fAOcJ3xXqlUVkneZscMyRUxAVb42H7/ZLv8eIQ0xlUKSkcjgkogtVreR9
	 K1VopvfOXAEQhi29Hee+sj/7nzZeVxebVNXdi27C3imWcSw7OZggGxTrdupnLd+E8O
	 UtJm5Ytzo7Dxi0Nlm/tlFd49AJIaVpJSk+t6t0zkFuzaCxm1waKv/ZGf7RFK/Ubewd
	 nxGbkG+7Sj3jg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 04/12] ARM: dts: imx51: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:21 +0200
Message-ID: <20241017211241.170861-4-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
References: <20241017211241.170861-1-marex@denx.de>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
V3: - Rename iomuxc@ node to pinctrl@ node
    - Fix up a couple of conversion omissions in CPU and .dtsi files
---
 arch/arm/boot/dts/nxp/imx/imx51-apf51.dts     |  56 ++-
 arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts  | 176 ++++---
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts   | 438 +++++++++---------
 .../nxp/imx/imx51-digi-connectcore-jsk.dts    |  78 ++--
 .../nxp/imx/imx51-digi-connectcore-som.dtsi   | 292 ++++++------
 .../dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi    |  68 ++-
 .../imx/imx51-eukrea-mbimxsd51-baseboard.dts  | 192 ++++----
 arch/arm/boot/dts/nxp/imx/imx51.dtsi          |   2 +-
 8 files changed, 644 insertions(+), 658 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-apf51.dts b/arch/arm/boot/dts/nxp/imx/imx51-apf51.dts
index ba28ffe06fe23..670e13136f1f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-apf51.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-apf51.dts
@@ -37,36 +37,34 @@ &fec {
 };
 
 &iomuxc {
-	imx51-apf51 {
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX51_PAD_DI_GP3__FEC_TX_ER		0x80000000
-				MX51_PAD_DI2_PIN4__FEC_CRS		0x80000000
-				MX51_PAD_DI2_PIN2__FEC_MDC		0x80000000
-				MX51_PAD_DI2_PIN3__FEC_MDIO		0x80000000
-				MX51_PAD_DI2_DISP_CLK__FEC_RDATA1	0x80000000
-				MX51_PAD_DI_GP4__FEC_RDATA2		0x80000000
-				MX51_PAD_DISP2_DAT0__FEC_RDATA3		0x80000000
-				MX51_PAD_DISP2_DAT1__FEC_RX_ER		0x80000000
-				MX51_PAD_DISP2_DAT6__FEC_TDATA1		0x80000000
-				MX51_PAD_DISP2_DAT7__FEC_TDATA2		0x80000000
-				MX51_PAD_DISP2_DAT8__FEC_TDATA3		0x80000000
-				MX51_PAD_DISP2_DAT9__FEC_TX_EN		0x80000000
-				MX51_PAD_DISP2_DAT10__FEC_COL		0x80000000
-				MX51_PAD_DISP2_DAT11__FEC_RX_CLK	0x80000000
-				MX51_PAD_DISP2_DAT12__FEC_RX_DV		0x80000000
-				MX51_PAD_DISP2_DAT13__FEC_TX_CLK	0x80000000
-				MX51_PAD_DISP2_DAT14__FEC_RDATA0	0x80000000
-				MX51_PAD_DISP2_DAT15__FEC_TDATA0	0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX51_PAD_DI_GP3__FEC_TX_ER		0x80000000
+			MX51_PAD_DI2_PIN4__FEC_CRS		0x80000000
+			MX51_PAD_DI2_PIN2__FEC_MDC		0x80000000
+			MX51_PAD_DI2_PIN3__FEC_MDIO		0x80000000
+			MX51_PAD_DI2_DISP_CLK__FEC_RDATA1	0x80000000
+			MX51_PAD_DI_GP4__FEC_RDATA2		0x80000000
+			MX51_PAD_DISP2_DAT0__FEC_RDATA3		0x80000000
+			MX51_PAD_DISP2_DAT1__FEC_RX_ER		0x80000000
+			MX51_PAD_DISP2_DAT6__FEC_TDATA1		0x80000000
+			MX51_PAD_DISP2_DAT7__FEC_TDATA2		0x80000000
+			MX51_PAD_DISP2_DAT8__FEC_TDATA3		0x80000000
+			MX51_PAD_DISP2_DAT9__FEC_TX_EN		0x80000000
+			MX51_PAD_DISP2_DAT10__FEC_COL		0x80000000
+			MX51_PAD_DISP2_DAT11__FEC_RX_CLK	0x80000000
+			MX51_PAD_DISP2_DAT12__FEC_RX_DV		0x80000000
+			MX51_PAD_DISP2_DAT13__FEC_TX_CLK	0x80000000
+			MX51_PAD_DISP2_DAT14__FEC_RDATA0	0x80000000
+			MX51_PAD_DISP2_DAT15__FEC_TDATA0	0x80000000
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX51_PAD_UART3_RXD__UART3_RXD		0x1c5
-				MX51_PAD_UART3_TXD__UART3_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX51_PAD_UART3_RXD__UART3_RXD		0x1c5
+			MX51_PAD_UART3_TXD__UART3_TXD		0x1c5
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts b/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts
index de6b7607510af..6ebd80e30683a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts
@@ -113,102 +113,100 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx51-apf51dev {
-		pinctrl_backlight: backlightgrp {
-			fsl,pins = <
-				MX51_PAD_DI1_D1_CS__GPIO3_4 0x1F5
-			>;
-		};
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX51_PAD_DI1_D1_CS__GPIO3_4 0x1F5
+		>;
+	};
 
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX51_PAD_EIM_EB2__GPIO2_22   0x0C5
-				MX51_PAD_EIM_EB3__GPIO2_23   0x0C5
-				MX51_PAD_EIM_CS4__GPIO2_29   0x100
-				MX51_PAD_NANDF_D13__GPIO3_27 0x0C5
-				MX51_PAD_NANDF_D12__GPIO3_28 0x0C5
-				MX51_PAD_CSPI1_SS0__GPIO4_24 0x0C5
-				MX51_PAD_CSPI1_SS1__GPIO4_25 0x0C5
-				MX51_PAD_GPIO1_2__GPIO1_2    0x0C5
-				MX51_PAD_GPIO1_3__GPIO1_3    0x0C5
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX51_PAD_EIM_EB2__GPIO2_22   0x0C5
+			MX51_PAD_EIM_EB3__GPIO2_23   0x0C5
+			MX51_PAD_EIM_CS4__GPIO2_29   0x100
+			MX51_PAD_NANDF_D13__GPIO3_27 0x0C5
+			MX51_PAD_NANDF_D12__GPIO3_28 0x0C5
+			MX51_PAD_CSPI1_SS0__GPIO4_24 0x0C5
+			MX51_PAD_CSPI1_SS1__GPIO4_25 0x0C5
+			MX51_PAD_GPIO1_2__GPIO1_2    0x0C5
+			MX51_PAD_GPIO1_3__GPIO1_3    0x0C5
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
-				MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
-				MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
+			MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
+			MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
+		>;
+	};
 
-		pinctrl_ecspi2: ecspi2grp {
-			fsl,pins = <
-				MX51_PAD_NANDF_RB3__ECSPI2_MISO		0x185
-				MX51_PAD_NANDF_D15__ECSPI2_MOSI		0x185
-				MX51_PAD_NANDF_RB2__ECSPI2_SCLK		0x185
-			>;
-		};
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX51_PAD_NANDF_RB3__ECSPI2_MISO		0x185
+			MX51_PAD_NANDF_D15__ECSPI2_MOSI		0x185
+			MX51_PAD_NANDF_RB2__ECSPI2_SCLK		0x185
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
-				MX51_PAD_SD1_CLK__SD1_CLK		0x20d5
-				MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d5
-				MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d5
-				MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d5
-				MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
+			MX51_PAD_SD1_CLK__SD1_CLK		0x20d5
+			MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d5
+			MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d5
+			MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d5
+			MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d5
+		>;
+	};
 
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX51_PAD_SD2_CMD__SD2_CMD		0x400020d5
-				MX51_PAD_SD2_CLK__SD2_CLK		0x20d5
-				MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d5
-				MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d5
-				MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d5
-				MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d5
-			>;
-		};
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX51_PAD_SD2_CMD__SD2_CMD		0x400020d5
+			MX51_PAD_SD2_CLK__SD2_CLK		0x20d5
+			MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d5
+			MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d5
+			MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d5
+			MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d5
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX51_PAD_EIM_D27__I2C2_SCL		0x400001ed
-				MX51_PAD_EIM_D24__I2C2_SDA		0x400001ed
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX51_PAD_EIM_D27__I2C2_SCL		0x400001ed
+			MX51_PAD_EIM_D24__I2C2_SDA		0x400001ed
+		>;
+	};
 
-		pinctrl_ipu_disp1: ipudisp1grp {
-			fsl,pins = <
-				MX51_PAD_DISP1_DAT0__DISP1_DAT0		0x5
-				MX51_PAD_DISP1_DAT1__DISP1_DAT1		0x5
-				MX51_PAD_DISP1_DAT2__DISP1_DAT2		0x5
-				MX51_PAD_DISP1_DAT3__DISP1_DAT3		0x5
-				MX51_PAD_DISP1_DAT4__DISP1_DAT4		0x5
-				MX51_PAD_DISP1_DAT5__DISP1_DAT5		0x5
-				MX51_PAD_DISP1_DAT6__DISP1_DAT6		0x5
-				MX51_PAD_DISP1_DAT7__DISP1_DAT7		0x5
-				MX51_PAD_DISP1_DAT8__DISP1_DAT8		0x5
-				MX51_PAD_DISP1_DAT9__DISP1_DAT9		0x5
-				MX51_PAD_DISP1_DAT10__DISP1_DAT10	0x5
-				MX51_PAD_DISP1_DAT11__DISP1_DAT11	0x5
-				MX51_PAD_DISP1_DAT12__DISP1_DAT12	0x5
-				MX51_PAD_DISP1_DAT13__DISP1_DAT13	0x5
-				MX51_PAD_DISP1_DAT14__DISP1_DAT14	0x5
-				MX51_PAD_DISP1_DAT15__DISP1_DAT15	0x5
-				MX51_PAD_DISP1_DAT16__DISP1_DAT16	0x5
-				MX51_PAD_DISP1_DAT17__DISP1_DAT17	0x5
-				MX51_PAD_DISP1_DAT18__DISP1_DAT18	0x5
-				MX51_PAD_DISP1_DAT19__DISP1_DAT19	0x5
-				MX51_PAD_DISP1_DAT20__DISP1_DAT20	0x5
-				MX51_PAD_DISP1_DAT21__DISP1_DAT21	0x5
-				MX51_PAD_DISP1_DAT22__DISP1_DAT22	0x5
-				MX51_PAD_DISP1_DAT23__DISP1_DAT23	0x5
-				MX51_PAD_DI1_PIN2__DI1_PIN2		0x5
-				MX51_PAD_DI1_PIN3__DI1_PIN3		0x5
-			>;
-		};
+	pinctrl_ipu_disp1: ipudisp1grp {
+		fsl,pins = <
+			MX51_PAD_DISP1_DAT0__DISP1_DAT0		0x5
+			MX51_PAD_DISP1_DAT1__DISP1_DAT1		0x5
+			MX51_PAD_DISP1_DAT2__DISP1_DAT2		0x5
+			MX51_PAD_DISP1_DAT3__DISP1_DAT3		0x5
+			MX51_PAD_DISP1_DAT4__DISP1_DAT4		0x5
+			MX51_PAD_DISP1_DAT5__DISP1_DAT5		0x5
+			MX51_PAD_DISP1_DAT6__DISP1_DAT6		0x5
+			MX51_PAD_DISP1_DAT7__DISP1_DAT7		0x5
+			MX51_PAD_DISP1_DAT8__DISP1_DAT8		0x5
+			MX51_PAD_DISP1_DAT9__DISP1_DAT9		0x5
+			MX51_PAD_DISP1_DAT10__DISP1_DAT10	0x5
+			MX51_PAD_DISP1_DAT11__DISP1_DAT11	0x5
+			MX51_PAD_DISP1_DAT12__DISP1_DAT12	0x5
+			MX51_PAD_DISP1_DAT13__DISP1_DAT13	0x5
+			MX51_PAD_DISP1_DAT14__DISP1_DAT14	0x5
+			MX51_PAD_DISP1_DAT15__DISP1_DAT15	0x5
+			MX51_PAD_DISP1_DAT16__DISP1_DAT16	0x5
+			MX51_PAD_DISP1_DAT17__DISP1_DAT17	0x5
+			MX51_PAD_DISP1_DAT18__DISP1_DAT18	0x5
+			MX51_PAD_DISP1_DAT19__DISP1_DAT19	0x5
+			MX51_PAD_DISP1_DAT20__DISP1_DAT20	0x5
+			MX51_PAD_DISP1_DAT21__DISP1_DAT21	0x5
+			MX51_PAD_DISP1_DAT22__DISP1_DAT22	0x5
+			MX51_PAD_DISP1_DAT23__DISP1_DAT23	0x5
+			MX51_PAD_DI1_PIN2__DI1_PIN2		0x5
+			MX51_PAD_DI1_PIN3__DI1_PIN3		0x5
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
index f4a47e8348b23..1b6ec55f90683 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
@@ -474,246 +474,244 @@ &usbotg {
 };
 
 &iomuxc {
-	imx51-babbage {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX51_PAD_AUD3_BB_TXD__AUD3_TXD		0x80000000
-				MX51_PAD_AUD3_BB_RXD__AUD3_RXD		0x80000000
-				MX51_PAD_AUD3_BB_CK__AUD3_TXC		0x80000000
-				MX51_PAD_AUD3_BB_FS__AUD3_TXFS		0x80000000
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX51_PAD_AUD3_BB_TXD__AUD3_TXD		0x80000000
+			MX51_PAD_AUD3_BB_RXD__AUD3_RXD		0x80000000
+			MX51_PAD_AUD3_BB_CK__AUD3_TXC		0x80000000
+			MX51_PAD_AUD3_BB_FS__AUD3_TXFS		0x80000000
+		>;
+	};
 
-		pinctrl_clk26mhz_audio: clk26mhzaudiocgrp {
-			fsl,pins = <
-				MX51_PAD_CSPI1_RDY__GPIO4_26		0x85
-			>;
-		};
+	pinctrl_clk26mhz_audio: clk26mhzaudiocgrp {
+		fsl,pins = <
+			MX51_PAD_CSPI1_RDY__GPIO4_26		0x85
+		>;
+	};
 
-		pinctrl_clk26mhz_osc: clk26mhzoscgrp {
-			fsl,pins = <
-				MX51_PAD_DI1_PIN12__GPIO3_1		0x85
-			>;
-		};
+	pinctrl_clk26mhz_osc: clk26mhzoscgrp {
+		fsl,pins = <
+			MX51_PAD_DI1_PIN12__GPIO3_1		0x85
+		>;
+	};
 
-		pinctrl_clk26mhz_usb: clk26mhzusbgrp {
-			fsl,pins = <
-				MX51_PAD_EIM_D17__GPIO2_1		0x85
-			>;
-		};
+	pinctrl_clk26mhz_usb: clk26mhzusbgrp {
+		fsl,pins = <
+			MX51_PAD_EIM_D17__GPIO2_1		0x85
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
-				MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
-				MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
-				MX51_PAD_CSPI1_SS0__GPIO4_24		0x85 /* CS0 */
-				MX51_PAD_CSPI1_SS1__GPIO4_25		0x85 /* CS1 */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
+			MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
+			MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
+			MX51_PAD_CSPI1_SS0__GPIO4_24		0x85 /* CS0 */
+			MX51_PAD_CSPI1_SS1__GPIO4_25		0x85 /* CS1 */
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
-				MX51_PAD_SD1_CLK__SD1_CLK		0x20d5
-				MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d5
-				MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d5
-				MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d5
-				MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d5
-				MX51_PAD_GPIO1_0__GPIO1_0		0x100
-				MX51_PAD_GPIO1_1__GPIO1_1		0x100
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
+			MX51_PAD_SD1_CLK__SD1_CLK		0x20d5
+			MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d5
+			MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d5
+			MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d5
+			MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d5
+			MX51_PAD_GPIO1_0__GPIO1_0		0x100
+			MX51_PAD_GPIO1_1__GPIO1_1		0x100
+		>;
+	};
 
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX51_PAD_SD2_CMD__SD2_CMD		0x400020d5
-				MX51_PAD_SD2_CLK__SD2_CLK		0x20d5
-				MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d5
-				MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d5
-				MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d5
-				MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d5
-				MX51_PAD_GPIO1_5__GPIO1_5		0x100 /* WP */
-				MX51_PAD_GPIO1_6__GPIO1_6		0x100 /* CD */
-			>;
-		};
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX51_PAD_SD2_CMD__SD2_CMD		0x400020d5
+			MX51_PAD_SD2_CLK__SD2_CLK		0x20d5
+			MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d5
+			MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d5
+			MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d5
+			MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d5
+			MX51_PAD_GPIO1_5__GPIO1_5		0x100 /* WP */
+			MX51_PAD_GPIO1_6__GPIO1_6		0x100 /* CD */
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX51_PAD_EIM_EB2__FEC_MDIO		0x000001f5
-				MX51_PAD_EIM_EB3__FEC_RDATA1		0x00000085
-				MX51_PAD_EIM_CS2__FEC_RDATA2		0x00000085
-				MX51_PAD_EIM_CS3__FEC_RDATA3		0x00000085
-				MX51_PAD_EIM_CS4__FEC_RX_ER		0x00000180
-				MX51_PAD_EIM_CS5__FEC_CRS		0x00000180
-				MX51_PAD_NANDF_RB2__FEC_COL		0x00000180
-				MX51_PAD_NANDF_RB3__FEC_RX_CLK		0x00000180
-				MX51_PAD_NANDF_D9__FEC_RDATA0		0x00002180
-				MX51_PAD_NANDF_D8__FEC_TDATA0		0x00002004
-				MX51_PAD_NANDF_CS2__FEC_TX_ER		0x00002004
-				MX51_PAD_NANDF_CS3__FEC_MDC		0x00002004
-				MX51_PAD_NANDF_CS4__FEC_TDATA1		0x00002004
-				MX51_PAD_NANDF_CS5__FEC_TDATA2		0x00002004
-				MX51_PAD_NANDF_CS6__FEC_TDATA3		0x00002004
-				MX51_PAD_NANDF_CS7__FEC_TX_EN		0x00002004
-				MX51_PAD_NANDF_RDY_INT__FEC_TX_CLK	0x00002180
-				MX51_PAD_NANDF_D11__FEC_RX_DV		0x000020a4
-				MX51_PAD_EIM_A20__GPIO2_14		0x00000085 /* Phy Reset */
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX51_PAD_EIM_EB2__FEC_MDIO		0x000001f5
+			MX51_PAD_EIM_EB3__FEC_RDATA1		0x00000085
+			MX51_PAD_EIM_CS2__FEC_RDATA2		0x00000085
+			MX51_PAD_EIM_CS3__FEC_RDATA3		0x00000085
+			MX51_PAD_EIM_CS4__FEC_RX_ER		0x00000180
+			MX51_PAD_EIM_CS5__FEC_CRS		0x00000180
+			MX51_PAD_NANDF_RB2__FEC_COL		0x00000180
+			MX51_PAD_NANDF_RB3__FEC_RX_CLK		0x00000180
+			MX51_PAD_NANDF_D9__FEC_RDATA0		0x00002180
+			MX51_PAD_NANDF_D8__FEC_TDATA0		0x00002004
+			MX51_PAD_NANDF_CS2__FEC_TX_ER		0x00002004
+			MX51_PAD_NANDF_CS3__FEC_MDC		0x00002004
+			MX51_PAD_NANDF_CS4__FEC_TDATA1		0x00002004
+			MX51_PAD_NANDF_CS5__FEC_TDATA2		0x00002004
+			MX51_PAD_NANDF_CS6__FEC_TDATA3		0x00002004
+			MX51_PAD_NANDF_CS7__FEC_TX_EN		0x00002004
+			MX51_PAD_NANDF_RDY_INT__FEC_TX_CLK	0x00002180
+			MX51_PAD_NANDF_D11__FEC_RX_DV		0x000020a4
+			MX51_PAD_EIM_A20__GPIO2_14		0x00000085 /* Phy Reset */
+		>;
+	};
 
-		pinctrl_gpio_keys: gpiokeysgrp {
-			fsl,pins = <
-				MX51_PAD_EIM_A27__GPIO2_21		0x5
-			>;
-		};
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <
+			MX51_PAD_EIM_A27__GPIO2_21		0x5
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <
-				MX51_PAD_EIM_D22__GPIO2_6		0x80000000
-			>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX51_PAD_EIM_D22__GPIO2_6		0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX51_PAD_EIM_D19__I2C1_SCL		0x400001ed
-				MX51_PAD_EIM_D16__I2C1_SDA		0x400001ed
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX51_PAD_EIM_D19__I2C1_SCL		0x400001ed
+			MX51_PAD_EIM_D16__I2C1_SDA		0x400001ed
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX51_PAD_KEY_COL4__I2C2_SCL		0x400001ed
-				MX51_PAD_KEY_COL5__I2C2_SDA		0x400001ed
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX51_PAD_KEY_COL4__I2C2_SCL		0x400001ed
+			MX51_PAD_KEY_COL5__I2C2_SDA		0x400001ed
+		>;
+	};
 
-		pinctrl_ipu_disp1: ipudisp1grp {
-			fsl,pins = <
-				MX51_PAD_DISP1_DAT0__DISP1_DAT0		0x5
-				MX51_PAD_DISP1_DAT1__DISP1_DAT1		0x5
-				MX51_PAD_DISP1_DAT2__DISP1_DAT2		0x5
-				MX51_PAD_DISP1_DAT3__DISP1_DAT3		0x5
-				MX51_PAD_DISP1_DAT4__DISP1_DAT4		0x5
-				MX51_PAD_DISP1_DAT5__DISP1_DAT5		0x5
-				MX51_PAD_DISP1_DAT6__DISP1_DAT6		0x5
-				MX51_PAD_DISP1_DAT7__DISP1_DAT7		0x5
-				MX51_PAD_DISP1_DAT8__DISP1_DAT8		0x5
-				MX51_PAD_DISP1_DAT9__DISP1_DAT9		0x5
-				MX51_PAD_DISP1_DAT10__DISP1_DAT10	0x5
-				MX51_PAD_DISP1_DAT11__DISP1_DAT11	0x5
-				MX51_PAD_DISP1_DAT12__DISP1_DAT12	0x5
-				MX51_PAD_DISP1_DAT13__DISP1_DAT13	0x5
-				MX51_PAD_DISP1_DAT14__DISP1_DAT14	0x5
-				MX51_PAD_DISP1_DAT15__DISP1_DAT15	0x5
-				MX51_PAD_DISP1_DAT16__DISP1_DAT16	0x5
-				MX51_PAD_DISP1_DAT17__DISP1_DAT17	0x5
-				MX51_PAD_DISP1_DAT18__DISP1_DAT18	0x5
-				MX51_PAD_DISP1_DAT19__DISP1_DAT19	0x5
-				MX51_PAD_DISP1_DAT20__DISP1_DAT20	0x5
-				MX51_PAD_DISP1_DAT21__DISP1_DAT21	0x5
-				MX51_PAD_DISP1_DAT22__DISP1_DAT22	0x5
-				MX51_PAD_DISP1_DAT23__DISP1_DAT23	0x5
-				MX51_PAD_DI1_PIN2__DI1_PIN2		0x5
-				MX51_PAD_DI1_PIN3__DI1_PIN3		0x5
-			>;
-		};
+	pinctrl_ipu_disp1: ipudisp1grp {
+		fsl,pins = <
+			MX51_PAD_DISP1_DAT0__DISP1_DAT0		0x5
+			MX51_PAD_DISP1_DAT1__DISP1_DAT1		0x5
+			MX51_PAD_DISP1_DAT2__DISP1_DAT2		0x5
+			MX51_PAD_DISP1_DAT3__DISP1_DAT3		0x5
+			MX51_PAD_DISP1_DAT4__DISP1_DAT4		0x5
+			MX51_PAD_DISP1_DAT5__DISP1_DAT5		0x5
+			MX51_PAD_DISP1_DAT6__DISP1_DAT6		0x5
+			MX51_PAD_DISP1_DAT7__DISP1_DAT7		0x5
+			MX51_PAD_DISP1_DAT8__DISP1_DAT8		0x5
+			MX51_PAD_DISP1_DAT9__DISP1_DAT9		0x5
+			MX51_PAD_DISP1_DAT10__DISP1_DAT10	0x5
+			MX51_PAD_DISP1_DAT11__DISP1_DAT11	0x5
+			MX51_PAD_DISP1_DAT12__DISP1_DAT12	0x5
+			MX51_PAD_DISP1_DAT13__DISP1_DAT13	0x5
+			MX51_PAD_DISP1_DAT14__DISP1_DAT14	0x5
+			MX51_PAD_DISP1_DAT15__DISP1_DAT15	0x5
+			MX51_PAD_DISP1_DAT16__DISP1_DAT16	0x5
+			MX51_PAD_DISP1_DAT17__DISP1_DAT17	0x5
+			MX51_PAD_DISP1_DAT18__DISP1_DAT18	0x5
+			MX51_PAD_DISP1_DAT19__DISP1_DAT19	0x5
+			MX51_PAD_DISP1_DAT20__DISP1_DAT20	0x5
+			MX51_PAD_DISP1_DAT21__DISP1_DAT21	0x5
+			MX51_PAD_DISP1_DAT22__DISP1_DAT22	0x5
+			MX51_PAD_DISP1_DAT23__DISP1_DAT23	0x5
+			MX51_PAD_DI1_PIN2__DI1_PIN2		0x5
+			MX51_PAD_DI1_PIN3__DI1_PIN3		0x5
+		>;
+	};
 
-		pinctrl_ipu_disp2: ipudisp2grp {
-			fsl,pins = <
-				MX51_PAD_DISP2_DAT0__DISP2_DAT0		0x5
-				MX51_PAD_DISP2_DAT1__DISP2_DAT1		0x5
-				MX51_PAD_DISP2_DAT2__DISP2_DAT2		0x5
-				MX51_PAD_DISP2_DAT3__DISP2_DAT3		0x5
-				MX51_PAD_DISP2_DAT4__DISP2_DAT4		0x5
-				MX51_PAD_DISP2_DAT5__DISP2_DAT5		0x5
-				MX51_PAD_DISP2_DAT6__DISP2_DAT6		0x5
-				MX51_PAD_DISP2_DAT7__DISP2_DAT7		0x5
-				MX51_PAD_DISP2_DAT8__DISP2_DAT8		0x5
-				MX51_PAD_DISP2_DAT9__DISP2_DAT9		0x5
-				MX51_PAD_DISP2_DAT10__DISP2_DAT10	0x5
-				MX51_PAD_DISP2_DAT11__DISP2_DAT11	0x5
-				MX51_PAD_DISP2_DAT12__DISP2_DAT12	0x5
-				MX51_PAD_DISP2_DAT13__DISP2_DAT13	0x5
-				MX51_PAD_DISP2_DAT14__DISP2_DAT14	0x5
-				MX51_PAD_DISP2_DAT15__DISP2_DAT15	0x5
-				MX51_PAD_DI2_PIN2__DI2_PIN2		0x5
-				MX51_PAD_DI2_PIN3__DI2_PIN3		0x5
-				MX51_PAD_DI2_DISP_CLK__DI2_DISP_CLK	0x5
-				MX51_PAD_DI_GP4__DI2_PIN15		0x5
-			>;
-		};
+	pinctrl_ipu_disp2: ipudisp2grp {
+		fsl,pins = <
+			MX51_PAD_DISP2_DAT0__DISP2_DAT0		0x5
+			MX51_PAD_DISP2_DAT1__DISP2_DAT1		0x5
+			MX51_PAD_DISP2_DAT2__DISP2_DAT2		0x5
+			MX51_PAD_DISP2_DAT3__DISP2_DAT3		0x5
+			MX51_PAD_DISP2_DAT4__DISP2_DAT4		0x5
+			MX51_PAD_DISP2_DAT5__DISP2_DAT5		0x5
+			MX51_PAD_DISP2_DAT6__DISP2_DAT6		0x5
+			MX51_PAD_DISP2_DAT7__DISP2_DAT7		0x5
+			MX51_PAD_DISP2_DAT8__DISP2_DAT8		0x5
+			MX51_PAD_DISP2_DAT9__DISP2_DAT9		0x5
+			MX51_PAD_DISP2_DAT10__DISP2_DAT10	0x5
+			MX51_PAD_DISP2_DAT11__DISP2_DAT11	0x5
+			MX51_PAD_DISP2_DAT12__DISP2_DAT12	0x5
+			MX51_PAD_DISP2_DAT13__DISP2_DAT13	0x5
+			MX51_PAD_DISP2_DAT14__DISP2_DAT14	0x5
+			MX51_PAD_DISP2_DAT15__DISP2_DAT15	0x5
+			MX51_PAD_DI2_PIN2__DI2_PIN2		0x5
+			MX51_PAD_DI2_PIN3__DI2_PIN3		0x5
+			MX51_PAD_DI2_DISP_CLK__DI2_DISP_CLK	0x5
+			MX51_PAD_DI_GP4__DI2_PIN15		0x5
+		>;
+	};
 
-		pinctrl_kpp: kppgrp {
-			fsl,pins = <
-				MX51_PAD_KEY_ROW0__KEY_ROW0		0xe0
-				MX51_PAD_KEY_ROW1__KEY_ROW1		0xe0
-				MX51_PAD_KEY_ROW2__KEY_ROW2		0xe0
-				MX51_PAD_KEY_ROW3__KEY_ROW3		0xe0
-				MX51_PAD_KEY_COL0__KEY_COL0		0xe8
-				MX51_PAD_KEY_COL1__KEY_COL1		0xe8
-				MX51_PAD_KEY_COL2__KEY_COL2		0xe8
-				MX51_PAD_KEY_COL3__KEY_COL3		0xe8
-			>;
-		};
+	pinctrl_kpp: kppgrp {
+		fsl,pins = <
+			MX51_PAD_KEY_ROW0__KEY_ROW0		0xe0
+			MX51_PAD_KEY_ROW1__KEY_ROW1		0xe0
+			MX51_PAD_KEY_ROW2__KEY_ROW2		0xe0
+			MX51_PAD_KEY_ROW3__KEY_ROW3		0xe0
+			MX51_PAD_KEY_COL0__KEY_COL0		0xe8
+			MX51_PAD_KEY_COL1__KEY_COL1		0xe8
+			MX51_PAD_KEY_COL2__KEY_COL2		0xe8
+			MX51_PAD_KEY_COL3__KEY_COL3		0xe8
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_8__GPIO1_8		0xe5 /* IRQ */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_8__GPIO1_8		0xe5 /* IRQ */
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
-				MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
-				MX51_PAD_UART1_RTS__UART1_RTS		0x1c5
-				MX51_PAD_UART1_CTS__UART1_CTS		0x1c5
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
+			MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
+			MX51_PAD_UART1_RTS__UART1_RTS		0x1c5
+			MX51_PAD_UART1_CTS__UART1_CTS		0x1c5
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX51_PAD_UART2_RXD__UART2_RXD		0x1c5
-				MX51_PAD_UART2_TXD__UART2_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX51_PAD_UART2_RXD__UART2_RXD		0x1c5
+			MX51_PAD_UART2_TXD__UART2_TXD		0x1c5
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX51_PAD_EIM_D25__UART3_RXD		0x1c5
-				MX51_PAD_EIM_D26__UART3_TXD		0x1c5
-				MX51_PAD_EIM_D27__UART3_RTS		0x1c5
-				MX51_PAD_EIM_D24__UART3_CTS		0x1c5
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX51_PAD_EIM_D25__UART3_RXD		0x1c5
+			MX51_PAD_EIM_D26__UART3_TXD		0x1c5
+			MX51_PAD_EIM_D27__UART3_RTS		0x1c5
+			MX51_PAD_EIM_D24__UART3_CTS		0x1c5
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				MX51_PAD_USBH1_CLK__USBH1_CLK		0x80000000
-				MX51_PAD_USBH1_DIR__USBH1_DIR		0x80000000
-				MX51_PAD_USBH1_NXT__USBH1_NXT		0x80000000
-				MX51_PAD_USBH1_DATA0__USBH1_DATA0	0x80000000
-				MX51_PAD_USBH1_DATA1__USBH1_DATA1	0x80000000
-				MX51_PAD_USBH1_DATA2__USBH1_DATA2	0x80000000
-				MX51_PAD_USBH1_DATA3__USBH1_DATA3	0x80000000
-				MX51_PAD_USBH1_DATA4__USBH1_DATA4	0x80000000
-				MX51_PAD_USBH1_DATA5__USBH1_DATA5	0x80000000
-				MX51_PAD_USBH1_DATA6__USBH1_DATA6	0x80000000
-				MX51_PAD_USBH1_DATA7__USBH1_DATA7	0x80000000
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			MX51_PAD_USBH1_CLK__USBH1_CLK		0x80000000
+			MX51_PAD_USBH1_DIR__USBH1_DIR		0x80000000
+			MX51_PAD_USBH1_NXT__USBH1_NXT		0x80000000
+			MX51_PAD_USBH1_DATA0__USBH1_DATA0	0x80000000
+			MX51_PAD_USBH1_DATA1__USBH1_DATA1	0x80000000
+			MX51_PAD_USBH1_DATA2__USBH1_DATA2	0x80000000
+			MX51_PAD_USBH1_DATA3__USBH1_DATA3	0x80000000
+			MX51_PAD_USBH1_DATA4__USBH1_DATA4	0x80000000
+			MX51_PAD_USBH1_DATA5__USBH1_DATA5	0x80000000
+			MX51_PAD_USBH1_DATA6__USBH1_DATA6	0x80000000
+			MX51_PAD_USBH1_DATA7__USBH1_DATA7	0x80000000
+		>;
+	};
 
-		pinctrl_usbh1reg: usbh1reggrp {
-			fsl,pins = <
-				MX51_PAD_EIM_D21__GPIO2_5		0x85
-			>;
-		};
+	pinctrl_usbh1reg: usbh1reggrp {
+		fsl,pins = <
+			MX51_PAD_EIM_D21__GPIO2_5		0x85
+		>;
+	};
 
-		pinctrl_usbotgreg: usbotgreggrp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_7__GPIO1_7		0x85
-			>;
-		};
+	pinctrl_usbotgreg: usbotgreggrp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_7__GPIO1_7		0x85
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-jsk.dts b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-jsk.dts
index 10cae7c3a8791..9750b5f933301 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-jsk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-jsk.dts
@@ -78,49 +78,47 @@ &usbh1 {
 };
 
 &iomuxc {
-	imx51-digi-connectcore-jsk {
-		pinctrl_owire: owiregrp {
-			fsl,pins = <
-				MX51_PAD_OWIRE_LINE__OWIRE_LINE		0x40000000
-			>;
-		};
+	pinctrl_owire: owiregrp {
+		fsl,pins = <
+			MX51_PAD_OWIRE_LINE__OWIRE_LINE		0x40000000
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
-				MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
+			MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX51_PAD_UART2_RXD__UART2_RXD		0x1c5
-				MX51_PAD_UART2_TXD__UART2_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX51_PAD_UART2_RXD__UART2_RXD		0x1c5
+			MX51_PAD_UART2_TXD__UART2_TXD		0x1c5
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX51_PAD_UART3_RXD__UART3_RXD		0x1c5
-				MX51_PAD_UART3_TXD__UART3_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX51_PAD_UART3_RXD__UART3_RXD		0x1c5
+			MX51_PAD_UART3_TXD__UART3_TXD		0x1c5
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				MX51_PAD_USBH1_DATA0__USBH1_DATA0	0x1e5
-				MX51_PAD_USBH1_DATA1__USBH1_DATA1	0x1e5
-				MX51_PAD_USBH1_DATA2__USBH1_DATA2	0x1e5
-				MX51_PAD_USBH1_DATA3__USBH1_DATA3	0x1e5
-				MX51_PAD_USBH1_DATA4__USBH1_DATA4	0x1e5
-				MX51_PAD_USBH1_DATA5__USBH1_DATA5	0x1e5
-				MX51_PAD_USBH1_DATA6__USBH1_DATA6	0x1e5
-				MX51_PAD_USBH1_DATA7__USBH1_DATA7	0x1e5
-				MX51_PAD_USBH1_CLK__USBH1_CLK		0x1e5
-				MX51_PAD_USBH1_DIR__USBH1_DIR		0x1e5
-				MX51_PAD_USBH1_NXT__USBH1_NXT		0x1e5
-				MX51_PAD_USBH1_STP__USBH1_STP		0x1e5
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			MX51_PAD_USBH1_DATA0__USBH1_DATA0	0x1e5
+			MX51_PAD_USBH1_DATA1__USBH1_DATA1	0x1e5
+			MX51_PAD_USBH1_DATA2__USBH1_DATA2	0x1e5
+			MX51_PAD_USBH1_DATA3__USBH1_DATA3	0x1e5
+			MX51_PAD_USBH1_DATA4__USBH1_DATA4	0x1e5
+			MX51_PAD_USBH1_DATA5__USBH1_DATA5	0x1e5
+			MX51_PAD_USBH1_DATA6__USBH1_DATA6	0x1e5
+			MX51_PAD_USBH1_DATA7__USBH1_DATA7	0x1e5
+			MX51_PAD_USBH1_CLK__USBH1_CLK		0x1e5
+			MX51_PAD_USBH1_DIR__USBH1_DIR		0x1e5
+			MX51_PAD_USBH1_NXT__USBH1_NXT		0x1e5
+			MX51_PAD_USBH1_STP__USBH1_STP		0x1e5
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
index f0809a16a2cea..dc72a2d14960f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
@@ -215,162 +215,160 @@ lan9221: ethernet@5,0 {
 };
 
 &iomuxc {
-	imx51-digi-connectcore-som {
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
-				MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
-				MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
-				MX51_PAD_CSPI1_SS0__GPIO4_24		0x85 /* CS0 */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
+			MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
+			MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
+			MX51_PAD_CSPI1_SS0__GPIO4_24		0x85 /* CS0 */
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX51_PAD_SD1_CLK__SD1_CLK		0x400021d5
-				MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
-				MX51_PAD_SD1_DATA0__SD1_DATA0		0x400020d5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX51_PAD_SD1_CLK__SD1_CLK		0x400021d5
+			MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
+			MX51_PAD_SD1_DATA0__SD1_DATA0		0x400020d5
+		>;
+	};
 
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX51_PAD_SD2_CMD__SD2_CMD		0x400020d5
-				MX51_PAD_SD2_CLK__SD2_CLK		0x20d5
-				MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d5
-				MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d5
-				MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d5
-				MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d5
-			>;
-		};
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX51_PAD_SD2_CMD__SD2_CMD		0x400020d5
+			MX51_PAD_SD2_CLK__SD2_CLK		0x20d5
+			MX51_PAD_SD2_DATA0__SD2_DATA0		0x20d5
+			MX51_PAD_SD2_DATA1__SD2_DATA1		0x20d5
+			MX51_PAD_SD2_DATA2__SD2_DATA2		0x20d5
+			MX51_PAD_SD2_DATA3__SD2_DATA3		0x20d5
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX51_PAD_DI_GP3__FEC_TX_ER		0x80000000
-				MX51_PAD_DI2_PIN4__FEC_CRS		0x80000000
-				MX51_PAD_DI2_PIN2__FEC_MDC		0x80000000
-				MX51_PAD_DI2_PIN3__FEC_MDIO		0x80000000
-				MX51_PAD_DI2_DISP_CLK__FEC_RDATA1	0x80000000
-				MX51_PAD_DI_GP4__FEC_RDATA2		0x80000000
-				MX51_PAD_DISP2_DAT0__FEC_RDATA3		0x80000000
-				MX51_PAD_DISP2_DAT1__FEC_RX_ER		0x80000000
-				MX51_PAD_DISP2_DAT6__FEC_TDATA1		0x80000000
-				MX51_PAD_DISP2_DAT7__FEC_TDATA2		0x80000000
-				MX51_PAD_DISP2_DAT8__FEC_TDATA3		0x80000000
-				MX51_PAD_DISP2_DAT9__FEC_TX_EN		0x80000000
-				MX51_PAD_DISP2_DAT10__FEC_COL		0x80000000
-				MX51_PAD_DISP2_DAT11__FEC_RX_CLK	0x80000000
-				MX51_PAD_DISP2_DAT12__FEC_RX_DV		0x80000000
-				MX51_PAD_DISP2_DAT13__FEC_TX_CLK	0x80000000
-				MX51_PAD_DISP2_DAT14__FEC_RDATA0	0x80000000
-				MX51_PAD_DISP2_DAT15__FEC_TDATA0	0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX51_PAD_DI_GP3__FEC_TX_ER		0x80000000
+			MX51_PAD_DI2_PIN4__FEC_CRS		0x80000000
+			MX51_PAD_DI2_PIN2__FEC_MDC		0x80000000
+			MX51_PAD_DI2_PIN3__FEC_MDIO		0x80000000
+			MX51_PAD_DI2_DISP_CLK__FEC_RDATA1	0x80000000
+			MX51_PAD_DI_GP4__FEC_RDATA2		0x80000000
+			MX51_PAD_DISP2_DAT0__FEC_RDATA3		0x80000000
+			MX51_PAD_DISP2_DAT1__FEC_RX_ER		0x80000000
+			MX51_PAD_DISP2_DAT6__FEC_TDATA1		0x80000000
+			MX51_PAD_DISP2_DAT7__FEC_TDATA2		0x80000000
+			MX51_PAD_DISP2_DAT8__FEC_TDATA3		0x80000000
+			MX51_PAD_DISP2_DAT9__FEC_TX_EN		0x80000000
+			MX51_PAD_DISP2_DAT10__FEC_COL		0x80000000
+			MX51_PAD_DISP2_DAT11__FEC_RX_CLK	0x80000000
+			MX51_PAD_DISP2_DAT12__FEC_RX_DV		0x80000000
+			MX51_PAD_DISP2_DAT13__FEC_TX_CLK	0x80000000
+			MX51_PAD_DISP2_DAT14__FEC_RDATA0	0x80000000
+			MX51_PAD_DISP2_DAT15__FEC_TDATA0	0x80000000
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_2__I2C2_SCL		0x400001ed
-				MX51_PAD_GPIO1_3__I2C2_SDA		0x400001ed
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_2__I2C2_SCL		0x400001ed
+			MX51_PAD_GPIO1_3__I2C2_SDA		0x400001ed
+		>;
+	};
 
-		pinctrl_i2c2_gpio: i2c2gpiogrp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_2__GPIO1_2		0x400001ed
-				MX51_PAD_GPIO1_3__GPIO1_3		0x400001ed
-			>;
-		};
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_2__GPIO1_2		0x400001ed
+			MX51_PAD_GPIO1_3__GPIO1_3		0x400001ed
+		>;
+	};
 
-		pinctrl_nfc: nfcgrp {
-			fsl,pins = <
-				MX51_PAD_NANDF_D0__NANDF_D0		0x80000000
-				MX51_PAD_NANDF_D1__NANDF_D1		0x80000000
-				MX51_PAD_NANDF_D2__NANDF_D2		0x80000000
-				MX51_PAD_NANDF_D3__NANDF_D3		0x80000000
-				MX51_PAD_NANDF_D4__NANDF_D4		0x80000000
-				MX51_PAD_NANDF_D5__NANDF_D5		0x80000000
-				MX51_PAD_NANDF_D6__NANDF_D6		0x80000000
-				MX51_PAD_NANDF_D7__NANDF_D7		0x80000000
-				MX51_PAD_NANDF_ALE__NANDF_ALE		0x80000000
-				MX51_PAD_NANDF_CLE__NANDF_CLE		0x80000000
-				MX51_PAD_NANDF_RE_B__NANDF_RE_B		0x80000000
-				MX51_PAD_NANDF_WE_B__NANDF_WE_B		0x80000000
-				MX51_PAD_NANDF_WP_B__NANDF_WP_B		0x80000000
-				MX51_PAD_NANDF_CS0__NANDF_CS0		0x80000000
-				MX51_PAD_NANDF_RB0__NANDF_RB0		0x80000000
-			>;
-		};
+	pinctrl_nfc: nfcgrp {
+		fsl,pins = <
+			MX51_PAD_NANDF_D0__NANDF_D0		0x80000000
+			MX51_PAD_NANDF_D1__NANDF_D1		0x80000000
+			MX51_PAD_NANDF_D2__NANDF_D2		0x80000000
+			MX51_PAD_NANDF_D3__NANDF_D3		0x80000000
+			MX51_PAD_NANDF_D4__NANDF_D4		0x80000000
+			MX51_PAD_NANDF_D5__NANDF_D5		0x80000000
+			MX51_PAD_NANDF_D6__NANDF_D6		0x80000000
+			MX51_PAD_NANDF_D7__NANDF_D7		0x80000000
+			MX51_PAD_NANDF_ALE__NANDF_ALE		0x80000000
+			MX51_PAD_NANDF_CLE__NANDF_CLE		0x80000000
+			MX51_PAD_NANDF_RE_B__NANDF_RE_B		0x80000000
+			MX51_PAD_NANDF_WE_B__NANDF_WE_B		0x80000000
+			MX51_PAD_NANDF_WP_B__NANDF_WP_B		0x80000000
+			MX51_PAD_NANDF_CS0__NANDF_CS0		0x80000000
+			MX51_PAD_NANDF_RB0__NANDF_RB0		0x80000000
+		>;
+	};
 
-		pinctrl_lan9221: lan9221grp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_9__GPIO1_9		0xe5 /* IRQ */
-			>;
-		};
+	pinctrl_lan9221: lan9221grp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_9__GPIO1_9		0xe5 /* IRQ */
+		>;
+	};
 
-		pinctrl_mc13892: mc13892grp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_5__GPIO1_5		0xe5 /* IRQ */
-			>;
-		};
+	pinctrl_mc13892: mc13892grp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_5__GPIO1_5		0xe5 /* IRQ */
+		>;
+	};
 
-		pinctrl_mma7455l: mma7455lgrp {
-			fsl,pins = <
-				MX51_PAD_GPIO1_7__GPIO1_7		0xe5 /* IRQ1 */
-				MX51_PAD_GPIO1_6__GPIO1_6		0xe5 /* IRQ2 */
-			>;
-		};
+	pinctrl_mma7455l: mma7455lgrp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_7__GPIO1_7		0xe5 /* IRQ1 */
+			MX51_PAD_GPIO1_6__GPIO1_6		0xe5 /* IRQ2 */
+		>;
+	};
 
-		pinctrl_weim: weimgrp {
-			fsl,pins = <
-				MX51_PAD_EIM_DA0__EIM_DA0		0x80000000
-				MX51_PAD_EIM_DA1__EIM_DA1		0x80000000
-				MX51_PAD_EIM_DA2__EIM_DA2		0x80000000
-				MX51_PAD_EIM_DA3__EIM_DA3		0x80000000
-				MX51_PAD_EIM_DA4__EIM_DA4		0x80000000
-				MX51_PAD_EIM_DA5__EIM_DA5		0x80000000
-				MX51_PAD_EIM_DA6__EIM_DA6		0x80000000
-				MX51_PAD_EIM_DA7__EIM_DA7		0x80000000
-				MX51_PAD_EIM_DA8__EIM_DA8		0x80000000
-				MX51_PAD_EIM_DA9__EIM_DA9		0x80000000
-				MX51_PAD_EIM_DA10__EIM_DA10		0x80000000
-				MX51_PAD_EIM_DA11__EIM_DA11		0x80000000
-				MX51_PAD_EIM_DA12__EIM_DA12		0x80000000
-				MX51_PAD_EIM_DA13__EIM_DA13		0x80000000
-				MX51_PAD_EIM_DA14__EIM_DA14		0x80000000
-				MX51_PAD_EIM_DA15__EIM_DA15		0x80000000
-				MX51_PAD_EIM_A16__EIM_A16		0x80000000
-				MX51_PAD_EIM_A17__EIM_A17		0x80000000
-				MX51_PAD_EIM_A18__EIM_A18		0x80000000
-				MX51_PAD_EIM_A19__EIM_A19		0x80000000
-				MX51_PAD_EIM_A20__EIM_A20		0x80000000
-				MX51_PAD_EIM_A21__EIM_A21		0x80000000
-				MX51_PAD_EIM_A22__EIM_A22		0x80000000
-				MX51_PAD_EIM_A23__EIM_A23		0x80000000
-				MX51_PAD_EIM_A24__EIM_A24		0x80000000
-				MX51_PAD_EIM_A25__EIM_A25		0x80000000
-				MX51_PAD_EIM_A26__EIM_A26		0x80000000
-				MX51_PAD_EIM_A27__EIM_A27		0x80000000
-				MX51_PAD_EIM_D16__EIM_D16		0x80000000
-				MX51_PAD_EIM_D17__EIM_D17		0x80000000
-				MX51_PAD_EIM_D18__EIM_D18		0x80000000
-				MX51_PAD_EIM_D19__EIM_D19		0x80000000
-				MX51_PAD_EIM_D20__EIM_D20		0x80000000
-				MX51_PAD_EIM_D21__EIM_D21		0x80000000
-				MX51_PAD_EIM_D22__EIM_D22		0x80000000
-				MX51_PAD_EIM_D23__EIM_D23		0x80000000
-				MX51_PAD_EIM_D24__EIM_D24		0x80000000
-				MX51_PAD_EIM_D25__EIM_D25		0x80000000
-				MX51_PAD_EIM_D26__EIM_D26		0x80000000
-				MX51_PAD_EIM_D27__EIM_D27		0x80000000
-				MX51_PAD_EIM_D28__EIM_D28		0x80000000
-				MX51_PAD_EIM_D29__EIM_D29		0x80000000
-				MX51_PAD_EIM_D30__EIM_D30		0x80000000
-				MX51_PAD_EIM_D31__EIM_D31		0x80000000
-				MX51_PAD_EIM_OE__EIM_OE			0x80000000
-				MX51_PAD_EIM_DTACK__EIM_DTACK		0x80000000
-				MX51_PAD_EIM_LBA__EIM_LBA		0x80000000
-				MX51_PAD_EIM_CS5__EIM_CS5		0x80000000 /* CS5 */
-			>;
-		};
+	pinctrl_weim: weimgrp {
+		fsl,pins = <
+			MX51_PAD_EIM_DA0__EIM_DA0		0x80000000
+			MX51_PAD_EIM_DA1__EIM_DA1		0x80000000
+			MX51_PAD_EIM_DA2__EIM_DA2		0x80000000
+			MX51_PAD_EIM_DA3__EIM_DA3		0x80000000
+			MX51_PAD_EIM_DA4__EIM_DA4		0x80000000
+			MX51_PAD_EIM_DA5__EIM_DA5		0x80000000
+			MX51_PAD_EIM_DA6__EIM_DA6		0x80000000
+			MX51_PAD_EIM_DA7__EIM_DA7		0x80000000
+			MX51_PAD_EIM_DA8__EIM_DA8		0x80000000
+			MX51_PAD_EIM_DA9__EIM_DA9		0x80000000
+			MX51_PAD_EIM_DA10__EIM_DA10		0x80000000
+			MX51_PAD_EIM_DA11__EIM_DA11		0x80000000
+			MX51_PAD_EIM_DA12__EIM_DA12		0x80000000
+			MX51_PAD_EIM_DA13__EIM_DA13		0x80000000
+			MX51_PAD_EIM_DA14__EIM_DA14		0x80000000
+			MX51_PAD_EIM_DA15__EIM_DA15		0x80000000
+			MX51_PAD_EIM_A16__EIM_A16		0x80000000
+			MX51_PAD_EIM_A17__EIM_A17		0x80000000
+			MX51_PAD_EIM_A18__EIM_A18		0x80000000
+			MX51_PAD_EIM_A19__EIM_A19		0x80000000
+			MX51_PAD_EIM_A20__EIM_A20		0x80000000
+			MX51_PAD_EIM_A21__EIM_A21		0x80000000
+			MX51_PAD_EIM_A22__EIM_A22		0x80000000
+			MX51_PAD_EIM_A23__EIM_A23		0x80000000
+			MX51_PAD_EIM_A24__EIM_A24		0x80000000
+			MX51_PAD_EIM_A25__EIM_A25		0x80000000
+			MX51_PAD_EIM_A26__EIM_A26		0x80000000
+			MX51_PAD_EIM_A27__EIM_A27		0x80000000
+			MX51_PAD_EIM_D16__EIM_D16		0x80000000
+			MX51_PAD_EIM_D17__EIM_D17		0x80000000
+			MX51_PAD_EIM_D18__EIM_D18		0x80000000
+			MX51_PAD_EIM_D19__EIM_D19		0x80000000
+			MX51_PAD_EIM_D20__EIM_D20		0x80000000
+			MX51_PAD_EIM_D21__EIM_D21		0x80000000
+			MX51_PAD_EIM_D22__EIM_D22		0x80000000
+			MX51_PAD_EIM_D23__EIM_D23		0x80000000
+			MX51_PAD_EIM_D24__EIM_D24		0x80000000
+			MX51_PAD_EIM_D25__EIM_D25		0x80000000
+			MX51_PAD_EIM_D26__EIM_D26		0x80000000
+			MX51_PAD_EIM_D27__EIM_D27		0x80000000
+			MX51_PAD_EIM_D28__EIM_D28		0x80000000
+			MX51_PAD_EIM_D29__EIM_D29		0x80000000
+			MX51_PAD_EIM_D30__EIM_D30		0x80000000
+			MX51_PAD_EIM_D31__EIM_D31		0x80000000
+			MX51_PAD_EIM_OE__EIM_OE			0x80000000
+			MX51_PAD_EIM_DTACK__EIM_DTACK		0x80000000
+			MX51_PAD_EIM_LBA__EIM_LBA		0x80000000
+			MX51_PAD_EIM_CS5__EIM_CS5		0x80000000 /* CS5 */
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi
index c2a929ba8cebd..0a150c91d30f7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi
@@ -44,43 +44,41 @@ tsc2007: tsc2007@49 {
 };
 
 &iomuxc {
-	imx51-eukrea {
-		pinctrl_tsc2007_1: tsc2007grp-1 {
-			fsl,pins = <
-				MX51_PAD_GPIO_NAND__GPIO_NAND 0x1f5
-				MX51_PAD_NANDF_D8__GPIO4_0 0x1f5
-			>;
-		};
+	pinctrl_tsc2007_1: tsc2007-1-grp {
+		fsl,pins = <
+			MX51_PAD_GPIO_NAND__GPIO_NAND 0x1f5
+			MX51_PAD_NANDF_D8__GPIO4_0 0x1f5
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX51_PAD_DI_GP3__FEC_TX_ER		0x80000000
-				MX51_PAD_DI2_PIN4__FEC_CRS		0x80000000
-				MX51_PAD_DI2_PIN2__FEC_MDC		0x80000000
-				MX51_PAD_DI2_PIN3__FEC_MDIO		0x80000000
-				MX51_PAD_DI2_DISP_CLK__FEC_RDATA1	0x80000000
-				MX51_PAD_DI_GP4__FEC_RDATA2		0x80000000
-				MX51_PAD_DISP2_DAT0__FEC_RDATA3		0x80000000
-				MX51_PAD_DISP2_DAT1__FEC_RX_ER		0x80000000
-				MX51_PAD_DISP2_DAT6__FEC_TDATA1		0x80000000
-				MX51_PAD_DISP2_DAT7__FEC_TDATA2		0x80000000
-				MX51_PAD_DISP2_DAT8__FEC_TDATA3		0x80000000
-				MX51_PAD_DISP2_DAT9__FEC_TX_EN		0x80000000
-				MX51_PAD_DISP2_DAT10__FEC_COL		0x80000000
-				MX51_PAD_DISP2_DAT11__FEC_RX_CLK	0x80000000
-				MX51_PAD_DISP2_DAT12__FEC_RX_DV		0x80000000
-				MX51_PAD_DISP2_DAT13__FEC_TX_CLK	0x80000000
-				MX51_PAD_DISP2_DAT14__FEC_RDATA0	0x80000000
-				MX51_PAD_DISP2_DAT15__FEC_TDATA0	0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX51_PAD_DI_GP3__FEC_TX_ER		0x80000000
+			MX51_PAD_DI2_PIN4__FEC_CRS		0x80000000
+			MX51_PAD_DI2_PIN2__FEC_MDC		0x80000000
+			MX51_PAD_DI2_PIN3__FEC_MDIO		0x80000000
+			MX51_PAD_DI2_DISP_CLK__FEC_RDATA1	0x80000000
+			MX51_PAD_DI_GP4__FEC_RDATA2		0x80000000
+			MX51_PAD_DISP2_DAT0__FEC_RDATA3		0x80000000
+			MX51_PAD_DISP2_DAT1__FEC_RX_ER		0x80000000
+			MX51_PAD_DISP2_DAT6__FEC_TDATA1		0x80000000
+			MX51_PAD_DISP2_DAT7__FEC_TDATA2		0x80000000
+			MX51_PAD_DISP2_DAT8__FEC_TDATA3		0x80000000
+			MX51_PAD_DISP2_DAT9__FEC_TX_EN		0x80000000
+			MX51_PAD_DISP2_DAT10__FEC_COL		0x80000000
+			MX51_PAD_DISP2_DAT11__FEC_RX_CLK	0x80000000
+			MX51_PAD_DISP2_DAT12__FEC_RX_DV		0x80000000
+			MX51_PAD_DISP2_DAT13__FEC_TX_CLK	0x80000000
+			MX51_PAD_DISP2_DAT14__FEC_RDATA0	0x80000000
+			MX51_PAD_DISP2_DAT15__FEC_TDATA0	0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX51_PAD_SD2_CMD__I2C1_SCL		0x400001ed
-				MX51_PAD_SD2_CLK__I2C1_SDA		0x400001ed
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX51_PAD_SD2_CMD__I2C1_SCL		0x400001ed
+			MX51_PAD_SD2_CLK__I2C1_SDA		0x400001ed
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts
index aff380e999c7e..0e0b9a811b966 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts
@@ -112,117 +112,115 @@ tlv320aic23: codec@1a {
 };
 
 &iomuxc {
-	imx51-eukrea {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX51_PAD_AUD3_BB_TXD__AUD3_TXD		0x80000000
-				MX51_PAD_AUD3_BB_RXD__AUD3_RXD		0x80000000
-				MX51_PAD_AUD3_BB_CK__AUD3_TXC		0x80000000
-				MX51_PAD_AUD3_BB_FS__AUD3_TXFS		0x80000000
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX51_PAD_AUD3_BB_TXD__AUD3_TXD		0x80000000
+			MX51_PAD_AUD3_BB_RXD__AUD3_RXD		0x80000000
+			MX51_PAD_AUD3_BB_CK__AUD3_TXC		0x80000000
+			MX51_PAD_AUD3_BB_FS__AUD3_TXFS		0x80000000
+		>;
+	};
 
 
-		pinctrl_can: cangrp {
-			fsl,pins = <
-				MX51_PAD_CSI2_PIXCLK__GPIO4_15		0x80000000	/* nReset */
-				MX51_PAD_GPIO1_1__GPIO1_1		0x80000000	/* IRQ */
-			>;
-		};
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX51_PAD_CSI2_PIXCLK__GPIO4_15		0x80000000	/* nReset */
+			MX51_PAD_GPIO1_1__GPIO1_1		0x80000000	/* IRQ */
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
-				MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
-				MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
-				MX51_PAD_CSPI1_SS0__GPIO4_24		0x80000000 	/* CS0 */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
+			MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x185
+			MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x185
+			MX51_PAD_CSPI1_SS0__GPIO4_24		0x80000000 	/* CS0 */
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
-				MX51_PAD_SD1_CLK__SD1_CLK		0x20d5
-				MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d5
-				MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d5
-				MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d5
-				MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX51_PAD_SD1_CMD__SD1_CMD		0x400020d5
+			MX51_PAD_SD1_CLK__SD1_CLK		0x20d5
+			MX51_PAD_SD1_DATA0__SD1_DATA0		0x20d5
+			MX51_PAD_SD1_DATA1__SD1_DATA1		0x20d5
+			MX51_PAD_SD1_DATA2__SD1_DATA2		0x20d5
+			MX51_PAD_SD1_DATA3__SD1_DATA3		0x20d5
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
-				MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
+			MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX51_PAD_UART3_RXD__UART3_RXD		0x1c5
-				MX51_PAD_UART3_TXD__UART3_TXD		0x1c5
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX51_PAD_UART3_RXD__UART3_RXD		0x1c5
+			MX51_PAD_UART3_TXD__UART3_TXD		0x1c5
+		>;
+	};
 
-		pinctrl_uart3_rtscts: uart3rtsctsgrp {
-			fsl,pins = <
-				MX51_PAD_KEY_COL4__UART3_RTS		0x1c5
-				MX51_PAD_KEY_COL5__UART3_CTS		0x1c5
-			>;
-		};
+	pinctrl_uart3_rtscts: uart3rtsctsgrp {
+		fsl,pins = <
+			MX51_PAD_KEY_COL4__UART3_RTS		0x1c5
+			MX51_PAD_KEY_COL5__UART3_CTS		0x1c5
+		>;
+	};
 
-		pinctrl_backlight_1: backlightgrp-1 {
-			fsl,pins = <
-				MX51_PAD_DI1_D1_CS__GPIO3_4 0x1f5
-			>;
-		};
+	pinctrl_backlight_1: backlight1grp {
+		fsl,pins = <
+			MX51_PAD_DI1_D1_CS__GPIO3_4 0x1f5
+		>;
+	};
 
-		pinctrl_esdhc1_cd: esdhc1_cd {
-			fsl,pins = <
-				MX51_PAD_GPIO1_0__GPIO1_0 0xd5
-			>;
-		};
+	pinctrl_esdhc1_cd: esdhc1_cdgrp {
+		fsl,pins = <
+			MX51_PAD_GPIO1_0__GPIO1_0 0xd5
+		>;
+	};
 
-		pinctrl_gpiokeys_1: gpiokeysgrp-1 {
-			fsl,pins = <
-				MX51_PAD_NANDF_D9__GPIO3_31 0x1f5
-			>;
-		};
+	pinctrl_gpiokeys_1: gpiokeys1grp {
+		fsl,pins = <
+			MX51_PAD_NANDF_D9__GPIO3_31 0x1f5
+		>;
+	};
 
-		pinctrl_gpioled: gpioledgrp-1 {
-			fsl,pins = <
-				MX51_PAD_NANDF_D10__GPIO3_30 0x80000000
-			>;
-		};
+	pinctrl_gpioled: gpioled1grp {
+		fsl,pins = <
+			MX51_PAD_NANDF_D10__GPIO3_30 0x80000000
+		>;
+	};
 
-		pinctrl_reg_lcd_3v3: reg_lcd_3v3 {
-			fsl,pins = <
-				MX51_PAD_CSI1_D9__GPIO3_13 0x1f5
-			>;
-		};
+	pinctrl_reg_lcd_3v3: reg_lcd_3v3grp {
+		fsl,pins = <
+			MX51_PAD_CSI1_D9__GPIO3_13 0x1f5
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				MX51_PAD_USBH1_CLK__USBH1_CLK     0x1e5
-				MX51_PAD_USBH1_DIR__USBH1_DIR     0x1e5
-				MX51_PAD_USBH1_NXT__USBH1_NXT     0x1e5
-				MX51_PAD_USBH1_DATA0__USBH1_DATA0 0x1e5
-				MX51_PAD_USBH1_DATA1__USBH1_DATA1 0x1e5
-				MX51_PAD_USBH1_DATA2__USBH1_DATA2 0x1e5
-				MX51_PAD_USBH1_DATA3__USBH1_DATA3 0x1e5
-				MX51_PAD_USBH1_DATA4__USBH1_DATA4 0x1e5
-				MX51_PAD_USBH1_DATA5__USBH1_DATA5 0x1e5
-				MX51_PAD_USBH1_DATA6__USBH1_DATA6 0x1e5
-				MX51_PAD_USBH1_DATA7__USBH1_DATA7 0x1e5
-				MX51_PAD_USBH1_STP__USBH1_STP     0x1e5
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			MX51_PAD_USBH1_CLK__USBH1_CLK     0x1e5
+			MX51_PAD_USBH1_DIR__USBH1_DIR     0x1e5
+			MX51_PAD_USBH1_NXT__USBH1_NXT     0x1e5
+			MX51_PAD_USBH1_DATA0__USBH1_DATA0 0x1e5
+			MX51_PAD_USBH1_DATA1__USBH1_DATA1 0x1e5
+			MX51_PAD_USBH1_DATA2__USBH1_DATA2 0x1e5
+			MX51_PAD_USBH1_DATA3__USBH1_DATA3 0x1e5
+			MX51_PAD_USBH1_DATA4__USBH1_DATA4 0x1e5
+			MX51_PAD_USBH1_DATA5__USBH1_DATA5 0x1e5
+			MX51_PAD_USBH1_DATA6__USBH1_DATA6 0x1e5
+			MX51_PAD_USBH1_DATA7__USBH1_DATA7 0x1e5
+			MX51_PAD_USBH1_STP__USBH1_STP     0x1e5
+		>;
+	};
 
-		pinctrl_usbh1_vbus: usbh1-vbusgrp {
-			fsl,pins = <
-				MX51_PAD_EIM_CS3__GPIO2_28 0x1f5
-			>;
-		};
+	pinctrl_usbh1_vbus: usbh1-vbusgrp {
+		fsl,pins = <
+			MX51_PAD_EIM_CS3__GPIO2_28 0x1f5
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index 4efce49022e44..cc88da4d7785c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -399,7 +399,7 @@ gpt: timer@73fa0000 {
 				clock-names = "ipg", "per";
 			};
 
-			iomuxc: iomuxc@73fa8000 {
+			iomuxc: pinctrl@73fa8000 {
 				compatible = "fsl,imx51-iomuxc";
 				reg = <0x73fa8000 0x4000>;
 			};
-- 
2.45.2



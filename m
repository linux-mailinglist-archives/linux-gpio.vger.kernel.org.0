Return-Path: <linux-gpio+bounces-11574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9148A9A2F59
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90BD71C21750
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AD3227B91;
	Thu, 17 Oct 2024 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Wmfqy/dr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8211EE00F;
	Thu, 17 Oct 2024 21:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199597; cv=none; b=J7q5/vNAZMevnpM8qjiFB9lfIRLtE6XloyGOW7GHLwngAhWOIUydgUP0DiNDuDGEByMuj5qgratfzCnrLHfCzE+ZIcAV6fgG5xVMcZ88bP4bwZUIHugRT44dOKHMoIGN5GPjtQIkVE9wKEX2+rdeovTs2IdFn4DjlI7JH/HMfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199597; c=relaxed/simple;
	bh=ZFx8ZFOeO15vR6B4VBk83WpPuP7G+vNjecZ5lmcixWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2xO3/TeNU/dYe30bxgyJ8UBS5xBOOJvhZa476JFO3p5Q9AH4QHbDKs22mgU/ZDgP+rhwdCL6dCDz0Z6p5f/BJA8wpHVXn4uhPAPDcJ0zjgDkj/W1aZOHYoe3IuqhNK5XkGndYgWwuBSM1tyufaS+UjxMBvNsAsNafdji3GeDIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Wmfqy/dr; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CB7F48909B;
	Thu, 17 Oct 2024 23:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199589;
	bh=uoxVD8d2mOItEDGmZ8F8IPnCSQ0AVxbR883grQtZxNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wmfqy/dr07n31+Mvh5vBFwvZwWLisX8yedxWeVaKPxsmNx+ZxQM4sd+L2JPeVvuW/
	 MZ+EVVObc5D+FuhPJP2Yb2hXkp/MAKKq+HLUZQYeQku8kCcQS3GYF+CCeMQ6qjrzNE
	 Lfk8C1qPyxXOxmt+lcy8hAfdpIZIr9cG45bD66AYk1NFNOEjSkFEJNp0xphiIlQjFM
	 DVIa5jIcLPs00IE90fHS29+7aKtTKvgEVlFBdng6QSZ/UH5/8XSPaMSx47axv6XZrh
	 5sIVVn1lE9AVwpDs6hmLUnCKf8CtIa0gMYGpJIQg6UjBLk8JAPqd7xUs3zYW4fHcQZ
	 ojN1cod7yZhzQ==
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
Subject: [PATCH v3 05/12] ARM: dts: imx53: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:22 +0200
Message-ID: <20241017211241.170861-5-marex@denx.de>
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
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts       | 116 +++--
 arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts    |  62 ++-
 arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi       |  90 ++--
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi      |  64 ++-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts    | 268 +++++-----
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts  | 320 ++++++------
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     | 114 ++---
 .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    | 274 ++++++-----
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts      |  10 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts       | 242 +++++----
 arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   | 274 ++++++-----
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts | 112 +++--
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts |  62 ++-
 arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi     | 460 +++++++++---------
 .../arm/boot/dts/nxp/imx/imx53-voipac-bsb.dts | 110 ++---
 .../dts/nxp/imx/imx53-voipac-dmm-668.dtsi     | 124 +++--
 arch/arm/boot/dts/nxp/imx/imx53.dtsi          |   2 +-
 17 files changed, 1334 insertions(+), 1370 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ard.dts b/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
index 165e1b00b721b..e580427660b1d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
@@ -101,67 +101,65 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-ard {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_1__GPIO1_1             0x80000000
-				MX53_PAD_GPIO_9__GPIO1_9             0x80000000
-				MX53_PAD_EIM_EB3__GPIO2_31           0x80000000
-				MX53_PAD_GPIO_10__GPIO4_0            0x80000000
-				MX53_PAD_DISP0_DAT16__GPIO5_10	     0x80000000
-				MX53_PAD_DISP0_DAT17__GPIO5_11       0x80000000
-				MX53_PAD_DISP0_DAT18__GPIO5_12       0x80000000
-				MX53_PAD_DISP0_DAT19__GPIO5_13       0x80000000
-				MX53_PAD_EIM_D16__EMI_WEIM_D_16      0x80000000
-				MX53_PAD_EIM_D17__EMI_WEIM_D_17      0x80000000
-				MX53_PAD_EIM_D18__EMI_WEIM_D_18      0x80000000
-				MX53_PAD_EIM_D19__EMI_WEIM_D_19      0x80000000
-				MX53_PAD_EIM_D20__EMI_WEIM_D_20      0x80000000
-				MX53_PAD_EIM_D21__EMI_WEIM_D_21      0x80000000
-				MX53_PAD_EIM_D22__EMI_WEIM_D_22      0x80000000
-				MX53_PAD_EIM_D23__EMI_WEIM_D_23      0x80000000
-				MX53_PAD_EIM_D24__EMI_WEIM_D_24      0x80000000
-				MX53_PAD_EIM_D25__EMI_WEIM_D_25      0x80000000
-				MX53_PAD_EIM_D26__EMI_WEIM_D_26      0x80000000
-				MX53_PAD_EIM_D27__EMI_WEIM_D_27      0x80000000
-				MX53_PAD_EIM_D28__EMI_WEIM_D_28      0x80000000
-				MX53_PAD_EIM_D29__EMI_WEIM_D_29      0x80000000
-				MX53_PAD_EIM_D30__EMI_WEIM_D_30      0x80000000
-				MX53_PAD_EIM_D31__EMI_WEIM_D_31      0x80000000
-				MX53_PAD_EIM_DA0__EMI_NAND_WEIM_DA_0 0x80000000
-				MX53_PAD_EIM_DA1__EMI_NAND_WEIM_DA_1 0x80000000
-				MX53_PAD_EIM_DA2__EMI_NAND_WEIM_DA_2 0x80000000
-				MX53_PAD_EIM_DA3__EMI_NAND_WEIM_DA_3 0x80000000
-				MX53_PAD_EIM_DA4__EMI_NAND_WEIM_DA_4 0x80000000
-				MX53_PAD_EIM_DA5__EMI_NAND_WEIM_DA_5 0x80000000
-				MX53_PAD_EIM_DA6__EMI_NAND_WEIM_DA_6 0x80000000
-				MX53_PAD_EIM_OE__EMI_WEIM_OE	     0x80000000
-				MX53_PAD_EIM_RW__EMI_WEIM_RW	     0x80000000
-				MX53_PAD_EIM_CS1__EMI_WEIM_CS_1	     0x80000000
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_1__GPIO1_1             0x80000000
+			MX53_PAD_GPIO_9__GPIO1_9             0x80000000
+			MX53_PAD_EIM_EB3__GPIO2_31           0x80000000
+			MX53_PAD_GPIO_10__GPIO4_0            0x80000000
+			MX53_PAD_DISP0_DAT16__GPIO5_10	     0x80000000
+			MX53_PAD_DISP0_DAT17__GPIO5_11       0x80000000
+			MX53_PAD_DISP0_DAT18__GPIO5_12       0x80000000
+			MX53_PAD_DISP0_DAT19__GPIO5_13       0x80000000
+			MX53_PAD_EIM_D16__EMI_WEIM_D_16      0x80000000
+			MX53_PAD_EIM_D17__EMI_WEIM_D_17      0x80000000
+			MX53_PAD_EIM_D18__EMI_WEIM_D_18      0x80000000
+			MX53_PAD_EIM_D19__EMI_WEIM_D_19      0x80000000
+			MX53_PAD_EIM_D20__EMI_WEIM_D_20      0x80000000
+			MX53_PAD_EIM_D21__EMI_WEIM_D_21      0x80000000
+			MX53_PAD_EIM_D22__EMI_WEIM_D_22      0x80000000
+			MX53_PAD_EIM_D23__EMI_WEIM_D_23      0x80000000
+			MX53_PAD_EIM_D24__EMI_WEIM_D_24      0x80000000
+			MX53_PAD_EIM_D25__EMI_WEIM_D_25      0x80000000
+			MX53_PAD_EIM_D26__EMI_WEIM_D_26      0x80000000
+			MX53_PAD_EIM_D27__EMI_WEIM_D_27      0x80000000
+			MX53_PAD_EIM_D28__EMI_WEIM_D_28      0x80000000
+			MX53_PAD_EIM_D29__EMI_WEIM_D_29      0x80000000
+			MX53_PAD_EIM_D30__EMI_WEIM_D_30      0x80000000
+			MX53_PAD_EIM_D31__EMI_WEIM_D_31      0x80000000
+			MX53_PAD_EIM_DA0__EMI_NAND_WEIM_DA_0 0x80000000
+			MX53_PAD_EIM_DA1__EMI_NAND_WEIM_DA_1 0x80000000
+			MX53_PAD_EIM_DA2__EMI_NAND_WEIM_DA_2 0x80000000
+			MX53_PAD_EIM_DA3__EMI_NAND_WEIM_DA_3 0x80000000
+			MX53_PAD_EIM_DA4__EMI_NAND_WEIM_DA_4 0x80000000
+			MX53_PAD_EIM_DA5__EMI_NAND_WEIM_DA_5 0x80000000
+			MX53_PAD_EIM_DA6__EMI_NAND_WEIM_DA_6 0x80000000
+			MX53_PAD_EIM_OE__EMI_WEIM_OE	     0x80000000
+			MX53_PAD_EIM_RW__EMI_WEIM_RW	     0x80000000
+			MX53_PAD_EIM_CS1__EMI_WEIM_CS_1	     0x80000000
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
-				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
-				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
-				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
-				MX53_PAD_PATA_DATA8__ESDHC1_DAT4	0x1d5
-				MX53_PAD_PATA_DATA9__ESDHC1_DAT5	0x1d5
-				MX53_PAD_PATA_DATA10__ESDHC1_DAT6	0x1d5
-				MX53_PAD_PATA_DATA11__ESDHC1_DAT7	0x1d5
-				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
-				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
+			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
+			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
+			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
+			MX53_PAD_PATA_DATA8__ESDHC1_DAT4	0x1d5
+			MX53_PAD_PATA_DATA9__ESDHC1_DAT5	0x1d5
+			MX53_PAD_PATA_DATA10__ESDHC1_DAT6	0x1d5
+			MX53_PAD_PATA_DATA11__ESDHC1_DAT7	0x1d5
+			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
+			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts b/arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts
index f6f1163666434..9c480e4d27cef 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts
@@ -102,38 +102,36 @@ gpio-expander2@21 {
 };
 
 &iomuxc {
-	imx53-kp-ddc {
-		pinctrl_disp: dispgrp {
-			fsl,pins = <
-				MX53_PAD_EIM_A16__IPU_DI1_DISP_CLK      0x4
-				MX53_PAD_EIM_DA10__IPU_DI1_PIN15        0x4
-				MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0       0x4
-				MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1       0x4
-				MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2       0x4
-				MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3       0x4
-				MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4       0x4
-				MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5       0x4
-				MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6       0x4
-				MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7       0x4
-				MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8       0x4
-				MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9       0x4
-				MX53_PAD_EIM_EB1__IPU_DISP1_DAT_10      0x4
-				MX53_PAD_EIM_EB0__IPU_DISP1_DAT_11      0x4
-				MX53_PAD_EIM_A17__IPU_DISP1_DAT_12      0x4
-				MX53_PAD_EIM_A18__IPU_DISP1_DAT_13      0x4
-				MX53_PAD_EIM_A19__IPU_DISP1_DAT_14      0x4
-				MX53_PAD_EIM_A20__IPU_DISP1_DAT_15      0x4
-				MX53_PAD_EIM_A21__IPU_DISP1_DAT_16      0x4
-				MX53_PAD_EIM_A22__IPU_DISP1_DAT_17      0x4
-				MX53_PAD_EIM_A23__IPU_DISP1_DAT_18      0x4
-				MX53_PAD_EIM_A24__IPU_DISP1_DAT_19      0x4
-				MX53_PAD_EIM_D31__IPU_DISP1_DAT_20      0x4
-				MX53_PAD_EIM_D30__IPU_DISP1_DAT_21      0x4
-				MX53_PAD_EIM_D26__IPU_DISP1_DAT_22      0x4
-				MX53_PAD_EIM_D27__IPU_DISP1_DAT_23      0x4
-				MX53_PAD_GPIO_1__PWM2_PWMO 0x4
-			>;
-		};
+	pinctrl_disp: dispgrp {
+		fsl,pins = <
+			MX53_PAD_EIM_A16__IPU_DI1_DISP_CLK      0x4
+			MX53_PAD_EIM_DA10__IPU_DI1_PIN15        0x4
+			MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0       0x4
+			MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1       0x4
+			MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2       0x4
+			MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3       0x4
+			MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4       0x4
+			MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5       0x4
+			MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6       0x4
+			MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7       0x4
+			MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8       0x4
+			MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9       0x4
+			MX53_PAD_EIM_EB1__IPU_DISP1_DAT_10      0x4
+			MX53_PAD_EIM_EB0__IPU_DISP1_DAT_11      0x4
+			MX53_PAD_EIM_A17__IPU_DISP1_DAT_12      0x4
+			MX53_PAD_EIM_A18__IPU_DISP1_DAT_13      0x4
+			MX53_PAD_EIM_A19__IPU_DISP1_DAT_14      0x4
+			MX53_PAD_EIM_A20__IPU_DISP1_DAT_15      0x4
+			MX53_PAD_EIM_A21__IPU_DISP1_DAT_16      0x4
+			MX53_PAD_EIM_A22__IPU_DISP1_DAT_17      0x4
+			MX53_PAD_EIM_A23__IPU_DISP1_DAT_18      0x4
+			MX53_PAD_EIM_A24__IPU_DISP1_DAT_19      0x4
+			MX53_PAD_EIM_D31__IPU_DISP1_DAT_20      0x4
+			MX53_PAD_EIM_D30__IPU_DISP1_DAT_21      0x4
+			MX53_PAD_EIM_D26__IPU_DISP1_DAT_22      0x4
+			MX53_PAD_EIM_D27__IPU_DISP1_DAT_23      0x4
+			MX53_PAD_GPIO_1__PWM2_PWMO 0x4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi
index ae5f87b8612d4..ebbd4d93e4606 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi
@@ -98,56 +98,54 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_kp_common>;
 
-	imx53-kp-common {
-		pinctrl_buzzer: buzzergrp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA3__PWM1_PWMO 0x1e4
-			>;
-		};
+	pinctrl_buzzer: buzzergrp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA3__PWM1_PWMO 0x1e4
+		>;
+	};
 
-		pinctrl_gpiobuttons: gpiobuttonsgrp {
-			fsl,pins = <
-				MX53_PAD_EIM_RW__GPIO2_26 0x1e4
-				MX53_PAD_EIM_D22__GPIO3_22 0x1e4
-			>;
-		};
+	pinctrl_gpiobuttons: gpiobuttonsgrp {
+		fsl,pins = <
+			MX53_PAD_EIM_RW__GPIO2_26 0x1e4
+			MX53_PAD_EIM_D22__GPIO3_22 0x1e4
+		>;
+	};
 
-		pinctrl_kp_common: kpcommongrp {
-			fsl,pins = <
-				MX53_PAD_EIM_CS0__GPIO2_23 0x1e4
-				MX53_PAD_GPIO_19__GPIO4_5  0x1e4
-				MX53_PAD_PATA_DATA6__GPIO2_6 0x1e4
-				MX53_PAD_PATA_DATA7__GPIO2_7 0xe0
-				MX53_PAD_CSI0_DAT14__GPIO6_0 0x1e4
-				MX53_PAD_CSI0_DAT16__GPIO6_2 0x1e4
-				MX53_PAD_CSI0_DAT18__GPIO6_4 0x1e4
-				MX53_PAD_EIM_D17__GPIO3_17 0x1e4
-				MX53_PAD_EIM_D18__GPIO3_18 0x1e4
-				MX53_PAD_EIM_D21__GPIO3_21 0x1e4
-				MX53_PAD_EIM_D29__GPIO3_29 0x1e4
-				MX53_PAD_EIM_DA11__GPIO3_11 0x1e4
-				MX53_PAD_EIM_DA13__GPIO3_13 0x1e4
-				MX53_PAD_EIM_DA14__GPIO3_14 0x1e4
-				MX53_PAD_SD1_DATA0__GPIO1_16 0x1e4
-				MX53_PAD_SD1_CMD__GPIO1_18 0x1e4
-				MX53_PAD_SD1_CLK__GPIO1_20 0x1e4
-			>;
-		};
+	pinctrl_kp_common: kpcommongrp {
+		fsl,pins = <
+			MX53_PAD_EIM_CS0__GPIO2_23 0x1e4
+			MX53_PAD_GPIO_19__GPIO4_5  0x1e4
+			MX53_PAD_PATA_DATA6__GPIO2_6 0x1e4
+			MX53_PAD_PATA_DATA7__GPIO2_7 0xe0
+			MX53_PAD_CSI0_DAT14__GPIO6_0 0x1e4
+			MX53_PAD_CSI0_DAT16__GPIO6_2 0x1e4
+			MX53_PAD_CSI0_DAT18__GPIO6_4 0x1e4
+			MX53_PAD_EIM_D17__GPIO3_17 0x1e4
+			MX53_PAD_EIM_D18__GPIO3_18 0x1e4
+			MX53_PAD_EIM_D21__GPIO3_21 0x1e4
+			MX53_PAD_EIM_D29__GPIO3_29 0x1e4
+			MX53_PAD_EIM_DA11__GPIO3_11 0x1e4
+			MX53_PAD_EIM_DA13__GPIO3_13 0x1e4
+			MX53_PAD_EIM_DA14__GPIO3_14 0x1e4
+			MX53_PAD_SD1_DATA0__GPIO1_16 0x1e4
+			MX53_PAD_SD1_CMD__GPIO1_18 0x1e4
+			MX53_PAD_SD1_CLK__GPIO1_20 0x1e4
+		>;
+	};
 
-		pinctrl_leds: ledgrp {
-			fsl,pins = <
-				MX53_PAD_EIM_EB2__GPIO2_30 0x1d4
-				MX53_PAD_EIM_D28__GPIO3_28 0x1d4
-				MX53_PAD_EIM_WAIT__GPIO5_0 0x1d4
-			>;
-		};
+	pinctrl_leds: ledgrp {
+		fsl,pins = <
+			MX53_PAD_EIM_EB2__GPIO2_30 0x1d4
+			MX53_PAD_EIM_D28__GPIO3_28 0x1d4
+			MX53_PAD_EIM_WAIT__GPIO5_0 0x1d4
+		>;
+	};
 
-		pinctrl_uart4: uart4grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT12__UART4_TXD_MUX 0x1e4
-				MX53_PAD_CSI0_DAT13__UART4_RXD_MUX 0x1e4
-			>;
-		};
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT12__UART4_TXD_MUX 0x1e4
+			MX53_PAD_CSI0_DAT13__UART4_RXD_MUX 0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi
index 00b8d7ca41a2c..df543b4751e0a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi
@@ -77,41 +77,39 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-m53evk {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK	0x80000000
-				MX53_PAD_EIM_EB3__GPIO2_31		0x80000000
-				MX53_PAD_PATA_DA_0__GPIO7_6		0x80000000
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK	0x80000000
+			MX53_PAD_EIM_EB3__GPIO2_31		0x80000000
+			MX53_PAD_PATA_DA_0__GPIO7_6		0x80000000
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D16__I2C2_SDA		0xc0000000
-				MX53_PAD_EIM_EB2__I2C2_SCL		0xc0000000
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D16__I2C2_SDA		0xc0000000
+			MX53_PAD_EIM_EB2__I2C2_SCL		0xc0000000
+		>;
+	};
 
-		pinctrl_nand: nandgrp {
-			fsl,pins = <
-				MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B	0x4
-				MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B	0x4
-				MX53_PAD_NANDF_CLE__EMI_NANDF_CLE	0x4
-				MX53_PAD_NANDF_ALE__EMI_NANDF_ALE	0x4
-				MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B	0xe0
-				MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0	0xe0
-				MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0	0x4
-				MX53_PAD_PATA_DATA0__EMI_NANDF_D_0	0xa4
-				MX53_PAD_PATA_DATA1__EMI_NANDF_D_1	0xa4
-				MX53_PAD_PATA_DATA2__EMI_NANDF_D_2	0xa4
-				MX53_PAD_PATA_DATA3__EMI_NANDF_D_3	0xa4
-				MX53_PAD_PATA_DATA4__EMI_NANDF_D_4	0xa4
-				MX53_PAD_PATA_DATA5__EMI_NANDF_D_5	0xa4
-				MX53_PAD_PATA_DATA6__EMI_NANDF_D_6	0xa4
-				MX53_PAD_PATA_DATA7__EMI_NANDF_D_7	0xa4
-			>;
-		};
+	pinctrl_nand: nandgrp {
+		fsl,pins = <
+			MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B	0x4
+			MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B	0x4
+			MX53_PAD_NANDF_CLE__EMI_NANDF_CLE	0x4
+			MX53_PAD_NANDF_ALE__EMI_NANDF_ALE	0x4
+			MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B	0xe0
+			MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0	0xe0
+			MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0	0x4
+			MX53_PAD_PATA_DATA0__EMI_NANDF_D_0	0xa4
+			MX53_PAD_PATA_DATA1__EMI_NANDF_D_1	0xa4
+			MX53_PAD_PATA_DATA2__EMI_NANDF_D_2	0xa4
+			MX53_PAD_PATA_DATA3__EMI_NANDF_D_3	0xa4
+			MX53_PAD_PATA_DATA4__EMI_NANDF_D_4	0xa4
+			MX53_PAD_PATA_DATA5__EMI_NANDF_D_5	0xa4
+			MX53_PAD_PATA_DATA6__EMI_NANDF_D_6	0xa4
+			MX53_PAD_PATA_DATA7__EMI_NANDF_D_7	0xa4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
index ba0c62994f75d..eb3d663053950 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
@@ -156,155 +156,153 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-m53evk {
-		pinctrl_usb: usbgrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_2__GPIO1_2		0x80000000
-				MX53_PAD_GPIO_3__USBOH3_USBH1_OC	0x80000000
-			>;
-		};
+	pinctrl_usb: usbgrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_2__GPIO1_2		0x80000000
+			MX53_PAD_GPIO_3__USBOH3_USBH1_OC	0x80000000
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_4__GPIO1_4		0x000b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_4__GPIO1_4		0x000b0
+		>;
+	};
 
-		led_pin_gpio: led_gpio {
-			fsl,pins = <
-				MX53_PAD_PATA_DATA8__GPIO2_8		0x80000000
-				MX53_PAD_PATA_DATA9__GPIO2_9		0x80000000
-			>;
-		};
+	led_pin_gpio: ledgpiogrp {
+		fsl,pins = <
+			MX53_PAD_PATA_DATA8__GPIO2_8		0x80000000
+			MX53_PAD_PATA_DATA9__GPIO2_9		0x80000000
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX53_PAD_SD2_DATA3__AUDMUX_AUD4_TXC	0x80000000
-				MX53_PAD_SD2_DATA2__AUDMUX_AUD4_TXD	0x80000000
-				MX53_PAD_SD2_DATA1__AUDMUX_AUD4_TXFS	0x80000000
-				MX53_PAD_SD2_DATA0__AUDMUX_AUD4_RXD	0x80000000
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX53_PAD_SD2_DATA3__AUDMUX_AUD4_TXC	0x80000000
+			MX53_PAD_SD2_DATA2__AUDMUX_AUD4_TXD	0x80000000
+			MX53_PAD_SD2_DATA1__AUDMUX_AUD4_TXFS	0x80000000
+			MX53_PAD_SD2_DATA0__AUDMUX_AUD4_RXD	0x80000000
+		>;
+	};
 
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_7__CAN1_TXCAN		0x80000000
-				MX53_PAD_GPIO_8__CAN1_RXCAN		0x80000000
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_7__CAN1_TXCAN		0x80000000
+			MX53_PAD_GPIO_8__CAN1_RXCAN		0x80000000
+		>;
+	};
 
-		pinctrl_can2: can2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL4__CAN2_TXCAN		0x80000000
-				MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x80000000
-			>;
-		};
+	pinctrl_can2: can2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL4__CAN2_TXCAN		0x80000000
+			MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x80000000
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
-				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
-				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
-				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
-				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
-				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
+			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
+			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
+			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
+			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
+			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D21__I2C1_SCL		0xc0000000
-				MX53_PAD_EIM_D28__I2C1_SDA		0xc0000000
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D21__I2C1_SCL		0xc0000000
+			MX53_PAD_EIM_D28__I2C1_SDA		0xc0000000
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_6__I2C3_SDA		0xc0000000
-				MX53_PAD_GPIO_5__I2C3_SCL		0xc0000000
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_6__I2C3_SDA		0xc0000000
+			MX53_PAD_GPIO_5__I2C3_SCL		0xc0000000
+		>;
+	};
 
-		pinctrl_ipu_disp1: ipudisp1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0	0x5
-				MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1	0x5
-				MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2	0x5
-				MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3	0x5
-				MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4	0x5
-				MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5	0x5
-				MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6	0x5
-				MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7	0x5
-				MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8	0x5
-				MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9	0x5
-				MX53_PAD_EIM_EB1__IPU_DISP1_DAT_10	0x5
-				MX53_PAD_EIM_EB0__IPU_DISP1_DAT_11	0x5
-				MX53_PAD_EIM_A17__IPU_DISP1_DAT_12	0x5
-				MX53_PAD_EIM_A18__IPU_DISP1_DAT_13	0x5
-				MX53_PAD_EIM_A19__IPU_DISP1_DAT_14	0x5
-				MX53_PAD_EIM_A20__IPU_DISP1_DAT_15	0x5
-				MX53_PAD_EIM_A21__IPU_DISP1_DAT_16	0x5
-				MX53_PAD_EIM_A22__IPU_DISP1_DAT_17	0x5
-				MX53_PAD_EIM_A23__IPU_DISP1_DAT_18	0x5
-				MX53_PAD_EIM_A24__IPU_DISP1_DAT_19	0x5
-				MX53_PAD_EIM_D31__IPU_DISP1_DAT_20	0x5
-				MX53_PAD_EIM_D30__IPU_DISP1_DAT_21	0x5
-				MX53_PAD_EIM_D26__IPU_DISP1_DAT_22	0x5
-				MX53_PAD_EIM_D27__IPU_DISP1_DAT_23	0x5
-				MX53_PAD_EIM_A16__IPU_DI1_DISP_CLK	0x5
-				MX53_PAD_EIM_DA13__IPU_DI1_D0_CS	0x5
-				MX53_PAD_EIM_DA14__IPU_DI1_D1_CS	0x5
-				MX53_PAD_EIM_DA15__IPU_DI1_PIN1		0x5
-				MX53_PAD_EIM_DA11__IPU_DI1_PIN2		0x5
-				MX53_PAD_EIM_DA12__IPU_DI1_PIN3		0x5
-				MX53_PAD_EIM_A25__IPU_DI1_PIN12		0x5
-				MX53_PAD_EIM_DA10__IPU_DI1_PIN15	0x5
-			>;
-		};
+	pinctrl_ipu_disp1: ipudisp1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0	0x5
+			MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1	0x5
+			MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2	0x5
+			MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3	0x5
+			MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4	0x5
+			MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5	0x5
+			MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6	0x5
+			MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7	0x5
+			MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8	0x5
+			MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9	0x5
+			MX53_PAD_EIM_EB1__IPU_DISP1_DAT_10	0x5
+			MX53_PAD_EIM_EB0__IPU_DISP1_DAT_11	0x5
+			MX53_PAD_EIM_A17__IPU_DISP1_DAT_12	0x5
+			MX53_PAD_EIM_A18__IPU_DISP1_DAT_13	0x5
+			MX53_PAD_EIM_A19__IPU_DISP1_DAT_14	0x5
+			MX53_PAD_EIM_A20__IPU_DISP1_DAT_15	0x5
+			MX53_PAD_EIM_A21__IPU_DISP1_DAT_16	0x5
+			MX53_PAD_EIM_A22__IPU_DISP1_DAT_17	0x5
+			MX53_PAD_EIM_A23__IPU_DISP1_DAT_18	0x5
+			MX53_PAD_EIM_A24__IPU_DISP1_DAT_19	0x5
+			MX53_PAD_EIM_D31__IPU_DISP1_DAT_20	0x5
+			MX53_PAD_EIM_D30__IPU_DISP1_DAT_21	0x5
+			MX53_PAD_EIM_D26__IPU_DISP1_DAT_22	0x5
+			MX53_PAD_EIM_D27__IPU_DISP1_DAT_23	0x5
+			MX53_PAD_EIM_A16__IPU_DI1_DISP_CLK	0x5
+			MX53_PAD_EIM_DA13__IPU_DI1_D0_CS	0x5
+			MX53_PAD_EIM_DA14__IPU_DI1_D1_CS	0x5
+			MX53_PAD_EIM_DA15__IPU_DI1_PIN1		0x5
+			MX53_PAD_EIM_DA11__IPU_DI1_PIN2		0x5
+			MX53_PAD_EIM_DA12__IPU_DI1_PIN3		0x5
+			MX53_PAD_EIM_A25__IPU_DI1_PIN12		0x5
+			MX53_PAD_EIM_DA10__IPU_DI1_PIN15	0x5
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX53_PAD_DISP0_DAT8__PWM1_PWMO		0x5
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX53_PAD_DISP0_DAT8__PWM1_PWMO		0x5
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
-				MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DA_1__UART3_CTS		0x1e4
-				MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
+			MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DA_1__UART3_CTS		0x1e4
+			MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
index 558751e730f3e..6210673f93bea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
@@ -278,186 +278,184 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-m53evk {
-		hoggrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_19__CCM_CLKO		0x1e4
-				MX53_PAD_CSI0_DATA_EN__GPIO5_20		0x1e4
-				MX53_PAD_CSI0_DAT4__GPIO5_22		0x1e4
-				MX53_PAD_CSI0_DAT5__GPIO5_23		0x1c4
-				MX53_PAD_CSI0_DAT6__GPIO5_24		0x1e4
-				MX53_PAD_CSI0_DAT7__GPIO5_25		0x1e4
-				MX53_PAD_CSI0_DAT8__GPIO5_26		0x1e4
-				MX53_PAD_CSI0_DAT9__GPIO5_27		0x1c4
-				MX53_PAD_CSI0_DAT10__GPIO5_28		0x1e4
-				MX53_PAD_CSI0_DAT11__GPIO5_29		0x1e4
-				MX53_PAD_PATA_DATA11__GPIO2_11		0x1e4
-				MX53_PAD_EIM_D24__GPIO3_24		0x1e4
-				MX53_PAD_EIM_D25__GPIO3_25		0x1e4
-				MX53_PAD_EIM_D29__GPIO3_29		0x1e4
-				MX53_PAD_CSI0_PIXCLK__GPIO5_18		0x1e4
-				MX53_PAD_CSI0_VSYNC__GPIO5_21		0x1e4
-				MX53_PAD_CSI0_DAT18__GPIO6_4		0x1c4
-				MX53_PAD_PATA_DATA8__GPIO2_8		0x1e4
-			>;
-		};
+	hoggrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_19__CCM_CLKO		0x1e4
+			MX53_PAD_CSI0_DATA_EN__GPIO5_20		0x1e4
+			MX53_PAD_CSI0_DAT4__GPIO5_22		0x1e4
+			MX53_PAD_CSI0_DAT5__GPIO5_23		0x1c4
+			MX53_PAD_CSI0_DAT6__GPIO5_24		0x1e4
+			MX53_PAD_CSI0_DAT7__GPIO5_25		0x1e4
+			MX53_PAD_CSI0_DAT8__GPIO5_26		0x1e4
+			MX53_PAD_CSI0_DAT9__GPIO5_27		0x1c4
+			MX53_PAD_CSI0_DAT10__GPIO5_28		0x1e4
+			MX53_PAD_CSI0_DAT11__GPIO5_29		0x1e4
+			MX53_PAD_PATA_DATA11__GPIO2_11		0x1e4
+			MX53_PAD_EIM_D24__GPIO3_24		0x1e4
+			MX53_PAD_EIM_D25__GPIO3_25		0x1e4
+			MX53_PAD_EIM_D29__GPIO3_29		0x1e4
+			MX53_PAD_CSI0_PIXCLK__GPIO5_18		0x1e4
+			MX53_PAD_CSI0_VSYNC__GPIO5_21		0x1e4
+			MX53_PAD_CSI0_DAT18__GPIO6_4		0x1c4
+			MX53_PAD_PATA_DATA8__GPIO2_8		0x1e4
+		>;
+	};
 
-		pinctrl_led: ledgrp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT15__GPIO6_1		0x1c4
-				MX53_PAD_CSI0_DAT16__GPIO6_2		0x1c4
-			>;
-		};
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT15__GPIO6_1		0x1c4
+			MX53_PAD_CSI0_DAT16__GPIO6_2		0x1c4
+		>;
+	};
 
-		pinctrl_beeper: beepergrp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT17__GPIO6_3		0x1c4
-			>;
-		};
+	pinctrl_beeper: beepergrp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT17__GPIO6_3		0x1c4
+		>;
+	};
 
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_7__CAN1_TXCAN		0x1c4
-				MX53_PAD_GPIO_8__CAN1_RXCAN		0x1c4
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_7__CAN1_TXCAN		0x1c4
+			MX53_PAD_GPIO_8__CAN1_RXCAN		0x1c4
+		>;
+	};
 
-		pinctrl_can2: can2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL4__CAN2_TXCAN		0x1e4
-				MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x1c4
-			>;
-		};
+	pinctrl_can2: can2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL4__CAN2_TXCAN		0x1e4
+			MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x1c4
+		>;
+	};
 
-		pinctrl_display_gpio: display-gpiogrp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT12__GPIO5_30		0x1c4 /* Reset */
-				MX53_PAD_CSI0_MCLK__GPIO5_19		0x1e4 /* Int-K */
-				MX53_PAD_CSI0_DAT13__GPIO5_31		0x1c4 /* Int-I */
+	pinctrl_display_gpio: display-gpiogrp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT12__GPIO5_30		0x1c4 /* Reset */
+			MX53_PAD_CSI0_MCLK__GPIO5_19		0x1e4 /* Int-K */
+			MX53_PAD_CSI0_DAT13__GPIO5_31		0x1c4 /* Int-I */
 
-				MX53_PAD_CSI0_DAT14__GPIO6_0		0x1c4 /* Power down */
-			>;
-		};
+			MX53_PAD_CSI0_DAT14__GPIO6_0		0x1c4 /* Power down */
+		>;
+	};
 
-		pinctrl_edt_ft5x06: edt-ft5x06grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DATA9__GPIO2_9		0x1e4 /* Reset */
-				MX53_PAD_CSI0_DAT19__GPIO6_5		0x1c4 /* Interrupt */
-				MX53_PAD_PATA_DATA10__GPIO2_10		0x1e4 /* Wake */
-			>;
-		};
+	pinctrl_edt_ft5x06: edt-ft5x06grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DATA9__GPIO2_9		0x1e4 /* Reset */
+			MX53_PAD_CSI0_DAT19__GPIO6_5		0x1c4 /* Interrupt */
+			MX53_PAD_PATA_DATA10__GPIO2_10		0x1e4 /* Wake */
+		>;
+	};
 
-		pinctrl_ecspi2: ecspi2grp {
-			fsl,pins = <
-				MX53_PAD_EIM_CS0__ECSPI2_SCLK		0xe4
-				MX53_PAD_EIM_OE__ECSPI2_MISO		0xe4
-				MX53_PAD_EIM_CS1__ECSPI2_MOSI		0xe4
-				MX53_PAD_EIM_RW__GPIO2_26		0xe4
-				MX53_PAD_EIM_LBA__GPIO2_27		0xe4
-			>;
-		};
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX53_PAD_EIM_CS0__ECSPI2_SCLK		0xe4
+			MX53_PAD_EIM_OE__ECSPI2_MISO		0xe4
+			MX53_PAD_EIM_CS1__ECSPI2_MOSI		0xe4
+			MX53_PAD_EIM_RW__GPIO2_26		0xe4
+			MX53_PAD_EIM_LBA__GPIO2_27		0xe4
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1e4
-				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1e4
-				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1e4
-				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1e4
-				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1e4
-				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1e4
-				MX53_PAD_GPIO_1__GPIO1_1		0x1c4
-				MX53_PAD_GPIO_9__GPIO1_9		0x1e4
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1e4
+			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1e4
+			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1e4
+			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1e4
+			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1e4
+			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1e4
+			MX53_PAD_GPIO_1__GPIO1_1		0x1c4
+			MX53_PAD_GPIO_9__GPIO1_9		0x1e4
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x1e4
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x1e4
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x1e4
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x1e4
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x1e4
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x1e4
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x1e4
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x1c4
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x1e4
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x1e4
-				MX53_PAD_PATA_DA_1__GPIO7_7		0x1e4
-				MX53_PAD_EIM_EB3__GPIO2_31		0x1e4
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x1e4
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x1e4
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x1e4
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x1e4
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x1e4
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x1e4
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x1e4
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x1c4
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x1e4
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x1e4
+			MX53_PAD_PATA_DA_1__GPIO7_7		0x1e4
+			MX53_PAD_EIM_EB3__GPIO2_31		0x1e4
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D21__I2C1_SCL		0x400001e4
-				MX53_PAD_EIM_D28__I2C1_SDA		0x400001e4
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D21__I2C1_SCL		0x400001e4
+			MX53_PAD_EIM_D28__I2C1_SDA		0x400001e4
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_6__I2C3_SDA		0x400001e4
-				MX53_PAD_GPIO_5__I2C3_SCL		0x400001e4
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_6__I2C3_SDA		0x400001e4
+			MX53_PAD_GPIO_5__I2C3_SCL		0x400001e4
+		>;
+	};
 
-		pinctrl_lvds0: lvds0grp {
-			/* LVDS pins only have pin mux configuration */
-			fsl,pins = <
-				MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK	0x80000000
-				MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0	0x80000000
-				MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1	0x80000000
-				MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2	0x80000000
-				MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3	0x80000000
-			>;
-		};
+	pinctrl_lvds0: lvds0grp {
+		/* LVDS pins only have pin mux configuration */
+		fsl,pins = <
+			MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK	0x80000000
+			MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0	0x80000000
+			MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1	0x80000000
+			MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2	0x80000000
+			MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3	0x80000000
+		>;
+	};
 
-		pinctrl_power_button: powerbutgrp {
-			fsl,pins = <
-				MX53_PAD_SD2_DATA0__GPIO1_15		0x1e4
-			>;
-		};
+	pinctrl_power_button: powerbutgrp {
+		fsl,pins = <
+			MX53_PAD_SD2_DATA0__GPIO1_15		0x1e4
+		>;
+	};
 
-		pinctrl_power_out: poweroutgrp {
-			fsl,pins = <
-				MX53_PAD_SD2_DATA2__GPIO1_13		0x1e4
-			>;
-		};
+	pinctrl_power_out: poweroutgrp {
+		fsl,pins = <
+			MX53_PAD_SD2_DATA2__GPIO1_13		0x1e4
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
-				MX53_PAD_PATA_IORDY__UART1_RTS		0x1e4
-				MX53_PAD_PATA_RESET_B__UART1_CTS	0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
+			MX53_PAD_PATA_IORDY__UART1_RTS		0x1e4
+			MX53_PAD_PATA_RESET_B__UART1_CTS	0x1e4
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DIOR__UART2_RTS		0x1e4
-				MX53_PAD_PATA_INTRQ__UART2_CTS		0x1e4
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DIOR__UART2_RTS		0x1e4
+			MX53_PAD_PATA_INTRQ__UART2_CTS		0x1e4
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
-				MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
+			MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
+		>;
+	};
 
-		pinctrl_usb: usbgrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_2__GPIO1_2		0x1c4
-				MX53_PAD_GPIO_3__USBOH3_USBH1_OC	0x1c4
-				MX53_PAD_GPIO_4__GPIO1_4		0x1c4
-				MX53_PAD_GPIO_18__GPIO7_13		0x1c4
-			>;
-		};
+	pinctrl_usb: usbgrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_2__GPIO1_2		0x1c4
+			MX53_PAD_GPIO_3__USBOH3_USBH1_OC	0x1c4
+			MX53_PAD_GPIO_4__GPIO1_4		0x1c4
+			MX53_PAD_GPIO_18__GPIO7_13		0x1c4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
index 0d336cbdb4513..c14eb7280f09e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
@@ -75,71 +75,65 @@ &ldb {
 };
 
 &iomuxc {
-	lvds1 {
-		pinctrl_lvds1_1: lvds1-grp1 {
-			fsl,pins = <
-				MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3 0x80000000
-				MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK 0x80000000
-				MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2 0x80000000
-				MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1 0x80000000
-				MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0 0x80000000
-			>;
-		};
+	pinctrl_lvds1_1: lvds1-1-grp {
+		fsl,pins = <
+			MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3 0x80000000
+			MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK 0x80000000
+			MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2 0x80000000
+			MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1 0x80000000
+			MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0 0x80000000
+		>;
+	};
 
-		pinctrl_lvds1_2: lvds1-grp2 {
-			fsl,pins = <
-				MX53_PAD_LVDS1_TX3_P__LDB_LVDS1_TX3 0x80000000
-				MX53_PAD_LVDS1_TX2_P__LDB_LVDS1_TX2 0x80000000
-				MX53_PAD_LVDS1_CLK_P__LDB_LVDS1_CLK 0x80000000
-				MX53_PAD_LVDS1_TX1_P__LDB_LVDS1_TX1 0x80000000
-				MX53_PAD_LVDS1_TX0_P__LDB_LVDS1_TX0 0x80000000
-			>;
-		};
+	pinctrl_lvds1_2: lvds1-2-grp {
+		fsl,pins = <
+			MX53_PAD_LVDS1_TX3_P__LDB_LVDS1_TX3 0x80000000
+			MX53_PAD_LVDS1_TX2_P__LDB_LVDS1_TX2 0x80000000
+			MX53_PAD_LVDS1_CLK_P__LDB_LVDS1_CLK 0x80000000
+			MX53_PAD_LVDS1_TX1_P__LDB_LVDS1_TX1 0x80000000
+			MX53_PAD_LVDS1_TX0_P__LDB_LVDS1_TX0 0x80000000
+		>;
 	};
 
-	disp1 {
-		pinctrl_disp1_1: disp1-grp1 {
-			fsl,pins = <
-				MX53_PAD_EIM_A16__IPU_DI1_DISP_CLK 0x80000000 /* DISP1_CLK */
-				MX53_PAD_EIM_DA10__IPU_DI1_PIN15   0x80000000 /* DISP1_DRDY */
-				MX53_PAD_EIM_D23__IPU_DI1_PIN2     0x80000000 /* DISP1_HSYNC */
-				MX53_PAD_EIM_EB3__IPU_DI1_PIN3     0x80000000 /* DISP1_VSYNC */
-				MX53_PAD_EIM_D26__IPU_DISP1_DAT_22 0x80000000
-				MX53_PAD_EIM_D27__IPU_DISP1_DAT_23 0x80000000
-				MX53_PAD_EIM_D30__IPU_DISP1_DAT_21 0x80000000
-				MX53_PAD_EIM_D31__IPU_DISP1_DAT_20 0x80000000
-				MX53_PAD_EIM_A24__IPU_DISP1_DAT_19 0x80000000
-				MX53_PAD_EIM_A23__IPU_DISP1_DAT_18 0x80000000
-				MX53_PAD_EIM_A22__IPU_DISP1_DAT_17 0x80000000
-				MX53_PAD_EIM_A21__IPU_DISP1_DAT_16 0x80000000
-				MX53_PAD_EIM_A20__IPU_DISP1_DAT_15 0x80000000
-				MX53_PAD_EIM_A19__IPU_DISP1_DAT_14 0x80000000
-				MX53_PAD_EIM_A18__IPU_DISP1_DAT_13 0x80000000
-				MX53_PAD_EIM_A17__IPU_DISP1_DAT_12 0x80000000
-				MX53_PAD_EIM_EB0__IPU_DISP1_DAT_11 0x80000000
-				MX53_PAD_EIM_EB1__IPU_DISP1_DAT_10 0x80000000
-				MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9  0x80000000
-				MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8  0x80000000
-				MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7  0x80000000
-				MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6  0x80000000
-				MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5  0x80000000
-				MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4  0x80000000
-				MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3  0x80000000
-				MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2  0x80000000
-				MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1  0x80000000
-				MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0  0x80000000
-			>;
-		};
+	pinctrl_disp1_1: disp1-1-grp {
+		fsl,pins = <
+			MX53_PAD_EIM_A16__IPU_DI1_DISP_CLK 0x80000000 /* DISP1_CLK */
+			MX53_PAD_EIM_DA10__IPU_DI1_PIN15   0x80000000 /* DISP1_DRDY */
+			MX53_PAD_EIM_D23__IPU_DI1_PIN2     0x80000000 /* DISP1_HSYNC */
+			MX53_PAD_EIM_EB3__IPU_DI1_PIN3     0x80000000 /* DISP1_VSYNC */
+			MX53_PAD_EIM_D26__IPU_DISP1_DAT_22 0x80000000
+			MX53_PAD_EIM_D27__IPU_DISP1_DAT_23 0x80000000
+			MX53_PAD_EIM_D30__IPU_DISP1_DAT_21 0x80000000
+			MX53_PAD_EIM_D31__IPU_DISP1_DAT_20 0x80000000
+			MX53_PAD_EIM_A24__IPU_DISP1_DAT_19 0x80000000
+			MX53_PAD_EIM_A23__IPU_DISP1_DAT_18 0x80000000
+			MX53_PAD_EIM_A22__IPU_DISP1_DAT_17 0x80000000
+			MX53_PAD_EIM_A21__IPU_DISP1_DAT_16 0x80000000
+			MX53_PAD_EIM_A20__IPU_DISP1_DAT_15 0x80000000
+			MX53_PAD_EIM_A19__IPU_DISP1_DAT_14 0x80000000
+			MX53_PAD_EIM_A18__IPU_DISP1_DAT_13 0x80000000
+			MX53_PAD_EIM_A17__IPU_DISP1_DAT_12 0x80000000
+			MX53_PAD_EIM_EB0__IPU_DISP1_DAT_11 0x80000000
+			MX53_PAD_EIM_EB1__IPU_DISP1_DAT_10 0x80000000
+			MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9  0x80000000
+			MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8  0x80000000
+			MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7  0x80000000
+			MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6  0x80000000
+			MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5  0x80000000
+			MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4  0x80000000
+			MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3  0x80000000
+			MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2  0x80000000
+			MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1  0x80000000
+			MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0  0x80000000
+		>;
 	};
 
-	tve {
-		pinctrl_vga_sync_1: vgasync-grp1 {
-			fsl,pins = <
-				/* VGA_VSYNC, HSYNC with max drive strength */
-				MX53_PAD_EIM_CS1__IPU_DI1_PIN6	   0xe6
-				MX53_PAD_EIM_DA15__IPU_DI1_PIN4	   0xe6
-			>;
-		};
+	pinctrl_vga_sync_1: vgasync-1-grp {
+		fsl,pins = <
+			/* VGA_VSYNC, HSYNC with max drive strength */
+			MX53_PAD_EIM_CS1__IPU_DI1_PIN6	   0xe6
+			MX53_PAD_EIM_DA15__IPU_DI1_PIN4	   0xe6
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
index 05d7a462ea25a..1869ad86baf20 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
@@ -170,157 +170,155 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-qsb {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_8__GPIO1_8          0x80000000
-				MX53_PAD_PATA_DATA14__GPIO2_14    0x80000000
-				MX53_PAD_PATA_DATA15__GPIO2_15    0x80000000
-				MX53_PAD_EIM_DA11__GPIO3_11       0x80000000
-				MX53_PAD_EIM_DA12__GPIO3_12       0x80000000
-				MX53_PAD_PATA_DA_0__GPIO7_6       0x80000000
-				MX53_PAD_PATA_DA_2__GPIO7_8	  0x80000000
-				MX53_PAD_GPIO_16__GPIO7_11        0x80000000
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_8__GPIO1_8          0x80000000
+			MX53_PAD_PATA_DATA14__GPIO2_14    0x80000000
+			MX53_PAD_PATA_DATA15__GPIO2_15    0x80000000
+			MX53_PAD_EIM_DA11__GPIO3_11       0x80000000
+			MX53_PAD_EIM_DA12__GPIO3_12       0x80000000
+			MX53_PAD_PATA_DA_0__GPIO7_6       0x80000000
+			MX53_PAD_PATA_DA_2__GPIO7_8	  0x80000000
+			MX53_PAD_GPIO_16__GPIO7_11        0x80000000
+		>;
+	};
 
-		led_pin_gpio7_7: led_gpio7_7 {
-			fsl,pins = <
-				MX53_PAD_PATA_DA_1__GPIO7_7 0x80000000
-			>;
-		};
+	led_pin_gpio7_7: led_gpio7-7-grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DA_1__GPIO7_7 0x80000000
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
-				MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
-				MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
-				MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
+			MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
+			MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
+			MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
+		>;
+	};
 
-		pinctrl_codec: codecgrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK	0x1c4
-			>;
-		};
+	pinctrl_codec: codecgrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK	0x1c4
+		>;
+	};
 
-		pinctrl_display_power: displaypowergrp {
-			fsl,pins = <
-				MX53_PAD_EIM_D24__GPIO3_24		0x1e4
-			>;
-		};
+	pinctrl_display_power: displaypowergrp {
+		fsl,pins = <
+			MX53_PAD_EIM_D24__GPIO3_24		0x1e4
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
-				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
-				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
-				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
-				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
-				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
-				MX53_PAD_EIM_DA13__GPIO3_13		0xe4
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
+			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
+			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
+			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
+			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
+			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
+			MX53_PAD_EIM_DA13__GPIO3_13		0xe4
+		>;
+	};
 
-		pinctrl_esdhc3: esdhc3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DATA8__ESDHC3_DAT0	0x1d5
-				MX53_PAD_PATA_DATA9__ESDHC3_DAT1	0x1d5
-				MX53_PAD_PATA_DATA10__ESDHC3_DAT2	0x1d5
-				MX53_PAD_PATA_DATA11__ESDHC3_DAT3	0x1d5
-				MX53_PAD_PATA_DATA0__ESDHC3_DAT4	0x1d5
-				MX53_PAD_PATA_DATA1__ESDHC3_DAT5	0x1d5
-				MX53_PAD_PATA_DATA2__ESDHC3_DAT6	0x1d5
-				MX53_PAD_PATA_DATA3__ESDHC3_DAT7	0x1d5
-				MX53_PAD_PATA_RESET_B__ESDHC3_CMD	0x1d5
-				MX53_PAD_PATA_IORDY__ESDHC3_CLK		0x1d5
-			>;
-		};
+	pinctrl_esdhc3: esdhc3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DATA8__ESDHC3_DAT0	0x1d5
+			MX53_PAD_PATA_DATA9__ESDHC3_DAT1	0x1d5
+			MX53_PAD_PATA_DATA10__ESDHC3_DAT2	0x1d5
+			MX53_PAD_PATA_DATA11__ESDHC3_DAT3	0x1d5
+			MX53_PAD_PATA_DATA0__ESDHC3_DAT4	0x1d5
+			MX53_PAD_PATA_DATA1__ESDHC3_DAT5	0x1d5
+			MX53_PAD_PATA_DATA2__ESDHC3_DAT6	0x1d5
+			MX53_PAD_PATA_DATA3__ESDHC3_DAT7	0x1d5
+			MX53_PAD_PATA_RESET_B__ESDHC3_CMD	0x1d5
+			MX53_PAD_PATA_IORDY__ESDHC3_CLK		0x1d5
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x4
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x1fc
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x180
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x180
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x180
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x180
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x180
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x4
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x4
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x4
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x4
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x1fc
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x180
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x180
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x180
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x180
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x180
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x4
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x4
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x4
+		>;
+	};
 
-		/* open drain */
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT8__I2C1_SDA		0x400001ec
-				MX53_PAD_CSI0_DAT9__I2C1_SCL		0x400001ec
-			>;
-		};
+	/* open drain */
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT8__I2C1_SDA		0x400001ec
+			MX53_PAD_CSI0_DAT9__I2C1_SCL		0x400001ec
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_ROW3__I2C2_SDA		0xc0000000
-				MX53_PAD_KEY_COL3__I2C2_SCL		0xc0000000
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_ROW3__I2C2_SDA		0xc0000000
+			MX53_PAD_KEY_COL3__I2C2_SCL		0xc0000000
+		>;
+	};
 
-		pinctrl_ipu_disp0: ipudisp0grp {
-			fsl,pins = <
-				MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK	0x5
-				MX53_PAD_DI0_PIN15__IPU_DI0_PIN15	0x5
-				MX53_PAD_DI0_PIN2__IPU_DI0_PIN2		0x5
-				MX53_PAD_DI0_PIN3__IPU_DI0_PIN3		0x5
-				MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0	0x5
-				MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1	0x5
-				MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2	0x5
-				MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3	0x5
-				MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4	0x5
-				MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5	0x5
-				MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6	0x5
-				MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7	0x5
-				MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8	0x5
-				MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9	0x5
-				MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10	0x5
-				MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11	0x5
-				MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12	0x5
-				MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13	0x5
-				MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14	0x5
-				MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15	0x5
-				MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16	0x5
-				MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17	0x5
-				MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18	0x5
-				MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19	0x5
-				MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20	0x5
-				MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21	0x5
-				MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22	0x5
-				MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23	0x5
-			>;
-		};
+	pinctrl_ipu_disp0: ipudisp0grp {
+		fsl,pins = <
+			MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK	0x5
+			MX53_PAD_DI0_PIN15__IPU_DI0_PIN15	0x5
+			MX53_PAD_DI0_PIN2__IPU_DI0_PIN2		0x5
+			MX53_PAD_DI0_PIN3__IPU_DI0_PIN3		0x5
+			MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0	0x5
+			MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1	0x5
+			MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2	0x5
+			MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3	0x5
+			MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4	0x5
+			MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5	0x5
+			MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6	0x5
+			MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7	0x5
+			MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8	0x5
+			MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9	0x5
+			MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10	0x5
+			MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11	0x5
+			MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12	0x5
+			MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13	0x5
+			MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14	0x5
+			MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15	0x5
+			MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16	0x5
+			MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17	0x5
+			MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18	0x5
+			MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19	0x5
+			MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20	0x5
+			MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21	0x5
+			MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22	0x5
+			MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23	0x5
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_1__PWM2_PWMO		0x5
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_1__PWM2_PWMO		0x5
+		>;
+	};
 
-		pinctrl_vga_sync: vgasync-grp {
-			fsl,pins = <
-				/* VGA_HSYNC, VSYNC with max drive strength */
-				MX53_PAD_EIM_OE__IPU_DI1_PIN7 0xe6
-				MX53_PAD_EIM_RW__IPU_DI1_PIN8 0xe6
-			>;
-		};
+	pinctrl_vga_sync: vgasync-grp {
+		fsl,pins = <
+			/* VGA_HSYNC, VSYNC with max drive strength */
+			MX53_PAD_EIM_OE__IPU_DI1_PIN7 0xe6
+			MX53_PAD_EIM_RW__IPU_DI1_PIN8 0xe6
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
-				MX53_PAD_CSI0_DAT11__UART1_RXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
+			MX53_PAD_CSI0_DAT11__UART1_RXD_MUX	0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 1bbf24ad308a1..2f06ad61a7665 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -13,12 +13,10 @@ / {
 };
 
 &iomuxc {
-	imx53-qsrb {
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT5__GPIO5_23	0x1c4 /* IRQ */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT5__GPIO5_23	0x1c4 /* IRQ */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index 55435dfdff8aa..386371c816f4d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -98,140 +98,138 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-smd {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX53_PAD_PATA_DATA14__GPIO2_14 0x80000000
-				MX53_PAD_PATA_DATA15__GPIO2_15 0x80000000
-				MX53_PAD_EIM_EB2__GPIO2_30     0x80000000
-				MX53_PAD_EIM_DA13__GPIO3_13    0x80000000
-				MX53_PAD_EIM_D19__GPIO3_19     0x80000000
-				MX53_PAD_KEY_ROW2__GPIO4_11    0x80000000
-				MX53_PAD_PATA_DA_0__GPIO7_6    0x80000000
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX53_PAD_PATA_DATA14__GPIO2_14 0x80000000
+			MX53_PAD_PATA_DATA15__GPIO2_15 0x80000000
+			MX53_PAD_EIM_EB2__GPIO2_30     0x80000000
+			MX53_PAD_EIM_DA13__GPIO3_13    0x80000000
+			MX53_PAD_EIM_D19__GPIO3_19     0x80000000
+			MX53_PAD_KEY_ROW2__GPIO4_11    0x80000000
+			MX53_PAD_PATA_DA_0__GPIO7_6    0x80000000
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
-				MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
-				MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
+			MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
+			MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
-				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
-				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
-				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
-				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
-				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
+			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
+			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
+			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
+			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
+			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
+		>;
+	};
 
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
-				MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
-				MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
-				MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
-				MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
-				MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
-			>;
-		};
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
+			MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
+			MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
+			MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
+			MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
+			MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
+		>;
+	};
 
-		pinctrl_esdhc3: esdhc3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DATA8__ESDHC3_DAT0	0x1d5
-				MX53_PAD_PATA_DATA9__ESDHC3_DAT1	0x1d5
-				MX53_PAD_PATA_DATA10__ESDHC3_DAT2	0x1d5
-				MX53_PAD_PATA_DATA11__ESDHC3_DAT3	0x1d5
-				MX53_PAD_PATA_DATA0__ESDHC3_DAT4	0x1d5
-				MX53_PAD_PATA_DATA1__ESDHC3_DAT5	0x1d5
-				MX53_PAD_PATA_DATA2__ESDHC3_DAT6	0x1d5
-				MX53_PAD_PATA_DATA3__ESDHC3_DAT7	0x1d5
-				MX53_PAD_PATA_RESET_B__ESDHC3_CMD	0x1d5
-				MX53_PAD_PATA_IORDY__ESDHC3_CLK		0x1d5
-			>;
-		};
+	pinctrl_esdhc3: esdhc3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DATA8__ESDHC3_DAT0	0x1d5
+			MX53_PAD_PATA_DATA9__ESDHC3_DAT1	0x1d5
+			MX53_PAD_PATA_DATA10__ESDHC3_DAT2	0x1d5
+			MX53_PAD_PATA_DATA11__ESDHC3_DAT3	0x1d5
+			MX53_PAD_PATA_DATA0__ESDHC3_DAT4	0x1d5
+			MX53_PAD_PATA_DATA1__ESDHC3_DAT5	0x1d5
+			MX53_PAD_PATA_DATA2__ESDHC3_DAT6	0x1d5
+			MX53_PAD_PATA_DATA3__ESDHC3_DAT7	0x1d5
+			MX53_PAD_PATA_RESET_B__ESDHC3_CMD	0x1d5
+			MX53_PAD_PATA_IORDY__ESDHC3_CLK		0x1d5
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT8__I2C1_SDA		0xc0000000
-				MX53_PAD_CSI0_DAT9__I2C1_SCL		0xc0000000
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT8__I2C1_SDA		0xc0000000
+			MX53_PAD_CSI0_DAT9__I2C1_SCL		0xc0000000
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_ROW3__I2C2_SDA		0xc0000000
-				MX53_PAD_KEY_COL3__I2C2_SCL		0xc0000000
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_ROW3__I2C2_SDA		0xc0000000
+			MX53_PAD_KEY_COL3__I2C2_SCL		0xc0000000
+		>;
+	};
 
-		pinctrl_ipu_csi0: ipucsi0grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT12__IPU_CSI0_D_12    0x1c4
-				MX53_PAD_CSI0_DAT13__IPU_CSI0_D_13    0x1c4
-				MX53_PAD_CSI0_DAT14__IPU_CSI0_D_14    0x1c4
-				MX53_PAD_CSI0_DAT15__IPU_CSI0_D_15    0x1c4
-				MX53_PAD_CSI0_DAT16__IPU_CSI0_D_16    0x1c4
-				MX53_PAD_CSI0_DAT17__IPU_CSI0_D_17    0x1c4
-				MX53_PAD_CSI0_DAT18__IPU_CSI0_D_18    0x1c4
-				MX53_PAD_CSI0_DAT19__IPU_CSI0_D_19    0x1c4
-				MX53_PAD_CSI0_PIXCLK__IPU_CSI0_PIXCLK 0x1e4
-				MX53_PAD_CSI0_VSYNC__IPU_CSI0_VSYNC   0x1e4
-				MX53_PAD_CSI0_MCLK__IPU_CSI0_HSYNC    0x1e4
-				MX53_PAD_CSI0_DATA_EN__IPU_CSI0_DATA_EN 0x1e4
-			>;
-		};
+	pinctrl_ipu_csi0: ipucsi0grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT12__IPU_CSI0_D_12    0x1c4
+			MX53_PAD_CSI0_DAT13__IPU_CSI0_D_13    0x1c4
+			MX53_PAD_CSI0_DAT14__IPU_CSI0_D_14    0x1c4
+			MX53_PAD_CSI0_DAT15__IPU_CSI0_D_15    0x1c4
+			MX53_PAD_CSI0_DAT16__IPU_CSI0_D_16    0x1c4
+			MX53_PAD_CSI0_DAT17__IPU_CSI0_D_17    0x1c4
+			MX53_PAD_CSI0_DAT18__IPU_CSI0_D_18    0x1c4
+			MX53_PAD_CSI0_DAT19__IPU_CSI0_D_19    0x1c4
+			MX53_PAD_CSI0_PIXCLK__IPU_CSI0_PIXCLK 0x1e4
+			MX53_PAD_CSI0_VSYNC__IPU_CSI0_VSYNC   0x1e4
+			MX53_PAD_CSI0_MCLK__IPU_CSI0_HSYNC    0x1e4
+			MX53_PAD_CSI0_DATA_EN__IPU_CSI0_DATA_EN 0x1e4
+		>;
+	};
 
-		pinctrl_ov5642: ov5642grp {
-			fsl,pins = <
-				MX53_PAD_NANDF_WP_B__GPIO6_9   0x1e4
-				MX53_PAD_NANDF_RB0__GPIO6_10   0x1e4
-				MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK 0x1c4
-			>;
-		};
+	pinctrl_ov5642: ov5642grp {
+		fsl,pins = <
+			MX53_PAD_NANDF_WP_B__GPIO6_9   0x1e4
+			MX53_PAD_NANDF_RB0__GPIO6_10   0x1e4
+			MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK 0x1c4
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
-				MX53_PAD_CSI0_DAT11__UART1_RXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
+			MX53_PAD_CSI0_DAT11__UART1_RXD_MUX	0x1e4
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
-				MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DA_1__UART3_CTS		0x1e4
-				MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
+			MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DA_1__UART3_CTS		0x1e4
+			MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
index c34ee84bd7167..0f0245df380fc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
@@ -61,144 +61,142 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-tqma53 {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				 MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK 0x80000000 /* SSI_MCLK */
-				 MX53_PAD_PATA_DA_1__GPIO7_7     0x80000000 /* LCD_BLT_EN */
-				 MX53_PAD_PATA_DA_2__GPIO7_8     0x80000000 /* LCD_RESET */
-				 MX53_PAD_PATA_DATA5__GPIO2_5    0x80000000 /* LCD_POWER */
-				 MX53_PAD_PATA_DATA6__GPIO2_6    0x80000000 /* PMIC_INT */
-				 MX53_PAD_PATA_DATA14__GPIO2_14  0x80000000 /* CSI_RST */
-				 MX53_PAD_PATA_DATA15__GPIO2_15  0x80000000 /* CSI_PWDN */
-				 MX53_PAD_GPIO_19__GPIO4_5 	 0x80000000 /* #SYSTEM_DOWN */
-				 MX53_PAD_GPIO_3__GPIO1_3        0x80000000
-				 MX53_PAD_PATA_DA_0__GPIO7_6	 0x80000000 /* #PHY_RESET */
-				 MX53_PAD_GPIO_1__PWM2_PWMO	 0x80000000 /* LCD_CONTRAST */
-			>;
-		};
-
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
-				MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
-				MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
-				MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
-			>;
-		};
-
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL2__CAN1_TXCAN		0x80000000
-				MX53_PAD_KEY_ROW2__CAN1_RXCAN		0x80000000
-			>;
-		};
-
-		pinctrl_can2: can2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL4__CAN2_TXCAN		0x80000000
-				MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x80000000
-			>;
-		};
-
-		pinctrl_cspi: cspigrp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__CSPI_MISO		0x1d5
-				MX53_PAD_SD1_CMD__CSPI_MOSI		0x1d5
-				MX53_PAD_SD1_CLK__CSPI_SCLK		0x1d5
-			>;
-		};
-
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
-				MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
-				MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
-			>;
-		};
-
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
-				MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
-				MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
-				MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
-				MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
-				MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
-			>;
-		};
-
-		pinctrl_esdhc2_cdwp: esdhc2cdwp {
-			fsl,pins = <
-				MX53_PAD_GPIO_4__GPIO1_4	0x80000000 /* SD2_CD */
-				MX53_PAD_GPIO_2__GPIO1_2	0x80000000 /* SD2_WP */
-			>;
-		};
-
-		pinctrl_esdhc3: esdhc3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DATA8__ESDHC3_DAT0	0x1d5
-				MX53_PAD_PATA_DATA9__ESDHC3_DAT1	0x1d5
-				MX53_PAD_PATA_DATA10__ESDHC3_DAT2	0x1d5
-				MX53_PAD_PATA_DATA11__ESDHC3_DAT3	0x1d5
-				MX53_PAD_PATA_DATA0__ESDHC3_DAT4	0x1d5
-				MX53_PAD_PATA_DATA1__ESDHC3_DAT5	0x1d5
-				MX53_PAD_PATA_DATA2__ESDHC3_DAT6	0x1d5
-				MX53_PAD_PATA_DATA3__ESDHC3_DAT7	0x1d5
-				MX53_PAD_PATA_RESET_B__ESDHC3_CMD	0x1d5
-				MX53_PAD_PATA_IORDY__ESDHC3_CLK		0x1d5
-			>;
-		};
-
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
-			>;
-		};
-
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_ROW3__I2C2_SDA		0xc0000000
-				MX53_PAD_KEY_COL3__I2C2_SCL		0xc0000000
-			>;
-		};
-
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_6__I2C3_SDA		0xc0000000
-				MX53_PAD_GPIO_5__I2C3_SCL		0xc0000000
-			>;
-		};
-
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
-			>;
-		};
-
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
-			>;
-		};
-
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
-				MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			 MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK 0x80000000 /* SSI_MCLK */
+			 MX53_PAD_PATA_DA_1__GPIO7_7     0x80000000 /* LCD_BLT_EN */
+			 MX53_PAD_PATA_DA_2__GPIO7_8     0x80000000 /* LCD_RESET */
+			 MX53_PAD_PATA_DATA5__GPIO2_5    0x80000000 /* LCD_POWER */
+			 MX53_PAD_PATA_DATA6__GPIO2_6    0x80000000 /* PMIC_INT */
+			 MX53_PAD_PATA_DATA14__GPIO2_14  0x80000000 /* CSI_RST */
+			 MX53_PAD_PATA_DATA15__GPIO2_15  0x80000000 /* CSI_PWDN */
+			 MX53_PAD_GPIO_19__GPIO4_5 	 0x80000000 /* #SYSTEM_DOWN */
+			 MX53_PAD_GPIO_3__GPIO1_3        0x80000000
+			 MX53_PAD_PATA_DA_0__GPIO7_6	 0x80000000 /* #PHY_RESET */
+			 MX53_PAD_GPIO_1__PWM2_PWMO	 0x80000000 /* LCD_CONTRAST */
+		>;
+	};
+
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
+			MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
+			MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
+			MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
+		>;
+	};
+
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL2__CAN1_TXCAN		0x80000000
+			MX53_PAD_KEY_ROW2__CAN1_RXCAN		0x80000000
+		>;
+	};
+
+	pinctrl_can2: can2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL4__CAN2_TXCAN		0x80000000
+			MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x80000000
+		>;
+	};
+
+	pinctrl_cspi: cspigrp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__CSPI_MISO		0x1d5
+			MX53_PAD_SD1_CMD__CSPI_MOSI		0x1d5
+			MX53_PAD_SD1_CLK__CSPI_SCLK		0x1d5
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
+			MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
+			MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
+		>;
+	};
+
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
+			MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
+			MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
+			MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
+			MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
+			MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
+		>;
+	};
+
+	pinctrl_esdhc2_cdwp: esdhc2cdwpgrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_4__GPIO1_4	0x80000000 /* SD2_CD */
+			MX53_PAD_GPIO_2__GPIO1_2	0x80000000 /* SD2_WP */
+		>;
+	};
+
+	pinctrl_esdhc3: esdhc3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DATA8__ESDHC3_DAT0	0x1d5
+			MX53_PAD_PATA_DATA9__ESDHC3_DAT1	0x1d5
+			MX53_PAD_PATA_DATA10__ESDHC3_DAT2	0x1d5
+			MX53_PAD_PATA_DATA11__ESDHC3_DAT3	0x1d5
+			MX53_PAD_PATA_DATA0__ESDHC3_DAT4	0x1d5
+			MX53_PAD_PATA_DATA1__ESDHC3_DAT5	0x1d5
+			MX53_PAD_PATA_DATA2__ESDHC3_DAT6	0x1d5
+			MX53_PAD_PATA_DATA3__ESDHC3_DAT7	0x1d5
+			MX53_PAD_PATA_RESET_B__ESDHC3_CMD	0x1d5
+			MX53_PAD_PATA_IORDY__ESDHC3_CLK		0x1d5
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_ROW3__I2C2_SDA		0xc0000000
+			MX53_PAD_KEY_COL3__I2C2_SCL		0xc0000000
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_6__I2C3_SDA		0xc0000000
+			MX53_PAD_GPIO_5__I2C3_SCL		0xc0000000
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1e4
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
+			MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
index a02d77bb56725..5f62c99909c59 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
@@ -262,66 +262,64 @@ touchscreen: tsc2007@48 {
 };
 
 &iomuxc {
-	imx53-tx53-x03x {
-		pinctrl_edt_ft5x06_1: edt-ft5x06grp-1 {
-			fsl,pins = <
-				MX53_PAD_NANDF_CS2__GPIO6_15 0x1f0 /* Interrupt */
-				MX53_PAD_EIM_A16__GPIO2_22   0x04 /* Reset */
-				MX53_PAD_EIM_A17__GPIO2_21   0x04 /* Wake */
-			>;
-		};
+	pinctrl_edt_ft5x06_1: edt-ft5x06-1-grp {
+		fsl,pins = <
+			MX53_PAD_NANDF_CS2__GPIO6_15 0x1f0 /* Interrupt */
+			MX53_PAD_EIM_A16__GPIO2_22   0x04 /* Reset */
+			MX53_PAD_EIM_A17__GPIO2_21   0x04 /* Wake */
+		>;
+	};
 
-		pinctrl_kpp: kppgrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_9__KPP_COL_6 0x1f4
-				MX53_PAD_GPIO_4__KPP_COL_7 0x1f4
-				MX53_PAD_KEY_COL2__KPP_COL_2 0x1f4
-				MX53_PAD_KEY_COL3__KPP_COL_3 0x1f4
-				MX53_PAD_GPIO_2__KPP_ROW_6 0x1f4
-				MX53_PAD_GPIO_5__KPP_ROW_7 0x1f4
-				MX53_PAD_KEY_ROW2__KPP_ROW_2 0x1f4
-				MX53_PAD_KEY_ROW3__KPP_ROW_3 0x1f4
-			>;
-		};
+	pinctrl_kpp: kppgrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_9__KPP_COL_6 0x1f4
+			MX53_PAD_GPIO_4__KPP_COL_7 0x1f4
+			MX53_PAD_KEY_COL2__KPP_COL_2 0x1f4
+			MX53_PAD_KEY_COL3__KPP_COL_3 0x1f4
+			MX53_PAD_GPIO_2__KPP_ROW_6 0x1f4
+			MX53_PAD_GPIO_5__KPP_ROW_7 0x1f4
+			MX53_PAD_KEY_ROW2__KPP_ROW_2 0x1f4
+			MX53_PAD_KEY_ROW3__KPP_ROW_3 0x1f4
+		>;
+	};
 
-		pinctrl_rgb24_vga1: rgb24-vgagrp1 {
-			fsl,pins = <
-				MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK		0x5
-				MX53_PAD_DI0_PIN15__IPU_DI0_PIN15		0x5
-				MX53_PAD_DI0_PIN2__IPU_DI0_PIN2			0x5
-				MX53_PAD_DI0_PIN3__IPU_DI0_PIN3			0x5
-				MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0		0x5
-				MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1		0x5
-				MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2		0x5
-				MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3		0x5
-				MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4		0x5
-				MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5		0x5
-				MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6		0x5
-				MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7		0x5
-				MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8		0x5
-				MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9		0x5
-				MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10		0x5
-				MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11		0x5
-				MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12		0x5
-				MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13		0x5
-				MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14		0x5
-				MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15		0x5
-				MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16		0x5
-				MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17		0x5
-				MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18		0x5
-				MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19		0x5
-				MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20		0x5
-				MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21		0x5
-				MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22		0x5
-				MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23		0x5
-			>;
-		};
+	pinctrl_rgb24_vga1: rgb24-vga1grp {
+		fsl,pins = <
+			MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK		0x5
+			MX53_PAD_DI0_PIN15__IPU_DI0_PIN15		0x5
+			MX53_PAD_DI0_PIN2__IPU_DI0_PIN2			0x5
+			MX53_PAD_DI0_PIN3__IPU_DI0_PIN3			0x5
+			MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0		0x5
+			MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1		0x5
+			MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2		0x5
+			MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3		0x5
+			MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4		0x5
+			MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5		0x5
+			MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6		0x5
+			MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7		0x5
+			MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8		0x5
+			MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9		0x5
+			MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10		0x5
+			MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11		0x5
+			MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12		0x5
+			MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13		0x5
+			MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14		0x5
+			MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15		0x5
+			MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16		0x5
+			MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17		0x5
+			MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18		0x5
+			MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19		0x5
+			MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20		0x5
+			MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21		0x5
+			MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22		0x5
+			MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23		0x5
+		>;
+	};
 
-		pinctrl_tsc2007: tsc2007grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D26__GPIO3_26 0x1f0 /* Interrupt */
-			>;
-		};
+	pinctrl_tsc2007: tsc2007grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D26__GPIO3_26 0x1f0 /* Interrupt */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts
index e10c179dbdb39..9c9122da3737a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts
@@ -139,42 +139,40 @@ sgtl5000: codec@a {
 };
 
 &iomuxc {
-	imx53-tx53-x13x {
-		pinctrl_lvds0: lvds0grp {
-			fsl,pins = <
-				MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3 0x80000000
-				MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK 0x80000000
-				MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2 0x80000000
-				MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1 0x80000000
-				MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0 0x80000000
-			>;
-		};
+	pinctrl_lvds0: lvds0grp {
+		fsl,pins = <
+			MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3 0x80000000
+			MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK 0x80000000
+			MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2 0x80000000
+			MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1 0x80000000
+			MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0 0x80000000
+		>;
+	};
 
-		pinctrl_lvds1: lvds1grp {
-			fsl,pins = <
-				MX53_PAD_LVDS1_TX3_P__LDB_LVDS1_TX3 0x80000000
-				MX53_PAD_LVDS1_TX2_P__LDB_LVDS1_TX2 0x80000000
-				MX53_PAD_LVDS1_CLK_P__LDB_LVDS1_CLK 0x80000000
-				MX53_PAD_LVDS1_TX1_P__LDB_LVDS1_TX1 0x80000000
-				MX53_PAD_LVDS1_TX0_P__LDB_LVDS1_TX0 0x80000000
-			>;
-		};
+	pinctrl_lvds1: lvds1grp {
+		fsl,pins = <
+			MX53_PAD_LVDS1_TX3_P__LDB_LVDS1_TX3 0x80000000
+			MX53_PAD_LVDS1_TX2_P__LDB_LVDS1_TX2 0x80000000
+			MX53_PAD_LVDS1_CLK_P__LDB_LVDS1_CLK 0x80000000
+			MX53_PAD_LVDS1_TX1_P__LDB_LVDS1_TX1 0x80000000
+			MX53_PAD_LVDS1_TX0_P__LDB_LVDS1_TX0 0x80000000
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <MX53_PAD_GPIO_9__PWM1_PWMO 0x04>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <MX53_PAD_GPIO_9__PWM1_PWMO 0x04>;
+	};
 
-		pinctrl_eeti1: eeti1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D22__GPIO3_22 0x1f0 /* Interrupt */
-			>;
-		};
+	pinctrl_eeti1: eeti1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D22__GPIO3_22 0x1f0 /* Interrupt */
+		>;
+	};
 
-		pinctrl_eeti2: eeti2grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D23__GPIO3_23 0x1f0 /* Interrupt */
-			>;
-		};
+	pinctrl_eeti2: eeti2grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D23__GPIO3_23 0x1f0 /* Interrupt */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi
index a439a47fb65ac..29e3f5f37c25d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi
@@ -257,261 +257,259 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-tx53 {
-		pinctrl_hog: hoggrp {
-			/* pins not in use by any device on the Starterkit board series */
-			fsl,pins = <
-				/* CMOS Sensor Interface */
-				MX53_PAD_CSI0_DAT12__GPIO5_30 0x1f4
-				MX53_PAD_CSI0_DAT13__GPIO5_31 0x1f4
-				MX53_PAD_CSI0_DAT14__GPIO6_0 0x1f4
-				MX53_PAD_CSI0_DAT15__GPIO6_1 0x1f4
-				MX53_PAD_CSI0_DAT16__GPIO6_2 0x1f4
-				MX53_PAD_CSI0_DAT17__GPIO6_3 0x1f4
-				MX53_PAD_CSI0_DAT18__GPIO6_4 0x1f4
-				MX53_PAD_CSI0_DAT19__GPIO6_5 0x1f4
-				MX53_PAD_CSI0_MCLK__GPIO5_19 0x1f4
-				MX53_PAD_CSI0_VSYNC__GPIO5_21 0x1f4
-				MX53_PAD_CSI0_PIXCLK__GPIO5_18 0x1f4
-				MX53_PAD_GPIO_0__GPIO1_0 0x1f4
-				/* Module Specific Signal */
-				/* MX53_PAD_NANDF_CS2__GPIO6_15 0x1f4 maybe used by EDT-FT5x06 */
-				/* MX53_PAD_EIM_A16__GPIO2_22 0x1f4 maybe used by EDT-FT5x06 */
-				MX53_PAD_EIM_D29__GPIO3_29 0x1f4
-				MX53_PAD_EIM_EB3__GPIO2_31 0x1f4
-				/* MX53_PAD_EIM_A17__GPIO2_21 0x1f4 maybe used by EDT-FT5x06 */
-				/* MX53_PAD_EIM_A18__GPIO2_20 0x1f4 used by LED */
-				MX53_PAD_EIM_A19__GPIO2_19 0x1f4
-				MX53_PAD_EIM_A20__GPIO2_18 0x1f4
-				MX53_PAD_EIM_A21__GPIO2_17 0x1f4
-				MX53_PAD_EIM_A22__GPIO2_16 0x1f4
-				MX53_PAD_EIM_A23__GPIO6_6 0x1f4
-				MX53_PAD_EIM_A24__GPIO5_4 0x1f4
-				MX53_PAD_CSI0_DAT8__GPIO5_26 0x1f4
-				MX53_PAD_CSI0_DAT9__GPIO5_27 0x1f4
-				MX53_PAD_CSI0_DAT10__GPIO5_28 0x1f4
-				MX53_PAD_CSI0_DAT11__GPIO5_29 0x1f4
-				/* MX53_PAD_EIM_D22__GPIO3_22 0x1f4 maybe used by EETI touchpanel driver */
-				/* MX53_PAD_EIM_D23__GPIO3_23 0x1f4 maybe used by EETI touchpanel driver */
-				MX53_PAD_GPIO_13__GPIO4_3 0x1f4
-				MX53_PAD_EIM_CS0__GPIO2_23 0x1f4
-				MX53_PAD_EIM_CS1__GPIO2_24 0x1f4
-				MX53_PAD_CSI0_DATA_EN__GPIO5_20 0x1f4
-				MX53_PAD_EIM_WAIT__GPIO5_0 0x1f4
-				MX53_PAD_EIM_EB0__GPIO2_28 0x1f4
-				MX53_PAD_EIM_EB1__GPIO2_29 0x1f4
-				MX53_PAD_EIM_OE__GPIO2_25 0x1f4
-				MX53_PAD_EIM_LBA__GPIO2_27 0x1f4
-				MX53_PAD_EIM_RW__GPIO2_26 0x1f4
-				MX53_PAD_EIM_DA8__GPIO3_8 0x1f4
-				MX53_PAD_EIM_DA9__GPIO3_9 0x1f4
-				MX53_PAD_EIM_DA10__GPIO3_10 0x1f4
-				MX53_PAD_EIM_DA11__GPIO3_11 0x1f4
-				MX53_PAD_EIM_DA12__GPIO3_12 0x1f4
-				MX53_PAD_EIM_DA13__GPIO3_13 0x1f4
-				MX53_PAD_EIM_DA14__GPIO3_14 0x1f4
-				MX53_PAD_EIM_DA15__GPIO3_15 0x1f4
-				>;
-		};
-
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_7__CAN1_TXCAN		0x80000000
-				MX53_PAD_GPIO_8__CAN1_RXCAN		0x80000000
+	pinctrl_hog: hoggrp {
+		/* pins not in use by any device on the Starterkit board series */
+		fsl,pins = <
+			/* CMOS Sensor Interface */
+			MX53_PAD_CSI0_DAT12__GPIO5_30 0x1f4
+			MX53_PAD_CSI0_DAT13__GPIO5_31 0x1f4
+			MX53_PAD_CSI0_DAT14__GPIO6_0 0x1f4
+			MX53_PAD_CSI0_DAT15__GPIO6_1 0x1f4
+			MX53_PAD_CSI0_DAT16__GPIO6_2 0x1f4
+			MX53_PAD_CSI0_DAT17__GPIO6_3 0x1f4
+			MX53_PAD_CSI0_DAT18__GPIO6_4 0x1f4
+			MX53_PAD_CSI0_DAT19__GPIO6_5 0x1f4
+			MX53_PAD_CSI0_MCLK__GPIO5_19 0x1f4
+			MX53_PAD_CSI0_VSYNC__GPIO5_21 0x1f4
+			MX53_PAD_CSI0_PIXCLK__GPIO5_18 0x1f4
+			MX53_PAD_GPIO_0__GPIO1_0 0x1f4
+			/* Module Specific Signal */
+			/* MX53_PAD_NANDF_CS2__GPIO6_15 0x1f4 maybe used by EDT-FT5x06 */
+			/* MX53_PAD_EIM_A16__GPIO2_22 0x1f4 maybe used by EDT-FT5x06 */
+			MX53_PAD_EIM_D29__GPIO3_29 0x1f4
+			MX53_PAD_EIM_EB3__GPIO2_31 0x1f4
+			/* MX53_PAD_EIM_A17__GPIO2_21 0x1f4 maybe used by EDT-FT5x06 */
+			/* MX53_PAD_EIM_A18__GPIO2_20 0x1f4 used by LED */
+			MX53_PAD_EIM_A19__GPIO2_19 0x1f4
+			MX53_PAD_EIM_A20__GPIO2_18 0x1f4
+			MX53_PAD_EIM_A21__GPIO2_17 0x1f4
+			MX53_PAD_EIM_A22__GPIO2_16 0x1f4
+			MX53_PAD_EIM_A23__GPIO6_6 0x1f4
+			MX53_PAD_EIM_A24__GPIO5_4 0x1f4
+			MX53_PAD_CSI0_DAT8__GPIO5_26 0x1f4
+			MX53_PAD_CSI0_DAT9__GPIO5_27 0x1f4
+			MX53_PAD_CSI0_DAT10__GPIO5_28 0x1f4
+			MX53_PAD_CSI0_DAT11__GPIO5_29 0x1f4
+			/* MX53_PAD_EIM_D22__GPIO3_22 0x1f4 maybe used by EETI touchpanel driver */
+			/* MX53_PAD_EIM_D23__GPIO3_23 0x1f4 maybe used by EETI touchpanel driver */
+			MX53_PAD_GPIO_13__GPIO4_3 0x1f4
+			MX53_PAD_EIM_CS0__GPIO2_23 0x1f4
+			MX53_PAD_EIM_CS1__GPIO2_24 0x1f4
+			MX53_PAD_CSI0_DATA_EN__GPIO5_20 0x1f4
+			MX53_PAD_EIM_WAIT__GPIO5_0 0x1f4
+			MX53_PAD_EIM_EB0__GPIO2_28 0x1f4
+			MX53_PAD_EIM_EB1__GPIO2_29 0x1f4
+			MX53_PAD_EIM_OE__GPIO2_25 0x1f4
+			MX53_PAD_EIM_LBA__GPIO2_27 0x1f4
+			MX53_PAD_EIM_RW__GPIO2_26 0x1f4
+			MX53_PAD_EIM_DA8__GPIO3_8 0x1f4
+			MX53_PAD_EIM_DA9__GPIO3_9 0x1f4
+			MX53_PAD_EIM_DA10__GPIO3_10 0x1f4
+			MX53_PAD_EIM_DA11__GPIO3_11 0x1f4
+			MX53_PAD_EIM_DA12__GPIO3_12 0x1f4
+			MX53_PAD_EIM_DA13__GPIO3_13 0x1f4
+			MX53_PAD_EIM_DA14__GPIO3_14 0x1f4
+			MX53_PAD_EIM_DA15__GPIO3_15 0x1f4
 			>;
-		};
+	};
 
-		pinctrl_can2: can2grp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL4__CAN2_TXCAN		0x80000000
-				MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x80000000
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_7__CAN1_TXCAN		0x80000000
+			MX53_PAD_GPIO_8__CAN1_RXCAN		0x80000000
+		>;
+	};
 
-		pinctrl_can_xcvr: can-xcvrgrp {
-			fsl,pins = <MX53_PAD_DISP0_DAT0__GPIO4_21 0xe0>; /* Flexcan XCVR enable */
-		};
+	pinctrl_can2: can2grp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL4__CAN2_TXCAN		0x80000000
+			MX53_PAD_KEY_ROW4__CAN2_RXCAN		0x80000000
+		>;
+	};
 
-		pinctrl_ds1339: ds1339grp {
-			fsl,pins = <MX53_PAD_DI0_PIN4__GPIO4_20 0xe0>;
-		};
+	pinctrl_can_xcvr: can-xcvrgrp {
+		fsl,pins = <MX53_PAD_DISP0_DAT0__GPIO4_21 0xe0>; /* Flexcan XCVR enable */
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_19__ECSPI1_RDY		0x80000000
-				MX53_PAD_EIM_EB2__ECSPI1_SS0		0x80000000
-				MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
-				MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
-				MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
-				MX53_PAD_EIM_D19__ECSPI1_SS1		0x80000000
-			>;
-		};
+	pinctrl_ds1339: ds1339grp {
+		fsl,pins = <MX53_PAD_DI0_PIN4__GPIO4_20 0xe0>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
-				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
-				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
-				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
-				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
-				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
-				MX53_PAD_EIM_D24__GPIO3_24 0x1f0
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_19__ECSPI1_RDY		0x80000000
+			MX53_PAD_EIM_EB2__ECSPI1_SS0		0x80000000
+			MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
+			MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
+			MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
+			MX53_PAD_EIM_D19__ECSPI1_SS1		0x80000000
+		>;
+	};
 
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
-				MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
-				MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
-				MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
-				MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
-				MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
-				MX53_PAD_EIM_D25__GPIO3_25 0x1f0
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
+			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
+			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
+			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
+			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
+			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
+			MX53_PAD_EIM_D24__GPIO3_24 0x1f0
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
-			>;
-		};
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
+			MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
+			MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
+			MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
+			MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
+			MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
+			MX53_PAD_EIM_D25__GPIO3_25 0x1f0
+		>;
+	};
 
-		pinctrl_gpio_key: gpio-keygrp {
-			fsl,pins = <MX53_PAD_EIM_A25__GPIO5_2 0x1f4>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D21__I2C1_SCL		0x400001e4
-				MX53_PAD_EIM_D28__I2C1_SDA		0x400001e4
-			>;
-		};
+	pinctrl_gpio_key: gpio-keygrp {
+		fsl,pins = <MX53_PAD_EIM_A25__GPIO5_2 0x1f4>;
+	};
 
-		pinctrl_i2c1_gpio: i2c1-gpiogrp {
-			fsl,pins = <
-				MX53_PAD_EIM_D21__GPIO3_21		0x400001e6
-				MX53_PAD_EIM_D28__GPIO3_28		0x400001e6
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D21__I2C1_SCL		0x400001e4
+			MX53_PAD_EIM_D28__I2C1_SDA		0x400001e4
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_3__I2C3_SCL		0x400001e4
-				MX53_PAD_GPIO_6__I2C3_SDA		0x400001e4
-			>;
-		};
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX53_PAD_EIM_D21__GPIO3_21		0x400001e6
+			MX53_PAD_EIM_D28__GPIO3_28		0x400001e6
+		>;
+	};
 
-		pinctrl_i2c3_gpio: i2c3-gpiogrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_3__GPIO1_3		0x400001e6
-				MX53_PAD_GPIO_6__GPIO1_6		0x400001e6
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_3__I2C3_SCL		0x400001e4
+			MX53_PAD_GPIO_6__I2C3_SDA		0x400001e4
+		>;
+	};
 
-		pinctrl_nand: nandgrp {
-			fsl,pins = <
-				MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B	0x4
-				MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B	0x4
-				MX53_PAD_NANDF_CLE__EMI_NANDF_CLE	0x4
-				MX53_PAD_NANDF_ALE__EMI_NANDF_ALE	0x4
-				MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B	0xe0
-				MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0	0xe0
-				MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0	0x4
-				MX53_PAD_EIM_DA0__EMI_NAND_WEIM_DA_0	0xa4
-				MX53_PAD_EIM_DA1__EMI_NAND_WEIM_DA_1	0xa4
-				MX53_PAD_EIM_DA2__EMI_NAND_WEIM_DA_2	0xa4
-				MX53_PAD_EIM_DA3__EMI_NAND_WEIM_DA_3	0xa4
-				MX53_PAD_EIM_DA4__EMI_NAND_WEIM_DA_4	0xa4
-				MX53_PAD_EIM_DA5__EMI_NAND_WEIM_DA_5	0xa4
-				MX53_PAD_EIM_DA6__EMI_NAND_WEIM_DA_6	0xa4
-				MX53_PAD_EIM_DA7__EMI_NAND_WEIM_DA_7	0xa4
-			>;
-		};
+	pinctrl_i2c3_gpio: i2c3-gpiogrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_3__GPIO1_3		0x400001e6
+			MX53_PAD_GPIO_6__GPIO1_6		0x400001e6
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_1__PWM2_PWMO		0x80000000
-			>;
-		};
+	pinctrl_nand: nandgrp {
+		fsl,pins = <
+			MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B	0x4
+			MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B	0x4
+			MX53_PAD_NANDF_CLE__EMI_NANDF_CLE	0x4
+			MX53_PAD_NANDF_ALE__EMI_NANDF_ALE	0x4
+			MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B	0xe0
+			MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0	0xe0
+			MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0	0x4
+			MX53_PAD_EIM_DA0__EMI_NAND_WEIM_DA_0	0xa4
+			MX53_PAD_EIM_DA1__EMI_NAND_WEIM_DA_1	0xa4
+			MX53_PAD_EIM_DA2__EMI_NAND_WEIM_DA_2	0xa4
+			MX53_PAD_EIM_DA3__EMI_NAND_WEIM_DA_3	0xa4
+			MX53_PAD_EIM_DA4__EMI_NAND_WEIM_DA_4	0xa4
+			MX53_PAD_EIM_DA5__EMI_NAND_WEIM_DA_5	0xa4
+			MX53_PAD_EIM_DA6__EMI_NAND_WEIM_DA_6	0xa4
+			MX53_PAD_EIM_DA7__EMI_NAND_WEIM_DA_7	0xa4
+		>;
+	};
 
-		pinctrl_ssi1: ssi1grp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
-				MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
-				MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
-				MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_1__PWM2_PWMO		0x80000000
+		>;
+	};
 
-		pinctrl_ssi2: ssi2grp {
-			fsl,pins = <
-				MX53_PAD_CSI0_DAT4__AUDMUX_AUD3_TXC	0x80000000
-				MX53_PAD_CSI0_DAT5__AUDMUX_AUD3_TXD	0x80000000
-				MX53_PAD_CSI0_DAT6__AUDMUX_AUD3_TXFS	0x80000000
-				MX53_PAD_CSI0_DAT7__AUDMUX_AUD3_RXD	0x80000000
-				MX53_PAD_EIM_D27__GPIO3_27 0x1f0
-			>;
-		};
+	pinctrl_ssi1: ssi1grp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
+			MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
+			MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
+			MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
+		>;
+	};
 
-		pinctrl_stk5led: stk5ledgrp {
-			fsl,pins = <MX53_PAD_EIM_A18__GPIO2_20 0xc0>;
-		};
+	pinctrl_ssi2: ssi2grp {
+		fsl,pins = <
+			MX53_PAD_CSI0_DAT4__AUDMUX_AUD3_TXC	0x80000000
+			MX53_PAD_CSI0_DAT5__AUDMUX_AUD3_TXD	0x80000000
+			MX53_PAD_CSI0_DAT6__AUDMUX_AUD3_TXFS	0x80000000
+			MX53_PAD_CSI0_DAT7__AUDMUX_AUD3_RXD	0x80000000
+			MX53_PAD_EIM_D27__GPIO3_27 0x1f0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
-				MX53_PAD_PATA_RESET_B__UART1_CTS	0x1c5
-				MX53_PAD_PATA_IORDY__UART1_RTS		0x1c5
-			>;
-		};
+	pinctrl_stk5led: stk5ledgrp {
+		fsl,pins = <MX53_PAD_EIM_A18__GPIO2_20 0xc0>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1c5
-				MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1c5
-				MX53_PAD_PATA_DIOR__UART2_RTS		0x1c5
-				MX53_PAD_PATA_INTRQ__UART2_CTS		0x1c5
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
+			MX53_PAD_PATA_RESET_B__UART1_CTS	0x1c5
+			MX53_PAD_PATA_IORDY__UART1_RTS		0x1c5
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
-				MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
-				MX53_PAD_PATA_DA_1__UART3_CTS		0x1e4
-				MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX53_PAD_PATA_BUFFER_EN__UART2_RXD_MUX	0x1c5
+			MX53_PAD_PATA_DMARQ__UART2_TXD_MUX	0x1c5
+			MX53_PAD_PATA_DIOR__UART2_RTS		0x1c5
+			MX53_PAD_PATA_INTRQ__UART2_CTS		0x1c5
+		>;
+	};
 
-		pinctrl_usbh1: usbh1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D30__GPIO3_30 0x100 /* OC */
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX53_PAD_PATA_CS_0__UART3_TXD_MUX	0x1e4
+			MX53_PAD_PATA_CS_1__UART3_RXD_MUX	0x1e4
+			MX53_PAD_PATA_DA_1__UART3_CTS		0x1e4
+			MX53_PAD_PATA_DA_2__UART3_RTS		0x1e4
+		>;
+	};
 
-		pinctrl_usbh1_vbus: usbh1-vbusgrp {
-			fsl,pins = <
-				MX53_PAD_EIM_D31__GPIO3_31 0xe0 /* VBUS ENABLE */
-			>;
-		};
+	pinctrl_usbh1: usbh1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D30__GPIO3_30 0x100 /* OC */
+		>;
+	};
 
-		pinctrl_usbotg_vbus: usbotg-vbusgrp {
-			fsl,pins = <
-				MX53_PAD_GPIO_7__GPIO1_7 0xe0 /* VBUS ENABLE */
-				MX53_PAD_GPIO_8__GPIO1_8 0x100 /* OC */
-			>;
-		};
+	pinctrl_usbh1_vbus: usbh1-vbusgrp {
+		fsl,pins = <
+			MX53_PAD_EIM_D31__GPIO3_31 0xe0 /* VBUS ENABLE */
+		>;
+	};
+
+	pinctrl_usbotg_vbus: usbotg-vbusgrp {
+		fsl,pins = <
+			MX53_PAD_GPIO_7__GPIO1_7 0xe0 /* VBUS ENABLE */
+			MX53_PAD_GPIO_8__GPIO1_8 0x100 /* OC */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dts b/arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dts
index ae53d178a6830..ae9cc04f23eb5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dts
@@ -40,67 +40,65 @@ led2 {
 
 &iomuxc {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_hog>;
-
-	imx53-voipac {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				/* SD2_CD */
-				MX53_PAD_EIM_D25__GPIO3_25	0x80000000
-				/* SD2_WP */
-				MX53_PAD_EIM_A19__GPIO2_19 	0x80000000
-			>;
-		};
+	pinctrl-0 = <&pinctrl_hogbsb>;
+
+	pinctrl_hogbsb: hogbsbgrp {
+		fsl,pins = <
+			/* SD2_CD */
+			MX53_PAD_EIM_D25__GPIO3_25	0x80000000
+			/* SD2_WP */
+			MX53_PAD_EIM_A19__GPIO2_19 	0x80000000
+		>;
+	};
 
-		led_pin_gpio: led_gpio {
-			fsl,pins = <
-				MX53_PAD_EIM_D29__GPIO3_29	0x80000000
-				MX53_PAD_EIM_EB3__GPIO2_31	0x80000000
-			>;
-		};
+	led_pin_gpio: ledgpiogrp {
+		fsl,pins = <
+			MX53_PAD_EIM_D29__GPIO3_29	0x80000000
+			MX53_PAD_EIM_EB3__GPIO2_31	0x80000000
+		>;
+	};
 
-		/* Keyboard controller */
-		pinctrl_kpp_1: kppgrp-1 {
-			fsl,pins = <
-				MX53_PAD_GPIO_9__KPP_COL_6	0xe8
-				MX53_PAD_GPIO_4__KPP_COL_7	0xe8
-				MX53_PAD_KEY_COL2__KPP_COL_2	0xe8
-				MX53_PAD_KEY_COL3__KPP_COL_3	0xe8
-				MX53_PAD_KEY_COL4__KPP_COL_4	0xe8
-				MX53_PAD_GPIO_2__KPP_ROW_6	0xe0
-				MX53_PAD_GPIO_5__KPP_ROW_7	0xe0
-				MX53_PAD_KEY_ROW2__KPP_ROW_2	0xe0
-				MX53_PAD_KEY_ROW3__KPP_ROW_3	0xe0
-				MX53_PAD_KEY_ROW4__KPP_ROW_4	0xe0
-			>;
-		};
+	/* Keyboard controller */
+	pinctrl_kpp_1: kpp1grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_9__KPP_COL_6	0xe8
+			MX53_PAD_GPIO_4__KPP_COL_7	0xe8
+			MX53_PAD_KEY_COL2__KPP_COL_2	0xe8
+			MX53_PAD_KEY_COL3__KPP_COL_3	0xe8
+			MX53_PAD_KEY_COL4__KPP_COL_4	0xe8
+			MX53_PAD_GPIO_2__KPP_ROW_6	0xe0
+			MX53_PAD_GPIO_5__KPP_ROW_7	0xe0
+			MX53_PAD_KEY_ROW2__KPP_ROW_2	0xe0
+			MX53_PAD_KEY_ROW3__KPP_ROW_3	0xe0
+			MX53_PAD_KEY_ROW4__KPP_ROW_4	0xe0
+		>;
+	};
 
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
-				MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
-				MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
-				MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX53_PAD_KEY_COL0__AUDMUX_AUD5_TXC	0x80000000
+			MX53_PAD_KEY_ROW0__AUDMUX_AUD5_TXD	0x80000000
+			MX53_PAD_KEY_COL1__AUDMUX_AUD5_TXFS	0x80000000
+			MX53_PAD_KEY_ROW1__AUDMUX_AUD5_RXD	0x80000000
+		>;
+	};
 
-		pinctrl_esdhc2: esdhc2grp {
-			fsl,pins = <
-				MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
-				MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
-				MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
-				MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
-				MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
-				MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
-			>;
-		};
+	pinctrl_esdhc2: esdhc2grp {
+		fsl,pins = <
+			MX53_PAD_SD2_CMD__ESDHC2_CMD		0x1d5
+			MX53_PAD_SD2_CLK__ESDHC2_CLK		0x1d5
+			MX53_PAD_SD2_DATA0__ESDHC2_DAT0		0x1d5
+			MX53_PAD_SD2_DATA1__ESDHC2_DAT1		0x1d5
+			MX53_PAD_SD2_DATA2__ESDHC2_DAT2		0x1d5
+			MX53_PAD_SD2_DATA3__ESDHC2_DAT3		0x1d5
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX53_PAD_GPIO_3__I2C3_SCL		0xc0000000
-				MX53_PAD_GPIO_6__I2C3_SDA		0xc0000000
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX53_PAD_GPIO_3__I2C3_SCL		0xc0000000
+			MX53_PAD_GPIO_6__I2C3_SDA		0xc0000000
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
index c0622cf7188ce..6dc70a92d831b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
@@ -37,74 +37,72 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx53-voipac {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				/* Make DA9053 regulator functional */
-				MX53_PAD_GPIO_16__GPIO7_11	0x80000000
-				/* FEC Power enable */
-				MX53_PAD_GPIO_11__GPIO4_1	0x80000000
-				/* FEC RST */
-				MX53_PAD_GPIO_12__GPIO4_2	0x80000000
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* Make DA9053 regulator functional */
+			MX53_PAD_GPIO_16__GPIO7_11	0x80000000
+			/* FEC Power enable */
+			MX53_PAD_GPIO_11__GPIO4_1	0x80000000
+			/* FEC RST */
+			MX53_PAD_GPIO_12__GPIO4_2	0x80000000
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
-				MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
-				MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D16__ECSPI1_SCLK		0x80000000
+			MX53_PAD_EIM_D17__ECSPI1_MISO		0x80000000
+			MX53_PAD_EIM_D18__ECSPI1_MOSI		0x80000000
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
-				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
-				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
-				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
-				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
-				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
-				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
+			MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
+			MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
+			MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
+			MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
+			MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
+			MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
+			MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX53_PAD_EIM_D21__I2C1_SCL		0xc0000000
-				MX53_PAD_EIM_D28__I2C1_SDA		0xc0000000
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX53_PAD_EIM_D21__I2C1_SCL		0xc0000000
+			MX53_PAD_EIM_D28__I2C1_SDA		0xc0000000
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
-				MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX53_PAD_PATA_DIOW__UART1_TXD_MUX	0x1e4
+			MX53_PAD_PATA_DMACK__UART1_RXD_MUX	0x1e4
+		>;
+	};
 
-		pinctrl_nand: nandgrp {
-			fsl,pins = <
-				MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B	0x4
-				MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B	0x4
-				MX53_PAD_NANDF_CLE__EMI_NANDF_CLE	0x4
-				MX53_PAD_NANDF_ALE__EMI_NANDF_ALE	0x4
-				MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B	0xe0
-				MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0	0xe0
-				MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0	0x4
-				MX53_PAD_PATA_DATA0__EMI_NANDF_D_0	0xa4
-				MX53_PAD_PATA_DATA1__EMI_NANDF_D_1	0xa4
-				MX53_PAD_PATA_DATA2__EMI_NANDF_D_2	0xa4
-				MX53_PAD_PATA_DATA3__EMI_NANDF_D_3	0xa4
-				MX53_PAD_PATA_DATA4__EMI_NANDF_D_4	0xa4
-				MX53_PAD_PATA_DATA5__EMI_NANDF_D_5	0xa4
-				MX53_PAD_PATA_DATA6__EMI_NANDF_D_6	0xa4
-				MX53_PAD_PATA_DATA7__EMI_NANDF_D_7	0xa4
-			>;
-		};
+	pinctrl_nand: nandgrp {
+		fsl,pins = <
+			MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B	0x4
+			MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B	0x4
+			MX53_PAD_NANDF_CLE__EMI_NANDF_CLE	0x4
+			MX53_PAD_NANDF_ALE__EMI_NANDF_ALE	0x4
+			MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B	0xe0
+			MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0	0xe0
+			MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0	0x4
+			MX53_PAD_PATA_DATA0__EMI_NANDF_D_0	0xa4
+			MX53_PAD_PATA_DATA1__EMI_NANDF_D_1	0xa4
+			MX53_PAD_PATA_DATA2__EMI_NANDF_D_2	0xa4
+			MX53_PAD_PATA_DATA3__EMI_NANDF_D_3	0xa4
+			MX53_PAD_PATA_DATA4__EMI_NANDF_D_4	0xa4
+			MX53_PAD_PATA_DATA5__EMI_NANDF_D_5	0xa4
+			MX53_PAD_PATA_DATA6__EMI_NANDF_D_6	0xa4
+			MX53_PAD_PATA_DATA7__EMI_NANDF_D_7	0xa4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 07658e477095f..845e2bf8460ad 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -458,7 +458,7 @@ srtc: rtc@53fa4000 {
 				clocks = <&clks IMX5_CLK_SRTC_GATE>;
 			};
 
-			iomuxc: iomuxc@53fa8000 {
+			iomuxc: pinctrl@53fa8000 {
 				compatible = "fsl,imx53-iomuxc";
 				reg = <0x53fa8000 0x4000>;
 			};
-- 
2.45.2



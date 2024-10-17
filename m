Return-Path: <linux-gpio+bounces-11576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACB9A2F5E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439C21F248A1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B9F22910F;
	Thu, 17 Oct 2024 21:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="b3klZ/8+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F981EE011;
	Thu, 17 Oct 2024 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199600; cv=none; b=hyIrM8nybPV2YDLPCioJdmyAmxwh74iKBvJ56Z7DenDj77Jy/NChtCH7kgkXEg9WxZly83MEK8miiiIxCo4eKMPl28vwPgnmwp+5nV9uA5HwRotyVPrl2bAJqpt9YszbkcxZqIbMQ8PAVJT/AawFA6/MajYn4trS6EBsdpA9zmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199600; c=relaxed/simple;
	bh=u0D64/Tw1B/3Pt9P+g5vMBNj9DCbBiB6pUVuasXtrO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNxYs9UaQMoKsUhk2mTheQ9swugKXatpAAzMrv1nrwJJuZEiUmY7LTrrQ/6FF7UKrlVZwpKlHUmIEbbfNLHAIof44OESU2nWkwUU+5idPkKVnjvnGsGyip9uVIzWl5/JG+n5kXv/s+My5z7c1043XXPK4y74U4no8GKnJTyY0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=b3klZ/8+; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BB078890A9;
	Thu, 17 Oct 2024 23:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199590;
	bh=2Z9TCCZVnVRfaVwEUaOcrCA4vPznU70zHmFKW+9S050=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3klZ/8+7wNmfIHmuGNNzo42NHLAK3QoYs5oRgBgpjuG9qN3EgrP2RWVgglROBRie
	 5VyemLfZfDvKmBs6nzcmJc16WEO4DxVqOFTaUBOUzZoNWXpIfwCg8jc+NEz1RE/hBc
	 2NfswhSqcLccNkwG7Tw2k8EOp1dDv+sjMVJw7yFqzhgDdM40SYnP76LntsZPExSSe+
	 VaU4v8w2Wr6sazJ3pMXFMoD30HnPCrPZ0YpV6s5B/4LMDhuIsFbt/S7GZibPEHmnpo
	 ATpERe+CtwW9qhvsCxd6732YrTgkqqVRVBt3dTt5Q58a9NDwygjvuihj22gAGrFRZ1
	 egbNMzwZuzcSQ==
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
Subject: [PATCH v3 06/12] ARM: dts: imx6dl: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:23 +0200
Message-ID: <20241017211241.170861-6-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
References: <20241017211241.170861-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
V3: Fix up a couple of conversion omissions in CPU and .dtsi files
---
 .../dts/nxp/imx/imx6-logicpd-baseboard.dtsi   |   4 +-
 .../boot/dts/nxp/imx/imx6dl-colibri-aster.dts |   2 +-
 .../dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtrvt.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi    | 446 +++++++++---------
 .../arm/boot/dts/nxp/imx/imx6dl-riotboard.dts | 360 +++++++-------
 .../boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi |   4 +-
 .../dts/nxp/imx/imx6dl-yapp43-common.dtsi     |   4 +-
 11 files changed, 413 insertions(+), 417 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
index d477a937b47a8..1e0a588b2a158 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
@@ -534,7 +534,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17069
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: h100-usdhc2-100mhz {
+	pinctrl_usdhc2_100mhz: h100-usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0	/* CD */
 			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170b9
@@ -546,7 +546,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: h100-usdhc2-200mhz {
+	pinctrl_usdhc2_200mhz: h100-usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0	/* CD */
 			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-aster.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-aster.dts
index 82a0d1a28d12f..987058ab0a9b3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-aster.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-aster.dts
@@ -52,7 +52,7 @@ &pinctrl_usbc_id_1
 		&pinctrl_weim_gpio_5
 	>;
 
-	pinctrl_gpio_aster: gpioaster {
+	pinctrl_gpio_aster: gpioastergrp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_COL2__GPIO4_IO10		0x1b0b0
 			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11		0x1b0b0
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 33825b5a8f26c..5ed55f74b398f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -139,7 +139,7 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	pinctrl_hog: hog {
+	pinctrl_hog: hoggrp {
 		fsl,pins = <
 			MX6QDL_PAD_NANDF_D0__GPIO2_IO00		0x00000018 /* buzzer */
 			MX6QDL_PAD_KEY_COL1__GPIO4_IO08		0x00000018 /* OUT_1 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
index 72ee236d2f5e8..ec5a9bf40677d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
@@ -395,7 +395,7 @@ MX6QDL_PAD_GPIO_8__I2C4_SDA	0x4001b8b1
 		>;
 	};
 
-	pinctrl_ipu1_lcdif: pinctrlipu1lcdif { /* parallel port 24-bit */
+	pinctrl_ipu1_lcdif: pinctrlipu1lcdifgrp { /* parallel port 24-bit */
 		fsl,pins = <
 			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10 /* VDOUT_PCLK */
 			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index 773a84a5739df..0b1275a8891f7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -773,7 +773,7 @@ MX6QDL_PAD_EIM_CS1__GPIO2_IO24			0x1b0b0
 		>;
 	};
 
-	pinctrl_pca9539: pca9539 {
+	pinctrl_pca9539: pca9539grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_19__GPIO4_IO05			0x1b0b0
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtrvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtrvt.dts
index 36b031236e475..e543c4f2bc945 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtrvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtrvt.dts
@@ -133,7 +133,7 @@ &vpu {
 };
 
 &iomuxc {
-	pinctrl_can1phy: can1phy {
+	pinctrl_can1phy: can1phygrp {
 		fsl,pins = <
 			/* CAN1_SR */
 			MX6QDL_PAD_KEY_COL3__GPIO4_IO12	0x13070
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
index 568e98cb62aaf..29dc6875ab668 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
@@ -507,7 +507,7 @@ MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
 		>;
 	};
 
-	pinctrl_can1phy: can1phy {
+	pinctrl_can1phy: can1phygrp {
 		fsl,pins = <
 			/* CAN1_SR */
 			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x13070
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index 8a637fdff073d..de80ca141bcab 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -352,261 +352,259 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	qmx6mux: imx6qdl-qmx6 {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x110b0 /* Q7[67] HDA_SDO */
-				MX6QDL_PAD_DI0_PIN3__AUD6_TXFS		0x30b0 /* Q7[59] HDA_SYNC */
-				MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x30b0 /* Q7[65] HDA_SDI */
-				MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x30b0 /* Q7[63] HDA_BITCLK */
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_PIN2__AUD6_TXD		0x110b0 /* Q7[67] HDA_SDO */
+			MX6QDL_PAD_DI0_PIN3__AUD6_TXFS		0x30b0 /* Q7[59] HDA_SYNC */
+			MX6QDL_PAD_DI0_PIN4__AUD6_RXD		0x30b0 /* Q7[65] HDA_SDI */
+			MX6QDL_PAD_DI0_PIN15__AUD6_TXC		0x30b0 /* Q7[63] HDA_BITCLK */
+		>;
+	};
 
-		/* PHY is on System on Module, Q7[3-15] have Ethernet lines */
-		pinctrl_enet: enet {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
-			>;
-		};
+	/* PHY is on System on Module, Q7[3-15] have Ethernet lines */
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
+		>;
+	};
 
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000 /* PCIE_WAKE_B */
-				MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09	0x80000000 /* I2C multiplexer */
-				MX6QDL_PAD_NANDF_D6__GPIO2_IO06		0x80000000 /* SD4_CD# */
-				MX6QDL_PAD_NANDF_D7__GPIO2_IO07		0x80000000 /* SD4_WP */
-				MX6QDL_PAD_CSI0_MCLK__CCM_CLKO1		0x80000000 /* Camera MCLK */
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x80000000 /* PCIE_WAKE_B */
+			MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09	0x80000000 /* I2C multiplexer */
+			MX6QDL_PAD_NANDF_D6__GPIO2_IO06		0x80000000 /* SD4_CD# */
+			MX6QDL_PAD_NANDF_D7__GPIO2_IO07		0x80000000 /* SD4_WP */
+			MX6QDL_PAD_CSI0_MCLK__CCM_CLKO1		0x80000000 /* Camera MCLK */
+		>;
+	};
 
-		pinctrl_i2c1: i2c1 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1 /* Q7[66] I2C_CLK */
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1 /* Q7[68] I2C_DAT */
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1 /* Q7[66] I2C_CLK */
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1 /* Q7[68] I2C_DAT */
+		>;
+	};
 
-		pinctrl_i2c1_gpio: i2c1-gpio {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__GPIO3_IO21		0x1b0b0 /* Q7[66] I2C_CLK */
-				MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x1b0b0 /* Q7[68] I2C_DAT */
-			>;
-		};
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__GPIO3_IO21		0x1b0b0 /* Q7[66] I2C_CLK */
+			MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x1b0b0 /* Q7[68] I2C_DAT */
+		>;
+	};
 
-		pinctrl_i2c2: i2c2 {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1 /* Q7[152] SDVO_CTRL_CLK */
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1 /* Q7[150] SDVO_CTRL_DAT */
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1 /* Q7[152] SDVO_CTRL_CLK */
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1 /* Q7[150] SDVO_CTRL_DAT */
+		>;
+	};
 
-		pinctrl_i2c2_gpio: i2c2-gpio {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x1b0b0 /* Q7[152] SDVO_CTRL_CLK */
-				MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x1b0b0 /* Q7[150] SDVO_CTRL_DAT */
-			>;
-		};
+	pinctrl_i2c2_gpio: i2c2-gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x1b0b0 /* Q7[152] SDVO_CTRL_CLK */
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x1b0b0 /* Q7[150] SDVO_CTRL_DAT */
+		>;
+	};
 
-		pinctrl_i2c3: i2c3 {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1 /* Q7[60] SMB_CLK */
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1 /* Q7[62] SMB_DAT */
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1 /* Q7[60] SMB_CLK */
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1 /* Q7[62] SMB_DAT */
+		>;
+	};
 
-		pinctrl_i2c3_gpio: i2c3-gpio {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_3__GPIO1_IO03		0x1b0b0 /* Q7[60] SMB_CLK */
-				MX6QDL_PAD_GPIO_6__GPIO1_IO06		0x1b0b0 /* Q7[62] SMB_DAT */
-			>;
-		};
+	pinctrl_i2c3_gpio: i2c3-gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_3__GPIO1_IO03		0x1b0b0 /* Q7[60] SMB_CLK */
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06		0x1b0b0 /* Q7[62] SMB_DAT */
+		>;
+	};
 
-		pinctrl_phy_reset: phy-reset {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x1b0b0 /* RGMII Phy Reset */
-			>;
-		};
+	pinctrl_phy_reset: phy-resetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x1b0b0 /* RGMII Phy Reset */
+		>;
+	};
 
-		pinctrl_pwm4: pwm4 {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1 /* Q7[123] LVDS_BLT_CTRL */
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1 /* Q7[123] LVDS_BLT_CTRL */
+		>;
+	};
 
-		pinctrl_q7_backlight_enable: q7-backlight-enable {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x1b0b0 /* Q7[112] LVDS_BLEN */
-			>;
-		};
+	pinctrl_q7_backlight_enable: q7-backlight-enablegrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09		0x1b0b0 /* Q7[112] LVDS_BLEN */
+		>;
+	};
 
-		pinctrl_q7_gpio0: q7-gpio0 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b0 /* Q7[185] GPIO0 */
-			>;
-		};
+	pinctrl_q7_gpio0: q7-gpio0grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b0 /* Q7[185] GPIO0 */
+		>;
+	};
 
-		pinctrl_q7_gpio1: q7-gpio1 {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x1b0b0 /* Q7[186] GPIO1 */
-			>;
-		};
+	pinctrl_q7_gpio1: q7-gpio1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x1b0b0 /* Q7[186] GPIO1 */
+		>;
+	};
 
-		pinctrl_q7_gpio2: q7-gpio2 {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT5__GPIO4_IO26	0x1b0b0 /* Q7[187] GPIO2 */
-			>;
-		};
+	pinctrl_q7_gpio2: q7-gpio2grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT5__GPIO4_IO26	0x1b0b0 /* Q7[187] GPIO2 */
+		>;
+	};
 
-		pinctrl_q7_gpio3: q7-gpio3 {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT6__GPIO4_IO27	0x1b0b0 /* Q7[188] GPIO3 */
-			>;
-		};
+	pinctrl_q7_gpio3: q7-gpio3grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT6__GPIO4_IO27	0x1b0b0 /* Q7[188] GPIO3 */
+		>;
+	};
 
-		pinctrl_q7_gpio4: q7-gpio4 {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0 /* Q7[189] GPIO4 */
-			>;
-		};
+	pinctrl_q7_gpio4: q7-gpio4grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0 /* Q7[189] GPIO4 */
+		>;
+	};
 
-		pinctrl_q7_gpio5: q7-gpio5 {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0 /* Q7[190] GPIO5 */
-			>;
-		};
+	pinctrl_q7_gpio5: q7-gpio5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b0 /* Q7[190] GPIO5 */
+		>;
+	};
 
-		pinctrl_q7_gpio6: q7-gpio6 {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_16__GPIO7_IO11		0x1b0b0 /* Q7[191] GPIO6 */
-			>;
-		};
+	pinctrl_q7_gpio6: q7-gpio6grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_16__GPIO7_IO11		0x1b0b0 /* Q7[191] GPIO6 */
+		>;
+	};
 
-		pinctrl_q7_gpio7: q7-gpio7 {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0 /* Q7[192] GPIO7 */
-			>;
-		};
+	pinctrl_q7_gpio7: q7-gpio7grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0 /* Q7[192] GPIO7 */
+		>;
+	};
 
-		pinctrl_q7_hda_reset: q7-hda-reset {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x1b0b0 /* Q7[61] HDA_RST_N */
-			>;
-		};
+	pinctrl_q7_hda_reset: q7-hda-resetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x1b0b0 /* Q7[61] HDA_RST_N */
+		>;
+	};
 
-		pinctrl_q7_lcd_power: lcd-power {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_7__GPIO1_IO07		0x1b0b0 /* Q7[111] LVDS_PPEN */
-			>;
-		};
+	pinctrl_q7_lcd_power: lcd-powergrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_7__GPIO1_IO07		0x1b0b0 /* Q7[111] LVDS_PPEN */
+		>;
+	};
 
-		pinctrl_q7_sdio_power: q7-sdio-power {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30	0x1b0b0 /* Q7[47] SDIO_PWR# */
-			>;
-		};
+	pinctrl_q7_sdio_power: q7-sdio-powergrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30	0x1b0b0 /* Q7[47] SDIO_PWR# */
+		>;
+	};
 
-		pinctrl_q7_sleep_button: q7-sleep-button {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0 /* Q7[21] SLP_BTN# */
-			>;
-		};
+	pinctrl_q7_sleep_button: q7-sleep-buttongrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW0__GPIO4_IO07		0x1b0b0 /* Q7[21] SLP_BTN# */
+		>;
+	};
 
-		pinctrl_q7_spi_cs1: spi-cs1 {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT4__GPIO4_IO25	0x1b0b0 /* Q7[202] SPI_CS1# */
-			>;
-		};
+	pinctrl_q7_spi_cs1: spi-cs1grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT4__GPIO4_IO25	0x1b0b0 /* Q7[202] SPI_CS1# */
+		>;
+	};
 
-		/* SPI1 bus does not leave System on Module */
-		pinctrl_spi1: spi1 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0
-			>;
-		};
+	/* SPI1 bus does not leave System on Module */
+	pinctrl_spi1: spi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0
+		>;
+	};
 
-		/* Debug connector on Q7 module */
-		pinctrl_uart2: uart2 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	/* Debug connector on Q7 module */
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1 /* Q7[177] UART0_RX */
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1 /* Q7[171] UART0_TX */
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1 /* Q7[177] UART0_RX */
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1 /* Q7[171] UART0_TX */
+		>;
+	};
 
-		pinctrl_usbotg: usbotg {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059 /* Q7[92] USB_ID */
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059 /* Q7[92] USB_ID */
+		>;
+	};
 
-		/* µSD card slot on Q7 module */
-		pinctrl_usdhc2: usdhc2 {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0 /* SD2_CD */
-			>;
-		};
+	/* µSD card slot on Q7 module */
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0 /* SD2_CD */
+		>;
+	};
 
-		/* eMMC module on Q7 module */
-		pinctrl_usdhc3: usdhc3 {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
-			>;
-		};
+	/* eMMC module on Q7 module */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
+		>;
+	};
 
-		pinctrl_usdhc4: usdhc4 {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059 /* Q7[45] SDIO_CMD */
-				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x17059 /* Q7[42] SDIO_CLK */
-				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059 /* Q7[48] SDIO_DAT1 */
-				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059 /* Q7[49] SDIO_DAT0 */
-				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059 /* Q7[50] SDIO_DAT3 */
-				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059 /* Q7[51] SDIO_DAT2 */
-			>;
-		};
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059 /* Q7[45] SDIO_CMD */
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x17059 /* Q7[42] SDIO_CLK */
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059 /* Q7[48] SDIO_DAT1 */
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059 /* Q7[49] SDIO_DAT0 */
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059 /* Q7[50] SDIO_DAT3 */
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059 /* Q7[51] SDIO_DAT2 */
+		>;
+	};
 
-		pinctrl_wdog: wdog {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0 /* Watchdog output signal */
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__WDOG1_B		0x1b0b0 /* Watchdog output signal */
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts
index 114739d104475..e9ac4768f36c2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts
@@ -391,208 +391,206 @@ &usdhc4 {
 &iomuxc {
 	pinctrl-names = "default";
 
-	imx6-riotboard {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
-				MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
-				MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
-				MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
-				MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0		/* CAM_MCLK */
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+			MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x130b0		/* CAM_MCLK */
+		>;
+	};
 
-		pinctrl_ecspi1: ecspi1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
-				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
-				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
-				MX6QDL_PAD_DISP0_DAT23__GPIO5_IO17	0x000b1		/* CS0 */
-			>;
-		};
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_DISP0_DAT23__GPIO5_IO17	0x000b1		/* CS0 */
+		>;
+	};
 
-		pinctrl_ecspi2: ecspi2grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT15__GPIO5_IO09	0x000b1		/* CS1 */
-				MX6QDL_PAD_DISP0_DAT16__ECSPI2_MOSI	0x100b1
-				MX6QDL_PAD_DISP0_DAT17__ECSPI2_MISO	0x100b1
-				MX6QDL_PAD_DISP0_DAT18__GPIO5_IO12	0x000b1		/* CS0 */
-				MX6QDL_PAD_DISP0_DAT19__ECSPI2_SCLK	0x100b1
-			>;
-		};
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT15__GPIO5_IO09	0x000b1		/* CS1 */
+			MX6QDL_PAD_DISP0_DAT16__ECSPI2_MOSI	0x100b1
+			MX6QDL_PAD_DISP0_DAT17__ECSPI2_MISO	0x100b1
+			MX6QDL_PAD_DISP0_DAT18__GPIO5_IO12	0x000b1		/* CS0 */
+			MX6QDL_PAD_DISP0_DAT19__ECSPI2_SCLK	0x100b1
+		>;
+	};
 
-		pinctrl_ecspi3: ecspi3grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
-				MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
-				MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
-				MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24	0x000b1		/* CS0 */
-				MX6QDL_PAD_DISP0_DAT4__GPIO4_IO25	0x000b1		/* CS1 */
-			>;
-		};
+	pinctrl_ecspi3: ecspi3grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
+			MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
+			MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
+			MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24	0x000b1		/* CS0 */
+			MX6QDL_PAD_DISP0_DAT4__GPIO4_IO25	0x000b1		/* CS1 */
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x0a0b1		/* AR8035 CLK_25M --> ENET_REF_CLK (V22) */
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030		/* AR8035 pin strapping: IO voltage: pull up */
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x13030		/* AR8035 pin strapping: PHYADDR#0: pull down */
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x13030		/* AR8035 pin strapping: PHYADDR#1: pull down */
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030		/* AR8035 pin strapping: MODE#1: pull up */
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030		/* AR8035 pin strapping: MODE#3: pull up */
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x130b0		/* AR8035 pin strapping: MODE#0: pull down */
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8	/* GPIO16 -> AR8035 25MHz */
-				MX6QDL_PAD_EIM_D31__GPIO3_IO31		0x130b0		/* RGMII_nRST */
-				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x180b0		/* AR8035 interrupt */
-				MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x0a0b1		/* AR8035 CLK_25M --> ENET_REF_CLK (V22) */
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030		/* AR8035 pin strapping: IO voltage: pull up */
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x13030		/* AR8035 pin strapping: PHYADDR#0: pull down */
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x13030		/* AR8035 pin strapping: PHYADDR#1: pull down */
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030		/* AR8035 pin strapping: MODE#1: pull up */
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030		/* AR8035 pin strapping: MODE#3: pull up */
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x130b0		/* AR8035 pin strapping: MODE#0: pull down */
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8	/* GPIO16 -> AR8035 25MHz */
+			MX6QDL_PAD_EIM_D31__GPIO3_IO31		0x130b0		/* RGMII_nRST */
+			MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x180b0		/* AR8035 interrupt */
+			MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
-				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c4: i2c4grp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_7__I2C4_SCL             0x4001b8b1
-				MX6QDL_PAD_GPIO_8__I2C4_SDA             0x4001b8b1
-			>;
-		};
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_7__I2C4_SCL             0x4001b8b1
+			MX6QDL_PAD_GPIO_8__I2C4_SDA             0x4001b8b1
+		>;
+	};
 
-		pinctrl_led: ledgrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b1	/* user led0 */
-				MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x1b0b1	/* user led1 */
-			>;
-		};
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b1	/* user led0 */
+			MX6QDL_PAD_EIM_D28__GPIO3_IO28		0x1b0b1	/* user led1 */
+		>;
+	};
 
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT8__PWM1_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__PWM1_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm2: pwm2grp {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT9__PWM2_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT9__PWM2_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_pwm4: pwm4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
-			>;
-		};
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT		0x1b0b1
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
-				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart4: uart4grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
-				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__UART5_TX_DATA	0x1b0b1
+			MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x000b0	/* MX6QDL_PAD_EIM_D22__USB_OTG_PWR */
-				MX6QDL_PAD_EIM_D21__USB_OTG_OC		0x1b0b0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x000b0	/* MX6QDL_PAD_EIM_D22__USB_OTG_PWR */
+			MX6QDL_PAD_EIM_D21__USB_OTG_OC		0x1b0b0
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0	/* SD2 CD */
-				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1f0b0	/* SD2 WP */
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b0	/* SD2 CD */
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1f0b0	/* SD2 WP */
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x1b0b0	/* SD3 CD */
-				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x1f0b0	/* SD3 WP */
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00		0x1b0b0	/* SD3 CD */
+			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x1f0b0	/* SD3 WP */
+		>;
+	};
 
-		pinctrl_usdhc4: usdhc4grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
-				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
-				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
-				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
-				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
-				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
-				MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x17059	/* SD4 RST (eMMC) */
-			>;
-		};
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x17059
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x10059
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x17059
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x17059
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x17059
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x17059
+			MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x17059	/* SD4 RST (eMMC) */
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index c32ea040fecdd..8bc6376d0dc10 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -506,7 +506,7 @@ MX6QDL_PAD_EIM_D30__USB_H1_OC	0x1b098
 		>;
 	};
 
-	pinctrl_usbh1_vbus: usbh1-vbus {
+	pinctrl_usbh1_vbus: usbh1-vbusgrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x98
 		>;
@@ -519,7 +519,7 @@ MX6QDL_PAD_EIM_D21__USB_OTG_OC		0x1b098
 		>;
 	};
 
-	pinctrl_usbotg_vbus: usbotg-vbus {
+	pinctrl_usbotg_vbus: usbotg-vbusgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D22__GPIO3_IO22	0x98
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
index bcf4d9c870ec9..2f42c56c21f63 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
@@ -500,7 +500,7 @@ MX6QDL_PAD_EIM_D30__USB_H1_OC	0x1b098
 		>;
 	};
 
-	pinctrl_usbh1_vbus: usbh1-vbus {
+	pinctrl_usbh1_vbus: usbh1-vbusgrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29	0x98
 		>;
@@ -513,7 +513,7 @@ MX6QDL_PAD_EIM_D21__USB_OTG_OC		0x1b098
 		>;
 	};
 
-	pinctrl_usbotg_vbus: usbotg-vbus {
+	pinctrl_usbotg_vbus: usbotg-vbusgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D22__GPIO3_IO22	0x98
 		>;
-- 
2.45.2



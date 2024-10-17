Return-Path: <linux-gpio+bounces-11477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59869A168D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 173E2B215F7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54481EEB1;
	Thu, 17 Oct 2024 00:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="DRYWKkxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE08847C;
	Thu, 17 Oct 2024 00:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123720; cv=none; b=UPMBZ4U3hjcf/0cGfjPvC//tRQym3a5PMaYelyPZ84xwE6fmiiG87RY0XH8STKMRtlmjCjo7wEw6llejRxqfnpOH/k9VRcZmjVRc8l2PV4ou6YQp59qQPddhaChxOOr19SnjQK7RvcXWVU80tJ6rO3KiF+ZqgcdhdmcK2N3rnxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123720; c=relaxed/simple;
	bh=fMXqAzLUEcBceHW0sW5D17/Fc4nTId6h3XlihBZtI0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8Zhq9ju6+CyNvQLXWRQzsgWbAN3G4zqM2pnWQNECQIu3KG3u/XYUYmLCmMRhcW8ltWHPyqfHagqtM/45msXmSbYZ4ZtThKLVCyYiAmsiSYTGVxksb4HFqh4xTx28EtRY0+zjms3yGPkuQ/Sf5ptb89dUjxEq868tR/kjbPDg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=DRYWKkxc; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 00F6088E21;
	Thu, 17 Oct 2024 02:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123713;
	bh=1ossxrp/t5VBgkuxbWmVjsfiQA5GERhGaOeAwKpN3oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DRYWKkxcKM70U4QCuKkXpaX0PazrysgSvS94n6MzHKirhsSpf1m98fEpEs2OMsjUE
	 /FzL6ADZt1QTlUeMmiP+hjqy8G5xtjhwJhT9nfNLpSW7wupuKeTns8O7MHxs4JpS5I
	 U6QS/YmojCYq1XdtxF1h6AeIaxaAOzgi7XQVj+YIFByIA43uCLHVVTyO49Qdz6ZiRe
	 xRqulo5L9pcWUooLgBUjJcaWi8Ct3lcgqEia4cEIZUvUR5rEfQljL3Xafx/I6uMWuU
	 vPfAgve/S1shTQHhr6y6IplYDZxnb2xMU/XY7kj1jGsjPYdEyUCwtTiXUrcANknloU
	 b46zoXXtmydsg==
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
Subject: [PATCH v2 07/12] ARM: dts: imx6q: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:53 +0200
Message-ID: <20241017000801.149276-7-marex@denx.de>
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
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi     |   2 +-
 .../boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    | 232 +++++++++---------
 arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts     |  92 ++++---
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts      | 200 ++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts    |  48 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-sbc6x.dts     |  82 +++----
 .../boot/dts/nxp/imx/imx6q-utilite-pro.dts    |   4 +-
 11 files changed, 332 insertions(+), 340 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 09d9ca0cb3324..d77472519086b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -623,7 +623,7 @@ MX6QDL_PAD_SD3_DAT7__SD3_DATA7	0x17059
 		>;
 	};
 
-	pinctrl_usdhc3_reset: usdhc3grp-reset {
+	pinctrl_usdhc3_reset: usdhc3-resetgrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD3_RST__SD3_RESET   0x170F9
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
index 9f7ac7158c465..c5525b2c1dbd5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
@@ -283,138 +283,136 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6q-dmo-edmqmx6 {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_A16__GPIO2_IO22 0x80000000
-				MX6QDL_PAD_EIM_A17__GPIO2_IO21 0x80000000
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A16__GPIO2_IO22 0x80000000
+			MX6QDL_PAD_EIM_A17__GPIO2_IO21 0x80000000
+		>;
+	};
 
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
-				MX6QDL_PAD_GPIO_7__FLEXCAN1_TX		0x1b0b0
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
+			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX		0x1b0b0
+		>;
+	};
 
-		pinctrl_ecspi5: ecspi5rp-1 {
-			fsl,pins = <
-				MX6QDL_PAD_SD1_DAT0__ECSPI5_MISO	0x80000000
-				MX6QDL_PAD_SD1_CMD__ECSPI5_MOSI		0x80000000
-				MX6QDL_PAD_SD1_CLK__ECSPI5_SCLK		0x80000000
-				MX6QDL_PAD_SD2_DAT3__GPIO1_IO12		0x80000000
-			>;
-		};
+	pinctrl_ecspi5: ecspi5rp-1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__ECSPI5_MISO	0x80000000
+			MX6QDL_PAD_SD1_CMD__ECSPI5_MOSI		0x80000000
+			MX6QDL_PAD_SD1_CLK__ECSPI5_SCLK		0x80000000
+			MX6QDL_PAD_SD2_DAT3__GPIO1_IO12		0x80000000
+		>;
+	};
 
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
-				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x1b0b0
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_EB2__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_EB2__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b8b1
-				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__GPIO4_IO08		0x100b1
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__GPIO4_IO08		0x100b1
+		>;
+	};
 
-		pinctrl_pfuze: pfuze100grp1 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D20__GPIO3_IO20		0x80000000
-			>;
-		};
+	pinctrl_pfuze: pfuze100grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D20__GPIO3_IO20		0x80000000
+		>;
+	};
 
-		pinctrl_stmpe1: stmpe1grp {
-			fsl,pins = <MX6QDL_PAD_EIM_D30__GPIO3_IO30 0x80000000>;
-		};
+	pinctrl_stmpe1: stmpe1grp {
+		fsl,pins = <MX6QDL_PAD_EIM_D30__GPIO3_IO30 0x80000000>;
+	};
 
-		pinctrl_stmpe2: stmpe2grp {
-			fsl,pins = <MX6QDL_PAD_EIM_A25__GPIO5_IO02 0x80000000>;
-		};
+	pinctrl_stmpe2: stmpe2grp {
+		fsl,pins = <MX6QDL_PAD_EIM_A25__GPIO5_IO02 0x80000000>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
-				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
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
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
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
-				MX6QDL_PAD_SD4_DAT4__SD4_DATA4		0x17059
-				MX6QDL_PAD_SD4_DAT5__SD4_DATA5		0x17059
-				MX6QDL_PAD_SD4_DAT6__SD4_DATA6		0x17059
-				MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
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
+			MX6QDL_PAD_SD4_DAT4__SD4_DATA4		0x17059
+			MX6QDL_PAD_SD4_DAT5__SD4_DATA5		0x17059
+			MX6QDL_PAD_SD4_DAT6__SD4_DATA6		0x17059
+			MX6QDL_PAD_SD4_DAT7__SD4_DATA7		0x17059
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts
index ce55c9558679b..e0d29b07fbb1f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts
@@ -70,58 +70,56 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
-	imx6q-gk802 {
-		pinctrl_hog: hoggrp {
-			fsl,pins = <
-				/* Recovery button, active-low */
-				MX6QDL_PAD_EIM_D16__GPIO3_IO16  0x100b1
-				/* RTL8192CU enable GPIO, active-low */
-				MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
-			>;
-		};
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* Recovery button, active-low */
+			MX6QDL_PAD_EIM_D16__GPIO3_IO16  0x100b1
+			/* RTL8192CU enable GPIO, active-low */
+			MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
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
-				MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_GPIO_16__I2C3_SDA		0x4001b8b1
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
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
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
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
index a603562ea49af..46e011a363e88 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
@@ -217,120 +217,118 @@ &i2c2 {
 };
 
 &iomuxc {
-	h100 {
-		pinctrl_h100_hdmi: h100-hdmi {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE	0x1f8b0
-			>;
-		};
+	pinctrl_h100_hdmi: h100-hdmigrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE	0x1f8b0
+		>;
+	};
 
-		pinctrl_h100_i2c1: h100-i2c1 {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
-				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_h100_i2c1: h100-i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_h100_i2c2: h100-i2c2 {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
-			>;
-		};
+	pinctrl_h100_i2c2: h100-i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
 
-		pinctrl_h100_leds: pinctrl-h100-leds {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_DA0__GPIO3_IO00		0x1b0b0
-				MX6QDL_PAD_EIM_EB1__GPIO2_IO29		0x1b0b0
-				MX6QDL_PAD_EIM_EB0__GPIO2_IO28		0x1b0b0
-			>;
-		};
+	pinctrl_h100_leds: pinctrl-h100-ledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA0__GPIO3_IO00		0x1b0b0
+			MX6QDL_PAD_EIM_EB1__GPIO2_IO29		0x1b0b0
+			MX6QDL_PAD_EIM_EB0__GPIO2_IO28		0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_reg_hdmi: h100-reg-hdmi {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_A18__GPIO2_IO20		0x1b0b0
-			>;
-		};
+	pinctrl_h100_reg_hdmi: h100-reg-hdmigrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A18__GPIO2_IO20		0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_sgtl5000: h100-sgtl5000 {
-			fsl,pins = <
-				MX6QDL_PAD_DISP0_DAT19__AUD5_RXD	0x130b0
-				MX6QDL_PAD_KEY_COL0__AUD5_TXC		0x130b0
-				MX6QDL_PAD_KEY_ROW0__AUD5_TXD		0x110b0
-				MX6QDL_PAD_KEY_COL1__AUD5_TXFS		0x130b0
-				MX6QDL_PAD_GPIO_5__CCM_CLKO1		0x130b0
-			>;
-		};
+	pinctrl_h100_sgtl5000: h100-sgtl5000grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT19__AUD5_RXD	0x130b0
+			MX6QDL_PAD_KEY_COL0__AUD5_TXC		0x130b0
+			MX6QDL_PAD_KEY_ROW0__AUD5_TXD		0x110b0
+			MX6QDL_PAD_KEY_COL1__AUD5_TXFS		0x130b0
+			MX6QDL_PAD_GPIO_5__CCM_CLKO1		0x130b0
+		>;
+	};
 
-		pinctrl_h100_tc358743: h100-tc358743 {
-			fsl,pins = <
-				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x1b0b0
-			>;
-		};
+	pinctrl_h100_tc358743: h100-tc358743grp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_uart2: h100-uart2 {
-			fsl,pins = <
-				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
-				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
-			>;
-		};
+	pinctrl_h100_uart2: h100-uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+		>;
+	};
 
-		pinctrl_h100_usbh1_vbus: hummingboard-usbh1-vbus {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0
-			>;
-		};
+	pinctrl_h100_usbh1_vbus: hummingboard-usbh1-vbusgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_usbotg_id: hummingboard-usbotg-id {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x13059
-			>;
-		};
+	pinctrl_h100_usbotg_id: hummingboard-usbotg-idgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x13059
+		>;
+	};
 
-		pinctrl_h100_usbotg_vbus: hummingboard-usbotg-vbus {
-			fsl,pins = <
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0
-			>;
-		};
+	pinctrl_h100_usbotg_vbus: hummingboard-usbotg-vbusgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_usdhc2: h100-usdhc2 {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1f071
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x13059
-				MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
-			>;
-		};
+	pinctrl_h100_usdhc2: h100-usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1f071
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x13059
+			MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_usdhc2_100mhz: h100-usdhc2-100mhz {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1f071
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170b9
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100b9
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x170b9
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x170b9
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x170b9
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
-				MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
-			>;
-		};
+	pinctrl_h100_usdhc2_100mhz: h100-usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1f071
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170b9
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100b9
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x170b9
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x170b9
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x170b9
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
+			MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
+		>;
+	};
 
-		pinctrl_h100_usdhc2_200mhz: h100-usdhc2-200mhz {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1f071
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170f9
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100f9
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x170f9
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x170f9
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x170f9
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x170f9
-				MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
-			>;
-		};
+	pinctrl_h100_usdhc2_200mhz: h100-usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1f071
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170f9
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100f9
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x170f9
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x170f9
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x170f9
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x170f9
+			MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts b/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts
index 46a4ddedb4236..86b813a57c1e4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts
@@ -110,13 +110,13 @@ &reg_hdmi {
 };
 
 &iomuxc {
-	pinctrl_lcd_reg: lcdreg {
+	pinctrl_lcd_reg: lcdreggrp {
 		fsl,pins = <
 			MX6QDL_PAD_DI0_PIN15__GPIO4_IO17	0x100b0	/* R_LCD_PANEL_PWR */
 		>;
 	};
 
-	pinctrl_lcd_reset: lcdreset {
+	pinctrl_lcd_reset: lcdresetgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_A25__GPIO5_IO02	0x100b0	/* LCD_nRESET */
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi
index 0d7be45672916..1e5eb837fd80d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi
@@ -32,7 +32,7 @@ &sata {
 };
 
 &iomuxc {
-	pinctrl_ecspi5_mba6x: ecspi5grp-mba6x {
+	pinctrl_ecspi5_mba6x: ecspi5-mba6xgrp {
 		fsl,pins = <
 			/* HYS, SPEED = MED, 100k up, DSE = 011, SRE_FAST */
 			MX6QDL_PAD_SD1_DAT0__ECSPI5_MISO 0x1b099
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index d392b5bd2eea8..8c3a9ea8d5b34 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -530,7 +530,7 @@ &usdhc3 {
 };
 
 &iomuxc {
-	pinctrl_audmux_novena: audmuxgrp-novena {
+	pinctrl_audmux_novena: audmux-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
 			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
@@ -539,7 +539,7 @@ MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
 		>;
 	};
 
-	pinctrl_backlight_novena: backlightgrp-novena {
+	pinctrl_backlight_novena: backlight-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_DISP0_DAT8__PWM1_OUT		0x1b0b0
 			MX6QDL_PAD_CSI0_DAT10__GPIO5_IO28	0x1b0b1
@@ -547,7 +547,7 @@ MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x1b0b1
 		>;
 	};
 
-	pinctrl_ecspi3_novena: ecspi3grp-novena {
+	pinctrl_ecspi3_novena: ecspi3-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO	0x100b1
 			MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI	0x100b1
@@ -555,7 +555,7 @@ MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK	0x100b1
 		>;
 	};
 
-	pinctrl_enet_novena: enetgrp-novena {
+	pinctrl_enet_novena: enet-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
 			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
@@ -578,7 +578,7 @@ MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x1b0b1
 		>;
 	};
 
-	pinctrl_fpga_gpio: fpgagpiogrp-novena {
+	pinctrl_fpga_gpio: fpgagpio-novenagrp {
 		fsl,pins = <
 			/* FPGA power */
 			MX6QDL_PAD_SD1_DAT1__GPIO1_IO17		0x1b0b1
@@ -614,7 +614,7 @@ MX6QDL_PAD_EIM_BCLK__GPIO6_IO31		0x1b0b1
 		>;
 	};
 
-	pinctrl_fpga_eim: fpgaeimgrp-novena {
+	pinctrl_fpga_eim: fpgaeim-novenagrp {
 		fsl,pins = <
 			/* FPGA power */
 			MX6QDL_PAD_SD1_DAT1__GPIO1_IO17		0x1b0b1
@@ -650,7 +650,7 @@ MX6QDL_PAD_EIM_BCLK__EIM_BCLK		0xb0f1
 		>;
 	};
 
-	pinctrl_gpio_keys_novena: gpiokeysgrp-novena {
+	pinctrl_gpio_keys_novena: gpiokeys-novenagrp {
 		fsl,pins = <
 			/* User button */
 			MX6QDL_PAD_KEY_COL4__GPIO4_IO14		0x1b0b0
@@ -661,35 +661,35 @@ MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x1b0b0
 		>;
 	};
 
-	pinctrl_hdmi_novena: hdmigrp-novena {
+	pinctrl_hdmi_novena: hdmi-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE	0x1f8b0
 			MX6QDL_PAD_EIM_A24__GPIO5_IO04		0x1b0b1
 		>;
 	};
 
-	pinctrl_i2c1_novena: i2c1grp-novena {
+	pinctrl_i2c1_novena: i2c1-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
 			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
 		>;
 	};
 
-	pinctrl_i2c2_novena: i2c2grp-novena {
+	pinctrl_i2c2_novena: i2c2-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_EB2__I2C2_SCL		0x4001b8b1
 			MX6QDL_PAD_EIM_D16__I2C2_SDA		0x4001b8b1
 		>;
 	};
 
-	pinctrl_i2c3_novena: i2c3grp-novena {
+	pinctrl_i2c3_novena: i2c3-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b8b1
 			MX6QDL_PAD_EIM_D18__I2C3_SDA		0x4001b8b1
 		>;
 	};
 
-	pinctrl_kpp_novena: kppgrp-novena {
+	pinctrl_kpp_novena: kpp-novenagrp {
 		fsl,pins = <
 			/* Front panel button */
 			MX6QDL_PAD_KEY_ROW1__KEY_ROW1		0x1b0b1
@@ -698,13 +698,13 @@ MX6QDL_PAD_KEY_COL1__KEY_COL1		0x1b0b1
 		>;
 	};
 
-	pinctrl_leds_novena: ledsgrp-novena {
+	pinctrl_leds_novena: leds-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD1_DAT3__GPIO1_IO21		0x1b0b1
 		>;
 	};
 
-	pinctrl_pcie_novena: pciegrp-novena {
+	pinctrl_pcie_novena: pcie-novenagrp {
 		fsl,pins = <
 			/* Reset */
 			MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x1b0b1
@@ -715,13 +715,13 @@ MX6QDL_PAD_EIM_A22__GPIO2_IO16		0x1b0b1
 		>;
 	};
 
-	pinctrl_sata_novena: satagrp-novena {
+	pinctrl_sata_novena: sata-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D30__GPIO3_IO30		0x1b0b1
 		>;
 	};
 
-	pinctrl_senoko_novena: senokogrp-novena {
+	pinctrl_senoko_novena: senoko-novenagrp {
 		fsl,pins = <
 			/* Senoko IRQ line */
 			MX6QDL_PAD_SD1_CLK__GPIO1_IO20		0x13048
@@ -730,7 +730,7 @@ MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x1b0b1
 		>;
 	};
 
-	pinctrl_sound_novena: soundgrp-novena {
+	pinctrl_sound_novena: sound-novenagrp {
 		fsl,pins = <
 			/* Audio power regulator */
 			MX6QDL_PAD_DISP0_DAT23__GPIO5_IO17	0x1b0b1
@@ -740,41 +740,41 @@ MX6QDL_PAD_GPIO_0__CCM_CLKO1		0x000b0
 		>;
 	};
 
-	pinctrl_stmpe_novena: stmpegrp-novena {
+	pinctrl_stmpe_novena: stmpe-novenagrp {
 		fsl,pins = <
 			/* Touchscreen interrupt */
 			MX6QDL_PAD_DISP0_DAT19__GPIO5_IO13	0x1b0b1
 		>;
 	};
 
-	pinctrl_uart2_novena: uart2grp-novena {
+	pinctrl_uart2_novena: uart2-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D26__UART2_TX_DATA	0x1b0b1
 			MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
 		>;
 	};
 
-	pinctrl_uart3_novena: uart3grp-novena {
+	pinctrl_uart3_novena: uart3-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
 			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
 		>;
 	};
 
-	pinctrl_uart4_novena: uart4grp-novena {
+	pinctrl_uart4_novena: uart4-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT12__UART4_TX_DATA	0x1b0b1
 			MX6QDL_PAD_CSI0_DAT13__UART4_RX_DATA	0x1b0b1
 		>;
 	};
 
-	pinctrl_usbotg_novena: usbotggrp-novena {
+	pinctrl_usbotg_novena: usbotg-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
 		>;
 	};
 
-	pinctrl_usdhc2_novena: usdhc2grp-novena {
+	pinctrl_usdhc2_novena: usdhc2-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x170f9
 			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x100f9
@@ -789,7 +789,7 @@ MX6QDL_PAD_GPIO_4__GPIO1_IO04		0x1b0b1
 		>;
 	};
 
-	pinctrl_usdhc3_novena: usdhc3grp-novena {
+	pinctrl_usdhc3_novena: usdhc3-novenagrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x170f9
 			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x100f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts b/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
index 8d2b608e0b90f..fb81bd8ba0351 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
@@ -546,7 +546,7 @@ MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x10880
 		>;
 	};
 
-	pinctrl_wifi_npd: wifinpd {
+	pinctrl_wifi_npd: wifinpdgrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1b8b0
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
index 792b8903d3451..0e02e448db108 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
@@ -133,7 +133,7 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usb_eth_chg>;
 
-	pinctrl_can1phy: can1phy {
+	pinctrl_can1phy: can1phygrp {
 		fsl,pins = <
 			/* CAN1_SR */
 			MX6QDL_PAD_KEY_COL3__GPIO4_IO12	0x13070
@@ -187,7 +187,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x170b9
 		>;
 	};
 
-	pinctrl_wifi_npd: wifinpd {
+	pinctrl_wifi_npd: wifinpdgrp {
 		fsl,pins = <
 			/* WL_REG_ON */
 			MX6QDL_PAD_NANDF_RB0__GPIO6_IO10	0x13069
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-sbc6x.dts b/arch/arm/boot/dts/nxp/imx/imx6q-sbc6x.dts
index 9054c1d58b9d1..84fbcd1291796 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-sbc6x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-sbc6x.dts
@@ -25,51 +25,49 @@ &fec {
 };
 
 &iomuxc {
-	imx6q-sbc6x {
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
-				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
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
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
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
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__USB_OTG_ID		0x17059
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
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
index ad59b23ef27a0..aae81feee00db 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
@@ -296,7 +296,7 @@ MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x17059
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x170B9
 			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x100B9
@@ -307,7 +307,7 @@ MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x170B9
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x170F9
 			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x100F9
-- 
2.45.2



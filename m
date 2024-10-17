Return-Path: <linux-gpio+bounces-11579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 338909A2F64
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B451B23A68
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A244C1EE013;
	Thu, 17 Oct 2024 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="GX842lCt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884A1EE03D;
	Thu, 17 Oct 2024 21:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199601; cv=none; b=IBqn/r21bOl9FvKut3Mb5xx6fN+UDvxp+m182BJ9ga6Ch+JHyBSsRYA5itxQBVeQ5TiNnIO2oDvZHsY47Qi5wcNPeg/xoR2APDJqESjW9wi2SRW/6Th2N1MsEo2U1jeFxp0vnNu7VMmz1dJeILD5YBLAoC0Y4OFrdp10/af8yYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199601; c=relaxed/simple;
	bh=cywDBx4ZPUhdkfU4wW4d4oOxBH6J2QV1w7NaqclXN7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1/3miTwqNVvzwGPiOuDPASvVxTIEAJCkcrMD+PnNMUaxfKtbYAOn0pBHvpDIizPt/tVIdvvpIMrFP3Ve37ujZiN/TkBxYK/9XRnFjqqppPWH2/ymzDMCUnSQjqG/VrYSF3ildtJiEtcjRzboUY2nWuLpWl6DZZeOh9XYzjruYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=GX842lCt; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 46615890BC;
	Thu, 17 Oct 2024 23:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199595;
	bh=aAgUNDqTzDaeTPIf6ltXf26zphDL1DqoFVzjJL/FSHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GX842lCtbiBgLnpdPw6fmVDQBDKvwPh0bd8f4yK6YMWRWGiweduZwrOZm8xktagZ7
	 yzfVLoEsyg9S2qngNaS/Ig/AtBFwWh3NcHPbv5UpfEm3vyW5tsBBO1gSDNd53KyTI+
	 M7DgWjkdhxr/XxT3/YVt5GrpjSWyJD+oNMRAvBPjqFWGsdjphDXzCacWRwUTjO/qL5
	 tgxT2cIlOEPrx2F7lupajupa7VyAcYoK5l6ZBlrm2othM0HuGVZdg8FyS0ZKuH7I0t
	 37YofdNmO4EQdFK54XwbjfDw1Po6lHF1k+aIRqMifFuSzKFbbXX+Jh18GzinnzPAA+
	 7cOx/QtpFY7NQ==
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
Subject: [PATCH v3 11/12] ARM: dts: imx6sx: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:28 +0200
Message-ID: <20241017211241.170861-11-marex@denx.de>
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
V3: No change
---
 .../arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     | 572 +++++++++---------
 .../nxp/imx/imx6sx-softing-vining-2000.dts    |  18 +-
 3 files changed, 296 insertions(+), 298 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
index dfbfb8119bf3b..033700e052b36 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
@@ -333,7 +333,7 @@ MX6SX_PAD_KEY_ROW0__GPIO2_IO_15		0x17059 /* WP */
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170b9
 			MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100b9
@@ -348,7 +348,7 @@ MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170f9
 			MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100f9
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 277a6e039045b..1beac42c1a273 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -399,323 +399,321 @@ &wdog1 {
 };
 
 &iomuxc {
-	imx6x-sdb {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX6SX_PAD_CSI_DATA00__AUDMUX_AUD6_TXC	0x130b0
-				MX6SX_PAD_CSI_DATA01__AUDMUX_AUD6_TXFS	0x130b0
-				MX6SX_PAD_CSI_HSYNC__AUDMUX_AUD6_TXD	0x120b0
-				MX6SX_PAD_CSI_VSYNC__AUDMUX_AUD6_RXD	0x130b0
-				MX6SX_PAD_CSI_PIXCLK__AUDMUX_MCLK	0x130b0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6SX_PAD_CSI_DATA00__AUDMUX_AUD6_TXC	0x130b0
+			MX6SX_PAD_CSI_DATA01__AUDMUX_AUD6_TXFS	0x130b0
+			MX6SX_PAD_CSI_HSYNC__AUDMUX_AUD6_TXD	0x120b0
+			MX6SX_PAD_CSI_VSYNC__AUDMUX_AUD6_RXD	0x130b0
+			MX6SX_PAD_CSI_PIXCLK__AUDMUX_MCLK	0x130b0
+		>;
+	};
 
-		pinctrl_enet1: enet1grp {
-			fsl,pins = <
-				MX6SX_PAD_ENET1_MDIO__ENET1_MDIO	0xa0b1
-				MX6SX_PAD_ENET1_MDC__ENET1_MDC		0xa0b1
-				MX6SX_PAD_RGMII1_TXC__ENET1_RGMII_TXC	0xa0b1
-				MX6SX_PAD_RGMII1_TD0__ENET1_TX_DATA_0	0xa0b1
-				MX6SX_PAD_RGMII1_TD1__ENET1_TX_DATA_1	0xa0b1
-				MX6SX_PAD_RGMII1_TD2__ENET1_TX_DATA_2	0xa0b1
-				MX6SX_PAD_RGMII1_TD3__ENET1_TX_DATA_3	0xa0b1
-				MX6SX_PAD_RGMII1_TX_CTL__ENET1_TX_EN	0xa0b1
-				MX6SX_PAD_RGMII1_RXC__ENET1_RX_CLK	0x3081
-				MX6SX_PAD_RGMII1_RD0__ENET1_RX_DATA_0	0x3081
-				MX6SX_PAD_RGMII1_RD1__ENET1_RX_DATA_1	0x3081
-				MX6SX_PAD_RGMII1_RD2__ENET1_RX_DATA_2	0x3081
-				MX6SX_PAD_RGMII1_RD3__ENET1_RX_DATA_3	0x3081
-				MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN	0x3081
-				MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M	0x91
-				/* phy reset */
-				MX6SX_PAD_ENET2_CRS__GPIO2_IO_7		0x10b0
-			>;
-		};
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6SX_PAD_ENET1_MDIO__ENET1_MDIO	0xa0b1
+			MX6SX_PAD_ENET1_MDC__ENET1_MDC		0xa0b1
+			MX6SX_PAD_RGMII1_TXC__ENET1_RGMII_TXC	0xa0b1
+			MX6SX_PAD_RGMII1_TD0__ENET1_TX_DATA_0	0xa0b1
+			MX6SX_PAD_RGMII1_TD1__ENET1_TX_DATA_1	0xa0b1
+			MX6SX_PAD_RGMII1_TD2__ENET1_TX_DATA_2	0xa0b1
+			MX6SX_PAD_RGMII1_TD3__ENET1_TX_DATA_3	0xa0b1
+			MX6SX_PAD_RGMII1_TX_CTL__ENET1_TX_EN	0xa0b1
+			MX6SX_PAD_RGMII1_RXC__ENET1_RX_CLK	0x3081
+			MX6SX_PAD_RGMII1_RD0__ENET1_RX_DATA_0	0x3081
+			MX6SX_PAD_RGMII1_RD1__ENET1_RX_DATA_1	0x3081
+			MX6SX_PAD_RGMII1_RD2__ENET1_RX_DATA_2	0x3081
+			MX6SX_PAD_RGMII1_RD3__ENET1_RX_DATA_3	0x3081
+			MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN	0x3081
+			MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M	0x91
+			/* phy reset */
+			MX6SX_PAD_ENET2_CRS__GPIO2_IO_7		0x10b0
+		>;
+	};
 
-		pinctrl_enet_3v3: enet3v3grp {
-			fsl,pins = <
-				MX6SX_PAD_ENET2_COL__GPIO2_IO_6		0x80000000
-			>;
-		};
+	pinctrl_enet_3v3: enet3v3grp {
+		fsl,pins = <
+			MX6SX_PAD_ENET2_COL__GPIO2_IO_6		0x80000000
+		>;
+	};
 
-		pinctrl_enet2: enet2grp {
-			fsl,pins = <
-				MX6SX_PAD_RGMII2_TXC__ENET2_RGMII_TXC	0xa0b9
-				MX6SX_PAD_RGMII2_TD0__ENET2_TX_DATA_0	0xa0b1
-				MX6SX_PAD_RGMII2_TD1__ENET2_TX_DATA_1	0xa0b1
-				MX6SX_PAD_RGMII2_TD2__ENET2_TX_DATA_2	0xa0b1
-				MX6SX_PAD_RGMII2_TD3__ENET2_TX_DATA_3	0xa0b1
-				MX6SX_PAD_RGMII2_TX_CTL__ENET2_TX_EN	0xa0b1
-				MX6SX_PAD_RGMII2_RXC__ENET2_RX_CLK	0x3081
-				MX6SX_PAD_RGMII2_RD0__ENET2_RX_DATA_0	0x3081
-				MX6SX_PAD_RGMII2_RD1__ENET2_RX_DATA_1	0x3081
-				MX6SX_PAD_RGMII2_RD2__ENET2_RX_DATA_2	0x3081
-				MX6SX_PAD_RGMII2_RD3__ENET2_RX_DATA_3	0x3081
-				MX6SX_PAD_RGMII2_RX_CTL__ENET2_RX_EN	0x3081
-			>;
-		};
+	pinctrl_enet2: enet2grp {
+		fsl,pins = <
+			MX6SX_PAD_RGMII2_TXC__ENET2_RGMII_TXC	0xa0b9
+			MX6SX_PAD_RGMII2_TD0__ENET2_TX_DATA_0	0xa0b1
+			MX6SX_PAD_RGMII2_TD1__ENET2_TX_DATA_1	0xa0b1
+			MX6SX_PAD_RGMII2_TD2__ENET2_TX_DATA_2	0xa0b1
+			MX6SX_PAD_RGMII2_TD3__ENET2_TX_DATA_3	0xa0b1
+			MX6SX_PAD_RGMII2_TX_CTL__ENET2_TX_EN	0xa0b1
+			MX6SX_PAD_RGMII2_RXC__ENET2_RX_CLK	0x3081
+			MX6SX_PAD_RGMII2_RD0__ENET2_RX_DATA_0	0x3081
+			MX6SX_PAD_RGMII2_RD1__ENET2_RX_DATA_1	0x3081
+			MX6SX_PAD_RGMII2_RD2__ENET2_RX_DATA_2	0x3081
+			MX6SX_PAD_RGMII2_RD3__ENET2_RX_DATA_3	0x3081
+			MX6SX_PAD_RGMII2_RX_CTL__ENET2_RX_EN	0x3081
+		>;
+	};
 
-		pinctrl_flexcan1: flexcan1grp {
-			fsl,pins = <
-				MX6SX_PAD_QSPI1B_DQS__CAN1_TX		0x1b020
-				MX6SX_PAD_QSPI1A_SS1_B__CAN1_RX		0x1b020
-			>;
-		};
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6SX_PAD_QSPI1B_DQS__CAN1_TX		0x1b020
+			MX6SX_PAD_QSPI1A_SS1_B__CAN1_RX		0x1b020
+		>;
+	};
 
-		pinctrl_flexcan2: flexcan2grp {
-			fsl,pins = <
-				MX6SX_PAD_QSPI1B_SS1_B__CAN2_RX		0x1b020
-				MX6SX_PAD_QSPI1A_DQS__CAN2_TX		0x1b020
-			>;
-		};
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX6SX_PAD_QSPI1B_SS1_B__CAN2_RX		0x1b020
+			MX6SX_PAD_QSPI1A_DQS__CAN2_TX		0x1b020
+		>;
+	};
 
-		pinctrl_gpio_keys: gpio_keysgrp {
-			fsl,pins = <
-				MX6SX_PAD_CSI_DATA04__GPIO1_IO_18 0x17059
-				MX6SX_PAD_CSI_DATA05__GPIO1_IO_19 0x17059
-			>;
-		};
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX6SX_PAD_CSI_DATA04__GPIO1_IO_18 0x17059
+			MX6SX_PAD_CSI_DATA05__GPIO1_IO_19 0x17059
+		>;
+	};
 
-		pinctrl_hp: hpgrp {
-			fsl,pins = <
-				MX6SX_PAD_CSI_DATA03__GPIO1_IO_17 0x17059
-			>;
-		};
+	pinctrl_hp: hpgrp {
+		fsl,pins = <
+			MX6SX_PAD_CSI_DATA03__GPIO1_IO_17 0x17059
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX6SX_PAD_GPIO1_IO01__I2C1_SDA		0x4001b8b1
-				MX6SX_PAD_GPIO1_IO00__I2C1_SCL		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO01__I2C1_SDA		0x4001b8b1
+			MX6SX_PAD_GPIO1_IO00__I2C1_SCL		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c3: i2c3grp {
-			fsl,pins = <
-				MX6SX_PAD_KEY_ROW4__I2C3_SDA		0x4001b8b1
-				MX6SX_PAD_KEY_COL4__I2C3_SCL		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6SX_PAD_KEY_ROW4__I2C3_SDA		0x4001b8b1
+			MX6SX_PAD_KEY_COL4__I2C3_SCL		0x4001b8b1
+		>;
+	};
 
-		pinctrl_i2c4: i2c4grp {
-			fsl,pins = <
-				MX6SX_PAD_CSI_DATA07__I2C4_SDA		0x4001b8b1
-				MX6SX_PAD_CSI_DATA06__I2C4_SCL		0x4001b8b1
-			>;
-		};
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX6SX_PAD_CSI_DATA07__I2C4_SDA		0x4001b8b1
+			MX6SX_PAD_CSI_DATA06__I2C4_SCL		0x4001b8b1
+		>;
+	};
 
-		pinctrl_lcd: lcdgrp {
-			fsl,pins = <
-				MX6SX_PAD_LCD1_DATA00__LCDIF1_DATA_0 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA01__LCDIF1_DATA_1 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA02__LCDIF1_DATA_2 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA03__LCDIF1_DATA_3 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA04__LCDIF1_DATA_4 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA05__LCDIF1_DATA_5 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA06__LCDIF1_DATA_6 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA07__LCDIF1_DATA_7 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA08__LCDIF1_DATA_8 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA09__LCDIF1_DATA_9 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA10__LCDIF1_DATA_10 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA11__LCDIF1_DATA_11 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA12__LCDIF1_DATA_12 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA13__LCDIF1_DATA_13 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA14__LCDIF1_DATA_14 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA15__LCDIF1_DATA_15 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA16__LCDIF1_DATA_16 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA17__LCDIF1_DATA_17 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA18__LCDIF1_DATA_18 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA19__LCDIF1_DATA_19 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA20__LCDIF1_DATA_20 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA21__LCDIF1_DATA_21 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA22__LCDIF1_DATA_22 0x4001b0b0
-				MX6SX_PAD_LCD1_DATA23__LCDIF1_DATA_23 0x4001b0b0
-				MX6SX_PAD_LCD1_CLK__LCDIF1_CLK	0x4001b0b0
-				MX6SX_PAD_LCD1_ENABLE__LCDIF1_ENABLE 0x4001b0b0
-				MX6SX_PAD_LCD1_VSYNC__LCDIF1_VSYNC 0x4001b0b0
-				MX6SX_PAD_LCD1_HSYNC__LCDIF1_HSYNC 0x4001b0b0
-				MX6SX_PAD_LCD1_RESET__GPIO3_IO_27 0x4001b0b0
-			>;
-		};
+	pinctrl_lcd: lcdgrp {
+		fsl,pins = <
+			MX6SX_PAD_LCD1_DATA00__LCDIF1_DATA_0 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA01__LCDIF1_DATA_1 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA02__LCDIF1_DATA_2 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA03__LCDIF1_DATA_3 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA04__LCDIF1_DATA_4 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA05__LCDIF1_DATA_5 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA06__LCDIF1_DATA_6 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA07__LCDIF1_DATA_7 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA08__LCDIF1_DATA_8 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA09__LCDIF1_DATA_9 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA10__LCDIF1_DATA_10 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA11__LCDIF1_DATA_11 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA12__LCDIF1_DATA_12 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA13__LCDIF1_DATA_13 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA14__LCDIF1_DATA_14 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA15__LCDIF1_DATA_15 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA16__LCDIF1_DATA_16 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA17__LCDIF1_DATA_17 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA18__LCDIF1_DATA_18 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA19__LCDIF1_DATA_19 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA20__LCDIF1_DATA_20 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA21__LCDIF1_DATA_21 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA22__LCDIF1_DATA_22 0x4001b0b0
+			MX6SX_PAD_LCD1_DATA23__LCDIF1_DATA_23 0x4001b0b0
+			MX6SX_PAD_LCD1_CLK__LCDIF1_CLK	0x4001b0b0
+			MX6SX_PAD_LCD1_ENABLE__LCDIF1_ENABLE 0x4001b0b0
+			MX6SX_PAD_LCD1_VSYNC__LCDIF1_VSYNC 0x4001b0b0
+			MX6SX_PAD_LCD1_HSYNC__LCDIF1_HSYNC 0x4001b0b0
+			MX6SX_PAD_LCD1_RESET__GPIO3_IO_27 0x4001b0b0
+		>;
+	};
 
-		pinctrl_mqs: mqsgrp {
-			fsl,pins = <
-				MX6SX_PAD_SD2_CLK__MQS_RIGHT 0x120b0
-				MX6SX_PAD_SD2_CMD__MQS_LEFT  0x120b0
-			>;
-		};
+	pinctrl_mqs: mqsgrp {
+		fsl,pins = <
+			MX6SX_PAD_SD2_CLK__MQS_RIGHT 0x120b0
+			MX6SX_PAD_SD2_CMD__MQS_LEFT  0x120b0
+		>;
+	};
 
-		pinctrl_pcie: pciegrp {
-			fsl,pins = <
-				MX6SX_PAD_ENET1_COL__GPIO2_IO_0 0x10b0
-			>;
-		};
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX6SX_PAD_ENET1_COL__GPIO2_IO_0 0x10b0
+		>;
+	};
 
-		pinctrl_pcie_reg: pciereggrp {
-			fsl,pins = <
-				MX6SX_PAD_ENET1_CRS__GPIO2_IO_1	0x10b0
-			>;
-		};
+	pinctrl_pcie_reg: pciereggrp {
+		fsl,pins = <
+			MX6SX_PAD_ENET1_CRS__GPIO2_IO_1	0x10b0
+		>;
+	};
 
-		pinctrl_peri_3v3: peri3v3grp {
-			fsl,pins = <
-				MX6SX_PAD_QSPI1A_DATA0__GPIO4_IO_16	0x80000000
-			>;
-		};
+	pinctrl_peri_3v3: peri3v3grp {
+		fsl,pins = <
+			MX6SX_PAD_QSPI1A_DATA0__GPIO4_IO_16	0x80000000
+		>;
+	};
 
-		pinctrl_pwm3: pwm3grp-1 {
-			fsl,pins = <
-				MX6SX_PAD_SD1_DATA2__PWM3_OUT 0x110b0
-			>;
-		};
+	pinctrl_pwm3: pwm3-1grp {
+		fsl,pins = <
+			MX6SX_PAD_SD1_DATA2__PWM3_OUT 0x110b0
+		>;
+	};
 
-		pinctrl_qspi2: qspi2grp {
-			fsl,pins = <
-				MX6SX_PAD_NAND_WP_B__QSPI2_A_DATA_0     0x70f1
-				MX6SX_PAD_NAND_READY_B__QSPI2_A_DATA_1  0x70f1
-				MX6SX_PAD_NAND_CE0_B__QSPI2_A_DATA_2    0x70f1
-				MX6SX_PAD_NAND_CE1_B__QSPI2_A_DATA_3    0x70f1
-				MX6SX_PAD_NAND_CLE__QSPI2_A_SCLK        0x70f1
-				MX6SX_PAD_NAND_ALE__QSPI2_A_SS0_B       0x70f1
-				MX6SX_PAD_NAND_DATA01__QSPI2_B_DATA_0   0x70f1
-				MX6SX_PAD_NAND_DATA00__QSPI2_B_DATA_1   0x70f1
-				MX6SX_PAD_NAND_WE_B__QSPI2_B_DATA_2     0x70f1
-				MX6SX_PAD_NAND_RE_B__QSPI2_B_DATA_3     0x70f1
-				MX6SX_PAD_NAND_DATA02__QSPI2_B_SCLK     0x70f1
-				MX6SX_PAD_NAND_DATA03__QSPI2_B_SS0_B    0x70f1
-			>;
-		};
+	pinctrl_qspi2: qspi2grp {
+		fsl,pins = <
+			MX6SX_PAD_NAND_WP_B__QSPI2_A_DATA_0     0x70f1
+			MX6SX_PAD_NAND_READY_B__QSPI2_A_DATA_1  0x70f1
+			MX6SX_PAD_NAND_CE0_B__QSPI2_A_DATA_2    0x70f1
+			MX6SX_PAD_NAND_CE1_B__QSPI2_A_DATA_3    0x70f1
+			MX6SX_PAD_NAND_CLE__QSPI2_A_SCLK        0x70f1
+			MX6SX_PAD_NAND_ALE__QSPI2_A_SS0_B       0x70f1
+			MX6SX_PAD_NAND_DATA01__QSPI2_B_DATA_0   0x70f1
+			MX6SX_PAD_NAND_DATA00__QSPI2_B_DATA_1   0x70f1
+			MX6SX_PAD_NAND_WE_B__QSPI2_B_DATA_2     0x70f1
+			MX6SX_PAD_NAND_RE_B__QSPI2_B_DATA_3     0x70f1
+			MX6SX_PAD_NAND_DATA02__QSPI2_B_SCLK     0x70f1
+			MX6SX_PAD_NAND_DATA03__QSPI2_B_SS0_B    0x70f1
+		>;
+	};
 
-		pinctrl_vcc_sd3: vccsd3grp {
-			fsl,pins = <
-				MX6SX_PAD_KEY_COL1__GPIO2_IO_11		0x17059
-			>;
-		};
+	pinctrl_vcc_sd3: vccsd3grp {
+		fsl,pins = <
+			MX6SX_PAD_KEY_COL1__GPIO2_IO_11		0x17059
+		>;
+	};
 
-		pinctrl_sai1: sai1grp {
-			fsl,pins = <
-				MX6SX_PAD_CSI_DATA00__SAI1_TX_BCLK	0x130b0
-				MX6SX_PAD_CSI_DATA01__SAI1_TX_SYNC	0x130b0
-				MX6SX_PAD_CSI_HSYNC__SAI1_TX_DATA_0	0x120b0
-				MX6SX_PAD_CSI_VSYNC__SAI1_RX_DATA_0	0x130b0
-				MX6SX_PAD_CSI_PIXCLK__AUDMUX_MCLK	0x130b0
-			>;
-		};
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX6SX_PAD_CSI_DATA00__SAI1_TX_BCLK	0x130b0
+			MX6SX_PAD_CSI_DATA01__SAI1_TX_SYNC	0x130b0
+			MX6SX_PAD_CSI_HSYNC__SAI1_TX_DATA_0	0x120b0
+			MX6SX_PAD_CSI_VSYNC__SAI1_RX_DATA_0	0x130b0
+			MX6SX_PAD_CSI_PIXCLK__AUDMUX_MCLK	0x130b0
+		>;
+	};
 
-		pinctrl_spdif: spdifgrp {
-			fsl,pins = <
-				MX6SX_PAD_SD4_DATA4__SPDIF_OUT          0x1b0b0
-			>;
-		};
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX6SX_PAD_SD4_DATA4__SPDIF_OUT          0x1b0b0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX6SX_PAD_GPIO1_IO04__UART1_DCE_TX	0x1b0b1
-				MX6SX_PAD_GPIO1_IO05__UART1_DCE_RX	0x1b0b1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO04__UART1_DCE_TX	0x1b0b1
+			MX6SX_PAD_GPIO1_IO05__UART1_DCE_RX	0x1b0b1
+		>;
+	};
 
-		pinctrl_uart5: uart5grp {
-			fsl,pins = <
-				MX6SX_PAD_KEY_ROW3__UART5_DCE_RX	0x1b0b1
-				MX6SX_PAD_KEY_COL3__UART5_DCE_TX	0x1b0b1
-				MX6SX_PAD_KEY_ROW2__UART5_DCE_CTS	0x1b0b1
-				MX6SX_PAD_KEY_COL2__UART5_DCE_RTS	0x1b0b1
-			>;
-		};
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX6SX_PAD_KEY_ROW3__UART5_DCE_RX	0x1b0b1
+			MX6SX_PAD_KEY_COL3__UART5_DCE_TX	0x1b0b1
+			MX6SX_PAD_KEY_ROW2__UART5_DCE_CTS	0x1b0b1
+			MX6SX_PAD_KEY_COL2__UART5_DCE_RTS	0x1b0b1
+		>;
+	};
 
-		pinctrl_usb_otg1: usbotg1grp {
-			fsl,pins = <
-				MX6SX_PAD_GPIO1_IO09__GPIO1_IO_9	0x10b0
-			>;
-		};
+	pinctrl_usb_otg1: usbotg1grp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO09__GPIO1_IO_9	0x10b0
+		>;
+	};
 
-		pinctrl_usb_otg1_id: usbotg1idgrp {
-			fsl,pins = <
-				MX6SX_PAD_GPIO1_IO10__ANATOP_OTG1_ID	0x17059
-			>;
-		};
+	pinctrl_usb_otg1_id: usbotg1idgrp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO10__ANATOP_OTG1_ID	0x17059
+		>;
+	};
 
-		pinctrl_usb_otg2: usbot2ggrp {
-			fsl,pins = <
-				MX6SX_PAD_GPIO1_IO12__GPIO1_IO_12	0x10b0
-			>;
-		};
+	pinctrl_usb_otg2: usbot2ggrp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO12__GPIO1_IO_12	0x10b0
+		>;
+	};
 
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x17059
-				MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x10059
-				MX6SX_PAD_SD2_DATA0__USDHC2_DATA0	0x17059
-				MX6SX_PAD_SD2_DATA1__USDHC2_DATA1	0x17059
-				MX6SX_PAD_SD2_DATA2__USDHC2_DATA2	0x17059
-				MX6SX_PAD_SD2_DATA3__USDHC2_DATA3	0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x17059
+			MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x10059
+			MX6SX_PAD_SD2_DATA0__USDHC2_DATA0	0x17059
+			MX6SX_PAD_SD2_DATA1__USDHC2_DATA1	0x17059
+			MX6SX_PAD_SD2_DATA2__USDHC2_DATA2	0x17059
+			MX6SX_PAD_SD2_DATA3__USDHC2_DATA3	0x17059
+		>;
+	};
 
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x17059
-				MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x10059
-				MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x17059
-				MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x17059
-				MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x17059
-				MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x17059
-				MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x17059
-				MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x17059
-				MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x17059
-				MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x17059
-				MX6SX_PAD_KEY_COL0__GPIO2_IO_10		0x17059 /* CD */
-				MX6SX_PAD_KEY_ROW0__GPIO2_IO_15		0x17059 /* WP */
-			>;
-		};
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x17059
+			MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x10059
+			MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x17059
+			MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x17059
+			MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x17059
+			MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x17059
+			MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x17059
+			MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x17059
+			MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x17059
+			MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x17059
+			MX6SX_PAD_KEY_COL0__GPIO2_IO_10		0x17059 /* CD */
+			MX6SX_PAD_KEY_ROW0__GPIO2_IO_15		0x17059 /* WP */
+		>;
+	};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
-			fsl,pins = <
-				MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170b9
-				MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100b9
-				MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x170b9
-				MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x170b9
-				MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x170b9
-				MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x170b9
-				MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x170b9
-				MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x170b9
-				MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x170b9
-				MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170b9
-			>;
-		};
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170b9
+			MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100b9
+			MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x170b9
+			MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x170b9
+			MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x170b9
+			MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x170b9
+			MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x170b9
+			MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x170b9
+			MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x170b9
+			MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170b9
+		>;
+	};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
-			fsl,pins = <
-				MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170f9
-				MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100f9
-				MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x170f9
-				MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x170f9
-				MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x170f9
-				MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x170f9
-				MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x170f9
-				MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x170f9
-				MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x170f9
-				MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170f9
-			>;
-		};
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170f9
+			MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100f9
+			MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x170f9
+			MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x170f9
+			MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x170f9
+			MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x170f9
+			MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x170f9
+			MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x170f9
+			MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x170f9
+			MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170f9
+		>;
+	};
 
-		pinctrl_usdhc4: usdhc4grp {
-			fsl,pins = <
-				MX6SX_PAD_SD4_CMD__USDHC4_CMD		0x17059
-				MX6SX_PAD_SD4_CLK__USDHC4_CLK		0x10059
-				MX6SX_PAD_SD4_DATA0__USDHC4_DATA0	0x17059
-				MX6SX_PAD_SD4_DATA1__USDHC4_DATA1	0x17059
-				MX6SX_PAD_SD4_DATA2__USDHC4_DATA2	0x17059
-				MX6SX_PAD_SD4_DATA3__USDHC4_DATA3	0x17059
-				MX6SX_PAD_SD4_DATA7__GPIO6_IO_21	0x17059 /* CD */
-				MX6SX_PAD_SD4_DATA6__GPIO6_IO_20	0x17059 /* WP */
-			>;
-		};
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins = <
+			MX6SX_PAD_SD4_CMD__USDHC4_CMD		0x17059
+			MX6SX_PAD_SD4_CLK__USDHC4_CLK		0x10059
+			MX6SX_PAD_SD4_DATA0__USDHC4_DATA0	0x17059
+			MX6SX_PAD_SD4_DATA1__USDHC4_DATA1	0x17059
+			MX6SX_PAD_SD4_DATA2__USDHC4_DATA2	0x17059
+			MX6SX_PAD_SD4_DATA3__USDHC4_DATA3	0x17059
+			MX6SX_PAD_SD4_DATA7__GPIO6_IO_21	0x17059 /* CD */
+			MX6SX_PAD_SD4_DATA6__GPIO6_IO_20	0x17059 /* WP */
+		>;
+	};
 
-		pinctrl_wdog: wdoggrp {
-			fsl,pins = <
-				MX6SX_PAD_GPIO1_IO13__WDOG1_WDOG_ANY 0x30b0
-			>;
-		};
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO13__WDOG1_WDOG_ANY 0x30b0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index f999eb2443739..2ffbe2df4776c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -358,21 +358,21 @@ MX6SX_PAD_NAND_DATA02__GPIO4_IO_6	0x10b0
 		>;
 	};
 
-	pinctrl_pwm1: pwm1grp-1 {
+	pinctrl_pwm1: pwm1-1grp {
 		fsl,pins = <
 			/* blue LED */
 			MX6SX_PAD_RGMII2_RD3__PWM1_OUT		0x1b0b1
 		>;
 	};
 
-	pinctrl_pwm2: pwm2grp-1 {
+	pinctrl_pwm2: pwm2-1grp {
 		fsl,pins = <
 			/* green LED */
 			MX6SX_PAD_RGMII2_RD2__PWM2_OUT		0x1b0b1
 		>;
 	};
 
-	pinctrl_pwm6: pwm6grp-1 {
+	pinctrl_pwm6: pwm6-1grp {
 		fsl,pins = <
 			/* red LED */
 			MX6SX_PAD_RGMII2_TD2__PWM6_OUT		0x1b0b1
@@ -414,7 +414,7 @@ MX6SX_PAD_GPIO1_IO10__ANATOP_OTG1_ID	0x17059
 		>;
 	};
 
-	pinctrl_usdhc2_50mhz: usdhc2grp-50mhz {
+	pinctrl_usdhc2_50mhz: usdhc2-50mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x10059
 			MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x17059
@@ -427,7 +427,7 @@ MX6SX_PAD_LCD1_HSYNC__GPIO3_IO_26	0x10b0
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x100b9
 			MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x170b9
@@ -438,7 +438,7 @@ MX6SX_PAD_SD2_DATA3__USDHC2_DATA3	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp-200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x100f9
 			MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x170f9
@@ -449,7 +449,7 @@ MX6SX_PAD_SD2_DATA3__USDHC2_DATA3	0x170f9
 		>;
 	};
 
-	pinctrl_usdhc4_50mhz: usdhc4grp-50mhz {
+	pinctrl_usdhc4_50mhz: usdhc4-50mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD4_CLK__USDHC4_CLK		0x10059
 			MX6SX_PAD_SD4_CMD__USDHC4_CMD		0x17059
@@ -465,7 +465,7 @@ MX6SX_PAD_SD4_RESET_B__USDHC4_RESET_B	0x17068
 		>;
 	};
 
-	pinctrl_usdhc4_100mhz: usdhc4-100mhz {
+	pinctrl_usdhc4_100mhz: usdhc4-100mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD4_CLK__USDHC4_CLK		0x100b9
 			MX6SX_PAD_SD4_CMD__USDHC4_CMD		0x170b9
@@ -480,7 +480,7 @@ MX6SX_PAD_SD4_DATA7__USDHC4_DATA7	0x170b9
 		>;
 	};
 
-	pinctrl_usdhc4_200mhz: usdhc4-200mhz {
+	pinctrl_usdhc4_200mhz: usdhc4-200mhzgrp {
 		fsl,pins = <
 			MX6SX_PAD_SD4_CLK__USDHC4_CLK		0x100f9
 			MX6SX_PAD_SD4_CMD__USDHC4_CMD		0x170f9
-- 
2.45.2



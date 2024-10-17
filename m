Return-Path: <linux-gpio+bounces-11573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6A9A2F57
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337741F248E3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CEF1EE030;
	Thu, 17 Oct 2024 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="o6LU5kYr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529221EE00A;
	Thu, 17 Oct 2024 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199595; cv=none; b=duJgO6km1Sric8S27Wzzwlqs5WvEzMpy5YWG3OvlHmS+U3Ks7PPe2SEc5g98arXZ1BwNZvnK1dtfPTYxJFs5+nfW3JC8pUHGw6q7+VFQ9IxFm2LFXy6FwVTViV1B23dMnaNZ6jDnDgO+pm9cFdDpq8ETICTzfLS+WfB7VOx5PPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199595; c=relaxed/simple;
	bh=A2smOTUHn7raM3YyrKENNHcT7ZXsZ3xnWe6HzJOj1uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMKqQEmpPU0FjgBDhPZFAT50Idijw0Txt3HEnydDuO8pvpLak3R2pevR3jKq4qla0cGIJg18E5R9mbrcrmaiMSeU+Q7SBgIqGMBDvviDhp0P2PAlI0r3P4V7sHm2t3aHsWyPVD+/1ROpNRp17AQ/BvSsY0QnnDTu9s9n6whLZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=o6LU5kYr; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CE9C088FF6;
	Thu, 17 Oct 2024 23:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199586;
	bh=QQ/M/5hn7DD62ZKKqyl7hCHrvowDfRaTRJ1/jBsWlDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o6LU5kYr5iZONPQq05xBl6XlpV2j6iFrBzRRWgTRiGCBiCNBjN45vCp74a677TLr7
	 +5BC2/RTlpOZleO9Jxv5U0ND8JlrEBIqF7dReygGfjllUGnPF4qn6Y60rzDzX5Hbll
	 tgGcbzjBYit7+TCt/7MMszfjgFK4KujT6FdQjD4FXPoOqBpDEpaOMX/kb59l9RV9uN
	 OsrNWg9eb73hasX7u7EwnWynvdXUmrIaht8xG2EYwpcbwx3OGm5x018rR6hu4rW5zO
	 ZJLz1Fe7Bfa/YupJSPFGsNBIr9DVJPEKMoDMILySALH9HZA2qk3zeOCs3xTbBCexr2
	 chwsfT4f9blww==
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
Subject: [PATCH v3 02/12] ARM: dts: imx35: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:19 +0200
Message-ID: <20241017211241.170861-2-marex@denx.de>
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
 .../dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi    | 62 +++++++------
 .../imx/imx35-eukrea-mbimxsd35-baseboard.dts  | 88 +++++++++----------
 arch/arm/boot/dts/nxp/imx/imx35-pdk.dts       | 38 ++++----
 arch/arm/boot/dts/nxp/imx/imx35.dtsi          |  2 +-
 4 files changed, 92 insertions(+), 98 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi
index 17bd2a97609ab..ef546525e2ec8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi
@@ -44,40 +44,38 @@ tsc2007: tsc2007@48 {
 };
 
 &iomuxc {
-	imx35-eukrea {
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX35_PAD_FEC_TX_CLK__FEC_TX_CLK		0x80000000
-				MX35_PAD_FEC_RX_CLK__FEC_RX_CLK		0x80000000
-				MX35_PAD_FEC_RX_DV__FEC_RX_DV		0x80000000
-				MX35_PAD_FEC_COL__FEC_COL		0x80000000
-				MX35_PAD_FEC_RDATA0__FEC_RDATA_0	0x80000000
-				MX35_PAD_FEC_TDATA0__FEC_TDATA_0	0x80000000
-				MX35_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX35_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX35_PAD_FEC_MDIO__FEC_MDIO		0x80000000
-				MX35_PAD_FEC_TX_ERR__FEC_TX_ERR		0x80000000
-				MX35_PAD_FEC_RX_ERR__FEC_RX_ERR		0x80000000
-				MX35_PAD_FEC_CRS__FEC_CRS		0x80000000
-				MX35_PAD_FEC_RDATA1__FEC_RDATA_1	0x80000000
-				MX35_PAD_FEC_TDATA1__FEC_TDATA_1	0x80000000
-				MX35_PAD_FEC_RDATA2__FEC_RDATA_2	0x80000000
-				MX35_PAD_FEC_TDATA2__FEC_TDATA_2	0x80000000
-				MX35_PAD_FEC_RDATA3__FEC_RDATA_3	0x80000000
-				MX35_PAD_FEC_TDATA3__FEC_TDATA_3	0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX35_PAD_FEC_TX_CLK__FEC_TX_CLK		0x80000000
+			MX35_PAD_FEC_RX_CLK__FEC_RX_CLK		0x80000000
+			MX35_PAD_FEC_RX_DV__FEC_RX_DV		0x80000000
+			MX35_PAD_FEC_COL__FEC_COL		0x80000000
+			MX35_PAD_FEC_RDATA0__FEC_RDATA_0	0x80000000
+			MX35_PAD_FEC_TDATA0__FEC_TDATA_0	0x80000000
+			MX35_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX35_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX35_PAD_FEC_MDIO__FEC_MDIO		0x80000000
+			MX35_PAD_FEC_TX_ERR__FEC_TX_ERR		0x80000000
+			MX35_PAD_FEC_RX_ERR__FEC_RX_ERR		0x80000000
+			MX35_PAD_FEC_CRS__FEC_CRS		0x80000000
+			MX35_PAD_FEC_RDATA1__FEC_RDATA_1	0x80000000
+			MX35_PAD_FEC_TDATA1__FEC_TDATA_1	0x80000000
+			MX35_PAD_FEC_RDATA2__FEC_RDATA_2	0x80000000
+			MX35_PAD_FEC_TDATA2__FEC_TDATA_2	0x80000000
+			MX35_PAD_FEC_RDATA3__FEC_RDATA_3	0x80000000
+			MX35_PAD_FEC_TDATA3__FEC_TDATA_3	0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX35_PAD_I2C1_CLK__I2C1_SCL		0x80000000
-				MX35_PAD_I2C1_DAT__I2C1_SDA		0x80000000
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX35_PAD_I2C1_CLK__I2C1_SCL		0x80000000
+			MX35_PAD_I2C1_DAT__I2C1_SDA		0x80000000
+		>;
+	};
 
-		pinctrl_tsc2007_1: tsc2007grp-1 {
-			fsl,pins = <MX35_PAD_ATA_DA2__GPIO3_2 0x80000000>;
-		};
+	pinctrl_tsc2007_1: tsc2007-1-grp {
+		fsl,pins = <MX35_PAD_ATA_DA2__GPIO3_2 0x80000000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts
index 7f4f812b08111..e7835a769bbcc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts
@@ -69,57 +69,55 @@ tlv320aic23: codec@1a {
 };
 
 &iomuxc {
-	imx35-eukrea {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS	0x80000000
-				MX35_PAD_STXD4__AUDMUX_AUD4_TXD		0x80000000
-				MX35_PAD_SRXD4__AUDMUX_AUD4_RXD		0x80000000
-				MX35_PAD_SCK4__AUDMUX_AUD4_TXC		0x80000000
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS	0x80000000
+			MX35_PAD_STXD4__AUDMUX_AUD4_TXD		0x80000000
+			MX35_PAD_SRXD4__AUDMUX_AUD4_RXD		0x80000000
+			MX35_PAD_SCK4__AUDMUX_AUD4_TXC		0x80000000
+		>;
+	};
 
-		pinctrl_bp1: bp1grp {
-			fsl,pins = <MX35_PAD_LD19__GPIO3_25  0x80000000>;
-		};
+	pinctrl_bp1: bp1grp {
+		fsl,pins = <MX35_PAD_LD19__GPIO3_25  0x80000000>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX35_PAD_SD1_CMD__ESDHC1_CMD		0x80000000
-				MX35_PAD_SD1_CLK__ESDHC1_CLK		0x80000000
-				MX35_PAD_SD1_DATA0__ESDHC1_DAT0		0x80000000
-				MX35_PAD_SD1_DATA1__ESDHC1_DAT1		0x80000000
-				MX35_PAD_SD1_DATA2__ESDHC1_DAT2		0x80000000
-				MX35_PAD_SD1_DATA3__ESDHC1_DAT3		0x80000000
-				MX35_PAD_LD18__GPIO3_24			0x80000000 /* CD */
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX35_PAD_SD1_CMD__ESDHC1_CMD		0x80000000
+			MX35_PAD_SD1_CLK__ESDHC1_CLK		0x80000000
+			MX35_PAD_SD1_DATA0__ESDHC1_DAT0		0x80000000
+			MX35_PAD_SD1_DATA1__ESDHC1_DAT1		0x80000000
+			MX35_PAD_SD1_DATA2__ESDHC1_DAT2		0x80000000
+			MX35_PAD_SD1_DATA3__ESDHC1_DAT3		0x80000000
+			MX35_PAD_LD18__GPIO3_24			0x80000000 /* CD */
+		>;
+	};
 
-		pinctrl_led1: led1grp {
-			fsl,pins = <MX35_PAD_LD23__GPIO3_29  0x80000000>;
-		};
+	pinctrl_led1: led1grp {
+		fsl,pins = <MX35_PAD_LD23__GPIO3_29  0x80000000>;
+	};
 
-		pinctrl_reg_lcd_3v3: reg-lcd-3v3 {
-			fsl,pins = <MX35_PAD_D3_CLS__GPIO1_4 0x80000000>;
-		};
+	pinctrl_reg_lcd_3v3: reg-lcd-3v3grp {
+		fsl,pins = <MX35_PAD_D3_CLS__GPIO1_4 0x80000000>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX35_PAD_TXD1__UART1_TXD_MUX		0x1c5
-				MX35_PAD_RXD1__UART1_RXD_MUX		0x1c5
-				MX35_PAD_CTS1__UART1_CTS		0x1c5
-				MX35_PAD_RTS1__UART1_RTS		0x1c5
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX35_PAD_TXD1__UART1_TXD_MUX		0x1c5
+			MX35_PAD_RXD1__UART1_RXD_MUX		0x1c5
+			MX35_PAD_CTS1__UART1_CTS		0x1c5
+			MX35_PAD_RTS1__UART1_RTS		0x1c5
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX35_PAD_RXD2__UART2_RXD_MUX		0x1c5
-				MX35_PAD_TXD2__UART2_TXD_MUX		0x1c5
-				MX35_PAD_RTS2__UART2_RTS		0x1c5
-				MX35_PAD_CTS2__UART2_CTS		0x1c5
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX35_PAD_RXD2__UART2_RXD_MUX		0x1c5
+			MX35_PAD_TXD2__UART2_TXD_MUX		0x1c5
+			MX35_PAD_RTS2__UART2_RTS		0x1c5
+			MX35_PAD_CTS2__UART2_CTS		0x1c5
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx35-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx35-pdk.dts
index ddce0a844758b..a2baf8202f94e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx35-pdk.dts
@@ -24,26 +24,24 @@ &esdhc1 {
 };
 
 &iomuxc {
-	imx35-pdk {
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX35_PAD_SD1_CMD__ESDHC1_CMD		0x80000000
-				MX35_PAD_SD1_CLK__ESDHC1_CLK		0x80000000
-				MX35_PAD_SD1_DATA0__ESDHC1_DAT0		0x80000000
-				MX35_PAD_SD1_DATA1__ESDHC1_DAT1		0x80000000
-				MX35_PAD_SD1_DATA2__ESDHC1_DAT2		0x80000000
-				MX35_PAD_SD1_DATA3__ESDHC1_DAT3		0x80000000
-			>;
-		};
-
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX35_PAD_TXD1__UART1_TXD_MUX		0x1c5
-				MX35_PAD_RXD1__UART1_RXD_MUX		0x1c5
-				MX35_PAD_CTS1__UART1_CTS		0x1c5
-				MX35_PAD_RTS1__UART1_RTS		0x1c5
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX35_PAD_SD1_CMD__ESDHC1_CMD		0x80000000
+			MX35_PAD_SD1_CLK__ESDHC1_CLK		0x80000000
+			MX35_PAD_SD1_DATA0__ESDHC1_DAT0		0x80000000
+			MX35_PAD_SD1_DATA1__ESDHC1_DAT1		0x80000000
+			MX35_PAD_SD1_DATA2__ESDHC1_DAT2		0x80000000
+			MX35_PAD_SD1_DATA3__ESDHC1_DAT3		0x80000000
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX35_PAD_TXD1__UART1_TXD_MUX		0x1c5
+			MX35_PAD_RXD1__UART1_RXD_MUX		0x1c5
+			MX35_PAD_CTS1__UART1_CTS		0x1c5
+			MX35_PAD_RTS1__UART1_RTS		0x1c5
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index 442dc15677b87..30beb39e0162c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -156,7 +156,7 @@ kpp: kpp@43fa8000 {
 				status = "disabled";
 			};
 
-			iomuxc: iomuxc@43fac000 {
+			iomuxc: pinctrl@43fac000 {
 				compatible = "fsl,imx35-iomuxc";
 				reg = <0x43fac000 0x4000>;
 			};
-- 
2.45.2



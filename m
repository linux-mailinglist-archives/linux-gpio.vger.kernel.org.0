Return-Path: <linux-gpio+bounces-11571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2AD9A2F55
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A5F8B23509
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388931EE00E;
	Thu, 17 Oct 2024 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ify6yhHw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C21EE00C;
	Thu, 17 Oct 2024 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199594; cv=none; b=TNwrZULtG/1BO5Zf81Lz9B7vDzcDxmnmItmNZ67dzMHDQIfI+54/FPxF0BfdviuCd5Ygx2RHO8f0wE4ONlQwUPzsv7FKa3BmddZl6nbPkmTz33oV+NLBuMBsyyXZ0CaMK9J2nlMak101+yQjClSyu1pc5zL5P/Sk/Iax774ijhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199594; c=relaxed/simple;
	bh=3WdaJrD4mTVvGTcQ8uVgxjbxCRMDUo0NRLAKQRHhIE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ue2eqcz1JSZvaSCDViZGBANfZoff2hXDh8fLtesOZTZqHnsgKa+5WqoznbOuXuPGHoz6iu4OKxyZh64S3jdfCGlUJ1sSBqn3hWCAnjOtbWm0klt63Mx1TPkVIqisSqdep8V3Kq8dBIIJtM+RA9aMgTKigRPgWx82yG2kuvQ2dYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ify6yhHw; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AECB08901D;
	Thu, 17 Oct 2024 23:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199587;
	bh=kBtiSu49qbpF05noLgBzezJqOeoCTeLWHzLeSdi1HUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ify6yhHwfVdL2j8z2C+Oy+TAVlK6qrvafYE4xvYHke21Xg0awMJ9K98YHlWyKywLG
	 lCTq+KraiBN+jAHuxwwtOC0mGccy9tF4lI1tE06yrSC6X0ReFmVBw2Ks5hmZryt30X
	 sIKQp5u5U8sCfyYeZH4c1PPkSAp7Ii83//2LxpcdSsHHB65ZAvIDf/5SQrihogYzT1
	 LH1zCddW89h1/0zAQNZo4PbBXeb5frOIdvWJUe2/k3nqrpX1nOEkNMFwBpg/BfZova
	 ByG+V3NiWe8C7WWlP6E62HS8NCRI3I64OdgRbsFcgJWjnGyUHyT0rg/nLDI8g1/zpc
	 uDlBQcuXI2Cfg==
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
Subject: [PATCH v3 03/12] ARM: dts: imx50: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:20 +0200
Message-ID: <20241017211241.170861-3-marex@denx.de>
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
V3: Rename iomuxc@ node to pinctrl@ node
---
 arch/arm/boot/dts/nxp/imx/imx50-evk.dts | 62 ++++++++++++-------------
 arch/arm/boot/dts/nxp/imx/imx50.dtsi    |  2 +-
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-evk.dts b/arch/arm/boot/dts/nxp/imx/imx50-evk.dts
index 3f45c01d9cce3..f40b0d5fdb85f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-evk.dts
@@ -52,40 +52,38 @@ &fec {
 };
 
 &iomuxc {
-	imx50-evk {
-		pinctrl_cspi: cspigrp {
-			fsl,pins = <
-				MX50_PAD_CSPI_SCLK__CSPI_SCLK		0x00
-				MX50_PAD_CSPI_MISO__CSPI_MISO		0x00
-				MX50_PAD_CSPI_MOSI__CSPI_MOSI		0x00
-				MX50_PAD_CSPI_SS0__GPIO4_11		0xc4
-				MX50_PAD_ECSPI1_MOSI__GPIO4_13		0x84
-			>;
-		};
+	pinctrl_cspi: cspigrp {
+		fsl,pins = <
+			MX50_PAD_CSPI_SCLK__CSPI_SCLK		0x00
+			MX50_PAD_CSPI_MISO__CSPI_MISO		0x00
+			MX50_PAD_CSPI_MOSI__CSPI_MOSI		0x00
+			MX50_PAD_CSPI_SS0__GPIO4_11		0xc4
+			MX50_PAD_ECSPI1_MOSI__GPIO4_13		0x84
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX50_PAD_SSI_RXFS__FEC_MDC		0x80
-				MX50_PAD_SSI_RXC__FEC_MDIO		0x80
-				MX50_PAD_DISP_D0__FEC_TX_CLK		0x80
-				MX50_PAD_DISP_D1__FEC_RX_ERR		0x80
-				MX50_PAD_DISP_D2__FEC_RX_DV		0x80
-				MX50_PAD_DISP_D3__FEC_RDATA_1		0x80
-				MX50_PAD_DISP_D4__FEC_RDATA_0		0x80
-				MX50_PAD_DISP_D5__FEC_TX_EN		0x80
-				MX50_PAD_DISP_D6__FEC_TDATA_1		0x80
-				MX50_PAD_DISP_D7__FEC_TDATA_0		0x80
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX50_PAD_SSI_RXFS__FEC_MDC		0x80
+			MX50_PAD_SSI_RXC__FEC_MDIO		0x80
+			MX50_PAD_DISP_D0__FEC_TX_CLK		0x80
+			MX50_PAD_DISP_D1__FEC_RX_ERR		0x80
+			MX50_PAD_DISP_D2__FEC_RX_DV		0x80
+			MX50_PAD_DISP_D3__FEC_RDATA_1		0x80
+			MX50_PAD_DISP_D4__FEC_RDATA_0		0x80
+			MX50_PAD_DISP_D5__FEC_TX_EN		0x80
+			MX50_PAD_DISP_D6__FEC_TDATA_1		0x80
+			MX50_PAD_DISP_D7__FEC_TDATA_0		0x80
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX50_PAD_UART1_TXD__UART1_TXD_MUX	0x1e4
-				MX50_PAD_UART1_RXD__UART1_RXD_MUX	0x1e4
-				MX50_PAD_UART1_RTS__UART1_RTS		0x1e4
-				MX50_PAD_UART1_CTS__UART1_CTS		0x1e4
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX50_PAD_UART1_TXD__UART1_TXD_MUX	0x1e4
+			MX50_PAD_UART1_RXD__UART1_RXD_MUX	0x1e4
+			MX50_PAD_UART1_RTS__UART1_RTS		0x1e4
+			MX50_PAD_UART1_CTS__UART1_CTS		0x1e4
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx50.dtsi b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
index c5b25d2f6264a..1b6f444443dd1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
@@ -283,7 +283,7 @@ gpt: timer@53fa0000 {
 				clock-names = "ipg", "per";
 			};
 
-			iomuxc: iomuxc@53fa8000 {
+			iomuxc: pinctrl@53fa8000 {
 				compatible = "fsl,imx50-iomuxc", "fsl,imx53-iomuxc";
 				reg = <0x53fa8000 0x4000>;
 			};
-- 
2.45.2



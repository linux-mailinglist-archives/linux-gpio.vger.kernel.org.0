Return-Path: <linux-gpio+bounces-11472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 772309A167B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E36631F22CF6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BFA23A6;
	Thu, 17 Oct 2024 00:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="KcC4afiY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BD10E5;
	Thu, 17 Oct 2024 00:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123714; cv=none; b=PMD7pG+Zk0EvFxwx3taGNxn2Cv+G4XYbbhuvZ7nrMoqZjaJjEkaTG8ISYBZd7BlFJXlMs1noeCoHYcNzJ9cUZVWJSggwRQiMTw61BiUbKf/Hgy0XkaEmDf/HSppIC9Enr3IsA5ZIIg9a9hVIsqF8aiVHUJPaY1dN2NuppsP25hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123714; c=relaxed/simple;
	bh=He7XloUeieq2/o7BBYU1ckMRmLXEE8jCJ6Aa8cHwtwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnSfJ4MVRdJXQLXA5jCinLuvMrOFt4KNr40yqY97g/GpaauYhGJpBa5jFy8tQUsDledlqHqfjGotNXuU3a1l3or6tffjY6OnbPIxEnJYHP0Mr6P0/eBHFpL8GGXGhYK1eCDRcvRYeNKdBKHsGtLTOtOHq0NMFIoDtcA90iXxEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=KcC4afiY; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D4EE688DF4;
	Thu, 17 Oct 2024 02:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123711;
	bh=8bfSj0is/vdTFBlN4j6ASQQmj9F2nyx0tEUKjIX/Dws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KcC4afiY2DnZArhpJA5xFvtyQoFZOKax7QgIkJSBvhzngsPNRrBMUqc8rawMgQMMm
	 NZWwcF+rKowonalnudo5GAHCGEhNK++hznHGYsxu/wryFnjVb0hgdhOLhVph/6kJjX
	 YBNQ/tS7IaGtKo01vG0QWwB5G0BSSJMySDYihY9L/k7+suQlyQCwq35AjqMsv+hTXN
	 Jfy4wCnp+61nF0W0NZUhpV+qFsw2Mxhq9oSLt8xgBL9HSqcqMKzBUkenx2Zs4HletG
	 qug5Vn63B2qlUjUNc/ieKd1NKP6lAwJJgN8wi2WXTsDf/vm7pO3EplD7UTNd1zUieG
	 ivWu+FwNKMP+g==
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
Subject: [PATCH v2 03/12] ARM: dts: imx50: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:49 +0200
Message-ID: <20241017000801.149276-3-marex@denx.de>
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
 arch/arm/boot/dts/nxp/imx/imx50-evk.dts | 62 ++++++++++++-------------
 1 file changed, 30 insertions(+), 32 deletions(-)

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
 
-- 
2.45.2



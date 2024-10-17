Return-Path: <linux-gpio+bounces-11473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4C9A167F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50FF91C21B2B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AC82F36;
	Thu, 17 Oct 2024 00:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="gbhveNLt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6951F625;
	Thu, 17 Oct 2024 00:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123715; cv=none; b=jfxxL1TTN6384ABULFktR92tsCmQe3p6uFPBNKZ3EwlbLCOGA4RHgRsnCBALBclsN1khBqMgzlvIMaPBFyCa/eB5DCVhu+1FH9hhkYJRsnVM/guIuQJfCC3b3ZFuf/aB0pbktvFlSIR9876+thvgJ1Vf7ysSv9jBTOao5a9xYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123715; c=relaxed/simple;
	bh=ugld2ptKJkIXxGLt5xF7mAfO11dZs174Hiy68EzOqTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXEgqRVGJbPPtudbx7RXzEDtK6DJiY5Q1jdTQTt0MGaIGGZEwZIrZock5Ya+8aOOv8grsnV4RSy3Sid2jC9Qi4qjygxXByA3QxSqeuZDuPyPJVepLY+RqM5jjiEN7/7VkOEINqtG3pdMFHUnZE6Gl4FCY4SsGUSSD7f9eM3ASVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=gbhveNLt; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5F63288CBB;
	Thu, 17 Oct 2024 02:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123710;
	bh=xq4RHi/GkbJxqGH66LreDilC6Uaf0zTZnXr6ftxjGmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gbhveNLt8tWO0/PAVRU1RiG1Rnql6Qpuy7LfShNGM8fTD8geGxpezD78Y3SpeGF8l
	 sg/GXsJ9piECDSlMnijZGSfCzIjzBPdu8NVkuza9QU40o+sc0RcsXXKJ5Pxl3QoURg
	 PtnnqS4QRzNw2Kl0gBa1uFGOK6R1r6Vgvmc0623kQuW6ZKwL0KhE7adkwBlSiRQUQn
	 DgikR2HF4flcH+e9js8bocY6lMxjMgFYmz4S4saqUg4GJsWCd1m3LbeQ4xCj18RiBF
	 Ag0EHwkHX0sO8g6LNn1yIHs8UEVCXBs/q57c15XEcUDfwqDvl+mdEVFqBAMBex6mGo
	 Zvoc7l53rAVYg==
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
Subject: [PATCH v2 02/12] ARM: dts: imx35: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:48 +0200
Message-ID: <20241017000801.149276-2-marex@denx.de>
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
 .../imx/imx35-eukrea-mbimxsd35-baseboard.dts  | 88 +++++++++----------
 arch/arm/boot/dts/nxp/imx/imx35-pdk.dts       | 38 ++++----
 2 files changed, 61 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts
index 7f4f812b08111..19d907fa1c330 100644
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
+	pinctrl_reg_lcd_3v3: reg-lcd-3v3 {
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
 
-- 
2.45.2



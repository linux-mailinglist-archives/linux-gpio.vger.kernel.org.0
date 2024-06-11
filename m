Return-Path: <linux-gpio+bounces-7355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601BA903A4D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4597B2485C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FBE17D36B;
	Tue, 11 Jun 2024 11:33:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7F717CA1E;
	Tue, 11 Jun 2024 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105590; cv=none; b=QEn87gkalcAG7Pe1zM09tTNlahH5tm+9yK6XOk7Skhe5alLmH6ECdBzo2ZY57eOR2SPESQu51C7DNI5aeCMS0ST/jrHpYFfcFZebfSHGg6EUZrA07wM/Hihyif1GbQKRnt7fTG7uYG6bKF66jgBJvHatq03dB3Vw5rNSKK4By20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105590; c=relaxed/simple;
	bh=nFI3j7Hbsnyjz37WEKhI9GvJ+E+TRQvc/iFf8KLB4dQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hS2lsMdd77cdsfDJT3c4zwNvluR4CBErVnDLgHM1w0NuT52FhuPx0lbIlp3nOGTMumh8HDLQyFz0pwIf7PNxEUIuvrrXRpEl/xH+kYDPiy6n2NG6zhqCAuT/16SMXva9GFWtcyzhNuxXKPKgN/MKX8YTAFxPXKX3TB++8Ww6uq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="211449646"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2024 20:33:08 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EE59C4006DF4;
	Tue, 11 Jun 2024 20:33:03 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
Date: Tue, 11 Jun 2024 12:31:58 +0100
Message-Id: <20240611113204.3004-5-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/[GV]2L SMARC
SoMs, as per RGMII specification.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes v1->v2:
  * Picked up Geert's Reviewed-by tag.

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 4409c47239b9..2b5e037ea9fa 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -180,41 +180,53 @@ adc_pins: adc {
 	};
 
 	eth0_pins: eth0 {
-		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
-			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
-			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
-			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
-			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
-			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
-			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
-			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
-			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
-			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
-			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
-			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
-			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
-			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
-			 <RZG2L_PORT_PINMUX(26, 1, 1)>, /* ET0_RXD3 */
-			 <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* IRQ2 */
+		txc {
+			pinmux = <RZG2L_PORT_PINMUX(20, 0, 1)>; /* ET0_TXC */
+			output-enable;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+				 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+				 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+				 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+				 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+				 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+				 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+				 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+				 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+				 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+				 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+				 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+				 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+				 <RZG2L_PORT_PINMUX(26, 1, 1)>, /* ET0_RXD3 */
+				 <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* IRQ2 */
+		};
 	};
 
 	eth1_pins: eth1 {
-		pinmux = <RZG2L_PORT_PINMUX(37, 2, 1)>, /* ET1_LINKSTA */
-			 <RZG2L_PORT_PINMUX(37, 0, 1)>, /* ET1_MDC */
-			 <RZG2L_PORT_PINMUX(37, 1, 1)>, /* ET1_MDIO */
-			 <RZG2L_PORT_PINMUX(29, 0, 1)>, /* ET1_TXC */
-			 <RZG2L_PORT_PINMUX(29, 1, 1)>, /* ET1_TX_CTL */
-			 <RZG2L_PORT_PINMUX(30, 0, 1)>, /* ET1_TXD0 */
-			 <RZG2L_PORT_PINMUX(30, 1, 1)>, /* ET1_TXD1 */
-			 <RZG2L_PORT_PINMUX(31, 0, 1)>, /* ET1_TXD2 */
-			 <RZG2L_PORT_PINMUX(31, 1, 1)>, /* ET1_TXD3 */
-			 <RZG2L_PORT_PINMUX(33, 1, 1)>, /* ET1_RXC */
-			 <RZG2L_PORT_PINMUX(34, 0, 1)>, /* ET1_RX_CTL */
-			 <RZG2L_PORT_PINMUX(34, 1, 1)>, /* ET1_RXD0 */
-			 <RZG2L_PORT_PINMUX(35, 0, 1)>, /* ET1_RXD1 */
-			 <RZG2L_PORT_PINMUX(35, 1, 1)>, /* ET1_RXD2 */
-			 <RZG2L_PORT_PINMUX(36, 0, 1)>, /* ET1_RXD3 */
-			 <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* IRQ3 */
+		txc {
+			pinmux = <RZG2L_PORT_PINMUX(29, 0, 1)>; /* ET1_TXC */
+			output-enable;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(37, 2, 1)>, /* ET1_LINKSTA */
+				 <RZG2L_PORT_PINMUX(37, 0, 1)>, /* ET1_MDC */
+				 <RZG2L_PORT_PINMUX(37, 1, 1)>, /* ET1_MDIO */
+				 <RZG2L_PORT_PINMUX(29, 1, 1)>, /* ET1_TX_CTL */
+				 <RZG2L_PORT_PINMUX(30, 0, 1)>, /* ET1_TXD0 */
+				 <RZG2L_PORT_PINMUX(30, 1, 1)>, /* ET1_TXD1 */
+				 <RZG2L_PORT_PINMUX(31, 0, 1)>, /* ET1_TXD2 */
+				 <RZG2L_PORT_PINMUX(31, 1, 1)>, /* ET1_TXD3 */
+				 <RZG2L_PORT_PINMUX(33, 1, 1)>, /* ET1_RXC */
+				 <RZG2L_PORT_PINMUX(34, 0, 1)>, /* ET1_RX_CTL */
+				 <RZG2L_PORT_PINMUX(34, 1, 1)>, /* ET1_RXD0 */
+				 <RZG2L_PORT_PINMUX(35, 0, 1)>, /* ET1_RXD1 */
+				 <RZG2L_PORT_PINMUX(35, 1, 1)>, /* ET1_RXD2 */
+				 <RZG2L_PORT_PINMUX(36, 0, 1)>, /* ET1_RXD3 */
+				 <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* IRQ3 */
+		};
 	};
 
 	gpio-sd0-pwr-en-hog {
-- 
2.39.2



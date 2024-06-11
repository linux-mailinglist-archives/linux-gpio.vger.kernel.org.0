Return-Path: <linux-gpio+bounces-7356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A63903A51
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B6B280F9C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113EA17D8A7;
	Tue, 11 Jun 2024 11:33:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0392017D89E;
	Tue, 11 Jun 2024 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105595; cv=none; b=E4zXATz4QBLuzg5fRGGph2Qw9t95RJAK9YDY4BW7JfN9niLfS81BEm1fstPD3zcRrARA5cOa1d7bExGyr4fegOGKfdqs9PM0oqi3e9jb2fvhve+KKfgSQ5UrkmgneryQK5tHv7PMBkfDbqMF8dbF2nSHfN6Hfy0JVlRfJgb88tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105595; c=relaxed/simple;
	bh=Q+5gm23p4psk8b2aNt8xmcmYIw+An8bLGuhh6EQHSpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QMBQfJiXTJVCLrG9eyAJpXu3FHkPhnXH5JjsKqyvm6LjlP07w+x/2btaAdt90fB/kwpxtuUW5mGoTMBZkVMk1pRyi1KoKAhusNOBBE/ZgLoqHVwiezfJSFmeA7iiWqGllgYL0btJeokYdU4ynykrLcesbi0uihmwoekFB80HH4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="207491442"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2024 20:33:12 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C2F754006DF4;
	Tue, 11 Jun 2024 20:33:08 +0900 (JST)
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
Subject: [PATCH v2 5/9] arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
Date: Tue, 11 Jun 2024 12:31:59 +0100
Message-Id: <20240611113204.3004-6-paul.barker.ct@bp.renesas.com>
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

Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/G2LC SMARC
SoM, as per RGMII specification.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes v1->v2:
  * Picked up Geert's Reviewed-by tag.

 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 5e4209d6fb42..664311fd2098 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -128,22 +128,28 @@ &ostm2 {
 
 &pinctrl {
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
-			 <RZG2L_PORT_PINMUX(0, 0, 1)>;  /* IRQ0 */
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
+				 <RZG2L_PORT_PINMUX(0, 0, 1)>;  /* IRQ0 */
+		};
 	};
 
 	gpio-sd0-pwr-en-hog {
-- 
2.39.2



Return-Path: <linux-gpio+bounces-6601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE698CE3D0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 579F42826F0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B891186647;
	Fri, 24 May 2024 09:47:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDE785658;
	Fri, 24 May 2024 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544029; cv=none; b=nreiDRMF7UdivOAkr4/xrOkb6/n46su7X3kbODOtXY9b5qcN0T512xSbkCtu8iRTsFtNhXx4oeG73+RKC00Bkaj5qnp2yEPqrw04/YQzbLNVPN1XmnpsrsRj/eM//Auk3+iKJpXEJOnAgd2o/lsWK5vzaykpPGYcpTcebB3OYhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544029; c=relaxed/simple;
	bh=h35VKHZiTRB8Z4GtViMVXLHJy9dxBaeJro8480YZIyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lo9AF0RI1afzMemoNn8CL5np1e4/mMbAd6k2qQLrLJVtnnJojc1sG3AJh5rRBV313Q0pq/OEIOCTJ1v7XuhYvj2OrZGWE9+Qvw2weG12llOoM6SejAVHcd3qKanuLfvsEoSWyUyyRy00JJCfhkP7I5HUaOL+5eixO7pw1bWWJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="205579831"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 May 2024 18:47:07 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 29C43400720C;
	Fri, 24 May 2024 18:47:02 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
Date: Fri, 24 May 2024 10:45:59 +0100
Message-Id: <20240524094603.988-6-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
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
---
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



Return-Path: <linux-gpio+bounces-6603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 571208CE3D9
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9DA11F23101
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457C8126F19;
	Fri, 24 May 2024 09:47:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1805485658;
	Fri, 24 May 2024 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544039; cv=none; b=ey6gEjczISSQtY346VfZWFUHZIYoXN9ZmMyHBwgcAJFh2LEdRMCVJ5hVKdu1rnMTdMXTgMsYJc4dhQvdzBJwdG2jB5H5D9QfsTVKz9tUT5tmgnS7QraruLO41vu7rTvAx7DVGyPr0rZ/0yUp9OEynAgYGsHfGeWMgxiFQOCwwzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544039; c=relaxed/simple;
	bh=IpeplB1lK4cFFKIZ/wVncTahHn/KO1b7151E6AAahWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SWMxZlhyjTeWgbj8d97JStSUjFFDf6RpgDv5FqgPqq3p0ClmFS7hh2XOsgm/m54ieDk2TaeHI9zkxGjal+ZMNleMKIklzJ0q46ibx82fox2VmrTWFSysCdguFHA0fFzgTJ/u+knT4UgpV0RUyTZJP/AS7PRUB8wz3qJUL0VCpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="205579844"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 May 2024 18:47:16 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3301C400720C;
	Fri, 24 May 2024 18:47:11 +0900 (JST)
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
Subject: [PATCH 7/9] arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
Date: Fri, 24 May 2024 10:46:01 +0100
Message-Id: <20240524094603.988-8-paul.barker.ct@bp.renesas.com>
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

On the RZ/G2L & RZ/V2L SMARC SOMs, the RGMII interface between the SoC
and the Ethernet PHY operates at 1.8V.

The power supply for this interface may be correctly configured in
u-boot, but the kernel should not be relying on this. Now that the
RZ/G2L pinctrl driver supports configuring the Ethernet power supply
voltage, we can simply specify the desired voltage in the device tree.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi      | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 2b5e037ea9fa..83f5642d0d35 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -182,6 +182,7 @@ adc_pins: adc {
 	eth0_pins: eth0 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(20, 0, 1)>; /* ET0_TXC */
+			power-source = <1800>;
 			output-enable;
 		};
 
@@ -199,14 +200,19 @@ mux {
 				 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
 				 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
 				 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
-				 <RZG2L_PORT_PINMUX(26, 1, 1)>, /* ET0_RXD3 */
-				 <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* IRQ2 */
+				 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+			power-source = <1800>;
+		};
+
+		irq {
+			pinmux = <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* IRQ2 */
 		};
 	};
 
 	eth1_pins: eth1 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(29, 0, 1)>; /* ET1_TXC */
+			power-source = <1800>;
 			output-enable;
 		};
 
@@ -224,8 +230,12 @@ mux {
 				 <RZG2L_PORT_PINMUX(34, 1, 1)>, /* ET1_RXD0 */
 				 <RZG2L_PORT_PINMUX(35, 0, 1)>, /* ET1_RXD1 */
 				 <RZG2L_PORT_PINMUX(35, 1, 1)>, /* ET1_RXD2 */
-				 <RZG2L_PORT_PINMUX(36, 0, 1)>, /* ET1_RXD3 */
-				 <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* IRQ3 */
+				 <RZG2L_PORT_PINMUX(36, 0, 1)>; /* ET1_RXD3 */
+			power-source = <1800>;
+		};
+
+		irq {
+			pinmux = <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* IRQ3 */
 		};
 	};
 
-- 
2.39.2



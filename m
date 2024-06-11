Return-Path: <linux-gpio+bounces-7360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A4903A64
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C40E1C23410
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BF817E465;
	Tue, 11 Jun 2024 11:33:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0F017E45B;
	Tue, 11 Jun 2024 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105615; cv=none; b=cdpWAHIP1rFweSZ3NjTKMf+ahAU4BzqukddPdDQshInIox09FVrHEr3U9P0US5FIwX1V2JfU0MvwMWxTFR/f5qiI9Fil0hzflezS8AwUxCQ4f4f8tgUjrKwXeRe3AUUf6VMPxHO81UH2V3UcJHVGSFvs5bbi5qZ3lDqSTJ1xzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105615; c=relaxed/simple;
	bh=PZ/qgo1iYhsepWwiQ2x0fwZsLK3jpsjhbyJ39AjPBF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBuLEVCfIuRTTpqw/uFzj9EoF5D1mzgCboAs7wwV9hXHS8owN0AmVoMESvft1NxoquWEM598xJXxnNhflUZC2YtU9ZZ089r4KBHV+JDTdHWwRiecVaPbuGKVM/pP8Thl/JTxPVM2eQng9Q1YC092F9zJXKR8ulJhPSFST7n2Zfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="207491491"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2024 20:33:32 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D5BEC4008C4F;
	Tue, 11 Jun 2024 20:33:27 +0900 (JST)
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
Subject: [PATCH v2 9/9] arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V
Date: Tue, 11 Jun 2024 12:32:03 +0100
Message-Id: <20240611113204.3004-10-paul.barker.ct@bp.renesas.com>
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

On the RZ/G2UL & RZ/Five SMARC SOMs, the RGMII interface between the SoC
and the Ethernet PHY operates at 1.8V.

The power supply for this interface may be correctly configured in
u-boot, but the kernel should not be relying on this. Now that the
RZ/G2L pinctrl driver supports configuring the Ethernet power supply
voltage, we can simply specify the desired voltage in the device tree.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes v1->v2:
  * Picked up Geert's Reviewed-by tag.

 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi     | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 417f49090b15..79443fb3f581 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -144,6 +144,7 @@ adc_pins: adc {
 	eth0_pins: eth0 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(1, 0, 1)>; /* ET0_TXC */
+			power-source = <1800>;
 			output-enable;
 		};
 
@@ -161,14 +162,19 @@ mux {
 				 <RZG2L_PORT_PINMUX(3, 2, 1)>, /* ET0_RXD0 */
 				 <RZG2L_PORT_PINMUX(3, 3, 1)>, /* ET0_RXD1 */
 				 <RZG2L_PORT_PINMUX(4, 0, 1)>, /* ET0_RXD2 */
-				 <RZG2L_PORT_PINMUX(4, 1, 1)>, /* ET0_RXD3 */
-				 <RZG2L_PORT_PINMUX(5, 1, 7)>; /* IRQ2 */
+				 <RZG2L_PORT_PINMUX(4, 1, 1)>; /* ET0_RXD3 */
+			power-source = <1800>;
+		};
+
+		irq {
+			pinmux = <RZG2L_PORT_PINMUX(5, 1, 7)>; /* IRQ2 */
 		};
 	};
 
 	eth1_pins: eth1 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(7, 0, 1)>; /* ET1_TXC */
+			power-source = <1800>;
 			output-enable;
 		};
 
@@ -186,8 +192,12 @@ mux {
 				 <RZG2L_PORT_PINMUX(9, 1, 1)>, /* ET1_RXD0 */
 				 <RZG2L_PORT_PINMUX(9, 2, 1)>, /* ET1_RXD1 */
 				 <RZG2L_PORT_PINMUX(9, 3, 1)>, /* ET1_RXD2 */
-				 <RZG2L_PORT_PINMUX(10, 0, 1)>, /* ET1_RXD3 */
-				 <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
+				 <RZG2L_PORT_PINMUX(10, 0, 1)>; /* ET1_RXD3 */
+			power-source = <1800>;
+		};
+
+		irq {
+			pinmux = <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
 		};
 	};
 
-- 
2.39.2



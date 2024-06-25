Return-Path: <linux-gpio+bounces-7689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDCE91723D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD4BB24451
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC1E17F4E3;
	Tue, 25 Jun 2024 20:04:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1082517D36B;
	Tue, 25 Jun 2024 20:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345848; cv=none; b=GJZuDUQ390utBv5HCY+CXRh58ptINF/P+NIyj8COQqzA6yPICE+xPVT7pR67vha1IRcUDUyrJae18MdTDq3NQisIEx/tFtaErUrQL/umaJ2EdSVop6v5joVymJJvxo07WXefl6mIXBp+x+aAy0enjUutoN+V2ylaSmyqmMNgvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345848; c=relaxed/simple;
	bh=7H59c5LVJ7O00WD7YuQ1ZZjkdh3fTNiqX7vFrKedAlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBnykpBdujALWolvZsbPF1FRJJemXDP1/FvLqhRZYr//sDRzML0XagPk3YhP+hbbCethRRNYMGVuNafCR5Equdc5clNLrK4wG/dc44HzUDMWJyLvlzKdG5Gma5GUdXTHNm9ucI0nM4vZvK/si9zArceDbFIhblUGJzCpec3l2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="213220643"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2024 05:04:04 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD5AC40078B4;
	Wed, 26 Jun 2024 05:04:00 +0900 (JST)
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
Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
Date: Tue, 25 Jun 2024 21:03:14 +0100
Message-Id: <20240625200316.4282-8-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes v2->v3:
  * Picked up Linus W's Acked-by tag.
Changes v1->v2:
  * Picked up Geert's Reviewed-by tag.

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



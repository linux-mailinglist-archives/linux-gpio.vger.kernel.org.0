Return-Path: <linux-gpio+bounces-7357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0D4903A55
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237151F240B5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC1417C23A;
	Tue, 11 Jun 2024 11:33:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C8017B4EA;
	Tue, 11 Jun 2024 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105600; cv=none; b=AVQYb0tlwBbZ9DnluqDtR9KdBBW6UDJbHhOtrrifARwlQO3mkxWdJtnJfwbFBDIBVxUai6L4aw5txV530N8e1BpjGxI0x3orlf6gkTc+WSA6mySIaK4bKXm8iCiH7zujyx6/bXuAPz5Oa9vmcZx82jNd8iaNLlHjkWQwrifp+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105600; c=relaxed/simple;
	bh=ImrabRLlmvinCycxgwbFhVufcsZuFjNBXABWXn/x/Sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ui9yu/M/xIWtpnFortbN1+lSu45XLUT2+lseygPhf+XXs/AYXvgBxSU0MQs4TzlRJVfvwbfyUA80W7ff7WnHRREAoD2L8YYjEXcOHhllM9RIQw/xayHefrWoX6k3L5hMlFGCr0fvIZeiswFFlUkB2/q1+yny3OtWAOdpk29uGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="207491457"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2024 20:33:17 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 864614006DF4;
	Tue, 11 Jun 2024 20:33:13 +0900 (JST)
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
Subject: [PATCH v2 6/9] arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
Date: Tue, 11 Jun 2024 12:32:00 +0100
Message-Id: <20240611113204.3004-7-paul.barker.ct@bp.renesas.com>
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

Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/G2UL and
RZ/Five SMARC SoMs, as per RGMII specification.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes v1->v2:
  * Clarified that this patch also affects RZ/Five.
  * Picked up Geert's Reviewed-by tag.

 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 97cdad2a12e2..417f49090b15 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -142,41 +142,53 @@ adc_pins: adc {
 	};
 
 	eth0_pins: eth0 {
-		pinmux = <RZG2L_PORT_PINMUX(4, 5, 1)>, /* ET0_LINKSTA */
-			 <RZG2L_PORT_PINMUX(4, 3, 1)>, /* ET0_MDC */
-			 <RZG2L_PORT_PINMUX(4, 4, 1)>, /* ET0_MDIO */
-			 <RZG2L_PORT_PINMUX(1, 0, 1)>, /* ET0_TXC */
-			 <RZG2L_PORT_PINMUX(1, 1, 1)>, /* ET0_TX_CTL */
-			 <RZG2L_PORT_PINMUX(1, 2, 1)>, /* ET0_TXD0 */
-			 <RZG2L_PORT_PINMUX(1, 3, 1)>, /* ET0_TXD1 */
-			 <RZG2L_PORT_PINMUX(1, 4, 1)>, /* ET0_TXD2 */
-			 <RZG2L_PORT_PINMUX(2, 0, 1)>, /* ET0_TXD3 */
-			 <RZG2L_PORT_PINMUX(3, 0, 1)>, /* ET0_RXC */
-			 <RZG2L_PORT_PINMUX(3, 1, 1)>, /* ET0_RX_CTL */
-			 <RZG2L_PORT_PINMUX(3, 2, 1)>, /* ET0_RXD0 */
-			 <RZG2L_PORT_PINMUX(3, 3, 1)>, /* ET0_RXD1 */
-			 <RZG2L_PORT_PINMUX(4, 0, 1)>, /* ET0_RXD2 */
-			 <RZG2L_PORT_PINMUX(4, 1, 1)>, /* ET0_RXD3 */
-			 <RZG2L_PORT_PINMUX(5, 1, 7)>; /* IRQ2 */
+		txc {
+			pinmux = <RZG2L_PORT_PINMUX(1, 0, 1)>; /* ET0_TXC */
+			output-enable;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(4, 5, 1)>, /* ET0_LINKSTA */
+				 <RZG2L_PORT_PINMUX(4, 3, 1)>, /* ET0_MDC */
+				 <RZG2L_PORT_PINMUX(4, 4, 1)>, /* ET0_MDIO */
+				 <RZG2L_PORT_PINMUX(1, 1, 1)>, /* ET0_TX_CTL */
+				 <RZG2L_PORT_PINMUX(1, 2, 1)>, /* ET0_TXD0 */
+				 <RZG2L_PORT_PINMUX(1, 3, 1)>, /* ET0_TXD1 */
+				 <RZG2L_PORT_PINMUX(1, 4, 1)>, /* ET0_TXD2 */
+				 <RZG2L_PORT_PINMUX(2, 0, 1)>, /* ET0_TXD3 */
+				 <RZG2L_PORT_PINMUX(3, 0, 1)>, /* ET0_RXC */
+				 <RZG2L_PORT_PINMUX(3, 1, 1)>, /* ET0_RX_CTL */
+				 <RZG2L_PORT_PINMUX(3, 2, 1)>, /* ET0_RXD0 */
+				 <RZG2L_PORT_PINMUX(3, 3, 1)>, /* ET0_RXD1 */
+				 <RZG2L_PORT_PINMUX(4, 0, 1)>, /* ET0_RXD2 */
+				 <RZG2L_PORT_PINMUX(4, 1, 1)>, /* ET0_RXD3 */
+				 <RZG2L_PORT_PINMUX(5, 1, 7)>; /* IRQ2 */
+		};
 	};
 
 	eth1_pins: eth1 {
-		pinmux = <RZG2L_PORT_PINMUX(10, 4, 1)>, /* ET1_LINKSTA */
-			 <RZG2L_PORT_PINMUX(10, 2, 1)>, /* ET1_MDC */
-			 <RZG2L_PORT_PINMUX(10, 3, 1)>, /* ET1_MDIO */
-			 <RZG2L_PORT_PINMUX(7, 0, 1)>, /* ET1_TXC */
-			 <RZG2L_PORT_PINMUX(7, 1, 1)>, /* ET1_TX_CTL */
-			 <RZG2L_PORT_PINMUX(7, 2, 1)>, /* ET1_TXD0 */
-			 <RZG2L_PORT_PINMUX(7, 3, 1)>, /* ET1_TXD1 */
-			 <RZG2L_PORT_PINMUX(7, 4, 1)>, /* ET1_TXD2 */
-			 <RZG2L_PORT_PINMUX(8, 0, 1)>, /* ET1_TXD3 */
-			 <RZG2L_PORT_PINMUX(8, 4, 1)>, /* ET1_RXC */
-			 <RZG2L_PORT_PINMUX(9, 0, 1)>, /* ET1_RX_CTL */
-			 <RZG2L_PORT_PINMUX(9, 1, 1)>, /* ET1_RXD0 */
-			 <RZG2L_PORT_PINMUX(9, 2, 1)>, /* ET1_RXD1 */
-			 <RZG2L_PORT_PINMUX(9, 3, 1)>, /* ET1_RXD2 */
-			 <RZG2L_PORT_PINMUX(10, 0, 1)>, /* ET1_RXD3 */
-			 <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
+		txc {
+			pinmux = <RZG2L_PORT_PINMUX(7, 0, 1)>; /* ET1_TXC */
+			output-enable;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(10, 4, 1)>, /* ET1_LINKSTA */
+				 <RZG2L_PORT_PINMUX(10, 2, 1)>, /* ET1_MDC */
+				 <RZG2L_PORT_PINMUX(10, 3, 1)>, /* ET1_MDIO */
+				 <RZG2L_PORT_PINMUX(7, 1, 1)>, /* ET1_TX_CTL */
+				 <RZG2L_PORT_PINMUX(7, 2, 1)>, /* ET1_TXD0 */
+				 <RZG2L_PORT_PINMUX(7, 3, 1)>, /* ET1_TXD1 */
+				 <RZG2L_PORT_PINMUX(7, 4, 1)>, /* ET1_TXD2 */
+				 <RZG2L_PORT_PINMUX(8, 0, 1)>, /* ET1_TXD3 */
+				 <RZG2L_PORT_PINMUX(8, 4, 1)>, /* ET1_RXC */
+				 <RZG2L_PORT_PINMUX(9, 0, 1)>, /* ET1_RX_CTL */
+				 <RZG2L_PORT_PINMUX(9, 1, 1)>, /* ET1_RXD0 */
+				 <RZG2L_PORT_PINMUX(9, 2, 1)>, /* ET1_RXD1 */
+				 <RZG2L_PORT_PINMUX(9, 3, 1)>, /* ET1_RXD2 */
+				 <RZG2L_PORT_PINMUX(10, 0, 1)>, /* ET1_RXD3 */
+				 <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
+		};
 	};
 
 	sdhi0_emmc_pins: sd0emmc {
-- 
2.39.2



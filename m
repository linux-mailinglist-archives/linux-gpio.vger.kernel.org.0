Return-Path: <linux-gpio+bounces-7688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2207E917238
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCFC1F274B1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D446617F378;
	Tue, 25 Jun 2024 20:04:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550BA17DE17;
	Tue, 25 Jun 2024 20:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345842; cv=none; b=IPlrno48L5nAVu0kiJv0kK6fEpM57+e5TrvRlZzrld+UWQut6uZjiTz2/z00Vc8Ivrn7TBxK2qtTrFCTDRKxDNQqzFZyOXP9hetQLlW4BpGQX0oEMoo59q67LWivb37WPL1QNt0TTC/bAGheNQo9BWu70ExH5MqaR5wTZVT19vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345842; c=relaxed/simple;
	bh=hyPn9Hpc1mnmwTnKVBl4grzNni7qFyDaEHMo5fOLvDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u9Bf+4CS7pIdhykCD4q0PS8g9W2GOdthcHKCk0sOd8y0/BPKjQ/9TOqM3+YCZWHAZYrj9M2UhlWUwAZFt/dBGtFu4J+waHNW6IJI9GJrmCprzCeuHe+rQgei9a6qtm8xOFBdUiPQNh1ywhoSkDbA8XFLkRJAAzF58C9VOtHgIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="209263984"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2024 05:04:00 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B58DD400C4E6;
	Wed, 26 Jun 2024 05:03:55 +0900 (JST)
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
Subject: [PATCH v3 6/9] arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
Date: Tue, 25 Jun 2024 21:03:13 +0100
Message-Id: <20240625200316.4282-7-paul.barker.ct@bp.renesas.com>
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

Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/G2UL and
RZ/Five SMARC SoMs, as per RGMII specification.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes v2->v3:
  * Picked up Linus W's Acked-by tag.
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



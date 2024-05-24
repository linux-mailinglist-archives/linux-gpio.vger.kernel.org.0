Return-Path: <linux-gpio+bounces-6602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6D8CE3D5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3D15B21102
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DA385930;
	Fri, 24 May 2024 09:47:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D725D85658;
	Fri, 24 May 2024 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544035; cv=none; b=JlwAax/htUatSFuV1SQ5BH6rvh1zmOdjYnCDfpu0OgGlP9/JB4qZOCKbjz1L6yhyZn1/JGHcX9BGJuCoxaZpsJeg8YclvbdM8yMJlX7E9m6OHw7pdm1G7cITr3gv1ckrxH0QmEqb9BNDuLKvb3d1JYVn6AP6+fhS9ddXXxhxK/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544035; c=relaxed/simple;
	bh=s/aH801B79dTJoHI6I3cplHxjnJjQpTQxENGSGV2IpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GaXwd/UT2QmCqcRbGYkMFsYHjo/c9ZbJTaSRV0xblKAufjN7mmlOz6ecGPAk20mKrwgstcJCLUsohEWEcrSJKxzUg9/MQImIey7tcjckHx5fJdG6pNcLP6AFh9ygP4v8BBP9yshGYu6ARTJSZ+lZ+wzG3N/pWx2/OvJ5uAhO2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="209538258"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 May 2024 18:47:11 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A945F400720C;
	Fri, 24 May 2024 18:47:07 +0900 (JST)
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
Subject: [PATCH 6/9] arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
Date: Fri, 24 May 2024 10:46:00 +0100
Message-Id: <20240524094603.988-7-paul.barker.ct@bp.renesas.com>
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

Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/G2UL SMARC
SoM, as per RGMII specification.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
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



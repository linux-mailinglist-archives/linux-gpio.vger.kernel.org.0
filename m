Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AC8413AC9
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 21:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbhIUTcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 15:32:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18568 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233960AbhIUTcS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 15:32:18 -0400
X-IronPort-AV: E=Sophos;i="5.85,311,1624287600"; 
   d="scan'208";a="94721296"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2021 04:30:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2883940E82C9;
        Wed, 22 Sep 2021 04:30:45 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 4/4] arm64: dts: renesas: r9a07g044: Add IRQC node to SoC DTSI
Date:   Tue, 21 Sep 2021 20:30:28 +0100
Message-Id: <20210921193028.13099-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add IRQC node to R9A07G044 (RZ/G2L) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 9c170db544d2..d10cedeb5880 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -388,6 +388,8 @@
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&irqc>;
+			interrupt-controller;
 			gpio-ranges = <&pinctrl 0 0 392>;
 			clocks = <&cpg CPG_MOD R9A07G044_GPIO_HCLK>;
 			power-domains = <&cpg>;
@@ -396,6 +398,62 @@
 				 <&cpg R9A07G044_GPIO_SPARE_RESETN>;
 		};
 
+		irqc: interrupt-controller@110a0000 {
+			compatible = "renesas,r9a07g044-irqc",
+				     "renesas,rzg2l-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0x110a0000 0 0x10000>;
+			interrupts =
+				<GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_IA55_CLK>,
+				 <&cpg CPG_MOD R9A07G044_IA55_PCLK>;
+			clock-names = "clk", "pclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_IA55_RESETN>;
+		};
+
 		dmac: dma-controller@11820000 {
 			compatible = "renesas,r9a07g044-dmac",
 				     "renesas,rz-dmac";
-- 
2.17.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B2C1C2FA9
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2020 23:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgECVrg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 May 2020 17:47:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40195 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729255AbgECVrf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 May 2020 17:47:35 -0400
X-IronPort-AV: E=Sophos;i="5.73,349,1583161200"; 
   d="scan'208";a="46019263"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 May 2020 06:47:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1FCD04006DF9;
        Mon,  4 May 2020 06:47:29 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/10] ARM: dts: r8a7742: Initial SoC device tree
Date:   Sun,  3 May 2020 22:46:50 +0100
Message-Id: <1588542414-14826-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588542414-14826-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1588542414-14826-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The initial R8A7742 SoC device tree including CPU[0-8], PMU, PFC,
CPG, RST, SYSC, ICRAM[0-2], SCIFA2, MMC1, DMAC[0-1], GIC, PRR, timer
and the required clock descriptions.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742.dtsi | 389 +++++++++++++++++++++++++++++++++
 1 file changed, 389 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7742.dtsi

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
new file mode 100644
index 000000000000..8d64cd0a2137
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the r8a7742 SoC
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r8a7742-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/r8a7742-sysc.h>
+
+/ {
+	compatible = "renesas,r8a7742";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <0>;
+			clock-frequency = <1400000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
+			power-domains = <&sysc R8A7742_PD_CA15_CPU0>;
+			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
+			voltage-tolerance = <1>; /* 1% */
+			clock-latency = <300000>; /* 300 us */
+
+			/* kHz - uV - OPPs unknown yet */
+			operating-points = <1400000 1000000>,
+					   <1225000 1000000>,
+					   <1050000 1000000>,
+					   < 875000 1000000>,
+					   < 700000 1000000>,
+					   < 350000 1000000>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <1>;
+			clock-frequency = <1400000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
+			power-domains = <&sysc R8A7742_PD_CA15_CPU1>;
+			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
+			voltage-tolerance = <1>; /* 1% */
+			clock-latency = <300000>; /* 300 us */
+
+			/* kHz - uV - OPPs unknown yet */
+			operating-points = <1400000 1000000>,
+					   <1225000 1000000>,
+					   <1050000 1000000>,
+					   < 875000 1000000>,
+					   < 700000 1000000>,
+					   < 350000 1000000>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <2>;
+			clock-frequency = <1400000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
+			power-domains = <&sysc R8A7742_PD_CA15_CPU2>;
+			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
+			voltage-tolerance = <1>; /* 1% */
+			clock-latency = <300000>; /* 300 us */
+
+			/* kHz - uV - OPPs unknown yet */
+			operating-points = <1400000 1000000>,
+					   <1225000 1000000>,
+					   <1050000 1000000>,
+					   < 875000 1000000>,
+					   < 700000 1000000>,
+					   < 350000 1000000>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <3>;
+			clock-frequency = <1400000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
+			power-domains = <&sysc R8A7742_PD_CA15_CPU3>;
+			next-level-cache = <&L2_CA15>;
+			capacity-dmips-mhz = <1024>;
+			voltage-tolerance = <1>; /* 1% */
+			clock-latency = <300000>; /* 300 us */
+
+			/* kHz - uV - OPPs unknown yet */
+			operating-points = <1400000 1000000>,
+					   <1225000 1000000>,
+					   <1050000 1000000>,
+					   < 875000 1000000>,
+					   < 700000 1000000>,
+					   < 350000 1000000>;
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x100>;
+			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z2>;
+			power-domains = <&sysc R8A7742_PD_CA7_CPU0>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x101>;
+			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z2>;
+			power-domains = <&sysc R8A7742_PD_CA7_CPU1>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x102>;
+			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z2>;
+			power-domains = <&sysc R8A7742_PD_CA7_CPU2>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x103>;
+			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7742_CLK_Z2>;
+			power-domains = <&sysc R8A7742_PD_CA7_CPU3>;
+			next-level-cache = <&L2_CA7>;
+		};
+
+		L2_CA15: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A7742_PD_CA15_SCU>;
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		L2_CA7: cache-controller-1 {
+			compatible = "cache";
+			power-domains = <&sysc R8A7742_PD_CA7_SCU>;
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+
+	/* External root clock */
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
+	pmu-0 {
+		compatible = "arm,cortex-a15-pmu";
+		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	pmu-1 {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts-extended = <&gic GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	/* External SCIF clock */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a7742";
+			reg = <0 0xe6060000 0 0x250>;
+		};
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a7742-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>, <&usb_extal_clk>;
+			clock-names = "extal", "usb_extal";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a7742-rst";
+			reg = <0 0xe6160000 0 0x0100>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a7742-sysc";
+			reg = <0 0xe6180000 0 0x0200>;
+			#power-domain-cells = <1>;
+		};
+
+		icram0: sram@e63a0000 {
+			compatible = "mmio-sram";
+			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
+		};
+
+		icram1: sram@e63c0000 {
+			compatible = "mmio-sram";
+			reg = <0 0xe63c0000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63c0000 0x1000>;
+
+			smp-sram@0 {
+				compatible = "renesas,smp-sram";
+				reg = <0 0x100>;
+			};
+		};
+
+		icram2: sram@e6300000 {
+			compatible = "mmio-sram";
+			reg = <0 0xe6300000 0 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe6300000 0x40000>;
+		};
+
+		scifa2: serial@e6c60000 {
+			compatible = "renesas,scifa-r8a7742",
+				     "renesas,rcar-gen2-scifa", "renesas,scifa";
+			reg = <0 0xe6c60000 0 0x40>;
+			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 202>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x27>, <&dmac0 0x28>,
+			       <&dmac1 0x27>, <&dmac1 0x28>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 202>;
+			status = "disabled";
+		};
+
+		mmcif1: mmc@ee220000 {
+			compatible = "renesas,mmcif-r8a7742",
+				     "renesas,sh-mmcif";
+			reg = <0 0xee220000 0 0x80>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 305>;
+			dmas = <&dmac0 0xe1>, <&dmac0 0xe2>,
+			       <&dmac1 0xe1>, <&dmac1 0xe2>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 305>;
+			reg-io-width = <4>;
+			status = "disabled";
+			max-frequency = <97500000>;
+		};
+
+		dmac0: dma-controller@e6700000 {
+			compatible = "renesas,dmac-r8a7742",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe6700000 0 0x20000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14";
+			clocks = <&cpg CPG_MOD 219>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 219>;
+			#dma-cells = <1>;
+			dma-channels = <15>;
+		};
+
+		dmac1: dma-controller@e6720000 {
+			compatible = "renesas,dmac-r8a7742",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe6720000 0 0x20000>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14";
+			clocks = <&cpg CPG_MOD 218>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 218>;
+			#dma-cells = <1>;
+			dma-channels = <15>;
+		};
+
+		gic: interrupt-controller@f1001000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0xf1001000 0 0x1000>, <0 0xf1002000 0 0x2000>,
+			      <0 0xf1004000 0 0x2000>, <0 0xf1006000 0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&cpg CPG_MOD 408>;
+			clock-names = "clk";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 408>;
+		};
+
+		prr: chipid@ff000044 {
+			compatible = "renesas,prr";
+			reg = <0 0xff000044 0 4>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	/* External USB clock - can be overridden by the board */
+	usb_extal_clk: usb_extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <48000000>;
+	};
+};
-- 
2.17.1


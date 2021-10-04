Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC8F420811
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 11:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhJDJSQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 05:18:16 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:55108 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229716AbhJDJSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 05:18:16 -0400
X-UUID: 60e116a8f75a4354a23f68056b49f6b0-20211004
X-UUID: 60e116a8f75a4354a23f68056b49f6b0-20211004
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1590306773; Mon, 04 Oct 2021 17:16:22 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Oct 2021 17:16:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Oct 2021 17:16:20 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     <matthias.bgg@gmail.com>
CC:     <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
        <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
        <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
        <hsinyi@chromium.org>, <john@phrozen.org>,
        <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux@roeck-us.net>, <mpm@selenic.com>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <sean.wang@kernel.org>,
        <seiya.wang@mediatek.com>, <wim@linux-watchdog.org>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [v4,9/9] arm64: dts: mediatek: add mt7986b support
Date:   Mon, 4 Oct 2021 17:16:17 +0800
Message-ID: <20211004091617.31436-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210924112701.18459-1-sam.shih@mediatek.com>
References: <20210924112701.18459-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add basic chip support for Mediatek mt7986b, include
uart nodes with correct clocks, rng node with correct clock,
and watchdog node and mt7986b pinctrl node.

Add cpu node, timer node, gic node, psci and reserved-memory node
for ARM Trusted Firmware,

Add clock controller nodes, include 40M clock source, topckgen, infracfg,
apmixedsys and ethernet subsystem.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
v4: added missing gic register bases, and fixed range of GICR
v3: used the stdout-path instead of console=ttyS0
v2: modified clock and uart node due to clock driver updated
---
 arch/arm64/boot/dts/mediatek/Makefile        |   1 +
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  26 +++
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 230 +++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e6c3a73b9e4a..d555e43d1ccc 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
new file mode 100644
index 000000000000..95a202505bb2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Sam.Shih <sam.shih@mediatek.com>
+ */
+
+/dts-v1/;
+#include "mt7986b.dtsi"
+
+/ {
+	model = "MediaTek MT7986b RFB";
+	compatible = "mediatek,mt7986b-rfb";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon=uart8250,mmio32,0x11002000 swiotlb=512";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
new file mode 100644
index 000000000000..06c3381a5170
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Sam.Shih <sam.shih@mediatek.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mt7986-clk.h>
+
+/ {
+	compatible = "mediatek,mt7986b";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk40m: oscillator@0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "clkxtal";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x2>;
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			enable-method = "psci";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			#cooling-cells = <2>;
+		};
+	};
+
+	psci {
+		compatible  = "arm,psci-0.2";
+		method      = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved: secmon@43000000 {
+			reg = <0 0x43000000 0 0x30000>;
+			no-map;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		clock-frequency = <13000000>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
+			      <0 0x0c080000 0 0x80000>,  /* GICR */
+			      <0 0x0c400000 0 0x2000>,   /* GICC */
+			      <0 0x0c410000 0 0x1000>,   /* GICH */
+			      <0 0x0c420000 0 0x2000>;   /* GICV */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		infracfg: infracfg@10001000 {
+			compatible = "mediatek,mt7986-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		topckgen: topckgen@1001b000 {
+			compatible = "mediatek,mt7986-topckgen", "syscon";
+			reg = <0 0x1001B000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		watchdog: watchdog@1001c000 {
+			compatible = "mediatek,mt7986-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x1001c000 0 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
+		apmixedsys: apmixedsys@1001e000 {
+			compatible = "mediatek,mt7986-apmixedsys";
+			reg = <0 0x1001E000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7986b-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			      <0 0x11c30000 0 0x1000>,
+			      <0 0x11c40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11e30000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x11f10000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio_base", "iocfg_rt_base", "iocfg_rb_base",
+				    "iocfg_lt_base", "iocfg_lb_base", "iocfg_tr_base",
+				    "iocfg_tl_base", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+		};
+
+		sgmiisys0: syscon@10060000 {
+			compatible = "mediatek,mt7986-sgmiisys_0",
+				     "syscon";
+			reg = <0 0x10060000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		sgmiisys1: syscon@10070000 {
+			compatible = "mediatek,mt7986-sgmiisys_1",
+				     "syscon";
+			reg = <0 0x10070000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		trng: trng@1020f000 {
+			compatible = "mediatek,mt7986-rng",
+				     "mediatek,mt7623-rng";
+			reg = <0 0x1020f000 0 0x100>;
+			clocks = <&infracfg CLK_INFRA_TRNG_CK>;
+			clock-names = "rng";
+			status = "disabled";
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt7986-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_UART0_SEL>,
+				 <&infracfg CLK_INFRA_UART0_CK>;
+			clock-names = "baud", "bus";
+			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
+					  <&infracfg CLK_INFRA_UART0_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
+						 <&topckgen CLK_TOP_UART_SEL>;
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt7986-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_UART1_SEL>,
+				 <&infracfg CLK_INFRA_UART1_CK>;
+			clock-names = "baud", "bus";
+			assigned-clocks = <&infracfg CLK_INFRA_UART1_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
+			status = "disabled";
+		};
+
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt7986-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x400>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_UART2_SEL>,
+				 <&infracfg CLK_INFRA_UART2_CK>;
+			clock-names = "baud", "bus";
+			assigned-clocks = <&infracfg CLK_INFRA_UART2_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
+			status = "disabled";
+		};
+
+		ethsys: syscon@15000000 {
+			 #address-cells = <1>;
+			 #size-cells = <1>;
+			 compatible = "mediatek,mt7986-ethsys",
+				      "syscon";
+			 reg = <0 0x15000000 0 0x1000>;
+			 #clock-cells = <1>;
+			 #reset-cells = <1>;
+		};
+
+	};
+
+};
-- 
2.29.2


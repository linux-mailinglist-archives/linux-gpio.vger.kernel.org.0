Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2766A40A9F0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 10:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhINIyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 04:54:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51920 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231618AbhINIyP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 04:54:15 -0400
X-UUID: 0e2bb01580a644d392ba13b408fa7c03-20210914
X-UUID: 0e2bb01580a644d392ba13b408fa7c03-20210914
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1821452404; Tue, 14 Sep 2021 16:52:54 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 16:52:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 16:52:51 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [RESEND,v2,8/9] arm64: dts: mediatek: add mt7986a support
Date:   Tue, 14 Sep 2021 16:51:36 +0800
Message-ID: <20210914085137.31761-9-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914085137.31761-1-sam.shih@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add basic chip support for Mediatek mt7986a, include
uart nodes with correct clocks, rng node with correct clock,
and watchdog node and mt7986a pinctrl node.

Add cpu node, timer node, gic node, psci and reserved-memory node
for ARM Trusted Firmware,

Add clock controller nodes, include 40M clock source, topckgen, infracfg,
apmixedsys and ethernet subsystem.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v2: modified clock and uart node due to clock driver updated
---
 arch/arm64/boot/dts/mediatek/Makefile        |   1 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  49 ++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 227 +++++++++++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 4f68ebed2e31..e6c3a73b9e4a 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
new file mode 100644
index 000000000000..a58347c09ab2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Sam.Shih <sam.shih@mediatek.com>
+ */
+
+/dts-v1/;
+#include "mt7986a.dtsi"
+
+/ {
+	model = "MediaTek MT7986a RFB";
+	compatible = "mediatek,mt7986a-rfb";
+	chosen {
+		bootargs = "console=ttyS0,115200n1 loglevel=8  \
+				earlycon=uart8250,mmio32,0x11002000";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&pio {
+	uart1_pins: uart1-pins-42-to-45 {
+		mux {
+			function = "uart";
+			groups = "uart1";
+		};
+	};
+
+	uart2_pins: uart1-pins-46-to-49 {
+		mux {
+			function = "uart";
+			groups = "uart2";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
new file mode 100644
index 000000000000..dfe3e7101031
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -0,0 +1,227 @@
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
+	compatible = "mediatek,mt7986a";
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
+			reg = <0 0x0c000000 0 0x40000>,
+			      <0 0x0c080000 0 0x200000>;
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
+			compatible = "mediatek,mt7986a-pinctrl";
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
+			gpio-ranges = <&pio 0 0 100>;
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


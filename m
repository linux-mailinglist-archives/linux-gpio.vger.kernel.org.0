Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917A51DDDB2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 05:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgEVDI1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 23:08:27 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:54526 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727897AbgEVDI1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 May 2020 23:08:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.06730018|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.667596-9.51996e-05-0.332309;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03299;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HbxBGFJ_1590116882;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.HbxBGFJ_1590116882)
          by smtp.aliyun-inc.com(10.147.41.178);
          Fri, 22 May 2020 11:08:19 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        frank@allwinnertech.com, huangshuosheng@allwinnertech.com,
        tiny.windzz@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/4] arm64: allwinner: A100: add the basical Allwinner A100 DTSI file
Date:   Fri, 22 May 2020 11:07:42 +0800
Message-Id: <20200522030743.10204-4-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200522030743.10204-1-frank@allwinnertech.com>
References: <20200522030743.10204-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allwinner A100 is a new SoC with Cortex-A53 cores, this commit adds
the basical DTSI file of it, including the clock, pins and UART support.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
new file mode 100644
index 000000000000..bd9bf9b2f832
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (c) 2020 Frank Lee <frank@allwinner.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sun50i-a100-ccu.h>
+#include <dt-bindings/clock/sun50i-a100-r-ccu.h>
+#include <dt-bindings/reset/sun50i-a100-ccu.h>
+#include <dt-bindings/reset/sun50i-a100-r-ccu.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x2>;
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			compatible = "arm,armv8";
+			device_type = "cpu";
+			reg = <0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	iosc: internal-osc-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <16000000>;
+		clock-accuracy = <300000000>;
+		clock-output-names = "iosc";
+		#clock-cells = <0>;
+	};
+
+	dcxo24M: dcxo24M_clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "dcxo24M";
+		#clock-cells = <0>;
+	};
+
+	osc32k: osc32k_clk {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "osc32k";
+		#clock-cells = <0>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ccu: clock@3001000 {
+			compatible = "allwinner,sun50i-a100-ccu";
+			reg = <0x0 0x03001000 0x0 0x1000>;
+			clocks = <&dcxo24M>, <&osc32k>, <&iosc>;
+			clock-names = "hosc", "losc", "iosc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		gic: interrupt-controller@3021000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0x03021000 0x0 0x1000>,
+			      <0x0 0x03022000 0x0 0x2000>,
+			      <0x0 0x03024000 0x0 0x2000>,
+			      <0x0 0x03026000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		pio: pinctrl@300b000 {
+			compatible = "allwinner,sun50i-a100-pinctrl";
+			reg = <0x0 0x0300b000 0x0 0x400>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_APB1>, <&dcxo24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB9", "PB10";
+				function = "uart0";
+			};
+		};
+
+		uart0: serial@5000000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x05000000 0x0 0x400>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+		};
+
+		r_ccu: clock@7010000 {
+			compatible = "allwinner,sun50i-a100-r-ccu";
+			reg = <0x0 0x07010000 0x0 0x400>;
+			clocks = <&dcxo24M>, <&osc32k>, <&iosc>,
+				 <&ccu CLK_PLL_PERIPH0>;
+			clock-names = "hosc", "losc", "iosc", "pll-periph";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		r_pio: pinctrl@7022000 {
+			compatible = "allwinner,sun50i-a100-r-pinctrl";
+			reg = <0x0 0x07022000 0x0 0x400>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB1>, <&dcxo24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+	};
+};
-- 
2.24.0


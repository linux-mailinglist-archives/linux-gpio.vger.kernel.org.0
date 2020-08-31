Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB6F257511
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 10:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgHaILa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 04:11:30 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:46288 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbgHaIL3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:11:29 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07V8Apaq026161; Mon, 31 Aug 2020 17:10:51 +0900
X-Iguazu-Qid: 34tMJPQphthGQWLqAi
X-Iguazu-QSIG: v=2; s=0; t=1598861450; q=34tMJPQphthGQWLqAi; m=iFm8IHH99FujFf8k9sQKeXXvHkT6BfpXWiuBdQEdfWE=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 07V8An7e023535;
        Mon, 31 Aug 2020 17:10:49 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07V8AnM6025549;
        Mon, 31 Aug 2020 17:10:49 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07V8AmKc026404;
        Mon, 31 Aug 2020 17:10:48 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 6/8] arm64: dts: visconti: Add device tree for TMPV7708 RM main board
Date:   Mon, 31 Aug 2020 17:10:23 +0900
X-TSB-HOP: ON
Message-Id: <20200831081025.2721320-7-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add basic support for the Visconti TMPV7708 SoC peripherals -
  - CPU
    - CA53 x 4 and 2 cluster.
    - not support PSCI, currently only spin-table is supported.
  - Interrupt controller (ARM Generic Interrupt Controller)
  - Timer (ARM architected timer)
  - UART (ARM PL011 UART controller)
  - SPI (ARM PL022 SPI controller)
  - I2C (Synopsys DesignWare APB I2C Controller)
  - Pin control (Visconti specific)

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/toshiba/Makefile          |   2 +
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  43 ++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 390 ++++++++++++++++++
 .../arm64/boot/dts/toshiba/tmpv7708_pins.dtsi |  93 +++++
 5 files changed, 529 insertions(+)
 create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 270e8aabbac8..9b1170658d60 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -27,5 +27,6 @@ subdir-y += socionext
 subdir-y += sprd
 subdir-y += synaptics
 subdir-y += ti
+subdir-y += toshiba
 subdir-y += xilinx
 subdir-y += zte
diff --git a/arch/arm64/boot/dts/toshiba/Makefile b/arch/arm64/boot/dts/toshiba/Makefile
new file mode 100644
index 000000000000..8cd460d5b68e
--- /dev/null
+++ b/arch/arm64/boot/dts/toshiba/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_VISCONTI) += tmpv7708-rm-mbrc.dtb
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
new file mode 100644
index 000000000000..ed0bf7f13f54
--- /dev/null
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree File for TMPV7708 RM main board
+ *
+ * (C) Copyright 2020, Toshiba Corporation.
+ * (C) Copyright 2020, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+/dts-v1/;
+
+#include "tmpv7708.dtsi"
+
+/ {
+	model = "Toshiba TMPV7708 RM main board";
+	compatible = "toshiba,tmpv7708-rm-mbrc", "toshiba,tmpv7708";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* 768MB memory */
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x30000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+	clocks = <&uart_clk>;
+	clock-names = "apb_pclk";
+};
+
+&uart1 {
+	status = "okay";
+	clocks = <&uart_clk>;
+	clock-names = "apb_pclk";
+};
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
new file mode 100644
index 000000000000..242f25f4e12a
--- /dev/null
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree Source for the TMPV7708
+ *
+ * (C) Copyright 2018 - 2020, Toshiba Corporation.
+ * (C) Copyright 2020, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/memreserve/ 0x81000000 0x00300000;	/* cpu-release-addr */
+
+/ {
+	compatible = "toshiba,tmpv7708";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x00>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x01>;
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x02>;
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x03>;
+		};
+
+		cpu4: cpu@100 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x100>;
+		};
+
+		cpu5: cpu@101 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x101>;
+		};
+
+		cpu6: cpu@102 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x102>;
+		};
+
+		cpu7: cpu@103 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x81100000>;
+			reg = <0x103>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts =
+			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	uart_clk: uart-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <150000000>;
+		#clock-cells = <0>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gic: interrupt-controller@24001000 {
+			compatible = "arm,gic-400";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			reg = <0 0x24001000 0 0x1000>,
+			      <0 0x24002000 0 0x2000>,
+			      <0 0x24004000 0 0x2000>,
+			      <0 0x24006000 0 0x2000>;
+		};
+
+		pmux: pmux@24190000 {
+			compatible = "toshiba,tmpv7708-pinctrl";
+			reg = <0 0x24190000 0 0x10000>;
+		};
+
+		uart0: serial@28200000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28200000 0 0x1000>;
+			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
+			status = "disabled";
+		};
+
+		uart1: serial@28201000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28201000 0 0x1000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_pins>;
+			status = "disabled";
+		};
+
+		uart2: serial@28202000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28202000 0 0x1000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_pins>;
+			status = "disabled";
+		};
+
+		uart3: serial@28203000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28203000 0 0x1000>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_pins>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@28030000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28030000 0 0x1000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@28031000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28031000 0 0x1000>;
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@28032000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28032000 0 0x1000>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@28033000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28033000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@28034000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28034000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@28035000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28035000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c5_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@28036000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28036000 0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c6_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@28037000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28037000 0 0x1000>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@28038000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28038000 0 0x1000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c8_pins>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi0: spi@28140000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28140000 0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@28141000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28141000 0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@28142000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28142000 0 0x1000>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi2_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi3: spi@28143000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28143000 0 0x1000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi3_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi4: spi@28144000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28144000 0 0x1000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi4_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi5: spi@28145000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28145000 0 0x1000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi5_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi6: spi@28146000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0 0x28146000 0 0x1000>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi6_pins>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
+
+#include "tmpv7708_pins.dtsi"
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
new file mode 100644
index 000000000000..34de00015a7f
--- /dev/null
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+&pmux {
+	spi0_pins: spi0-pins {
+		function = "spi0";
+		groups = "spi0_grp";
+	};
+	spi1_pins: spi1-pins {
+		function = "spi1";
+		groups = "spi1_grp";
+	};
+	spi2_pins: spi2-pins {
+		function = "spi2";
+		groups = "spi2_grp";
+	};
+	spi3_pins: spi3-pins {
+		function = "spi3";
+		groups = "spi3_grp";
+	};
+	spi4_pins: spi4-pins {
+		function = "spi4";
+		groups = "spi4_grp";
+	};
+	spi5_pins: spi5-pins {
+		function = "spi5";
+		groups = "spi5_grp";
+	};
+	spi6_pins: spi6-pins {
+		function = "spi6";
+		groups = "spi6_grp";
+	};
+	uart0_pins: uart0-pins {
+		function = "uart0";
+		groups = "uart0_grp";
+	};
+	uart1_pins: uart1-pins {
+		function = "uart1";
+		groups = "uart1_grp";
+	};
+	uart2_pins: uart2-pins {
+		function = "uart2";
+		groups = "uart2_grp";
+	};
+	uart3_pins: uart3-pins {
+		function = "uart3";
+		groups = "uart3_grp";
+	};
+	i2c0_pins: i2c0-pins {
+		function = "i2c0";
+		groups = "i2c0_grp";
+		bias-pull-up;
+	};
+	i2c1_pins: i2c1-pins {
+		function = "i2c1";
+		groups = "i2c1_grp";
+		bias-pull-up;
+	};
+	i2c2_pins: i2c2-pins {
+		function = "i2c2";
+		groups = "i2c2_grp";
+		bias-pull-up;
+	};
+	i2c3_pins: i2c3-pins {
+		function = "i2c3";
+		groups = "i2c3_grp";
+		bias-pull-up;
+	};
+	i2c4_pins: i2c4-pins {
+		function = "i2c4";
+		groups = "i2c4_grp";
+		bias-pull-up;
+	};
+	i2c5_pins: i2c5-pins {
+		function = "i2c5";
+		groups = "i2c5_grp";
+		bias-pull-up;
+	};
+	i2c6_pins: i2c6-pins {
+		function = "i2c6";
+		groups = "i2c6_grp";
+		bias-pull-up;
+	};
+	i2c7_pins: i2c7-pins {
+		function = "i2c7";
+		groups = "i2c7_grp";
+		bias-pull-up;
+	};
+	i2c8_pins: i2c8-pins {
+		function = "i2c8";
+		groups = "i2c8_grp";
+		bias-pull-up;
+	};
+};
-- 
2.27.0


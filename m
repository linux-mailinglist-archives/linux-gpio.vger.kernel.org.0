Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCC5245A90
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 03:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgHQB7T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 21:59:19 -0400
Received: from mo-csw-fb1515.securemx.jp ([210.130.202.171]:49248 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgHQB7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 21:59:18 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 07H1l9VB030355; Mon, 17 Aug 2020 10:47:09 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07H1ksru003694; Mon, 17 Aug 2020 10:46:54 +0900
X-Iguazu-Qid: 34tMXyHquHoSQpSrfn
X-Iguazu-QSIG: v=2; s=0; t=1597628814; q=34tMXyHquHoSQpSrfn; m=Dtp2XqsXjPz89Bhjdj7MHK1GNzLImtmcqumWTmOMpr8=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 07H1krVE008490;
        Mon, 17 Aug 2020 10:46:53 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx12.toshiba.co.jp  with ESMTP id 07H1krGl001678;
        Mon, 17 Aug 2020 10:46:53 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc03.toshiba.co.jp  with ESMTP id 07H1kqAk023843;
        Mon, 17 Aug 2020 10:46:53 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 6/8] arm64: dts: visconti: Add device tree for TMPV7708 RM main board
Date:   Mon, 17 Aug 2020 10:46:30 +0900
X-TSB-HOP: ON
Message-Id: <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  44 ++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 390 ++++++++++++++++++
 .../arm64/boot/dts/toshiba/tmpv7708_pins.dtsi |  93 +++++
 5 files changed, 530 insertions(+)
 create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index f19b762c008d..c58bdab675ea 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -26,5 +26,6 @@ subdir-y += socionext
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
index 000000000000..a883d3ab1858
--- /dev/null
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
@@ -0,0 +1,44 @@
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
+		bootargs = "earlycon=pl011,0x28200000";
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
index 000000000000..f78ebb707aa4
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
+		always-on;
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
+			pinctrl-0 = <&uart_0>;
+			status = "disabled";
+		};
+
+		uart1: serial@28201000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28201000 0 0x1000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart_1>;
+			status = "disabled";
+		};
+
+		uart2: serial@28202000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28202000 0 0x1000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart_2>;
+			status = "disabled";
+		};
+
+		uart3: serial@28203000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x28203000 0 0x1000>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart_3>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@28030000 {
+			compatible = "snps,designware-i2c";
+			reg = <0 0x28030000 0 0x1000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c_0>;
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
+			pinctrl-0 = <&i2c_1>;
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
+			pinctrl-0 = <&i2c_2>;
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
+			pinctrl-0 = <&i2c_3>;
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
+			pinctrl-0 = <&i2c_4>;
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
+			pinctrl-0 = <&i2c_5>;
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
+			pinctrl-0 = <&i2c_6>;
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
+			pinctrl-0 = <&i2c_7>;
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
+			pinctrl-0 = <&i2c_8>;
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
+			pinctrl-0 = <&spi_0>;
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
+			pinctrl-0 = <&spi_1>;
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
+			pinctrl-0 = <&spi_2>;
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
+			pinctrl-0 = <&spi_3>;
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
+			pinctrl-0 = <&spi_4>;
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
+			pinctrl-0 = <&spi_5>;
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
+			pinctrl-0 = <&spi_6>;
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
index 000000000000..fb630f51cfe2
--- /dev/null
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+&pmux {
+	spi_0: spi_0 {
+		function = "spi0";
+		groups = "spi0_grp";
+	};
+	spi_1: spi_1 {
+		function = "spi1";
+		groups = "spi1_grp";
+	};
+	spi_2: spi_2 {
+		function = "spi2";
+		groups = "spi2_grp";
+	};
+	spi_3: spi_3 {
+		function = "spi3";
+		groups = "spi3_grp";
+	};
+	spi_4: spi_4 {
+		function = "spi4";
+		groups = "spi4_grp";
+	};
+	spi_5: spi_5 {
+		function = "spi5";
+		groups = "spi5_grp";
+	};
+	spi_6: spi_6 {
+		function = "spi6";
+		groups = "spi6_grp";
+	};
+	uart_0: uart_0 {
+		function = "uart0";
+		groups = "uart0_grp";
+	};
+	uart_1: uart_1 {
+		function = "uart1";
+		groups = "uart1_grp";
+	};
+	uart_2: uart_2 {
+		function = "uart2";
+		groups = "uart2_grp";
+	};
+	uart_3: uart_3 {
+		function = "uart3";
+		groups = "uart3_grp";
+	};
+	i2c_0: i2c_0 {
+		function = "i2c0";
+		groups = "i2c0_grp";
+		bias-pull-up;
+	};
+	i2c_1: i2c_1 {
+		function = "i2c1";
+		groups = "i2c1_grp";
+		bias-pull-up;
+	};
+	i2c_2: i2c_2 {
+		function = "i2c2";
+		groups = "i2c2_grp";
+		bias-pull-up;
+	};
+	i2c_3: i2c_3 {
+		function = "i2c3";
+		groups = "i2c3_grp";
+		bias-pull-up;
+	};
+	i2c_4: i2c_4 {
+		function = "i2c4";
+		groups = "i2c4_grp";
+		bias-pull-up;
+	};
+	i2c_5: i2c_5 {
+		function = "i2c5";
+		groups = "i2c5_grp";
+		bias-pull-up;
+	};
+	i2c_6: i2c_6 {
+		function = "i2c6";
+		groups = "i2c6_grp";
+		bias-pull-up;
+	};
+	i2c_7: i2c_7 {
+		function = "i2c7";
+		groups = "i2c7_grp";
+		bias-pull-up;
+	};
+	i2c_8: i2c_8 {
+		function = "i2c8";
+		groups = "i2c8_grp";
+		bias-pull-up;
+	};
+};
-- 
2.27.0


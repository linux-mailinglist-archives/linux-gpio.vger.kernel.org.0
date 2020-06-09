Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6741F35C1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgFIIIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 04:08:02 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:21349 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgFIIIB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 04:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591690080; x=1623226080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=36Vk1FR82hu0J0R4LuI32i3xrUrdc99D163WeLVASlo=;
  b=ywncihmVdGghDJFYxSphx5tgUCZis0dF8zR4Luw7EBiUAWhU/1VUhbap
   Ee/TnGlgkImSvvOTneKvjJCuFCefbOY2l3kovKHMQ0zMFJUOHemqwSgHP
   nEzSL1M0Og+030SXtjmWAiSmO0paezY5F/1GC4DrOtTXDKTxJy82iLMRd
   sbkXNTRbK/u6+5vav60qeQoQEKsq1XS0llhTRQcblodm6ydk7VfCrI3mQ
   l57maSucRHXNiKqm7k692Vc+4bGEA/dMxq29V8GHLhy8GkFRprIh0sVrI
   S9RIbc7Y5AeT/X5G24blhz+9koYxdi//GOu5EQ8IyAdELiatpouzHHoa7
   Q==;
IronPort-SDR: PZ3Adm2lzYR0hLg5Cn/r+ieE72bnBwNer7XyJR+1NBMuEG3MfgQDYgap4jJom58O0QKR09ndQI
 9dSE/3EMgh6VElhD4qAtgG5MtVSDuXTnuLbmp+uwDYXYMqW9oTyTstVyHOTw6Ci2Rfk4Z0H+kh
 mUblyU3lhwRDkD74RVD0gfXiLfF5tVlpy82q8Pm5sU4e8rMbL1P94XX5X9j5pg0v8Ck3x2VvmM
 ARoV9xh7k7uOWKrWJ83BsosTc1F/BqxaSysmMigqgn+CDt/MUDu/rkTsQE3XjNyw0lFcbpaOLF
 pso=
X-IronPort-AV: E=Sophos;i="5.73,491,1583218800"; 
   d="scan'208";a="75946399"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2020 01:07:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 9 Jun 2020 01:07:59 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Tue, 9 Jun 2020 01:07:56 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 03/10] arm64: dts: sparx5: Add basic cpu support
Date:   Tue, 9 Jun 2020 10:07:02 +0200
Message-ID: <20200609080709.9654-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609080709.9654-1-lars.povlsen@microchip.com>
References: <20200608123024.5330-1-lars.povlsen@microchip.com>
 <20200609080709.9654-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the basic DT structure for the Microchip Sparx5 SoC, and the
reference boards, pcb125, pcb134 and pcb135. The two latter have a
NAND vs a eMMC centric variant (as a mount option).

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/microchip/Makefile        |   4 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 142 ++++++++++++++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |  17 +++
 .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +++
 .../dts/microchip/sparx5_pcb134_board.dtsi    |  15 ++
 .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +++
 .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  15 ++
 .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +++
 .../boot/dts/microchip/sparx5_pcb_common.dtsi |  15 ++
 12 files changed, 278 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/Makefile
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
 create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 3fe6f314df3e7..908f9ac96f6ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2116,6 +2116,7 @@ M:	Lars Povlsen <lars.povlsen@microchip.com>
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
 M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+F:	arch/arm64/boot/dts/microchip/
 N:	sparx5
 S:	Supported

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index f19b762c008d8..9680a7f20c307 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -17,6 +17,7 @@ subdir-y += intel
 subdir-y += lg
 subdir-y += marvell
 subdir-y += mediatek
+subdir-y += microchip
 subdir-y += nvidia
 subdir-y += qcom
 subdir-y += realtek
diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts/microchip/Makefile
new file mode 100644
index 0000000000000..c6e0313eea0f9
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
+dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
+dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
new file mode 100644
index 0000000000000..4a54b7d039167
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "microchip,sparx5";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <1>;
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
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+		L2_0: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	clocks: clocks {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+		ahb_clk: ahb-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <250000000>;
+		};
+		sys_clk: sys-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <625000000>;
+		};
+	};
+
+	axi: axi@600000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		gic: interrupt-controller@600300000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-controller;
+			reg = <0x6 0x00300000 0x10000>,	/* GIC Dist */
+			      <0x6 0x00340000 0xc0000>,	/* GICR */
+			      <0x6 0x00200000 0x2000>,	/* GICC */
+			      <0x6 0x00210000 0x2000>,  /* GICV */
+			      <0x6 0x00220000 0x2000>;  /* GICH */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		uart0: serial@600100000 {
+			compatible = "ns16550a";
+			reg = <0x6 0x00100000 0x20>;
+			clocks = <&ahb_clk>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@600102000 {
+			compatible = "ns16550a";
+			reg = <0x6 0x00102000 0x20>;
+			clocks = <&ahb_clk>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+		};
+
+		timer1: timer@600105000 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0x6 0x00105000 0x1000>;
+			clocks = <&ahb_clk>;
+			clock-names = "timer";
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
new file mode 100644
index 0000000000000..d7f985f7ee020
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb_common.dtsi"
+
+/ {
+	model = "Sparx5 PCB125 Reference Board";
+	compatible = "microchip,sparx5-pcb125", "microchip,sparx5";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x10000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
new file mode 100644
index 0000000000000..feee4e99ff57c
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb134_board.dtsi"
+
+/ {
+	model = "Sparx5 PCB134 Reference Board (NAND)";
+	compatible = "microchip,sparx5-pcb134", "microchip,sparx5";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x10000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
new file mode 100644
index 0000000000000..9b2aec400101b
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb_common.dtsi"
+
+/{
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
new file mode 100644
index 0000000000000..10081a66961bb
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb134_board.dtsi"
+
+/ {
+	model = "Sparx5 PCB134 Reference Board (eMMC enabled)";
+	compatible = "microchip,sparx5-pcb134", "microchip,sparx5";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x10000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
new file mode 100644
index 0000000000000..20e409a9be196
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb135_board.dtsi"
+
+/ {
+	model = "Sparx5 PCB135 Reference Board (NAND)";
+	compatible = "microchip,sparx5-pcb135", "microchip,sparx5";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x10000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
new file mode 100644
index 0000000000000..9b2aec400101b
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb_common.dtsi"
+
+/{
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
new file mode 100644
index 0000000000000..741f0e12260e5
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5_pcb135_board.dtsi"
+
+/ {
+	model = "Sparx5 PCB135 Reference Board (eMMC enabled)";
+	compatible = "microchip,sparx5-pcb135", "microchip,sparx5";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x10000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
new file mode 100644
index 0000000000000..1f99d0db1284f
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
+ */
+
+/dts-v1/;
+#include "sparx5.dtsi"
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
--
2.27.0

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013631D1384
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733183AbgEMM4w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:52 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:6948 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbgEMM4v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374610; x=1620910610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rD85cOeaPlQ4sx7WF3mvHfNPUAPNhYYnUKJHjynNaA0=;
  b=aOdspnolZIyBhYCZr24ftY/vauxSVe5f7XYQ0J9roDv8xPaiqnxyEsPR
   gn9fpxxcSirWXLUg4WvkuwkfaiFOrDeh5GTj+gUeb/PaUlFLI86dJsI9r
   XmY16q0QRO03lCGLaU+kvGdt6uU3dMKlXcj1hu4lxkEVHCHZFXOCN3lAO
   IhKZz8/R8f+fak6c9AxAUPaYWk6hLBGIpuk40TY/RnVY+8nCmpehXGmgp
   MT0ulU1r2cPRbFkOR9fe7TEbjaWwLMhIXqdvF+Y9gDdw6/a9VH2cPDWGR
   FY6os38aWXjkMnyC/OEO2Rv2qlQnkptei47bMRreZyXVH9lL/E3qoxN2L
   A==;
IronPort-SDR: T8QRGAV2QR9+jQHrc5zBPqCszPh+6v9mgKmxyzvl7rcpe7eYFEivMrh3Kms/iVTUsyqzwrPMKD
 WItq0WOnjftDoMA0IZ/ATi0ak/qe3mAhjjEqhF5IWfAWihKofvHly5rzSWICC21m3i0s7hYXmh
 FSrENPNJtxmzn0B2t/zFt0ZcDUYoo9qQQ7fW+3U9qkbL0UzE/1UA7wRNmp2MDUX18iU0rCKp+g
 pyeqoB5NEnAH/nunqz+RHB3CyGHASzyNfcmb5y6eVvIcgOMNHSLnQflKjSYzMiCgTqrgkvBErx
 2bI=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="75132812"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:52 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:46 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
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
Subject: [PATCH 06/14] arm64: dts: sparx5: Add basic cpu support
Date:   Wed, 13 May 2020 14:55:24 +0200
Message-ID: <20200513125532.24585-7-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the basic DT structure for the Microchip Sparx5 SoC, and the
reference boards, pcb125, pcb134 and pcb135. The two latter have a
NAND vs a eMMC centric variant (as a mount option),

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/microchip/Makefile        |   4 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 135 ++++++++++++++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |  17 +++
 .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +++
 .../dts/microchip/sparx5_pcb134_board.dtsi    |  15 ++
 .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +++
 .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  15 ++
 .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +++
 .../boot/dts/microchip/sparx5_pcb_common.dtsi |  15 ++
 12 files changed, 271 insertions(+)
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
index 1b5a18d3dbb9f..5aa28d6e39d4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2084,6 +2084,7 @@ M:	Lars Povlsen <lars.povlsen@microchip.com>
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
index 0000000000000..3136b4369f507
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -0,0 +1,135 @@
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
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x0000fff8>;
+			next-level-cache = <&L2_0>;
+		};
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x0000fff8>;
+			next-level-cache = <&L2_0>;
+		};
+		L2_0: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts =
+			<GIC_PPI 13
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 14
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 11
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 10
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
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
+			reg = <0x6 0x00300000 0x20000>,	/* GICD */
+			      <0x6 0x00340000 0x1000000>;	/* GICR */
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
2.26.2

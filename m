Return-Path: <linux-gpio+bounces-23049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F30AFF5D8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 569C9562D4C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786A61DF270;
	Thu, 10 Jul 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="aAPEVMLH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1119D08F
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106872; cv=none; b=Ry7Wrj6YsRZPaqIKiobEBBUAey2VFZsXK6P4iNQdYSumG3cHPbK/F3cMp9fT3LtS/lkEuueFR753y7+U5bmfczpJ+GvdJ76YXJWXKDlbx2ujs1t2oPmBB11CLwG/HF/2wx5nKY1c5Ck33ZvNt92ujsxslbERaCTOK/FI67ax1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106872; c=relaxed/simple;
	bh=5GPEh4zg18KRWwJgxxkzuyxM5vmaI0kXf99LFNAueyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kdelcpJARfFMNxzJPkabqxIWbiuZyvlNN4UnXHs4vvrb49moTILLAIosm/SwulIhnHQ92+nVgGctIbYaID5+seRKOYd/4cCsdX4AqXu+sTcbQXYKeJ55j7flFJb8XXwUYJ7eeh+ddNbBschDtwH1TTpYBdb7O9k02muSdRvj4HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=aAPEVMLH; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106865; bh=5GPEh4zg18KRWwJgxxkzuyxM5vmaI0kXf99LFNAueyQ=;
	l=11826; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=aAPEVMLHb6ZHij/W89LXF/yT61IvwjOeMGhq+c+TnFCgAwIr4fkQ9BPTRrauxE93C
	 E9FXnvgtP2QuKlsfSDEYeCpnpzGfMx3FRIzstdHFrHMSlvDUz5+gtwkqD/ud3Kdi94
	 9WN9oQsD+fcPKOwr2DsWkRBdDN0Cv9Omdir6q9NI=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:05 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ravi Patel <ravi.patel@samsung.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 14/16] arm64: dts: axis: Add initial device tree support
Date: Thu, 10 Jul 2025 09:20:44 +0900
Message-Id: <20250710002047.1573841-15-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: sungminpark <smn1196@coasia.com>

Add initial device tree support for Axis ARTPEC-8 SoC and Grizzly board.
This SoC contains four cores of cortex-a53 CPUs and other various
peripheral IPs.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: sungminpark <smn1196@coasia.com>
---
 MAINTAINERS                                  |  14 ++
 arch/arm64/Kconfig.platforms                 |  13 +
 arch/arm64/boot/dts/Makefile                 |   1 +
 arch/arm64/boot/dts/axis/Makefile            |   4 +
 arch/arm64/boot/dts/axis/artpec8-grizzly.dts |  67 +++++
 arch/arm64/boot/dts/axis/artpec8.dtsi        | 252 +++++++++++++++++++
 6 files changed, 351 insertions(+)
 create mode 100644 arch/arm64/boot/dts/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/axis/artpec8.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..371005f3f41a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2320,6 +2320,20 @@ F:	drivers/crypto/axis
 F:	drivers/mmc/host/usdhi6rol0.c
 F:	drivers/pinctrl/pinctrl-artpec*
 
+ARM/ARTPEC ARM64 MACHINE SUPPORT
+M:	Jesper Nilsson <jesper.nilsson@axis.com>
+M:	Ravi Patel <ravi.patel@samsung.com>
+M:	SeonGu Kang <ksk4725@coasia.com>
+M:	SungMin Park <smn1196@coasia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+L:	linux-arm-kernel@axis.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
+F:	arch/arm64/boot/dts/axis/
+F:	drivers/clk/samsung/clk-artpec*.c
+F:	include/dt-bindings/clock/axis,artpec*-clk.h
+
 ARM/ASPEED I2C DRIVER
 M:	Ryan Chen <ryan_chen@aspeedtech.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..418ee47227c1 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,19 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
 
+config ARCH_ARTPEC
+	bool "Axis Communications ARTPEC SoC Family"
+	help
+	   This enables support for the ARMv8 based ARTPEC SoC Family.
+
+config ARCH_ARTPEC8
+	bool "Axis ARTPEC-8 SoC Platform"
+	depends on ARCH_ARTPEC
+	depends on ARCH_EXYNOS
+	select ARM_GIC
+	help
+	  This enables support for the Axis ARTPEC-8 SoC.
+
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
 
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..6b6a3aedc2ed 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -9,6 +9,7 @@ subdir-y += amlogic
 subdir-y += apm
 subdir-y += apple
 subdir-y += arm
+subdir-y += axis
 subdir-y += bitmain
 subdir-y += blaize
 subdir-y += broadcom
diff --git a/arch/arm64/boot/dts/axis/Makefile b/arch/arm64/boot/dts/axis/Makefile
new file mode 100644
index 000000000000..ccf00de64016
--- /dev/null
+++ b/arch/arm64/boot/dts/axis/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_ARTPEC) += \
+	artpec8-grizzly.dtb
diff --git a/arch/arm64/boot/dts/axis/artpec8-grizzly.dts b/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
new file mode 100644
index 000000000000..7671130a0333
--- /dev/null
+++ b/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 Grizzly board device tree source
+ *
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2022-2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+/dts-v1/;
+#include "artpec8.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+/ {
+	model = "ARTPEC-8 grizzly board";
+	compatible = "axis,artpec8-grizzly", "axis,artpec8";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&osc_clk {
+	clock-frequency = <50000000>;
+	status = "okay";
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&cmu_cmu {
+	status = "okay";
+};
+
+&cmu_bus {
+	status = "okay";
+};
+
+&cmu_core {
+	status = "okay";
+};
+
+&cmu_cpucl {
+	status = "okay";
+};
+
+&cmu_fsys {
+	status = "okay";
+};
+
+&cmu_imem {
+	status = "okay";
+};
+
+&cmu_peri {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axis/artpec8.dtsi b/arch/arm64/boot/dts/axis/artpec8.dtsi
new file mode 100644
index 000000000000..296192560adf
--- /dev/null
+++ b/arch/arm64/boot/dts/axis/artpec8.dtsi
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 SoC device tree source
+ *
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2022-2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/axis,artpec8-clk.h>
+
+/ {
+	compatible = "axis,artpec8";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			cpu-idle-states = <&cpu_sleep>;
+			enable-method = "psci";
+			clocks = <&cmu_cpucl DOUT_CLK_CPUCL_CPU>;
+			clock-names = "dout_clk_cpucl_cpu";
+			clock-frequency = <1200000000>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			cpu-idle-states = <&cpu_sleep>;
+			enable-method = "psci";
+			clock-frequency = <1200000000>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			cpu-idle-states = <&cpu_sleep>;
+			enable-method = "psci";
+			clock-frequency = <1200000000>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			cpu-idle-states = <&cpu_sleep>;
+			enable-method = "psci";
+			clock-frequency = <1200000000>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <300>;
+				exit-latency-us = <1200>;
+				min-residency-us = <2000>;
+			};
+		};
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
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	osc_clk: xxti {
+		compatible = "fixed-clock";
+		clock-output-names = "xxti";
+		#clock-cells = <0>;
+	};
+
+	fin_pll: fin_pll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x17000000>;
+
+		mct@10040000 {
+			compatible = "samsung,exynos4210-mct";
+			reg = <0x10040000 0x1000>;
+			clocks = <&fin_pll>, <&cmu_imem MOUT_IMEM_ACLK_USER>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gic: interrupt-controller@10201000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x10201000 0x00001000>,
+			      <0x10202000 0x00002000>,
+			      <0x10204000 0x00002000>,
+			      <0x10206000 0x00002000>;
+		};
+
+		cmu_cmu: clock-controller@12400000 {
+			compatible = "axis,artpec8-cmu-cmu";
+			reg = <0x12400000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>;
+			clock-names = "fin_pll";
+			status = "disabled";
+		};
+
+		cmu_bus: clock-controller@12c10000 {
+			compatible = "axis,artpec8-cmu-bus";
+			reg = <0x12c10000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu DOUT_CLKCMU_BUS_BUS>,
+				 <&cmu_cmu DOUT_CLKCMU_BUS_DLP>;
+			clock-names = "fin_pll",
+				      "dout_clkcmu_bus_bus",
+				      "dout_clkcmu_bus_dlp";
+			status = "disabled";
+		};
+
+		cmu_core: clock-controller@12410000 {
+			compatible = "axis,artpec8-cmu-core";
+			reg = <0x12410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu DOUT_CLKCMU_CORE_MAIN>,
+				 <&cmu_cmu DOUT_CLKCMU_CORE_DLP>;
+			clock-names = "fin_pll",
+				      "dout_clkcmu_core_main",
+				      "dout_clkcmu_core_dlp";
+			status = "disabled";
+		};
+
+		cmu_cpucl: clock-controller@11410000 {
+			compatible = "axis,artpec8-cmu-cpucl";
+			reg = <0x11410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu DOUT_CLKCMU_CPUCL_SWITCH>;
+			clock-names = "fin_pll",
+				"dout_clkcmu_cpucl_switch";
+			status = "disabled";
+		};
+
+		cmu_fsys: clock-controller@16c10000 {
+			compatible = "axis,artpec8-cmu-fsys";
+			reg = <0x16c10000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu DOUT_CLKCMU_FSYS_SCAN0>,
+				 <&cmu_cmu DOUT_CLKCMU_FSYS_SCAN1>,
+				 <&cmu_cmu DOUT_CLKCMU_FSYS_BUS>,
+				 <&cmu_cmu DOUT_CLKCMU_FSYS_IP>;
+			clock-names = "fin_pll",
+				      "dout_clkcmu_fsys_scan0",
+				      "dout_clkcmu_fsys_scan1",
+				      "dout_clkcmu_fsys_bus",
+				      "dout_clkcmu_fsys_ip";
+			status = "disabled";
+		};
+
+		cmu_imem: clock-controller@10010000 {
+			compatible = "axis,artpec8-cmu-imem";
+			reg = <0x10010000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu DOUT_CLKCMU_IMEM_ACLK>,
+				 <&cmu_cmu DOUT_CLKCMU_IMEM_JPEG>;
+			clock-names = "fin_pll",
+				      "dout_clkcmu_imem_aclk",
+				      "dout_clkcmu_imem_jpeg";
+			status = "disabled";
+		};
+
+		cmu_peri: clock-controller@16410000 {
+			compatible = "axis,artpec8-cmu-peri";
+			reg = <0x16410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu DOUT_CLKCMU_PERI_IP>,
+				 <&cmu_cmu DOUT_CLKCMU_PERI_AUDIO>,
+				 <&cmu_cmu DOUT_CLKCMU_PERI_DISP>;
+			clock-names = "fin_pll",
+				      "dout_clkcmu_peri_ip",
+				      "dout_clkcmu_peri_audio",
+				      "dout_clkcmu_peri_disp";
+			status = "disabled";
+		};
+
+		serial_0: serial@16cc0000 {
+			compatible = "axis,artpec8-uart";
+			reg = <0x16cc0000 0x100>;
+			clocks = <&cmu_fsys DOUT_FSYS_BUS300>,
+				 <&cmu_fsys DOUT_FSYS_SCLK_UART>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&serial0_bus>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.34.1



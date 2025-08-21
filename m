Return-Path: <linux-gpio+bounces-24749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2AAB2F868
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AEF91CE2B5C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C513218A8;
	Thu, 21 Aug 2025 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gnzpwcMA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4D32039A
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780061; cv=none; b=MjKXMn2w/FtX9PDDWMc9hSqBUPlLmLXVpnd0lMagzKblmfT9i06IXceQiq33L83nF9QTS03UDnw58FIio3yHX3AHVC2vYaRBE9AlLbNMmOGPw3ezsK3WiV3p+CSVhKRAQ1VA9/3CRwd4bVJiF1vlRTEnEP3AxPZn+m64MMEKsds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780061; c=relaxed/simple;
	bh=Sp1F4YCW5j9PnKWWbW/qi8WkNVYk+Je2ugOYzxuVHVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uAfhUC3qfwDK+6qsKTpCiXxuE0SJg/lg2pUYna8fWIfm6tTtKxys3R5FU6PVFCZh7nMY5PiL9KhU2VmDnppG1oqF8HbjIdhuAxTX88reYJnyZ33oLOZq9hnDjmCmqkpzLUen9xvBxGZLgPHcJV9Zo//34Okzv66OQGrpqqVRZnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gnzpwcMA; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250821124057epoutp040cbd8273aff47661f399ba1422edd913~dyKj60Rs21828218282epoutp04d
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250821124057epoutp040cbd8273aff47661f399ba1422edd913~dyKj60Rs21828218282epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780057;
	bh=F34rBVTGFAPHq2X3ggcCEoe0+YH4ZXUFphYgrwUVCIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gnzpwcMAGBeV7fIlF2Lpr/XVjQvrgZtuYqZQMOvgS5us+Y/ca5f49fht/4IA2Mt6N
	 nFf51r62ob2smNFR0mQL6WLHPjrNF3V7qFr4wM6DHZyKUHJ/bBZZYIzf4LkoWxoHmg
	 Z30alS5KV1p3IFBEHnyUT++sdTqgBaGDTR0u/S4U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250821124057epcas5p4017233f5f63832f1bcea8b638ee0df2a~dyKjNWul11533315333epcas5p42;
	Thu, 21 Aug 2025 12:40:57 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c72x40xwqz3hhT4; Thu, 21 Aug
	2025 12:40:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f~dyKhuJ3oR1461614616epcas5p45;
	Thu, 21 Aug 2025 12:40:55 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124050epsmtip2cab6ceb28f085caa2826b833110fcdfa~dyKdK__AO2602126021epsmtip2n;
	Thu, 21 Aug 2025 12:40:50 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC
 support
Date: Thu, 21 Aug 2025 18:02:52 +0530
Message-ID: <20250821123310.94089-9-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="Yes"
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124055epcas5p4d1072e9b4ef29587e0fd8606bc1abc4f@epcas5p4.samsung.com>

From: SungMin Park <smn1196@coasia.com>

Add initial device tree support for Axis ARTPEC-8 SoC.

This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 MAINTAINERS                                   |  12 +
 arch/arm64/Kconfig.platforms                  |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/axis/artpec-pinctrl.h     |  36 +++
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi | 120 +++++++++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  | 244 ++++++++++++++++++
 6 files changed, 420 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..956140fbf639 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3929,6 +3929,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIS ARTPEC ARM64 SoC SUPPORT
+M:	Jesper Nilsson <jesper.nilsson@axis.com>
+M:	Lars Persson <lars.persson@axis.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+L:	linux-arm-kernel@axis.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
+F:	arch/arm64/boot/dts/exynos/axis/
+F:	drivers/clk/samsung/clk-artpec*.c
+F:	include/dt-bindings/clock/axis,artpec*-clk.h
+
 AXI-FAN-CONTROL HARDWARE MONITOR DRIVER
 M:	Nuno Sá <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..48af8b154f7a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,13 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
 
+config ARCH_ARTPEC
+	bool "Axis Communications ARTPEC SoC Family"
+	depends on ARCH_EXYNOS
+	select ARM_GIC
+	help
+	   This enables support for the ARMv8 based ARTPEC SoC Family.
+
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
 
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f6f4bc650a94..c1a64cd29078 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += axis
 subdir-y += google
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
new file mode 100644
index 000000000000..70bd1dcac85e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Axis ARTPEC-8 SoC device tree pinctrl constants
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#ifndef __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
+#define __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
+
+#define ARTPEC_PIN_PULL_NONE		0
+#define ARTPEC_PIN_PULL_DOWN		1
+#define ARTPEC_PIN_PULL_UP		3
+
+#define ARTPEC_PIN_FUNC_INPUT		0
+#define ARTPEC_PIN_FUNC_OUTPUT		1
+#define ARTPEC_PIN_FUNC_2		2
+#define ARTPEC_PIN_FUNC_3		3
+#define ARTPEC_PIN_FUNC_4		4
+#define ARTPEC_PIN_FUNC_5		5
+#define ARTPEC_PIN_FUNC_6		6
+#define ARTPEC_PIN_FUNC_EINT		0xf
+#define ARTPEC_PIN_FUNC_F		ARTPEC_PIN_FUNC_EINT
+
+/* Drive strength for ARTPEC */
+#define ARTPEC_PIN_DRV_SR1		0x8
+#define ARTPEC_PIN_DRV_SR2		0x9
+#define ARTPEC_PIN_DRV_SR3		0xa
+#define ARTPEC_PIN_DRV_SR4		0xb
+#define ARTPEC_PIN_DRV_SR5		0xc
+#define ARTPEC_PIN_DRV_SR6		0xd
+
+#endif /* __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__ */
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
new file mode 100644
index 000000000000..8d239a70f1b4
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include "artpec-pinctrl.h"
+
+&pinctrl_fsys {
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps0: gps0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps1: gps1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	serial0_bus: serial0-bus-pins {
+		samsung,pins = "gpf4-4", "gpf4-5";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+};
+
+&pinctrl_peric {
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpk0: gpk0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
new file mode 100644
index 000000000000..8ee20bf4f680
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 SoC device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
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
+	aliases {
+		pinctrl0 = &pinctrl_fsys;
+		pinctrl1 = &pinctrl_peric;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+			clocks = <&cmu_cpucl CLK_GOUT_CPUCL_CLUSTER_CPU>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
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
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
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
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x17000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		cmu_imem: clock-controller@10010000 {
+			compatible = "axis,artpec8-cmu-imem";
+			reg = <0x10010000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_ACLK>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_JPEG>;
+			clock-names = "fin_pll", "aclk", "jpeg";
+		};
+
+		timer@10040000 {
+			compatible = "axis,artpec8-mct", "samsung,exynos4210-mct";
+			reg = <0x10040000 0x1000>;
+			clocks = <&fin_pll>, <&cmu_imem CLK_GOUT_IMEM_MCT_PCLK>;
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
+			reg = <0x10201000 0x1000>,
+			      <0x10202000 0x2000>,
+			      <0x10204000 0x2000>,
+			      <0x10206000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_cpucl: clock-controller@11410000 {
+			compatible = "axis,artpec8-cmu-cpucl";
+			reg = <0x11410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_CPUCL_SWITCH>;
+			clock-names = "fin_pll", "switch";
+		};
+
+		cmu_cmu: clock-controller@12400000 {
+			compatible = "axis,artpec8-cmu-cmu";
+			reg = <0x12400000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>;
+			clock-names = "fin_pll";
+		};
+
+		cmu_core: clock-controller@12410000 {
+			compatible = "axis,artpec8-cmu-core";
+			reg = <0x12410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_CORE_MAIN>,
+				 <&cmu_cmu CLK_DOUT_CMU_CORE_DLP>;
+			clock-names = "fin_pll", "main", "dlp";
+		};
+
+		cmu_bus: clock-controller@12c10000 {
+			compatible = "axis,artpec8-cmu-bus";
+			reg = <0x12c10000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_BUS>,
+				 <&cmu_cmu CLK_DOUT_CMU_BUS_DLP>;
+			clock-names = "fin_pll", "bus", "dlp";
+		};
+
+		cmu_peri: clock-controller@16410000 {
+			compatible = "axis,artpec8-cmu-peri";
+			reg = <0x16410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_IP>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_AUDIO>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_DISP>;
+			clock-names = "fin_pll", "ip", "audio", "disp";
+		};
+
+		pinctrl_peric: pinctrl@165f0000 {
+			compatible = "axis,artpec8-pinctrl";
+			reg = <0x165f0000 0x1000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_fsys: clock-controller@16c10000 {
+			compatible = "axis,artpec8-cmu-fsys";
+			reg = <0x16c10000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_SCAN0>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_SCAN1>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_BUS>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_IP>;
+			clock-names = "fin_pll", "scan0", "scan1", "bus", "ip";
+		};
+
+		pinctrl_fsys: pinctrl@16c30000 {
+			compatible = "axis,artpec8-pinctrl";
+			reg = <0x16c30000 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		serial_0: serial@16cc0000 {
+			compatible = "axis,artpec8-uart";
+			reg = <0x16cc0000 0x100>;
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_UART0_PCLK>,
+				 <&cmu_fsys CLK_GOUT_FSYS_UART0_SCLK_UART>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&serial0_bus>;
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
+};
-- 
2.49.0



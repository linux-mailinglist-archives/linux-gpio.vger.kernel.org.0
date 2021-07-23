Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D403D3B26
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhGWMsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:07 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:49122 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235075AbhGWMsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:03 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDDRmW020339;
        Fri, 23 Jul 2021 15:28:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=ZfjSmyQIc5NASrcE2kDuQ0Mz7I02i7zBjadw9CJZg90=;
 b=PU43/6AR9laNoyy73E7K6wTrErSqz9nl/3UtQad9K3NAt588plJ+zDny5wWidH6ZOP3u
 xxGPQSYQwwdKm4hQt2+vrGBeXpYGS52nUu6/sgx7Y4r86C/F5TPtAb45GJZ3Vncw/ozZ
 6PdJTtGC29BsUd+p8+k5oD6psQzr4X49MuzK+lSsrXQzzvMy6Vfmv3RRI7jB5eL/7o62
 ozhxJ2h8ciKXZKSjFr9mSoJskevWEfNpguu5uVLtcwbtX3UBRCUhzzQROKxK0teuWFul
 I7kRY1WZmtQxa/+mn7d3MbEdHB32YBZ1wZird4Pm9Oez9DvMscWDqzRzgkmZhoL3Emnl xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39yt689gnw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 370AA100034;
        Fri, 23 Jul 2021 15:28:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2648D221783;
        Fri, 23 Jul 2021 15:28:16 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:15
 +0200
From:   Alexandre Torgue <alexandre.torgue@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 5/7] ARM: dts: stm32: add STM32MP13 SoCs support
Date:   Fri, 23 Jul 2021 15:28:08 +0200
Message-ID: <20210723132810.25728-6-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_05:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial support of STM32MP13 family. The STM32MP13 SoC diversity is
composed by:
-STM32MP131:
  -core: 1*CA7, 17*TIMERS, 5*LPTIMERS, DMA/MDMA/DMAMUX
  -storage: 3*SDMCC, 1*QSPI, FMC
  -com: USB (OHCI/EHCI, OTG), 5*I2C, 5*SPI/I2S, 8*U(S)ART
  -audio: 2*SAI
  -network: 1*ETH(GMAC)
-STM32MP133: STM32MP131 + 2*CAN, ETH2(GMAC), ADC1
-STM32MP135: STM32MP133 + DCMIPP, LTDC

A second diversity layer exists for security features:
-STM32MP13xY, "Y" gives information:
 -Y = A/D means no cryp IP and no secure boot.
 -Y = C/F means cryp IP + secure boot.

This commit adds basic peripheral.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
new file mode 100644
index 000000000000..86126dc0d898
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0>;
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+		interrupt-parent = <&intc>;
+	};
+
+	clocks {
+		clk_axi: clk-axi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <266500000>;
+		};
+
+		clk_hse: clk-hse {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+		clk_hsi: clk-hsi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <64000000>;
+		};
+
+		clk_lsi: clk-lsi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+		};
+
+		clk_pclk3: clk-pclk3 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <104438965>;
+		};
+
+		clk_pclk4: clk-pclk4 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <133250000>;
+		};
+
+		clk_pll4_p: clk-pll4_p {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <50000000>;
+		};
+
+		clk_pll4_r: clk-pll4_r {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <99000000>;
+		};
+	};
+
+	intc: interrupt-controller@a0021000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0xa0021000 0x1000>,
+		      <0xa0022000 0x2000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-parent = <&intc>;
+		always-on;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		ranges;
+
+		uart4: serial@40010000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40010000 0x400>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_hsi>;
+			status = "disabled";
+		};
+
+		syscfg: syscon@50020000 {
+			compatible = "st,stm32mp157-syscfg", "syscon";
+			reg = <0x50020000 0x400>;
+			clocks = <&clk_pclk3>;
+		};
+
+		sdmmc1: mmc@58005000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00253180>;
+			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&clk_pll4_p>;
+			clock-names = "apb_pclk";
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+			status = "disabled";
+		};
+
+		iwdg2: watchdog@5a002000 {
+			compatible = "st,stm32mp1-iwdg";
+			reg = <0x5a002000 0x400>;
+			clocks = <&clk_pclk4>, <&clk_lsi>;
+			clock-names = "pclk", "lsi";
+			status = "disabled";
+		};
+
+		bsec: efuse@5c005000 {
+			compatible = "st,stm32mp15-bsec";
+			reg = <0x5c005000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			part_number_otp: part_number_otp@4 {
+				reg = <0x4 0x2>;
+			};
+			ts_cal1: calib@5c {
+				reg = <0x5c 0x2>;
+			};
+			ts_cal2: calib@5e {
+				reg = <0x5e 0x2>;
+			};
+		};
+
+		/*
+		 * Break node order to solve dependency probe issue between
+		 * pinctrl and exti.
+		 */
+		pinctrl: pin-controller@50002000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp135-pinctrl";
+			ranges = <0 0x50002000 0x8400>;
+			pins-are-numbered;
+
+			gpioa: gpio@50002000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOA";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+			};
+
+			gpiob: gpio@50003000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x1000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOB";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 16 16>;
+			};
+
+			gpioc: gpio@50004000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x2000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOC";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 32 16>;
+			};
+
+			gpiod: gpio@50005000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x3000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOD";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 48 16>;
+			};
+
+			gpioe: gpio@50006000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x4000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOE";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 64 16>;
+			};
+
+			gpiof: gpio@50007000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x5000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOF";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 80 16>;
+			};
+
+			gpiog: gpio@50008000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x6000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOG";
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 96 16>;
+			};
+
+			gpioh: gpio@50009000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x7000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOH";
+				ngpios = <15>;
+				gpio-ranges = <&pinctrl 0 112 15>;
+			};
+
+			gpioi: gpio@5000a000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x8000 0x400>;
+				clocks = <&clk_pclk4>;
+				st,bank-name = "GPIOI";
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl 0 128 8>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp133.dtsi b/arch/arm/boot/dts/stm32mp133.dtsi
new file mode 100644
index 000000000000..0fb1386257cf
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp133.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp131.dtsi"
+
+/ {
+	soc {
+		m_can1: can@4400e000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk_hse>, <&clk_pll4_r>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+
+		m_can2: can@4400f000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk_hse>, <&clk_pll4_r>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp135.dtsi b/arch/arm/boot/dts/stm32mp135.dtsi
new file mode 100644
index 000000000000..abf2acd37b4e
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp135.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp133.dtsi"
+
+/ {
+	soc {
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp13xc.dtsi b/arch/arm/boot/dts/stm32mp13xc.dtsi
new file mode 100644
index 000000000000..e32081a91345
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp13xc.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+	soc {
+		cryp: cryp@54002000 {
+			compatible = "st,stm32mp1-cryp";
+			reg = <0x54002000 0x400>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_axi>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp13xf.dtsi b/arch/arm/boot/dts/stm32mp13xf.dtsi
new file mode 100644
index 000000000000..e32081a91345
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp13xf.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+	soc {
+		cryp: cryp@54002000 {
+			compatible = "st,stm32mp1-cryp";
+			reg = <0x54002000 0x400>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_axi>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.17.1


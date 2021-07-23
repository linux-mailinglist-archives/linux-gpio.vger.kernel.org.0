Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0113D3B16
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbhGWMsD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 08:48:03 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58012 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233230AbhGWMsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 08:48:02 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NDBbPi018862;
        Fri, 23 Jul 2021 15:28:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=BsQ+xBUP2/QnHH1w0xmCSCVKFsAhAEpEBr3x9WWVBHw=;
 b=mEbwOV0v3n+0zl2RrRtQS8d9GlC5ELajSQdI5TW4KxbFEODIWJQjd1EoVjHfGile+exI
 FUjBHphht3CwFPTzwlmvCCTQPebm4Ro79GdikpoSbU6kc5wx1hEmbx5muMkf8xnP1yCp
 DU5p05IhbVoe/3PYIFsw43PBT9azyegieN7VGES7J0uM54/bPlTa3XkdWLHYdXINQg9V
 qANfyTaVdipQOMFfLrHB/YRxXWHxrpwK2jKofkg8+on8qLnyRxd9KW+Yp+8UtDtUETl0
 BJgN5N4pbPam9uwK4nb+BYGJuc9SBzHApEM8N004V8gNvZMYd0bC7wnEWvAvXdaDAjz/ Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39ygng4592-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 15:28:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 758C8100034;
        Fri, 23 Jul 2021 15:28:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65C0F221783;
        Fri, 23 Jul 2021 15:28:17 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:17
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
Subject: [PATCH 7/7] ARM: dts: stm32: add initial support of stm32mp135f-dk board
Date:   Fri, 23 Jul 2021 15:28:10 +0200
Message-ID: <20210723132810.25728-8-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_05:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support of stm32mp135f discovery board (part number: STM32MP135F-DK).
It embeds a STM32MP135f SOC with 512 MB of DDR3.
Several connections are available on this board:
    4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...

Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 863347b6b65e..e4e04e57fba0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1087,6 +1087,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb \
 	stm32h750i-art-pi.dtb \
+	stm32mp135f-dk.dtb \
 	stm32mp153c-dhcom-drc02.dtb \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-dhcor-avenger96.dtb \
diff --git a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
new file mode 100644
index 000000000000..069f95f2b628
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com>
+ */
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+&pinctrl {
+	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	uart4_pins_a: uart4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
new file mode 100644
index 000000000000..7e96d9e36217
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp135.dtsi"
+#include "stm32mp13xf.dtsi"
+#include "stm32mp13-pinctrl.dtsi"
+
+/ {
+	model = "STMicroelectronics STM32MP135F-DK Discovery Board";
+	compatible = "st,stm32mp135f-dk", "st,stm32mp135";
+
+	aliases {
+		serial0 = &uart4;
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	vdd_sd: vdd-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_sd";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-always-on;
+	};
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	broken-cd;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&vdd_sd>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
-- 
2.17.1


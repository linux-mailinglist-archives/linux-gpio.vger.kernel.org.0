Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF4C476549
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 23:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhLOWF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 17:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhLOWF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 17:05:57 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E89C061574;
        Wed, 15 Dec 2021 14:05:56 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id m192so21558624qke.2;
        Wed, 15 Dec 2021 14:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T5Hv7lLVORl4y0KcwLMhzz7XBJJUgOCwxl+2ndvkedA=;
        b=dvg0O9OjJX9riENexWGnb5WreNC27xqhqpSd1gu9DfGyJPto/5O+RMbnIvo47TRSXZ
         SqhodcZ6vi0Saq906JR/J4lu5lWmJkOpAXjdd7HFpeMsYkehQU9ojl0lq3GTXcdjZyoS
         xY9n+BBottAMYUwnNSXjQEx2r5PV4+EEEA/AUsRq7qKrI75ygA+G74anTD5fVV2TT6qe
         5RrbcvWcVucBf8XSaJbReB92wL/u+dgTeBZzuY4RO8/iXWObmxurKxGh/uIvnVhXdzKG
         cOkVui8uN/kq9vDTAbplXBd8zlgz9Ge03EXKdQ3MhVF+Ae66zjGyFxDXO53LFiNGng/s
         vSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T5Hv7lLVORl4y0KcwLMhzz7XBJJUgOCwxl+2ndvkedA=;
        b=uJ3wL0pcgPyJm1z2mpY11pmKs4yV4rAM2byhmGq01QI1YA1rNEegEFVfbYpozn1F7u
         syH9HQ2LRRbCZqcRgv/yR3m7nPR17oKDAqQSbt4021129XSYTfAxVsPOnORPWye69eK0
         eDoIn/u/E0mb5kXrYMUUD5yKaiLaWsNzgeF4O1h8397boqxll8PCucn73PbIwwriEQdN
         ikWnhBILdvnFl4wYZJlxzSjyENv6a7suQ0ZtlYXRTgIVe3jNlnfHLJhraEpFS55vZBgE
         XKYoSaLt83FdkOryc7uTOs8s4r8pS55o7UetgmQ8k+yKg6IgsP5q/1DH3m4898IoUJgh
         L4sg==
X-Gm-Message-State: AOAM533FNuR6fsmQ3gBZ4K6Z57vk1vKlyEd4o1aN/0XI/a3YzY73GoLs
        HqdepgzLlKJHKFDKFnTRq+8=
X-Google-Smtp-Source: ABdhPJyFpiA9zzb2JGxDvhhctq5YB6IHawhir/Mg8/5yLhopv5IjahwEwdOOCrfKuxL2soRIgQ2RLg==
X-Received: by 2002:a37:9ed5:: with SMTP id h204mr10495672qke.35.1639605955444;
        Wed, 15 Dec 2021 14:05:55 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id s20sm2471592qtc.75.2021.12.15.14.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:05:55 -0800 (PST)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v5 8/9] ARM: dts: imx: Add i.MXRT1050-EVK support
Date:   Wed, 15 Dec 2021 17:05:37 -0500
Message-Id: <20211215220538.4180616-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

The NXP i.MXRT1050 Evaluation Kit (EVK) provides a platform for rapid
evaluation of the i.MXRT, which features NXP's implementation of the Arm
Cortex-M7 core.

The EVK provides 32 MB SDRAM, 64 MB Quad SPI flash, Micro SD card socket,
USB 2.0 OTG.

This patch aims to support the preliminary booting up features
as follows:
GPIO
LPUART
SD/MMC

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
[Jesse: Add clock-parents, edma, usdhc, anatop, remove old pinctl]
---
V1->V2:
* dtsi: Add clock parent definitions
* dtsi: Change hex values to lowercase
* dtsi: Move anatop definition from driver
* dts: Remove unused pin controll (semc)
* dts: Use moved pin controll header
* Move aliases from dtsi to dts
* Change commit description
* Change licence to "GPL-2.0+ OR MIT"
V2->V3:
* Remove bootargs, comments, unused container
* Remove unnecessary new lines
* Rename imxrt to imxrt1050 for seiral and mmc
* GPT uses own clock
* fix memory@0
* Change GPT compatible handles
V3->V4:
* Remove "fsl,imx-osc"
* Add space on serial compatible
* Change "iomuxc@" to "pinctrl@"
* Change "ccm@" to "clock-controller@"
* Change "fsl,imxrt-gpio" to "fsl,imxrt1050-gpio"
V4->V5:
* Nothing done
---
 arch/arm/boot/dts/Makefile          |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts |  72 +++++++++++++
 arch/arm/boot/dts/imxrt1050.dtsi    | 154 ++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8a2dfdf01ce3..d539bf7daa86 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -723,6 +723,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 dtb-$(CONFIG_SOC_IMX7ULP) += \
 	imx7ulp-com.dtb \
 	imx7ulp-evk.dtb
+dtb-$(CONFIG_SOC_IMXRT) += \
+	imxrt1050-evk.dtb
 dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-moxa-uc-8410a.dtb \
 	ls1021a-qds.dtb \
diff --git a/arch/arm/boot/dts/imxrt1050-evk.dts b/arch/arm/boot/dts/imxrt1050-evk.dts
new file mode 100644
index 000000000000..6a9c10decf52
--- /dev/null
+++ b/arch/arm/boot/dts/imxrt1050-evk.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+/dts-v1/;
+#include "imxrt1050.dtsi"
+#include "imxrt1050-pinfunc.h"
+
+/ {
+	model = "NXP IMXRT1050-evk board";
+	compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		mmc0 = &usdhc1;
+		serial0 = &lpuart1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x2000000>;
+	};
+};
+
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <
+			MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD	0xf1
+			MXRT1050_IOMUXC_GPIO_AD_B0_13_LPUART1_RXD	0xf1
+		>;
+	};
+
+	pinctrl_usdhc0: usdhc0grp {
+		fsl,pins = <
+			MXRT1050_IOMUXC_GPIO_B1_12_USDHC1_CD_B		0x1B000
+			MXRT1050_IOMUXC_GPIO_B1_14_USDHC1_VSELECT	0xB069
+			MXRT1050_IOMUXC_GPIO_SD_B0_00_USDHC1_CMD	0x17061
+			MXRT1050_IOMUXC_GPIO_SD_B0_01_USDHC1_CLK	0x17061
+			MXRT1050_IOMUXC_GPIO_SD_B0_05_USDHC1_DATA3	0x17061
+			MXRT1050_IOMUXC_GPIO_SD_B0_04_USDHC1_DATA2	0x17061
+			MXRT1050_IOMUXC_GPIO_SD_B0_03_USDHC1_DATA1	0x17061
+			MXRT1050_IOMUXC_GPIO_SD_B0_02_USDHC1_DATA0	0x17061
+		>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc0>;
+	pinctrl-1 = <&pinctrl_usdhc0>;
+	pinctrl-2 = <&pinctrl_usdhc0>;
+	pinctrl-3 = <&pinctrl_usdhc0>;
+	cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imxrt1050.dtsi b/arch/arm/boot/dts/imxrt1050.dtsi
new file mode 100644
index 000000000000..9cf5738d2ae3
--- /dev/null
+++ b/arch/arm/boot/dts/imxrt1050.dtsi
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+#include "armv7-m.dtsi"
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/imxrt1050-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	clocks {
+		osc: osc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+		};
+	};
+
+	soc {
+		lpuart1: serial@40184000 {
+			compatible = "fsl,imxrt1050-lpuart", "fsl,imx8mm-uart", "fsl,imx6q-uart";
+			reg = <0x40184000 0x4000>;
+			interrupts = <20>;
+			clocks = <&clks IMXRT1050_CLK_LPUART1>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		iomuxc: pinctrl@401f8000 {
+			compatible = "fsl,imxrt1050-iomuxc";
+			reg = <0x401f8000 0x4000>;
+			fsl,mux_mask = <0x7>;
+		};
+
+		anatop: anatop@400d8000 {
+			compatible = "fsl,imxrt-anatop";
+			reg = <0x400d8000 0x4000>;
+		};
+
+		clks: clock-controller@400fc000 {
+			compatible = "fsl,imxrt1050-ccm";
+			reg = <0x400fc000 0x4000>;
+			interrupts = <95>, <96>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+			assigned-clocks = <&clks IMXRT1050_CLK_PLL1_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL1_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL2_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL3_BYPASS>,
+				<&clks IMXRT1050_CLK_PLL3_PFD1_664_62M>,
+				<&clks IMXRT1050_CLK_PLL2_PFD2_396M>;
+			assigned-clock-parents = <&clks IMXRT1050_CLK_PLL1_REF_SEL>,
+				<&clks IMXRT1050_CLK_PLL1_ARM>,
+				<&clks IMXRT1050_CLK_PLL2_SYS>,
+				<&clks IMXRT1050_CLK_PLL3_USB_OTG>,
+				<&clks IMXRT1050_CLK_PLL3_USB_OTG>,
+				<&clks IMXRT1050_CLK_PLL2_SYS>;
+		};
+
+		edma1: dma-controller@400e8000 {
+			#dma-cells = <2>;
+			compatible = "fsl,imx7ulp-edma";
+			reg = <0x400e8000 0x4000>,
+				<0x400ec000 0x4000>;
+			dma-channels = <32>;
+			interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>, <8>,
+				<9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>;
+			clock-names = "dma", "dmamux0";
+			clocks = <&clks IMXRT1050_CLK_DMA>,
+				 <&clks IMXRT1050_CLK_DMA_MUX>;
+		};
+
+		usdhc1: mmc@402c0000 {
+			compatible ="fsl,imxrt1050-usdhc";
+			reg = <0x402c0000 0x4000>;
+			interrupts = <110>;
+			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
+				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_USDHC1>;
+			clock-names = "ipg", "ahb", "per";
+			bus-width = <4>;
+			fsl,wp-controller;
+			no-1-8-v;
+			max-frequency = <4000000>;
+			fsl,tuning-start-tap = <20>;
+			fsl,tuning-step= <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@401b8000 {
+			compatible = "fsl,imxrt1050-gpio", "fsl,imx35-gpio";
+			reg = <0x401b8000 0x4000>;
+			interrupts = <80>, <81>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@401bc000 {
+			compatible = "fsl,imxrt1050-gpio", "fsl,imx35-gpio";
+			reg = <0x401bc000 0x4000>;
+			interrupts = <82>, <83>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@401c0000 {
+			compatible = "fsl,imxrt1050-gpio", "fsl,imx35-gpio";
+			reg = <0x401c0000 0x4000>;
+			interrupts = <84>, <85>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@401c4000 {
+			compatible = "fsl,imxrt1050-gpio", "fsl,imx35-gpio";
+			reg = <0x401c4000 0x4000>;
+			interrupts = <86>, <87>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio5: gpio@400c0000 {
+			compatible = "fsl,imxrt1050-gpio", "fsl,imx35-gpio";
+			reg = <0x400c0000 0x4000>;
+			interrupts = <88>, <89>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpt: timer@401ec000 {
+			compatible = "fsl,imxrt1050-gpt", "fsl,imx6dl-gpt", "fsl,imx6sl-gpt";
+			reg = <0x401ec000 0x4000>;
+			interrupts = <100>;
+			clocks = <&clks IMXRT1050_CLK_GPT>;
+			clock-names = "per";
+		};
+	};
+};
-- 
2.34.1


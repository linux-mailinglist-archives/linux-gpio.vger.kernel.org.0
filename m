Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008C13DBB58
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239453AbhG3Oud (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239621AbhG3OuM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:50:12 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985D7C0611A1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:43 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id j2so13499134edp.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cpo8Ym7jSjuo/VVuR51BzB678sVQ8+ob22qd1eHfR+E=;
        b=e3Yv3om6f5a7TQzby7K+D9HjXdviWrS8lL6Payn+A4xYkphwCfX0DLv2+Mm1sML/I+
         H1Yf6aCy0tHXxzOs1PZVssogjG3b9imWDqOI+3bBmjt3TupVwda5jjE1uXLDGjo6VV42
         CD/8G4DNU5J7zf50twg/hYuy2Px48V0Yl992N/2G2D4mH0LKCTLDE6o6fqKkrMc2iB4N
         4GtqXu71tzF1tf5LcflHBHSBF01G7yiWjWr8o2Qe+JvlqT0EfTvU21i5MPOJeZ6w5Kaa
         0dP7T2YKP1BzQWpPNyT7wvyXCBD1eLr4WQbAJDlwgYGd0NH5gawzaXXApSmhMCI7Un7D
         Bs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cpo8Ym7jSjuo/VVuR51BzB678sVQ8+ob22qd1eHfR+E=;
        b=mwT62hwGTEMV7oFBEV+NgpJwLMjwUGW3YpoihVj+9ctIy/p4NJ5Ef9NNa6r1/KLAnZ
         4wK/Ear2jW+C4wp8mfJN8OHSnB0Qnbye4F9RJPM+Pr8jjylqcEZSHJeDWJF5wtJzuRzo
         gDMBh1QMqq4sXhDl4xWYL+sNdRldk9rWYys1iZEOElUcn1t7c9rOgN5eZFlzLCv77DAC
         llWGKfEYz5aSJ5gfrTu1BSRtREljtOrIO2WBc3kYBeSlcHxhTAASvCZdqopFtJXA8ON9
         ssDqIHTmEfXdp+gdb88AJsyD7N8fb+msx/yhDQcWeEqSMBVK/5JKLOczaZN9Apb+f0T+
         G0ZA==
X-Gm-Message-State: AOAM533G3WpgmNWrZ0Fvjxy5dOQRRfE7alORElPFWnWsEtRNDOiLoJa2
        YmkRPqOZ1WH5O7SqmET9Jck51A==
X-Google-Smtp-Source: ABdhPJzxfngoST3bpCPZXVGHpOax88+CYX4Eo1OyXtuEE4sryebIn7wOgB2ryekpZ2Qgo+WW0i4MIQ==
X-Received: by 2002:aa7:cc83:: with SMTP id p3mr3458986edt.365.1627656582079;
        Fri, 30 Jul 2021 07:49:42 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f16sm766283edt.57.2021.07.30.07.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:41 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
Date:   Fri, 30 Jul 2021 17:49:22 +0300
Message-Id: <20210730144922.29111-13-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Samsung Exynos850 is ARMv8-based mobile-oriented SoC.

Features:
 * CPU: Cortex-A55 Octa (8 cores), up to 2 GHz
 * Memory interface: LPDDR4/4x 2 channels (12.8 GB/s)
 * SD/MMC: SD 3.0, eMMC5.1 DDR 8-bit
 * Modem: 4G LTE, 3G, GSM/GPRS/EDGE
 * RF: Quad GNSS, WiFi 5 (802.11ac), Bluetooth 5.0
 * GPU: Mali-G52 MP1
 * Codec: 1080p 60fps H64, HEVC, JPEG HW Codec
 * Display: Full HD+ (2520x1080)@60fps LCD
 * Camera: 16+5MP/13+8MP ISP, MIPI CSI 4/4/2, FD, DRC
 * Connectivity: USB 2.0 DRD, USI (SPI/UART/I2C), HSI2C, I3C, ADC, Audio

This patch adds minimal SoC support. Particular board device tree files
can include exynos850.dtsi file to get SoC related nodes, and then
reference those nodes further as needed.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
 3 files changed, 1057 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
new file mode 100644
index 000000000000..4cf0a22cc6db
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
@@ -0,0 +1,782 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos850 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (C) 2017 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Samsung's Exynos850 SoC pin-mux and pin-config options are listed as device
+ * tree nodes in this file.
+ */
+
+#include <dt-bindings/interrupt-controller/exynos850.h>
+
+/ {
+	/* ALIVE */
+	pinctrl@11850000 {
+		gpa0: gpa0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			    <GIC_SPI INTREQ__ALIVE_EINT0 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT1 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT2 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT3 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT4 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT5 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT6 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT7 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpa1: gpa1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			    <GIC_SPI INTREQ__ALIVE_EINT8 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT9 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT10 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT11 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT12 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT13 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT14 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT15 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpa2: gpa2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			    <GIC_SPI INTREQ__ALIVE_EINT16 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT17 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT18 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT19 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT20 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT21 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT22 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT23 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpa3: gpa3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			    <GIC_SPI INTREQ__ALIVE_EINT24 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT25 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT26 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT27 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT28 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT29 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT30 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT31 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpa4: gpa4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			    <GIC_SPI INTREQ__ALIVE_EINT32 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT33 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT34 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI INTREQ__ALIVE_EINT35 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpq0: gpq0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		/* USI_PERI_UART_DBG */
+		uart0_bus: uart0-bus {
+			samsung,pins = "gpq0-0", "gpq0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+		};
+
+		decon_f_te_on: decon_f_te_on {
+			samsung,pins = "gpa4-1";
+			samsung,pin-function = <0xf>;
+		};
+
+		decon_f_te_off: decon_f_te_off {
+			samsung,pins = "gpa4-1";
+			samsung,pin-function = <0x0>;
+		};
+
+		/* I2C_5 | CAM_PMIC_I2C */
+		i2c5_bus: i2c5-bus {
+			samsung,pins = "gpa3-5", "gpa3-6";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* I2C_6 | MOTOR_I2C */
+		i2c6_bus: i2c6-bus {
+			samsung,pins = "gpa3-7", "gpa4-0";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
+	/* CMGP */
+	pinctrl@11c30000 {
+		gpm0: gpm0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			  <GIC_SPI INTREQ__CMGP_EXT_INTM00 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpm1: gpm1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			  <GIC_SPI INTREQ__CMGP_EXT_INTM01 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpm2: gpm2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			  <GIC_SPI INTREQ__CMGP_EXT_INTM02 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpm3: gpm3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			  <GIC_SPI INTREQ__CMGP_EXT_INTM03 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpm4: gpm4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			  <GIC_SPI INTREQ__CMGP_EXT_INTM04 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gpm5: gpm5 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupts =
+			  <GIC_SPI INTREQ__CMGP_EXT_INTM05 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/* usi_cmgp00 */
+		hsi2c3_bus: hsi2c3-bus {
+			samsung,pins = "gpm0-0", "gpm1-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* usi_cmgp01 */
+		hsi2c4_bus: hsi2c4-bus {
+			samsung,pins = "gpm4-0", "gpm5-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* spi usi_cmgp00 */
+		spi1_bus: spi1-bus {
+			samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		spi1_cs: spi1-cs {
+			samsung,pins = "gpm3-0";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		spi1_cs_func: spi1-cs-func {
+			samsung,pins = "gpm3-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* spi usi_cmgp01 */
+		spi2_bus: spi2-bus {
+			samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		spi2_cs: spi2-cs {
+			samsung,pins = "gpm7-0";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		spi2_cs_func: spi2-cs-func {
+			samsung,pins = "gpm7-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* usi_cmgp00_uart */
+		uart1_bus_single: uart1-bus {
+			samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0", "gpm3-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+		};
+
+		uart1_bus_dual: uart1-bus-dual {
+			samsung,pins = "gpm0-0", "gpm1-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+		};
+
+		/* usi_cmgp01_uart */
+		uart2_bus_single: uart2-bus {
+			samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0", "gpm7-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+		};
+
+		uart2_bus_dual: uart2-bus-dual {
+			samsung,pins = "gpm4-0", "gpm5-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+		};
+	};
+
+	/* AUD */
+	pinctrl@14a60000 {
+		gpb0: gpb0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpb1: gpb1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		aud_codec_mclk: aud-codec-mclk {
+			samsung,pins = "gpb0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_codec_mclk_idle: aud-codec-mclk-idle {
+			samsung,pins = "gpb0-0";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_i2s0_bus: aud-i2s0-bus {
+			samsung,pins = "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_i2s0_idle: aud-i2s0-idle {
+			samsung,pins = "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_i2s1_bus: aud-i2s1-bus {
+			samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_i2s1_idle: aud-i2s1-idle {
+			samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_fm_bus: aud-fm-bus {
+			samsung,pins = "gpb1-4";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <1>;
+		};
+
+		aud_fm_idle: aud-fm-idle {
+			samsung,pins = "gpb1-4";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+		};
+	};
+
+	/* HSI */
+	pinctrl@13430000 {
+		gpf2: gpf2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		sd2_clk: sd2-clk {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sd2_cmd: sd2-cmd {
+			samsung,pins = "gpf2-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <2>;
+		 };
+
+		sd2_bus1: sd2-bus-width1 {
+			samsung,pins = "gpf2-2";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <2>;
+		};
+
+		sd2_bus4: sd2-bus-width4 {
+			samsung,pins = "gpf2-3", "gpf2-4", "gpf2-5";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <2>;
+		};
+
+		sd2_clk_fast_slew_rate_1x: sd2-clk_fast_slew_rate_1x {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		sd2_clk_fast_slew_rate_1_5x: sd2-clk_fast_slew_rate_1_5x {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <1>;
+		};
+
+		sd2_clk_fast_slew_rate_2x: sd2-clk_fast_slew_rate_2x {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sd2_clk_fast_slew_rate_2_5x: sd2-clk_fast_slew_rate_2_5x {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd2_clk_fast_slew_rate_3x: sd2-clk_fast_slew_rate_3x {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <4>;
+		};
+
+		sd2_clk_fast_slew_rate_4x: sd2-clk_fast_slew_rate_4x {
+			samsung,pins = "gpf2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <5>;
+		};
+
+		sd2_pins_as_pdn: sd2-pins-as-pdn {
+			samsung,pins = "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+				       "gpf2-4", "gpf2-5";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <2>;
+		};
+
+	};
+
+	/* CORE */
+	pinctrl@12070000 {
+		gpf0: gpf0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		sd0_clk: sd0-clk {
+			samsung,pins = "gpf0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd0_cmd: sd0-cmd {
+			samsung,pins = "gpf0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd0_rdqs: sd0-rdqs {
+			samsung,pins = "gpf0-2";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd0_nreset: sd0-nreset {
+			samsung,pins = "gpf0-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd0_clk_fast_slew_rate_1x: sd0-clk_fast_slew_rate_1x {
+			samsung,pins = "gpf0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <1>;
+		};
+
+		sd0_clk_fast_slew_rate_2x: sd0-clk_fast_slew_rate_2x {
+			samsung,pins = "gpf0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sd0_clk_fast_slew_rate_3x: sd0-clk_fast_slew_rate_3x {
+			samsung,pins = "gpf0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sd0_clk_fast_slew_rate_4x: sd0-clk_fast_slew_rate_4x {
+			samsung,pins = "gpf0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		gpf1: gpf1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		sd0_bus1: sd0-bus-width1 {
+			samsung,pins = "gpf1-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd0_bus4: sd0-bus-width4 {
+			samsung,pins = "gpf1-1", "gpf1-2", "gpf1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <3>;
+		};
+
+		sd0_bus8: sd0-bus-width8 {
+			samsung,pins = "gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <3>;
+		};
+	};
+
+	/* PERI */
+	pinctrl@139b0000 {
+		gpg0: gpg0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpp0: gpp0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+		gpp1: gpp1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpp2: gpp2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpg1: gpg1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpg2: gpg2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpg3: gpg3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpc0: gpc0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpc1: gpc1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		xclkout: xclkout {
+			samsung,pins = "gpq0-2";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+		};
+
+		/* usi_hsi2c_0 */
+		hsi2c0_bus: hsi2c0-bus {
+			samsung,pins = "gpc1-0", "gpc1-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* usi_hsi2c_1 */
+		hsi2c1_bus: hsi2c1-bus {
+			samsung,pins = "gpc1-2", "gpc1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* usi_hsi2c_2 */
+		hsi2c2_bus: hsi2c2-bus {
+			samsung,pins = "gpc1-4", "gpc1-5";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		/* usi_spi_0 */
+		spi0_bus: spi0-bus {
+			samsung,pins = "gpp2-0", "gpp2-2", "gpp2-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		spi0_cs: spi0-cs {
+			samsung,pins = "gpp2-1";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		spi0_cs_func: spi0-cs-func {
+			samsung,pins = "gpp2-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		i2c0_bus: i2c0-bus {
+			samsung,pins = "gpp0-0", "gpp0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		i2c1_bus: i2c1-bus {
+			samsung,pins = "gpp0-2", "gpp0-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		i2c2_bus: i2c2-bus {
+			samsung,pins = "gpp0-4", "gpp0-5";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		i2c3_bus: i2c3-bus {
+			samsung,pins = "gpp1-0", "gpp1-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		i2c4_bus: i2c4-bus {
+			samsung,pins = "gpp1-2", "gpp1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		fm_lna_en: fm-lna-en {
+			samsung,pins = "gpg2-3";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-val = <0>;
+		};
+
+		sensor_mclk0_in: sensor-mclk0-in {
+			samsung,pins = "gpc0-0";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk0_out: sensor-mclk0-out {
+			samsung,pins = "gpc0-0";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk0_fn: sensor-mclk0-fn {
+			samsung,pins = "gpc0-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk1_in: sensor-mclk1-in {
+			samsung,pins = "gpc0-1";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk1_out: sensor-mclk1-out {
+			samsung,pins = "gpc0-1";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk1_fn: sensor-mclk1-fn {
+			samsung,pins = "gpc0-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk2_in: sensor-mclk2-in {
+			samsung,pins = "gpc0-2";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk2_out: sensor-mclk2-out {
+			samsung,pins = "gpc0-2";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <2>;
+		};
+
+		sensor_mclk2_fn: sensor-mclk2-fn {
+			samsung,pins = "gpc0-2";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos850-usi.dtsi b/arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
new file mode 100644
index 000000000000..fb243e0a6260
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos850 SoC USI device tree source
+ *
+ * Copyright (C) 2019 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Samsung's Exynos850 SoC USI channels are listed in this file as device tree
+ * nodes.
+ */
+
+#include <dt-bindings/clock/exynos850.h>
+
+/ {
+	aliases {
+		uart0 = &serial_0;
+	};
+
+	/* USI_UART */
+	serial_0: uart@13820000 {
+		compatible = "samsung,exynos850-uart";
+		reg = <0x0 0x13820000 0x100>;
+		interrupts = <GIC_SPI INTREQ__UART IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart0_bus>;
+		clocks = <&clock GATE_UART_QCH>, <&clock DOUT_UART>;
+		clock-names = "gate_uart_clk0", "uart";
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
new file mode 100644
index 000000000000..ed2d1c8ae0c3
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos850 SoC device tree source
+ *
+ * Copyright (C) 2018 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Samsung Exynos850 SoC device nodes are listed in this file.
+ * Exynos based board files can include this file and provide
+ * values for board specific bindings.
+ */
+
+#include <dt-bindings/interrupt-controller/exynos850.h>
+#include <dt-bindings/clock/exynos850.h>
+#include "exynos850-pinctrl.dtsi"
+#include "exynos850-usi.dtsi"
+
+/ {
+	compatible = "samsung,exynos850";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	aliases {
+		pinctrl0 = &pinctrl_0;
+		pinctrl1 = &pinctrl_1;
+		pinctrl2 = &pinctrl_2;
+		pinctrl3 = &pinctrl_3;
+		pinctrl4 = &pinctrl_4;
+		pinctrl5 = &pinctrl_5;
+	};
+
+	cpus {
+		#address-cells = <2>;
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
+		cpu0: cpu@0000 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0000>;
+			enable-method = "psci";
+		};
+		cpu1: cpu@0001 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0001>;
+			enable-method = "psci";
+		};
+		cpu2: cpu@0002 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0002>;
+			enable-method = "psci";
+		};
+		cpu3: cpu@0003 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0003>;
+			enable-method = "psci";
+		};
+		cpu4: cpu@0004 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0100>;
+			enable-method = "psci";
+		};
+		cpu5: cpu@0005 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0101>;
+			enable-method = "psci";
+		};
+		cpu6: cpu@0006 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0102>;
+			enable-method = "psci";
+		};
+		cpu7: cpu@0007 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0 0x0103>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@12a00000 {
+		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0x0 0x12a01000 0x1000>,
+		      <0x0 0x12a02000 0x1000>,
+		      <0x0 0x12a04000 0x2000>,
+		      <0x0 0x12a06000 0x2000>;
+		interrupts = <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <26000000>;
+		use-clocksource-only;
+		use-physical-timer;
+	};
+
+	clock: clock-controller@0x120e0000 {
+		compatible = "samsung,exynos850-clock";
+		reg = <0x0 0x120e0000 0x8000>;
+		#clock-cells = <1>;
+	};
+
+	/* ALIVE */
+	pinctrl_0: pinctrl@11850000 {
+		compatible = "samsung,exynos850-pinctrl";
+		reg = <0x0 0x11850000 0x1000>;
+		interrupts = <GIC_SPI INTREQ__ALIVE_EINT0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT15 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT16 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT17 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT18 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT19 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT20 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT21 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT22 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT23 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT24 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT29 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT30 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI INTREQ__ALIVE_EINT31 IRQ_TYPE_LEVEL_HIGH>;
+
+		wakeup-interrupt-controller {
+			compatible = "samsung,exynos7-wakeup-eint";
+		};
+	};
+
+	/* CMGP */
+	pinctrl_1: pinctrl@11c30000 {
+		compatible = "samsung,exynos850-pinctrl";
+		reg = <0x0 0x11c30000 0x1000>;
+		interrupts =
+			<GIC_SPI INTREQ__CMGP_EXT_INTM00 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM01 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM02 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM03 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM04 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM05 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM06 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI INTREQ__CMGP_EXT_INTM07 IRQ_TYPE_LEVEL_HIGH>;
+
+		wakeup-interrupt-controller {
+			compatible = "samsung,exynos7-wakeup-eint";
+		};
+	};
+
+	/* AUD */
+	pinctrl_2: pinctrl@14a60000 {
+		compatible = "samsung,exynos850-pinctrl";
+		reg = <0x0 0x14a60000 0x1000>;
+	};
+
+	/* HSI */
+	pinctrl_3: pinctrl@13430000 {
+		compatible = "samsung,exynos850-pinctrl";
+		reg = <0x0 0x13430000 0x1000>;
+		interrupts = <GIC_SPI INTREQ__GPIO_HSI IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	/* CORE */
+	pinctrl_4: pinctrl@12070000 {
+		compatible = "samsung,exynos850-pinctrl";
+		reg = <0x0 0x12070000 0x1000>;
+		interrupts = <GIC_SPI INTREQ__GPIO_CORE IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	/* PERI */
+	pinctrl_5: pinctrl@139b0000 {
+		compatible = "samsung,exynos850-pinctrl";
+		reg = <0x0 0x139b0000 0x1000>;
+		interrupts = <GIC_SPI INTREQ__GPIO_PERI IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.30.2


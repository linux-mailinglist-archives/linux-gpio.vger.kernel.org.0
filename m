Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D01548B855
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346568AbiAKUSc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:18:32 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38312
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244202AbiAKUST (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:19 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C883040052
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932297;
        bh=9/FAL4YrZTXlW9fgiaBeCDiOFkBOhv7W3L4j/PKsLJM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Wg5ixZiaqnd6IZd+MfXpoZz1SElIGjiHoigE1td4vFpO1wAlii2xuvgOw9UyInJqy
         M79/56nbbu1nBv4DEn095x8imQV1wzPzAQQiY3UHXed4g11eqwD05FS4D9FIJpRHy0
         TXmVlEL6ziQOkkky14eCbzrjiHLMR/gDQOTDs5GCV9omheOf0n0zteo0kIuRcYwLHs
         GkOrAgVKguib4ZMiH4wZ/e5eeAxe0sxokQe8+KMe6IeskCHkvn/WZv/L7TGAhteqU1
         kb1qjm99/RHI02sP1PmTtPTYECLpT9qxQ7faVhAkgYwdGf5q4rZ3A0g4IRl9KMTOpj
         o0d1N+NQSDL2g==
Received: by mail-ed1-f72.google.com with SMTP id o20-20020a056402439400b003f83cf1e472so163673edc.18
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/FAL4YrZTXlW9fgiaBeCDiOFkBOhv7W3L4j/PKsLJM=;
        b=aNtDqyMakvh/srWB7DTiBZBo8TpfADEnI5iQw+M8UdRI0wpq4uiHgdH8d2+y+xShfx
         5ZtVKroAonEGZL7vGD8Ckzc9HoPhP6ACT6xVfahXjGhtuBZfOai+Jzl0RBRrZtrU+ZVR
         Syk1xrfXxcPkGbaSggohULiNji2iLbsYjJl8BwhJEJVLXGI1lbmFSdOArwRMk27P1npH
         zq6PS0YbEJoU3PSYq1aW+XLAG34VBX+JNIZKFCyw0oY9SQvGpyIRepsWOEtbmWIuxaKV
         U8lzYL/RumVKRENfEhHSU0mOnHMXlnFVXwphKF4aMopte1IK6BsK5DXM6pYIFyjBEGaO
         kE1Q==
X-Gm-Message-State: AOAM531vT2ve0oHdO0zx+rKWbN7lK7kfyxjSNjF3nstJvoUvcpBIBj4p
        ZeuXjZuhanWfWYv4PhUaUAtvQJRCDVIGhofWHVmtpxALXnvPewFFflFMbdzOB+joJy41GkOKjI2
        hgDXo+WUfZyF2hXLEzYHOUt5qYs0ZL1gRd6mKdt0=
X-Received: by 2002:a17:906:3a4a:: with SMTP id a10mr5065684ejf.253.1641932296157;
        Tue, 11 Jan 2022 12:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZdZOjcZycdemg2WifSG++2NPBGU0e9xg+Qp33Ms3cHCYvJh4oArCPNtD150vR+oSgyKd9aQ==
X-Received: by 2002:a17:906:3a4a:: with SMTP id a10mr5065670ejf.253.1641932295901;
        Tue, 11 Jan 2022 12:18:15 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 18/28] arm64: dts: exynos: align pinctrl with dtschema in Exynos7
Date:   Tue, 11 Jan 2022 21:17:12 +0100
Message-Id: <20220111201722.327219-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Align the pin controller related nodes with dtschema.  No functional
change expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../boot/dts/exynos/exynos7-espresso.dts      |   6 +-
 .../boot/dts/exynos/exynos7-pinctrl.dtsi      | 176 +++++++++---------
 2 files changed, 91 insertions(+), 91 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 125c03f351d9..2826bafade8a 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -354,7 +354,7 @@ buck10_reg: BUCK10 {
 };
 
 &pinctrl_alive {
-	pmic_irq: pmic-irq {
+	pmic_irq: pmic-irq-pins {
 		samsung,pins = "gpa0-2";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
@@ -393,14 +393,14 @@ &mmc_2 {
 };
 
 &pinctrl_bus1 {
-	usb30_vbus_en: usb30-vbus-en {
+	usb30_vbus_en: usb30-vbus-en-pins {
 		samsung,pins = "gph1-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	usb3drd_boost_en: usb3drd-boost-en {
+	usb3drd_boost_en: usb3drd-boost-en-pins {
 		samsung,pins = "gpf4-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
index 472dd649aa7e..be9b971f3697 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
@@ -12,7 +12,7 @@
 #include <dt-bindings/pinctrl/samsung.h>
 
 &pinctrl_alive {
-	gpa0: gpa0 {
+	gpa0: gpa0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -29,7 +29,7 @@ gpa0: gpa0 {
 			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa1: gpa1 {
+	gpa1: gpa1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -46,7 +46,7 @@ gpa1: gpa1 {
 			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa2: gpa2 {
+	gpa2: gpa2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -54,7 +54,7 @@ gpa2: gpa2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpa3: gpa3 {
+	gpa3: gpa3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -64,7 +64,7 @@ gpa3: gpa3 {
 };
 
 &pinctrl_bus0 {
-	gpb0: gpb0 {
+	gpb0: gpb0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -72,7 +72,7 @@ gpb0: gpb0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpc0: gpc0 {
+	gpc0: gpc0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -80,7 +80,7 @@ gpc0: gpc0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpc1: gpc1 {
+	gpc1: gpc1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -88,7 +88,7 @@ gpc1: gpc1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpc2: gpc2 {
+	gpc2: gpc2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -96,7 +96,7 @@ gpc2: gpc2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpc3: gpc3 {
+	gpc3: gpc3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -104,7 +104,7 @@ gpc3: gpc3 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd0: gpd0 {
+	gpd0: gpd0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -112,7 +112,7 @@ gpd0: gpd0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd1: gpd1 {
+	gpd1: gpd1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -120,7 +120,7 @@ gpd1: gpd1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd2: gpd2 {
+	gpd2: gpd2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -128,7 +128,7 @@ gpd2: gpd2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd4: gpd4 {
+	gpd4: gpd4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -136,7 +136,7 @@ gpd4: gpd4 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd5: gpd5 {
+	gpd5: gpd5-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -144,7 +144,7 @@ gpd5: gpd5 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd6: gpd6 {
+	gpd6: gpd6-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -152,7 +152,7 @@ gpd6: gpd6 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd7: gpd7 {
+	gpd7: gpd7-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -160,7 +160,7 @@ gpd7: gpd7 {
 		#interrupt-cells = <2>;
 	};
 
-	gpd8: gpd8 {
+	gpd8: gpd8-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -168,7 +168,7 @@ gpd8: gpd8 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg0: gpg0 {
+	gpg0: gpg0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -176,7 +176,7 @@ gpg0: gpg0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg3: gpg3 {
+	gpg3: gpg3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -184,161 +184,161 @@ gpg3: gpg3 {
 		#interrupt-cells = <2>;
 	};
 
-	hs_i2c10_bus: hs-i2c10-bus {
+	hs_i2c10_bus: hs-i2c10-bus-pins {
 		samsung,pins = "gpb0-1", "gpb0-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c11_bus: hs-i2c11-bus {
+	hs_i2c11_bus: hs-i2c11-bus-pins {
 		samsung,pins = "gpb0-3", "gpb0-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c2_bus: hs-i2c2-bus {
+	hs_i2c2_bus: hs-i2c2-bus-pins {
 		samsung,pins = "gpd0-3", "gpd0-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	uart0_data: uart0-data {
+	uart0_data: uart0-data-pins {
 		samsung,pins = "gpd0-0", "gpd0-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	uart0_fctl: uart0-fctl {
+	uart0_fctl: uart0-fctl-pins {
 		samsung,pins = "gpd0-2", "gpd0-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	uart2_data: uart2-data {
+	uart2_data: uart2-data-pins {
 		samsung,pins = "gpd1-4", "gpd1-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c3_bus: hs-i2c3-bus {
+	hs_i2c3_bus: hs-i2c3-bus-pins {
 		samsung,pins = "gpd1-3", "gpd1-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	uart1_data: uart1-data {
+	uart1_data: uart1-data-pins {
 		samsung,pins = "gpd1-0", "gpd1-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	uart1_fctl: uart1-fctl {
+	uart1_fctl: uart1-fctl-pins {
 		samsung,pins = "gpd1-2", "gpd1-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c0_bus: hs-i2c0-bus {
+	hs_i2c0_bus: hs-i2c0-bus-pins {
 		samsung,pins = "gpd2-1", "gpd2-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c1_bus: hs-i2c1-bus {
+	hs_i2c1_bus: hs-i2c1-bus-pins {
 		samsung,pins = "gpd2-3", "gpd2-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c9_bus: hs-i2c9-bus {
+	hs_i2c9_bus: hs-i2c9-bus-pins {
 		samsung,pins = "gpd2-7", "gpd2-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	pwm0_out: pwm0-out {
+	pwm0_out: pwm0-out-pins {
 		samsung,pins = "gpd2-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	pwm1_out: pwm1-out {
+	pwm1_out: pwm1-out-pins {
 		samsung,pins = "gpd2-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	pwm2_out: pwm2-out {
+	pwm2_out: pwm2-out-pins {
 		samsung,pins = "gpd2-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	pwm3_out: pwm3-out {
+	pwm3_out: pwm3-out-pins {
 		samsung,pins = "gpd2-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c8_bus: hs-i2c8-bus {
+	hs_i2c8_bus: hs-i2c8-bus-pins {
 		samsung,pins = "gpd5-3", "gpd5-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	uart3_data: uart3-data {
+	uart3_data: uart3-data-pins {
 		samsung,pins = "gpd5-0", "gpd5-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	spi2_bus: spi2-bus {
+	spi2_bus: spi2-bus-pins {
 		samsung,pins = "gpd5-0", "gpd5-1", "gpd5-2", "gpd5-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	spi1_bus: spi1-bus {
+	spi1_bus: spi1-bus-pins {
 		samsung,pins = "gpd6-2", "gpd6-3", "gpd6-4", "gpd6-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	spi0_bus: spi0-bus {
+	spi0_bus: spi0-bus-pins {
 		samsung,pins = "gpd8-0", "gpd8-1", "gpd6-0", "gpd6-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c4_bus: hs-i2c4-bus {
+	hs_i2c4_bus: hs-i2c4-bus-pins {
 		samsung,pins = "gpg3-1", "gpg3-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	hs_i2c5_bus: hs-i2c5-bus {
+	hs_i2c5_bus: hs-i2c5-bus-pins {
 		samsung,pins = "gpg3-3", "gpg3-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -347,7 +347,7 @@ hs_i2c5_bus: hs-i2c5-bus {
 };
 
 &pinctrl_nfc {
-	gpj0: gpj0 {
+	gpj0: gpj0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -355,7 +355,7 @@ gpj0: gpj0 {
 		#interrupt-cells = <2>;
 	};
 
-	hs_i2c6_bus: hs-i2c6-bus {
+	hs_i2c6_bus: hs-i2c6-bus-pins {
 		samsung,pins = "gpj0-1", "gpj0-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -364,7 +364,7 @@ hs_i2c6_bus: hs-i2c6-bus {
 };
 
 &pinctrl_touch {
-	gpj1: gpj1 {
+	gpj1: gpj1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -372,7 +372,7 @@ gpj1: gpj1 {
 		#interrupt-cells = <2>;
 	};
 
-	hs_i2c7_bus: hs-i2c7-bus {
+	hs_i2c7_bus: hs-i2c7-bus-pins {
 		samsung,pins = "gpj1-1", "gpj1-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -381,7 +381,7 @@ hs_i2c7_bus: hs-i2c7-bus {
 };
 
 &pinctrl_ff {
-	gpg4: gpg4 {
+	gpg4: gpg4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -389,7 +389,7 @@ gpg4: gpg4 {
 		#interrupt-cells = <2>;
 	};
 
-	spi3_bus: spi3-bus {
+	spi3_bus: spi3-bus-pins {
 		samsung,pins = "gpg4-0", "gpg4-1", "gpg4-2", "gpg4-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -398,7 +398,7 @@ spi3_bus: spi3-bus {
 };
 
 &pinctrl_ese {
-	gpv7: gpv7 {
+	gpv7: gpv7-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -406,7 +406,7 @@ gpv7: gpv7 {
 		#interrupt-cells = <2>;
 	};
 
-	spi4_bus: spi4-bus {
+	spi4_bus: spi4-bus-pins {
 		samsung,pins = "gpv7-0", "gpv7-1", "gpv7-2", "gpv7-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -415,7 +415,7 @@ spi4_bus: spi4-bus {
 };
 
 &pinctrl_fsys0 {
-	gpr4: gpr4 {
+	gpr4: gpr4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -423,35 +423,35 @@ gpr4: gpr4 {
 		#interrupt-cells = <2>;
 	};
 
-	sd2_clk: sd2-clk {
+	sd2_clk: sd2-clk-pins {
 		samsung,pins = "gpr4-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 	};
 
-	sd2_cmd: sd2-cmd {
+	sd2_cmd: sd2-cmd-pins {
 		samsung,pins = "gpr4-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 	};
 
-	sd2_cd: sd2-cd {
+	sd2_cd: sd2-cd-pins {
 		samsung,pins = "gpr4-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 	};
 
-	sd2_bus1: sd2-bus-width1 {
+	sd2_bus1: sd2-bus-width1-pins {
 		samsung,pins = "gpr4-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
 	};
 
-	sd2_bus4: sd2-bus-width4 {
+	sd2_bus4: sd2-bus-width4-pins {
 		samsung,pins = "gpr4-4", "gpr4-5", "gpr4-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -460,7 +460,7 @@ sd2_bus4: sd2-bus-width4 {
 };
 
 &pinctrl_fsys1 {
-	gpr0: gpr0 {
+	gpr0: gpr0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -468,7 +468,7 @@ gpr0: gpr0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpr1: gpr1 {
+	gpr1: gpr1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -476,7 +476,7 @@ gpr1: gpr1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpr2: gpr2 {
+	gpr2: gpr2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -484,7 +484,7 @@ gpr2: gpr2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpr3: gpr3 {
+	gpr3: gpr3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -492,105 +492,105 @@ gpr3: gpr3 {
 		#interrupt-cells = <2>;
 	};
 
-	sd0_clk: sd0-clk {
+	sd0_clk: sd0-clk-pins {
 		samsung,pins = "gpr0-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd0_cmd: sd0-cmd {
+	sd0_cmd: sd0-cmd-pins {
 		samsung,pins = "gpr0-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd0_ds: sd0-ds {
+	sd0_ds: sd0-ds-pins {
 		samsung,pins = "gpr0-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd0_qrdy: sd0-qrdy {
+	sd0_qrdy: sd0-qrdy-pins {
 		samsung,pins = "gpr0-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd0_bus1: sd0-bus-width1 {
+	sd0_bus1: sd0-bus-width1-pins {
 		samsung,pins = "gpr1-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd0_bus4: sd0-bus-width4 {
+	sd0_bus4: sd0-bus-width4-pins {
 		samsung,pins = "gpr1-1", "gpr1-2", "gpr1-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd0_bus8: sd0-bus-width8 {
+	sd0_bus8: sd0-bus-width8-pins {
 		samsung,pins = "gpr1-4", "gpr1-5", "gpr1-6", "gpr1-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV2>;
 	};
 
-	sd1_clk: sd1-clk {
+	sd1_clk: sd1-clk-pins {
 		samsung,pins = "gpr2-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV3>;
 	};
 
-	sd1_cmd: sd1-cmd {
+	sd1_cmd: sd1-cmd-pins {
 		samsung,pins = "gpr2-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV3>;
 	};
 
-	sd1_ds: sd1-ds {
+	sd1_ds: sd1-ds-pins {
 		samsung,pins = "gpr2-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV4>;
 	};
 
-	sd1_qrdy: sd1-qrdy {
+	sd1_qrdy: sd1-qrdy-pins {
 		samsung,pins = "gpr2-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV4>;
 	};
 
-	sd1_int: sd1-int {
+	sd1_int: sd1-int-pins {
 		samsung,pins = "gpr2-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV4>;
 	};
 
-	sd1_bus1: sd1-bus-width1 {
+	sd1_bus1: sd1-bus-width1-pins {
 		samsung,pins = "gpr3-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV3>;
 	};
 
-	sd1_bus4: sd1-bus-width4 {
+	sd1_bus4: sd1-bus-width4-pins {
 		samsung,pins = "gpr3-1", "gpr3-2", "gpr3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_FSYS1_PIN_DRV_LV3>;
 	};
 
-	sd1_bus8: sd1-bus-width8 {
+	sd1_bus8: sd1-bus-width8-pins {
 		samsung,pins = "gpr3-4", "gpr3-5", "gpr3-6", "gpr3-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
@@ -599,7 +599,7 @@ sd1_bus8: sd1-bus-width8 {
 };
 
 &pinctrl_bus1 {
-	gpf0: gpf0 {
+	gpf0: gpf0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -607,7 +607,7 @@ gpf0: gpf0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf1: gpf1 {
+	gpf1: gpf1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -615,7 +615,7 @@ gpf1: gpf1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf2: gpf2 {
+	gpf2: gpf2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -623,7 +623,7 @@ gpf2: gpf2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf3: gpf3 {
+	gpf3: gpf3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -631,7 +631,7 @@ gpf3: gpf3 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf4: gpf4 {
+	gpf4: gpf4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -639,7 +639,7 @@ gpf4: gpf4 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf5: gpf5 {
+	gpf5: gpf5-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -647,7 +647,7 @@ gpf5: gpf5 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg1: gpg1 {
+	gpg1: gpg1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -655,7 +655,7 @@ gpg1: gpg1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg2: gpg2 {
+	gpg2: gpg2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -663,7 +663,7 @@ gpg2: gpg2 {
 		#interrupt-cells = <2>;
 	};
 
-	gph1: gph1 {
+	gph1: gph1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -671,7 +671,7 @@ gph1: gph1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpv6: gpv6 {
+	gpv6: gpv6-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -679,21 +679,21 @@ gpv6: gpv6 {
 		#interrupt-cells = <2>;
 	};
 
-	spi5_bus: spi5-bus {
+	spi5_bus: spi5-bus-pins {
 		samsung,pins = "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	ufs_refclk_out: ufs-refclk-out {
+	ufs_refclk_out: ufs-refclk-out-pins {
 		samsung,pins = "gpg2-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
 	};
 
-	ufs_rst_n: ufs-rst-n {
+	ufs_rst_n: ufs-rst-n-pins {
 		samsung,pins = "gph1-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.32.0


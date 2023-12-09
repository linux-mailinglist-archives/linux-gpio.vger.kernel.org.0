Return-Path: <linux-gpio+bounces-1173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FF80B814
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA767280FA1
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA9121A16;
	Sat,  9 Dec 2023 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6GNcDBv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7FF172B
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:43 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso35821195e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164702; x=1702769502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Cd8XV00jcwp+pNj7ALI240LhuKUKrCfwMhx6VnYBGM=;
        b=v6GNcDBvwkLEiUFG9vDIINxDKwZ7Mb8Y5U3v12auSLfA74oOnKkpS+3ZgtYCdJzC40
         TZsWcxc4azKRtyuidhWJfPcA/6D3gZEOGvfr+8uxwBtqtKbIDNxkAXzwHgo5VEXW7yF9
         oZJcFsjAb2J8jCH6Y/x/CnlDBuHSAjKpvc61HsGb3IjU1nz0w8n+qNIi0BT101VlDx45
         GBbMaYwpC17IY+j26T5SNRP+CHggn85EUWS1FSYb7HWup8LNq7DSResm8Hz4RwtTuZTb
         +hhUe6/Bg7sZXdXsRfcIyCE5qHqwTkmg8y7um4zpUNFBYDD9bW50hZDqEE9eYYc5PiBW
         BPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164702; x=1702769502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Cd8XV00jcwp+pNj7ALI240LhuKUKrCfwMhx6VnYBGM=;
        b=mCdBaRDcPe3GzZBo+mHzsZvkpyFZCLbw7pWsZuzZACPdikd8PYG+92crau0oc2s8Vt
         a9+OKd8G/T0Nyxe9go0MYLEqIVLWJhVG/U97XN6c/RJgI1t6U9PZv2TenuRJ5FzsZ452
         aIJCcyR9aHTee1P5fOp+JYLRN0a7UUfmRBUk0BTSOn3FPz03hq2Exc3aiTzm5N7q3ir8
         a27t7Lf89RK8Wd2H9J0s2rWonrG7FZY3sgcWPNlqgFFa1I9+jTfL8J1ZLT6RBGdwfC2Q
         OdGGWl/7QZbYrIKgCOE7jdAUeCrfOZJLKYpE6Sccxp0ed18A8ZSVZ+9fQXsfO+h0mA9I
         glkQ==
X-Gm-Message-State: AOJu0YzUaIofuzb3M8AyUMajkNdBGKaAAlT1bYKVtKkjkXGmLv2N2wvI
	BwNPvO7qTt0kUHF+ljst5tW9pg==
X-Google-Smtp-Source: AGHT+IEkMimOW7bOQ7Npr9flSkOwh12yAbqHhWBMfheLXCAqoP3NIZQXEIioyzhIuKAG6jkERpHGZg==
X-Received: by 2002:a05:600c:35c5:b0:40c:2a69:6c2d with SMTP id r5-20020a05600c35c500b0040c2a696c2dmr1087505wmq.163.1702164702287;
        Sat, 09 Dec 2023 15:31:42 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:41 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 18/20] arm64: dts: exynos: google: Add initial Google gs101 SoC support
Date: Sat,  9 Dec 2023 23:31:04 +0000
Message-ID: <20231209233106.147416-19-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Google gs101 SoC is a ARMv8 mobile SoC found in the Pixel 6
(oriole), Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
phones.

It features:
* 4xA55 Little cluster
* 2xA76 Mid cluster
* 2xX1 Big cluster

This commit adds the basic device tree for gs101 (SoC).
Further platform support will be added over time.

Tested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi | 1249 +++++++++++++++++
 .../boot/dts/exynos/google/gs101-pinctrl.h    |   33 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  476 +++++++
 3 files changed, 1758 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101.dtsi

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
new file mode 100644
index 000000000000..e6a9776d4d62
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
@@ -0,0 +1,1249 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GS101 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright 2019-2023 Google LLC
+ * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
+ */
+
+#include "gs101-pinctrl.h"
+
+&pinctrl_gpio_alive {
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa3: gpa3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa4: gpa4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa5: gpa5-gpio-bank  {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa9: gpa9-gpio-bank  {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa10: gpa10-gpio-bank  {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	uart15_bus: uart15-bus-pins {
+		samsung,pins = "gpa2-3", "gpa2-4";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	uart16_bus: uart16-bus-pins {
+		samsung,pins = "gpa3-0", "gpa3-1", "gpa3-2", "gpa3-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	uart17_bus: uart17-bus-pins {
+		samsung,pins = "gpa4-0", "gpa4-1", "gpa4-2", "gpa4-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi15_bus: spi15-bus-pins {
+		samsung,pins = "gpa4-0", "gpa4-1", "gpa4-2";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi15_cs: spi15-cs-pins {
+		samsung,pins = "gpa4-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_far_alive {
+	gpa6: gpa6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa7: gpa7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa8: gpa8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa11: gpa11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+};
+
+&pinctrl_gsacore {
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
+	gps2: gps2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_gsactrl {
+	gps3: gps3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_hsi1 {
+	gph0: gph0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph1: gph1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pcie0_clkreq: pcie0-clkreq-pins{
+		samsung,pins = "gph0-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <GS101_PIN_PULL_UP>;
+	};
+
+	pcie0_perst: pcie0-perst-pins {
+		samsung,pins = "gph0-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_hsi2 {
+	gph2: gph2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph3: gph3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph4: gph4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	sd2_clk: sd2-clk-pins {
+		samsung,pins = "gph4-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
+	};
+
+	sd2_cmd: sd2-cmd-pins {
+		samsung,pins = "gph4-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
+	};
+
+	sd2_bus1: sd2-bus-width1-pins {
+		samsung,pins = "gph4-2";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
+	};
+
+	sd2_bus4: sd2-bus-width4-pins {
+		samsung,pins = "gph4-3", "gph4-4", "gph4-5";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
+	};
+
+	sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gph4-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gph4-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
+		samsung,pins = "gph4-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
+	};
+
+	sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gph4-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
+	};
+
+	ufs_rst_n: ufs-rst-n-pins {
+		samsung,pins = "gph3-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <GS101_PIN_PULL_NONE>;
+	};
+
+	ufs_refclk_out: ufs-refclk-out-pins {
+		samsung,pins = "gph3-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <GS101_PIN_PULL_NONE>;
+	};
+
+	pcie1_clkreq: pcie1-clkreq-pins {
+		samsung,pins = "gph2-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <GS101_PIN_PULL_UP>;
+	};
+
+	pcie1_perst: pcie1-perst-pins {
+		samsung,pins = "gph2-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpp0: gpp0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp1: gpp1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp2: gpp2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp3: gpp3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp4: gpp4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp5: gpp5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp6: gpp6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp7: gpp7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp8: gpp8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp9: gpp9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp10: gpp10-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp11: gpp11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp12: gpp12-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp13: gpp13-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp14: gpp14-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp15: gpp15-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp16: gpp16-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp17: gpp17-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp18: gpp18-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp19: gpp19-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	/* USI_PERIC0_UART_DBG */
+	uart0_bus: uart0-bus-pins {
+		samsung,pins = "gpp1-2", "gpp1-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	disp_te_pri_on: disp-te-pri-on-pins {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+	};
+
+	disp_te_pri_off: disp-te-pri-off-pins {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <GS101_PIN_FUNC_INPUT>;
+	};
+
+	disp_te_sec_on: disp-te-sec-on-pins {
+		samsung,pins = "gpp0-4";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+	};
+
+	disp_te_sec_off: disp-te-sec-off-pins {
+		samsung,pins = "gpp0-4";
+		samsung,pin-function = <GS101_PIN_FUNC_INPUT>;
+	};
+
+	sensor_mclk1_out: sensor-mclk1-out-pins {
+		samsung,pins = "gpp3-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk1_fn: sensor-mclk1-fn-pins {
+		samsung,pins = "gpp3-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk2_out: sensor-mclk2-out-pins {
+		samsung,pins = "gpp5-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk2_fn: sensor-mclk2-fn-pins {
+		samsung,pins = "gpp5-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk3_out: sensor-mclk3-out-pins {
+		samsung,pins = "gpp7-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk3_fn: sensor-mclk3-fn-pins {
+		samsung,pins = "gpp7-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk4_out: sensor-mclk4-out-pins {
+		samsung,pins = "gpp9-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk4_fn: sensor-mclk4-fn-pins {
+		samsung,pins = "gpp9-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk5_out: sensor-mclk5-out-pins {
+		samsung,pins = "gpp11-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk5_fn: sensor-mclk5-fn-pins {
+		samsung,pins = "gpp11-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk6_out: sensor-mclk6-out-pins {
+		samsung,pins = "gpp13-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk6_fn: sensor-mclk6-fn-pins {
+		samsung,pins = "gpp13-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk7_out: sensor-mclk7-out-pins {
+		samsung,pins = "gpp15-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk7_fn: sensor-mclk7-fn-pins {
+		samsung,pins = "gpp15-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk8_out: sensor-mclk8-out-pins {
+		samsung,pins = "gpp17-0";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_DOWN>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	sensor_mclk8_fn: sensor-mclk8-fn-pins {
+		samsung,pins = "gpp17-0";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
+	};
+
+	hsi2c14_bus: hsi2c14-bus-pins {
+		samsung,pins = "gpp18-0", "gpp18-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart14_bus_single: uart14-bus-pins {
+		samsung,pins = "gpp18-0", "gpp18-1",
+			       "gpp18-2", "gpp18-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi14_bus: spi14-bus-pins {
+		samsung,pins = "gpp18-0", "gpp18-1", "gpp18-2";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi14_cs: spi14-cs-pins {
+		samsung,pins = "gpp18-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi14_cs_func: spi14-cs-func-pins {
+		samsung,pins = "gpp18-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c8_bus: hsi2c8-bus-pins {
+		samsung,pins = "gpp16-0", "gpp16-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+		samsung,pin-pud-pdn = <GS101_PIN_PDN_OUT0>;
+	};
+
+	uart8_bus_single: uart8-bus-pins {
+		samsung,pins = "gpp16-0", "gpp16-1", "gpp16-2",
+			       "gpp16-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi8_bus: spi8-bus-pins {
+		samsung,pins = "gpp16-0", "gpp16-1", "gpp16-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi8_cs: spi8-cs-pins {
+		samsung,pins = "gpp16-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi8_cs_func: spi8-cs-func-pins {
+		samsung,pins = "gpp16-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c7_bus: hsi2c7-bus-pins {
+		samsung,pins = "gpp14-0", "gpp14-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart7_bus_single: uart7-bus-pins {
+		samsung,pins = "gpp14-0", "gpp14-1",
+			       "gpp14-2", "gpp14-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi7_bus: spi7-bus-pins {
+		samsung,pins = "gpp14-0", "gpp14-1", "gpp14-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi7_cs: spi7-cs-pins {
+		samsung,pins = "gpp14-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi7_cs_func: spi7-cs-func-pins {
+		samsung,pins = "gpp14-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus-pins {
+		samsung,pins = "gpp12-0", "gpp12-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart6_bus_single: uart6-bus-pins {
+		samsung,pins = "gpp12-0", "gpp12-1",
+			       "gpp12-2", "gpp12-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi6_bus: spi6-bus-pins {
+		samsung,pins = "gpp12-0", "gpp12-1", "gpp12-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi6_cs: spi6-cs-pins {
+		samsung,pins = "gpp12-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi6_cs_func: spi6-cs-func-pins {
+		samsung,pins = "gpp12-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c5_bus: hsi2c5-bus-pins {
+		samsung,pins = "gpp10-0", "gpp10-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart5_bus_single: uart5-bus-pins {
+		samsung,pins = "gpp10-0", "gpp10-1",
+			       "gpp10-2", "gpp10-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi5_bus: spi5-bus-pins {
+		samsung,pins = "gpp10-0", "gpp10-1", "gpp10-2";
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi5_cs_func: spi5-cs-func-pins {
+		samsung,pins = "gpp10-3";
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <GS101_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <GS101_PIN_PULL_NONE>;
+	};
+
+	hsi2c4_bus: hsi2c4-bus-pins {
+		samsung,pins = "gpp8-0", "gpp8-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart4_bus_single: uart4-bus-pins {
+		samsung,pins = "gpp8-0", "gpp8-1",
+			       "gpp8-2", "gpp8-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pins = "gpp8-0", "gpp8-1", "gpp8-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi4_cs: spi4-cs-pins {
+		samsung,pins = "gpp8-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi4_cs_func: spi4-cs-func-pins {
+		samsung,pins = "gpp8-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pins = "gpp6-0", "gpp6-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart3_bus_single: uart3-bus-pins {
+		samsung,pins = "gpp6-0", "gpp6-1",
+			       "gpp6-2", "gpp6-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pins = "gpp6-0", "gpp6-1", "gpp6-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi3_cs: spi3-cs-pins {
+		samsung,pins = "gpp6-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi3_cs_func: spi3-cs-func-pins {
+		samsung,pins = "gpp6-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart2_bus_single: uart2-bus-pins {
+		samsung,pins = "gpp4-0", "gpp4-1",
+			       "gpp4-2", "gpp4-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pins = "gpp4-0", "gpp4-1", "gpp4-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi2_cs: spi2-cs-pins {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi2_cs_func: spi2-cs-func-pins {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart1_bus_single: uart1-bus-pins {
+		samsung,pins = "gpp2-0", "gpp2-1",
+			       "gpp2-2", "gpp2-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi1_cs: spi1-cs-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi1_cs_func: spi1-cs-func-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_peric1 {
+	gpp20: gpp20-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp21: gpp21-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp22: gpp22-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp23: gpp23-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp24: gpp24-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp25: gpp25-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp26: gpp26-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp27: gpp27-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c13_bus: hsi2c13-bus-pins  {
+		samsung,pins = "gpp25-0", "gpp25-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart13_bus_single: uart13-bus-pins {
+		samsung,pins = "gpp25-0", "gpp25-1",
+			       "gpp25-2", "gpp25-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi13_bus: spi13-bus-pins {
+		samsung,pins = "gpp25-0", "gpp25-1", "gpp25-2";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi13_cs: spi13-cs-pins {
+		samsung,pins = "gpp25-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi13_cs_func: spi13-cs-func-pins {
+		samsung,pins = "gpp25-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c12_bus: hsi2c12-bus-pins {
+		samsung,pins = "gpp23-4", "gpp23-5";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart12_bus_single: uart12-bus-pins {
+		samsung,pins = "gpp23-4", "gpp23-5",
+			       "gpp23-6", "gpp23-7";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi12_bus: spi12-bus-pins {
+		samsung,pins = "gpp23-4", "gpp23-5", "gpp23-6";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi14_cs2: spi14-cs2-pins {
+		samsung,pins = "gpp23-6";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi12_cs: spi12-cs-pins {
+		samsung,pins = "gpp23-7";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi12_cs_func: spi12-cs-func-pins {
+		samsung,pins = "gpp23-7";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c11_bus: hsi2c11-bus-pins {
+		samsung,pins = "gpp23-0", "gpp23-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart11_bus_single: uart11-bus-pins {
+		samsung,pins = "gpp23-0", "gpp23-1",
+			       "gpp23-2", "gpp23-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi11_bus: spi11-bus-pins {
+		samsung,pins = "gpp23-0", "gpp23-1", "gpp23-2";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi11_cs: spi11-cs-pins {
+		samsung,pins = "gpp23-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi11_cs_func: spi11-cs-func-pins {
+		samsung,pins = "gpp23-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c10_bus: hsi2c10-bus-pins {
+		samsung,pins = "gpp21-0", "gpp21-1";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart10_bus_single: uart10-bus-pins {
+		samsung,pins = "gpp21-0", "gpp21-1",
+			       "gpp21-2", "gpp21-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi10_bus: spi10-bus-pins {
+		samsung,pins = "gpp21-0", "gpp21-1", "gpp21-2";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi10_cs: spi10-cs-pins {
+		samsung,pins = "gpp21-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi10_cs_func: spi10-cs-func-pins {
+		samsung,pins = "gpp21-3";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c9_bus: hsi2c9-bus-pins {
+		samsung,pins = "gpp20-4", "gpp20-5";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart9_bus_single: uart9-bus-pins {
+		samsung,pins = "gpp20-4", "gpp20-5",
+			       "gpp20-6", "gpp20-7";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi9_bus: spi9-bus-pins {
+		samsung,pins = "gpp20-4", "gpp20-5", "gpp20-6";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi9_cs: spi9-cs-pins {
+		samsung,pins = "gpp20-7";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi9_cs_func: spi9-cs-func-pins {
+		samsung,pins = "gpp20-7";
+		samsung,pin-function = <GS101_PIN_FUNC_2>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pins = "gpp20-0", "gpp20-1";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	uart0_bus_single: uart0-bus-pins {
+		samsung,pins = "gpp20-0", "gpp20-1",
+			       "gpp20-2", "gpp20-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpp20-0", "gpp20-1", "gpp20-2";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi0_cs: spi0-cs-pins {
+		samsung,pins = "gpp20-3";
+		samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	spi0_cs_func: spi0-cs-func-pins {
+		samsung,pins = "gpp20-3";
+		samsung,pin-function = <GS101_PIN_FUNC_3>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
new file mode 100644
index 000000000000..68b7bc47c91b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Pinctrl binding constants for GS101
+ *
+ * Copyright 2020-2023 Google LLC
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_GS101_H__
+#define __DT_BINDINGS_PINCTRL_GS101_H__
+
+#define GS101_PIN_PULL_NONE		0
+#define GS101_PIN_PULL_DOWN		1
+#define GS101_PIN_PULL_UP		3
+
+/* Pin function in power down mode */
+#define GS101_PIN_PDN_OUT0		0
+#define GS101_PIN_PDN_OUT1		1
+#define GS101_PIN_PDN_INPUT		2
+#define GS101_PIN_PDN_PREV		3
+
+/* GS101 drive strengths */
+#define GS101_PIN_DRV_2_5_MA		0
+#define GS101_PIN_DRV_5_MA		1
+#define GS101_PIN_DRV_7_5_MA		2
+#define GS101_PIN_DRV_10_MA		3
+
+#define GS101_PIN_FUNC_INPUT		0
+#define GS101_PIN_FUNC_OUTPUT		1
+#define GS101_PIN_FUNC_2		2
+#define GS101_PIN_FUNC_3		3
+#define GS101_PIN_FUNC_EINT		0xf
+
+#endif /* __DT_BINDINGS_PINCTRL_GS101_H__ */
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
new file mode 100644
index 000000000000..60e112d25246
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GS101 SoC
+ *
+ * Copyright 2019-2023 Google LLC
+ * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
+ */
+
+#include <dt-bindings/clock/google,gs101.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,exynos-usi.h>
+
+/ {
+	compatible = "google,gs101";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_gpio_alive;
+		pinctrl1 = &pinctrl_far_alive;
+		pinctrl2 = &pinctrl_gsacore;
+		pinctrl3 = &pinctrl_gsactrl;
+		pinctrl4 = &pinctrl_peric0;
+		pinctrl5 = &pinctrl_peric1;
+		pinctrl6 = &pinctrl_hsi1;
+		pinctrl7 = &pinctrl_hsi2;
+	};
+
+	pmu-0 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-1 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	pmu-2 {
+		compatible = "arm,cortex-x1-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
+	};
+
+	pmu-3 {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	/* TODO replace with CCF clock */
+	dummy_clk: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12345>;
+		clock-output-names = "pclk";
+	};
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
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu6>;
+				};
+				core1 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0000>;
+			enable-method = "psci";
+			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
+			capacity-dmips-mhz = <250>;
+			dynamic-power-coefficient = <70>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0100>;
+			enable-method = "psci";
+			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
+			capacity-dmips-mhz = <250>;
+			dynamic-power-coefficient = <70>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0200>;
+			enable-method = "psci";
+			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
+			capacity-dmips-mhz = <250>;
+			dynamic-power-coefficient = <70>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0300>;
+			enable-method = "psci";
+			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
+			capacity-dmips-mhz = <250>;
+			dynamic-power-coefficient = <70>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0400>;
+			enable-method = "psci";
+			cpu-idle-states =  <&ENYO_CPU_SLEEP>;
+			capacity-dmips-mhz = <620>;
+			dynamic-power-coefficient = <284>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0500>;
+			enable-method = "psci";
+			cpu-idle-states =  <&ENYO_CPU_SLEEP>;
+			capacity-dmips-mhz = <620>;
+			dynamic-power-coefficient = <284>;
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-x1";
+			reg = <0x0600>;
+			enable-method = "psci";
+			cpu-idle-states =  <&HERA_CPU_SLEEP>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <650>;
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-x1";
+			reg = <0x0700>;
+			enable-method = "psci";
+			cpu-idle-states =  <&HERA_CPU_SLEEP>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <650>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			ANANKE_CPU_SLEEP: cpu-ananke-sleep {
+				idle-state-name = "c2";
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <70>;
+				exit-latency-us = <160>;
+				min-residency-us = <2000>;
+			};
+
+			ENYO_CPU_SLEEP: cpu-enyo-sleep {
+				idle-state-name = "c2";
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <150>;
+				exit-latency-us = <190>;
+				min-residency-us = <2500>;
+			};
+
+			HERA_CPU_SLEEP: cpu-hera-sleep {
+				idle-state-name = "c2";
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <235>;
+				exit-latency-us = <220>;
+				min-residency-us = <3500>;
+			};
+		};
+	};
+
+	/* ect node is required to be present by bootloader */
+	ect {
+	};
+
+	ext_24_5m: clock-1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	ext_200m: clock-2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "ext-200m";
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		gsa_reserved_protected: gsa@90200000 {
+			reg = <0x0 0x90200000 0x400000>;
+			no-map;
+		};
+
+		tpu_fw_reserved: tpu-fw@93000000 {
+			reg = <0x0 0x93000000 0x1000000>;
+			no-map;
+		};
+
+		aoc_reserve: aoc@94000000 {
+			reg = <0x0 0x94000000 0x03000000>;
+			no-map;
+		};
+
+		abl_reserved: abl@f8800000 {
+			reg = <0x0 0xf8800000 0x02000000>;
+			no-map;
+		};
+
+		dss_log_reserved: dss-log-reserved@fd3f0000 {
+			reg = <0x0 0xfd3f0000 0x0000e000>;
+			no-map;
+		};
+
+		debug_kinfo_reserved: debug-kinfo-reserved@fd3fe000 {
+			reg = <0x0 0xfd3fe000 0x00001000>;
+			no-map;
+		};
+
+		bldr_log_reserved: bldr-log-reserved@fd800000 {
+			reg = <0x0 0xfd800000 0x00100000>;
+			no-map;
+		};
+
+		bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
+			reg = <0x0 0xfd900000 0x00002000>;
+			no-map;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts =
+		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+		clock-frequency = <24576000>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x40000000>;
+
+		cmu_misc: clock-controller@10010000 {
+			compatible = "google,gs101-cmu-misc";
+			reg = <0x10010000 0x8000>;
+			#clock-cells = <1>;
+			clocks =  <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
+				  <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
+			clock-names = "dout_cmu_misc_bus", "dout_cmu_misc_sss";
+		};
+
+		watchdog_cl0: watchdog@10060000 {
+			compatible = "google,gs101-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks =
+			  <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0_PCLK>,
+			  <&ext_24_5m>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <0>;
+			status = "disabled";
+		};
+
+		watchdog_cl1: watchdog@10070000 {
+			compatible = "google,gs101-wdt";
+			reg = <0x10070000 0x100>;
+			interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks =
+			  <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1_PCLK>,
+			  <&ext_24_5m>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <1>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@10400000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			reg = <0x10400000 0x10000>, /* GICD */
+			      <0x10440000 0x100000>;/* GICR * 8 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4 &cpu5>;
+				};
+
+				ppi_cluster2: interrupt-partition-2 {
+					affinity = <&cpu6 &cpu7>;
+				};
+			};
+		};
+
+		sysreg_peric0: syscon@10820000 {
+			compatible = "google,gs101-peric0-sysreg", "syscon";
+			reg = <0x10820000 0x10000>;
+		};
+
+		pinctrl_peric0: pinctrl@10840000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x10840000 0x00001000>;
+			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		usi_uart: usi@10a000c0 {
+			compatible = "google,gs101-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10a000c0 0x20>;
+			samsung,sysreg = <&sysreg_peric0 0x1020>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&dummy_clk>, <&dummy_clk>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_0: serial@10a00000 {
+				compatible = "google,gs101-uart";
+				reg = <0x10a00000 0xc0>;
+				reg-io-width = <4>;
+				samsung,uart-fifosize = <256>;
+				interrupts = <GIC_SPI 634
+					      IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&dummy_clk 0>, <&dummy_clk 0>;
+				clock-names = "uart", "clk_uart_baud0";
+				status = "disabled";
+			};
+		};
+
+		sysreg_peric1: syscon@10c20000 {
+			compatible = "google,gs101-peric1-sysreg", "syscon";
+			reg = <0x10c20000 0x10000>;
+		};
+
+		pinctrl_peric1: pinctrl@10c40000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x10c40000 0x00001000>;
+			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		pinctrl_hsi1: pinctrl@11840000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x11840000 0x00001000>;
+			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		pinctrl_hsi2: pinctrl@14440000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x14440000 0x00001000>;
+			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		cmu_apm: clock-controller@17400000 {
+			compatible = "google,gs101-cmu-apm";
+			reg = <0x17400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>;
+			clock-names = "oscclk";
+		};
+
+		sysreg_apm: syscon@174204e0 {
+			compatible = "google,gs101-apm-sysreg", "syscon";
+			reg = <0x174204e0 0x1000>;
+		};
+
+		pmu_system_controller: system-controller@17460000 {
+			compatible = "google,gs101-pmu", "syscon";
+			reg = <0x17460000 0x10000>;
+		};
+
+		pinctrl_gpio_alive: pinctrl@174d0000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x174d0000 0x00001000>;
+
+			wakeup-interrupt-controller {
+				compatible = "google,gs101-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_far_alive: pinctrl@174e0000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x174e0000 0x00001000>;
+
+			wakeup-interrupt-controller {
+				compatible = "google,gs101-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_gsactrl: pinctrl@17940000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x17940000 0x00001000>;
+		};
+
+		pinctrl_gsacore: pinctrl@17a80000 {
+			compatible = "google,gs101-pinctrl";
+			reg = <0x17a80000 0x00001000>;
+		};
+
+		cmu_top: clock-controller@1e080000 {
+			compatible = "google,gs101-cmu-top";
+			reg = <0x1e080000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>;
+			clock-names = "oscclk";
+		};
+	};
+};
+
+#include "gs101-pinctrl.dtsi"
-- 
2.43.0.472.g3155946c3a-goog



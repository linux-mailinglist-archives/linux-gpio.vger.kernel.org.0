Return-Path: <linux-gpio+bounces-862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14B800F75
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E90B0B21420
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0B84BAB6;
	Fri,  1 Dec 2023 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHZ9pJyz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C031C172D
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 08:11:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so1089044f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447079; x=1702051879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGa7Ijft1EBu8UVzayeo7MTZkMcFeh7xh+YN0z5QS2k=;
        b=GHZ9pJyzAsvFdjPHxFcbs+EIWdVSKFvNt9jJxGLQZ3eRdPUaM+IIUtP9BDaKrUxzY+
         sixWv3VJ8nBGOu9LdWrD5+tMXvKM88GNZPYyXL6D6yLtQUEvTQUChXnPxlagaa31p6PV
         gNlzPPhrbxuCjwn8VGG6XVWYr3In8udUgUwgYjOdCJh09KKA0vvRNiZk6nwoTJpvzuT0
         99jM2XruWvMbMFYSwTCn4K75hELzBh3Ol1C1mgy1nZsSSVcfNluCkjUfUEmEvLpL3fPa
         bxM0zJzxRlSZ4KewcUqSUKAiDtJyKgJ+DO/CtTis8+BjAQVPbryIwxbbIDXZDx5Tb4pr
         tvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447079; x=1702051879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGa7Ijft1EBu8UVzayeo7MTZkMcFeh7xh+YN0z5QS2k=;
        b=TTKIuXTDY/r6LZozDa+Uz9L0avCUc2fljhTfXM1agDIzRwAEaKaTpA7uVwZqkp6RP7
         FvZ4o09hWJUi2lYgdnCpdV8fekUfj9whrOzeYD47v12Op/YCA9N95DCfML294y1llbE5
         LuAnjM2u1F7j/L0hJi1h2Bh5ms2Sh0PCIxTjGl7bvlUcua++mZqGWwKVX5FVndi0bRSK
         R7rqH7a79Me6pb60135ixgv1udgvT+7t22f68kvobeAQhrssSQAfUmWx/98+8L4CUViI
         K8iCVNRwYrAtvT+gUMf0i/li3I1GKynnV7516tbmQUoLwap1KXQdH2FhGtEzOmuzPFjX
         WhVA==
X-Gm-Message-State: AOJu0Ywe5zkDuU2ySukXNZ50wFikCllX178XVuUKa9hG5v4ImrRyoN6f
	qXWx1D89Z51YJR/xlnas6YlILQ==
X-Google-Smtp-Source: AGHT+IGxG4p6gUCgnf4haiIEGOEJXC+oyIvA22Wsild87j4sKHlHkElsxyJGVDo3VWPWNapGJzJPQQ==
X-Received: by 2002:adf:fc84:0:b0:333:3518:c6a4 with SMTP id g4-20020adffc84000000b003333518c6a4mr336557wrr.102.1701447079286;
        Fri, 01 Dec 2023 08:11:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:18 -0800 (PST)
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
Subject: [PATCH v5 19/20] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
Date: Fri,  1 Dec 2023 16:09:24 +0000
Message-ID: <20231201160925.3136868-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |   2 +
 arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
 .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 6e4ba69268e5..44c24a8ad9e1 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += google
+
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
new file mode 100644
index 000000000000..0a6d5e1fe4ee
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_EXYNOS) += \
+	gs101-oriole.dtb \
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
new file mode 100644
index 000000000000..6abd00fa337e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "gs101-pinctrl.h"
+#include "gs101.dtsi"
+
+/ {
+	model = "Oriole";
+	compatible = "google,gs101-oriole", "google,gs101";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		/* Bootloader expects bootargs specified otherwise it crashes */
+		bootargs = "";
+		stdout-path = &serial_0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
+
+		button-vol-down {
+			label = "KEY_VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-vol-up {
+			label = "KEY_VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "KEY_POWER";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&ext_24_5m {
+	clock-frequency = <24576000>;
+};
+
+&ext_200m {
+	clock-frequency = <200000000>;
+};
+
+&pinctrl_far_alive {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_gpio_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&serial_0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_bus>;
+};
+
+&usi_uart {
+	status = "okay";
+	samsung,clkreq-on; /* needed for UART mode */
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+	status = "okay";
+};
-- 
2.43.0.rc2.451.g8631bc7472-goog



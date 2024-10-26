Return-Path: <linux-gpio+bounces-12160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14C9B1AEC
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC4EB21DA5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102E11DC19D;
	Sat, 26 Oct 2024 20:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy20+S02"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635AA1DB92E;
	Sat, 26 Oct 2024 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974788; cv=none; b=AOSb7HOcJurnL62BRkLZ4wYq4N7n17EnT0UblNp8TUrv0BDCtosBmHk3DV/3QUpeH5kFQB7fRc4DL4u/1uMW/FPMVdMgKqG5ya/ydxhA53m0DbR2lgfmQ/sJrw6O7OsbCLS6HHAIb/d/SNbSzrrnAD49S0rEq0k8eHuFJ3PAJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974788; c=relaxed/simple;
	bh=NyNI370iFs3wYVtInWaeRtI1BNk9CEgAHMaiwqvsPHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cc2dwR6LLa/9+yt59Ivtu9/ab0W0fiLMdT8LFfNCQm2n9J8bngEl3nhW0KXIjGar0X4AmqwkG+yaMYFUO0F4T+KgBsKTSNr9sLFzYsh3ensEm683/ut28sphEV3EzpaMv6QQyvD1yPyTGtxgNRlJCMLbygYmaksejLahEI6pbjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy20+S02; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e13375d3so3630804e87.3;
        Sat, 26 Oct 2024 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974785; x=1730579585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9v0mI+Ns+DJTCrNBVZFsYV5lC9eRlvFzd13MqdQMec=;
        b=Qy20+S02mI04g5bzexRvGaOtPVoSXe7xRv/bm+IiufIXff3JHyVB+7778jsg7/3um2
         2QqJSwpWx33FEYkbJfzn7HrFSvyS4Dkl/cGVZSwQqD1Uem2xR48vUNZMXOqTKVt9XHYi
         j+zqVW+IVb6pfsgE/6iMgPuAXOwPTOwYhu75hqyaWX+OHVjk5hDMiY/tvvOqJLUXUrkR
         s6PgME6XEEFu8b1MWQwE3mXCDvAMHZVduMIcRNPkU9qQ2oGM7oOqY7kIubnGGZVJ1mXI
         TL0ow69rUyml0xADoSprqIOr+YC12LEZju/288iQEHxEtXKENv03yIumYoh5jD+Gtf8w
         Boog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974785; x=1730579585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9v0mI+Ns+DJTCrNBVZFsYV5lC9eRlvFzd13MqdQMec=;
        b=NllFfyPGhlPJJdj5WB81xScL1yZ+3rCLQZILuyDsWpP9SroZbYeeG4pT9Q2XBvfBap
         3PNSUwlFZuDh/s/cKZaOjKgGI8FwBMPGamm1vGZzm5CqBMtvVf0QQNwlumNeDrQlgq25
         41XTDRNdtc3u38uO560N6CZ9bkyyhQhvUvuEB9DUP4UyV48YPcipjNt0yIH47NnIo6OW
         cQe8Hvg1DAhvyUDKhWv5zyTMI3Xz7aM/lBHat3xliU++loLUCrcTd2E912YlgCmRfLDy
         cpvroYKMdqHwXynB7rcHXxC6Lp0JVFBa7Swxo8u2waM+LCNdHayz2uiFbz5HB62BZGsi
         0TXw==
X-Forwarded-Encrypted: i=1; AJvYcCU3js4KSYTW6Kth3/XatVCICXzoBHpfow9pH8PJnSbKk7fpQXntmfzbfVfKBM5OWDJz5Mc0QhNiNUCw12Hv39SFvFA=@vger.kernel.org, AJvYcCUB2mIbFGVW24hrEDE8GTx7rUtT3jGY8wdfyxRZdPUDP8OdmzFrdBORY7YOfOkm5JSE0B2Gp44fNuqe@vger.kernel.org, AJvYcCV6Ty4GIi7h8lqzOHJRuPwBvAHujwXqIjTG4RYR7BkWMrftl3+ADokULDmXizC/9ztR1pRFKFadUPI1QfBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1eP9RN5drbTRNn6fGjpQ5WSD5c8dAF294uoINe68Zn3Qv9zP
	o4B2yHgo+Y/63APvu4Hc/PP4Pn8swuCaqR5D11GHHvP1CMpR1Bwz
X-Google-Smtp-Source: AGHT+IEN6zl25mN4QYhMa3yzz7QY8MLMykdlCdSYGBT4wCe4IQe1Qe4LJpwLv4ukolp8PpQz+M4Bmw==
X-Received: by 2002:a05:6512:a93:b0:539:f06c:6f1d with SMTP id 2adb3069b0e04-53b34b394f4mr1463608e87.55.1729974784342;
        Sat, 26 Oct 2024 13:33:04 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:33:04 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:41 +0300
Subject: [PATCH v3 10/10] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=4449;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=NyNI370iFs3wYVtInWaeRtI1BNk9CEgAHMaiwqvsPHI=;
 b=7NytSt/uLVQ3JOMiAdvmvF65G4JH2vOs/7vHI6y+3KaS+IJxneuO/txSp+GgPoPYgKHDaOeVs
 roEJ2IW+v+SDWi/NUNzpLVrbOtfmXclTg09hh3dUE2tpxE56oPLHjps
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
SoC and 1440x2960 Super AMOLED display.

This initial device tree enables the framebuffer pre-initialised
by bootloader and physical buttons of the device, with more support
to come in the future.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile               |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 119 ++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7a934499b235892eef38cd926905e02f0ce08278..6760b3d59e819fb52bc8cf4dc6877a0b9db9ce47 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
new file mode 100644
index 0000000000000000000000000000000000000000..44a027f4fa3cd07222a76d70fdcf1ca678c10595
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S9 (starlte/SM-G960F) device tree source
+ *
+ * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
+ * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
+ */
+
+/dts-v1/;
+#include "exynos9810.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy S9 (SM-G960F)";
+	compatible = "samsung,starlte", "samsung,exynos9810";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
+			width = <1440>;
+			height = <2960>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
+		pinctrl-names = "default";
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+
+		/* In stock firmware used for assistant. Map it as a camera button for now */
+		wink-key {
+			label = "Camera";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x0 0xc0000000 0x20000000>,
+		      <0x0 0xe1900000 0x1e700000>;
+		      <0x8 0x80000000 0x80000000>,
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@cc000000 {
+			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};

-- 
2.46.2



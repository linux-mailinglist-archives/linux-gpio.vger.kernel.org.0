Return-Path: <linux-gpio+bounces-12080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C89009B0151
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877E4284715
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C683C206E90;
	Fri, 25 Oct 2024 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsCy+j6+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59F20696B;
	Fri, 25 Oct 2024 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855530; cv=none; b=RaoOOnNhM0PSh0dixtkuMSPTaTdUSQld4y5GS0weA2KqjW2kNbLrrETkYmXUVHtip3QYhdhDWOYi1xSvY37X0nw+CKaRtFcW0eZSTF38poM3sRvtS99/RXsRUhsRd+Sd9XMR6RGrCUAoQIkG730v9OLm8QsqMA2EVWYTcRLKphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855530; c=relaxed/simple;
	bh=s5ze8wIRUmpoQbq7xRWQ3Ftw43Pf29yleNflcPuixmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FibucBKQDIs7Os7m+qIPr3ZB6h2sGxWIci9JgRkgNI0lCzY+geYZmSeU2XhBvMIcLWF3K4gIAVUnvkROPONbrSMWsvYL3Gs7d2DI7BjIGxUKENPanxSbGvLGVRzBnEc6Ys6yGa7iukpV4nlg5vQYin/Fb07AlFFDLhwFDaURA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsCy+j6+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2287674e87.0;
        Fri, 25 Oct 2024 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855524; x=1730460324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Z/1jStYsESXfoKOROnnVDWKuRtcvdh+cMjpbU/QPPU=;
        b=QsCy+j6+B0NMZOup2UFVzUPbWQgfdbpgCDKpl9RkNGFMfBskMRU2rUXA0mOJWJ5+It
         AG1DY7/pZzZqNNiHpbCbrhky23cujjbiCdW58GCx5b5pvymxUhDRPi3qgTqeGbQeapFv
         J0rF6Ryjeld6fobC/rBWh4TF9CirAbwFFky3gvqeG83GBBUi1F97P5k6R0CczAcvLTPg
         4tfKVx7J6BtVyCH+D/oB5bLd1T/6WlkeKUj1KhdcQIBx2uaK+wS9nvwtIQ+x/j1C5h9n
         l9V+Z8XrLJC2FB7NpNaTzNI4fZY9seUBEKrhb/fwizMXQtGVws1suLxgqWddtGJlwol3
         hj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855524; x=1730460324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z/1jStYsESXfoKOROnnVDWKuRtcvdh+cMjpbU/QPPU=;
        b=aitn5X0jhO18nRtl/wT8ZKNpuHPIya6qxCrIGQ6hfsCxSTjVD+zBZLViMLapnRQlS8
         OqpU7Zi685i7IjuslZxQC6yZyNBetpbKV59riZdQ9hhfTCIT/Hl17FRaovkdF3dHjMln
         Lz/R2hDTVGIUQ1tW82e1E5lcxCubyWnkf1Xwq5qoXK02Ooo+q5adXFq9bzj2EKKpH3Ss
         i8crhUaCk0RiiqmyA5i6BwWW2udSDXLQNzZTY3m4aUFBsT258J1Ukf3VmHJOuABTvKsX
         /1iuGD3kVds6y/IPP8YZlpRKvd9cWqbPhTLXKfsN2Iyb3Eb1fGWsH5okIqc/1L6ESrnI
         Qj4A==
X-Forwarded-Encrypted: i=1; AJvYcCUlalHfMy4LKVV2vNqRix7+KfjL0E/ewft3EALG7F39CH0Y8Vt5+U6c0mGjGCHtc/E+5g0TmSAG9erv@vger.kernel.org, AJvYcCUzS9zMC6XvdXH9wJMyf1O5qI2TQ9+NtEzMUhpHqPfDMPP9M2dmPHBp7tj5tGIESvfXuhPxfD5N4BdMYu7uQGiBdNk=@vger.kernel.org, AJvYcCVoBnTA4HK6xpkLI0uuerGFe/EOcnWHdUWfjMKhJ+IRKB61trKBoJGz1KUUdcdwK46RIRQMQQQfiiHlddT/@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5Nqrq5epFb2ru2ATtcTkusORksXVNorOr2lWfUNcnhBp828v
	Wb0scrvKuoMQF19fCGAQx56JTJPz11spe+3Lml2t5A5M11qjf4HsSmdIOA==
X-Google-Smtp-Source: AGHT+IGLLmhFLkmXqCxF4aZP79OvNKrHgO7juBPhJzcOH1blmA3ViEU9duBqxp8WhVwXombe76gXuw==
X-Received: by 2002:a05:6512:b8e:b0:530:c212:4a5a with SMTP id 2adb3069b0e04-53b23debc6bmr3355463e87.22.1729855524346;
        Fri, 25 Oct 2024 04:25:24 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:24 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:59 +0300
Subject: [PATCH v2 12/12] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-12-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=4454;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=s5ze8wIRUmpoQbq7xRWQ3Ftw43Pf29yleNflcPuixmI=;
 b=zquLveixYcDZM65pnmqteghKUpfXW7iKb56bo7wzynWSET/vQ7cgnlbQAKU5YeCDAjAoxWaW4
 VONlaLYWwBvD4OC0JTOVHO2yutFnIaAcArpqiW1t/Q65zwXQuylnf1j
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
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 120 ++++++++++++++++++++++
 2 files changed, 121 insertions(+)

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
index 0000000000000000000000000000000000000000..7e01118e591284267f155883c236ed811d5c629a
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
@@ -0,0 +1,120 @@
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
+		      <0x8 0x80000000 0x80000000>,
+		      <0x0 0xc0000000 0x20000000>,
+		      <0x0 0xe1900000 0x1e700000>;
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



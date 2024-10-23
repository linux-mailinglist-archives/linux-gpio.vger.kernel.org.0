Return-Path: <linux-gpio+bounces-11892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 427149AD7DD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACF00B2357D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC85208994;
	Wed, 23 Oct 2024 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4BDpSuW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBFC206E8F;
	Wed, 23 Oct 2024 22:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723054; cv=none; b=TtwrXLIG8x2nc9AchGuGIRC7qB8oQ1SD10lViTxecVhDHA8no21eRDmtAca4KHTSAk6lu4twdEiK0tP9+K/do6XjG/EeHuSqSn7ZF6aaUsvCk5RdpiTuk0qT+0mOTxuRqQLRdiHLoOByNWYWNVtP+Y3NlbdcQbjYYLcTKeHfB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723054; c=relaxed/simple;
	bh=uGxvRrGiZ9uLBWYdiZjpDfcJUgUDjLtTL5MMaS3Y99c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ITjB9hAshqnHd3M1u2Vbq4S3kCnYGVKWMGg3TKonRXfeqqQ3gU6tRVHZqP4LBb59nM8XlAl+AnH7wVVHCXJ6Y9MPYq8RT+ryICUdyyu7RuTnskd+Q4qFIHvttivzLPB1nvdRwWdrfDtMuKC/bcZeTALzHeErb0Z1IOPEw6a5c9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4BDpSuW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso31785966b.1;
        Wed, 23 Oct 2024 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723050; x=1730327850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AX+cZKl5XEc3DMRwSLMsFqqUE19e2NM6vk+Aym6iSqQ=;
        b=A4BDpSuWQYzggbtXPFbu4kQ47Zr1IWsF5lCmwPPAbbk6i+7xmPCtwcTEpeMDO8Y1Mr
         y+aEpeW6Dn7BM9pglQePlDCLCHtLR2stsOovv1Y/cw3RZM7AHClir37dbDz++K9GS/SG
         MzhMqO1j1cj30L6cbEfeYeno0Vt1o5TKrZYMuIYOsmL2eQWXK3uAkTBMqZtYcjrxGrDg
         Dlk1a8BJghYFaLhaO0WU9HkRyG7v8KIPe8GsNirrLCTm6DrEfDkEMQ3oa05dOlsDj4Gl
         a5DKHbxMgr0fZ2gwYZZw02zwFyQ5h1NKqiJdw4V6xcxzyYkCOi7y1NTK/gRXO1L+J8NY
         PKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723050; x=1730327850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX+cZKl5XEc3DMRwSLMsFqqUE19e2NM6vk+Aym6iSqQ=;
        b=TT/i1MDXNQtw1BdvWFOL8+siLLi5vOBg6uQnKB9x59sr0BRUq0yUqziNycRJw/VrEQ
         waquV7oQMfvitha6nXoXyb/0LNGjQtgbsFIFNszJYzv1lbhzU6hwQvYkZyjNciMeuGVe
         3PaQNZ7OtenLi2yEmVf182arfDRLTggP4lRTx6FSG8fe20pD/nHGNwhaC/jf3QaRAMpa
         uN4Bs7sQLMqPa3eAcADPqFKVrbcfZKSeN90hKR7w8nkW3qwmJmMc4ZXspUW8LmFnLcJ2
         OpmrCvsY2MGJmOSgIfw7rZd69zmwDThbO2XwdbZsA7pEY2NaNE2qDSdlEAoxUektI27l
         BgDw==
X-Forwarded-Encrypted: i=1; AJvYcCU8UTijcXLWQZJaA38LI/Kj69OT3JuLGLHrcane2JFas+4zU1Nvuo6pDtsCrPhysLMu8lVcsg5THhRzK3/h@vger.kernel.org, AJvYcCVoyDII/6iDGj7ECS98OfFmEavLpn8hCuj8uKgxtWk4b8dGfTX6+gSb86CXUzHCGx8el6mPlWjtR+tP@vger.kernel.org, AJvYcCWhjlCLu2LB269Anr00QUOmmrTk+8wlniRvy4T1D9PIiqAAg0JpucOYcaNudGKWMPcP3loadGAkdj3Icx4oKsrS3sA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgs3IrMMQOzibtD2bWM5LuXjVQUkqjxC0tVEeXffPs9v6lu3zO
	wa8oibKxwWjDgxPRdS/DYTFF5OE8jjuMS4R+XsS7Opnz9s6pvTT9
X-Google-Smtp-Source: AGHT+IEz7HfZTewz5b+n8ON3omkJnOW3c4z1DCw0FOB98fFAPZeutFcm1+iZOYPfU9psjdpc68Nk/w==
X-Received: by 2002:a17:907:2d8c:b0:a99:f8a2:cd8f with SMTP id a640c23a62f3a-a9abf9682bemr399570466b.64.1729723050129;
        Wed, 23 Oct 2024 15:37:30 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:29 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:43 +0300
Subject: [PATCH 12/12] arm64: dts: exynos: Add initial support for Samsung
 Galaxy S9 (SM-G960F)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-12-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=4396;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=uGxvRrGiZ9uLBWYdiZjpDfcJUgUDjLtTL5MMaS3Y99c=;
 b=qPBGU4g4UzTmbyW8K01GZbAhJ3thwrS3nfygRW+CZyRP6QN6HO9I+K97XuAksgJIsecePUf7I
 rEf03pG5egjBT1CsyGfHrc9Ut5Fp/ZIomu0fA2F+mFTrWbl3/YBjz9p
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
SoC and 1440x2960 Super AMOLED display.

This initial device tree enables the framebuffer pre-initialised
by bootloader and physical buttons of the device, with more support
to come in the future.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
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
index 0000000000000000000000000000000000000000..f3a1910402b8d686dd7bd156a691ec541e10ad08
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
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_voldown &key_volup &key_bixby &key_power>;
+		pinctrl-names = "default";
+
+		/* In stock firmware used for assistant. Map it as a camera button for now */
+		bixby-key {
+			label = "Bixby";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+		};
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_bixby: key-bixby-pins {
+		samsung,pins = "gpa0-6";
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
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};

-- 
2.46.2



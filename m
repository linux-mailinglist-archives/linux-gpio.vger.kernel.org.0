Return-Path: <linux-gpio+bounces-10328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604497D7D3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ADE31C22BDF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AAE186601;
	Fri, 20 Sep 2024 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3nl3W2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA14185B6F;
	Fri, 20 Sep 2024 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847133; cv=none; b=Ro6J/KhNJesI9+J4oRz9Mj5DhKfKkFlnau9tNHKxeMxLF9eAWPmlrYqfzQgmFQ1iRzg2qeoBABEMx4U19uv3z05fx/0vQs43GFFEIW3AVVO2YtdAWPOMdnIjD4ukyNSZdhTqpvrLRBC/BD4eYJXzGWTP2WhAFIUklrm7xpzlR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847133; c=relaxed/simple;
	bh=Z7xGCT06OCZ/m+rGKk5QoYgmcvYZaPJ7LbrMKN+waiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q5+Lhl0WHAMmdlxsm/N4gxA/xWMFFmo7PkyLOOCHMzMRKpPaZ208q15aUjnkm6CQN1/lmcyWbma8GV/q5GXlMKUE2DegGufx/xeZZCEE5OUx0YlAR4hTTcOPwyh1eDUrJulOH7/X4al1EdPUJUcyZiqSg4vLmSFLnMg1gTnDuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3nl3W2M; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c8cef906so1584537f8f.2;
        Fri, 20 Sep 2024 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847129; x=1727451929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOIysbZqVm4Kknw5BnD1Y7WRyTq4GEatzBCOcYtP3fM=;
        b=L3nl3W2M4kUegE6fLbRYhKppy046eeWEtvnLVxB73Prlew71OtXTu+uLEjfXsHeyrH
         hZ7GVEOfrLa86YjJKeYpn75DN/aCakO9CKvsPk1g3xeKH9E3gjIksQ1ebtqd1Kz1inky
         l+ed+jZL8J14zRgWxAgY5ydXjPoz7JWdYS4ES8wdGKCxFYcaS7IvuRrSU78F6Hfh+DJN
         FPCrn5ObvbBAjbnHzc4ZHOspWeTTParn2TfjWUl9urYD0D4mFg8gnVoMBPxcx9rpyaUo
         /knSocsdLoapt7OFLlre2Bs/1/CVucd/WlU4LvqPTNMnmL7gOcEA4MbDvTJjfyyQ0YLZ
         JO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847129; x=1727451929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOIysbZqVm4Kknw5BnD1Y7WRyTq4GEatzBCOcYtP3fM=;
        b=NOsP3TDhntbVdLiKen6P6sF6pCoQ+a8+J3SEKIQeOwbGOj6y9AtH5k76uYJymLW3je
         1o4AG6AFXkvPBdyndj+OtM6Z7ZPav5k4AVeXM5wWDHIY/bzO93oVMAlr9XAOW2Phmhfd
         7iYV8KSL/IbbYfywcyLbydQ/QzPncJ4Ufmr7eG6FYPbpmj8V3Uy79MOVX1knqiiNnVq5
         YK9G5Pw1tqn/yT96d0pN5APF9KEzyaOSKnHkDvVL5FuqM4R5GlXe21rkw2KaJ+EjzmCG
         9ytxmmiGAO5x7VpkjqzL1rlrrxEMBWCs7NsFB6p4WNtsDxQ37pJxUjvHnC9S3lPlPPiE
         ZwWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSvnGWkT1gJ9ThH9HOOJNPOtu48Bh32HjRyyzuiObxdPQLmzDQFz8QaCJt0PGeQDXxfuLjqc/VZdUIgA==@vger.kernel.org, AJvYcCV/lSIh78OPNJv0EANc3OUs1TKyFZx18k2a+WN+w5mofVq3EWaQ93V6RH6Cu7JTC8/fhN2ENfZNiYdI6rXf@vger.kernel.org, AJvYcCW5u5jikAANah83CQHr6k491QnEPp8AkUqWe4cqzzCMc+mNPEuc2bnbwVPmN+KQfwtXajSN9GEp1e24@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/2HWAGXCRboJc5XI0hvQB6Ocfok4ts8InwkaoQd322MGc5/WM
	gFXGw/OTB4cNDtBSDzG0nGULiTx9dYj4aCEkWlLn5WtiGbAjvbd5
X-Google-Smtp-Source: AGHT+IETBP2AaEONrwI0HxkCkvig+/9J7ZpRz916tH/E9yl+ZZFD/Uzbyv+wuRzoGJDjzO8AFHFYKg==
X-Received: by 2002:adf:fb83:0:b0:374:c142:80e7 with SMTP id ffacd0b85a97d-37a4312aa35mr2034620f8f.1.1726847129277;
        Fri, 20 Sep 2024 08:45:29 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:28 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
Date: Fri, 20 Sep 2024 18:45:08 +0300
Message-Id: <20240920154508.1618410-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Galaxy S8 (SM-G950F), codenamed dreamlte, is a mobile phone
from 2017. It features 4GB RAM, 64GB UFS 2.1, Exynos 8895 SoC and a
1440x2960 Super AMOLED display.

This initial device tree enables SimpleFB, PSTORE and GPIO keys.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8895-dreamlte.dts   | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index d7f2191c2..18f5a3eed 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -7,5 +7,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7-espresso.dtb		\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
+	exynos8895-dreamlte.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
new file mode 100644
index 000000000..3a376ab2b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S8 (dreamlte/SM-G950F) device tree source
+ *
+ * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos8895.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy S8 (SM-G950F)";
+	compatible = "samsung,dreamlte", "samsung,exynos8895";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer: framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
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
+		      <0x0 0xc0000000 0x40000000>,
+		      <0x8 0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@92000000 {
+			compatible = "ramoops";
+			reg = <0 0x92000000 0x8000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+		};
+
+		cont_splash_mem: framebuffer@cc000000 {
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
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
+		/* Typically used for Bixby. Map it as a camera button for now */
+		wink-key {
+			label = "Camera";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
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
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
-- 
2.34.1



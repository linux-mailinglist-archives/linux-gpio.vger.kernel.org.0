Return-Path: <linux-gpio+bounces-9919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91C971615
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34841F26F50
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D521B9B25;
	Mon,  9 Sep 2024 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcmlnMr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0B1B86DC;
	Mon,  9 Sep 2024 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879667; cv=none; b=dwPhPKcn1D6ixBW0+8w3KcIEsVFbHIQJAP5Map/Eoq1n+/yoiFQFOwjZmRdmLcsZUq9UuKv6MXoOdgiRjDwJk/sEN2RXSwSaIsnH/eJlUbPsXl64cgX310IPNkAS6cNkJ80riTOXR+fyol62412UPzrLE3R2+z+ZXcQvbCEmuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879667; c=relaxed/simple;
	bh=Z7xGCT06OCZ/m+rGKk5QoYgmcvYZaPJ7LbrMKN+waiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GZSLlo3IixqWQtHw5Odpo4VE6UbBiUDgAQqkQw0ozlGnSwpNHvJqvGjAfVfYRHt+rc/YNcexg07wbiwygFfnl0bs3XCyrHCRAkp+N+Y7grnNhN5pZxWUv7Ph0jv+OTgYaf2aVRlMjbCVbLOkoDiJ2kS7x9VR/EtLWl4pWH/QJWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcmlnMr9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so536480766b.1;
        Mon, 09 Sep 2024 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879664; x=1726484464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOIysbZqVm4Kknw5BnD1Y7WRyTq4GEatzBCOcYtP3fM=;
        b=BcmlnMr9WppSUWmlrsf28k4azbDyCtkAf4WCvOlsNh3+Ukg+LRTfzmLw5M3TkNqGWP
         i8NmPdMqybDvpQgJo86DIeC4kLy9+82nVJ+6PBqL3kIaev+Lq1w5fEMhU8iL1C8JsFyE
         qQcaJ74ubHzvRGZHSuhpjB9uu5gnlxG+vikr/sesI1h2D74c67xdAx7Rg7hnC0sPHlkZ
         IVQgiwjIVM3LMEbBzkW759mbd+r0ZaVasRC41UiASFh0bqlvQuz7dhWiaiknBroUUCk3
         pcJPFsxipgJIPvkXwH8rO+IR0AMOLlkCmj8yPFlI36A36EE2QtvCPi+zSj5yZLOeFen0
         jUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879664; x=1726484464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOIysbZqVm4Kknw5BnD1Y7WRyTq4GEatzBCOcYtP3fM=;
        b=J6nYDMb+X1Up4kOZDgOfEo1P8xfghQZ4CZlW6KR6wrdt8j/IasRhVpn/JYIzB2Ekai
         EPWILkaCd0SJF0Lyto2y025abBe85dtPdjmdFWGO5ySwjKS61KzWKaXb/hQCGxu0GwMW
         1hMU0hEfbtt2WeMW7riT5YXNdqfcvsRKGU9H3Gr6oXu/zQJwvCcpvhEoZcsFGtBfESHb
         prwRK9AGmAe2xjeGcAQ2hjQyG1XzIgdck8vzcMmAPuNtmHYFTLiEYj++JFx77wBhS5Ih
         pLHjQAT6Us2flDxyhEW+b2PW2X01pZg3QunzxJa3OSwcrSwh9kdGvcw6pUnchoYwuvpA
         eZOA==
X-Forwarded-Encrypted: i=1; AJvYcCVOdNCLJDBFwcWxt/nDoayyh2fNLH5PpQ8eXDXkw0DLTvqajGHJ8edfgQT+0gQOyGmHa+W5O7R4NWQxrw==@vger.kernel.org, AJvYcCVr87sfHoN4SiuoNWgg8PfAEikvT6Fxs2ca8JXsgU29zYBiSE6gPT77G4q28ldPEPIok+duWoT66yrvHWYf@vger.kernel.org, AJvYcCXxTeqiiWFozziIpBUJ/sOY+vMA53zdDbtcPgmL0LbzFumf89VvZt9Po7U/Bo6L/lEedMpGVWXSxXee@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUlWqU7gV++lJuLCcfWoHmFrEE+ap2toPDm7eG4vYgZhjv0/0
	iSjjDzlQSBD2EVSFSeKVWuT30hc8YRheskqHI+7mxaLXQtQgZHuK
X-Google-Smtp-Source: AGHT+IERiUM6or4Hqjr/zTyzV0Z99LS3XXqRaeX2fjq5xdwd6VWNywvTTOo39tbB/wWK72tlTayvhg==
X-Received: by 2002:a17:907:72c4:b0:a8d:2c00:949a with SMTP id a640c23a62f3a-a8d2c009911mr446146166b.9.1725879664492;
        Mon, 09 Sep 2024 04:01:04 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:01:03 -0700 (PDT)
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
Subject: [PATCH v4 10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
Date: Mon,  9 Sep 2024 14:00:17 +0300
Message-Id: <20240909110017.419960-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
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



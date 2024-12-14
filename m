Return-Path: <linux-gpio+bounces-13884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0430E9F1F83
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 15:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53A471886D2B
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 14:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC5F1A00F4;
	Sat, 14 Dec 2024 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VorX74xw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22F197521;
	Sat, 14 Dec 2024 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734188222; cv=none; b=iOhJ45UCbhBn5RL6rxJ/ud2eihAHAo/lhRZMKMy4Noyo5MGn+i6i6dmuUIxQ/rB9rxbhK8rEaiXDJXCYriSWwDp0XtX+J9fvZA4qykewm+XPX0QYxgdHMKHhm5PHj7QssRgRcBCKXcPzt2nOuqscXl3/oFhwSMye35IilmKRA/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734188222; c=relaxed/simple;
	bh=uMCyvBcblST8fT6tpNS3iuyS4bo3Z+mJv8estU8DrRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etZX9rexmWLUAlaLzmrupeAHGrWx8CCZXIEWtgH81amSngU0dUXVm5rPQtBTvBHEc1MdzhGnLnnbmcxXMkmRiqGr1aYLbiOIqfJDITM7xAQWJ59SUFCElmOj/AcYyboR3TlnX5lBBLEPQ1MFn04yew6erE1QyFISzXyDcuCIy84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VorX74xw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso4888810a12.1;
        Sat, 14 Dec 2024 06:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734188219; x=1734793019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqF8zkGZ+2VzBoyfd3d5WoB474c43oRczfanBsCjA+g=;
        b=VorX74xwpyy2X3c2P9CM2DPN9QSPc8dXpxYQNwFBirLQH9OISmtbrH2tipTJCr7I1c
         XIw2YfA1YheS8QQqIa/qEsU8QWIoihlPiWJi9ifubI0Hkek/A/haBntYp3edgnAr1wCd
         wSe75XCXVM0wZSY8OByFpd9cBGw0OVnIM7xkmJQpMvKtfKPJjafDb4ZGxA+zS2a2ts/Y
         VQ9fFgKGngV2nZm9Io8ZFnMsnah2OL3KW89XfJeCGL/E3km6Lyrow0rW2YXYmOEEK5YV
         fmQXcz+GL9eM6qWPFJ5J7ziEo8j9DaiTOqbTSkFh8nff8xMRj9RvHR9O5lCElY1nAFYA
         matA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734188219; x=1734793019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqF8zkGZ+2VzBoyfd3d5WoB474c43oRczfanBsCjA+g=;
        b=eRkYksdd/wg9ESpeWrBumSrEb0+iNDcgU6xlS5HZnIaw9rszTa1RgmALUJyA5y2SRJ
         bzgCknDRQtWQTKbwqPlSqlSpXBovzC9jR9RMxRmXbrs3aH1Adr17aEjshnsVal8Oesp9
         t0DvHH6u+pykYooQlJ+NI8u0zB6wW9UxnxMbWu1mI1oQVOHAbOc5prQYXMP4phKHNIgQ
         ZKifBrf4hXYEXpfdAhJQW28NIEZLhbyTHsvR7xhqxLPFY5LxYkfQQmwwMaMMDRDZ9zgM
         hxL6tNUjW6IVEpkGD1SEZpsAzsf+a8Olqf86yRIPUEfhSwIbSrIv04mi6FxBxUJQDjT3
         CCJA==
X-Forwarded-Encrypted: i=1; AJvYcCUs6Na5AEzYpT8ZjsuPmkjlXsjS1NzSwflOC5O9uivEB5/jdbcSLBGGr+8geK6O8npQ6iJdCGjJcgzS@vger.kernel.org, AJvYcCVAjnMtmMw47d2/i5trnDeVkB4+9aRDH5uYaUA/DmBtMM+ovCXQLvy2WpMbHfNPYHAOIRVBAjx8tjVfevdP@vger.kernel.org, AJvYcCWIKhdIKEAU7devBdIBZkuGyNmDGynnwk/JjtsYcsgpY7RsXAm/uszYlU1pEyksBXGhBZwwHoJdcnlHEEMlbmcQUgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw4ECbVd8VlxzVBu6bS3iGUckpVJAJbYjevwNzFNfXIZPIiJSg
	IDudrgyq8YAQuAYo9c5mJYTpl5VbwrK8vNbxDc24ogJ0VWeCOfn0
X-Gm-Gg: ASbGncu+Zm+5+3c+x4Ex4w5KDrGgt+Cu3Wa9xIFoi79Yl7ZlZyGCkYYw+dhrHCVNBvg
	rdFkoH4FqXB24FhmFbyv/83hh5b+0GgxhcEuOIsjUMw0NtrFMA7oTYYJ0SSeF7PL/Zn7Ec2OPpv
	YOZQ2H4HJWkVmV1LziYA9kgK0nTJI4boiAGsReDlM4oF+0/uAOn5s9LWVW6zdU500Jhh4fYKiNd
	EyvMkRUB4wVwUxXUiQVeQbaHh7RyJx4XTW7+s2hdNPAiE3fEo1WUuWgXeicVTHaIQu8
X-Google-Smtp-Source: AGHT+IFxNg58c28hScps000IQjmxAmucWih6Giz9E/maqKo2D7cuPoqcCZlJKfOujrTr7vMGJ+DIiw==
X-Received: by 2002:a05:6402:5189:b0:5d0:d328:3a43 with SMTP id 4fb4d7f45d1cf-5d63c2238f0mr5933372a12.6.1734188219290;
        Sat, 14 Dec 2024 06:56:59 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35b5bsm1057698a12.89.2024.12.14.06.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 06:56:58 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 14 Dec 2024 16:56:47 +0200
Subject: [PATCH RESEND v4 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-exynos9810-v4-2-4e91fbbc2133@gmail.com>
References: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
In-Reply-To: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734188212; l=4455;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=uMCyvBcblST8fT6tpNS3iuyS4bo3Z+mJv8estU8DrRg=;
 b=AJDcFzYMPwpHeA6CF5N0iaoMpemqx+KpuAauJgSprpU8ee8Y0ttV7ftg2WNTkL6PkWlqwF/+p
 jjrnRhbkW5XCpBmA5WwUsRx7dZJgkWZB+v3pXc5XRJuZagYJ1NmI0Jn
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
index ee73e1a2db7ea64a0b8e9067a1a264e366f59bc3..f6f4bc650a94db0bc6bc017432e2e3dbba90e8c3 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
 	exynos990-x1s.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
new file mode 100644
index 0000000000000000000000000000000000000000..fc0ddfee4cd63d2fc53cae3d7447f66d39c134e9
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
+		      <0x0 0xe1900000 0x1e700000>,
+		      <0x8 0x80000000 0x80000000>;
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
2.47.0



Return-Path: <linux-gpio+bounces-9649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D16969E3A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F360B23AB8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766461D9337;
	Tue,  3 Sep 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOBZl25C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECED1C2433;
	Tue,  3 Sep 2024 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367491; cv=none; b=o+T1bdWSiiVj31Fi9qy7y/D99FJrrE9BOeCojbMyhhQXw8XTFJgfRUtG2YDAPT8WjjKbfIMmkXZG+/xDgecYV81QVGFowlj7ZvOMCzA0fHySeBKNGsAvXl9n0eJ67aWyC0n0wDm7N5pI1qe1ip5dYQfxC+Neyb54I477WwsTaA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367491; c=relaxed/simple;
	bh=4JBoG/i1oIvG2n0LJb8y+ry6r3EO/H0sXEnIU+hKY2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uFWZDbnB+cO4/wzljZdu5ulsugcUqVEhq7qX3IZ3EGJ+ECoALEB3R4Gauc7toRbF8GViIXt9cRBAhMF4Vp93mUXIARVERgBrAdhA/OMDdR+vy/L3FmqTKckEwSR2r3PTbwtiUpwS6ASAt+zKWD2SWtp1q9so699MCf6m775YmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOBZl25C; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a868b739cd9so620915266b.2;
        Tue, 03 Sep 2024 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367488; x=1725972288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/FjRZEf2VlqEHZp9Pt3WFUwWueUkmpeqTpDvDRxrBY=;
        b=cOBZl25CvNu1unKxpLxovdJ/tNnnnUg5HArWsQN0YlcWqZt8dJvH5UZsbm2Sx8+7vf
         5T9o9EajmO8mGR1GnEIZTf0lMVYmKhLZlSwVNu3u8pvowO7znmV1dsntKla/nxSghMl8
         PuR1ktoPIPby5LCER0hCuILIfNjM3AjftWUqzikQ3pVQCLlBw0hU0Bdvuz8SAYpJx/XQ
         NGsZBpVfV7KoSlCP6M0r2ob7b7Yc3G85x0QIoKCawMQkHdR1Y+N4+XrE4ZBBh2QOU6Wl
         Iom6NtxrjEsnOvoGqy8jxmBmYA9hf33MNcecZwK0zmpjaV9BL/EXd4imKpauaANg1ZMc
         IE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367488; x=1725972288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/FjRZEf2VlqEHZp9Pt3WFUwWueUkmpeqTpDvDRxrBY=;
        b=S+2UP+FbuzTsW4AG7+lZAPK0kE9Acge5g7KGqIN5Mg+NiIdcdmoZ1/IK02SqtDmtW1
         U3E3TmzjwCb+NKuVy9nmR1nG+BG1N6jXPoDxYwtJNANO031TKU35fR88qf76kMyJES9b
         TMTQ08q6byQ2KHeUX/j3hppoXfoUCKTBG6x3YYdySYlX45OhQc51p10hyuker7SYPhk1
         ooo1rYkTrebPzfHiPEX5QZV7L27s0O16CyANrzF0fOCbW6ZFmG10Yx+/xnXfnZ5ERLyt
         AzaqEBpxFEwCTm4qUSpsvWzIevYdvVrZY6zTtyCUxi1J+5BI9hYsSgExhE+3SWdbXz4p
         hLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiWQNXqDeryBwTRhzLtuBGtR2ZClI2IeXGxOKDil5yQlHPm9agCl+8IGEMdoFV62babv69dx0xwoz4ag==@vger.kernel.org, AJvYcCVoBjAnOiUxpWRv/lVhg74Istt93q+XxmSdqRoVk4smHMZI/5L6fL3S2hfQlD+bbyMITBUX9XaED406GBVt@vger.kernel.org, AJvYcCW7o8lO16QPPqtExEot1C34/aLCo3bbxGsDB24dKSDTjcZyeEeCZPFLHF3efKl8ak18l4DptDz9f/cj@vger.kernel.org
X-Gm-Message-State: AOJu0YzFgK1GPuBiXHBVRwRn/itCJsENDUdMThzxM2dZUXAyuFuxKTym
	lgBGQGKfSUJwF34z4UEHZZg3P+tTRNKSh0XIJ63glunDNnA4IRYC
X-Google-Smtp-Source: AGHT+IHOrQNoNTwqqmp+4lVnEeHdowsq4Cd98jmaSK0Cxumej5nFh4tllkwKK2LzQHTIH2QW6XFknA==
X-Received: by 2002:a17:906:fe4c:b0:a80:d913:be07 with SMTP id a640c23a62f3a-a897f930bb1mr1474876766b.36.1725367487553;
        Tue, 03 Sep 2024 05:44:47 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:46 -0700 (PDT)
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
Subject: [PATCH v3 10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
Date: Tue,  3 Sep 2024 15:44:29 +0300
Message-Id: <20240903124429.107076-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
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
index 000000000..f123e26be
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
+		framebuffer0: framebuffer@cc000000 {
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
+		continuous_splash: framebuffer@cc000000 {
+			reg = <0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_volup &key_voldown &key_power &key_wink>;
+		pinctrl-names = "default";
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
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
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
+	key_volup: key-volup {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_power: key-power {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
-- 
2.34.1



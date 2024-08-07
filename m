Return-Path: <linux-gpio+bounces-8610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5394A2EE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9531F21ADF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFC81D2F69;
	Wed,  7 Aug 2024 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du33Ytt6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3591C8FD1;
	Wed,  7 Aug 2024 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019346; cv=none; b=pKuHZtZPj4o1OMFF6F57Enqni+S5g8fr4e1pdJEOWreB4TFiTrbv6jU9EURxn7a94xagV0718LGAV4hh7s162lmLzq15im/Yazfsm3y+6yajUwr85SemNKbL40fKBmdK3eGOYlsjTDO4p++e0DGeoR8/UTACMr75tQSs27A6UzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019346; c=relaxed/simple;
	bh=rKJFvh55vvP6U2xisWMgb3ilhUo/eg0syYnKT3T4tiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eIT3RYqeVxWPAQPWMzs3QhkynLFn9h7Z3GZYip5vq00qzfrNDvZvLpMWF/NHWnzptUCit3Yv4QQydCtpJbX4xRnO2kC7PxcW5mO9Xrc5F0Dtnv2zL5tEroIgBEatWPr3449T6LJKmj/1gcwnsv5odk2ofNABIUWzcJleALmCkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du33Ytt6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42816ca782dso11179025e9.2;
        Wed, 07 Aug 2024 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019343; x=1723624143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MITnFzAhcXSHu7cXDX+waEWOqwPn85hNlSBixdf9qIs=;
        b=Du33Ytt6nbKNKj0O+5Uqj9QM8zjS8xs9p5Zag65luVnxNVXxTekH6oLcIA76/yI7Bc
         GU2pIFn01hU+am50QIIIjd5a4PcLaP1OYw7uiZxSb7eD63XBhN3oAk0Isv1Yop5VyAS2
         vZCwEqlS0MhPsh0K1cPBUaOWXJ87KUHJXkmweVFxzXUZTkIoDebTSsrCh3LmITVvMwsG
         tTsEYTILFpIGbsUlsM6TRtyx/7peT+7sPgifAy7r8JtzF4v23jG1Cz/mdQ4U1FA+Bgq+
         eQj5OoHnOx/Hs3FVHA4pCKD0A+Eq0Bnh2smrBUx8fDh1Nl3dK/yJy9al5pUr+R71iFBr
         n0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019343; x=1723624143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MITnFzAhcXSHu7cXDX+waEWOqwPn85hNlSBixdf9qIs=;
        b=FE1HEZ1zqq86/TFSinCuDNOyWti4ZAn2rOORiOGEgd9EncWPJoi0RnSGwMVMEMQfOJ
         3DFA3bgTLjLuCXsaSPJXkWvaDCuQYO46Kz4TpXuKcXc3h5I+IQzp7fof+ZiNCuUk8zVc
         JHGHkI4xn5F5b3LXyNy/jDX0zfSrPT2nW46ISsYWkka9el0z4oJgDM8Z/lvxR9pVDOyd
         2PavQy1DrqETK6R3Z24t0UgKd1W/sVHYvJEOt8NzaBNEnRjYgzAjsSWwvvicXfcgCs9M
         xsM53XxZNlTu2fY1QHZMYFtFB5xLgJJOy++OQ788BDApcLw2vhz2Dh7JOJd37/xFxuC9
         IzEw==
X-Forwarded-Encrypted: i=1; AJvYcCURHGcwjEt/KWIWy1KGAgbFZg7WZwsgZFPzVY78+iTVvkHcunhdb0QhPBb8Fl15OyVzbtX07GEgZi/I2yGk/wv7UZK/+0yt1oKbARivsgJInN+U0wa4nKFRsnNiYYlPneHn5ixoVYZwnYCuMdKr+SsS3KBT4Ts7TcGpy1EaQdh5SqAxj4U=
X-Gm-Message-State: AOJu0YxC1b2cV6lSCZBD071TJG0UpMHGfHU9gyBfJSds8PNQUJMabaGL
	S60a95TukAH7cHoGaYAr3+g/pIWteBdA7zwhtjTmgriaWLObpKGw
X-Google-Smtp-Source: AGHT+IEE+AqajD4fsqmHhGVEWaIEADU+aw3UXfH4k/RPjxH5Oqg4xDvGtVVk1LZLBX/ZNZG9OCKC/Q==
X-Received: by 2002:a05:600c:a0b:b0:426:549b:dd7a with SMTP id 5b1f17b1804b1-428e6b93992mr107039125e9.36.1723019342877;
        Wed, 07 Aug 2024 01:29:02 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:29:02 -0700 (PDT)
From: ivo.ivanov.ivanov1@gmail.com
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
Subject: [PATCH v1 10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
Date: Wed,  7 Aug 2024 11:28:42 +0300
Message-Id: <20240807082843.352937-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

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
index 000000000..5c8351b99
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: BSD-3-Clause
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
+			status= "okay";
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
+			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_volup &key_voldown &key_power &key_wink>;
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



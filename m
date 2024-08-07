Return-Path: <linux-gpio+bounces-8622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637294A3C0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54E3BB261F1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCE21D417B;
	Wed,  7 Aug 2024 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltdL/qGj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6C1D3654;
	Wed,  7 Aug 2024 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021768; cv=none; b=G+ix+Gv1hnUymodu7y7t6ERVru0k5SQVR/ikXwgKuv1sX339xfQtxP9p26fuitLaInXSRNWcVulfgtKvJDfx6nl/8iPo0v9+PG/Saoe6GRVCVmyCDO+c3Y2ShOSotdbysoSN4NeZShpsPrRvKUv/ik6cttj5/4FsQj1yGLZvdVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021768; c=relaxed/simple;
	bh=97Ccxqft5+2qYjuMS+fEQcoyY1/OT2j1iQRtdA8XE0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sKemhO0Chk8mj61vn8dKGfh1OK33fudFpt1773VMcVhEoXlTkGEPIw0/hnnai61bRu+zRltaq3hKv/B1FaG2Ab3R7it6Lm5HkvzVZeTGsTDaV6lGwMpWAD29j8ce7pvYQcrLyc5i7KiV49y6k+thBF/CbvTErzIik7VPqjsWLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltdL/qGj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428243f928cso10362405e9.3;
        Wed, 07 Aug 2024 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021765; x=1723626565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg1JCzafwRnuNLM4FawJbv1YrB13gcXIps0MLMvkrNk=;
        b=ltdL/qGjHexl1k2X6a35bBaH0GLC68MyXG62QsN4mlZYAh7/nuzGHw4ZjGP443h4m3
         iFcDMPIMNONEzxHl0m4h+2wYa6UHwfrBRHUP8Lah9nrSRzbmINX+XzgTdw2kKgZOSMRV
         +dN2TMQsvpwPwN4AToAMoLuIeKwHLDgBkzdqMqbguiJouLFj4Ms+MKqCo06IQzFmGfwl
         SsXf5DXpc2zXLN9QM9TML//hdK4Og20690porX/kELRGyS+6/+vM4Pp3Rp5S4eKccH7L
         56NpoGWeTHIYxSoY3pWI2GZkzw3gzZ3Cv8DnjE//ORRObdFPb3wA3kgIZLkLWGMH5pEt
         lpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021765; x=1723626565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gg1JCzafwRnuNLM4FawJbv1YrB13gcXIps0MLMvkrNk=;
        b=QUBn7Fk4ze3v/0zhEsIfUaDlHtxuSGKOZcYQTZ1QVZurXPCsacIx83ERwtH8QysOXq
         g4nYXKICENE8lhH2Rrb8/+6O4EtoTWlk0beTuXZOQXLFHQk8xhACNgCNfBSpbjNVHYzc
         l07L4ekTMYlLANLmGEjixGxZsr7ZK1I4jUfRwk6K+tubrZnIiuWK6HxIKb3PxWlQUN5f
         73IVhcYHRNJQrWaU2KMtAENBdX8C2pIsmcWcM8s+Lfi5FusKIz19TNkPYVrgegzJf0DX
         bnYm5jhAgkG56JRd5l36LnVOpcjxBpED73f+PonM8vJeBCyHWU2m98Omaj6LIDMZrysw
         UyfA==
X-Forwarded-Encrypted: i=1; AJvYcCU5WF3rJVKFN23anZGYuAjWDoJLck8cSTW6u6t0o3cfEKDChup5Gp1HT3OOnxBXX9IhPHC40dkpFvZtUQQnp8rwGX6f+z0Gngcz3/ptOceitWOsf9RA/TTG5Ovl1rPvRnYuxqH2vxrspFbKNOCkjOsxkabcomtN19ASvBR18pnctt/nj8s=
X-Gm-Message-State: AOJu0YwjRPE3tuSpQ7x6lbVKjAWorzIWor8GkM17YTA1O75EQ9R/g6yl
	3H+/s31jgGYqfG0Ei4Y+Kx32zAs1yxOEtLYAVMi9ffdErAq11Fzp
X-Google-Smtp-Source: AGHT+IFWeXYuTiUydd09mkEx/SJfFGEC2/gaw5qz0ISDOcvyuBj1WTQTOhlc4l+fj9ny0LdYdaJihQ==
X-Received: by 2002:a05:600c:5787:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-428e6b04a2dmr113193595e9.16.1723021764737;
        Wed, 07 Aug 2024 02:09:24 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:24 -0700 (PDT)
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
Subject: [PATCH v2 10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
Date: Wed,  7 Aug 2024 12:08:58 +0300
Message-Id: <20240807090858.356366-11-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
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



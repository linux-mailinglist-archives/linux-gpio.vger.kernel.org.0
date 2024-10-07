Return-Path: <linux-gpio+bounces-10926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709999259B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22131F22BD9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6640918D652;
	Mon,  7 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icIzIL5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A533618CC16;
	Mon,  7 Oct 2024 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284976; cv=none; b=KbIM5v/561mbWrpNzk9uxvE+hI/dC/rsDXtCQZoooafh05QJecdlYaoYUXk8uBjRvhKPPNdYpsw1JFT7Wz94HM65SLVXK0Iu64p/VZgFhZjNOZHXJ4PtebDovKoU2OQ/C35jxkFuklCfxOifDLzedmAoTfwzJnFUDpPU9QqurSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284976; c=relaxed/simple;
	bh=o+18ISmOLfy4tK9RjOHN9JWnWgGZ+ig2caHQ65qeSjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZegHvlvewCflDyXjz3bjYU15pt5w18lh0JPMXFV/RWSsYvkaPdmn/moFrc904Lk39fAiN5Zs3rDvO/uv8aVaa2Wo5ihmRD+osnRou8hfor5dBPmNP3aALyvvboGrdL0CneB8v9UJ+1bE1cjPQSsXlt1GEtn0tXxc/MOLDl31F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icIzIL5e; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71df2b0a2f7so1339308b3a.3;
        Mon, 07 Oct 2024 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284973; x=1728889773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vz/wt4YotLM/xZKZDJmVTFMKUv3sdMRx59tDn1aPlVY=;
        b=icIzIL5enHM7Z65HMD3SoAB7JSY/7aQEnRa4yhFLD9ebdndRDjXnKCh/q/GtbuLLpD
         QRUwMK7P8vkuTVMwjto/fZkpXstnOZo1eAXercvFe4iHpKwvVWLmOjO0tG/eJs/WBcun
         7z+MzGuv/P+wKpf2vcqszrwOj6eo8YLDmFUHDucwIb3/OGLJArwGogeZJeALnmCjA79k
         v0cPFRz7XgGXZAwh29/FrJ70Qe9OgozzhEATjNt17NWEPFvc1kZjXhvWOXkXtQAYpPkn
         HCLhvAzSsfH5hHRX8pKILJoMmOtcNUecuVQECUQ9PrYAaP5anjXjDBsDJCqWqmKqNduA
         Modw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284973; x=1728889773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vz/wt4YotLM/xZKZDJmVTFMKUv3sdMRx59tDn1aPlVY=;
        b=tprQkoId5lSnfrPT/2IRJBLk3HN6CoB37nA2wq4/bIZ6vdbU2xh9T3kY4XoYagTls0
         rCPtsmok2kgIqIk3sK0aQFZUBPr1Xkz6btreuuzefBF1TfKLFRjgKS6ZQyjXvR7Zclhb
         OJAfbGId8HDIqCLAx35MY3VMh/WI6KIDyQkH6Mnosl7gf3VKde8NwSGt6UTykOSKJDoW
         tw2xAciEMRyHuitJvK98CWhKUaCUI8g+wYBw329aTx5L3LY+WW/LV5MDhcYnV8iepydV
         qKqdEjqIFf6wzYLc4mZbHmoX3PVQhK9VdHosGn6l44UgLeHDngZW37IUiWXcgN56T5KQ
         zXdg==
X-Forwarded-Encrypted: i=1; AJvYcCUJqq9oIv1JApA9q5r1TDHZB08QcRA70RXBpe23AwaQ4FbofGeUaTkitOPP7uPLizRqTLu8LoSUXocZT4/x@vger.kernel.org, AJvYcCV7ohqNIGmwX7pQ4feSwcRPfhEmS2iOmm52eEJIDTKs6wx9DO5yx/1bF2Wsq8qP5evHGlDl6iJodnOYYZFOEjM=@vger.kernel.org, AJvYcCW4N4SRaVgLmUMeWCcYczG/VKSZS9mO8N09oahqYgawxNncZatNMBKtlmel5npxmeUxEilJKsPQS5eqGg==@vger.kernel.org, AJvYcCX/4f8jo6aNnpyTR/V/LhhPTZuZG+v8RZapAEOJK9g6q4Q01u7cEHknsEGlyocty+S3NhiSsAStmGRd@vger.kernel.org
X-Gm-Message-State: AOJu0YzK7ektdo5OJI0Suu7OwMC+it5lRbZNr/7QibrhLJjk8av14LWV
	lNYG0pftcVRR93E4Lo+AHTQss0z2bN3FXWD+Kpcs5L2kWLfnO4gC
X-Google-Smtp-Source: AGHT+IFPjYs0SL41qNNgYN0j7Tu8SCgW9+HkTatgMVi69++uym8yUzISJ+8c9Hmrpwk2tvfkYwNTrA==
X-Received: by 2002:a05:6a00:9285:b0:71e:e3:607 with SMTP id d2e1a72fcca58-71e00e308dbmr5890222b3a.23.1728284972726;
        Mon, 07 Oct 2024 00:09:32 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:32 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Markuss Broks <markuss.broks@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 14/20] arm64: dts: apple: Add A8X devices
Date: Mon,  7 Oct 2024 15:05:39 +0800
Message-ID: <20241007070758.9961-15-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add DTS files for the A8X SoC and the only device based on it, the iPad
Air 2.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Markuss: System memory bits]
Co-developed-by: Markuss Broks <markuss.broks@gmail.com>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
[Nick: SMP, m1n1 and gpio-keys support, pinctrl fixes]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile        |   2 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi |  74 +++++++++++++
 arch/arm64/boot/dts/apple/t7001-j81.dts   |  14 +++
 arch/arm64/boot/dts/apple/t7001-j82.dts   |  14 +++
 arch/arm64/boot/dts/apple/t7001.dtsi      | 123 ++++++++++++++++++++++
 5 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index d5dd1e2e4f4c..adda522ea490 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -16,6 +16,8 @@ dtb-$(CONFIG_ARCH_APPLE) += t7000-j97.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n102.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n56.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n61.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7001-j81.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7001-j82.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t7001-air2.dtsi b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
new file mode 100644
index 000000000000..19fabd425c52
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air 2 common device tree
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t7001.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "tablet";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0";
+
+		framebuffer0: framebuffer@0 {
+			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; /* To be filled by loader */
+			/* Format properties will be added by loader */
+			status = "disabled";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 92 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 93 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0 0>; /* To be filled by loader */
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* To be filled by loader */
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7001-j81.dts b/arch/arm64/boot/dts/apple/t7001-j81.dts
new file mode 100644
index 000000000000..ca90dc0c872c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-j81.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air 2 (Wi-Fi), J81, iPad5,3 (A1566)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7001-air2.dtsi"
+
+/ {
+	compatible = "apple,j81", "apple,t7001", "apple,arm-platform";
+	model = "Apple iPad Air 2 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t7001-j82.dts b/arch/arm64/boot/dts/apple/t7001-j82.dts
new file mode 100644
index 000000000000..d9fd16f48db7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-j82.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air 2 (Cellular), J82, iPad5,4 (A1567)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7001-air2.dtsi"
+
+/ {
+	compatible = "apple,j82", "apple,t7001", "apple,arm-platform";
+	model = "Apple iPad Air 2 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
new file mode 100644
index 000000000000..a76e034c85e3
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T7001 "A8X" SoC
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Based on Asahi Linux's M1 (t8103.dtsi) and Corellium's A10 efforts.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
+
+/ {
+	interrupt-parent = <&aic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &serial0;
+	};
+
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "apple,typhoon";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,typhoon";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "apple,typhoon";
+			reg = <0x0 0x2>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		nonposted-mmio;
+		ranges;
+
+		serial0: serial@20a0c0000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0c0000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 158 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		wdt: watchdog@20e027000 {
+			compatible = "apple,t7000-wdt", "apple,wdt";
+			reg = <0x2 0x0e027000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,t7000-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl: pinctrl@20e300000 {
+			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0e300000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 184>;
+			apple,npins = <184>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 63 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A8X doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.2



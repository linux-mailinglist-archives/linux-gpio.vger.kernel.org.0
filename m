Return-Path: <linux-gpio+bounces-10432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE579853F3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9124E1C23500
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA6318BBA9;
	Wed, 25 Sep 2024 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaIu3L4c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8B158D80;
	Wed, 25 Sep 2024 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248908; cv=none; b=KOESJl1BmOUN2iSTSLzGTt7Ri6ueQ9d0FYHKYvfntoI+Fl5qQh7EK4TKRs6vE6RAM4w08m53qr5MzjnuhLhT/34sFfuhIv4aj52r7AHYzaB+uBWdzDMuk2Sjta1qeyA5Qu2kYmf43Ci+eAWO5dbzN9DR0Mh0ue0AnvVkmUORCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248908; c=relaxed/simple;
	bh=lXl8SwthCV8c9d56ZqscL+tx3XIh1u0ei/8lgk+1myA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Te859tdXjgs1nxwppxEBU61jsA1oa4OIBqcb8YHYSzJ0ub4NYq0fjdp5HbMtL8bvVbhca05vugJc6ahhqye6PCwpez4pc9CnZmYGj0Fi/8HQ50K4GE2ON1lGEdF7hM8sr8wGagKDOWK6PdNR925P+rZoHljxp+jZbflcpiQgtrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaIu3L4c; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e042f4636dso3803621b6e.1;
        Wed, 25 Sep 2024 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248906; x=1727853706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUukXodqKGFf7mDoToB48LouskmdBhSOgZjlCXQ9i70=;
        b=eaIu3L4cM4kiclGDpNNn9ekzaJXHKcuCUmzc1HF1wPd/09pkkirp+UHYy5wqoA7dOq
         eq9JNozwXbvCsLm6UXIZ4df6Li0zYqvhw5cxkiQ79igYJramDlYhNCd+KYOqzpU30Yqq
         KPrCbeGcEZH0ivgSP964BfaT+5QtX4v6TLjK+42nJq0JQpBAcnEpx8ppCtlxdbwkTcAP
         N9aiQXWeZ2bS9v9ZJT5gVUNAY4+CejLYixrfHi4ltNQ8mesIEUmprfBHind6WiBOeyQN
         uxV1wS0yZkcrC/AnaNgK3XvEvqlzc11774gVemm85bBNpLzFHZNCSkSuoA/J1ojiPmGY
         Dnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248906; x=1727853706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUukXodqKGFf7mDoToB48LouskmdBhSOgZjlCXQ9i70=;
        b=XNDFPGrDfPk/CVaGQ9fAtCIET3XOFoaiiQl13VlvaILtJRD+Baj3C8yGfxpD2y2JW1
         0gIuW2Y+UqX1NS3Buz0/DPbpLmBoYKIU5mwiZxvCLfULsgtMKTPq5aag3wSXx75y/7Gm
         fIJluicI5iYTQfpmvaWM7uGlNX/4CxUT6iqw5K1wwKJ4YhGMLE2x5UUaXI2bCT+VaJIJ
         r1YK6Dt2e9+9gbM7qYg1IXebZBDpOYPj0xUvWICVhp1vYCmphv8H6KbXug8DYnOcg+Iu
         xQGr56B40PrT0vMhCGxftaPmt1ImYuPOUztrrlA7fhae2eKfKqoyj33mP/H39ZHApEvM
         zRBw==
X-Forwarded-Encrypted: i=1; AJvYcCUe8qVuXOZu8117pxzSd0ql/qZqHuI7Qi1UJOjtTVh8oHEF17r49xwt6tgcgSWSwoOm8zcavrAzvACXncQd@vger.kernel.org, AJvYcCW8j6kmm9smxirMGpo6iYLg40DSbCzn9lQBvLE99ni6VQuC1pqyokTKFD8uABEvSNP9aeBIdN49htAyHgUT69Q=@vger.kernel.org, AJvYcCWfAofryIaog1vLOId8vRZhmkLvDK7Vjzp4jPUo0bNBmHXvx1krheGIb5rLsZvDpSSFkl9nCXLFE7vn@vger.kernel.org, AJvYcCWrX+WkgSUorl313Y5IRwUCpdOSAHuRMJycjq2Ylb3fEOV0IeBJbvGGnqpsS5qNZSxL4nRv8zMwSiv0SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlSbuSfau9fwja/t2CLv5c9tVhCeV2501wFr3Y7MwdZV+fyxQL
	4EJMYOd9WUlBlqV3l2hzrPMsjqpRVxRQJ0/WbkRgREbC514tn2JP
X-Google-Smtp-Source: AGHT+IFrm7e873ny0eszt1p/YVRlB8yq6ci1VZIcwI3KF7C3BnOotWKXHrXnxPpxx5u/wK0i9fXl3g==
X-Received: by 2002:a05:6808:202a:b0:3e1:70d5:d00a with SMTP id 5614622812f47-3e29b7a7564mr1437644b6e.27.1727248905867;
        Wed, 25 Sep 2024 00:21:45 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:45 -0700 (PDT)
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
Subject: [PATCH v5 14/20] arm64: dts: apple: Add A8X devices
Date: Wed, 25 Sep 2024 15:18:12 +0800
Message-ID: <20240925071939.6107-15-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/t7001-air2.dtsi |  46 +++++++
 arch/arm64/boot/dts/apple/t7001-j81.dts   |  14 ++
 arch/arm64/boot/dts/apple/t7001-j82.dts   |  14 ++
 arch/arm64/boot/dts/apple/t7001.dtsi      | 154 ++++++++++++++++++++++
 5 files changed, 230 insertions(+)
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
index 000000000000..8ecf2842e8e5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
@@ -0,0 +1,46 @@
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
index 000000000000..9a5f0a4bde52
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -0,0 +1,154 @@
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
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0 0>; /* To be filled in by loader */
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * The bootloader reserves a region for the (varying-address, depending
+		 * on what FW your device runs AND model) framebuffer under this node.
+		 */
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
2.46.0



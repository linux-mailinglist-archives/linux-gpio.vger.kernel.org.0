Return-Path: <linux-gpio+bounces-10292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5897CC58
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7005AB234E7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021AC1A7059;
	Thu, 19 Sep 2024 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E49nm6eU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55571A7045;
	Thu, 19 Sep 2024 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762602; cv=none; b=JaGNn4C7qzoOImuRZxHP9UDewy6Autj8r0NaBCEOAFOXX2e4UN7+hsHWS8DTjADggaaOcbHCHKKX0zrZtxkSBO0YTLa7rEqE4KCkhIFLj1KXq01cIIEYxqwhH8kjgGyxVKZoOqilea5xBFIFdz0ViO8aavitMm0dp3Os+fmjMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762602; c=relaxed/simple;
	bh=NfqTBydAA0rKMiZnyRSlqFNySlKJi4oZqmgz8LNyO2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpBjcT0tqLntv1ZgtchvucOaXeuFUuG6ZK0Qx7G/PSTURrENIC1DmRNIa8E3R6dU5AufBovnYhcmUcu1ZnIRwYWRBSBrrJ0wkT71XCtoqMsnvV+ccVZHlQdogN4hiD3f59g5Ve8XyD92bUwE5fCJjCK8V493GWhKXFdRcZw8k0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E49nm6eU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-719858156f4so833846b3a.3;
        Thu, 19 Sep 2024 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762600; x=1727367400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JaHrE84SeLnrWstAmxcdP4iah3z08QyGA/MrMQUQbU=;
        b=E49nm6eUGhI4TWETIY6Lerc5JfdapSdiD1bvlVol6yC6cNLy2w3zHch0Pk7JocpuFp
         zv1bG9K8puhmw4QOFfbAXlWdVsOhjwJNBPVuMpMHaKVr3cPh4dI8N5KCsIpNRQA/4pqK
         fRGPQ15YeJR9OYMCL5S1umZh8ZrNxQRPqeOPONPGKYj4/kbIUpKHx9X9mD0XQ8HhS1kf
         5W8Cp6CmLizJ3ABIH6RwJvRCI03DwO8P2DfCFbi9W3d/qH9BpVP2Xqm63U1X1S1uEtjl
         i2hsCaRv4X6G2xoyauD1lBH8a6og2JqvvaRMqadOXNkzZORcwv3yq19IqlZt2g3hgnEr
         2WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762600; x=1727367400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JaHrE84SeLnrWstAmxcdP4iah3z08QyGA/MrMQUQbU=;
        b=nAgbKmPnj4o1b52iZS4XpFnKcQzlLjES6v56rWDEiLjWgF0cAC4sp/1EGw9J1uDL+a
         Ykp0piyvPkatbOfTxRel4woKEM4A4w7FjS/wOKRwHS9AqJ2m6zHfd6YgR/uFYvhIn6oA
         jlJRgYDYlDGjgrmrNBy715R0AwcY65ob2Djj4/R5kyKDMwHZi61ExehVNBbyh2rmMm7S
         qE3V8rvWhvj1VTbdunTYFh45U35HpFQe4J7zcR4RrmYFNVWHoJ1JG8Lye0ZN5hH3RvtG
         yhf8DNyuI9CI4eB6QBwrH+H0f1sSP99HKIR2PCqXo4jwxb/MaTYv5qXZHWZdY6l5ZZy/
         5tQw==
X-Forwarded-Encrypted: i=1; AJvYcCUFomQcfvY7ePvoHPt0dWCEUPcA9vLMsHmmBjOZyvcnwk32i1HE4LCuU9tqjGemMT2vbACnKvJbPvmD@vger.kernel.org, AJvYcCULxnlVPEx3lalbDlW8P4wZnGLXEuE+KPvOkt8dzZoncCfaU8vhR/XJ17Iu/WJ/jCn7JPneguw3dvBnfpkw+UA=@vger.kernel.org, AJvYcCUpTPxBKf8jL8GK2fwfuXRSTCDbamPYByS4kUoAB4kGO8ydQhd2Hr50ljANxVEm9PqGbs6rmvj4yVCV3g==@vger.kernel.org, AJvYcCWzfRjmfpt/f/FsZgjGBmOMrNxz25Bj4wilAzA3h2En6QDa+2UvC7oZ3wZVgpvzZr1gMACZE/2/Rlr6YEXs@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBcK8IBSvto0Kn3BKjqTaKvsU5BS59FKifNK3BPif/4ZEI4TE
	sXuF/UlQsgWGOsPGeJz7vaPqamT/w+tRPjq1OSMDxQHqorUIyAOOPhiGjFKs
X-Google-Smtp-Source: AGHT+IH+BP+HjnENn+1cUfmjsV4ZyaC7hmpi5D+tvqFvU1zNcnPcuNYAFn2w7R1k52ZftNgRU/PhFQ==
X-Received: by 2002:a17:90a:f2d7:b0:2c5:10a6:e989 with SMTP id 98e67ed59e1d1-2dba007e7a4mr26921120a91.35.1726762600074;
        Thu, 19 Sep 2024 09:16:40 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:39 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 14/20] arm64: dts: apple: Add A8X devices
Date: Fri, 20 Sep 2024 00:06:03 +0800
Message-ID: <20240919161443.10340-15-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
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



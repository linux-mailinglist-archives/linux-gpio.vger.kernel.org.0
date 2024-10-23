Return-Path: <linux-gpio+bounces-11815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A67DD9ABD6F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30EB41F2460C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3942F15667B;
	Wed, 23 Oct 2024 04:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtSGczUF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC1149E09;
	Wed, 23 Oct 2024 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658777; cv=none; b=XqrZ/zr8Vf7L7uysp3tZzSt7H5uibQzBa8mToXRIrtUmZFFO5cilXh5aN2h/E3F71k7ujgn1HEb9I3ujLcCjjkKGVmygHOxTorem5WJiLy2Ke/Q/i76tAxq4ut2D3qngAfu7LcWgmtdG/QeUnQbFrIkekTLYraNfxy9rubltnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658777; c=relaxed/simple;
	bh=Nj4UYo9pD076edDh5xr2HpIgCOqWZxoI8CUGoOd2KsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2AwXD4UHbLkBbrbnynOzS4FqThVRGkUZP9pToNjb973AZd+O8WRLabQchhbQRuI9qZp/v77dmPPuMKcALV6xwIOaUZWQtmekW1rGojgvacMDnol/c+1Eos47Lm5t9VrBJE69h7HiNA0n74RWZ76F+RjTWb1kZKOei9PqhkJ4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtSGczUF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cbca51687so62989585ad.1;
        Tue, 22 Oct 2024 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658774; x=1730263574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQuv385CzKnq3zLwf+BYMbcSjCeXWxuc5AxIE/I+jyc=;
        b=GtSGczUF8gh+Hu1WR58Q4Zdf1llsMXPNJFfkcRxpFs7ZxWNV4BfYeuXK8iazUH5xIa
         BX489QPy71SFijF+HVJ5qRyg4so1DhyfsJSGZ9WEnNl0x8u9egYowDA3Al/wtXUsYi3r
         WUqRTn3XXlbq67um9uVPsLWuefpsNXH4oXOYmww3Ug/WBllIKVNx+Tz9m9INIoXlm/i1
         eRkQFp4dv0FUMxCmho1WSyLLXI8toQ4qwFrdsra56u8+o9r4EYVc3KZZNKufZT2uyohr
         +kDxHFB0HyAbPDK1en8at+h8e8rJmAtfjN6py+sKnEWhGyo7vwfLOygO7ZW6kAReVXYO
         7ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658774; x=1730263574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQuv385CzKnq3zLwf+BYMbcSjCeXWxuc5AxIE/I+jyc=;
        b=QRzPIcdugSVAoROI+yTqA7qHDD0fb54JB1uDXTwgnGqKUaxGhL/qNCK/R82zbT6dTD
         URKmpSc6JixMnIu7pyRuY+QszCx7t/md7CAGwFjIw5NkPh31JgYSKjwVP6eF7t+qoTfe
         j4Q/0nKshxJRSsU9KubpTv/CTiSH/vo1mUUEz2Gd9gH/6XxkKTNbVBRhBvATJMD++yOt
         Z+TsChxTqKjV5nGdusV8954LKfvoFA4LMLRtRrsyRbWnkE2m9Qy9OwSte2hkJCWwK9Em
         xMacQhUkDoo+eNOEtJKA+73UwuhVwvozuzU8Q1zTsEmNyJ1WabloDwVH+Eh982wwozAp
         p5rw==
X-Forwarded-Encrypted: i=1; AJvYcCVAa8VXpX+35+BgKm4IPLQ93o0/cdLxQ1b3/giDUVsdjIuEqp3AVoyVagat3yZSH0Z748K/P5xihDqfCw==@vger.kernel.org, AJvYcCWON9YASK3iQaY9Cqn2wiM29ZmBIIDAF7GDFvxi+9wozKL3waBFriq6sN+5dus7ixssS+JpHSF+7L3GdThx@vger.kernel.org, AJvYcCXNKFn4zPOu++rn7d1KEH36Say+zJENmNs0qdeXUE09phcu9hoihOCvJmjYUITj/iDOr5DVJQ4Ytof9tZzhZhQ=@vger.kernel.org, AJvYcCXZtt7DRA9KBTMcw5CQlwwrb+qqpqpsGb8m2+TFmxUWlmzBHcyrFjRz5bafzWCEjquN7Tc/Db2df+Em@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhUo3t96tDFiFUA0Ooyzt0GLyYaaaZKeoVKBxCVJ99ATPResJ
	3KV+/xu7D63z6Mun5EgVmVgQDf4dpe2X5+/lfY8tmLU1ksDNFm76
X-Google-Smtp-Source: AGHT+IEp+3z3gVE5nWRACY5aakppI3SlsLkO0SzSCSAR47LOhF6+HyztUUHnLbWBdo9Ygbd87BfbgQ==
X-Received: by 2002:a17:902:e884:b0:20c:a498:1e4d with SMTP id d9443c01a7336-20fab2e0ed9mr15802355ad.60.1729658774323;
        Tue, 22 Oct 2024 21:46:14 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:46:13 -0700 (PDT)
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
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 RESEND 18/20] arm64: dts: apple: Add A10X devices
Date: Wed, 23 Oct 2024 12:40:53 +0800
Message-ID: <20241023044423.18294-19-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add DTS files for the A10X SoC and the following devices based on it:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP, m1n1 and Apple TV 4K support, uart interrupt and pinctrl fixes]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile          |   5 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi |  46 +++++++
 arch/arm64/boot/dts/apple/t8011-j105a.dts   |  16 +++
 arch/arm64/boot/dts/apple/t8011-j120.dts    |  16 +++
 arch/arm64/boot/dts/apple/t8011-j121.dts    |  16 +++
 arch/arm64/boot/dts/apple/t8011-j207.dts    |  16 +++
 arch/arm64/boot/dts/apple/t8011-j208.dts    |  16 +++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi   |  42 ++++++
 arch/arm64/boot/dts/apple/t8011.dtsi        | 141 ++++++++++++++++++++
 9 files changed, 314 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8011-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index 4a7002e289a0..a44c14fae7bc 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -41,6 +41,11 @@ dtb-$(CONFIG_ARCH_APPLE) += t8010-j172.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8010-j71b.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8010-j72b.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8010-n112.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j105a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j120.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j121.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j207.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j208.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t8011-common.dtsi b/arch/arm64/boot/dts/apple/t8011-common.dtsi
new file mode 100644
index 000000000000..44a0d0ea2ee3
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple TV 4K, Apple iPad Pro 2
+ *
+ * This file contains parts common to all Apple A10X devices.
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
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
diff --git a/arch/arm64/boot/dts/apple/t8011-j105a.dts b/arch/arm64/boot/dts/apple/t8011-j105a.dts
new file mode 100644
index 000000000000..d3e5b69c67aa
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j105a.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple TV 4K (1st Generation), J105a, AppleTV6,2 (A1482)
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8011.dtsi"
+#include "t8011-common.dtsi"
+
+/ {
+	compatible = "apple,j105a", "apple,t8011", "apple,arm-platform";
+	model = "Apple TV 4K (1st Generation)";
+	chassis-type = "television";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j120.dts b/arch/arm64/boot/dts/apple/t8011-j120.dts
new file mode 100644
index 000000000000..1b49bb5c97c3
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j120.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (12.9-inch) (Wi-Fi), J120, iPad7,1 (A1670)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011.dtsi"
+#include "t8011-common.dtsi"
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j120", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (12.9-inch) (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j121.dts b/arch/arm64/boot/dts/apple/t8011-j121.dts
new file mode 100644
index 000000000000..22f4aa1ecbda
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j121.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (12.9-inch) (Cellular), J121, iPad7,2 (A1671)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011.dtsi"
+#include "t8011-common.dtsi"
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j121", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (12.9-inch) (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j207.dts b/arch/arm64/boot/dts/apple/t8011-j207.dts
new file mode 100644
index 000000000000..c3384e2cad44
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j207.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (10.5-inch) (Wi-Fi), J207, iPad7,3 (A1701)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011.dtsi"
+#include "t8011-common.dtsi"
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j207", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (10.5-inch) (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j208.dts b/arch/arm64/boot/dts/apple/t8011-j208.dts
new file mode 100644
index 000000000000..251fa76efb6b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j208.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (10.5-inch) (Cellular), J208, iPad7,4 (A1709)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011.dtsi"
+#include "t8011-common.dtsi"
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j208", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (10.5-inch) (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-pro2.dtsi b/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
new file mode 100644
index 000000000000..f4e707415003
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
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
+			gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 138 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 43 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 40 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
new file mode 100644
index 000000000000..6c4ed9dc4a50
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T8011 "A10X" SoC
+ *
+ * Other names: H9G, "Myst"
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
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
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "apple,hurricane-zephyr";
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
+			interrupts = <AIC_IRQ 216 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,t8010-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 219>;
+			apple,npins = <219>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2100f0000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x100f0000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 42>;
+			apple,npins = <42>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2102b0000 {
+			compatible = "apple,t8010-wdt", "apple,wdt";
+			reg = <0x2 0x102b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A10X doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.47.0



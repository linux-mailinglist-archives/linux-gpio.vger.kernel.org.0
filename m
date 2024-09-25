Return-Path: <linux-gpio+bounces-10437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B298540E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343771F21219
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4220518C350;
	Wed, 25 Sep 2024 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOznmd6v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42818C341;
	Wed, 25 Sep 2024 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248936; cv=none; b=r1cTA8rs8Enx49SXDbKxLSfS1acC2FdkZ7S7MEeOb2jUGJLmqeAkbCJ15zDZJmoY70Rgqmcn6eOY7+spwmNJqhaHl4I+s2zeG0xmm8b0THGdlweQtO1QbspyKWwh9YTEzcNUr1WS/IXz2Dk1u9upkKV25398OKchJFRRmDHgEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248936; c=relaxed/simple;
	bh=LPVkO9tbSVkdHI9z7yV79C1isk5CjuqNLVmpdW0CHk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwikCHG0Kp1LM1Ipnf61zdfZ6/9TTqBLQz6nlNci1bEdYqZWyxJ/5zyItxhd2CwzI05KvMBzO96K1hbodFrby5iu5E6POONcstgxql8o6EZ/bV7PN3nIUj4H7ZU3YXeWnIwAXRkVfL2qVi9xAcesagSK9dQ4lGy7eQ0XLy2tFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOznmd6v; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-70b2421471aso4022340a12.0;
        Wed, 25 Sep 2024 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248933; x=1727853733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbBY9aKxwBwO+dv7P65Zv7bGyM0waEH+w3/C1Oh6LY4=;
        b=QOznmd6vmIsB3ZNiTUQpyx+Yp90Sdv/CbBa+U8QzE+i7p/DgFYzIalj5zsP4S/PDse
         yp4lpPzWjxoNHw7vQQBpkHjdD6YnY3Vmgb+7LDSum3MGi6iUHP+komJqaHpBiboZ7L7b
         4afRRsxSrM43CwqwECAhUEgCVHdYTnBZtePLPyhsyR9n0R82qbIgCNlzWUeE8R9kQg8D
         si4tvL8fEugLwO8fSC4p101xG4XaFy68AZeIqGJnbucgxBMHpnrfumSSIikK5KAd55Ve
         4WgmlErQC3qM0D6MvwqRZGU+wdeQgBasr7WndAVPZk6nPPct72AcI2TtSS9CX6WLzn6Y
         /K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248933; x=1727853733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbBY9aKxwBwO+dv7P65Zv7bGyM0waEH+w3/C1Oh6LY4=;
        b=LDlHVMoBHxfrTCbk95uN4rNA6RWWF4UDUsEmXY2UMUOXl8Yw5sEO3J2nH2LIxXkk/M
         Ob6USRqcYMxrnvNMt/+lJObUjshWWqYj8L4lztLes/WqCFvPXiCH98vcEMbBtHfO+7X3
         6PCGltgQlCmp5YRf0J0H+9TZ20HtNPcwnXwiEM9YTMmAJ8/QMXwa7puOxo4kxS6KuPPo
         /B2EPWvKmNaQwbRUfs97IDNuwe0AXhz+VQ5o9A9iD1ZKyUZ/vnw/R20KjT0h+LSoF7nF
         C8C6QvkaDjA/xRRFdSzVZPe3TMIuIQnq5geSR1IV96khy61p892k4ATDYEjGJsqKuF0f
         zXEg==
X-Forwarded-Encrypted: i=1; AJvYcCVJSXiCqsJ3bSeEkOeflFFFbAmw1Xm8p8EoVAKN7bXrfg1CBhRbNT0OIMOGe9UVmfz2VJWMuKxz9pbGHg==@vger.kernel.org, AJvYcCVVR8rWzj+ddq0eeC7QRV/p//wTFcI6a24rTikHl65WST9OP/hk8vBmu6dw1A0KpiaB2bxXSCziD7QIVMf6@vger.kernel.org, AJvYcCWx+Bnh2LdL835vOI0lROKzP8JmK2fjz0FVj3OTPYEad28gxU5yA3k0rzUQ7bO45I4/l89BoTzR4Bhm@vger.kernel.org, AJvYcCXSzjptbXXwLYXPP6SRzxEocjHAbmrJoo7mDuMrbjeDULnzxrcEONBBwUNqXE/bWABdV5XCZkz1XczSH5SkGmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydN71AGUyGBCmhOcq2l0jzQX4TKBMSPKPbzCuNot1l//6e6kfg
	oK1uVCgdpvCJ6nlxzDwg9wesGzIBh/4HtWStfqwGt8VhOlV3nXLG
X-Google-Smtp-Source: AGHT+IGj8dcr9i4FFRQOzjOMQCT84AVxDs2CE5dMGMg6UtTKya1/K883OnFURNzantI13xg1oyquCQ==
X-Received: by 2002:a05:6a20:b40b:b0:1cf:50ce:58cb with SMTP id adf61e73a8af0-1d4e0bad15cmr2354839637.43.1727248933202;
        Wed, 25 Sep 2024 00:22:13 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:22:12 -0700 (PDT)
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
Subject: [PATCH v5 19/20] arm64: dts: apple: Add A11 devices
Date: Wed, 25 Sep 2024 15:18:17 +0800
Message-ID: <20240925071939.6107-20-towinchenmi@gmail.com>
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

Add DTS files for the A11 SoC and the following devices based on it:

- iPhone 8
- iPhone 8 Plus
- iPhone X

On A11, Apple has introduced independent performance and efficiency core
clusters, so indicate it in the device tree as well.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP and m1n1 support, disabled SMC pinctrl]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile         |   6 +
 arch/arm64/boot/dts/apple/t8015-8.dtsi     |  16 ++
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi |   9 +
 arch/arm64/boot/dts/apple/t8015-d20.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8015-d201.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8015-d21.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8015-d211.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8015-d22.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8015-d221.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8015-x.dtsi     |  16 ++
 arch/arm64/boot/dts/apple/t8015.dtsi       | 268 +++++++++++++++++++++
 11 files changed, 399 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index a44c14fae7bc..ab6ebb53218a 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -46,6 +46,12 @@ dtb-$(CONFIG_ARCH_APPLE) += t8011-j120.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j121.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j207.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j208.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8015-d201.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8015-d20.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8015-d211.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8015-d21.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8015-d221.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8015-d22.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t8015-8.dtsi b/arch/arm64/boot/dts/apple/t8015-8.dtsi
new file mode 100644
index 000000000000..cac1d47285a1
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-8.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8015.dtsi"
+
+/ {
+	chassis-type = "handset";
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-8plus.dtsi b/arch/arm64/boot/dts/apple/t8015-8plus.dtsi
new file mode 100644
index 000000000000..ea291a95f028
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-8plus.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 Plus common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/* The 8 Plus has minor differences like 1 more camera, 1 GiB of RAM more and a bigger display. */
+#include "t8015-8.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8015-d20.dts b/arch/arm64/boot/dts/apple/t8015-d20.dts
new file mode 100644
index 000000000000..35d79e2ceebc
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-d20.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 (Global), D20 iPhone10,1 (A1863/A1906/A1907)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8015-8.dtsi"
+
+/ {
+	compatible = "apple,d20", "apple,t8015", "apple,arm-platform";
+	model = "Apple iPhone 8 (Global)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-d201.dts b/arch/arm64/boot/dts/apple/t8015-d201.dts
new file mode 100644
index 000000000000..31e0947fee70
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-d201.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 (GSM), D20 iPhone10,4 (A1905)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8015-8.dtsi"
+
+/ {
+	compatible = "apple,d201", "apple,t8015", "apple,arm-platform";
+	model = "Apple iPhone 8 (GSM)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-d21.dts b/arch/arm64/boot/dts/apple/t8015-d21.dts
new file mode 100644
index 000000000000..a902ba7f1133
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-d21.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 Plus (Global), D21 iPhone10,2 (A1864/A1897/A1898)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8015-8plus.dtsi"
+
+/ {
+	compatible = "apple,d21", "apple,t8015", "apple,arm-platform";
+	model = "Apple iPhone 8 Plus (Global)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-d211.dts b/arch/arm64/boot/dts/apple/t8015-d211.dts
new file mode 100644
index 000000000000..3b3f886c0c09
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-d211.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 Plus (GSM), D211 iPhone10,5 (A1899)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8015-8plus.dtsi"
+
+/ {
+	compatible = "apple,d211", "apple,t8015", "apple,arm-platform";
+	model = "Apple iPhone 8 Plus (GSM)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-d22.dts b/arch/arm64/boot/dts/apple/t8015-d22.dts
new file mode 100644
index 000000000000..5a7a6092c2d0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-d22.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone X (Global), D22, iPhone10,3 (A1865)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8015-x.dtsi"
+
+/ {
+	compatible = "apple,d22", "apple,t8015", "apple,arm-platform";
+	model = "Apple iPhone X (Global)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-d221.dts b/arch/arm64/boot/dts/apple/t8015-d221.dts
new file mode 100644
index 000000000000..dd920c945bd6
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-d221.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone X (GSM), D221, iPhone10,6 (A1901)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8015-x.dtsi"
+
+/ {
+	compatible = "apple,d221", "apple,t8015", "apple,arm-platform";
+	model = "Apple iPhone X (GSM)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015-x.dtsi b/arch/arm64/boot/dts/apple/t8015-x.dtsi
new file mode 100644
index 000000000000..afba4944656b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-x.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone X common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8015.dtsi"
+
+/ {
+	chassis-type = "handset";
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
new file mode 100644
index 000000000000..ceb245e270b3
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T8015 "A11" SoC
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
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu_e0>;
+				};
+				core1 {
+					cpu = <&cpu_e1>;
+				};
+				core2 {
+					cpu = <&cpu_e2>;
+				};
+				core3 {
+					cpu = <&cpu_e3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu_p0>;
+				};
+				core1 {
+					cpu = <&cpu_p1>;
+				};
+			};
+		};
+
+		cpu_e0: cpu@0 {
+			compatible = "apple,mistral";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu_e1: cpu@1 {
+			compatible = "apple,mistral";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu_e2: cpu@2 {
+			compatible = "apple,mistral";
+			reg = <0x0 0x2>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu_e3: cpu@3 {
+			compatible = "apple,mistral";
+			reg = <0x0 0x3>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu_p0: cpu@10004 {
+			compatible = "apple,monsoon";
+			reg = <0x0 0x10004>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu_p1: cpu@10005 {
+			compatible = "apple,monsoon";
+			reg = <0x0 0x10005>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
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
+		serial0: serial@22e600000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x2e600000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 282 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@232100000 {
+			compatible = "apple,t8015-aic", "apple,aic";
+			reg = <0x2 0x32100000 0x0 0x8000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@233100000 {
+			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x33100000 0x0 0x1000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 223>;
+			apple,npins = <223>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 51 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 52 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 54 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 56 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2340f0000 {
+			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x340f0000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 49>;
+			apple,npins = <49>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_nub: pinctrl@2351f0000 {
+			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x351f0000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_nub 0 0 8>;
+			apple,npins = <8>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 169 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 170 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2352b0000 {
+			compatible = "apple,t8015-wdt", "apple,wdt";
+			reg = <0x2 0x352b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 172 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_smc: pinctrl@236024000 {
+			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x36024000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_smc 0 0 6>;
+			apple,npins = <6>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * SMC is not yet supported and accessing this pinctrl while SMC is
+			 * suspended results in a hang.
+			 */
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A11 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.0



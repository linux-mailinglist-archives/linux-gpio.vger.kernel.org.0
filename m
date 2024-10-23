Return-Path: <linux-gpio+bounces-11810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770D9ABD5A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D5D2851D4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE19146D6F;
	Wed, 23 Oct 2024 04:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK3QkHrL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9AB153573;
	Wed, 23 Oct 2024 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658752; cv=none; b=QQD3Hrw1NyXNd5zLVINnGfRWiCfBE6iIlSZuVQKgniIZrGjj3JY64YzLkLcaa0UStddNSydTlmpsoG6iiPeqknF91w8Sd/+ur42spCXYQ06elQRr+uN8mvAzLrlNl8HjdCSeEazuL7mcziDOCNvXlUJrbooAevMts6faifyPqRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658752; c=relaxed/simple;
	bh=ZGZge3Dacc4g8jmVbaXLshrxsJoEkmaXrKF4fgcTgN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQBUwJU1qfxruTq6/bDOBdQPhKW6WQCKqcvgEEVt1HJIk+pvkjTXzhvjANnOmvafR5PGHl5Z+ckjXeDLzGolzVI6+21Xi5w1LTda+oRqMRoaBrUAud7ZtyhDctIZDEOCsbL+N96h0gpQsvYbh7qOIMIpnm1FJDZZD5XSoARwu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK3QkHrL; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7eb0bc007edso736446a12.3;
        Tue, 22 Oct 2024 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658749; x=1730263549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gnjfOf+haBHSmwr0qBV6ooJDIIH4PDk5HIKdQUDv6o=;
        b=EK3QkHrLiJnvohdKlP/ZqRvgrpfdMMFCGIjwopTKZ//1ozqOXYAA83tJ6LkdInCINX
         UoHMvRsBP1Z2uzm8X9CPk/y5wweTYoffR3XYua75RBHDqeRLnkpFbnID6j5jFKTm98Fh
         cokhw7PozCcvn0/3OeOJWpkbv+A7uvyBkxsbtvycIyor/GYLiDS3r3ChNSOTkrPgErGD
         v+c2NupmjD3sb9McsFJkSwQAyjKmvfoM+iJ96WQuyggFG+Usw493HmS6WR8+FL7oEwEB
         P4n8yK+8xu8tTweFhL3/FblLVJTVoiXcSmfyzhrupCnZGvQuWat3Dxnz7cUv0WwMb+lA
         ljJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658749; x=1730263549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gnjfOf+haBHSmwr0qBV6ooJDIIH4PDk5HIKdQUDv6o=;
        b=O4uA7Q8kdxXg2Bb6iYV4hwNw201i3/rPf7GhSBNd1y/0zDfv20jdwvFO2tc2TfDZ4M
         HXwk/NXykR7+sbRI5ziVZ0/xLvL/iuHqQ+pJBKDCqwFyJcaPqvz1VTNEJ7F4601Fxhky
         zda7coVhu8i7QjKx+5oqAs0kGcw69ZVS6GazYWS6sMnbyFBs7hljyexpOhUwcreJob9D
         IIpMyOleQfbDLC7yzBiyyL4mXzMzPRU7JU2EtmPrzyNtekxN0xF27vK0DASBd1Twnfqv
         ctGWQGPiMEGCWMH1WxKz2I46t+QYTsLblk1RCGGTZNHHRC6kQ/HQ95gOriCgTzyRU5vo
         Srgw==
X-Forwarded-Encrypted: i=1; AJvYcCUJXwTej6bABSNEfaSXckgePmy4Qvos5/d6cufz8JTX6MYH+GGHNKBmVHMW6SLHr4GYR2DNbBnwDu2S67IgkRc=@vger.kernel.org, AJvYcCWnAgYS6Of9p8bMe3deTnfIzY5FAEZlDpXzxIg9AN9znf4hkXqLAFd2oIqk796QAnuQnV/Tm2ap0vUxFA==@vger.kernel.org, AJvYcCX4FuIA/dmzpU/e6rQoIWfrq/taglAdfvixY9OtjRekaM7PsafDKoJSeSewKSjmzoZXlxljdysaNqqVtldM@vger.kernel.org, AJvYcCXdQwYB1mzQhVa/N4jZ7lHxZIp1Crk+fj2DnIYtoQIgSY0QUtJwF4dZYjOHNZ/b3G2sGHY/nO1jKk3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7766sKhyG8oehT15KWicl2BkDZ7aGosMABOZcPpuO67F624rz
	U9khCcGpiImLZaXJpWTDfxLhssfUYQQLRj4cVeJB06NbpchHDy5b
X-Google-Smtp-Source: AGHT+IEaSi1bCgwSK4UNQvD5wJxLBDOch0R3luq1Q12dfPOfjuOhey4H9WOi3T4GHc/8mgH5YPpwYA==
X-Received: by 2002:a05:6a20:e196:b0:1d9:3456:b6f4 with SMTP id adf61e73a8af0-1d978b13b89mr1429824637.11.1729658749429;
        Tue, 22 Oct 2024 21:45:49 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:49 -0700 (PDT)
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
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 RESEND 13/20] arm64: dts: apple: Add A8 devices
Date: Wed, 23 Oct 2024 12:40:48 +0800
Message-ID: <20241023044423.18294-14-towinchenmi@gmail.com>
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

Add DTS files for the A8 SoC and the following devices based on it:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Ivalyo: system memory bits, iPhone 6 gpio-keys, pinctrl]
Co-developed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
[Nick: SMP and m1n1 support, gpio-keys additions]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |   6 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |  50 +++++++
 arch/arm64/boot/dts/apple/t7000-common.dtsi   |  36 +++++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi |  27 ++++
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |  31 +++++
 arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  51 +++++++
 arch/arm64/boot/dts/apple/t7000-n102.dts      |  48 +++++++
 arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 125 ++++++++++++++++++
 12 files changed, 430 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-handheld.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j42d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j96.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j97.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-mini4.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n102.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n56.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n61.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index e1ee803f72a7..d5dd1e2e4f4c 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -10,6 +10,12 @@ dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j85.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j86.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j87.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-n51.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7000-j42d.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7000-j96.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7000-j97.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7000-n102.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7000-n56.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7000-n61.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts/apple/t7000-6.dtsi
new file mode 100644
index 000000000000..f60ea4a4a387
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6 / 6 Plus common device tree
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include <dt-bindings/input/input.h>
+#include "t7000.dtsi"
+#include "t7000-common.dtsi"
+#include "t7000-handheld.dtsi"
+
+/ {
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 32 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 33 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 45 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 46 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 131 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-common.dtsi b/arch/arm64/boot/dts/apple/t7000-common.dtsi
new file mode 100644
index 000000000000..87146e6daae7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-common.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple TV HD, iPhone 6, iPhone 6 Plus, iPad mini 4, iPod touch 6
+ *
+ * This file contains parts common to all Apple A8 devices.
+ *
+ * target-type: J42d, J96, J97, N56, N61, N102
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	aliases {
+		serial0 = &serial0;
+		serial6 = &serial6;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
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
diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
new file mode 100644
index 000000000000..8984c9ec6cc8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6, iPhone 6 Plus, iPad mini 4, iPod touch 6
+ *
+ * This file contains the parts common to handheld devices with t7000
+ *
+ * target-type: J96, J97, N56, N61, N102
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	chosen {
+		stdout-path = "serial0";
+
+		framebuffer0: framebuffer@0 {
+			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; /* To be filled by loader */
+			/* Format properties will be added by loader */
+			status = "disabled";
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j42d.dts b/arch/arm64/boot/dts/apple/t7000-j42d.dts
new file mode 100644
index 000000000000..2231db6a739d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-j42d.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple TV HD, J42d, AppleTV5,3 (A1625)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000.dtsi"
+#include "t7000-common.dtsi"
+
+/ {
+	compatible = "apple,j42d", "apple,t7000", "apple,arm-platform";
+	model = "Apple TV HD";
+	chassis-type = "television";
+
+	chosen {
+		stdout-path = "serial6";
+
+		framebuffer0: framebuffer@0 {
+			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; /* To be filled by loader */
+			/* Format properties will be added by loader */
+			status = "disabled";
+		};
+	};
+};
+
+&serial6 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j96.dts b/arch/arm64/boot/dts/apple/t7000-j96.dts
new file mode 100644
index 000000000000..8a32a50cc2df
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-j96.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 4 (Wi-Fi), J96, iPad5,1 (A1538)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000-mini4.dtsi"
+
+/ {
+	compatible = "apple,j96", "apple,t7000", "apple,arm-platform";
+	model = "Apple iPad mini 4 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j97.dts b/arch/arm64/boot/dts/apple/t7000-j97.dts
new file mode 100644
index 000000000000..ac7d501f88d2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-j97.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 4 (Cellular), J97, iPad5,2 (A1550)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000-mini4.dtsi"
+
+/ {
+	compatible = "apple,j97", "apple,t7000", "apple,arm-platform";
+	model = "Apple iPad mini 4 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
new file mode 100644
index 000000000000..c64ddc402fda
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 4 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t7000.dtsi"
+#include "t7000-common.dtsi"
+#include "t7000-handheld.dtsi"
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
+			gpios = <&pinctrl 32 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 33 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 45 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 46 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 36 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-n102.dts b/arch/arm64/boot/dts/apple/t7000-n102.dts
new file mode 100644
index 000000000000..9c55d339ba4e
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-n102.dts
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPod touch 6, N102, iPod7,1 (A1574)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000.dtsi"
+#include "t7000-common.dtsi"
+#include "t7000-handheld.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	compatible = "apple,n102", "apple,t7000", "apple,arm-platform";
+	model = "Apple iPod touch 6";
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 32 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 33 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 46 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 45 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-n56.dts b/arch/arm64/boot/dts/apple/t7000-n56.dts
new file mode 100644
index 000000000000..2c358df14458
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-n56.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6 Plus, N56, iPhone7,2 (A1549/A1586/A1589)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000-6.dtsi"
+
+/ {
+	compatible = "apple,n56", "apple,t7000", "apple,arm-platform";
+	model = "Apple iPhone 6 Plus";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-n61.dts b/arch/arm64/boot/dts/apple/t7000-n61.dts
new file mode 100644
index 000000000000..10b4ca8babf7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-n61.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6, N61, iPhone7,2 (A1549/A1586/A1589)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000-6.dtsi"
+
+/ {
+	compatible = "apple,n61", "apple,t7000", "apple,arm-platform";
+	model = "Apple iPhone 6";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
new file mode 100644
index 000000000000..a7cc29e84c84
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T7000 "A8" SoC
+ *
+ * Other names: H7P, "Fiji"
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
+		serial6: serial@20a0d8000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0d8000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 164 IRQ_TYPE_LEVEL_HIGH>;
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
+			gpio-ranges = <&pinctrl 0 0 208>;
+			apple,npins = <208>;
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
+		/* Note that A8 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.47.0



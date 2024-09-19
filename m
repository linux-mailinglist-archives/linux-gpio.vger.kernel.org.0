Return-Path: <linux-gpio+bounces-10291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A31C97CC52
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB6B1F22767
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090BC1A4F38;
	Thu, 19 Sep 2024 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="necj5OCc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06AE1A0BC6;
	Thu, 19 Sep 2024 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762599; cv=none; b=VdQXILl6fHVAloqs6YQ3SG9rPo+NBfjmhC5LPtAuaUG1FCElQ1bzzvVeJ1oTJ7MNrvCYNt0BOcxgquFqMkEnW561CxaCE8LKJRaiSKvGtQrSbCY9mjvZvznbdf0y8dFJKesLZuTozP0Q97bJK0b4Ebx8H29tzl3JYoLZyrkulWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762599; c=relaxed/simple;
	bh=XOgnN7SVCaXOhYpYOUJUcvWrSEegCfaPmb98k79LgJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBT9tLdVgcrzFSM9W003GhJEwLvjUHBUGJCGci40HaQmLoVz9cJe+P4IyYaxP6x1PtMtZ9vuPiQ996kuJ7FVEUUU1tIt7aJVYMRJQqcI/LmXdD3slFb5QPy63UWb1Q1HPWB/zeFdJNJohyy5RStHRsa6rsn5F0R/meAUNv6jWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=necj5OCc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso833356a91.2;
        Thu, 19 Sep 2024 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762596; x=1727367396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYVF4ntPQy41wOJIMHw51TmKoR5cX4rlxXnRY7TMVa0=;
        b=necj5OCch8xBL7RV6qMNTp/Pe+Uzp637qsxqUzu6s+FcZDveJw7tPeGolhuStC/ofV
         6eQS8nrroMvTHhzDyISoyWH/YDZ0wbnMWtI08udMo+UqqaJ1g25SHYJ8JTI3OOuQwpMw
         UE8BQbyA7/fZMuZgNFFUQ5DosAZpuNs0+d92wnOIXobu7k12Yn6vQmhqqE8j4Xka+TwE
         MWSVsnlGdm7yWALPPd8xcyPgovV6xInXjcwom6YEoQOPeVJ24mh5Zvc8t/pcdkN4fvxU
         9GiDFoELMGa5u4RuyB5zzxqOppzfKN5uNtBCgyrcYcvCXeqKNqRgfC1Tfg480Kh/UdVe
         SdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762596; x=1727367396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYVF4ntPQy41wOJIMHw51TmKoR5cX4rlxXnRY7TMVa0=;
        b=hjpdp+DB2tTzUM52ODvPAHMi+U3RxhkPTUFhQrzAN3xxk0FqAOuikPFLnPZBNaAzDW
         ANNdjluVV12kPZiW75krimpGyUxW0+I7i8yzL3a/YlxycjBcseJJJAPKTMMldQuXKcxL
         wb/s0LM2WZHOH8bhF/NhAhMjajOluNu5tQ2B5yzJZgYtVtM/e+uIgZGNYK7eQtibzcS1
         MNVlY1DCTy0ph/dPhQhtiZTIgK3NfzVly+A8c05jO5lA5gkINza8VBg9F7gEKDWP9Z76
         8Ai5EEGgH7U4DDc5oiDSFPjPBH81AnoRApDzc5TC8T1QDxBlK0ikqwvLp8+/LPC1u5q6
         ctAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3xn/6LYGnDm3ePLm81kIaU0tOQJBND2YnOoEEyFm65zOHxfTmREyUciA8c7NrH0YniMliZo8JdQ95@vger.kernel.org, AJvYcCUz5dM0UG4ClugW+VlDhURj4x0OBbYUpVXVr0y+CrLiRyHVJ0gyBKhGyt1L8RyI/NcbwlAlHNyg9aa0+cNN@vger.kernel.org, AJvYcCWM3Pm+5bnL9a3udhX17aDuYpizPTqtAXw09Skly//bNDI4OQG+50HHuXJO/suvRxdWezn9QldmUuIG7Q==@vger.kernel.org, AJvYcCXkKAFyPi0E56KXQP/SgLUZI0pTItwJxhR5YzYM3DpXBf7Xmm9tRGgjMl8DtttujtKB8sOPYDQN8fViVTGppSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8/mMQQCd795ptMRId+fyptkwjd5O5EDQLgwU7QKwmKeKQbvm
	BjADo7ANSPnoLpIMROHAY1fQjo27D9ociDrXtlRiM+WZQuv9uNlg
X-Google-Smtp-Source: AGHT+IHTPiJ2lEslb90LbXy0M5InRTOCtJEbh18X9Gn6JqBd5sNHTSiuCNohwGzIGa0rJv6Gk9oYLA==
X-Received: by 2002:a17:90a:8988:b0:2d8:e524:797b with SMTP id 98e67ed59e1d1-2db9ffb3f12mr27973961a91.18.1726762595974;
        Thu, 19 Sep 2024 09:16:35 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:35 -0700 (PDT)
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
Subject: [PATCH v4 13/20] arm64: dts: apple: Add A8 devices
Date: Fri, 20 Sep 2024 00:06:02 +0800
Message-ID: <20240919161443.10340-14-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/Makefile         |   6 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi     |  52 ++++++++
 arch/arm64/boot/dts/apple/t7000-j42d.dts   |  19 +++
 arch/arm64/boot/dts/apple/t7000-j96.dts    |  14 ++
 arch/arm64/boot/dts/apple/t7000-j97.dts    |  14 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi |  53 ++++++++
 arch/arm64/boot/dts/apple/t7000-n102.dts   |  50 +++++++
 arch/arm64/boot/dts/apple/t7000-n56.dts    |  14 ++
 arch/arm64/boot/dts/apple/t7000-n61.dts    |  14 ++
 arch/arm64/boot/dts/apple/t7000.dtsi       | 146 +++++++++++++++++++++
 10 files changed, 382 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
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
index 000000000000..3802e853af42
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6 / 6 Plus common device tree
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include <dt-bindings/input/input.h>
+#include "t7000.dtsi"
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
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j42d.dts b/arch/arm64/boot/dts/apple/t7000-j42d.dts
new file mode 100644
index 000000000000..88bc6ff68f25
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-j42d.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple TV HD, J42d, AppleTV5,3 (A1625)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7000.dtsi"
+
+/ {
+	compatible = "apple,j42d", "apple,t7000", "apple,arm-platform";
+	model = "Apple TV HD";
+	chassis-type = "television";
+};
+
+&serial0 {
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
index 000000000000..c0fcdc900d01
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 4 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t7000.dtsi"
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
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-n102.dts b/arch/arm64/boot/dts/apple/t7000-n102.dts
new file mode 100644
index 000000000000..81fb62dce5bc
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000-n102.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPod touch 6, N102, iPod7,1 (A1574)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include "t7000.dtsi"
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
+
+&serial0 {
+	status = "okay";
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
index 000000000000..b766129ad472
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T7000 "A8" SoC
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
2.46.0



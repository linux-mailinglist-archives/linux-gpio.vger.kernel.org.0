Return-Path: <linux-gpio+bounces-11812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFF9ABD62
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61310285201
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE91D1494B3;
	Wed, 23 Oct 2024 04:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2JWMf5n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D80154C0C;
	Wed, 23 Oct 2024 04:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658762; cv=none; b=ivjsssNaKD3yC7ZOMsEaXC1+/e0SmunjwxABviUO+5+IwtXoq86+b5JWXqioYRzkCdyYotMx2WUGk8LztLARXALrl/wJQhj2ANP1n/+BUezREUjaH1jyCVW0IIWLNMUJldGqr6rPj4bMCOlmV3A0/aIv4qkwIFWugomxezWrwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658762; c=relaxed/simple;
	bh=mL07Lv3MQzR5EQhoBQ/Do0t4o63xtCp9Uw+lm0KVT2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvnUpDZZ0CvZORtZZUNT1Unp6Q0YP8geIogTitR7GKrVsvSlW7Aer71OtqXEgZeuaHYzcL8VLCKNRjWedk9EyR1B4rCcqP1k27s/5tC0KHR5cJslNQiuw8dAG/lzSjpykwiMbQrp99J57g8wOt8pJJ/Un6xJLj21zxtmUG8PBZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2JWMf5n; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c70abba48so53275955ad.0;
        Tue, 22 Oct 2024 21:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658760; x=1730263560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7NKY7djca+NM/4QklI//n9y36tDEyEWXM9GSvRYyKg=;
        b=G2JWMf5nf6vG0aIFWOazxogUyTCrIH6wjqDbz/B8Tftm2MhN2XoT2QjpET39/23JGI
         E2TcRjrlCQdC+XSaSAtDyiVESRHGJUYLxRBg+2v2C6xvXzxH7SpYl/719ylMBx+RWwg1
         gUVTzSRdd14NKp+zRHCTDct4qYa+q4T/XKPdEqWAPpWGZA39tPCKIUwXROZli+WAAA9o
         wwI5AN+Bthjgr/fHZnBg67SRFk5jGAQIoqIzTI443VJ4EWkNi3cS0Tf9uPOZcZdz0Hw6
         ty1wBAQEZeOIRKToZYE5XkGL+UE/5MPuBiLOQ9awp2L4+D3gzI50MCQDpqO1QcEl6uU8
         KsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658760; x=1730263560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7NKY7djca+NM/4QklI//n9y36tDEyEWXM9GSvRYyKg=;
        b=CYlpjPetCO8oGqVnyy6sWsMEiDjyB6RoXkuwYMi2x3cktxd+ZIC1CzHJd1zs9H0+dE
         enQL9aZmjTO+es+U7caUmoDNgwpBqyexquGFlCC5kICo6utaJmo66EwZJCu5ZbuzsljF
         wzTksxUX+F9oPEHr04/KM3aRKzl7orikuoqv6Xor+LRVGoVQbIC8g6gan2G66vSHMbEs
         8cFZcdVNIwNsemvmH3flRJvCswX8Y+2KYGawUp8dLKIoUbklNAe9BcBtTyC/eZJG/6xv
         IKBozPIl1Um/CcFt6D78ZpyuAMxeKaMaYzjkVAhm7PblV/NkpnqA2qxtpdebTaHFTLfC
         +wNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9HF1Uqd2XRRaFmnSOGX+XXsWO4ACnZlUAV3kWZI79FSaLXq/gSDRtlASJWYruQyIQ7dpoO7+SPkPb6A==@vger.kernel.org, AJvYcCUq4l7JrpNjlN+odTCe/n9P0eHZNLS/SWCNfDl+MqXEqQCw8+VbLrGein4gEAGkZ54gqnifFbUd6THnRPmU@vger.kernel.org, AJvYcCVJbBtH3bbxYqXoFbNuKQEKMgOVW8shUZ3xw4FTCEZdCWjTzIAW9+WG1wL/zkX5L1ww0SumxOJqeNUiHGUP+3A=@vger.kernel.org, AJvYcCVcW+YM+yBQ0llruGnh8oAgIQMMyaJcwnH1a0j5MzaOcv0Ev5hoxzLbwhUGiwOyWdwBvMb6R9TF9FYL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JlKNd7itRSzH/siEl4hRL72KKpmnIUG764WlIUWahHsv1OlA
	57IV6gB0R11VanKoDp9428rCQxF71zR2EOCRg01jcw6oOpva2FW0
X-Google-Smtp-Source: AGHT+IFH89gaeARCK1EF2vqVcupCqKhUrBYfDernHILy2SSRmLE7lpQrnKnH7qnx1Xy1X4Xvgj0Tsw==
X-Received: by 2002:a17:902:d485:b0:20c:79f1:fee9 with SMTP id d9443c01a7336-20fa9e46b54mr18373675ad.11.1729658759641;
        Tue, 22 Oct 2024 21:45:59 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:59 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 15/20] arm64: dts: apple: Add A9 devices
Date: Wed, 23 Oct 2024 12:40:50 +0800
Message-ID: <20241023044423.18294-16-towinchenmi@gmail.com>
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

Add DTS files for the A9 SoC and the following devices based on it:
- iPhone 6s
- iPhone 6s Plus
- iPhone SE (2016)
- iPad 5

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP, m1n1 and AOP pinctrl support]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |  10 ++
 .../arm64/boot/dts/apple/s800-0-3-common.dtsi |  48 ++++++
 arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          | 144 ++++++++++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  21 +++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  49 ++++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  43 ++++++
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |  49 ++++++
 17 files changed, 514 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j71t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j72t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n66m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n69.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n71m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-6s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-se.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index adda522ea490..cbb7e409b7e3 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -18,6 +18,16 @@ dtb-$(CONFIG_ARCH_APPLE) += t7000-n56.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n61.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7001-j81.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7001-j82.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8000-j71s.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8000-j72s.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8000-n66.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8000-n69u.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8000-n71.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8003-j71t.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8003-j72t.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8003-n66m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8003-n69.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8003-n71m.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
new file mode 100644
index 000000000000..4276bd890e81
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s, iPhone 6s Plus, iPad 5, iPhone SE
+ *
+ * This file contains parts common to all Apple A9 devices.
+ *
+ * target-type: J71s, J72s, N66, N69u, N71, J71t, J72t, N66m, N69, N71m
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
diff --git a/arch/arm64/boot/dts/apple/s8000-j71s.dts b/arch/arm64/boot/dts/apple/s8000-j71s.dts
new file mode 100644
index 000000000000..b5a2dfa1121e
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000-j71s.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 5 (Wi-Fi) (Samsung), J71s, iPad6,11 (A1822)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8000.dtsi"
+#include "s800x-ipad5.dtsi"
+
+/ {
+	compatible = "apple,j71s", "apple,s8000", "apple,arm-platform";
+	model = "Apple iPad 5 (Wi-Fi) (Samsung)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8000-j72s.dts b/arch/arm64/boot/dts/apple/s8000-j72s.dts
new file mode 100644
index 000000000000..8f3dea5adb09
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000-j72s.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 5 (Cellular) (Samsung), J72s, iPad6,12 (A1823)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8000.dtsi"
+#include "s800x-ipad5.dtsi"
+
+/ {
+	compatible = "apple,j72s", "apple,s8000", "apple,arm-platform";
+	model = "Apple iPad 5 (Cellular) (Samsung)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8000-n66.dts b/arch/arm64/boot/dts/apple/s8000-n66.dts
new file mode 100644
index 000000000000..30b4b6630b60
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000-n66.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s Plus (Samsung), N66, iPhone8,2 (A1634/A1687/A1690/A1699)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8000.dtsi"
+#include "s800x-6s.dtsi"
+
+/ {
+	compatible = "apple,n66", "apple,s8000", "apple,arm-platform";
+	model = "Apple iPhone 6s Plus (Samsung)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8000-n69u.dts b/arch/arm64/boot/dts/apple/s8000-n69u.dts
new file mode 100644
index 000000000000..e63bc2e7f7c1
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000-n69u.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone SE (Samsung), N69u, iPhone8,4 (A1662/A1723/A1724)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8000.dtsi"
+#include "s800x-se.dtsi"
+
+/ {
+	compatible = "apple,n69u", "apple,s8000", "apple,arm-platform";
+	model = "Apple iPhone SE (Samsung)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8000-n71.dts b/arch/arm64/boot/dts/apple/s8000-n71.dts
new file mode 100644
index 000000000000..f2964a1fc434
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000-n71.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s (Samsung), N71, iPhone8,1 (A1633/A1688/A1691/A1700)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8000.dtsi"
+#include "s800x-6s.dtsi"
+
+/ {
+	compatible = "apple,n71", "apple,s8000", "apple,arm-platform";
+	model = "Apple iPhone 6s (Samsung)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
new file mode 100644
index 000000000000..6e9046ea106c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8000 "A9" (Samsung) SoC
+ *
+ * Other names: H8P, "Maui"
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
+			compatible = "apple,twister";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,twister";
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
+			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,s8000-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 208>;
+			apple,npins = <208>;
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
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
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
+			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2102b0000 {
+			compatible = "apple,s8000-wdt", "apple,wdt";
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
+		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+/*
+ * The A9 was made by two separate fabs on two different process
+ * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
+ * the S8003 (APL1022) on 16nm. While they are seemingly the same,
+ * they do have distinct part numbers and devices using them have
+ * distinct model names. There are currently no known differences
+ * between these as far as Linux is concerned, but let's keep things
+ * structured properly to make it easier to alter the behaviour of
+ * one of the chips if need be.
+ */
diff --git a/arch/arm64/boot/dts/apple/s8003-j71t.dts b/arch/arm64/boot/dts/apple/s8003-j71t.dts
new file mode 100644
index 000000000000..0d906ae80b07
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003-j71t.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 5 (Wi-Fi) (TSMC), J71t, iPad6,11 (A1822)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8003.dtsi"
+#include "s800x-ipad5.dtsi"
+
+/ {
+	compatible = "apple,j71t", "apple,s8003", "apple,arm-platform";
+	model = "Apple iPad 5 (Wi-Fi) (TSMC)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8003-j72t.dts b/arch/arm64/boot/dts/apple/s8003-j72t.dts
new file mode 100644
index 000000000000..0cd7d88e9dfb
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003-j72t.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 5 (Cellular) (TSMC), J72t, iPad6,12 (A1823)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8003.dtsi"
+#include "s800x-ipad5.dtsi"
+
+/ {
+	compatible = "apple,j72t", "apple,s8003", "apple,arm-platform";
+	model = "Apple iPad 5 (Cellular) (TSMC)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8003-n66m.dts b/arch/arm64/boot/dts/apple/s8003-n66m.dts
new file mode 100644
index 000000000000..4146cd28160d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003-n66m.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s Plus (TSMC), N66m, iPhone8,2 (A1634/A1687/A1690/A1699)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8003.dtsi"
+#include "s800x-6s.dtsi"
+
+/ {
+	compatible = "apple,n66m", "apple,s8003", "apple,arm-platform";
+	model = "Apple iPhone 6s Plus (TSMC)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8003-n69.dts b/arch/arm64/boot/dts/apple/s8003-n69.dts
new file mode 100644
index 000000000000..8eed879b155e
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003-n69.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone SE (TSMC), N69, iPhone8,4 (A1662/A1723/A1724)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8003.dtsi"
+#include "s800x-se.dtsi"
+
+/ {
+	compatible = "apple,n69", "apple,s8003", "apple,arm-platform";
+	model = "Apple iPhone SE (TSMC)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8003-n71m.dts b/arch/arm64/boot/dts/apple/s8003-n71m.dts
new file mode 100644
index 000000000000..7ec6d2cda0bf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003-n71m.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s (TSMC), N71m, iPhone8,1 (A1633/A1688/A1691/A1700)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8003.dtsi"
+#include "s800x-6s.dtsi"
+
+/ {
+	compatible = "apple,n71m", "apple,s8003", "apple,arm-platform";
+	model = "Apple iPhone 6s (TSMC)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
new file mode 100644
index 000000000000..7e4ad4f7e499
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8003 "A9" (TSMC) SoC
+ *
+ * Other names: H8P, "Malta"
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s8000.dtsi"
+
+/*
+ * The A9 was made by two separate fabs on two different process
+ * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
+ * the S8003 (APL1022) on 16nm. While they are seemingly the same,
+ * they do have distinct part numbers and devices using them have
+ * distinct model names. There are currently no known differences
+ * between these as far as Linux is concerned, but let's keep things
+ * structured properly to make it easier to alter the behaviour of
+ * one of the chips if need be.
+ */
diff --git a/arch/arm64/boot/dts/apple/s800x-6s.dtsi b/arch/arm64/boot/dts/apple/s800x-6s.dtsi
new file mode 100644
index 000000000000..49b04db310c6
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800x-6s.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s / 6S Plus common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s800-0-3-common.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl_ap 96 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 97 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 67 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 66 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl_ap 149 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi b/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
new file mode 100644
index 000000000000..32570ed3cdf0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 5 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s800-0-3-common.dtsi"
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
+			gpios = <&pinctrl_ap 96 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 97 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 143 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 144 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s800x-se.dtsi b/arch/arm64/boot/dts/apple/s800x-se.dtsi
new file mode 100644
index 000000000000..a1a5690e8371
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800x-se.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone SE common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s800-0-3-common.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl_ap 96 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 97 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 67 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 66 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl_ap 149 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
-- 
2.47.0



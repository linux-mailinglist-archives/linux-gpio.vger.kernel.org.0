Return-Path: <linux-gpio+bounces-10927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FC99259E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 912222816A1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32F218E036;
	Mon,  7 Oct 2024 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4ms//rn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C618DF79;
	Mon,  7 Oct 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284980; cv=none; b=SZNlRoBFOzqyvmQRoSUPNVzfTFPWhTcjjQ7BaxeJUJRUqR8j+zUGXLqJaisPlUHXbTzcbQ7KyAEKZ86dXbBGWU9Bomu+yj7jyEsrGWrEc9U9hnOH1BY6lRPq8RQrn26wz7w8/bCqRCO0h6qIXhiOnL41KzVFGViuaCWU8WYM698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284980; c=relaxed/simple;
	bh=OC2nyxMD+nTq1sFVfp1QF6WgXBr4V0N7ghNOI2XntBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzAdXyUbx61YO1dodfoqic4Zqd9s91mrd0fBl/nv893UGdPkSxAiGz31KutLqIO+JuiHVQTS2XO4e4K4VBAc7RsAfHRNFrVK2yUe0ksgMeFJ64q3ebX7bEt9sfyfauzCl46mw7zEsapOBveaqsJIi7ggxMsnhOZEbWE2vSm7FI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4ms//rn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e05198d1dso287609b3a.1;
        Mon, 07 Oct 2024 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284977; x=1728889777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ffh/IQ5l82LoZ9Xik8p+c95hI/8/BXIHDc2Ry7LIjc=;
        b=c4ms//rn5o1IXCWN+vSlTRaOLXwjHPai/wdXe2kjaR/bLFlvIBIzrQdrJuT0eA3Y3R
         Wii8SsuryrcQ3/8Mit+0a4j+yajW7KhziYjuXctQxonRmoDXtmf0Yw4SOVmrgAkDpNRM
         GtWSPV7IoYg5ZTx4XSpx6TeSS+dPMhgHAIsVNEeOZOefoZp6kCmtfPcAlYz6qQJDtQUi
         6ra9eNOvbSDMPOo6S/gt7nUIF32T19qWAiooqSb7LF1v4KUJFyH+vOpDf2x58Z0wsD9A
         79Xy9acNChjFV294zCK2ftjd0Q7rJSP23ndGghBuaw89b0HS1kaSzpHcEw0vNZd45Ftj
         hXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284977; x=1728889777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ffh/IQ5l82LoZ9Xik8p+c95hI/8/BXIHDc2Ry7LIjc=;
        b=ZXGCftCtiNXapTTrKYRMtikOg1t0CBKxA6detowfO9bN3tVkh6DK1UYXG3dFN2OnRS
         H+mzvIGrNgq3c4ySg9Km/JmHJrxgPaUMalhR/vVEZZOPCsg9vmdG10pJCiJYhkMcknvQ
         tIGhw0Dy83nTFJ7S1aTeStpEdqXLiDc5HarSFgz4ltSaqA1NHuFKlpHmJEPohBClolDb
         e9bBorvMeLzODkhls2b7VPbAfXBx9GOEarYEKh2xlalZcfHAK/Oc5OrDkSBDrvMGCqwz
         Sd8/Rce9fXlAwutQZBTodvpyLJ2454ajRTUhkxr9+bZJmlFVB9XOuyde3B7s6iDAcu7a
         1C5w==
X-Forwarded-Encrypted: i=1; AJvYcCUFUaZf/Ke2HuSVvNAlJH+dDQPDFAwWJriMOzofPnYSmPjcAQTs7j/GHG2wB18cHspekecO5YzrjHfUvO01zLw=@vger.kernel.org, AJvYcCWV49B+CxdhyIvD/oK4jS0bUJSb08WbD/nR0mYS6fIsWYaY2lFKZAKAjZTceOblKs4OqBCAgY4f7YU0@vger.kernel.org, AJvYcCWhrUDFHQ33vGDdDCUmKZX2ZWgZeeLq4t0NaN4MXwgdjBv4IO9IlcT52eJIHbqjJw02hurMEQv7rsJFeyR9@vger.kernel.org, AJvYcCXIRXUuOm89GW3yXwkebr3OTsmCIumz0bDXJDBJY6n0dpYpimreCWdqowgB8B4GHh1WzKG9Ck24hK0plA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyCAKMfUTgu6C8IiwkdlkWn079OVrWtpU311fdUlXtEE6C1+x1
	TGsrHQqlq7Ru8k19zIvQZlKAikGb2cZZzx0NtBiAr0ltWP6ZNeRR
X-Google-Smtp-Source: AGHT+IEjTFXcCbg+4zU1SDynCEDtDi7ANqiSADswIW0iaoRCl0u/rCjrekdAydWBCXeGsooGHohh/Q==
X-Received: by 2002:a05:6a20:438c:b0:1d6:c990:74cc with SMTP id adf61e73a8af0-1d6dfa2441emr15716229637.1.1728284976631;
        Mon, 07 Oct 2024 00:09:36 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:36 -0700 (PDT)
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
Subject: [PATCH v6 15/20] arm64: dts: apple: Add A9 devices
Date: Mon,  7 Oct 2024 15:05:40 +0800
Message-ID: <20241007070758.9961-16-towinchenmi@gmail.com>
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
2.46.2



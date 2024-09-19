Return-Path: <linux-gpio+bounces-10293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C697CC5E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D55DEB226DD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752D41A7270;
	Thu, 19 Sep 2024 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5QDVRIP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33AB1A4F09;
	Thu, 19 Sep 2024 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762609; cv=none; b=Ooera5+mSFWrWbYpND7oB/VxgIHQ3+XHjhe+SXoan0kA5QbWFsY+t0aJ43ZoJaqmu2uN/FhyG699V+5ZiqFcPf2+Z7ztD27QbNX+OEVhO1PUb4bC90+NXoZVtzQ9rgO/sE3QUQFDulTcnkUOeSkJRmDMMTiBG9dovsvxYw0MEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762609; c=relaxed/simple;
	bh=T5bc+2EEMpwWR9gMnt+KgpPAx4FmWo1Gg77h6CWR+yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzUOy38UIwTZ2bn8McZd4hsHT5N2TNYSK646VPjJI2hXqgSrgdBMDjI1Hmw5Do9ki7vrMkZRZPWOTAJpfD7QW/q1UUp0xhgCwTQWaCftzVg3L603kBXvYufj2+UaURdLFQlUq+u3sJB0HtsWdkzwvVbSPIpV7S5qtpbpVRBfgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5QDVRIP; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d8881850d9so978853a91.3;
        Thu, 19 Sep 2024 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762605; x=1727367405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wlvrz0d4Sg9n0wIu368n1nhmE+F0zH2AADRG128tbs=;
        b=a5QDVRIPddZYBCalD59MWGf9SzF1LHTo7kgn5/r/8sfSz9CMbFzwYg5OtgsCsSpvsS
         mXmyFHp0xa1UrIHL0C/KyWv1EhIUYFnhVAOpPM6ZiV93uNFYB+/ClJY6k5uZlRkVlXkh
         +wCNfDckeHgSAk0zNH76yzfnqAL8taaU4nfJh8sxqq48p99gDLIukO93q+90CsQCvGU3
         K7FpT53wxSq4MVVuSDlyxoj+Ww3eh+bGOf6RNAbExTaUulTVVV7VzI4Ep91Pn8eza9ii
         bB3dr1ZC1mNTtMEHZcxMqK6lBJJmSp20slaHtGFsNhgpOLsx6BrqfI/cYvnEo+J3kIq/
         HEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762605; x=1727367405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wlvrz0d4Sg9n0wIu368n1nhmE+F0zH2AADRG128tbs=;
        b=crtXPmGS4/DYMKtZsuoYLGHsQOU93dfCvb93Zkl10a4nXpsyR26xgJDrRHRt4pBO4u
         VuNus41+vMxh2F6r1DLN4KaYuTbTlvjoM06aIrzCfGoGlbTCvIGSvfiGG4iq8eHr4HA4
         XQLSsTVU/AF+EwQvyBd2dmpHt4WFcuQNl39s0bH+ufoXIjPQpQQXZy0anyjnec3sj0EO
         7k74EASbxlguVCOMUfZE6a8m5HLIMaD9TQCLNXQ4J0r+GKGif0cnMmMR5NImOkLj+j/F
         UuDl5aYnHPJC0J/taVCRWZt34Dk4CxbllcWgz2QBoLjlY4IdtJwESbZiyEP67l/IDgWQ
         w/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUq0sdT9t4bq+theoGgOsnHYO62Czw+f/bj6rTf7Nk8IWBkgs97M+b911YrBPe2bprX6d1WyfBCqbFsBA==@vger.kernel.org, AJvYcCVhp1cGByxuMcAbbx8ni5r1v/ex4JgaFGymuElmS5RVw6zvP/PdnMIhtb02xrqJbEvaZEHZS0NE2QkHFmIsBtM=@vger.kernel.org, AJvYcCWsgK6q0zjltU97xNPjx0Bu2AXRvQYSZnUCQtK3t1xvuTVmPHJ2YxdJ/bGAIM8HPmG73VEN9xBlPyCa7kAm@vger.kernel.org, AJvYcCXThqppv1e2hWGcRDz7l0D8o6mmwUsCNO9v+Z/WS5mGGhqAS/RF2WearbGwoU6vkao0e4f+/pYZqr1T@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBpYK3YbZ4wGdokfaW+S4tbSsOAZEmT79JRsEUiJLJANXP5Me
	kWWKlsBss2Ynirdw5R5M90OdUOyt86ojT4QsEAGWJApNAfxtyvsL
X-Google-Smtp-Source: AGHT+IGrDnlW9YvUT/pVpQxrhPAOqeBpUreC0hrM5eJsUMnPbkOAJS1qHwe8/mBl+3grbCDI2w7RSg==
X-Received: by 2002:a17:90a:6089:b0:2d8:84df:fa0a with SMTP id 98e67ed59e1d1-2dba006213emr27650191a91.32.1726762604788;
        Thu, 19 Sep 2024 09:16:44 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:43 -0700 (PDT)
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
Subject: [PATCH v4 15/20] arm64: dts: apple: Add A9 devices
Date: Fri, 20 Sep 2024 00:06:04 +0800
Message-ID: <20240919161443.10340-16-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/Makefile         |  10 ++
 arch/arm64/boot/dts/apple/s8000-j71s.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8000-j72s.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8000-n66.dts    |  15 ++
 arch/arm64/boot/dts/apple/s8000-n69u.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8000-n71.dts    |  15 ++
 arch/arm64/boot/dts/apple/s8000.dtsi       | 178 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8003-j72t.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8003-n66m.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8003-n69.dts    |  15 ++
 arch/arm64/boot/dts/apple/s8003-n71m.dts   |  15 ++
 arch/arm64/boot/dts/apple/s8003.dtsi       |  19 +++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi    |  52 ++++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi |  46 ++++++
 arch/arm64/boot/dts/apple/s800x-se.dtsi    |  52 ++++++
 16 files changed, 507 insertions(+)
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
index 000000000000..18488f71a5c8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8000 "A9 (Samsung)" SoC
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
index 000000000000..52094a634678
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8003 "A9 (TSMC)" SoC
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
index 000000000000..b5610258da25
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800x-6s.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 6s / 6S Plus common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
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
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi b/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
new file mode 100644
index 000000000000..a831131f16f3
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 5 common device tree
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
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/s800x-se.dtsi b/arch/arm64/boot/dts/apple/s800x-se.dtsi
new file mode 100644
index 000000000000..3699114188a8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800x-se.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone SE common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
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
+
+&serial0 {
+	status = "okay";
+};
-- 
2.46.0



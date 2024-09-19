Return-Path: <linux-gpio+bounces-10295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F997CC66
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F286A289EA1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544951A76CD;
	Thu, 19 Sep 2024 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIVetsPT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B821A76CC;
	Thu, 19 Sep 2024 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762616; cv=none; b=dTF4xiEs9hbUs+sxUEGUBtlI6/PDicxUOW9e25A8FubkXlK5pGmEEXVP6jfoO3u3GcDMDZRfBrl2f4B3lo+kG9qByedngrGHZCGwe0ZfnIqlR8BjCYjMLsZHWPyp7S3D07NRoeMAL3VF1880v1+FmrZnyGywGN/RhLt/M19VFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762616; c=relaxed/simple;
	bh=hcJ2aI0f3lJzRY/xaT3OIubGofMoZPz+WqtJgJ5uogE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krbQeyUVsIPVtXZg5QwDGQH93WbnyKfneQJgqMak2FCeN0L0VXSlcVX2/li/tDkohOklMOIPtb1g5HFf2W5KSmvpluU28Rlf6sMRVmIGEY9Bpxt8ZBvd1mHOHLAvt38Oo1K13s/ZJ8XNttPLTzth+f9U56UuRPMWgEcQ4oaFDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIVetsPT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db238d07b3so817998a12.2;
        Thu, 19 Sep 2024 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762613; x=1727367413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MqKVYDd3OAYElpGefaTGeCPXNFKIMKgJ1r8dkp+EGI=;
        b=GIVetsPTMJO+9GAkOVvbOIQ3Gf5vRlXOEp2d6uuDnRD3dQHxVrLv4hyK4pWusCNrN4
         vw/PqeZVBBwffwnMU+DMaf7Fh62+cIWyuvUcXlOKpEGTJ9W83ID/eJNXvwiPVRho2SLT
         3uXAK8EHHZ/cCLbNDcOjIIA9Eqk+iS+2vucBCA0vLKyedNz+IIQVSlO3p9LB7gJnLKco
         68RH6XDsD+W2tqNylTKtqdsHR93wjqiA3tnI2meAdoe+fQS8vUVs6a/ABx6izOG1RHTE
         PL0Rmt56LsHdgHoXQ9M5T0UEgXJqmlw+MOLq0MwVa3ICuaJqGioe/tim0/JspKAWXcLt
         ypdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762613; x=1727367413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MqKVYDd3OAYElpGefaTGeCPXNFKIMKgJ1r8dkp+EGI=;
        b=rl09onIPJs6db8Fr/2/WR0Fid8shQt4a/s2iJA4XAib0Zpi2c6ZaDSQNkL7HaXteXT
         Dc5nmNuJhwqoTC5926G1nHIWZZ71lqBmA4HEQKtgm9gabydq6UaKYOpkQaC0Z4zDZj23
         ALaAsAaiM0CgWPdS2wVXaI8lHjpbBernETahwXq3yTGsgawaWqlaI3FC0YhF8U0TJWaF
         bWVIZq3CYDzE0CkKQ0Lf6OpRsJnX4EqIyqd2eKCMVCG2ah0jqYw9vwQYpz21a8MFKs2s
         cvvgIm8kVEvrP/3AyZ96a6o3hcir24noERN6bboExQoEJuA762kUq6Ei2T7i9C2GeYtN
         IleQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8+0o6qfoDgb5XEPtoJaySjTie9yPjyAUUAwi+Da7Y63sAcxh+ghLz6RUQ44moSIvEPKHNkOhBn2Nm7A==@vger.kernel.org, AJvYcCVvFE//PXxs85WVFNRnYxXMkqO7UCPd9uG98LwMmvjHHLER/83SZES433ioHHg44pIfk0rUeIiyPwwX@vger.kernel.org, AJvYcCX8Q9FtHGiT88D1aYu0EwvjM16xJ5+WG1VvP3XhU+YP9NBNsEk0BZKKJtRppK0S7bWbBg96YN9cnc+J9ZcJqLk=@vger.kernel.org, AJvYcCX95h5MLlwWrTpRBig1CE4t6/YtCfG6olQ6E/0jkexnfV+EHVRPfQQoP7nndxQtOBXZEXiBHhcOEXG74t1R@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbzp4G6oTD3Z5TOuct4BNCA8Z84Ea4j3mB2gfXdm9ZWZb3NQv
	kLTR0drYzr1oo3Io5O228QVrypAtfhSG9+2ucEfPej5u//4/OW+z
X-Google-Smtp-Source: AGHT+IHznw1tXqpLwH59h95MTvK2RzuyZcETxliZuom+Ji0FqkNqOmttUF7kADRph1G7ree9FlJ0Lg==
X-Received: by 2002:a17:90a:5143:b0:2d3:cc31:5fdc with SMTP id 98e67ed59e1d1-2db9ff778camr33756333a91.5.1726762613230;
        Thu, 19 Sep 2024 09:16:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:52 -0700 (PDT)
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
Subject: [PATCH v4 17/20] arm64: dts: apple: Add A10 devices
Date: Fri, 20 Sep 2024 00:06:06 +0800
Message-ID: <20240919161443.10340-18-towinchenmi@gmail.com>
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

Add DTS files for the A10 SoC and the following devices based on it:

- iPhone 7
- iPhone 7 Plus
- iPod touch 7
- iPad 6
- iPad 7

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP, m1n1 and AOP pinctrl support]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile         |   9 ++
 arch/arm64/boot/dts/apple/t8010-7.dtsi     |  47 ++++++
 arch/arm64/boot/dts/apple/t8010-d10.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8010-d101.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8010-d11.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8010-d111.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi |  47 ++++++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi |  15 ++
 arch/arm64/boot/dts/apple/t8010-j171.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8010-j172.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8010-j71b.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8010-j72b.dts   |  14 ++
 arch/arm64/boot/dts/apple/t8010-n112.dts   |  50 ++++++
 arch/arm64/boot/dts/apple/t8010.dtsi       | 167 +++++++++++++++++++++
 14 files changed, 447 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index f8cd10889d9f..4a7002e289a0 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -32,6 +32,15 @@ dtb-$(CONFIG_ARCH_APPLE) += s8001-j127.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8001-j128.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8001-j98a.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8001-j99a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d101.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d10.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d111.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d11.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j171.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j172.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j71b.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j72b.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-n112.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
new file mode 100644
index 000000000000..2739e2db4be7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 / 7 Plus common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8010.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 179 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 180 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl_ap 86 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
+
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d10.dts b/arch/arm64/boot/dts/apple/t8010-d10.dts
new file mode 100644
index 000000000000..39cdd12db6bf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d10.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 (Qualcomm), D10, iPhone9,1 (A1660/A1778/A1779/A1780)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d10", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 (Qualcomm)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d101.dts b/arch/arm64/boot/dts/apple/t8010-d101.dts
new file mode 100644
index 000000000000..6a9f0856f930
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d101.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 (Intel), D101, iPhone9,3 (A1660/A1778/A1779/A1780)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d101", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 (Intel)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d11.dts b/arch/arm64/boot/dts/apple/t8010-d11.dts
new file mode 100644
index 000000000000..57e41c2cfbe2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d11.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 Plus (Qualcomm), D11, iPhone9,2 (A1661/A1784/A1785/A1786)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d11", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 Plus (Qualcomm)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d111.dts b/arch/arm64/boot/dts/apple/t8010-d111.dts
new file mode 100644
index 000000000000..37e395a48c1d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d111.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 Plus (Intel), D111, iPhone9,4 (A1661/A1784/A1785/A1786)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d111", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 Plus (Intel)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
new file mode 100644
index 000000000000..7ad3d6373083
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 6 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8010.dtsi"
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
+			gpios = <&pinctrl_ap 180 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 179 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 89 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 90 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad7.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
new file mode 100644
index 000000000000..ea2728bdd47a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 7 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8010.dtsi"
+
+/*
+ * The iPad 7 seems to be only an iteration over the iPad 6 with some small changes, like the
+ * a bigger screen and 1 GiB of RAM more, hence there is little to no differentiation between
+ * these 2 generations for now.
+ */
+#include "t8010-ipad6.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8010-j171.dts b/arch/arm64/boot/dts/apple/t8010-j171.dts
new file mode 100644
index 000000000000..6751bf3a4afd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j171.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 7 (Wi-Fi), J171, iPad7,11 (A2197)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad7.dtsi"
+
+/ {
+	compatible = "apple,j171", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 7 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-j172.dts b/arch/arm64/boot/dts/apple/t8010-j172.dts
new file mode 100644
index 000000000000..51aaa950acd9
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j172.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 7 (Cellular), J172, iPad7,12 (A2198/A2200)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad7.dtsi"
+
+/ {
+	compatible = "apple,j172", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 7 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-j71b.dts b/arch/arm64/boot/dts/apple/t8010-j71b.dts
new file mode 100644
index 000000000000..534eb8413e08
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j71b.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 6 (Wi-Fi), J71b, iPad7,5 (A1893)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad6.dtsi"
+
+/ {
+	compatible = "apple,j71b", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 6 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-j72b.dts b/arch/arm64/boot/dts/apple/t8010-j72b.dts
new file mode 100644
index 000000000000..264924e41f42
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j72b.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 6 (Cellular), J72b, iPad7,6 (A1954)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad6.dtsi"
+
+/ {
+	compatible = "apple,j72b", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 6 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-n112.dts b/arch/arm64/boot/dts/apple/t8010-n112.dts
new file mode 100644
index 000000000000..94b67bf5cf64
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-n112.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPod touch 7, N112, iPod9,1 (A2178)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	compatible = "apple,n112", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPod touch 7";
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl_ap 86 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 179 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 180 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
new file mode 100644
index 000000000000..926a0f501477
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Apple T8010 "A10" SoC
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
+			interrupts = <AIC_IRQ 218 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupts = <AIC_IRQ 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>;
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
+		/* Note that A10 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.0



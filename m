Return-Path: <linux-gpio+bounces-11809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8F89ABD56
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7570928512B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2E41531E1;
	Wed, 23 Oct 2024 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kr4FLeyZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621215098B;
	Wed, 23 Oct 2024 04:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658747; cv=none; b=pzisSl9OD+LoQ0lVd2ERLYkxSJZvNw5f2DzVNbrboqTFcWy6DiapThK8Mdv/xu023IstDAS804HMOG1q4HoR5GC29rnaazP2HLVpbaq7pJFIX8gj/QtQsxL/Z3EbrLkTFM6whJBAQX751mIj5tGoGbsQJALXSgk8hfJOq7WYMLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658747; c=relaxed/simple;
	bh=yIVKTjp7HmUEE+jAqnUIAvtXDVDUpX9R/K40dYxtwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRFZAOUv9PsAqoTBbcs4qothV7lepdufQjdZeeWWTtuySQ0x9H5nZk25KSumVFWgfH+Y8JqCtrf/+233izaAflYBueyQnmvb4mS4BDF0z0d9pahTafR5gv7qN72tMF4Gxp0xG6JW8lbtiQYM6zXft4MIym/ba5Vo0VwsJ9YfE3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kr4FLeyZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cf3e36a76so62425105ad.0;
        Tue, 22 Oct 2024 21:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658744; x=1730263544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9SfTlwcZyH0yUcqOx9zTharZEZAJuKqe5VOPkiJv28=;
        b=kr4FLeyZ5iRdzfXvHf86HdbEGn64pw0ttWrpf3cAEvXskSePZA3XnmHQKoqdc2CqJf
         IEeEdLH485d5rAVszOyXUIF71QN/Jypmx5LcoTz3I5SHUYsdDlvPmsmhXtkCIqPfm0Pi
         ljaA28xa/CW1fRjNFAHORVS9FNdxB6tLNsr+gTZZtFxBMPN6749aY+xFUBJ7EEavPRob
         aKMiGANhAL+3GmuH6FGFdJzgXSKVqAg2kewhm2EnGY9vYB2KiytfOxHLRchukkvzLc88
         FgQCecF55flGPrdfUvs5VEtL8SEFVHVAv5q9eM4ZIEoZYtYHoZXsJAVJ48HcmCVBFOkI
         hvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658744; x=1730263544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9SfTlwcZyH0yUcqOx9zTharZEZAJuKqe5VOPkiJv28=;
        b=LHqjixCJXBt+m17HFYWQVPfilKg3AOEBRITaDMRCt/NVJFIhIJslmpxuma1NtqQOMj
         cyx9nzn/aHagupWVCKYtjm/cL6YYU2740ebgc1V9a3QLjtmPvjbb/j7boWNlmaqYGD8Q
         mD73zrMihARNS3VoJOyXZQ/U/GZp/d/3koe3Z7YMXO5QyVtGsAlTNc1iLHL1AUbnci73
         M4gRe9gt3m97/2CHFxjK8MLfusw9j30iNJTyUgG3jj1wAnWBviqZ0Tnt5jkPNmYOTRCP
         LSQRSf4kbvAGqBUu6RvoVyjhFP9l2T8d6lXSykoiS/6tZgPTCVQHLKy8TvoQ1e8xnwdv
         DfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeXn29rw34+IEOUJ2MAem04AC3CIC1nGVXcELVlLxOes6Kqa0u0hSCDgWTB6KjOBGapRPAYn1P9GRFxxs@vger.kernel.org, AJvYcCVWgxTNnyNSV2PX7IQtjiR27oBBKy3eabttl/ArxAw/VM62lb8EpVVC3c4cNDJm321w0A+Hxtw7Ve3/ag==@vger.kernel.org, AJvYcCWYDYRbmnvAOoyNlaVPlv6DduVYv4RGOL4edmkjDQZ3srHPYUUEYyURw1EMlUYPUl8svDH0qtH3wGes@vger.kernel.org, AJvYcCXd38U3JMX1GIzNXn5XaUXh5dQLQj4amY8GxXADsxa4XmUqIm/DAOmhYD8NEaCppBhaRd/U5CAlRru6XdqSHlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyYrU+4YSuMlA0xq58+KJcSaDiVCY3TKPkyoIT775887WtBSt
	5UspsLpJd8lTo0U1x0m6ox8UNPP0YQz1AZWEXActPlu98WzA3Q46
X-Google-Smtp-Source: AGHT+IH366PmqJlj634y+zRA10rXUuA8o2rHoI/ZEJymSHsee2MRcxgkfjCKrzrAEVs8Px4QIvkaaA==
X-Received: by 2002:a05:6a21:a247:b0:1c4:9f31:ac9e with SMTP id adf61e73a8af0-1d978bd56dfmr1718599637.42.1729658744284;
        Tue, 22 Oct 2024 21:45:44 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:43 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 12/20] arm64: dts: apple: Add A7 devices
Date: Wed, 23 Oct 2024 12:40:47 +0800
Message-ID: <20241023044423.18294-13-towinchenmi@gmail.com>
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

Add DTS files for the A7 SoC and the following devices based on it:

- iPhone 5s
- iPad Air (1)
- iPad mini 2
- iPad mini 3

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP and m1n1 support, gpio-keys additions]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |  11 ++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  51 ++++++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  51 ++++++++
 .../arm64/boot/dts/apple/s5l8960x-common.dtsi |  48 ++++++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  51 ++++++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 +++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 113 ++++++++++++++++++
 18 files changed, 493 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index aec5e29cdfb7..e1ee803f72a7 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -1,4 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j71.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j73.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j85m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j86m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j87m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-n53.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j72.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j85.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j86.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j87.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-n51.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
new file mode 100644
index 000000000000..0b16adf07f79
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
+#include "s5l8960x-common.dtsi"
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
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 16 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
new file mode 100644
index 000000000000..741c5a9f21dd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air  common device tree
+ * Based on A7 (APL5698), up to 1.4GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
+#include "s5l8960x-common.dtsi"
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
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 110 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-common.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
new file mode 100644
index 000000000000..243480ca2356
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s, iPad mini 2/3, iPad Air
+ *
+ * This file contains parts common to all Apple A7 devices.
+ *
+ * target-type: J71, J72, J73, J85, J85m, J86, J86m, J87, J87m, N51, N53
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
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j71.dts b/arch/arm64/boot/dts/apple/s5l8960x-j71.dts
new file mode 100644
index 000000000000..e13036dacb45
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j71.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air (Wi-Fi), J71, iPad4,1 (A1474)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-air1.dtsi"
+
+/ {
+	compatible = "apple,j71", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Air (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j72.dts b/arch/arm64/boot/dts/apple/s5l8960x-j72.dts
new file mode 100644
index 000000000000..afb71b8885c6
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j72.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air (Cellular), J72, iPad4,2 (A1475)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-air1.dtsi"
+
+/ {
+	compatible = "apple,j72", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Air (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j73.dts b/arch/arm64/boot/dts/apple/s5l8960x-j73.dts
new file mode 100644
index 000000000000..c871962df529
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j73.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air (Cellular, China), J73, iPad4,2 (A1476)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-air1.dtsi"
+
+/ {
+	compatible = "apple,j73", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Air (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j85.dts b/arch/arm64/boot/dts/apple/s5l8960x-j85.dts
new file mode 100644
index 000000000000..aefb7b36d7aa
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j85.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 (Wi-Fi), J85, iPad4,4 (A1489)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j85", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 2 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
new file mode 100644
index 000000000000..ec2bcaa6d1d5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 (Wi-Fi), J85m, iPad4,7 (A1599)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j85m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 3 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j86.dts b/arch/arm64/boot/dts/apple/s5l8960x-j86.dts
new file mode 100644
index 000000000000..470f2f825e70
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j86.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 (Cellular), J86, iPad4,5 (A1490)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j86", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 2 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
new file mode 100644
index 000000000000..90311d98aaad
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 (Cellular), J86m, iPad4,8 (A1600)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j86m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 3 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j87.dts b/arch/arm64/boot/dts/apple/s5l8960x-j87.dts
new file mode 100644
index 000000000000..3580fd8e3831
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j87.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 (Cellular, China), J87, iPad4,6 (A1491)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j87", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 2 (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
new file mode 100644
index 000000000000..fa0da4fa6727
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 (Cellular, China), J87m, iPad4,9 (A1601)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j87m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 3 (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
new file mode 100644
index 000000000000..b27ef5680626
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
+#include "s5l8960x-common.dtsi"
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
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
new file mode 100644
index 000000000000..4e397b3d7d7a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/*
+ * The Mini 3 seems to be only an iteration over the Mini 2 with some
+ * small changes, like the introduction of Touch ID, hence there is little
+ * to no differentiation between these 2 for now.
+ */
+#include "s5l8960x-mini2.dtsi"
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-n51.dts b/arch/arm64/boot/dts/apple/s5l8960x-n51.dts
new file mode 100644
index 000000000000..cd52f814fbf2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-n51.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s (GSM), N51, iPhone6,1 (A1453/A1533)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-5s.dtsi"
+
+/ {
+	compatible = "apple,n51", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPhone 5s (GSM)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-n53.dts b/arch/arm64/boot/dts/apple/s5l8960x-n53.dts
new file mode 100644
index 000000000000..4795798a4444
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-n53.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s (LTE), N53, iPhone6,2 (A1457/A1518/A1528/A1530)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-5s.dtsi"
+
+/ {
+	compatible = "apple,n53", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPhone 5s (LTE)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
new file mode 100644
index 000000000000..0218ecac1d83
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S5L8960X "A7" SoC
+ *
+ * Other Names: H6, "Alcatraz"
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
+			compatible = "apple,cyclone";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,cyclone";
+			reg = <0x0 0x1>;
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
+		serial0: serial@20a0a0000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0a0000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 140 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		wdt: watchdog@20e027000 {
+			compatible = "apple,s5l8960x-wdt", "apple,wdt";
+			reg = <0x2 0x0e027000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,s5l8960x-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl: pinctrl@20e300000 {
+			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0e300000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 200>;
+			apple,npins = <200>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A7 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.47.0



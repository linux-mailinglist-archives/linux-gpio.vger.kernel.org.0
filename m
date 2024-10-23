Return-Path: <linux-gpio+bounces-11816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661029ABD73
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2251F281B6E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF65C149E09;
	Wed, 23 Oct 2024 04:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eys8n0ky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4096C156C5E;
	Wed, 23 Oct 2024 04:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658782; cv=none; b=tRQ8KYeSxza6ntFHHJMGlQuWYLPIZwYI9Dilhh1tRENwj+VBVQDWsbnIaOWnP1O0FdBAdWZwljTiyYLlvthUKZRdcU0hFsLMjFYjZkzLJmCYxbLOOMINxRAs4Ba33WYrU5ygj1ltpR1oWPyoB3llVoGtbH896MNpChd1deCPfjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658782; c=relaxed/simple;
	bh=v2yz6ILW1kGDU+IedxRi1vIjNn/8gkzFtY8Yi4sVJUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmXVjMwPcCSiEPolPrNeAbTiDYj3Hc/BwMqqd0dVTVjzIE+V+0cS0DuFgXS0L7PiQdaTxlukQdfONCA4QvIvu5kq9s36817aaNo7RZTGLKQWtBhpPZjOH48VwBMXXPiSP8MRKGIc1PVBYklHbt8LRcFR+Z6mHuagsogq55LBnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eys8n0ky; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so4899221a12.3;
        Tue, 22 Oct 2024 21:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658779; x=1730263579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y7+yqrOrJvDdsiBEJdGCKVf+3/9W6oRgsxZW76uknw=;
        b=Eys8n0ky4hG5EE7PkMLngixK9Iet21iWOQBS71uywSjsKUitWIWY/Zz4Ax8XnVwgis
         rgGQ0gf/n8AQfyuWPjqk0tyzqzaUP65RPmZVvbqD+e8fNiCvxGWTpCuUCyUBAPJ0c5Pp
         IGRU2tiK7Rc6NQiJdGv12SWX3+/CDdPeUOZCqXOK3a+ELnGpo1/XJNCezvWUS0vfRBM7
         hTmheesHFwkwf7dbz6ACZisMQxBj5zK8ZQO3YsUulFU1mbIiAco0Soorh5xp5LEKrMKL
         vBEndKKc96c6wJZvTx/ngUiK/tLm2J6p1dsQknc9R9TD8/4/eS57RXynKoyd6gbBgW4N
         SHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658779; x=1730263579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y7+yqrOrJvDdsiBEJdGCKVf+3/9W6oRgsxZW76uknw=;
        b=pzE7eTi/vzF5TD7iNJgCet4OarY7wnTEhNBCHj2sj/U1q5IMofb15eBZw3SguN7fn/
         /1auVCB2/RRlQYgilg8RkoFlBh0MoIYt7jTjHCkKP5RQLYFVqgmN3IkLSW/UAKUFY67M
         VRdyn3sV2tMEwq1cpvnQBvMFSgyo8bpIlezobtGrMEtjczC4SdDZm/zDwzDsRwm40yGV
         9rFdZtxuKe2Zktd2ypQyzH+gCdmB6rmG6tusH4t+SOQg3SoirynDJF9sfzoZM21qH8BB
         z+vEd+YNTTG9H6uYdwTT/wS3JqAkDEekcdjrgxK0t8SMsV3hbz+9C5UZBc5pozc4NuXa
         1w7g==
X-Forwarded-Encrypted: i=1; AJvYcCU/OdkI+hMDUeOzi1NVoj1Ox0MSh4Tp3rLmC0ZZqVqX5T2lEHNncO5e7a048bCD322ku13CEHolzNNplA==@vger.kernel.org, AJvYcCUo2n81T210+Ch28Z7r2MFX3vbIk87xevBzOeAREDJPT17VNzMVwJeg1Ci4NKAw66wG8sDcEKUg9rZA@vger.kernel.org, AJvYcCVPOOGAsAOj2GGPjciiveWjMvR+hUeP5B9akpEHYKSCLqtU+M6DhuRQp6MK9vLyoXN0QIF721YATlZ0THyA@vger.kernel.org, AJvYcCWnyKoBdvrgZ3aUqACezKtU3nFBbrnJzW3KNgph1Us79fUUtZuWIah11ZfhEDOAXW8qQFS4zsZhJB6WwbnaU00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0jNoVlcHUnRAfRogjJ6/fWOl9uNE7P4ZzZkjblY7eqHga4Af
	2A/pyxNJJC4IvwnCMIs8qhC4v8T7JDMA2en6MnmOpiPmF9AUmAsY
X-Google-Smtp-Source: AGHT+IEorPfxzVA8JvAA4/DPkTMVrov6A/Gg9PEIGNddwVA5e4NP/YRoMFQaTUExL0bMHnL8P2fuqQ==
X-Received: by 2002:a05:6a21:e8f:b0:1cf:6d20:4d6 with SMTP id adf61e73a8af0-1d978b0a072mr1488634637.16.1729658779466;
        Tue, 22 Oct 2024 21:46:19 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:46:19 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 19/20] arm64: dts: apple: Add A11 devices
Date: Wed, 23 Oct 2024 12:40:54 +0800
Message-ID: <20241023044423.18294-20-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/Makefile          |   6 +
 arch/arm64/boot/dts/apple/t8015-8.dtsi      |  13 ++
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi  |   9 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi |  48 ++++
 arch/arm64/boot/dts/apple/t8015-d20.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8015-d201.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8015-d21.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8015-d211.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8015-d22.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8015-d221.dts    |  14 ++
 arch/arm64/boot/dts/apple/t8015-x.dtsi      |  13 ++
 arch/arm64/boot/dts/apple/t8015.dtsi        | 234 ++++++++++++++++++++
 12 files changed, 407 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-common.dtsi
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
index 000000000000..b6505b5185bd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-8.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8015.dtsi"
+#include "t8015-common.dtsi"
+
+/ {
+	chassis-type = "handset";
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
diff --git a/arch/arm64/boot/dts/apple/t8015-common.dtsi b/arch/arm64/boot/dts/apple/t8015-common.dtsi
new file mode 100644
index 000000000000..69258a33ea50
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-common.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 8, iPhone 8 Plus, iPhone X
+ *
+ * This file contains parts common to all Apple A11 devices.
+ *
+ * target-type: D20, D21, D22, D201, D211, D221
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
index 000000000000..41134ed40b89
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015-x.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone X common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8015.dtsi"
+#include "t8015-common.dtsi"
+
+/ {
+	chassis-type = "handset";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
new file mode 100644
index 000000000000..8828d830e5be
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T8015 "A11" SoC
+ *
+ * Other names: H10, "Skye"
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
2.47.0



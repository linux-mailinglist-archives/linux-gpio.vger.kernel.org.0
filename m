Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C104202D2D
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgFUVjA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgFUViz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0978DC061794;
        Sun, 21 Jun 2020 14:38:55 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id s28so12038332edw.11;
        Sun, 21 Jun 2020 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H5/rFOKDPW5u+NKPoeU24vUFSrCyXkO2dLidTVJwtTA=;
        b=H9u5SrWZjS5zq7NgimW2cZ6pgNwp8k2q0oc6X+3qCOAlMTsblJipUvLrxq7/DcZpOI
         wOzsJ1D8FJgtG51Tta4s4RbllDqNPKFxhqqLUi5SUKM1g6D3duGeLkeDkY98LiQogcpb
         SpQyENiYWOnziMS59ic1H0460+3ncew/rS6gdEsCzzyJZ8SczPP/kJNnVRfTj8Km7KOh
         aqddkbUHhLeRK1REVql4pdsRcFPFgXwxwYjix/g0XjV7dG+CPpSviPeG2plzP3rNacRP
         ElfPspkgU4NGLWW+STwDNwq36bHgkARuh5ZhPibeRijPVSVHN2yymvT1mR39fpxi8UzR
         t1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H5/rFOKDPW5u+NKPoeU24vUFSrCyXkO2dLidTVJwtTA=;
        b=V4zgtZkXBFEVgNbdv7OY3SpRyA5nr48mBNKBLOV82S9PVbHX0LRkMEOE9FAUPOCQzf
         Tk7yhddLe47fw11ixfCGWIWfgGgLmBJr/ARfOOZFHwxC+MG8Wano8H04HjZsFxeB+6KL
         ZYrjVHR6cTctSxUJ2Wzio6XK9Q7nvuoxVIh8JdjoNpk6wuE5ODz/tX4ZrkqdVk2dVae3
         FOoBPNG15NMIWkNIZJEoYd34R18C4SvauUkBxJ8e/pnLAcL0CFFUpzYA0ItmZRRzXBV1
         5tXQO/Vr2nsjPCEFao6eovkVtSTVi68LYfQ5ob4xD0h+Nmx2Qsacy1BBb7zwc7zUFVhc
         kYsA==
X-Gm-Message-State: AOAM533wQX1DdhwbjD3Dwp95UVRFqmKZEwGMhyM7Dm/PvNQEWeGCFQVe
        evU451T2t+UZc5HFScopwG4=
X-Google-Smtp-Source: ABdhPJzadCLWMYhxSnA7H5a4G4jD7oWWP/tPva7eSLtXEkLQO0nnAkcZiwbXewsdCGISRB/Z0HIlIw==
X-Received: by 2002:aa7:c583:: with SMTP id g3mr7850842edq.228.1592775533765;
        Sun, 21 Jun 2020 14:38:53 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:53 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Martin Botka <martin.botka1@gmail.com>
Subject: [PATCH 8/8] arm64: dts: qcom: Add support for Sony Xperia 10/10 Plus (Ganges platform)
Date:   Sun, 21 Jun 2020 23:38:04 +0200
Message-Id: <20200621213806.551879-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Martin Botka <martin.botka1@gmail.com>

Add device tree support for the Sony Xperia 10 and 10
Plus smartphones. They are all based on the Sony Ganges
platform (sdm630/636) and share a lot of common code.
The differences are really minor, so a Ganges-common DTSI
has been created to reduce clutter.

10 - Kirin
10 Plus - Mermaid

This platform is based on SoMC Nile, but there are some
major differences when it comes to pin configuration and
panel setup (among others).

The boards currently support:
* Screen console
* SDHCI
* I2C
* pstore log dump
* GPIO keys
* PSCI idle states

Signed-off-by: Martin Botka <martin.botka1@gmail.com>
Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  2 +
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  | 13 +++++++
 .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   | 39 +++++++++++++++++++
 .../sdm636-sony-xperia-ganges-mermaid.dts     | 19 +++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1cad7cb07574..c98bafe03a96 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,9 +16,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
new file mode 100644
index 000000000000..5326e019db20
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Martin Botka
+ */
+
+/dts-v1/;
+
+#include "sdm630-sony-xperia-ganges.dtsi"
+
+/ {
+    model = "SoMC Kirin-RoW";
+    compatible = "sony,kirin-row", "qcom,sdm630", "qcom,sdm630-mtp";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
new file mode 100644
index 000000000000..6c4c30e4cd9d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Martin Botka
+ */
+
+/dts-v1/;
+
+/* Ganges is very similar to Nile, but
+there are some differences that will need
+to be addresed when more peripherals are
+enabled upstream. Hence the separate DTSI. */
+#include "sdm630-sony-xperia-nile.dtsi"
+
+/ {
+    chosen {
+        framebuffer@9d400000 {
+            reg = <0 0x9d400000 0 (2520 * 1080 * 4)>;
+            height = <2520>;
+        };
+    };
+
+    soc {
+
+        i2c@c175000 {
+            status = "okay";
+
+            /* Novatek touchscreen */
+        };
+
+        /* Yes, this is intentional.
+        Ganges devices only use gpio-keys for
+        Volume Down, but currently there's an
+        issue with it that has to be resolved.
+        Until then, let's not make the kernel panic
+        */
+        /delete-node/ gpio-keys;
+    };
+
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
new file mode 100644
index 000000000000..97dce64d0185
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Martin Botka
+ */
+
+/dts-v1/;
+
+/* Mermaid uses sdm636, but it's different ever so slightly
+that we can ignore it for the time being. Sony also commonizes
+the Ganges platform as a whole in downstream kernels. */
+#include "sdm630-sony-xperia-ganges.dtsi"
+
+/ {
+    model = "SoMC Mermaid-RoW";
+    compatible = "sony,mermaid-row", "qcom,sdm636", "qcom,sdm636-mtp";
+
+    qcom,msm-id = <345 0>;
+    qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00 0x1001b 0x102001a 0x00 0x00>;
+};
-- 
2.27.0


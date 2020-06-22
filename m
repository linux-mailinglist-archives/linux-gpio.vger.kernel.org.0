Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E3F20310F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgFVH61 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgFVH6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:58:23 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33FEC061794;
        Mon, 22 Jun 2020 00:58:22 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id z17so919193edr.9;
        Mon, 22 Jun 2020 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WBZuUHUmNAJyQJ0TZGyLculNA255/tziYvFb0kPpSto=;
        b=jPOIKQ18ZUyOpB9JY4EhGf8gMpXTp20uWD1PGXKv/AlBLPvsvJ827/6CBP/NZfPVGq
         JZCjPBiXg4YsG3X+dbM94qXwbhA5XHdlbPzGLd0yVBsMGACyLdC1kgzoEBbA3/w2Xfjw
         r2N8lHW3Y5u9laa/sBYPp26WoF93IemSlTIjQygP1zh3EQHpDCj5lKU+/T4HYPfdZD7s
         IQHsQ01FYdrA7ECXwZd7SZ1qmoANbMElM4vmrNImpBEpw+aezh3SPjlOnqB3MP0eXRhp
         Ll6XxzrtdknIoHNrCCyIXFe5MClyvgnFYqTisOHDe6x12BVFCf9YB/q7e9ErVuQJiKfo
         6SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WBZuUHUmNAJyQJ0TZGyLculNA255/tziYvFb0kPpSto=;
        b=UAi/2TBGJI94NHm4GA5JVg+W+JAlYcCTHTIZoN5S36+0R5w4D9d2hknMUkCdh3nzZ8
         o/svocDuHfZ3rWZNDkkbbIP8P225eNRWjpjjrvVGeOEjAUnh4ByjJnebNaJiVN5OSZi5
         Gs09LqM8ntCa/6CXpqj2u5a23zU+gqCazfoDSi/5CjBTBASYLVuJIKJtxAwVeuzGEp5n
         p5AQDircz/XAdVT08auSHDwMixyNIxWfD77IieCuK/9h+WxtuUDlWN66jNx6w/6Y6q6d
         AGP+aO8rxI95SR3JIqojfdXndHCZX8G6bttH4o8YAiNSxBg7JV5sMeKxSFEp1YAb+wrk
         r5aw==
X-Gm-Message-State: AOAM533VgOWpZsYHitMyimsC70o15IjPDLp2f4fX+p+/uHhYX/i3fLal
        NSQ5f/fqTojIb5jQAB5QsOQ=
X-Google-Smtp-Source: ABdhPJx2ZT0XalvkbwuHx5OW7iVtdcQEnpB5ecmMuTwktzJcPlCzVXTmCb1qDfW/gRB4V+Ukr/8o8g==
X-Received: by 2002:a50:e387:: with SMTP id b7mr15252439edm.190.1592812701722;
        Mon, 22 Jun 2020 00:58:21 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:58:21 -0700 (PDT)
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
Subject: [PATCH v2 8/8] arm64: dts: qcom: Add support for Sony Xperia 10/10 Plus (Ganges platform)
Date:   Mon, 22 Jun 2020 09:57:46 +0200
Message-Id: <20200622075749.21925-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
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
Tested-by: Martin Botka <martin.botka1@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  2 +
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  | 13 ++++++
 .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   | 40 +++++++++++++++++++
 .../sdm636-sony-xperia-ganges-mermaid.dts     | 20 ++++++++++
 4 files changed, 75 insertions(+)
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
index 000000000000..246710a01046
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
+	model = "SoMC Kirin-RoW";
+	compatible = "sony,kirin-row", "qcom,sdm630", "qcom,sdm630-mtp";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
new file mode 100644
index 000000000000..ea051b3d14b8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Martin Botka
+ */
+
+/dts-v1/;
+
+/* Ganges is very similar to Nile, but
+ * there are some differences that will need
+ * to be addresed when more peripherals are
+ * enabled upstream. Hence the separate DTSI.
+ */
+#include "sdm630-sony-xperia-nile.dtsi"
+
+/ {
+	chosen {
+		framebuffer@9d400000 {
+			reg = <0 0x9d400000 0 (2520 * 1080 * 4)>;
+			height = <2520>;
+		};
+	};
+
+	soc {
+
+		i2c@c175000 {
+			status = "okay";
+
+			/* Novatek touchscreen */
+		};
+
+		/* Yes, this is intentional.
+		 * Ganges devices only use gpio-keys for
+		 * Volume Down, but currently there's an
+		 * issue with it that has to be resolved.
+		 * Until then, let's not make the kernel panic
+		 */
+		/delete-node/ gpio-keys;
+	};
+
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
new file mode 100644
index 000000000000..96b7782d58de
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Martin Botka
+ */
+
+/dts-v1/;
+
+/* Mermaid uses sdm636, but it's different ever so slightly
+ * that we can ignore it for the time being. Sony also commonizes
+ * the Ganges platform as a whole in downstream kernels.
+ */
+#include "sdm630-sony-xperia-ganges.dtsi"
+
+/ {
+	model = "SoMC Mermaid-RoW";
+	compatible = "sony,mermaid-row", "qcom,sdm636", "qcom,sdm636-mtp";
+
+	qcom,msm-id = <345 0>;
+	qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00 0x1001b 0x102001a 0x00 0x00>;
+};
-- 
2.27.0


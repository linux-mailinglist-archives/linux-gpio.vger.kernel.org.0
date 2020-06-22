Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC38B204043
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgFVT0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbgFVT03 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:29 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A327FC061573;
        Mon, 22 Jun 2020 12:26:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id y6so14569479edi.3;
        Mon, 22 Jun 2020 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2U/dMMO8vvITzaQfzwYXFTqqS90RuRIdsb6xN91FASM=;
        b=lKxnd67DZoWPeD4ytY01pW1gPHIzqaNiPhM9eNXKteKqbS/a/ety3CHcjEz5nphq3v
         SFng70D3WBvpPoBwcMzCPONHz56N1net2d6NJhdO5kYkPIbVJ1VsCZ2lvKmuhAP5Y/NQ
         lfhnsX+s0x6BsxTgCUORyoZEI7Hv4EG6WKQGE+Gj+/ZQo3rbFjHWIyLESJ99z4MUlEg/
         5NVdJRLjARPzZpEP60hizhx5w2EsUrqK+ry5xRZ7V79uyY3WRajvlnb9AHAw0mAodTpI
         XH+Bz0Qsp6W83hcfbbCzehP38C8QOcBZHFOa4YsA1hlkukhQCpeYS5ApSpoloVimMVX8
         475Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2U/dMMO8vvITzaQfzwYXFTqqS90RuRIdsb6xN91FASM=;
        b=Ii0iQ3rAfPil8Drx9oxgFUYFIERtCOUoJn8FgG+mEE9pyniG5Gu1tEYxRosYVEJr4z
         HQlG5JGU5IL7zO/QJTrrvCFJ0Ahx/KxZ5cnmfJH8X3r+KGTJ8gjnoJWEitadua+DlTHL
         Lya6ZlJocdLyU/MCtLrJ/mbqCxlknBCrTZ+masKfQQcvAol0Ck/eRpK2sUeauwdFAv/A
         SNsUoroo5vbqEC2dnVdt/Xjes0um3qIx3LPlPOK1C1yikPKXqyAUWnYi0cYRehPWprfa
         UYZgb1z4yD99iYUhFBkzjvqwDsG0i31PZzaieyfYd6itDE+nWGGjN+RN+YnfSbb54Cwj
         wEnQ==
X-Gm-Message-State: AOAM533+i/ZfIe6lmK06rjKJz29agVItFtxM65nnZZZtFXcaXocQnUjg
        8/LZsjbocpdMxeLVmBYRUWs=
X-Google-Smtp-Source: ABdhPJx5wgv35A/Efa8/Lo3Lhis7SYobyj4C2X9s4KX4PpCsda6Wgfhs1L2/4uEOmMUsK2KjiTectA==
X-Received: by 2002:aa7:d693:: with SMTP id d19mr14227176edr.297.1592853988316;
        Mon, 22 Jun 2020 12:26:28 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:27 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Martin Botka <martin.botka1@gmail.com>
Subject: [PATCH v3 6/7] arm64: dts: qcom: Add support for Sony Xperia 10/10 Plus (Ganges platform)
Date:   Mon, 22 Jun 2020 21:25:56 +0200
Message-Id: <20200622192558.152828-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622192558.152828-1-konradybcio@gmail.com>
References: <20200622192558.152828-1-konradybcio@gmail.com>
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
index 000000000000..46a7f2b26e6b
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
+	model = "Sony Xperia 10";
+	compatible = "sony,kirin-row", "qcom,sdm630";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
new file mode 100644
index 000000000000..cf2e8b5d60e8
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
+	/* Yes, this is intentional.
+	 * Ganges devices only use gpio-keys for
+	 * Volume Down, but currently there's an
+	 * issue with it that has to be resolved.
+	 * Until then, let's not make the kernel panic
+	 */
+	/delete-node/ gpio-keys;
+
+	soc {
+
+		i2c@c175000 {
+			status = "okay";
+
+			/* Novatek touchscreen */
+		};
+	};
+
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
new file mode 100644
index 000000000000..7c0830e6a48c
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
+	model = "Sony Xperia 10 Plus";
+	compatible = "sony,mermaid-row", "qcom,sdm636";
+
+	qcom,msm-id = <345 0>;
+	qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00 0x1001b 0x102001a 0x00 0x00>;
+};
-- 
2.27.0


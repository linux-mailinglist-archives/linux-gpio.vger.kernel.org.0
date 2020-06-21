Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A73202D33
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730868AbgFUViq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730861AbgFUVio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:44 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70A9C061794;
        Sun, 21 Jun 2020 14:38:43 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id s28so12038093edw.11;
        Sun, 21 Jun 2020 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhmx5mCIRuzTcNNs06DYJ/S3lpNd+PL784eb7QQ9WlY=;
        b=DVEz56V9AC6YaWqZHsQ/0FnltgQm6okzyN89zY4lzTvEKk997j5hQjstpu8X1TSs/4
         EOFCtP4+hL6L5QI4oS9aBtnbk7mRrHPniwXEqdfnuqy0mfEh0MARYHLJdx++OuwKg42h
         IigaPd8ehY/u01yENiVLHvFyzGdZkQTC5XpGKGADBB1Z2r3ESKzhjOMUwFeU4mB3zisM
         SXPwMEykC//tnAC5elUip+N+EOla4oi6hVv/GbxSFYsenLU0X1UaqT+rCAahkc8S2v0Y
         HIODGvA+U4M/hrynF/rgkpCiQM+ReSSU9PaQVAZ+S5Myz38PKGGupl9l0KKaQiE3R0lI
         UYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhmx5mCIRuzTcNNs06DYJ/S3lpNd+PL784eb7QQ9WlY=;
        b=SqSTtwhvBtHijt2upfx1p1/MSiyiEDFukAqvohMKRs0DQ5sWC4LLw4izPt7S7I5c4O
         Xwhw6C4FKMub6mwD8e43jgPR8/8WTi8x+jXMYFxCsPTPLcAYXI1pNHD++hoQm97ZWr+M
         s4S5PHoi60lNExj8Vlz8y0q7CFtVWvXLsEVgZjY1KunTPfF3o7lcVYDopcXwemiSse3M
         GO6dzhuL3/I+tKIQZC0JK4YsxJ5r2w+aoXuMd/wDxwU4rZ3MqBbQFD4FxKMmfuThr47A
         SWLPzKiDBBHZ9s07KLIKvMcwfwdWiRxLxY9iCabkwJZP8wF7EsptLn8jwAvTVLsMsW8Y
         B37g==
X-Gm-Message-State: AOAM5316kg8YBWd2nVcPuXK5KML71DHNJ1fXpJpaMeJhhAvz/l5D9ZMV
        VTAzN5EYrM6dnh2ixWPNb14=
X-Google-Smtp-Source: ABdhPJxGPLeLCbumICdvsJqvD+9gq2zIbug6WVQKSzmbwIwMW4kgWu1wb3e8jVDK+o7WQcC9pXvQ6Q==
X-Received: by 2002:aa7:d9d3:: with SMTP id v19mr13732051eds.364.1592775522555;
        Sun, 21 Jun 2020 14:38:42 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:42 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: qcom: pm660(l): Add base dts files
Date:   Sun, 21 Jun 2020 23:38:01 +0200
Message-Id: <20200621213806.551879-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add base DTS files for pm660(l) along with GPIOs, power-on and
rtc nodes.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi  | 60 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 45 +++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm660.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660l.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
new file mode 100644
index 000000000000..94eca5a1cf0b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+&spmi_bus {
+
+	pmic@0 {
+		compatible = "qcom,pm660", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>, <0x6100>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pon: pon@800 {
+			compatible = "qcom,pm8916-pon";
+
+			reg = <0x800>;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+
+		};
+
+		pm660_gpios: gpios@c000 {
+			compatible = "qcom,pm660-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				     <0 0xc1 0 IRQ_TYPE_NONE>,
+				     <0 0xc2 0 IRQ_TYPE_NONE>,
+				     <0 0xc3 0 IRQ_TYPE_NONE>,
+				     <0 0xc4 0 IRQ_TYPE_NONE>,
+				     <0 0xc5 0 IRQ_TYPE_NONE>,
+				     <0 0xc6 0 IRQ_TYPE_NONE>,
+				     <0 0xc7 0 IRQ_TYPE_NONE>,
+				     <0 0xc8 0 IRQ_TYPE_NONE>,
+				     <0 0xc9 0 IRQ_TYPE_NONE>,
+				     <0 0xca 0 IRQ_TYPE_NONE>,
+				     <0 0xcb 0 IRQ_TYPE_NONE>,
+				     <0 0xcc 0 IRQ_TYPE_NONE>;
+		};
+    };
+};
diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
new file mode 100644
index 000000000000..6de56b220c56
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+&spmi_bus {
+
+	pmic@2 {
+		compatible = "qcom,pm660l", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm660l_gpios: gpios@c000 {
+			compatible = "qcom,pm660l-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			interrupts = <0x2 0xc0 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc1 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc2 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc3 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc4 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc5 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc6 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc7 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc8 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xc9 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xca 0x0 IRQ_TYPE_NONE>,
+					 <0x2 0xcb 0x0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pmic@3 {
+		compatible = "qcom,pm660l", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
\ No newline at end of file
-- 
2.27.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AD2203102
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgFVH6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727870AbgFVH6M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:58:12 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C117BC061794;
        Mon, 22 Jun 2020 00:58:11 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id h28so655482edz.0;
        Mon, 22 Jun 2020 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T9nXQS24IzdAIA5rd/n9W4KYIMOEsi4rl6eO3TNMu0Y=;
        b=tfOLAiBau9aznFJa/bKhu0XtIQw1lmugYp/dimpgoc6KmzBe92ueJjdFZpvjELA4Nm
         ZTqlA5itENZuXZuUkWYY9fa2lsS+XPU3Vhn/YyJEwQFT8p4s8nK9AT6ofvulf1bjVgbk
         lY+FVeWoG/D9Vqq05R9aQUKleI6pejnbMfXZncnRlM5Tg+EL9RO3w4OWSsg5NE9Af05V
         Be6ShGVCjqff//d+WRulHapqUPUM5I4ukxOPCRic8Pi1e7yFTgHm8JG+TQgDvMwr0ggN
         M72TIK6L9HMwnVhBmoyn389e8haItIkVUxtyPETfswW2s3tZoGw5M490/2gyc49nm1ZA
         l/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T9nXQS24IzdAIA5rd/n9W4KYIMOEsi4rl6eO3TNMu0Y=;
        b=SewtVCwA8ZsCTpm3Zbc0eOJhcPFxE0YN7ltPjgF8PLhRHni3FVlQZCMN4x7WDQxrQu
         PdYl0G25A+LVvYZHY+9yqE2R6CHc6cGPKzXxl9Uy/6KGC6B+olB6BHeTMgiQ0laZ8og/
         DjUbXoAJZW5WbgBzXfkAlD/NUetYJVLg6SUpBftOpiQB8PVZllofp8yxmv6Gs1Ulbiu7
         vPXsWb2gNdyURylcGCJn7+vZgDpKmvo/fV7BTL8xpLcgPHM1k+wnJrvzR5Hfvp4aTGRf
         sMsgGTVXLtke8f/TMX4CAQtZvLbrimLhat78Hv1W9t6egDWUW8VLijmjh1TbuRAIoy4z
         FdBg==
X-Gm-Message-State: AOAM532vHfXySoFg2Nx8234SvjLcrRbWmGulAKZPK5KLwtl/Dg24dhqD
        vGvff71QFhaehw2OOmGNz7A=
X-Google-Smtp-Source: ABdhPJzGULkHG1G+P4LRMpZqGh9LrhcAVvZARST280Y+WbmTQXXRm5mm8RPLyaHGxnIkAFNIy+kw9A==
X-Received: by 2002:a05:6402:128b:: with SMTP id w11mr15075087edv.377.1592812690495;
        Mon, 22 Jun 2020 00:58:10 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:58:10 -0700 (PDT)
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
Subject: [PATCH v2 5/8] arm64: dts: qcom: pm660(l): Add base dts files
Date:   Mon, 22 Jun 2020 09:57:43 +0200
Message-Id: <20200622075749.21925-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
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
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 46 +++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm660.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660l.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
new file mode 100644
index 000000000000..041f45264255
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
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
new file mode 100644
index 000000000000..5e0f1a6e3966
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -0,0 +1,46 @@
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
+
-- 
2.27.0


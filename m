Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B3A204039
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgFVT0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgFVT0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:19 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0673C061573;
        Mon, 22 Jun 2020 12:26:18 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l12so19162279ejn.10;
        Mon, 22 Jun 2020 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pshXNbHhXYXnw+WZFtsd3zneBLkfQnAzRx2TcR6ogZ0=;
        b=FAi99I1nHYz0kRO7eOiX/PYbU8ZNfG1ju2IKR9/z/Rc9x9tHRs9ZtAJcJAM5MPj5jl
         i4RzxumtTSoxwF2hvh4NWoJ2sTRYM8xvPrzd/0YKoZmasgQWHp8liyGTqhPaMKSgYHi8
         8Fzqod1Ufrj766+5nrGw1RCVk+LTgOPrdA1bRW0uqFrqGbO163DJhk8WSIw6iXbqhoNM
         ewZCi9wkamSWpD0fjerEW3n1/LBk5OS9IlaZ9MZ7LgmD9+73XVi9sLerTuTVtEds/wnI
         jjvUk/6f0l5IE7w4aBzKLTNZSb5M0OuuNUcnPzRFc94jWXEanD150BGbVkpWCBIA/hWU
         oUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pshXNbHhXYXnw+WZFtsd3zneBLkfQnAzRx2TcR6ogZ0=;
        b=bJiWSFNY8ORdjBfO1bMd27QWaSu8JhrVGBgxz1feXnIcjaXXbhIydGzSoO27kMVF+A
         lhmKmvvjqlFwG4pttTC+K+cwuNcQ9iHGJDD/yHea3ga177ery1G9hiURD7lSclt8vmA7
         Y5nuxhbYPDK0OeeXS+QHTatdziHcqs3fJBqb4T92qAO2e3CkZd1yRFcUaG+b/wWWnidN
         XAk5AXE2WaqQkAj4DtQQ62lxWhIdnbeAHWbtG4eqVJ6hXKK5XS8RLw5+S8auFk88OKwt
         poGJ8vzZKN9cmVICDZKUn18wXjvC8oaALHEYW24Br5tNSGeSgc6ohJ+m9ja1wQz5y8tS
         xMzA==
X-Gm-Message-State: AOAM532Wsepp9mykdq7EAc9UWyGO8QjTTDMIFmHWH3jYlIhruzkp8Afw
        MCS1Nt1V1DwLmjCifE90zC0=
X-Google-Smtp-Source: ABdhPJwJZf2W307LgOuvzQU20R4yZ6SA15SrT8gvFsXlpgqM0XoO7oDMfEO+/borUAs1aFmXlEqJdw==
X-Received: by 2002:a17:906:9381:: with SMTP id l1mr17501986ejx.380.1592853977585;
        Mon, 22 Jun 2020 12:26:17 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:17 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/7] arm64: dts: qcom: pm660(l): Add base dts files
Date:   Mon, 22 Jun 2020 21:25:53 +0200
Message-Id: <20200622192558.152828-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622192558.152828-1-konradybcio@gmail.com>
References: <20200622192558.152828-1-konradybcio@gmail.com>
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
 arch/arm64/boot/dts/qcom/pm660.dtsi  | 50 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 36 ++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm660.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660l.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
new file mode 100644
index 000000000000..ea0e9558d0f2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
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
+			gpio-ranges = <&pm660_gpios 0 0 13>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			interrupt-cells =<2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
new file mode 100644
index 000000000000..edba6de02084
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
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
+			gpio-ranges = <&pm660l_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA103A7870
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhFOHwL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbhFOHwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:52:04 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76E9C0611F8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:59 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c12so12631580pfl.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEWGh/ZszZnEYAd6EoMulPU4d/kaGO0pTgHCDsGz4Qc=;
        b=NdmHfDDJMja6Ff1bYk5wf/o5oqfybhE/mIat8XEjPXGAbl7c8Ws0Gun8ej/f5DBcci
         YMy2arTcruZTcOyCyYXhNWyhst6XbucZ3ot7vDbaPA5uUQ7vhR/T+FljMXRQQE/AeRPN
         wBxMCrqcfDRF6xxTDezWXTkkKbzzjNC5uXzIXsbFPHCTXFltjAmjlhe9xeYVYx69nvPW
         KW9uj9RYOIwoHNWhLjIdYANPUAJczoIyjjjhGasBhbl/rYdbEzjL58odxhlO32dGVBuM
         uNTLTpPPNXQVW95XffzuVFEP1/nGPJo0Uzdxob8Y0Y9LDKMCQgNMZ/lnpj6OfP1pWS2N
         DBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEWGh/ZszZnEYAd6EoMulPU4d/kaGO0pTgHCDsGz4Qc=;
        b=YUYyYkucrbTHjeEQ2+xlI9zLXHFmwBNaDWjqEFPCK/nu1zyAOqMTMjo7L0t/9y1KpY
         Gr1H3JkT6AAKdUw+C6sEWKg2ebmmBUd+j2cDm37gt61G1mos10WAvbuquj/BnHdPM1V1
         NiaL6i1MRMe4RGwd61yd7VLmQnFCW2fF88Hks/9i0xZxiwsk+rjDv/HVPsPuOuE83jaL
         uhra29qkdagBnjtsphsKPm1YDPowO88+IWy9wMrNRvCB/nYP0VBvFMbugu/Bxl2E/2tg
         PiLGlALo9ke87WhQTHgoMdJwJAtRxLK50EIr5hdZCeJG8qNKr1Tkz/w/2TSVpr1P9iMh
         Yf2A==
X-Gm-Message-State: AOAM530spMOaPMtiVaGmb8Niv7clYdS+W8Df0JnEfkvS7OtNpSk27jwc
        gCfuurAbInlozFMFAzc6fBfwDQ==
X-Google-Smtp-Source: ABdhPJyTvYBq3XKAc+CpREq68XwbNZ/VjMwSWkV6zFXXZPym3V2of1RUzUtreCWYqDSFck6ZdzxpgQ==
X-Received: by 2002:aa7:8641:0:b029:2f4:7263:5524 with SMTP id a1-20020aa786410000b02902f472635524mr3369824pfo.70.1623743399373;
        Tue, 15 Jun 2021 00:49:59 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:59 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 09/10] arm64: dts: qcom: pmm8155au_2: Add base dts file
Date:   Tue, 15 Jun 2021 13:15:42 +0530
Message-Id: <20210615074543.26700-10-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add base DTS file for pmm8155au_2 along with GPIOs, power-on, rtc and vadc
nodes.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi | 107 ++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
new file mode 100644
index 000000000000..0c7d7a66c0b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmm8155au-2-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmm8155au_2_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmic@4 {
+		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		power-on@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x0800>;
+
+			status = "disabled";
+		};
+
+		pmm8155au_2_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pmm8155au_2_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmm8155au_2_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			ref-gnd@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			vref-1p25@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+				label = "vref_1p25";
+			};
+
+			die-temp@6 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "die_temp";
+			};
+		};
+
+		pmm8155au_2_gpios: gpio@c000 {
+			compatible = "qcom,pmm8155au-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@5 {
+		compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.31.1


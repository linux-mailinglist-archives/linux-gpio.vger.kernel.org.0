Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B1E621C61
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 19:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiKHSrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 13:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiKHSrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 13:47:21 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A7B121251
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 10:45:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so22482439lfv.5
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzEPJbkqHBQEWoa6rFG7p/mkYNz0OWTLUuuLecIZFeI=;
        b=L0mhB5v6fHxpQ8pgliQVw+sB0+u7sMSM4CSB8+LqyL8uSq2L9+fcFvNR9IxYxnAYRC
         Qb3T/hl+lxz61ihlD2bF+xn+kbenGqOTfl/wH2MfZOEYXzq29gpGliTFAFP9uCjDtniL
         5ZTwJy0QOs+Gop2fSyYYd9c57xoTa1YD1ATOihmWKkDm9+WyF/ZmemVMOnMF/bUIcFTj
         QQ6JoQCu4deoVIxAcy1aP1ZJ5XWLKPy0v171WfijALqiPesTnjCDnE3ghmFlOAeWkuVb
         XLusipa88Vs5YKhhpv2CkUJcXx5C4MxDo0VX3qb3L9zeiLROMeIqfhML1Bx3higosvCL
         Yu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzEPJbkqHBQEWoa6rFG7p/mkYNz0OWTLUuuLecIZFeI=;
        b=FPlwulBGeLX+JFMnarX+2xGDk6yNILOVQefIabX/+iL2p99yd1Sf5uIg/mu0DCcx7r
         QlwjQRQHWH5Z1T6cJ3b5W0AdcUb12lrAuVPqkvArJSpJasz3hfenybKcvPfeeyIRO1UI
         3lQfkC/7b+aBhnqWUxqV6BV6LuWe4SNIdb0cwtHvOYO/slo9dBmczQWQB/X+Yp2lfjAh
         UZ8TJJkoT3qyifYfEz3DvjM2LL0X3tayYsF/mOeqcPamE45JRFqE4AbSX6coCwaxAd1I
         2rHcXZMr5heeJyXoI5E0WKeRo3LfHpxWQ+E3/uTfFsTdnSu4Ic9pJSIQMXS+cWQxos1S
         gRDQ==
X-Gm-Message-State: ANoB5pn3e8tPTB1sPee8YcTl9vdyqNv1ROyjrxYhjfv7iyg9T6laYqn4
        RY+u/H4pzIcq2LgimCicplLOQw==
X-Google-Smtp-Source: AA0mqf7LYyidScDn4AIXIcRKO6X9wtSvQbv8d5t5Lo+UKrZSkugD+BJLXGg9pCBIaGBSdsS5qgrZLA==
X-Received: by 2002:ac2:515b:0:b0:4b3:c40b:7284 with SMTP id q27-20020ac2515b000000b004b3c40b7284mr3634202lfd.667.1667933134547;
        Tue, 08 Nov 2022 10:45:34 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id be13-20020a056512250d00b004a8b9c68735sm1890611lfb.102.2022.11.08.10.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:45:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ARM: dts: qcom-msm8960: use define for interrupt constants
Date:   Tue,  8 Nov 2022 19:45:28 +0100
Message-Id: <20221108184529.26857-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108184529.26857-1-krzysztof.kozlowski@linaro.org>
References: <20221108184529.26857-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace GIC_PPI, GIC_SPI and interrupt type numbers with appropriate
defines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960-cdp.dts |  2 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi    | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index cb0f612e6c90..3a484ac53917 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -42,7 +42,7 @@ ethernet@0 {
 		compatible = "micrel,ks8851";
 		reg = <0>;
 		interrupt-parent = <&msmgpio>;
-		interrupts = <90 8>;
+		interrupts = <90 IRQ_TYPE_LEVEL_LOW>;
 		spi-max-frequency = <5400000>;
 		vdd-supply = <&ext_l2>;
 		vdd-io-supply = <&pm8921_lvs6>;
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 30abf53b062d..2f32e734f18d 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -17,7 +17,7 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		interrupts = <1 14 0x304>;
+		interrupts = <GIC_PPI 14 0x304>;
 
 		cpu@0 {
 			compatible = "qcom,krait";
@@ -52,7 +52,7 @@ memory {
 
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
-		interrupts = <1 10 0x304>;
+		interrupts = <GIC_PPI 10 0x304>;
 		qcom,no-pc-write;
 	};
 
@@ -105,9 +105,9 @@ intc: interrupt-controller@2000000 {
 		timer@200a000 {
 			compatible = "qcom,kpss-timer",
 				     "qcom,kpss-wdt-msm8960", "qcom,msm-timer";
-			interrupts = <1 1 0x301>,
-				     <1 2 0x301>,
-				     <1 3 0x301>;
+			interrupts = <GIC_PPI 1 0x301>,
+				     <GIC_PPI 2 0x301>,
+				     <GIC_PPI 3 0x301>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>,
 					  <32768>;
@@ -119,7 +119,7 @@ msmgpio: pinctrl@800000 {
 			gpio-controller;
 			gpio-ranges = <&msmgpio 0 0 152>;
 			#gpio-cells = <2>;
-			interrupts = <0 16 0x4>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			reg = <0x800000 0x4000>;
@@ -255,7 +255,7 @@ ssbi@500000 {
 			pmicintc: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&msmgpio>;
-				interrupts = <104 8>;
+				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
@@ -265,7 +265,8 @@ pwrkey@1c {
 					compatible = "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
 					interrupt-parent = <&pmicintc>;
-					interrupts = <50 1>, <51 1>;
+					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+						     <51 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15625>;
 					pull-up;
 				};
@@ -274,7 +275,8 @@ keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
 					interrupt-parent = <&pmicintc>;
-					interrupts = <74 1>, <75 1>;
+					interrupts = <74 IRQ_TYPE_EDGE_RISING>,
+						     <75 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15>;
 					scan-delay = <32>;
 					row-hold = <91500>;
@@ -283,7 +285,7 @@ keypad@148 {
 				rtc@11d {
 					compatible = "qcom,pm8921-rtc";
 					interrupt-parent = <&pmicintc>;
-					interrupts = <39 1>;
+					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 					reg = <0x11d>;
 					allow-set-time;
 				};
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421D65ECB01
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbiI0Rhq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbiI0Rhb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:37:31 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42151D2D30
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:37:29 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q17so11694374lji.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2gDOzllem5f8xWJ1rmunAEBHFIGtwMgu8HM0Bmh8ICk=;
        b=WJP3fV2Q7OvVWv20B85q9E9abA0wUp+3TcCIvqss0hhdo169gSAFQmjITOMM79r/cF
         IEQTObSsV3ixg+t74eJrToQOI3T0NoKVLx+swqyAYSIPFsD/mLn6zTL4ZPS0Yiglnvis
         Xk/2CQ/IoUTSrGykuyLsee5EZmoQTIAru8Cw29xx+QJPruf6T+bU9K/DMFT/DqDS/OYM
         CiyXLNPS4VNe4XifyXkdnEbbKPBIMPDd3wE1FFq+RwHQCCWSLBQm5mhX1ZAYPunrDy0G
         ZNKcTZKbOb9hRBiXhsExbAwnnUNEzEqlmylkPZcm4SS+p1N6XnZkDQa2E6y0D3UG2Bdh
         YPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2gDOzllem5f8xWJ1rmunAEBHFIGtwMgu8HM0Bmh8ICk=;
        b=YS9hWWCnRBzyKoPZxOeo3N0uCjkw4MGe0YKiyHzHR7yL/09t27YlZhXDAgJKaK+Ina
         lUgLQ0XbICTA1eB7BD/3Hh44jpmkcdknbuoXcwSuRJVbaMrIfpoNU+Vx1o6oXyU0R8l0
         q0mtzoQM1B1PqbJSVST9JZAVgzuq0e3ff6fWHb2Afm8zJSJzQPVWOFUnaejc8+nEnAG3
         Ude9DXxA7v3o3vgT0dNh7vgcHCCmWr7RsG445PS/1LjGq7O1WPV63oNq28Z1GnfPsG7N
         iszE43I9BESMFcdtE+Bw/LEvySxwUgt/VMmKGTFs98EjImhwboQvfConsOD0yg8HKdt7
         /SOg==
X-Gm-Message-State: ACrzQf39Mw3pYxfPfR1j+5CR1d94C2kMx87d3g395ZFwXaNh/DFLu3Gu
        uA8xgb5LQI00tnaOKpMvM5FhEQ==
X-Google-Smtp-Source: AMsMyM6rjB1apNAfb54OVA4H36PboTUlevCYnl10/fkRfE7nO5+LOQXdEt1vVpxlV0K8JxhUTWZvzw==
X-Received: by 2002:a05:651c:1a23:b0:26b:fcbf:5c29 with SMTP id by35-20020a05651c1a2300b0026bfcbf5c29mr9500452ljb.307.1664300249271;
        Tue, 27 Sep 2022 10:37:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 05/34] ARM: dts: qcom: msm8226: align TLMM pin configuration with DT schema
Date:   Tue, 27 Sep 2022 19:36:33 +0200
Message-Id: <20220927173702.5200-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts |  6 +++---
 arch/arm/boot/dts/qcom-msm8226.dtsi         | 24 ++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
index 193569f0ca5f..02bef5870526 100644
--- a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
@@ -299,8 +299,8 @@ bluetooth_default_state: bluetooth-default-state {
 		input-enable;
 	};
 
-	touch_pins: touch {
-		irq {
+	touch_pins: touch-state {
+		irq-pins {
 			pins = "gpio17";
 			function = "gpio";
 
@@ -309,7 +309,7 @@ irq {
 			input-enable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio16";
 			function = "gpio";
 
diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index cf2d56929428..3b6e746a4af9 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -354,35 +354,35 @@ tlmm: pinctrl@fd510000 {
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
-			blsp1_i2c1_pins: blsp1-i2c1 {
+			blsp1_i2c1_pins: blsp1-i2c1-state {
 				pins = "gpio2", "gpio3";
 				function = "blsp_i2c1";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c2_pins: blsp1-i2c2 {
+			blsp1_i2c2_pins: blsp1-i2c2-state {
 				pins = "gpio6", "gpio7";
 				function = "blsp_i2c2";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c3_pins: blsp1-i2c3 {
+			blsp1_i2c3_pins: blsp1-i2c3-state {
 				pins = "gpio10", "gpio11";
 				function = "blsp_i2c3";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c4_pins: blsp1-i2c4 {
+			blsp1_i2c4_pins: blsp1-i2c4-state {
 				pins = "gpio14", "gpio15";
 				function = "blsp_i2c4";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_i2c5_pins: blsp1-i2c5 {
+			blsp1_i2c5_pins: blsp1-i2c5-state {
 				pins = "gpio18", "gpio19";
 				function = "blsp_i2c5";
 				drive-strength = <2>;
@@ -390,13 +390,13 @@ blsp1_i2c5_pins: blsp1-i2c5 {
 			};
 
 			sdhc1_default_state: sdhc1-default-state {
-				clk {
+				clk-pins {
 					pins = "sdc1_clk";
 					drive-strength = <10>;
 					bias-disable;
 				};
 
-				cmd-data {
+				cmd-data-pins {
 					pins = "sdc1_cmd", "sdc1_data";
 					drive-strength = <10>;
 					bias-pull-up;
@@ -404,13 +404,13 @@ cmd-data {
 			};
 
 			sdhc2_default_state: sdhc2-default-state {
-				clk {
+				clk-pins {
 					pins = "sdc2_clk";
 					drive-strength = <10>;
 					bias-disable;
 				};
 
-				cmd-data {
+				cmd-data-pins {
 					pins = "sdc2_cmd", "sdc2_data";
 					drive-strength = <10>;
 					bias-pull-up;
@@ -418,21 +418,21 @@ cmd-data {
 			};
 
 			sdhc3_default_state: sdhc3-default-state {
-				clk {
+				clk-pins {
 					pins = "gpio44";
 					function = "sdc3";
 					drive-strength = <8>;
 					bias-disable;
 				};
 
-				cmd {
+				cmd-pins {
 					pins = "gpio43";
 					function = "sdc3";
 					drive-strength = <8>;
 					bias-pull-up;
 				};
 
-				data {
+				data-pins {
 					pins = "gpio39", "gpio40", "gpio41", "gpio42";
 					function = "sdc3";
 					drive-strength = <8>;
-- 
2.34.1


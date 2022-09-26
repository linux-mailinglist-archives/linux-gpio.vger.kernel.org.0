Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE3A5E9ABD
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbiIZHpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbiIZHog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:44:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A62E2A
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id s6so9478123lfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IKv3EVCnm3OfvhFspuLmPC8QUak40NUPqPQWboNeqpg=;
        b=V3mShK9//cljP5qZ4dTI4+fgelJmWKxSgGFMuLm0Yq+Ey/YO4cqEmBvVSOwGXOKrGx
         HotnKiTQqXerSqH1TepXNryXWACnSfXVsGwiQeEvG4nINYuDGh5UET3gaHy9BvGtGgxD
         k+ADlah2EcyZ9vYP0KYYMBcXcuWtPZ19+Pt55yldvNETFiOaTtNc8ojVZXHeimaMGqqy
         j2OGTXpkNptN5hkpXQrKO25ivTrXP2x6phK/Dy2reWo+Tfdr9ixCuVakD8RuyqvLWKSL
         qkNSkpdv4Nb9xMP/5OAGdJ+d1ZirWZNJCVmvFrgmCSvdMnXiTSjyZ4/i7nXAwrorVP0d
         GP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IKv3EVCnm3OfvhFspuLmPC8QUak40NUPqPQWboNeqpg=;
        b=5XwFQvUlGA/7wiD8OFnRtArjExlwR0u7VgPT/PC4gdxzVpJAt6tjbMXsZHRElOwAlQ
         QdDL1DQvow3LSVKTzC6zXJCDWQpdMA3LK9Z+9SQNP96NXUa0dlk5RFQzQYG/di0Arei9
         a2bd+oAKISZilQ3j3WIRkFeJRFK7zmUVAbDop5F6N363EZFgu1GAEhtjhNOBRJQG1w4i
         6eIlb+MURaD89u+iXHHqwZHZ/q76HuCzVAHEUiH1KmQkUpSCtZJvAIS1hsL22eQ7q2Ko
         z05drdMcHKT52Xbt1IXkBcbevHX9tcY6bbNhdGRffohpLfDHZe/ZcPYcawSY9w3mNsbH
         wvdQ==
X-Gm-Message-State: ACrzQf05co1Fmww9RHjXRXXMLNrJU30N8hYCpJfm++5T5N9sBTNYvBI/
        Hyk8oGrCSiPZpogAUdi8skpWYw==
X-Google-Smtp-Source: AMsMyM6nfzvoOyFOLjtGHePJbMJOkx9zhgZSCJhspV+ttu/RLvJSatK2TulL9EP/ENUCkJTJ18VUrA==
X-Received: by 2002:a05:6512:3e0d:b0:499:5283:c3f3 with SMTP id i13-20020a0565123e0d00b004995283c3f3mr8042762lfv.27.1664178273297;
        Mon, 26 Sep 2022 00:44:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:32 -0700 (PDT)
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
Subject: [PATCH v2 05/33] ARM: dts: qcom: msm8226: align TLMM pin configuration with DT schema
Date:   Mon, 26 Sep 2022 09:43:47 +0200
Message-Id: <20220926074415.53100-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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


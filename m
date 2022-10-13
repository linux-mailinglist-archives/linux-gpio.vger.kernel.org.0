Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA63A5FE23D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 20:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiJMS5w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 14:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiJMS50 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 14:57:26 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889A1A4841
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 11:55:21 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id j21so1038338qkk.9
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkySimfwdcfIOm1BHHXpXjDR8WcuMLu724SetbjPVVI=;
        b=R7vFk7v6AmSxR3TbFWOaciWpNFxIgfya5M3tQbqxyI+kv0D88S3X3m18xllOncO4NU
         n3db8l7pg4NBol5biYZvOMBLud83GQzilIEdVM+ZymtVnlB+zz5drtPLQAKd0DCzXbiX
         hHukF5nDE37TW76ijbQMxDKeKo7mmxPKR1/RSwtdbgE64N466bT6kclwsxkvuGQtb11b
         VVfsMcoSrHIMO5RDPHKUYv7ttR9fovPqPI2kyq7JKvZO36mYCi3I23PXANkcGmGCmKT1
         egKnSTVs7IfiRX6PVhqZZrTfYBxoX/xXVXbOxIzoWNtEIxgQGSKVe04kQbXeA4NzfgCh
         OcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkySimfwdcfIOm1BHHXpXjDR8WcuMLu724SetbjPVVI=;
        b=hLOeDAzWVu17Kj2BEv4scB4ujokV4h1i6YIy0eoOOtOVO5HKW6Cvh0ZStWWIKDUl56
         +TIXh/rqvDQQntHjdM07WMqdpbfVO0RapP5yN9ppiZd2RtxNuVW8pImj0B3Q2Qi5hWC5
         oarTqhsS/tcsAH0eFvm2nVmX1bz/kVrQ7gmJPul3h+KkXaFEXPXPsUTicF4vnTNKc6Tr
         4MyTMunV88ghlCWMloYEyJqNG8BlUBJgFtlwVgU+FDhfCtTv/5DYitrwpE8Gxo4vQmmH
         jcwLQqpk4HgYN2+drg91KMd3mfqdJnoX0vE5YXZ1kN3xHLNg9D5uevFfq+6xkCx+0aRX
         E2bw==
X-Gm-Message-State: ACrzQf1A3iFBXcifDYcHJfBIet2YLEx5XE1LtP1ihWniYtHSXn7leMAF
        GMmm/Vp6CZsE+nv55VbqJ3Mg8Q==
X-Google-Smtp-Source: AMsMyM516RsY7VlwMShQ6oXPCm2KyfjIwg5DGX1wAL7/0rpY60X741Edo4Y1/lX0eFnQXtns4y1uYA==
X-Received: by 2002:a05:620a:28cd:b0:6cf:93b3:a78 with SMTP id l13-20020a05620a28cd00b006cf93b30a78mr1099988qkp.11.1665687318312;
        Thu, 13 Oct 2022 11:55:18 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id k13-20020a05620a0b8d00b006cdd0939ffbsm345983qkh.86.2022.10.13.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 11:55:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8994: Align TLMM pin configuration with DT schema
Date:   Thu, 13 Oct 2022 14:53:13 -0400
Message-Id: <20221013185314.91266-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013185314.91266-1-krzysztof.kozlowski@linaro.org>
References: <20221013185314.91266-1-krzysztof.kozlowski@linaro.org>
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

Order the "function" and "pins" property to match other DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v1:
1. Add Rb tag.
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   8 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |   6 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 130 +++++++++---------
 3 files changed, 74 insertions(+), 70 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index f9d8bd09e074..63568f73e9d3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -881,28 +881,28 @@ &sdhc2 {
 };
 
 &tlmm {
-	grip_default: grip-default {
+	grip_default: grip-default-state {
 		pins = "gpio39";
 		function = "gpio";
 		drive-strength = <6>;
 		bias-pull-down;
 	};
 
-	grip_sleep: grip-sleep {
+	grip_sleep: grip-sleep-state {
 		pins = "gpio39";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
 	};
 
-	hall_front_default: hall-front-default {
+	hall_front_default: hall-front-default-state {
 		pins = "gpio42";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
-	hall_back_default: hall-back-default {
+	hall_back_default: hall-back-default-state {
 		pins = "gpio75";
 		function = "gpio";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index ff60b7004d26..a390af54c715 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -477,15 +477,17 @@ &sdhc2 {
 };
 
 &tlmm {
-	ts_int_active: ts-int-active {
+	ts_int_active: ts-int-active-state {
 		pins = "gpio42";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 		input-enable;
 	};
 
-	ts_reset_active: ts-reset-active {
+	ts_reset_active: ts-reset-active-state {
 		pins = "gpio109";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 		output-low;
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 7a582a5fe3a8..ba687e64ba3c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -773,254 +773,256 @@ tlmm: pinctrl@fd510000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
-			blsp1_uart2_default: blsp1-uart2-default {
-				function = "blsp_uart2";
+			blsp1_uart2_default: blsp1-uart2-default-state {
 				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
 				drive-strength = <16>;
 				bias-disable;
 			};
 
-			blsp1_uart2_sleep: blsp1-uart2-sleep {
-				function = "gpio";
+			blsp1_uart2_sleep: blsp1-uart2-sleep-state {
 				pins = "gpio4", "gpio5";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-pull-down;
 			};
 
-			blsp2_uart2_default: blsp2-uart2-default {
+			blsp2_uart2_default: blsp2-uart2-default-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio48";
 				function = "blsp_uart8";
-				pins = "gpio45", "gpio46",
-						"gpio47", "gpio48";
 				drive-strength = <16>;
 				bias-disable;
 			};
 
-			blsp2_uart2_sleep: blsp2-uart2-sleep {
+			blsp2_uart2_sleep: blsp2-uart2-sleep-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio48";
 				function = "gpio";
-				pins = "gpio45", "gpio46",
-						"gpio47", "gpio48";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c1_default: i2c1-default {
-				function = "blsp_i2c1";
+			i2c1_default: i2c1-default-state {
 				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c1_sleep: i2c1-sleep {
-				function = "gpio";
+			i2c1_sleep: i2c1-sleep-state {
 				pins = "gpio2", "gpio3";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c2_default: i2c2-default {
-				function = "blsp_i2c2";
+			i2c2_default: i2c2-default-state {
 				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c2_sleep: i2c2-sleep {
-				function = "gpio";
+			i2c2_sleep: i2c2-sleep-state {
 				pins = "gpio6", "gpio7";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c4_default: i2c4-default {
-				function = "blsp_i2c4";
+			i2c4_default: i2c4-default-state {
 				pins = "gpio19", "gpio20";
+				function = "blsp_i2c4";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c4_sleep: i2c4-sleep {
-				function = "gpio";
+			i2c4_sleep: i2c4-sleep-state {
 				pins = "gpio19", "gpio20";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-pull-down;
 				input-enable;
 			};
 
-			i2c5_default: i2c5-default {
-				function = "blsp_i2c5";
+			i2c5_default: i2c5-default-state {
 				pins = "gpio23", "gpio24";
+				function = "blsp_i2c5";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c5_sleep: i2c5-sleep {
-				function = "gpio";
+			i2c5_sleep: i2c5-sleep-state {
 				pins = "gpio23", "gpio24";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c6_default: i2c6-default {
-				function = "blsp_i2c6";
+			i2c6_default: i2c6-default-state {
 				pins = "gpio28", "gpio27";
+				function = "blsp_i2c6";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c6_sleep: i2c6-sleep {
-				function = "gpio";
+			i2c6_sleep: i2c6-sleep-state {
 				pins = "gpio28", "gpio27";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c7_default: i2c7-default {
-				function = "blsp_i2c7";
+			i2c7_default: i2c7-default-state {
 				pins = "gpio44", "gpio43";
+				function = "blsp_i2c7";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c7_sleep: i2c7-sleep {
-				function = "gpio";
+			i2c7_sleep: i2c7-sleep-state {
 				pins = "gpio44", "gpio43";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp2_spi10_default: blsp2-spi10-default {
-				default {
-					function = "blsp_spi10";
+			blsp2_spi10_default: blsp2-spi10-default-state {
+				default-pins {
 					pins = "gpio53", "gpio54", "gpio55";
+					function = "blsp_spi10";
 					drive-strength = <10>;
 					bias-pull-down;
 				};
-				cs {
-					function = "gpio";
+
+				cs-pins {
 					pins = "gpio67";
+					function = "gpio";
 					drive-strength = <2>;
 					bias-disable;
 				};
 			};
 
-			blsp2_spi10_sleep: blsp2-spi10-sleep {
+			blsp2_spi10_sleep: blsp2-spi10-sleep-state {
 				pins = "gpio53", "gpio54", "gpio55";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c11_default: i2c11-default {
-				function = "blsp_i2c11";
+			i2c11_default: i2c11-default-state {
 				pins = "gpio83", "gpio84";
+				function = "blsp_i2c11";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			i2c11_sleep: i2c11-sleep {
-				function = "gpio";
+			i2c11_sleep: i2c11-sleep-state {
 				pins = "gpio83", "gpio84";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			blsp1_spi1_default: blsp1-spi1-default {
-				default {
-					function = "blsp_spi1";
+			blsp1_spi1_default: blsp1-spi1-default-state {
+				default-pins {
 					pins = "gpio0", "gpio1", "gpio3";
+					function = "blsp_spi1";
 					drive-strength = <10>;
 					bias-pull-down;
 				};
-				cs {
-					function = "gpio";
+
+				cs-pins {
 					pins = "gpio8";
+					function = "gpio";
 					drive-strength = <2>;
 					bias-disable;
 				};
 			};
 
-			blsp1_spi1_sleep: blsp1-spi1-sleep {
+			blsp1_spi1_sleep: blsp1-spi1-sleep-state {
 				pins = "gpio0", "gpio1", "gpio3";
+				function = "gpio";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			sdc1_clk_on: clk-on {
+			sdc1_clk_on: clk-on-state {
 				pins = "sdc1_clk";
 				bias-disable;
 				drive-strength = <16>;
 			};
 
-			sdc1_clk_off: clk-off {
+			sdc1_clk_off: clk-off-state {
 				pins = "sdc1_clk";
 				bias-disable;
 				drive-strength = <2>;
 			};
 
-			sdc1_cmd_on: cmd-on {
+			sdc1_cmd_on: cmd-on-state {
 				pins = "sdc1_cmd";
 				bias-pull-up;
 				drive-strength = <8>;
 			};
 
-			sdc1_cmd_off: cmd-off {
+			sdc1_cmd_off: cmd-off-state {
 				pins = "sdc1_cmd";
 				bias-pull-up;
 				drive-strength = <2>;
 			};
 
-			sdc1_data_on: data-on {
+			sdc1_data_on: data-on-state {
 				pins = "sdc1_data";
 				bias-pull-up;
 				drive-strength = <8>;
 			};
 
-			sdc1_data_off: data-off {
+			sdc1_data_off: data-off-state {
 				pins = "sdc1_data";
 				bias-pull-up;
 				drive-strength = <2>;
 			};
 
-			sdc1_rclk_on: rclk-on {
+			sdc1_rclk_on: rclk-on-state {
 				pins = "sdc1_rclk";
 				bias-pull-down;
 			};
 
-			sdc1_rclk_off: rclk-off {
+			sdc1_rclk_off: rclk-off-state {
 				pins = "sdc1_rclk";
 				bias-pull-down;
 			};
 
-			sdc2_clk_on: sdc2-clk-on {
+			sdc2_clk_on: sdc2-clk-on-state {
 				pins = "sdc2_clk";
 				bias-disable;
 				drive-strength = <10>;
 			};
 
-			sdc2_clk_off: sdc2-clk-off {
+			sdc2_clk_off: sdc2-clk-off-state {
 				pins = "sdc2_clk";
 				bias-disable;
 				drive-strength = <2>;
 			};
 
-			sdc2_cmd_on: sdc2-cmd-on {
+			sdc2_cmd_on: sdc2-cmd-on-state {
 				pins = "sdc2_cmd";
 				bias-pull-up;
 				drive-strength = <10>;
 			};
 
-			sdc2_cmd_off: sdc2-cmd-off {
+			sdc2_cmd_off: sdc2-cmd-off-state {
 				pins = "sdc2_cmd";
 				bias-pull-up;
 				drive-strength = <2>;
 			};
 
-			sdc2_data_on: sdc2-data-on {
+			sdc2_data_on: sdc2-data-on-state {
 				pins = "sdc2_data";
 				bias-pull-up;
 				drive-strength = <10>;
 			};
 
-			sdc2_data_off: sdc2-data-off {
+			sdc2_data_off: sdc2-data-off-state {
 				pins = "sdc2_data";
 				bias-pull-up;
 				drive-strength = <2>;
-- 
2.34.1


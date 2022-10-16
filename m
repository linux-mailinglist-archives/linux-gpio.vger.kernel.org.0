Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24883600197
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiJPRBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiJPRBo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:01:44 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFC9386A4
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:33 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id o2so5420528qkk.10
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gDOzllem5f8xWJ1rmunAEBHFIGtwMgu8HM0Bmh8ICk=;
        b=nj1vYsfMuKC+iQPiJxOv6EfGyqYNQGz/Txa2Hnm7uTdrIhQgTacyIWebpQ5erDmv4i
         T3md/c6yXLDitbivSaD/eLE0sr43iSJRbjp79ro1x6pADb6rP57w5dZs2cebFImubZ+w
         D+ig4J0GnP0wxEzDjeA0wwiDTks7jsyOjlC9OIUo8lWwZjHAFq7AgyUMNJ/Hgt1f8aXb
         JSJewQhr5NupVDewDhJhBfOJP2paR4lmp6hZSpD6nX/OKwIDZgHK1NvqztoKiAqZNtEY
         XYJB06JJKTkzEY1a8n8u2SKh7hH+tDGaPU+jtpUmjvnj7kb07l/z4EWZ15WGBx3jefqo
         npXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gDOzllem5f8xWJ1rmunAEBHFIGtwMgu8HM0Bmh8ICk=;
        b=FxaL05+9z196DKg212f1vjoKE5Fo8p2+a3VMhGRt0pguJ4ruY0agIDzngnqVJ9Kh2u
         efhr6nijeQbDYciVmeqeCVVF4/mnRFidPDR3Ew+/2gEe3o4sfsEHcf0dihnLYKEzYncS
         1ucpf3srXji+DjpR8E/EWRh4KD7rF2FWRcn2jm93s5dLoQTyiRHqWHVMMDmCqM0MX7/C
         kY+AbhApxJHC60gF+Qx7G0SqeES/WxHu4Wli1Ill+yvgS4kWYWqV6VFk4et2c4EdqXU9
         kHTBEihe3lhfaVcxKblqwma2Cnhu4MF/eDSNrRX6Mj1vm3VY0RGP/9Q2yrbXLCJrQz8Z
         bFmA==
X-Gm-Message-State: ACrzQf2mgGRiggS8W9DuiL+9OEAgA2BX17DZf9krGhq5202bUUBDh8m1
        veO/OWBYXRaL1O3qgBYlef//Og==
X-Google-Smtp-Source: AMsMyM5fTKgEKuEUbSSj5gy8/MlFnGXnnJysYJjlCGpndk4jQ8RVI8wL/2Rvd/vopuFmWInYlSi4HQ==
X-Received: by 2002:a05:620a:1648:b0:6ec:9ad4:9ea3 with SMTP id c8-20020a05620a164800b006ec9ad49ea3mr5139324qko.50.1665939692483;
        Sun, 16 Oct 2022 10:01:32 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:30 -0700 (PDT)
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
Subject: [PATCH v5 05/34] ARM: dts: qcom: msm8226: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:00:06 -0400
Message-Id: <20221016170035.35014-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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


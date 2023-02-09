Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5477690181
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Feb 2023 08:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjBIHp2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 02:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjBIHp1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 02:45:27 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAA9196
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 23:45:24 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3232363wma.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 23:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsTN9eojGczStqv1TPLZ5iFIwejDPHD4ltG8erMzZvE=;
        b=AEVmme3hAlOXspoKKosGhZO2q1YxYiewjqxj+Ww51AVDwiM0/0kBoBIOeHYiTSxzDW
         1Jhns8X6i3SbAOP3noSNLAgololWlshKzRpbDA1EAZj+HwiECCo5DZ/wRtgpFfH2Ai66
         TzrrjaSRSu6zSGtfJqPSZmi1fTEVjcUZHU0pV0vgW79V9jOKMw1ufoLjn6snXLWcjXaE
         tdi9ke0d5C/ifs5P/klf0UwCUWoANJhpaoD0tAxdySL4/VhDFQ21MLOtku4RHx2Zt67L
         FAyVnuIN/TnXCI9Pbdi9I1fv8ZJUkJPXa8qEvCHmbt3ZvnCFM7qty6nNgVeFPY+l1SD7
         uKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsTN9eojGczStqv1TPLZ5iFIwejDPHD4ltG8erMzZvE=;
        b=xdKtZxvAZXwFnz101WKl+A7bi9qqBifV0z8WWGZgpJPQv7Vzz+GSHpRNC2ZnYuolDw
         7s4V1WaxGP+30vTYBtQePlnjcBqesSkuUTU64uFCg7SzWeCXCGKC9lgOBmXo3kIhe/tb
         on3pWcrgi7jWHXIum1qD6ejlcyvT5Or3BJGZput+j+G2DnTNJq+Xep+XEr4KRZSdEImV
         PopNltpv4y/ZZxCIx8quiQ1Z19IiCg3/GVIRPMorQRwsIkebxuie7WqvNQozzbIX0GLN
         PtJiBvkeI6N28+1Z2R2AYvWpQEm1cH5vUJoN/BvTgGHQvIE2h5XPeCc82c/0eFYBW72C
         a3aQ==
X-Gm-Message-State: AO0yUKVPNYIlIyYaCRe/RHfKEmO1rR3vZmgDm/togTl4vu8OsgSvNzeG
        Oab7s6JpVaJvv7ziSEF7IxvFbw==
X-Google-Smtp-Source: AK7set8C6ruKRM9txpLcVKF635TZ3HNJWJPX/zRC5mAxoAbFRHXEQzg1+M4EiuR4UFtdJJ3J+f2ZLQ==
X-Received: by 2002:a05:600c:807:b0:3dc:eaef:c1bb with SMTP id k7-20020a05600c080700b003dceaefc1bbmr8916773wmp.35.1675928723289;
        Wed, 08 Feb 2023 23:45:23 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003da28dfdedcsm1115472wmq.5.2023.02.08.23.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 23:45:22 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: sm8550: Add bias pull up value to tlmm i2c data clk states
Date:   Thu,  9 Feb 2023 09:45:10 +0200
Message-Id: <20230209074510.4153294-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209074510.4153294-1-abel.vesa@linaro.org>
References: <20230209074510.4153294-1-abel.vesa@linaro.org>
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

The default bias pull up value for the tlmm i2c data clk states is
2.2kOhms. Add this value to make sure the driver factors in the i2c pull
up bit when writing the config register.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v3 of this specific patch is here:
https://lore.kernel.org/all/20230208081836.984673-2-abel.vesa@linaro.org/

Changes since v3:
 * none

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 1dea055a6815..6e60afc748cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2695,7 +2695,7 @@ qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				pins = "gpio28", "gpio29";
 				function = "qup1_se0";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
@@ -2703,7 +2703,7 @@ qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio32", "gpio33";
 				function = "qup1_se1";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
@@ -2711,7 +2711,7 @@ qup_i2c2_data_clk: qup-i2c2-data-clk-state {
 				pins = "gpio36", "gpio37";
 				function = "qup1_se2";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
@@ -2719,7 +2719,7 @@ qup_i2c3_data_clk: qup-i2c3-data-clk-state {
 				pins = "gpio40", "gpio41";
 				function = "qup1_se3";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
@@ -2727,7 +2727,7 @@ qup_i2c4_data_clk: qup-i2c4-data-clk-state {
 				pins = "gpio44", "gpio45";
 				function = "qup1_se4";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
@@ -2735,7 +2735,7 @@ qup_i2c5_data_clk: qup-i2c5-data-clk-state {
 				pins = "gpio52", "gpio53";
 				function = "qup1_se5";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
@@ -2743,7 +2743,7 @@ qup_i2c6_data_clk: qup-i2c6-data-clk-state {
 				pins = "gpio48", "gpio49";
 				function = "qup1_se6";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
@@ -2751,14 +2751,14 @@ scl-pins {
 					pins = "gpio57";
 					function = "qup2_se0_l1_mira";
 					drive-strength = <2>;
-					bias-pull-up;
+					bias-pull-up = <2200>;
 				};
 
 				sda-pins {
 					pins = "gpio56";
 					function = "qup2_se0_l0_mira";
 					drive-strength = <2>;
-					bias-pull-up;
+					bias-pull-up = <2200>;
 				};
 			};
 
@@ -2767,7 +2767,7 @@ qup_i2c9_data_clk: qup-i2c9-data-clk-state {
 				pins = "gpio60", "gpio61";
 				function = "qup2_se1";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
@@ -2775,7 +2775,7 @@ qup_i2c10_data_clk: qup-i2c10-data-clk-state {
 				pins = "gpio64", "gpio65";
 				function = "qup2_se2";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
@@ -2783,7 +2783,7 @@ qup_i2c11_data_clk: qup-i2c11-data-clk-state {
 				pins = "gpio68", "gpio69";
 				function = "qup2_se3";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
@@ -2791,7 +2791,7 @@ qup_i2c12_data_clk: qup-i2c12-data-clk-state {
 				pins = "gpio2", "gpio3";
 				function = "qup2_se4";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
@@ -2799,7 +2799,7 @@ qup_i2c13_data_clk: qup-i2c13-data-clk-state {
 				pins = "gpio80", "gpio81";
 				function = "qup2_se5";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
@@ -2807,7 +2807,7 @@ qup_i2c15_data_clk: qup-i2c15-data-clk-state {
 				pins = "gpio72", "gpio106";
 				function = "qup2_se7";
 				drive-strength = <2>;
-				bias-pull-up;
+				bias-pull-up = <2200>;
 			};
 
 			qup_spi0_cs: qup-spi0-cs-state {
-- 
2.34.1


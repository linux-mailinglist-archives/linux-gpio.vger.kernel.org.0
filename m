Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80395B5459
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiILGU4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiILGUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:20:03 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C60C2A255
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:45 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a14so7214229ljj.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CL2/j/JItz+3oLrNQS5aOSC401S6zfG+DX5xNbB/udc=;
        b=rG2VlijA2pc60u0PlEafJ/vMPNVOs3b06FeQdM/PZIIpBk4dgmGeVcICYSUNbXpRDA
         g/2+1MTu0c1MMvkNsuJtXi2IyLDNESo1U28yAyNwoVG6w5iB0wAJKZJThQ98KWwFbRn9
         rqTdIfMwdtmUKi82UqO/Vx2a0tmrGXnHlNoSE1GuddtvgFiFEtDUXfx7JLcaTRXaUlqc
         Q+fb/Y650xgzz7fQEqsqnAGMC8LNUubfpF04ego2FC8zBHhrZvMBrIpNAZiHIoLVmM1F
         79GWmOKVz7htYegd8k4FIvekdQRXWzor0LQoeWRPvRsSfiq6hCRPYPbcnx20EttdskVs
         PI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CL2/j/JItz+3oLrNQS5aOSC401S6zfG+DX5xNbB/udc=;
        b=03gfwhxheolRj8OpkVYyP1qG7rLMvf/Iqz6ReWM0GYc2v6HxcIczn3EDIzFm87AKBx
         JrTzlRn8uKF9nTnvkFTsSM8h2maalg6jlRvk98L42UX3jlQJtVQf4i5Hrhpfg9FfcL4V
         m9iFJexN18pCxGqW0PI03bVJ27h5z7M+gKJ2Z+/yDu5ZJ79TS/rzU3KtMhPb2TR6oexg
         83pnMhfw3rhSizNXD79iZ2A0xo53q6nJYMHrPZWrWNHbT9dZQsV5nUzC+pEJqB8NoSpP
         7/4VSbcit57BCzzkFJxb3kyAY6zm9to875n26QpZUSq1wRz9syPJstg6LJuA1uCPWSnO
         lkyA==
X-Gm-Message-State: ACgBeo2oIu1W125aMNyr+5WC2pDQp2IPx8VmU6PklysNskK66l8/N1YV
        4lM2Bk8OjRUZxJ5T03HY76cAzw==
X-Google-Smtp-Source: AA6agR6J734c31m8cKsxH6hs0z5otjzVQUXq/8A1k7uEm/AT3EhLg0T6iy2PHqjAiMgvNb36mNyYvQ==
X-Received: by 2002:a2e:5356:0:b0:26b:dce1:419d with SMTP id t22-20020a2e5356000000b0026bdce1419dmr5324319ljd.52.1662963524861;
        Sun, 11 Sep 2022 23:18:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 37/40] arm64: dts: qcom: sm8350: align TLMM pin configuration with DT schema
Date:   Mon, 12 Sep 2022 08:17:43 +0200
Message-Id: <20220912061746.6311-38-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DT schema expects TLMM pin configuration nodes to be named with '-state'
suffix and their optional children with '-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 44 +++++++++----------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index b702ab1605bb..b3c9952ac173 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -222,7 +222,7 @@ &spi14 {
 &tlmm {
 	gpio-reserved-ranges = <44 4>;
 
-	ts_int_default: ts-int-default {
+	ts_int_default: ts-int-default-state {
 		pins = "gpio23";
 		function = "gpio";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e72a04411888..cd5503642a23 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1762,150 +1762,150 @@ tlmm: pinctrl@f100000 {
 			wakeup-parent = <&pdc>;
 
 			qup_uart3_default_state: qup-uart3-default-state {
-				rx {
+				rx-pins {
 					pins = "gpio18";
 					function = "qup3";
 				};
-				tx {
+				tx-pins {
 					pins = "gpio19";
 					function = "qup3";
 				};
 			};
 
-			qup_uart6_default: qup-uart6-default {
+			qup_uart6_default: qup-uart6-default-state {
 				pins = "gpio30", "gpio31";
 				function = "qup6";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_uart18_default: qup-uart18-default {
+			qup_uart18_default: qup-uart18-default-state {
 				pins = "gpio58", "gpio59";
 				function = "qup18";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c0_default: qup-i2c0-default {
+			qup_i2c0_default: qup-i2c0-default-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c1_default: qup-i2c1-default {
+			qup_i2c1_default: qup-i2c1-default-state {
 				pins = "gpio8", "gpio9";
 				function = "qup1";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c2_default: qup-i2c2-default {
+			qup_i2c2_default: qup-i2c2-default-state {
 				pins = "gpio12", "gpio13";
 				function = "qup2";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c4_default: qup-i2c4-default {
+			qup_i2c4_default: qup-i2c4-default-state {
 				pins = "gpio20", "gpio21";
 				function = "qup4";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c5_default: qup-i2c5-default {
+			qup_i2c5_default: qup-i2c5-default-state {
 				pins = "gpio24", "gpio25";
 				function = "qup5";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c6_default: qup-i2c6-default {
+			qup_i2c6_default: qup-i2c6-default-state {
 				pins = "gpio28", "gpio29";
 				function = "qup6";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c7_default: qup-i2c7-default {
+			qup_i2c7_default: qup-i2c7-default-state {
 				pins = "gpio32", "gpio33";
 				function = "qup7";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c8_default: qup-i2c8-default {
+			qup_i2c8_default: qup-i2c8-default-state {
 				pins = "gpio36", "gpio37";
 				function = "qup8";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c9_default: qup-i2c9-default {
+			qup_i2c9_default: qup-i2c9-default-state {
 				pins = "gpio40", "gpio41";
 				function = "qup9";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c10_default: qup-i2c10-default {
+			qup_i2c10_default: qup-i2c10-default-state {
 				pins = "gpio44", "gpio45";
 				function = "qup10";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c11_default: qup-i2c11-default {
+			qup_i2c11_default: qup-i2c11-default-state {
 				pins = "gpio48", "gpio49";
 				function = "qup11";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c12_default: qup-i2c12-default {
+			qup_i2c12_default: qup-i2c12-default-state {
 				pins = "gpio52", "gpio53";
 				function = "qup12";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c13_default: qup-i2c13-default {
+			qup_i2c13_default: qup-i2c13-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup13";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
-			qup_i2c14_default: qup-i2c14-default {
+			qup_i2c14_default: qup-i2c14-default-state {
 				pins = "gpio56", "gpio57";
 				function = "qup14";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c15_default: qup-i2c15-default {
+			qup_i2c15_default: qup-i2c15-default-state {
 				pins = "gpio60", "gpio61";
 				function = "qup15";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c16_default: qup-i2c16-default {
+			qup_i2c16_default: qup-i2c16-default-state {
 				pins = "gpio64", "gpio65";
 				function = "qup16";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c17_default: qup-i2c17-default {
+			qup_i2c17_default: qup-i2c17-default-state {
 				pins = "gpio72", "gpio73";
 				function = "qup17";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
-			qup_i2c19_default: qup-i2c19-default {
+			qup_i2c19_default: qup-i2c19-default-state {
 				pins = "gpio76", "gpio77";
 				function = "qup19";
 				drive-strength = <2>;
-- 
2.34.1


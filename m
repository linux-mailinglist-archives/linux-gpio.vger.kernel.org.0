Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C89600189
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiJPRB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiJPRBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:01:25 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF8C371B2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:23 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id j21so5425815qkk.9
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYqcncrJGbkL6jJNc/7gkbAt6RxgsaRGH+e6gIoil6Q=;
        b=AoaPB86ryn61GoFBEg83VhoGRaA1GbRfEOy9nyLaWdGO1F7UzRKhX6ADADXngaCsBd
         JzuUJnvvKz4Vs/mn9twblmFPmvmPMNJp+gJMMiB92kHS+eCDeeXSW4h3o56pMBd2Cmt2
         kqGMlOdIOSH0wM1MovDzBXOZbJWNknHtoJyE29nZ64lzKXC40XvEwYx80CO0kpTN+PzO
         1YKjk1z6uyEBDgd1jzukKt+xcOYbGQKxNgOjkw7j/IB7+OZOQ7TK+L4NUqBm81dOyr60
         bskUt2dugm45lt1TKMjiIvSJFbpa9IQjGqQExnZPBPZt3MyCBJu4ZeZaYsP3LFLzForO
         qp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYqcncrJGbkL6jJNc/7gkbAt6RxgsaRGH+e6gIoil6Q=;
        b=aOmK0WZyxpI6bdaNGTJiXvHp293vqSmPf6ffhNA6UN/AWg0LBc/HzKFM+zeCM5iq+2
         aXDoL5kXnl/NHqFTdYv4nHNj57fZTYmomBkvrWF6ilAg/qDSZc5vI1LI7ADDSa0kSlq+
         junkhDbGpDGxb5NYudPGjpqa9WJyjGNlmfBUx0PCKIhYfJqsqhbTm3oQT/0c63uB34bL
         CF8w25loqSyw8JPbXj9kL5n/CEWU3htCHRvdsm+88wQ8ZRM6mQ6jO+VxfSgyM3Q5cR/n
         cHg3lpEs9l+fCryAPg14LODAEgRkk8O8hZ5vOi2Ok9reAkWC8emwWGYTb3p0G10aSFMc
         kZ6Q==
X-Gm-Message-State: ACrzQf1KaaiNYKYYBzebLXUvxhUE/6BlKEAy6BAR7HQe/G4hMH/hpWrT
        5lg8Jmih0RXKQxCIU5ohFwMBBw==
X-Google-Smtp-Source: AMsMyM65s6HddVEGKpwfcZgSFZNvmHquoQc0c43IVAc6UXSnQC+LuKbKmWv2Cm2XEBuY+DmA+SLeKw==
X-Received: by 2002:a05:620a:1212:b0:6ee:a8ec:c07f with SMTP id u18-20020a05620a121200b006eea8ecc07fmr5245253qkj.334.1665939681617;
        Sun, 16 Oct 2022 10:01:21 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:20 -0700 (PDT)
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
Subject: [PATCH v5 02/34] arm64: dts: qcom: ipq6018: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:00:03 -0400
Message-Id: <20221016170035.35014-3-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 4 ++--
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 6a716c83e5f1..ec999f972360 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -51,13 +51,13 @@ flash@0 {
 };
 
 &tlmm {
-	i2c_1_pins: i2c-1-pins {
+	i2c_1_pins: i2c-1-state {
 		pins = "gpio42", "gpio43";
 		function = "blsp2_i2c";
 		drive-strength = <8>;
 	};
 
-	spi_0_pins: spi-0-pins {
+	spi_0_pins: spi-0-state {
 		pins = "gpio38", "gpio39", "gpio40", "gpio41";
 		function = "blsp0_spi";
 		drive-strength = <8>;
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index a7c7ca980a71..9b9f778090e1 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -218,14 +218,14 @@ tlmm: pinctrl@1000000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
-			serial_3_pins: serial3-pinmux {
+			serial_3_pins: serial3-state {
 				pins = "gpio44", "gpio45";
 				function = "blsp2_uart";
 				drive-strength = <8>;
 				bias-pull-down;
 			};
 
-			qpic_pins: qpic-pins {
+			qpic_pins: qpic-state {
 				pins = "gpio1", "gpio3", "gpio4",
 					"gpio5", "gpio6", "gpio7",
 					"gpio8", "gpio10", "gpio11",
-- 
2.34.1


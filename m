Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6D55ECAF1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiI0RhW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbiI0RhT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:37:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00761D2D2C
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:37:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id p5so11686999ljc.13
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lYqcncrJGbkL6jJNc/7gkbAt6RxgsaRGH+e6gIoil6Q=;
        b=GpTs1D7KwdJaD4GMtF7yHB7ekrTcNh/FAi6MKN+ALiPeD85JxLsVJ7wUgNCGcg9h4p
         yK2IQXjwtMotWpoWs8F8kJIyOwRBhIWjRr+yCne/OvZhxgyIKkhMWOa70vWT1ts59M7y
         K9LmAnWyJiI5SlLtAtFD/iaUyaZKMXvQoStm5GtCSj6yCb351LO3+u/cLCCVNqn0yuhk
         lZyPWQnnRNGTTOmZiD0Tae3Bi6RBYD5tIIZlXQMey1NxAI6bLSgycQA+ug4s6/iCcSm1
         UDH4lbgWOGfvAYgf9OamPZISZlbciep0JgUhS11jKDw6yofMs0EuL3Qw7gBucjzHp5ao
         Si8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lYqcncrJGbkL6jJNc/7gkbAt6RxgsaRGH+e6gIoil6Q=;
        b=RLp4k7mehWveuYCWC6+b9FRMqBGkuSVTsb6nRswZV7mmUs+l6kOolc0CAW520eyvIz
         q5kZFUc97a/MIlUV2RrMgLsD3IVqdLzAvI/ZhwbqEQ4i3eI/IGlYTNM+aQQqh9o2f97P
         GSBgutrIAms+bd+jUV2CmIEQcqj0Om5w8nLVevlv8XGrSDMQuJYyCS6rAGlq3IHz0y3s
         u8/c4QDOfzBdZV7cb/K5qmdiElVSO/DzuustpkTjjkmsRVC20pzIA/pivWUAG5nqF0tA
         /tpIaXKqiHkqrzE9OrO5mBawy+gpGHicUC977CZpSNuxhueubw8eIhGI/XJHtUkyln7O
         2iKA==
X-Gm-Message-State: ACrzQf0xecbXffNhbrU7t2sqnC0X+Q5ZG9T6LvdvyaSKEYONoMzkqZIS
        BTNvrdVlG9YPkWrh2BY/IaDhdw==
X-Google-Smtp-Source: AMsMyM7838SqPCdhGV8cY8t7zcatz3PPQu+joRYoWTPbfu6z10AbVoUu0ginTxBSIpsj2DVwvJJWIw==
X-Received: by 2002:a2e:8848:0:b0:26c:cbb:9a1c with SMTP id z8-20020a2e8848000000b0026c0cbb9a1cmr10493970ljj.165.1664300237317;
        Tue, 27 Sep 2022 10:37:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:15 -0700 (PDT)
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
Subject: [PATCH v3 02/34] arm64: dts: qcom: ipq6018: align TLMM pin configuration with DT schema
Date:   Tue, 27 Sep 2022 19:36:30 +0200
Message-Id: <20220927173702.5200-3-krzysztof.kozlowski@linaro.org>
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


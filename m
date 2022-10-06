Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D7D5F6660
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiJFMrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiJFMrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA8FA284E
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:05 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bs18so2111353ljb.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lYqcncrJGbkL6jJNc/7gkbAt6RxgsaRGH+e6gIoil6Q=;
        b=jInfbIis+0/Plbxq8DWB5tyedY1dj18BVfkLOvFFR+BcnIwZOJw+yF/oFQsL8U9ldD
         fDvPTbSnK5lXPZpho7zJE4/gwHyy3UNU2V7NoVFILRmYTxfyo9M5Zbhyk7S8W9QC3pfW
         L77PWWBWkg8ktJ7Zuro4zQWkL279t9IDzkMTDu0v8SnfRQKRziLHkt0Uk6UfrzhaE/at
         KuP985ZlxqYUfB3Ono7TaoLJA6yjW59WLkIFU/bG0Af3UqiQor5ETFLe9qU0A6rd47st
         4MkcZtRjR1+r3GTPxgCjyNDgQ/5SaCLevs827WEYNtwWqVmoKS+dyjqYPJtv3iNjQzWQ
         IG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lYqcncrJGbkL6jJNc/7gkbAt6RxgsaRGH+e6gIoil6Q=;
        b=Tsoc91aSnzdxWpyW049E+55xdydykaoOAsMkFuZdZUxZthgIYOx8Ep6ulFYK6xdcx4
         kuvWFV9anax+Lh9VybJOgHalC41ckKrLY53K/oaurh/ua6fzAkqZhvFhpLB97HPPSj5s
         VnJ9zz2n62cl2vVggjDDpPmzvysw8tEkYw4w9fPDX4eHMxfOxZiNPURsmvogNnw5TPoy
         lwFRpYuLV7VyC4S5GUa5bQyDcPjt5LVUBPvvU0vBXE2qdHQsToTlQSo4l8BJMvGm/RmP
         JxuC87DvYLmFNYEAnFc+72JAXMYJc6gEvRoY5zmxct+Sprp1i/BFoWGBos/sF9F5ERqE
         kAtw==
X-Gm-Message-State: ACrzQf0WG/IgsYQdJ3ps4LBbtp8NIlAoC8TFjxFv9rD4LaVkUtqVpx1e
        +UUld1wUck0OBJ3uAqWTEFHNVQ==
X-Google-Smtp-Source: AMsMyM641PtxZ19qhIkegbvNbusVqmW4Jhv0x27WLe4MQHKy8CFGmbMeH2VEHImqofri8sPHw1dEDw==
X-Received: by 2002:a2e:a58f:0:b0:26d:92d8:45f8 with SMTP id m15-20020a2ea58f000000b0026d92d845f8mr1782465ljp.366.1665060424219;
        Thu, 06 Oct 2022 05:47:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:03 -0700 (PDT)
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
Subject: [PATCH v4 02/34] arm64: dts: qcom: ipq6018: align TLMM pin configuration with DT schema
Date:   Thu,  6 Oct 2022 14:46:27 +0200
Message-Id: <20221006124659.217540-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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


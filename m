Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9CF51EDEA
	for <lists+linux-gpio@lfdr.de>; Sun,  8 May 2022 15:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbiEHODi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 May 2022 10:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbiEHODd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 May 2022 10:03:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB5FDFAF
        for <linux-gpio@vger.kernel.org>; Sun,  8 May 2022 06:59:43 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id m20so22296401ejj.10
        for <linux-gpio@vger.kernel.org>; Sun, 08 May 2022 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k50mJPbpmQp4ZqpTJGpM+QQCXPw1yE6XvXVaK9la8K8=;
        b=Lr65hVJJkETPw516VWaQvE8zkYACS4A1NHzJ0ZDkc8+J7e4lUMyXusayN7ywW2D3lF
         12dlRSup0iGCOhLuNLNwjOrP3ZbvyhXfjFR6wxOsa2jE3hdDWKz529oExedwTLryU8PL
         8mze926P2VhVK1VipDHDcQeVShexST67/JKyufOcwiTcK16J0fZOb6sCigODoZZFQgxe
         Cz/bBChj3PiMTGk404KzzTeYhywBPMtAQ/2Ds5tEttkJKfiA8gR8JnjAFqBSjEH29+G6
         Qd894sPf6X0/BqIkTqcLPxsB3gLkUpYo9eSMHqzYjzpjUy1B8kXyuug1eYAjRcwk3mVA
         QwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k50mJPbpmQp4ZqpTJGpM+QQCXPw1yE6XvXVaK9la8K8=;
        b=TxfvPA63dmEr6pw2TaeClsersmhe7TQbB0wB1AMwql4fjrl+Ya3Mir98ccCWzwO1mo
         tiqY2YoOhmcP+kE/BXCnmCZlr4Ssc9sVC7Qh1dLRLskQTkZFsyoqQKUjhGBxbBcoxxX4
         yGudcZzsK/zFs0dhbEwPA4/LO8wWAc3vpKThw54MsM9EvJnBVxXd6hKyYPbylpGqE7xM
         BkGOiQY0Y0PFu6u2u0/riU3R4BjCayFf14+iTAeIsIcokF6eWddjThSg8Izl9Q+SbTPL
         G3qP6xKZTEBVd2Ins/Ra1ZPOxuQ/g9kcrpMJ5+ASrH1rMx+9HtVkzn0mbaVpWp2ce/R6
         fV0g==
X-Gm-Message-State: AOAM530oqJjaWqyXp2OF4D1kr46jBvZ/O+/iyhxQGXGC7Cl4wjavDExS
        mhG5tbF1dSueaLRmd4+nebSL6g==
X-Google-Smtp-Source: ABdhPJw3eg/IFzBYwVdGMUwtyRIdaWs2jgo/4w2kfJyKecL4+n2lggRm/3VGBSpCEJ3zgUVoIUWhGw==
X-Received: by 2002:a17:907:7242:b0:6f5:2904:5354 with SMTP id ds2-20020a170907724200b006f529045354mr10026196ejc.452.1652018383113;
        Sun, 08 May 2022 06:59:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qz24-20020a170907681800b006f3ef214dc6sm4075524ejc.44.2022.05.08.06.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 06:59:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT 3/4] arm64: dts: qcom: correct interrupt controller on PM8916 and PMS405
Date:   Sun,  8 May 2022 15:59:31 +0200
Message-Id: <20220508135932.132378-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
References: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PM8916 and PMS405 PMIC GPIOs are interrupt controllers, as described
in the bindings and used by the driver.  Drop the interrupts (apparently
copied from downstream tree), just like in commit 61d2ca503d0b ("arm64:
dts: qcom: fix pm8150 gpio interrupts"):

  qcs404-evb-4000.dtb: gpio@c000: 'interrupts' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
  qcs404-evb-4000.dtb: gpio@c000: 'interrupt-controller' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi |  6 ++----
 arch/arm64/boot/dts/qcom/pms405.dtsi | 14 ++------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index d52919a8c0b0..0b6e8ad7fa50 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -113,10 +113,8 @@ pm8916_gpios: gpios@c000 {
 			gpio-controller;
 			gpio-ranges = <&pm8916_gpios 0 0 4>;
 			#gpio-cells = <2>;
-			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
-				     <0 0xc1 0 IRQ_TYPE_NONE>,
-				     <0 0xc2 0 IRQ_TYPE_NONE>,
-				     <0 0xc3 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 26f1e8cc9c6c..634b0681d04c 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -43,18 +43,8 @@ pms405_gpios: gpio@c000 {
 			gpio-controller;
 			gpio-ranges = <&pms405_gpios 0 0 12>;
 			#gpio-cells = <2>;
-			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
-				<0 0xc1 0 IRQ_TYPE_NONE>,
-				<0 0xc2 0 IRQ_TYPE_NONE>,
-				<0 0xc3 0 IRQ_TYPE_NONE>,
-				<0 0xc4 0 IRQ_TYPE_NONE>,
-				<0 0xc5 0 IRQ_TYPE_NONE>,
-				<0 0xc6 0 IRQ_TYPE_NONE>,
-				<0 0xc7 0 IRQ_TYPE_NONE>,
-				<0 0xc8 0 IRQ_TYPE_NONE>,
-				<0 0xc9 0 IRQ_TYPE_NONE>,
-				<0 0xca 0 IRQ_TYPE_NONE>,
-				<0 0xcb 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		pon@800 {
-- 
2.32.0


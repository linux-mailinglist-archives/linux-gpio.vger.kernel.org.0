Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77DD95F66B3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiJFMtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiJFMs3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:29 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DFEA2859
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g1so2503335lfu.12
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZZcOmZ2L/AY2ngXzMGSS8fxC9MeWWKAVxvGQK0RtVF0=;
        b=TwZpmM8YYJp3VxwUQSElsSKrzoQht4P/ARFFt/OrY6z1/UT60Wun2D+jRAinILyIok
         4a+kNMmMP/rElZMVqil6n/wyA/j+NCHFPfY7wopZPElY8XCFluYqmN4Dh3P2FZ/Xm1F+
         qHPT9fGvMzi2U9pLGIXcJluKa0JaSW1gHzCndYOt1wjiglmLAI7KTacF7r7Tdxidzqku
         QdsRTCUhyoDBGYFHa/Vq2q3991L1tNBNtxFueejkeez4CMuALb12/bbhtwJG7FYxQhqj
         EUa1JRfTFY66WfNVT9yHruPzeJBG5/EeTIAQzK3uggZuJ61zLj5U88FGbUqxlG9UetQp
         AusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZZcOmZ2L/AY2ngXzMGSS8fxC9MeWWKAVxvGQK0RtVF0=;
        b=m+OPUPZ4/rLKz46MoKC+WFMgKfbtTlOdl6PL6moIhb87HYFmF5ihqe1hKCUSBKFEl2
         aJcCLTo0RW0cStfiks4/PYAvTydhtT4whe3/TKRnSGOG7vxQmN2og8nY9Wq4E5HNtCF2
         4Sie3svkSfZIt5lDuo5RqsctDvgZDLBWqcE7qwLaKuPwxkY+8Iy6ozPjsUH2hYQepd11
         5t2lT1/ikifNyAay1uTvdU1QORbNKC/xhWimaIg09Fnwn6LA17Qh7LFHTtFqiEtQqmM4
         XQC5K5Y+e2iAUXSHoCg5w6JqoH7AjQb/oUeW7szMJsnKSGjor3cUES/KhOy8yr6wUWaB
         Emdw==
X-Gm-Message-State: ACrzQf0qEOKjLMhINNpZr4EGopwLtduWEqTcAdjXbT4Fm5PaFA+PaKNX
        CPyyVAqSxtIS5gaExMYTzWnlaQ==
X-Google-Smtp-Source: AMsMyM5kFCtg5IvuYya45L191YnRfv6bynokOTa7rI4PEOUUfDA8fQmJG/5zIJKOCd3i0UfYdFqtew==
X-Received: by 2002:a05:6512:33d1:b0:4a2:119e:1887 with SMTP id d17-20020a05651233d100b004a2119e1887mr1700427lfg.85.1665060450951;
        Thu, 06 Oct 2022 05:47:30 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:30 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 25/34] dt-bindings: pinctrl: qcom,mdm9607: fix indentation in example
Date:   Thu,  6 Oct 2022 14:46:50 +0200
Message-Id: <20221006124659.217540-26-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index 57a4fed55de7..a37b358715a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -120,14 +120,14 @@ patternProperties:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-          compatible = "qcom,mdm9607-tlmm";
-          reg = <0x01000000 0x300000>;
-          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-          gpio-controller;
-          gpio-ranges = <&msmgpio 0 0 80>;
-          #gpio-cells = <2>;
-          interrupt-controller;
-          #interrupt-cells = <2>;
-        };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,mdm9607-tlmm";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&msmgpio 0 0 80>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.34.1


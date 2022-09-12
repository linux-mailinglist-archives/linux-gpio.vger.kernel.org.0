Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3D95B546B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiILGVh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiILGVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:21:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213602C123
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:19:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id s6so1946267lfo.7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nXdmZRWySMH2y4BHslWMyDvfmlDcWpCDzcQgKmezSiA=;
        b=aS+agOqhWINw9MuAJ0n32qJeHyY3pODek/iNq3Rojv3DYFvibsVMgg5Ku/4AwlqjKS
         yUX1g0w9BfjFNhByRz4ypR3sjOe976/vzTOP3MHbTCI9TkaPlrZKI9mHSaJ+9nz96KQR
         Dqx96gtCyqAdr5ltVbudxyFj3SeDsL0nWPL8eb5Fwb2BDPzlg4t0dyn8BNV/bY5jz7Br
         SCMQch7z2wWWzy5vaCDpDFeaKvU93G/K2PVJr07EEH07WVaLnD4zxaVuz4aOgfE/9iw9
         9WVpDL82VrfX5xN+bDgXCG9mxqNOm4ZUnNY6/PBM8IECQrEnrDYA62L37EUmk+DbVNQg
         fKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nXdmZRWySMH2y4BHslWMyDvfmlDcWpCDzcQgKmezSiA=;
        b=Di2WsJTTBvGBeONoau01F80PnFKqMd8vZsKitKkqtQcMo3lxYCBu5PjNh+9/DfhHW+
         1z13Lreh1FcOjvQggiA1cW1BWB5VMfbVH1e52PKpAsCbizjeIJQBUu8GWk/NlaS61Ht7
         q8jlEHjYAdZKvkKkYdyQh4hqrcCzWQrYnbkpZnl5en0jdnje5qE67hr9OY+KffX2yEbt
         wu20jxoveYcz4Pbg9WR/KGyNqYfynB8rS+OhQ+PAszlU3TluUAN6pvQam7Q+qPbSq5EL
         QVQg7gqWwc3pZblwzfecZ9nYu+nK98LfXl+ZCrIgC37PIdvsin9o/LMvNrnH2Wdx7t5F
         FodA==
X-Gm-Message-State: ACgBeo31znq/mYdWNmrLP/xpuypFvu0se9UyYNRxWp+P2OqA9UCI/Dit
        E3uXgtjeNYE43fxZJIwMOFITTTlKfeB41w==
X-Google-Smtp-Source: AA6agR45OVFDsP7/GSM/ZCIfw7CKomhVPysvR/TQNc6CDDrydTsLOCiRTXPAkluJzMM6x8e58vrekg==
X-Received: by 2002:a05:6512:682:b0:49a:9db4:5a3f with SMTP id t2-20020a056512068200b0049a9db45a3fmr1641603lfe.214.1662963516774;
        Sun, 11 Sep 2022 23:18:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:36 -0700 (PDT)
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
Subject: [PATCH v2 30/40] dt-bindings: pinctrl: qcom,sc8180x-pinctrl: fix indentation in example
Date:   Mon, 12 Sep 2022 08:17:36 +0200
Message-Id: <20220912061746.6311-31-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/qcom,sc8180x-pinctrl.yaml         | 64 +++++++++----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 4afe20bac87c..b98eeba2c530 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -126,37 +126,37 @@ patternProperties:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@3100000 {
-                compatible = "qcom,sc8180x-tlmm";
-                reg = <0x03100000 0x300000>,
-                      <0x03500000 0x700000>,
-                      <0x03d00000 0x300000>;
-                reg-names = "west", "east", "south";
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 190>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio4";
-                                function = "qup6";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio5";
-                                function = "qup6";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@3100000 {
+        compatible = "qcom,sc8180x-tlmm";
+        reg = <0x03100000 0x300000>,
+              <0x03500000 0x700000>,
+              <0x03d00000 0x300000>;
+        reg-names = "west", "east", "south";
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 190>;
+
+        gpio-wo-subnode-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio4";
+                function = "qup6";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio5";
+                function = "qup6";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1


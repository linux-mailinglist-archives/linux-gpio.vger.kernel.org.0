Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB805B4DC5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiIKLMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiIKLMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:12:14 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D54D32B8D
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:12 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z20so7408216ljq.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F43nv8/M+cL0CQPWEGRQlPTNWaqRQm3bONcFJuSIY7A=;
        b=LsReYflfbBL3iiZZG7OX3s8/hgRs6zfXJ5bXYW4hiRJnUffTliin2kTLChdCNcarWF
         IYPW6OasF5VkqNGa9lPZPF3N0H1ExqBc4R7FsK5Vj98crFO8N7N2P3BZplZl0ftVkJYg
         e9ITsRvdU3W1BF2cY0TRxNpfYzVbVIdo2wqXDI9rtDzBKYVgS0o2gko/NRWgvNKc3F5R
         xG45zsHUmIVkKtT4krBUK4alhRi4jnx4Xnmg8EtOIXcWsmEovLY+Fl86wXdw03hRlf1+
         ZMIAVtwg/I9orYokEk6OLjzw73Mq8fgF743BpMeDrdF+soj1jmZUkFBPk3HjxLp8ZcHm
         D+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F43nv8/M+cL0CQPWEGRQlPTNWaqRQm3bONcFJuSIY7A=;
        b=fsHEP/N9RF+/M76Onf3a/6DRHeyKplGms3egrO5N+Tqp+KZAsbWCwn4PnPAuTtb+oh
         HjkwTpaH+0QeZd3sN5j8copgLdlKdGy97yuxJ8YPcBpfwO41CoG3s9W/28Ukw6pDegLL
         RITwqS25O0+6o6ewQJ/Dpcb+HIBi+1h1k3W18cDDJgb4TLJ64lmZ352tv5WSWxGDtpwA
         tWcFLHcMv4tdkMlry9DMHvZWZmr/E6fRmFaVD3UMQJyzm+B/ZJ0k80KjX0ZR/uKUYlem
         xhJFfAB08ZbdGEDQ4JgqFjCg3dBD5mE8loAC/wkooW45youPPhWQ0gHbH7kKWeCXr9Rz
         UGqg==
X-Gm-Message-State: ACgBeo2Y18dYJMbiYCxh+Z8PS12xgKpTs76ySRTGgOJZ7n2OnF5PJkq7
        6u+6Ef37ZHNnU8UCc0ya2ozt2Q==
X-Google-Smtp-Source: AA6agR4Z1Rd6NN9rS7Zi/77PfBeN4yxF4gC5dX6zDtptsktgkP4U5WZYdDxqk9pzUXwpGjL2gIgOtA==
X-Received: by 2002:a05:651c:b2c:b0:261:d82f:75b8 with SMTP id b44-20020a05651c0b2c00b00261d82f75b8mr6166137ljr.266.1662894731998;
        Sun, 11 Sep 2022 04:12:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/40] dt-bindings: pinctrl: qcom,sm6125-pinctrl: extend example
Date:   Sun, 11 Sep 2022 13:11:26 +0200
Message-Id: <20220911111200.199182-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

Extend example with children for pin configuration and indent it with
4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 735eb5d6834d..5cb8b272cb7d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -126,17 +126,37 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@500000 {
-                compatible = "qcom,sm6125-tlmm";
-                reg = <0x00500000 0x400000>,
-                    <0x00900000 0x400000>,
-                    <0x00d00000 0x400000>;
-                reg-names = "west", "south", "east";
-                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                gpio-ranges = <&tlmm 0 0 134>;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@500000 {
+        compatible = "qcom,sm6125-tlmm";
+        reg = <0x00500000 0x400000>,
+              <0x00900000 0x400000>,
+              <0x00d00000 0x400000>;
+        reg-names = "west", "south", "east";
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&tlmm 0 0 134>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        sdc2-off-state {
+            clk-pins {
+                pins = "sdc2_clk";
+                drive-strength = <2>;
+                bias-disable;
+            };
+
+            cmd-pins {
+                pins = "sdc2_cmd";
+                drive-strength = <2>;
+                bias-pull-up;
+            };
+
+            data-pins {
+                pins = "sdc2_data";
+                drive-strength = <2>;
+                bias-pull-up;
+            };
         };
+    };
-- 
2.34.1


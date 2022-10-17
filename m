Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5CE601CD5
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiJQXBJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiJQXAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:00:49 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B917EFD7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:00:46 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id bb5so8702703qtb.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIZZaObCIVwyxhGsjEud+/xoayWhTwNNIL2D7dwmU4k=;
        b=HvdvNSB11gw1Yxlr2dstg0Q0AUDGzi4vj+b2RLBNCYimlDkPXxDVOdzIyCNBLs+fwz
         NbFB5+Kj01Cef9yBMQzKH+sSXTmsVKw2GNN7rjtPjkj0s9Yo0md+jDYneDjtlE9VMjYk
         /QgKeCHsAxU3o5m+a6ReCPwuOerBGvvcf4rAtZHvSe09k6Uul0c+srD1mMq9kJLnWZob
         TwXk686ZCtflXovuIySuZgJZChIqVQnJFw41SwO0Ghh6TJQ9ePFn5PawCVVtr9SEtSkv
         N/RZJ651dweh8OFUY5yGTwW9AifLC+7UtuXPxI4FeYZADLPPPTfO53NYSCOrSPfpja44
         Ul7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIZZaObCIVwyxhGsjEud+/xoayWhTwNNIL2D7dwmU4k=;
        b=vECzrGkoDWu33rDnLaRfdZXgBNYIj4v10ZP3KY2xpa91GS6q6aH4YM7Hcu6YpQm4wV
         fXaD0IV0Wr78GUYbpT3EIfXBu+VorJFD7fGeHap/2rrEInvRR/QYt9bgbCH5dwg62lY6
         LRtioPLMO/SKeGTPi1ZKkog2/d7Z4/phxe6zdCiAv8RPuGAJy1/5p0psyHmDz1G5BsXW
         468aOuvIF0c/YK0a4W1FLy0YIV0VO0Xf0KmUAjd8KHBbzThD/Mo7nDLjr6cQ/U38Y43C
         hD9fLd8fGqjbar+ej1whKzkEVIpaCLZdpCLbATU2pXPbISSvEOCrfQBdrS+3R70TYSu2
         yQ5A==
X-Gm-Message-State: ACrzQf1DatZy6H8DBJstJTTci5Erv+ItA3b0Ka2kwFHuqtQSwkeJS5kg
        U83EFXcDXutMcHsdMtcF0klYAA==
X-Google-Smtp-Source: AMsMyM7OvAV95h4/qGsEoYbUMSSxKt+CZRQnaqsbQRISuPHmjVosA9mB/gOEtvGmx1B2mPw+1YYUfg==
X-Received: by 2002:a05:622a:1654:b0:39c:ded0:4780 with SMTP id y20-20020a05622a165400b0039cded04780mr10885263qtj.688.1666047645278;
        Mon, 17 Oct 2022 16:00:45 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/33] dt-bindings: pinctrl: qcom,sm6115: use common TLMM schema
Date:   Mon, 17 Oct 2022 18:59:44 -0400
Message-Id: <20221017230012.47878-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring common
properties, other pinctrl schemas and additional checks, like function
required only for GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iskren Chernev <iskren.chernev@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Drop drive-strength.
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 55 +++----------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
index e39fbb36d8c1..dfb6e5403ea6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -27,30 +27,13 @@ properties:
       - const: south
       - const: east
 
-  interrupts:
-    description: Specifies the TLMM summary IRQ
-    maxItems: 1
-
+  interrupts: true
   interrupt-controller: true
-
-  '#interrupt-cells':
-    description:
-      Specifies the PIN numbers and Flags, as defined in defined in
-      include/dt-bindings/interrupt-controller/irq.h
-    const: 2
-
+  "#interrupt-cells": true
   gpio-controller: true
-
-  '#gpio-cells':
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
+  "#gpio-cells": true
+  gpio-ranges: true
   gpio-reserved-ranges: true
-
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
@@ -69,6 +52,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -101,50 +85,25 @@ patternProperties:
                 uim2_present, uim2_reset, usb_phy, vfr_1, vsense_trigger,
                 wlan1_adc0, elan1_adc1 ]
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
       bias-pull-down: true
-
       bias-pull-up: true
-
       bias-disable: true
-
+      drive-strength: true
       output-high: true
-
       output-low: true
 
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
   - reg
   - reg-names
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
 
 additionalProperties: false
 
-- 
2.34.1


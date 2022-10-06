Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6872F5F68DD
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbiJFOHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiJFOG4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:56 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC35FABD5C
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a29so2901754lfo.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gjfbe7TbLhaoMq2X3jSEgOzMiaBougxufQB2UCN8MHc=;
        b=O2MFYNAieVdMBLcSp7p6nMLYI79or471UI6UySWpyPeuvGZDzV8Sv//xpl1xq9ABMA
         56xVUDWzsBL637b8gJneYzvMXBycMqARGoNPYG5/V70AeoOuCjQkozpqR9Rf1zMqOQTD
         GYaDcxA84slyZjVfEalI38Qs9IfuSHfUYycK1UqGyNJ9rd2hZ1qrJdTbFSSi28gLvtTy
         Be1hYGxUKXoOVu+ZS6F52cxj0RzJB3S54brUgFIVFd44nEgqVo7dpJtJgQMo8MD+TULp
         31eXikv+da2iB/DxeamJy6Ts0g8mhFkbNsFSF5tlE9Uj0r/zkD7sgULqc73DH9BlhUYb
         om8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gjfbe7TbLhaoMq2X3jSEgOzMiaBougxufQB2UCN8MHc=;
        b=rXXhK9jy23feIkpqGB95L0iBRh4ELnAVpmBJdrngvU4YdPz+QFcmaOBrcxtyrh7MWp
         bXbdDQQ4oywTMG6XHaUx4svoqesKMg9U5ZNw/r43TOBiF2jZETWhtQjNOhbz1WHEQRdh
         oySg06mDYzgaWzQpOj11pUfMA3qCtvmk7t+TpGXZ2LgWVmqLCziYr4xUXNhDXAKHItyl
         Pl4WjM0s4kLQ+sXJ8fKetpuUVurJ2yghR0/EK6k1J3udsHilooAilqCSqtuYPvFnsXla
         RAfD2yOvYIXthvcMNmPCW9XknF5nz/o1zrgL5iHaT6z2MJMtrDyxD+5Vv/054JdtRrRg
         IalQ==
X-Gm-Message-State: ACrzQf2T9bK2EWtwlyEY/6Arn50CuamKoAM3NyF50f+8srh8t+C/PNUe
        8g6PTiZwlyVh6BluCUc2t0mXEucU+m1Spw==
X-Google-Smtp-Source: AMsMyM5AASYXKANZdneO5bzT53gkathxUBKL2hhyos/gL89wiRyrPWxuCebjAS+RpySuS18umj/Hbw==
X-Received: by 2002:ac2:4e71:0:b0:4a0:7191:762e with SMTP id y17-20020ac24e71000000b004a07191762emr39683lfs.361.1665065210828;
        Thu, 06 Oct 2022 07:06:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:50 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/34] dt-bindings: pinctrl: qcom,sm6115: use common TLMM schema
Date:   Thu,  6 Oct 2022 16:06:09 +0200
Message-Id: <20221006140637.246665-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reference common Qualcomm TLMM pin controller schema, to bring common
properties, other pinctrl schemas and additional checks, like function
required only for GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 44 +++----------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
index e39fbb36d8c1..3f5f5229a86c 100644
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
@@ -120,31 +104,15 @@ patternProperties:
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


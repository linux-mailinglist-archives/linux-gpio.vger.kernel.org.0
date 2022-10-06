Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABF9E5F66C0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbiJFMtc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiJFMsl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AADA4859
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:49 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 10so2541398lfy.5
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ED0JY2un+wt/JOYmEVTQcdYewvvA1MClLH9MAkoeAo0=;
        b=eQF+56vO0QTuRvthLJ/0DDW1pHyrmR+RKGSk9XSgeg1KDWbqAxbfXe/9X6JHzHOg9W
         iFmFO4W+Y8aW8KopkpRqUS3rHZNcALOt10b7a3ONlicJNPPsHCry4kXw4qQVAyo+KZk5
         t/T5Iw7md4Un4al05WZSAKmX7vPwIWCeHlRbBz1D4Oj5CqysuucEZRK2ygfOSowAaSgu
         9VUkBHKDvNWf9D20YhWMJytchKtHLOUDqYPjSaS8tJoXp0cfiCiFDBbcqWAQ0a0SBL1H
         f7npkcIa2fmte79Of3ZYXQOwVEf7ji44XkBg0VBM6DaCuB+3Cdo2Bh0SG8lsZDncMd1t
         PyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ED0JY2un+wt/JOYmEVTQcdYewvvA1MClLH9MAkoeAo0=;
        b=rCYixu6nF7YG66G31BEkwlHvg5ECo1phNdBT1uJOpG6pMT2Amtykvt0awQL4+JGqbe
         xvz8cI52bpb+fiI1/RlZm7Z/X+mUGtv8V7xZwm5rdsHJkyZdsWqKgGMHYjNCbFII3Rrg
         ly4Tau/dEgMu7kOX9og7BXFOl09yTpuyfcSj9sB/hPTjBRPdTbwk/l6utyoxCGQCHCuS
         irtdz3v+TaLXbPHaDoB4SoiOhJGLN1hGOAwV6XBAGmL/uLIakJeAZNGtdr7tTVz7ZxVq
         9MYBoapySyEwihnJyVo6AMnEphB8a1QM9jOFthxIZ+VjNroTwS0qRdFqj5ey+XxpLUBD
         nLwg==
X-Gm-Message-State: ACrzQf0V+2tMGLfGOSDRrhazBdjag0oqsJJq2MQNyEHixV2yDLndCYFr
        7ClXVpAuCNZgDeJLOOiLTIxH7A==
X-Google-Smtp-Source: AMsMyM4QadxicthkxHonr56+7yiFjW2dZ0uVzBrjaBskzMMlmIbjfecFIOY7OdbjWiiFEGBoiJ06Zw==
X-Received: by 2002:a05:6512:c0d:b0:4a2:4129:366e with SMTP id z13-20020a0565120c0d00b004a24129366emr1901983lfu.328.1665060447020;
        Thu, 06 Oct 2022 05:47:27 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:26 -0700 (PDT)
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
Subject: [PATCH v4 22/34] dt-bindings: pinctrl: qcom,msm8953: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:47 +0200
Message-Id: <20221006124659.217540-23-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring common
properties, other pinctrl schemas and additional checks, like function
required only for GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Drop properties and required items which are already provided by
   common TLMM schema.
---
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 35 ++++---------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index c162796ab604..a0e3c61fffe4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -20,29 +20,13 @@ properties:
   reg:
     maxItems: 1
 
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
   gpio-reserved-ranges: true
-
-  '#gpio-cells':
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
+  "#gpio-cells": true
+  gpio-ranges: true
 
 patternProperties:
   "-state$":
@@ -59,7 +43,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -139,22 +123,15 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
   - reg
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
 
 additionalProperties: false
 
-- 
2.34.1


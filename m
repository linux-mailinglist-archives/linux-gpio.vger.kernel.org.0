Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDBB5F66B0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiJFMtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiJFMsY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:24 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2ECA287F
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:33 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y5so2546674lfl.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6jCYOSDu55V6QZBvLkF9j6tijgskxnXCKDfSvqsPbyU=;
        b=zNo2urZELR20lqD5BX8cQy92lhbO6KIH0db9xKR2jzP0X7yrVF5vTXKCJ7ypnJSI7+
         PX7KxhuoKJDQgWtw2MTCLFAinS/GPhr13JsmIKvXeYH2OHB7dxbVKm+XHo7VeajorQ3Z
         /IOWXOtGQ9tmpUmEdFhN3750gWXi1pL0eAfsYRZn+Nb917QQL5mgNQ1or2NLnbP497f0
         sBqHbkZ5uR/lssZT1ui1ryJDXS2q+kEbR6T8WHjDuHkUQVB6btUhHqwUhVMBi2peC4lk
         3DoATJXs+YihL0Mw8PN/BYJAqEv8AY539Hn3DuXloGgUghQWtzt7esFWy2PI8tA2pBd0
         k9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6jCYOSDu55V6QZBvLkF9j6tijgskxnXCKDfSvqsPbyU=;
        b=ogsazdOXvdoXcBXn1SMvJECYVXRxKqxqO0X2umwkbzlhBR9rsZ6D2ublQRFPcOJrUF
         4xkYAQ+Ahqg5jxv3RkYv6iXnnRLJ3Yi35fnwksSMODJKynJEHggDrFUgPeAq7OnxfcEm
         vJz7kAuyPnMZCfor/5v18NUh8C3h5Zr3aWmcCWSpHcBWV+KtfkuyK9rIrqF7m7r3cTHl
         Q8tPweFGpRzUvCiDK+v1KvUnokPIQMM3KN8KBcrZgNhwtsV75fVFq42vDie9OUjIDi+u
         3kc/+d0drkzAH6zJbuG5daz/j3NlrYKLGO8k2ltHb8scY2kAZP9Fe4RwvjcCeNHVoobH
         o8Qg==
X-Gm-Message-State: ACrzQf1nbsx1SqRYs1fAIwnQ6zMhpqbETHrLksdyVB6ypF1VN9EksR6h
        tWHN3/1vYU5+kvG/nRIf6q+KCA==
X-Google-Smtp-Source: AMsMyM5tOmNYurHbcPgoRnRCMP1iNmw6jOf9USN6u+0Lspx8i3ZHewpM1Qi4jbE7hAq4VcVGlpDbMw==
X-Received: by 2002:ac2:484d:0:b0:4a0:5399:9b70 with SMTP id 13-20020ac2484d000000b004a053999b70mr1959158lfy.216.1665060453329;
        Thu, 06 Oct 2022 05:47:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:33 -0700 (PDT)
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
Subject: [PATCH v4 27/34] dt-bindings: pinctrl: qcom,qcm2290: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:52 +0200
Message-Id: <20221006124659.217540-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Drop properties and required items which are already provided by
   common TLMM schema.
---
 .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 32 +++----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
index 5324b61eb4f7..0d73abeea715 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -20,28 +20,12 @@ properties:
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
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
@@ -119,17 +103,11 @@ patternProperties:
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


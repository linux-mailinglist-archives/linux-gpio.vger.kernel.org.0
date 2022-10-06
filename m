Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86FBF5F66AD
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiJFMtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiJFMsX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:23 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE999A3467
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:29 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a10so2146476ljq.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DTnkMyPtDfiwoSgvFf9kmj5h7qwOf7FMQFhN75k8kMw=;
        b=ciXpxLHWeo2k6aiELo73Wm7k5Sxf17v/fd6IcSpQCIXq1zJb9ik6ZDAdSfEwooRseM
         YKep+K5MizcKry35ksqSfezCVbwdcIxlXDQMUJ6Y9hbqW6tPvUg/3A7E2tZRfP4QxV+4
         5zEjlglm8+GQFKSDM5PdGibhx6kqNnkxd/hz/yaUhek8G2GuQCTCQ8jNYYcXmW0Smg1E
         vxdbl/NdoKQ4cL0aK8W9+Z9EotoHogLr6K9sGo6Tn5CLOlHbRw7cuOW1cn3AoSuvLwtk
         6UPKKkaJPcVUfPEyBMiJgI+GAft/uAo0nX7cgL/Vcxsv+liPpTu4jB3NfyjGj773eCck
         Od+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DTnkMyPtDfiwoSgvFf9kmj5h7qwOf7FMQFhN75k8kMw=;
        b=nPuCAC47iPv909HuTW00A2rXfZZC7/PsVcCT/JyfEccYhaDlWrtvsVabiPgC4b5wcx
         NaVbcET2JMOSukbKQZp19wV4CSV4jHpL4zRsfSAzOOPWn8jKJNr6RQ1XCXncMlDzIgrN
         4Y4gHjZyxugplQrAZEJ4TlVVpr2eiA71/guY8/s1QOWwDpApK178Aim2Ao7o7To9fGg4
         wTHgcHFAF77/GVeE7eX4r5tTIIEZgB2N5jOIPAazuf1VfZMDYkPft6htfHaKJl3cnLl1
         CY9TMi6WAV7c/uukcLo/fgenCxOlm7x+ctoHQmXwTiD6yoic7img1T0+zwjJ95GOSJnX
         NIaQ==
X-Gm-Message-State: ACrzQf0oYsuZLVw5p2LPzHPxZndB7qtYiq/rh3Pwlmv2OUpGr+36wgKK
        KNlkMFhkK32tbQNmEyvJUJF58w==
X-Google-Smtp-Source: AMsMyM6Gdx5ci4rSKeYaoMypk9fsgeXCvKxqkKJUKm2G5jdTcRNI4tJyCjBsD965OdQZkdvY8W6hCQ==
X-Received: by 2002:a2e:bf0f:0:b0:26d:e258:9ff6 with SMTP id c15-20020a2ebf0f000000b0026de2589ff6mr1840996ljr.356.1665060438970;
        Thu, 06 Oct 2022 05:47:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:18 -0700 (PDT)
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
Subject: [PATCH v4 15/34] dt-bindings: pinctrl: qcom,msm8226: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:40 +0200
Message-Id: <20221006124659.217540-16-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 33 ++++---------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ecb90c77f666..158c9a50101e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -21,26 +21,12 @@ properties:
     description: Specifies the base address and size of the TLMM register space
     maxItems: 1
 
-  interrupts:
-    description: Specifies the TLMM summary IRQ
-    maxItems: 1
-
+  interrupts: true
   interrupt-controller: true
-
-  '#interrupt-cells':
-    description: Specifies the PIN numbers and Flags, as defined in
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
+  "#gpio-cells": true
+  gpio-ranges: true
 
   gpio-reserved-ranges:
     maxItems: 1
@@ -60,7 +46,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -101,22 +87,15 @@ $defs:
 
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


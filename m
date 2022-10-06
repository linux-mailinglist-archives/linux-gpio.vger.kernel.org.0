Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F915F668E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiJFMsW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbiJFMre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:34 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DBCA2847
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:16 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a10so2146325ljq.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OAHt1yZlFdsFzWq4BFztLQUdzni5wG36g9KLn3uYMxQ=;
        b=x7uVAjjeYTaOFffqoH5g/JawOhf++ELM2PG1ocpPc+6tsgRsGraYXKVQ70ivym1/eA
         kPulK7J943wK6w6wVeBpIKzP6fzgLYP186O4Q+qvdy2xX5YlUzxUOBCOP+1uGLZCo8Iw
         sL8R4tCOQ+7wntL7tsDgLWrmFsiL7qyeh+TLbW/PsDl2Y4l5cdCsrIoShKo1bMdJ6MD/
         VqZVjx/ID8HotYU5h/2hndb/xIb6Ldielue/RjmrZudOp5QsZqcRUydjRyqAoKh/UW0z
         mQkh9qYKCTiOlCjbYLdX7OXoyLwbO6cI83QrqDxGd2MNs27WgRK0Ilneo/DEiXqzPiay
         49uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OAHt1yZlFdsFzWq4BFztLQUdzni5wG36g9KLn3uYMxQ=;
        b=3qiDFZa67qJwYr+gKrRoAoEG7QBj89xv4kA3U8Xz6ozAG05UMOHO6UUeR8OxFiAI+H
         SymC+pHI7OeS6DOAZdX0OIH0xNoJZ4CWmEOR/F4WY9fpmYJ7Qn8BXzD4HNIRyllIqn6Y
         /U9CiNefCL6Ekb4efpjs4Xxrhr8NTrJ9vqIw7XmOzbCk/WYKRPEg0+21GdZpgaaD0LNm
         ByhUVwes9fYeYPfGmGHnQciYwdx0WgKw0SDQ8A8qy9zGD+Dcc9CA2PNgeKTS7AYd6FGR
         CmxRqAb5JMWdtZBCZJ559WJfitlLV/QAjsTTpp/Gc01lUGZ8J68lEJMhgp+dL71d/YqK
         blng==
X-Gm-Message-State: ACrzQf2WwQYjhmvQWkr3sWMZ/kIx9kM3WpDkvxt0ypDik1M4zHGXJc+F
        1fv8g3h9L5s9tNOizb+xBtizGQ==
X-Google-Smtp-Source: AMsMyM7wsEglJDtWsrb1hbZaDsrs7fxuK6ClcLn3CskjgAKoyv+Q+jfCkn2Dv7E80GRuW0xPYdzumw==
X-Received: by 2002:a05:651c:1617:b0:26d:fbc6:edf with SMTP id f23-20020a05651c161700b0026dfbc60edfmr1794185ljq.453.1665060435624;
        Thu, 06 Oct 2022 05:47:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:15 -0700 (PDT)
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
Subject: [PATCH v4 12/34] dt-bindings: pinctrl: qcom,ipq6018: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:37 +0200
Message-Id: <20221006124659.217540-13-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,ipq6018-pinctrl.yaml         | 34 ++++---------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 735a8786cb13..e02bc15e0ad5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -20,27 +20,12 @@ properties:
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
+  "#gpio-cells": true
+  gpio-ranges: true
 
 patternProperties:
   "-state$":
@@ -56,7 +41,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -121,22 +106,15 @@ $defs:
 
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


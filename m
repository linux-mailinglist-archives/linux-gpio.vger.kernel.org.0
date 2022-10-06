Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9015F66B1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbiJFMtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbiJFMsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:48:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB3BA344D
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:36 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bs18so2112754ljb.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8jHVt4Wcuk7kdlxqQax1e0sLrENLcN4emuDAtVxRluU=;
        b=WGbdXTh2/BKZ9IFcHrcbHcTJw0t7YjtFLt3pQwOE/fp8M/2iKmU8MDKtGRCpYGdUVB
         qmH4OWacnwMRV7LHoD651ES7m2UdS2Fy2RgvxuURkceWxAvqM6t+/i73dFFFvAHrNfNa
         wsaS0PNbkdtQpm0TtAI9OH0HJ817g47IUmJjUdUGKeDSrM5HS6X2Lc/qEsdggaSjUlKZ
         JPT/ceyaOVB8H/AOLT5tUUE1ndos5VDcT5zj3zywuhJMOxHnwuo3hFl1RVy4Jm+I4FPe
         RX7+pMthOfJeBalqghV0E03s/BCYqRyjTM+FU9z5FThMXUaZSfnmhY6sHW6r9Ysottxy
         ahTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8jHVt4Wcuk7kdlxqQax1e0sLrENLcN4emuDAtVxRluU=;
        b=JS1QRgnOfFHc8+/9qVcgyMpwF6h5rVRaKUPUnbAVc7FfRmViCnu8GAQKkoKbC7KxMH
         u9hKPCSQuJdK9w6uuJ/SZfnbz7qh0cLspuB4iFb3JQtW40stq+4XT+m5LdVikdaemrw/
         lD4RR7ZnrV3+i9NPPTlWRJ/TubjdprcHcNJnsITbG4d91ic20SnOOytd3XQ9jsDJpDac
         +Ouiv4eFYgjpdiMrz8hYs4dJP87e5DeJs5KfZafpynNEtFGi+6Idwhp+bP0DImk/CsUq
         4d3fe13H/tuoRWZyE5GJXOauZ14ErtUgvS9RFx2Y8MwsoEO3XGGR9OR6I9RlbXvb0XRD
         DSzw==
X-Gm-Message-State: ACrzQf2Nw/7Ky9w8PEbSpXpil2nVKPpJLZ3RLSbjXqhV2TPd0J51m/I+
        Gpv2BPywVGg14RUjia5ZqJVrNg==
X-Google-Smtp-Source: AMsMyM51n7FI6cvXyKDorvUkIgIs1BkU6abtIImwWY74SSSP0VdNxeYipcll5UfAgyiciICBV+FlzQ==
X-Received: by 2002:a2e:9011:0:b0:26d:dbe2:d1f1 with SMTP id h17-20020a2e9011000000b0026ddbe2d1f1mr1818482ljg.230.1665060455681;
        Thu, 06 Oct 2022 05:47:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:35 -0700 (PDT)
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
Subject: [PATCH v4 29/34] dt-bindings: pinctrl: qcom,sdx55: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:54 +0200
Message-Id: <20221006124659.217540-30-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 33 ++++---------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index fff57abf4fbc..e02590daf7bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
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
@@ -122,22 +108,15 @@ $defs:
 
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


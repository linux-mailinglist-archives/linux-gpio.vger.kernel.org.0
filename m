Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A778D600209
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiJPRFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiJPREp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:04:45 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D6C40BDE
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:03:02 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id o22so5430504qkl.8
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qX9jS8r1kWRCjthqkjAReDtkW+PKcnHBXLWzLhYLJHQ=;
        b=FJs8CpqD0czuSaO+HnQXiQ5VZ4M+h0M3VOipgZiYqIgfjmE00uCINSxdSE87j0o44f
         WZ+EErsMrIPLz6aHFgVqAjiSM0AxPXe2ug+6RI0HzJ7/2zWvSF2Lcq68L8piAVBFJeTd
         6yr/tUOr+zSkbSeuu4/fECXB2+Y4Y2tD8pdgI54mc0zmZzZfX3q5hczKFxChK9s5RF1o
         N3GylOQZPlwclNFjbkrfQRZCyDJo6IAhMUT03+0D4/NxNWXEumxgzseNVP64goytvHyt
         nL7Lpumdqq5vmlXKh7Wb13U5jge+s8KHaTYaz3ss2dnuvp2Pn24nf8kHWq2/DA4Zw2MD
         OgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX9jS8r1kWRCjthqkjAReDtkW+PKcnHBXLWzLhYLJHQ=;
        b=yeLQyKfPf0z/xGFYJkQsA2zRW+FLiBErzNTgiUXIfBZAtq/0URE+gSS1TRW6yaeFCe
         yYTE316xFI+81UIJ2ETqcGB9kdp5y7PEbP/a8DVM42Kkh9z7ax0CJjHKmGwzTvWPuA5c
         vyXm8YxMRoIMKH9b2CMMTbpQV6znG3IrQHMCTpS6VAO+dcCCb7oH1XIa7eGphdfRPt1O
         pIOc99idufAKronjn64Z9znOnClEzMnLmm15B+jNp+D3d0YgxpEFSrmk6ZpjXgi7MoCi
         uxoV+cLy3kEHJj9tuTpP9xsmluWrAY/lEwWF1gRTSMmAz+iYs3KAsHEDVwHKxv5lDHJN
         AGKw==
X-Gm-Message-State: ACrzQf3QCuaMiekgj3lZA34s6fpF15LU0TXYcPTDgg86d1WGOMY6muyd
        6UKKASlqGt0ADGjJe64MkcG/Wg==
X-Google-Smtp-Source: AMsMyM67skOsrCkMB/0GC93g/SAee9RPTcpWTdfPs8vKmA/Dxsv8bCO7mQdnCwtSaMhPG8LHMh/bYg==
X-Received: by 2002:a05:620a:1212:b0:6ee:a8ec:c07f with SMTP id u18-20020a05620a121200b006eea8ecc07fmr5251564qkj.334.1665939774507;
        Sun, 16 Oct 2022 10:02:54 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:53 -0700 (PDT)
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
Subject: [PATCH v5 32/34] dt-bindings: pinctrl: qcom,sdx65: use common TLMM schema
Date:   Sun, 16 Oct 2022 13:00:33 -0400
Message-Id: <20221016170035.35014-33-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

Changes since v4:
1. Drop drive-strength (included by common TLMM node).

Changes since v3:
1. Drop properties and required items which are already provided by
   common TLMM schema.
---
 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 42 ++++---------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index 0f796f1f0104..523c072df05f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -20,25 +20,12 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
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
@@ -124,37 +111,24 @@ patternProperties:
                 qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2, qspi3,
                 gpio ]
 
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
-      - function
 
     additionalProperties: false
 
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A555F68F3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbiJFOHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJFOHU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:07:20 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73A6AE224
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:07:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r14so2901374lfm.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pRqxpn5cq1L5LfEhiXeoiCmT7jspcIhYvY65ZNp3+lg=;
        b=RNKGEPJm9K0hZtOvt64mOUIscabTpLoDpgNH76Gp7t9ZxktD4K1z9OWUCtuC/L7kza
         /rvqgBZzuTNM3I4KcXD8Qfs/jQG/BS6L+q9rpCS4prPwUuv2RDuOQyz+3Her97L4dB6g
         zEFhSm2RX7kM/aI/mx0hDRWg/p5xdiBQWxlBfsXpvjuFlY094JqLO0dPG4+hsGgFZ2Ql
         lAJoq0nDvrt6r/ucGmHMnZSffbM9qsreNr8dikDCy0qBq2IZHRlXMSi1GpX+OuZxLCkz
         mTtexSckUZSp6cDp+O/9urPY2Za3FYbRt2Dm5M9okL3AKnau/ZSZtLZbGAsypWD819ae
         LFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pRqxpn5cq1L5LfEhiXeoiCmT7jspcIhYvY65ZNp3+lg=;
        b=6i8EU5uv99Uxupktv/1IjRgmsVRk/uPePShufwlCoQbM0YbNVhzNrpq1LQbVgXwLkH
         zOG758Q5Loai8bdw7Qn8cqK348gmXmri3Xt4wyiqEhQElVFLGuhBSMjwGVVT0MVgNfsW
         jGpEt+CJpSWVHIuUOLvzsl/ynuYopmsMe3DN09G33Q0eF4d8nfjtMadAxyAfsZ3ITR7H
         OcV7mHsRG+8jMJrM7VI8YWqJa2RPSCssnOwogoDid3OOuar4DNtGdLICzJ+YEr66iAqr
         Qfm7qbBDvCJaEIdRywsN0aS+s0G10py0M9bOHNypR7MYIIDsXzxGY0BUmMQS9RoKh4Jp
         ub6w==
X-Gm-Message-State: ACrzQf2ywyt0w9THGuXCRiHyuwtWG1uvdyVg/10GPNw55uQFiqR/Kphq
        T87Y6e3OeMrC4cSKvuv5cTdv6A==
X-Google-Smtp-Source: AMsMyM4YQvoya5B1YDJYPwcqj8/hppOFy/No7ZaX6NCHS4yF5Mw1VLR6zutxz+coP2eyqD8Qw19Jhg==
X-Received: by 2002:a05:6512:1694:b0:48a:9d45:763f with SMTP id bu20-20020a056512169400b0048a9d45763fmr48192lfb.662.1665065219513;
        Thu, 06 Oct 2022 07:06:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:58 -0700 (PDT)
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
Subject: [PATCH 13/34] dt-bindings: pinctrl: qcom,sm8250: use common TLMM schema
Date:   Thu,  6 Oct 2022 16:06:16 +0200
Message-Id: <20221006140637.246665-14-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 34 ++++---------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index fb753fd8bbee..824a4dce1202 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -27,27 +27,13 @@ properties:
       - const: "south"
       - const: "north"
 
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
+  wakeup-parent: true
 
   gpio-reserved-ranges:
     minItems: 1
@@ -56,8 +42,6 @@ properties:
   gpio-line-names:
     maxItems: 180
 
-  wakeup-parent: true
-
 patternProperties:
   "-state$":
     oneOf:
@@ -129,18 +113,12 @@ $defs:
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


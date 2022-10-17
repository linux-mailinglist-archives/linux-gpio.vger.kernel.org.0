Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC0C601D09
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbiJQXC0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbiJQXBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:01:41 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60208304E
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:15 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id z8so8727071qtv.5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4v3rWmyeef5JmOnVo6r9YlCtFJ8e9lc8kXdpJaYHmg=;
        b=m+GoKUnADPOAa5wuMVqsQQp5YDXgAB+X/VnOqqxpGeaQW2lfAKZ1wVpbp1x1iMguUr
         VCdNYqCBJG29VlWhevWL8WiVooTkiHDfV4X+Z3I02/0Dri2g77uvm91Tixk2PweB1H50
         GTORdsmtqTI2/8Us+JsW0ZvmADq8lulbt4RFPg3F/sJBHK/yce1hWoFvk5s31ESuVieO
         KDoFVyjsNIU4BNCpXjbNLOFhiWVXSODzbQk9J6S+zhUqMFBRJNytV2g+O4A+Vfk5uGTI
         fU1y5PqWeXvk5fCkw0NRGjlrSPAg1UmDpGg+Sx6LRLBdHq6eIZrjeiMN6+20rehIXMWF
         MrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4v3rWmyeef5JmOnVo6r9YlCtFJ8e9lc8kXdpJaYHmg=;
        b=t2Msm2yLWe95i5qnGsyLnpqSuOslDYCUZ7VfgEihbBP/CBIFFDg07IVABjSfH7SA/+
         A8yVd7TRHIAzbjE9sU7rJrdJP4qcgJErwhj73sv1g3Cl+xIr0i/HofTg/lRqtfeNL2/b
         soXehqmQdDM0TH5mmAeMI7vCgzs1+ahKJ4x7ccra8vmVCfcw1DSFN8hCXarbVZYstu9f
         I8n1wU04f7ou3+19GoVqTJH/QIkgQO4LCcIIzam/irAxMBC/aQl1I8E2VUECLQBfSD94
         gT8/GLEJAJVUbjyjuCrvknRp4mLcf3SxC8ph8LxucKA4tBs4DjyT2KSd4K8tPiZ3d9xb
         L4mA==
X-Gm-Message-State: ACrzQf3F3kaQHKY+aJUZJfXdwrLjWj/SAGw0Rnnnwkq834yJITcfWr4l
        NzAw/I5RvoG90NA0Qt4/C5rRBA==
X-Google-Smtp-Source: AMsMyM7z3advciym/rxMYhae2DOYK+7sniKl5BKY91k2xfYd49qYI5OzGrB77l7Cmmtn+u7eGEZwjg==
X-Received: by 2002:a05:622a:1451:b0:39c:eb3a:ba64 with SMTP id v17-20020a05622a145100b0039ceb3aba64mr5649457qtx.610.1666047675066;
        Mon, 17 Oct 2022 16:01:15 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:14 -0700 (PDT)
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
Subject: [PATCH v3 21/33] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:00 -0400
Message-Id: <20221017230012.47878-22-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...c8280xp-pinctrl.yaml => qcom,sc8280xp-tlmm.yaml} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sc8280xp-pinctrl.yaml => qcom,sc8280xp-tlmm.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
index 886d4e76af44..4efde29c36a2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SC8280XP TLMM block
@@ -10,8 +10,7 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC8280XP platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm SC8280XP SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -39,7 +38,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
       - patternProperties:
@@ -47,7 +46,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sc8280xp-tlmm-state:
     type: object
     description:
-- 
2.34.1


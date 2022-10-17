Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F55601D26
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiJQXDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbiJQXCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:02:19 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1901383067
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:32 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id a24so8701921qto.10
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJqm8MsGkAbRd2i0J7XjABuAjaRO4uM6eWixa1qbFic=;
        b=j6avsfrWJKMcSUyz6Uiit9WYZ63kKMdYaVa79qRvIImJySjwCCqK1A9BLbY5+ouYKk
         1VUT2GynwnFe2U5ZYLv3WXh0Xnx1kPR1sRuTmkYJmupm6s4yxM/err9jFa8+iC0X2742
         Tj08eHcUZ+1E8OzwpbFCNgTeK5p6xUKPjHeQqf7G7qZsQJs11pPlG9XM170nYvubHyFb
         M1kZ5e2ZwRFhIg6KIJAR270ysd0bE3O5xsmnMNeYIdcnKaP7XZe0eDnVggy5ma1PFksF
         E5NUC4yogHS4dY6p3uf2k10RLEatuD6VbRcp64ZvG2bfXQw5AYgkdkdPDCGp5BSL0VYD
         lswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJqm8MsGkAbRd2i0J7XjABuAjaRO4uM6eWixa1qbFic=;
        b=csqhKeeCTTScokX1nx2/ijGhlyxnzDi+o48Jk5fRuKapNkiN7AJEBIX6QaAYwWPmN5
         R4iTQTYsVKX96eSTLffQ7CNHGYaKC34ZuYWTqK9F1glLPfWxh/L0C3rM1LQTFgMO46c3
         vdRNmPO2aX3WovKqCSZY4Ddxo0z8F82p3UOox3gMLetG5F4uJyT5z3TpZDWDbXg6RrfK
         UppKUCefGcoWlUeyxq9WLrTIGSMueEcc1ygjAY1efC5YxdPin3GDMhoHj1zlyNwSssDj
         IQDeRlnLwUvba+okSUJ177y/aIA+ecRQAt/d4uFTXyMoqKWgo0EYgL2kwzXSxbSfyryH
         aTXA==
X-Gm-Message-State: ACrzQf1FGxCkX3HSHRmJ4usgOxGpoFGqpsj7FCBmzwY1FWfS3kgzxXop
        aVxTFrfwiiOuSfDiewKEL7HMkw==
X-Google-Smtp-Source: AMsMyM5w2ZL8b3a7R3/DUkKl+0qSvfAvHYLq1nunHrsxQc9EOmk2WUjymXzSWk3+2O6IJ8+kvZy/4g==
X-Received: by 2002:a05:622a:30f:b0:39c:ebaa:8268 with SMTP id q15-20020a05622a030f00b0039cebaa8268mr5303775qtw.570.1666047668105;
        Mon, 17 Oct 2022 16:01:08 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:07 -0700 (PDT)
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
Subject: [PATCH v3 17/33] dt-bindings: pinctrl: qcom,msm8909-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 18:59:56 -0400
Message-Id: <20221017230012.47878-18-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml           | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index 9c647e24fa9a..cc6d0c9c5100 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -10,8 +10,7 @@ maintainers:
   - Stephan Gerhold <stephan@gerhold.net>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the MSM8909 platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm MSM8909 SoC.
 
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
       - $ref: "#/$defs/qcom-msm8909-tlmm-state"
       - patternProperties:
@@ -53,7 +52,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
-- 
2.34.1


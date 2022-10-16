Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EA06001DD
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiJPRD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiJPRD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:03:28 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149A642AD3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:02:27 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id mg6so6240845qvb.10
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzWzb3hZrQFEQ0Rr65DWDq+RHVqeUt74LUhgKPrHSTM=;
        b=fcSTYvPVw/cVvd4ShMu7voCZ7hk1aYWR+T17HwIoW4ehm5RFmGA205Bmx1u0lv9Sfo
         kP8soj7Mtxv15L/LG+iULSL2PE+HkPPp7vXrwyGGIs3Oo+gaS8/puPip7kqZsoQcYkSc
         5s5q1aQBpzEKNVoutwCqIsmPCq42uziehYKDyLZ8YUMKF/GsHzCqoHTgD3hc8R4bqxfm
         R5ViEqFeQvb12KahntWq9YnKzRn62boYX8+XJbbTbjcisFb1xA2eZfGbZ2NrcRp3/cEj
         hAGpq04GInAc/+VlRRbGKsSDS/GoHv5KUFSkTQTZSdSga29PxrHKtHtCQgKfaWiPhz5P
         KcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzWzb3hZrQFEQ0Rr65DWDq+RHVqeUt74LUhgKPrHSTM=;
        b=7dtNlFZxwo2qx9iLLf8Vs4lhJaMfBuhVNVMxDjTKke51TVEQJc9nD0g+RWbHs4qKqj
         YCP+bi7CBJWjBsBxAKRqO5OpBVJG8LF68p+Y8aYLwRmsTcJSPEW9x2YWonogufiMXXyx
         5onZgxY/CKcVfT2KEeBxkQg3AdNtTeSJAR4RBCK9BK6RSe4fVhIJJu7b9G7sn5F7PO87
         9i4ZNGsLbjabX1u7zaJeCNfSo6qZfkHfUJCzjpkVgjVAkFTAR2p0UH/WO3t39DzPbd98
         IFuahHxt+XYcDFHddFa6X+BmeO+VNHM/FVeAz3kQac2l5AGS+S7a+ayGusOL/XbjzEX5
         st4Q==
X-Gm-Message-State: ACrzQf3L/WpPmiVsxDWIsX/4uGxA3KBobbTxmSS/G2FBxs1DtvBNgpp1
        YKy9b4huviB81FRWjhU5csxuIA==
X-Google-Smtp-Source: AMsMyM6XH/jwBGJTyeMxGBPjh7ObsBDlIzckH4fOxGCl7uiuKg49K4IhqAkbH1IzjqmsSYhDx1nfCQ==
X-Received: by 2002:a0c:f4c9:0:b0:4b1:b290:a4d with SMTP id o9-20020a0cf4c9000000b004b1b2900a4dmr5738931qvm.68.1665939737675;
        Sun, 16 Oct 2022 10:02:17 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:16 -0700 (PDT)
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
Subject: [PATCH v5 21/34] dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
Date:   Sun, 16 Oct 2022 13:00:22 -0400
Message-Id: <20221016170035.35014-22-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index d4da558cde54..c162796ab604 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -44,9 +44,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8953-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8953-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8953-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -163,7 +171,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 142>;
 
-              serial_default: serial-pins {
+              serial_default: serial-state {
                     pins = "gpio4", "gpio5";
                     function = "blsp_uart2";
                     drive-strength = <2>;
-- 
2.34.1


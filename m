Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F30A5E89E7
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbiIXIIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiIXIIA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:08:00 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BB115564C
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:06:00 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s10so2317999ljp.5
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Zawl5uwjby0oyqN1nYVliQNubSbgLZAX+iK/cI5YQFc=;
        b=NsinxENL6TBcJwYzGJuvtGBKa4JU2xIsBigfXUSO5PVd4Xq9Dn7l4gE5BPx0ydV90G
         PPPIph9mQaTIOv4wDWnraJcLlz3x0mFBEK+TjZSNCU+DFWdwEJRzM1/sRUP3dCFGiPZ3
         M/pKu4D4OqdA20l7fXNn3D+H7UD36QVYrSvFwZY11OgN3rBD46rAIZkjOOeYcFLA5Kzd
         Kt2grbjcuGLy3R9BdD16pMYKcV4m9/qUsry+xBr5Mgre5NJbsboTcsacfaPIthDMjbRZ
         c0l1BpfyDE73UqIblwAVp6MZJbhnzg51M1XJu+bdfxRfXlJ0cQ97XYjJl8Fck6jU792/
         pU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Zawl5uwjby0oyqN1nYVliQNubSbgLZAX+iK/cI5YQFc=;
        b=79YshEgAv65wuimiewp7sm4oZP/GIjIm8Ky1L+NlfLzVFXSvkTZNtfqB0jNXiE6jzj
         C9xs1/n9afkY/eZJW2RGLkuk7WbQy+14QMqfiO7uUeIVwUEHYzsHWA+vMvgHru9ZUmp9
         BaVoCkm5OXG4I05sKUH0k78TTWst/p0egod2iusIWSWeqSvUon3GtvCWW0a7PStTczfE
         bNwRGEqRH27Mmi0boCY7IzmKY9vaeUjNLmnrMw87Lx1r47oWw2YukqKUrCgywMqTeS3l
         FAYHr0d0Tu7EdX4JCYgzznkVhos+Xbl0SDYQIU/nP2whwciwii/D6owgoHuz0lOopOUv
         5nDQ==
X-Gm-Message-State: ACrzQf3qlVzEXT8c/YBLqgeBBPe3YVDzelN5l9mt1F9v1Oqkhanhril0
        0HHLcRmlSDFP6mE60zp8QdSr7g==
X-Google-Smtp-Source: AMsMyM4lxZZvY9zIYqBvmNQ7eSjyKMxnFjB3hoPpP+al5KmDZzeMaDyh0wObWQUpsGWtP6j/efSiLw==
X-Received: by 2002:a05:651c:1111:b0:26c:7178:ac4f with SMTP id e17-20020a05651c111100b0026c7178ac4fmr3789553ljo.461.1664006748404;
        Sat, 24 Sep 2022 01:05:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 31/32] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:58 +0200
Message-Id: <20220924080459.13084-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index ad3496784678..4606ca980dc4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -47,9 +47,17 @@ properties:
 
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc7280-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc7280-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc7280-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -162,7 +170,7 @@ examples:
         gpio-ranges = <&tlmm 0 0 175>;
         wakeup-parent = <&pdc>;
 
-        qup_uart5_default: qup-uart5-pins {
+        qup_uart5_default: qup-uart5-state {
             pins = "gpio46", "gpio47";
             function = "qup13";
             drive-strength = <2>;
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3266E5ECB70
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbiI0RmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbiI0RlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:41:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CB51EAD6E
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:39:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d42so16878986lfv.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3AqWHKVr9feMrytN8eOln5pgl8oFY8kkD5WrTOHH3LI=;
        b=GdMnuyBadWE6RY5FYf42KqN/L7jDWDkoO6AH1LjPopKnbJ7M+uzZbFPEq34A3eeOV6
         9afiZXMCcFT/Okh8IS9/6cMQ4Htx+kcyOqEIT4C1jBxBcspvUzOfPhmAhtMg6E2lfqfi
         mUVUiRRRHtWsmw1YNi7GXjGRjYL2asiHVFWj8AVxHr3kY5CFNkt7Z8onYnGuAqC3rHZ/
         0YHvw384Xrjq5yETufpVWULE5/9pP4hfMzwgVbGDa9mNFY/tMo2QLZAqBvxIgLmL6Qfh
         FYKEZjpXJRnpI8IMl2B+WV9/MEWa71h2/4azqnr7Q2M3MMA6jW1QQid+B1yxH3WaAB0K
         MXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3AqWHKVr9feMrytN8eOln5pgl8oFY8kkD5WrTOHH3LI=;
        b=aILhf8fP5sUyvj1oaPf3G5V+eAdtjcK26YHZ154Resbc4uQWqJfDbYoOeUd3q9Ri5d
         P4mFJvKUWVWRdhXUP4scB7ocJZXfBXCTbuPKc7ifg0WUqia/aSMomoMZnaPuwcDhdcGM
         b0iQV6gqc3qpm+gGaJr+G3lKSGp7roixtJRGEVDwxKzK6/jWQyZsai2RrHy6osP+V0Oh
         UchiOyt/ofoPIOFV2ZnvZXdDfUWv8rWBqvLQTW4UoNvOf3GBCnja2XV9AxutvZJ+Wbu2
         Rsr1JBqoWeIhE6z5QWz9DckPTTnWxwQYLk2Tu5RtyCG7ML16cjtgPCaiKOdniU6V/Umi
         NFdQ==
X-Gm-Message-State: ACrzQf0oJ05BCWYraRKEo2sij0jS/TDoJCZgtL2iBQug2PygIgmqBLmv
        +YuuAjTN7IEYekSmqJsQvvJwUA==
X-Google-Smtp-Source: AMsMyM7Vfpm1KjgF04GbyDZRSJBk6DiRWvxzIQJ+d7qgM5waYGzlYTKJbxcYW1jrFyTDxI9tgoh/kQ==
X-Received: by 2002:a05:6512:3185:b0:49c:3310:6910 with SMTP id i5-20020a056512318500b0049c33106910mr12790994lfe.352.1664300354756;
        Tue, 27 Sep 2022 10:39:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:39:14 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 31/34] dt-bindings: pinctrl: qcom,sdx65: fix matching pin config
Date:   Tue, 27 Sep 2022 19:36:59 +0200
Message-Id: <20220927173702.5200-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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
---
 .../devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index cdfcf29dffee..0f796f1f0104 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -49,8 +49,10 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sdx65-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sdx65-tlmm-state"
+        additionalProperties: false
+
 '$defs':
   qcom-sdx65-tlmm-state:
     type: object
@@ -175,13 +177,13 @@ examples:
         };
 
         uart-w-subnodes-state {
-            rx {
+            rx-pins {
                 pins = "gpio4";
                 function = "blsp_uart1";
                 bias-pull-up;
             };
 
-            tx {
+            tx-pins {
                 pins = "gpio5";
                 function = "blsp_uart1";
                 bias-disable;
-- 
2.34.1


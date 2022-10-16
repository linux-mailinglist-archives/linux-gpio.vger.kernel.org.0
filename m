Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E03E6001D7
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiJPRD4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiJPRDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:03:21 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93732419BF
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:02:26 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id cr19so3261736qtb.0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KqImZmGxWpbG6r7f++yaRkl8o1vQR5tbeGhirJSHY0=;
        b=v/M6ip3MxgYpgBZc4ryivZl51H3jr7g0HLNQRvWdiWV9O/L/kL4rtYaAP8CEVYnXK8
         Qxfug3fjiaURLcAC4ZeG1FEsZDQS0y08QYyfUE+8UH208t2rGGzcKPgl5KpXY5KilBfi
         ehh9nUR9gxyU+f/Z646NZ1J7x5z7AJ9/4ggDAjsfBn30gsIbIbKMfglhzp0bv+sJX0m+
         51aUYD4YKBiU+S+oQW3Nr+TmAH03/kk0B9Tb/S0lY49Jt1XR2AA6WwHCDdVWMKGjq6/D
         UFSPu6xoPRNSPapq+6PoAe0FW2GiWUPrAk6u8iZIGfyORFpq0gh8W16h0b0Zf4vII2+u
         1nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KqImZmGxWpbG6r7f++yaRkl8o1vQR5tbeGhirJSHY0=;
        b=uS7m1C44IV6y1sc15rXbCawwgNmUD+EI5dllUd2kpgZfb29TISpecYAjkDF+VSWyEK
         mZAcGSnJFfLDDEgP3S+nUFgk4SIo2tEejXESK1ftxoZyqkkRQtPE9Z2ITIffQFVEmr2U
         hFLy95flEasCRnkAawG9rNiOfCEtS/ZpNemHmras1CRUhC4V3rdJ0REuNWNkSBZD1FlF
         6AXnzfibK+TspLeEst45tLER9V32n3t40XZKGJ5npqMNjhKSmQwpufFeNMsepD161U3K
         P1kcDNUni6KvKS7kWy1xraMrlBANCGO3q7bbpL8YVKc9egqeF5DtT+qirbrzcDG2X2rM
         x8xQ==
X-Gm-Message-State: ACrzQf3eyKORzNTRjfGnzS5zeFQ+29D/bK7ZoZzdPoOgYu1LJsuKA584
        aIkpBzJRa51YViSJjAr4TXvX/Q==
X-Google-Smtp-Source: AMsMyM6jl0nA1U7PKEPaV60878797PfcE5kR34WoHGgS3ot0Ytn69yuVSTc20xaVT0JwAnSOSMqMjA==
X-Received: by 2002:ac8:7d0f:0:b0:398:3029:3328 with SMTP id g15-20020ac87d0f000000b0039830293328mr5861586qtb.99.1665939735125;
        Sun, 16 Oct 2022 10:02:15 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:14 -0700 (PDT)
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
Subject: [PATCH v5 20/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix indentation in example
Date:   Sun, 16 Oct 2022 13:00:21 -0400
Message-Id: <20221016170035.35014-21-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index 08e2dd5cbebe..9c647e24fa9a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -118,35 +118,35 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-        pinctrl@1000000 {
-                compatible = "qcom,msm8909-tlmm";
-                reg = <0x1000000 0x300000>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 117>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio4";
-                                function = "blsp_uart1";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio5";
-                                function = "blsp_uart1";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl@1000000 {
+        compatible = "qcom,msm8909-tlmm";
+        reg = <0x1000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 117>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-wo-subnode-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio4";
+                function = "blsp_uart1";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio5";
+                function = "blsp_uart1";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915615ECB43
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbiI0Rkv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbiI0Rjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:39:40 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608101E76A7
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:50 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l12so11711063ljg.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V882ZXRWt861rkG9mSWqjy+/gID1mfuqr2SQxJhNRpo=;
        b=RXEfRIG3/d8oJHs6dyEWKkZHiD7YyOXuQA9gv7634oFUdJT8G5iRJgnHBWkTkmaNEZ
         p6q4VnhHqxXVBMbki+ROYtBEiZ+kbiMmhPgdhfm6xuAXLYlvemooBAJABEUOzl8JpXFk
         5tjgDis3EUAu3+/DFJ8dnfPFgdYQB4GocvBnJCqO5vjCfEAtmUyJt7lUFrFYMhhIYeZ4
         xAqkdeeOEL4x6RfC5e+6CvdeztppQ0R0lrI21mDybYKwB+HA+cMJZcbtq15qItQa/GSZ
         HLGVaXzms3LIipbHSxDfkH+6+HI1xtE1+j4NJB+5dh3aQ+OIWFOJHbbEa522LXd2wzSM
         HIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V882ZXRWt861rkG9mSWqjy+/gID1mfuqr2SQxJhNRpo=;
        b=7gF0n52REN+qMCGDAoQlSRk+n1d/qwuYyzrhbbPdKjXAuUvz8BiyF7YvqZkZOZAxTD
         4dxTy6bKFYG9W/hzR0hosnnPU0Rtyz2iRYq8FS56glqXHHucpvdEaKL1LSymcWETHl05
         Gia1kLFm2Fob+5jUyq0LLkvK4joAhsVwL7Jirs9zoYmhOrdLMJrteEY4Lug33wthF3wZ
         oBrppuISAOY9gNQ7nfFFhGa/KrgACyXrC2fSe0Tt0F9Zx6sBvrYbxvpITr3CgCPtDEMy
         WOvtjoYR5DF6zO3+eKvtvBhuzIPWTQFwoPREPLIbfWSse1cK9FdXFW1V23DGcpxJdbtE
         UMgg==
X-Gm-Message-State: ACrzQf0qCAuicGUQMEltbBmLJ3nDnEuoySeia6h4zMokcgUK1lfDXOyS
        Iv7GTd++rKDG3P5j3IpexVhK3A==
X-Google-Smtp-Source: AMsMyM45ofWxYiGMVPOcglyvDn9RTSIMn+Tvv0Lv5W24qlKkcskQbihAxvB/gxsMYPuFEDxas0kVag==
X-Received: by 2002:a05:651c:897:b0:26a:c213:f0cf with SMTP id d23-20020a05651c089700b0026ac213f0cfmr10470266ljq.216.1664300329689;
        Tue, 27 Sep 2022 10:38:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:48 -0700 (PDT)
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
Subject: [PATCH v3 23/34] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Tue, 27 Sep 2022 19:36:51 +0200
Message-Id: <20220927173702.5200-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index 1bf29b82f486..6d97ea421633 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -159,21 +159,21 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-              compatible = "qcom,msm8953-pinctrl";
-              reg = <0x01000000 0x300000>;
-              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-              interrupt-controller;
-              #interrupt-cells = <2>;
-              gpio-controller;
-              #gpio-cells = <2>;
-              gpio-ranges = <&tlmm 0 0 142>;
-
-              serial_default: serial-state {
-                    pins = "gpio4", "gpio5";
-                    function = "blsp_uart2";
-                    drive-strength = <2>;
-                    bias-disable;
-              };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,msm8953-pinctrl";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 142>;
+
+        serial_default: serial-state {
+            pins = "gpio4", "gpio5";
+            function = "blsp_uart2";
+            drive-strength = <2>;
+            bias-disable;
         };
+    };
-- 
2.34.1


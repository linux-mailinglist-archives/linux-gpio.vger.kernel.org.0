Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A7D5E89CE
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbiIXIID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233717AbiIXIGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:06:50 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB3814F286
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:45 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a10so2387943ljq.0
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6+EgX4QUTZBqad+VbzdSiC8aLzAL/6GsYzQHJR1pJJ4=;
        b=h2wnBXHsAYs7WKS/KXFOg05ZsJYUONjRoyQPQnY/PDOhZEclvCv0VfY+/7fqOz8WeI
         bujzzF29RUWFcc3TvGD84JxC7bOo8BzcSF/rFaFXEMSqYqL24c8N9waA0gU/HDqMNvni
         QrvA0PNo7Wy8H7n6kpYZJBF6IpgpB+1B+r92xeyXyuQ/8EwCFpev3B3039mqFCBSbLwP
         WTGyTllTvjzmFTxEEVRHjpuiH+2fLd8T1XtQn8SdjCsI0iQ+CKMnqbH7/y0Krjpae1jU
         ob+GgmgieSPoC5IlYGZGaDS4cjLJc1y5clz59UzDHjlCOhMuzZM/WxiwbcW0XiVMfbPG
         fzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6+EgX4QUTZBqad+VbzdSiC8aLzAL/6GsYzQHJR1pJJ4=;
        b=hgRCfhVCfCTVEiFT0rQ1l8CUhUrwSMf0solDWS673sJWcUuVq0CN+sVvPaK7HnL9BJ
         9XrtceLLkTXn4j3+KVfNtUXZHkvZdEYbs2DD6ucWXt5W4w4E9kOYOznxZOdHx7MZCWND
         fXF8EFyZOA7yKtNCEc0frESIsjnSJvX+drDN61oTZcRWrGAp9H3Sh+FWJfdMnk+CjhXC
         E0UX61lRKw+uyLcg8GQUO++hUSYJ0msfT9cotRXbLlUPXJxzjZxw63se3eiHxX1o3qbc
         3Vhou7N/g2nyp7d8DW/KuVoKsraizVrUX5wVp6j+Aqc/OD5U6U3vh2JNKYCPMUZ4SY5k
         O7Kg==
X-Gm-Message-State: ACrzQf24vWtvxh2V+KNQdOyiQe6/PnMQSNvlZPhvqDN07zLf6BIIMX5P
        xGuD2KNtWWyL6lyu6rNEanJ9hQ==
X-Google-Smtp-Source: AMsMyM7lmg1xzNo8qYpqlYg2XO2fMiN/E0vw+x6jpv28EdC1XKBZ2TP+nJsqLPlFmqfVQrnDx+rFPA==
X-Received: by 2002:a2e:b8ca:0:b0:26b:e846:ead9 with SMTP id s10-20020a2eb8ca000000b0026be846ead9mr4086311ljp.224.1664006744469;
        Sat, 24 Sep 2022 01:05:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:43 -0700 (PDT)
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
Subject: [PATCH 28/32] dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
Date:   Sat, 24 Sep 2022 10:04:55 +0200
Message-Id: <20220924080459.13084-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index 006aeec7794f..e381769e42ae 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -151,23 +151,23 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1f00000 {
-                compatible = "qcom,sdx55-pinctrl";
-                reg = <0x0f100000 0x300000>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 108>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
-
-                serial-state {
-                        pins = "gpio8", "gpio9";
-                        function = "blsp_uart3";
-                        drive-strength = <8>;
-                        bias-disable;
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1f00000 {
+        compatible = "qcom,sdx55-pinctrl";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 108>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+
+        serial-state {
+            pins = "gpio8", "gpio9";
+            function = "blsp_uart3";
+            drive-strength = <8>;
+            bias-disable;
         };
+    };
 
 ...
-- 
2.34.1


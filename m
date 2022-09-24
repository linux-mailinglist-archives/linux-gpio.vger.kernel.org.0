Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838515E89B7
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbiIXIGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbiIXIFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:51 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD69012166C
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id p5so2273313ljc.13
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QO7QqXbmKh3g6/j5SdIlkOzEb11401uJk2Kjlbs9Gs0=;
        b=kTHBiuOO4cm9gsDW+/l1n74kftMsOwDVohug9OYk6J7P9B+2JgMmmKr61eCrzGNEKx
         gS11EZcl9rM27Yk2bgJGkiME4juCmVYi7yW40Vcx2EfKe5k+PPLo67ItJUYss1ddYhUE
         UQ4vlqma6WioCD+tYdlykPxENaGLm82c4DiR8z0quH2756iZXOXyGk0TY7fZg5L/Xm/L
         oW6V2lNRJyN8oFXjPiL21RqENC22gunu1nIiPQdGBjyR5ES3wVZ0m8TCcIFoieGZF5Ly
         m+ViNcVzHgpGKngWGi/fdhUqEbdTqz25+mnhWptQ3U4ew1BbxkwDIBjAH9WRhea6XTRr
         Azig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QO7QqXbmKh3g6/j5SdIlkOzEb11401uJk2Kjlbs9Gs0=;
        b=M90TIcisW1begBifeCZN+F3q6imiO4V48fwnHyYwtDDqG42LwyYUMqTcqYLSVcdIyu
         fKdPDufaZdRCfhMAMTqhyVmh6GWp6E08vZTVTewD1T5lE2v92+HBtz0/SUgXYXwkPHiM
         h9bq9eqgu07H6sF4TooJ9r6uLOvttqyhqVGr8obUwJ6blnbbPk2e5tOWLjtl4B9AV9Ud
         9spLeFhCBBkGo7w+C0Zexw1FMlLGEU6kBUhrwYIGrBj1VYwJnKXl0QOvp0DDSXQj5m88
         xbrIWi9TfOWsYqCOTBz4XJZMM3SlxDv+wpntqA3aaYsHevov5EeXrToA6QvLpRHvjeWX
         D6aw==
X-Gm-Message-State: ACrzQf2xRnTEaiYncZnfkv1KNt8j3/CXueqdy/M5sPpcIe7wGxkXJeJM
        a64JA9KhG3TnDQRD1lzjob5G4A==
X-Google-Smtp-Source: AMsMyM6WjCbaiKPbj6inOFUxJfgv8BOTT6UQFrx/FanhnWY5vE+V8dWNK6mzWDuMI/t+AC7MG82psQ==
X-Received: by 2002:a05:651c:1694:b0:26c:5624:6d37 with SMTP id bd20-20020a05651c169400b0026c56246d37mr4191100ljb.500.1664006727173;
        Sat, 24 Sep 2022 01:05:27 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:26 -0700 (PDT)
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
Subject: [PATCH 15/32] dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
Date:   Sat, 24 Sep 2022 10:04:42 +0200
Message-Id: <20220924080459.13084-16-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index e665ae7ffe3c..61200fe7a748 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -128,22 +128,22 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        msmgpio: pinctrl@fd510000 {
-                compatible = "qcom,msm8226-pinctrl";
-                reg = <0xfd510000 0x4000>;
-
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&msmgpio 0 0 117>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-
-                serial-state {
-                        pins = "gpio8", "gpio9";
-                        function = "blsp_uart3";
-                        drive-strength = <8>;
-                        bias-disable;
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    msmgpio: pinctrl@fd510000 {
+        compatible = "qcom,msm8226-pinctrl";
+        reg = <0xfd510000 0x4000>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&msmgpio 0 0 117>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        serial-state {
+            pins = "gpio8", "gpio9";
+            function = "blsp_uart3";
+            drive-strength = <8>;
+            bias-disable;
         };
+    };
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660F55B5407
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiILGSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiILGS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:18:26 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947432A269
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f11so13137309lfa.6
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BzxKI895lpDHkY+H8tKxOiDzUL4EnCHd/mNz95fFCeE=;
        b=Xlg2dIPv8xQTI2AgZqSOy0a3Aoq6/qTwvZp96vZCURU6ZFq6elhBgbi+MDZ+FWhwl7
         rHCaWo2Dg7AdG/tHit2VZWr5/Mwq7CAI4JXV91OO88J9cb61e4OTOiONNSU3QCw85qi1
         HsXwbWSs84Zn5XJ/YMcrDGhtEBXk7DD80Hfh72uoSZBRhnp3u0NLHCxcT3X+NSMSufXA
         bOA/spka51nXO7cPIyvCzg9A9DMeYSuWkVQaNVn+6CBxYd1BF9/MOBeK80Z7XrClV1t9
         paOd+HnY92BLRntDxYOFYqHXmudEkD+IvsJs1rJ4XEAfy2ZaMH6GRnmFNjdd1tolLBUF
         YehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BzxKI895lpDHkY+H8tKxOiDzUL4EnCHd/mNz95fFCeE=;
        b=yLBKS940KftqJrPmz2DZKbJEyUHSZvD/EUbMlTQiiJH1LcOsLdVjZSCmsGfjfy8IJO
         8mLgDo6du6rdOjQQaukjoj/RZqBRjJtwf9uvFvRbTNsTjvzPImJFI0xp5JPcdHOCZLpy
         qWaVIGJX/5B8uKNx3ofUehMwxW9VH6qFZ8rFOJUmjI4sL4YbI93CC1X9RweNC6jxZZkj
         xdq/y9Pk6PXPHm9bQi4iOIvQt2PuNB5YV6XyS5MjD7wJY0aDJhKHZQT+Tx3iDDkFGKL+
         wT866tkQLbA5BxfXrLl2P7uQ4pFvgqnDtysoCGL64qigXZIFnSxvoIPrrZcV0ZpeXnS9
         Gudg==
X-Gm-Message-State: ACgBeo21OOXCcPP45XfM2CcdfQgG60waN0NmUun+EecwW5QRcRtgj48Y
        6i3qFEr0QFN4hxtOUrvd2jD5zw==
X-Google-Smtp-Source: AA6agR6sXXzrqW04NblckGlbqXqV1UYsxNrNzA/iOY8ECYU7WjBS/pjnOgtbds7HAADn4Lg7FRDjwA==
X-Received: by 2002:a05:6512:1687:b0:492:db5e:7768 with SMTP id bu7-20020a056512168700b00492db5e7768mr8804019lfb.118.1662963489273;
        Sun, 11 Sep 2022 23:18:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/40] dt-bindings: pinctrl: qcom,sm6375-pinctrl: fix indentation in example
Date:   Mon, 12 Sep 2022 08:17:18 +0200
Message-Id: <20220912061746.6311-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6375-tlmm.yaml    | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index dbd91d6b63b3..025faf87d147 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -134,34 +134,34 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@500000 {
-                compatible = "qcom,sm6375-tlmm";
-                reg = <0x00500000 0x800000>;
-                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 157>;
-
-                gpio-wo-subnode-state {
-                        pins = "gpio1";
-                        function = "gpio";
-                };
-
-                uart-w-subnodes-state {
-                        rx-pins {
-                                pins = "gpio18";
-                                function = "qup13_f2";
-                                bias-pull-up;
-                        };
-
-                        tx-pins {
-                                pins = "gpio19";
-                                function = "qup13_f2";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@500000 {
+        compatible = "qcom,sm6375-tlmm";
+        reg = <0x00500000 0x800000>;
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 157>;
+
+        gpio-wo-subnode-state {
+            pins = "gpio1";
+            function = "gpio";
         };
+
+        uart-w-subnodes-state {
+            rx-pins {
+                pins = "gpio18";
+                function = "qup13_f2";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio19";
+                function = "qup13_f2";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1


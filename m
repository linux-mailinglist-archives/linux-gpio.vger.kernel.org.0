Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8295B4DC9
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiIKLMX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiIKLMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:12:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3617932BAF
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q21so10450106lfo.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dSJXKFEZI4T1kbFyh1aKF3VNgs72FXruybc3OKrfZRY=;
        b=jo8qL1lzX6sqaYGkYSiIkt9PrTiHRayD48nKuHJiOgVjCt/HedHQe5b6w1I/3MN3Ro
         dnqfXQzy2+czLjGKwYVv5TihLCXba6DjR8UJVJ6MBU9byse1BggQQgavNTn4WAKyJluo
         9fSTUQqR75eYIdwnpDXilI08olf8O+kZ2lDwBShnmbwDhlIKd459csM0erQtRGH+OOJT
         3JDA5wCs0PUvIlQJvZjFpmfBMlkavkbouz3HsLK6OvYhbSPqKhH6Cv2LmfVNd9AZKX2j
         +PqQN2qL24oIFSQRTkCom00Wu1eMkySP2mAw5LfTs9f2aPx7ZxAcCYrXTULNfuPjWmTb
         1GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dSJXKFEZI4T1kbFyh1aKF3VNgs72FXruybc3OKrfZRY=;
        b=UPeEnwhAj3gUZMDQgk4nlZBFJUMpiT8zc3B++TwY0csov6BrLmR5oDQ8POjP+5qJqu
         +/OuGHBJjj6fNV1mblCN2eYR+gc+T0eILJKKhPOOAO3JigN3NghsLuoNbPmaxHCW4afl
         jlPZJRTivj4kaiooNMvmUuckSXTHuvqB7pMRNVFgwWL9jIrjDDNZwjAQwQ5vewceCPEc
         dYGRmoN0/XgJDgNaHhSmh9xYgjHuMXqZP/3Hu/muD34JeQeuthkVbfnNtFNx6Bbo8EZR
         4xMGta8QwVUL/NaK60q4QozRxD6rux7gtpWHFO8mirNG97SZ5jfteK4A7ZvwbC9U4Pd7
         16oA==
X-Gm-Message-State: ACgBeo0FI9U5i+eKONZvqOdABjlsMQx9iKKqwc2eQvMSNOrO6NWVR2s0
        8jgmqm1TSfK5qMAxi0sqHOUqSw==
X-Google-Smtp-Source: AA6agR4xs6t/I6gKtYWYbmzLXuTI/TdMbZcCMwUyt2/psDoE//q5TwFBWMJL/FECB777AUpK+gM2iA==
X-Received: by 2002:a05:6512:21c8:b0:494:6f67:34b0 with SMTP id d8-20020a05651221c800b004946f6734b0mr7030752lft.543.1662894735657;
        Sun, 11 Sep 2022 04:12:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/40] dt-bindings: pinctrl: qcom,sm6350-pinctrl: fix indentation in example
Date:   Sun, 11 Sep 2022 13:11:29 +0200
Message-Id: <20220911111200.199182-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 0c4bf6e90ba0..856b9c567ecb 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -125,34 +125,34 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@f100000 {
-                compatible = "qcom,sm6350-tlmm";
-                reg = <0x0f100000 0x300000>;
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
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
-                                pins = "gpio25";
-                                function = "qup13_f2";
-                                bias-disable;
-                        };
-
-                        tx-pins {
-                                pins = "gpio26";
-                                function = "qup13_f2";
-                                bias-disable;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@f100000 {
+        compatible = "qcom,sm6350-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
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
+                pins = "gpio25";
+                function = "qup13_f2";
+                bias-disable;
+            };
+
+            tx-pins {
+                pins = "gpio26";
+                function = "qup13_f2";
+                bias-disable;
+            };
+        };
+    };
 ...
-- 
2.34.1


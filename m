Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C92F5E89A3
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbiIXIHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiIXIGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:06:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78BC124772
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:35 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b6so2287175ljr.10
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vixtjzQEFhxmeb9aw2Fa7RIQ5p3yDWyK7tLeGuq1/oA=;
        b=w3ey7RiXbNN/tFzziGglHlRF9pyLgrrtJyyvu9JmAwAnIuQpJG8kvI+D6mhcErxdxD
         oBzbeOqbh4wb/kLDFWIhQTcs7qSI+eIcZyJlgHe9UitripyvlAJT3CcjZ3yQEyJ+vlvH
         hGFOsZs6tED7L8HsXYDa3ipXFdDa3L9oDZDDA43dg8U+KeI+Bs9kITOX1wuu85gb9sQK
         IHkrhTNhB/QkVCPRwDT0g0aQe7O0bkefqH7nRA1lcf+wJJSmoCjaSzDcGzvBM0a3ahsm
         XHG5ayiybe9PhocW1Ooepo0bdStg9yqffEHAphiWFJ15AG0v7uKHUzQdlicO9zhVOOu4
         epaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vixtjzQEFhxmeb9aw2Fa7RIQ5p3yDWyK7tLeGuq1/oA=;
        b=U0901AnSoTBoguLEdw6v8wMR7j1Xd4ARAmuiW+cbIqtgJDMHvEiiL57OxPRXx157R0
         k4hPqlaqi1BmRLiZJ8ou9/5gB7Rx4iGQcgy+4oxzyYZf26K5W7dmxb6YV7u3g48k7krS
         H9j6++6bm9ENpVhbvv2yjopNA/gvZGP36sF++XNvXoJ//A74m1YI4Tpuw0OuL1n55Ny+
         7K6B2gQbRSEwqJaK1W4Ch1swfOA+76K2e4+YhCP/5Wm5EmENN8cO5cz1l35w8ZInvnqG
         z532fU5YPr6ZPvs5a05xqSLgF+QQeWeum4i8Py5euxcIK4wbr10rAJJrE9aZgGBxhEfO
         BQbw==
X-Gm-Message-State: ACrzQf18vuv0w5yqrvDseRQ6vjYzjBwFkmeQMJdKLXwT+Qxoz91DW7px
        4KYOCam7fuRWWXS8zsuLcXf0cP28wealrw==
X-Google-Smtp-Source: AMsMyM6gXdtPbcAtTAGNR+izXH908tPToV0v64MOJSFQcIwwu3q4wYr9U6HkLgDGGoKahUrbOI6AXw==
X-Received: by 2002:a05:651c:1027:b0:26d:8b41:a081 with SMTP id w7-20020a05651c102700b0026d8b41a081mr264859ljm.106.1664006735138;
        Sat, 24 Sep 2022 01:05:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:34 -0700 (PDT)
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
Subject: [PATCH 21/32] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Sat, 24 Sep 2022 10:04:48 +0200
Message-Id: <20220924080459.13084-22-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index 67d3d90839ad..3e3fcfc0261d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -168,21 +168,21 @@ additionalProperties: false
 
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DFD5F66A0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbiJFMse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbiJFMri (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62377A286D
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o7so2536501lfk.7
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LyA5ur/cjYl/rS8sbHU8B880cL6AnWpQA9/6F60GO2Q=;
        b=lNEyOtR8VwR2YBK9NC46199zcpjZKHb97/qXQaPn1BnzKRGZNmQeL4lJdQT1XgA3JK
         xWvZzuMz2Kq3Rm7Y3b8qE6duEOLmszKPy/IRDUYqWW5Gdu3i7hOMEVmnchcZD7mwrLQw
         w1SCCzt3YDSVivQSC1eNhE4fgA7YdAlGglCFRorUZoh718uVvvt3MTq5XjBR78y4mBJL
         ASBYcDMg9z3vnoWrZVOSmcxQTxy6ZfTuG1Z/prfkD/6hLdX+pzpJAqjqe75744ntYqBD
         BjIvMo1LPtDoabO0gz9XD1sPquJF7U5AEVcQhY3dzPBLG65XnVBYqeNxAQHV817YE2yV
         Ocdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LyA5ur/cjYl/rS8sbHU8B880cL6AnWpQA9/6F60GO2Q=;
        b=dobQC3kZhDtWxVgNp1uzys4wacXmqSlEhAy1qqcrrj92vrK9/W0VlPT2Le1rpBTpYr
         VMfzhK+XguzzvpcFw2ZVu9Xhoz7FqprQ6T/2hpNtPuUOWA4iey/s0oYaRufmV/HrytWo
         pFLI1TAAAatQNtFeHffl+CVtJwcRlapA/fe8/3LBpL/1Y25sO4yrFuDLCAMGtR8f0v+w
         djs6mE5YAeDqqAjc2zizlbSkFtBP52eIITB9GVHQuQopGZg0NXFNb51wqhHHSL/NApJu
         /6QpK4mw1RFT5d0slZAJACt/l7Tm3jwM1QKh7RqfTC5h7wZ9H4yuMtbgYYhoyTPrjf5+
         lS9g==
X-Gm-Message-State: ACrzQf3BuRGD7MPpvtTcHDCfDx8W/DVt4+2IJivmsBsfd4OjST8nXKSb
        OlfG18lB8XC1GHciStlIW85Gmw==
X-Google-Smtp-Source: AMsMyM6B61CafXduV6Z+VjbP+I4iwuAAJ52afC3DIhHi6VROIxDA3uejys8XMP97fnX9x7qdR5MKzg==
X-Received: by 2002:a05:6512:3c90:b0:4a2:5168:b410 with SMTP id h16-20020a0565123c9000b004a25168b410mr1867681lfv.163.1665060448310;
        Thu, 06 Oct 2022 05:47:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:27 -0700 (PDT)
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
Subject: [PATCH v4 23/34] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Thu,  6 Oct 2022 14:46:48 +0200
Message-Id: <20221006124659.217540-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index a0e3c61fffe4..19d16cc9d749 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -137,21 +137,21 @@ additionalProperties: false
 
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


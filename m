Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC695B53EE
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiILGSV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiILGSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:18:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC9E2870D
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:03 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y29so9324653ljq.7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F43nv8/M+cL0CQPWEGRQlPTNWaqRQm3bONcFJuSIY7A=;
        b=A7XnkFV8JygYpzI+K7FIUb7NSbKPQhJ86e+gadfJ11SGAzkTHjVP0B8wKi1WlLAjDT
         FxcV6fLHq2EaU1ynM4X1z0909bqA1Rt2dWAXubIwo5+YLV9qELixFeCC9xo8/2NQSi/t
         wo0HHxNzmJRyIBQ00wsdrn4xJyTx1SrUm7/nfb61Cr2CAAAdOF1cocWDfK0oCvhTevjT
         C1jJlK12W68d4kY6OxSPKSqYI75TsVAfq6h3HFRZxfN7eE1Ri6RIW6NyARAVo9S9+7Pj
         v+58UdCE9hIUhsl+pom7C9P7uCJAXfk/rLEQ+RvbGaw5dQxr5UODLFUfPBCkDw7B2yjz
         ELUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F43nv8/M+cL0CQPWEGRQlPTNWaqRQm3bONcFJuSIY7A=;
        b=kBrJ6JmSBcga2ZRnmj+UKFgdZZYBY6JxOixGtp8HNMWtUnebHhrQMgvbQ8PpwCvW/1
         +DGgVk8iPmj6TYESOIPcr6wV+5qLtJyehI+fV9IH0Sg3ppwwQjQk4H6tJ773sqA3BmhB
         XDySUulc5W2QBldQD/u0M/gYAotKiKPUtRlh6+sy6wbXEoAX9/rzBYV+Wdbuud2/0YNn
         oGTmwJeUM5vEtbHDImnHOMj16JPd7JtsJI/+Xaf2IiuI72UTevkY0iUupm6UbQhE/K7d
         x3fYpddacaLiBZwxhDZWySKxykyd8Peh6cw3V6MMFY3OwlnTPbiiU6+G+iGvnNQTXYYd
         V6Fw==
X-Gm-Message-State: ACgBeo2knd0IwUFY2JEbxl/OuXydTkECupQSCQTSoq3olUzvKAoyOP6V
        i1vx1ZXrHdnQab9DrCtebxRORQ==
X-Google-Smtp-Source: AA6agR7X1hSRlJCWjl1EPIyxzpnPf13OnmsIlWlF9PER1H8bs5y2ZqqsChORkdl64SClLdzgNvYEKw==
X-Received: by 2002:a2e:a587:0:b0:25f:e6ac:c287 with SMTP id m7-20020a2ea587000000b0025fe6acc287mr7087104ljp.416.1662963482077;
        Sun, 11 Sep 2022 23:18:02 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:01 -0700 (PDT)
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
Subject: [PATCH v2 06/40] dt-bindings: pinctrl: qcom,sm6125-pinctrl: extend example
Date:   Mon, 12 Sep 2022 08:17:12 +0200
Message-Id: <20220912061746.6311-7-krzysztof.kozlowski@linaro.org>
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

Extend example with children for pin configuration and indent it with
4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 735eb5d6834d..5cb8b272cb7d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -126,17 +126,37 @@ $defs:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@500000 {
-                compatible = "qcom,sm6125-tlmm";
-                reg = <0x00500000 0x400000>,
-                    <0x00900000 0x400000>,
-                    <0x00d00000 0x400000>;
-                reg-names = "west", "south", "east";
-                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                gpio-ranges = <&tlmm 0 0 134>;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@500000 {
+        compatible = "qcom,sm6125-tlmm";
+        reg = <0x00500000 0x400000>,
+              <0x00900000 0x400000>,
+              <0x00d00000 0x400000>;
+        reg-names = "west", "south", "east";
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&tlmm 0 0 134>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        sdc2-off-state {
+            clk-pins {
+                pins = "sdc2_clk";
+                drive-strength = <2>;
+                bias-disable;
+            };
+
+            cmd-pins {
+                pins = "sdc2_cmd";
+                drive-strength = <2>;
+                bias-pull-up;
+            };
+
+            data-pins {
+                pins = "sdc2_data";
+                drive-strength = <2>;
+                bias-pull-up;
+            };
         };
+    };
-- 
2.34.1


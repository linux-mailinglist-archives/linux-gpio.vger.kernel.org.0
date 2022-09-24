Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87E75E8975
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbiIXIGB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbiIXIF1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:27 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC54211F134
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:19 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b24so2307500ljk.6
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V4HqYpo8tMEHEMR+IQ/EL+5/qaemZaDGSORGW1L0emg=;
        b=uh7Jvk4SCQQqWNT3MQ5m9zPWGWr7RlXPOTB1uKtRy3l/HZXbK07TAn9qRZHFUUHVU8
         Q1LFvs48x+rZj8yiaUgZSq66Czp1RCeaj9b3N2z+r61KI5QN56vKOzJJANOvW4udshyQ
         Iv4y7x27c3rH7OzSsAJ0L9f6eAm1P9Fy4nBV/X3N135KITvTsF6HEhZTPnrfjtnX5yqr
         nOYlN7VRByAu/UGZ0lOyoCJHiWsTdvYWTZe4D+eodiKZyJ7vG0EomYE8jcR9wel49TO9
         ycK0VGwHTWI1cBxebyEEoqo3wI/ZA3WzGlYEXv/Le9Gzl/a/QiPgN4PSoiy4dwyuA+yn
         MsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V4HqYpo8tMEHEMR+IQ/EL+5/qaemZaDGSORGW1L0emg=;
        b=pRnjDnd2nm+SW3540Cpzdhc8TL3bGVQzFg1YQdGH2AMGkSkgcS/w4ti6UnIWpfZtLE
         TVDbBDlWxPQEhZHo93lADFmXfal+sfMop5G9+796d/KJB1/jhliPRYNbp3geSKj9itUt
         7bpnh/7IEV7HbsvMPcYEyhjnv2Wa0MhZzk5yaEmjMgDjeLJd3I2XQxT+WtVuLnQhm4ou
         b+4KfpzaiaeioM/Oa/2mDxlYydrjSwTJjec6haWGz1WQJ6kVNz+XxGA9RmpgA9qrkxo5
         1l2fHd+Q/KmNf3dLM/3TWGJKO89GwYAmdVr6wN2TmedMWeKVwKx33NYM/f6ZuHj9n2tH
         MxKA==
X-Gm-Message-State: ACrzQf2Wrno4+Zj+JN3J95DTazH0DRtEecPXk2sHsEJMNa/fevs68gAr
        8set4fX0ZJ2eXz/MjOHrlsuEXA==
X-Google-Smtp-Source: AMsMyM6ksJBlNqkBRNd8kafnhHTh6uTiurBiBB6JP/8s0cUerO/BthhvSnTyCZV/jymh/ZTDdVo4Xg==
X-Received: by 2002:a05:651c:221a:b0:26c:6fe2:c146 with SMTP id y26-20020a05651c221a00b0026c6fe2c146mr4118969ljq.284.1664006718976;
        Sat, 24 Sep 2022 01:05:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:18 -0700 (PDT)
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
Subject: [PATCH 09/32] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:36 +0200
Message-Id: <20220924080459.13084-10-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 9c6958a9cfe4..e7f3106ccd39 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -42,10 +42,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pinmux$':
-    type: object
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq6018-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq6018-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq6018-tlmm-state:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
@@ -146,7 +153,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 80>;
 
-              serial3-pinmux {
+              serial3-state {
                       pins = "gpio44", "gpio45";
                       function = "blsp2_uart";
                       drive-strength = <8>;
-- 
2.34.1


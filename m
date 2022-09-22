Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE425E6C5D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 21:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiIVT5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 15:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbiIVT5H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 15:57:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9F610D0C1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o2so16427914lfc.10
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MfBzbOv42rRAiReWCauD0AbaHonJ+8RmdTz4pUa1E/Q=;
        b=hA6RMr/DAnnyt8rfQ77T67Z2LZjzItdeC22ZKLfPfobCPOpHfMCivQJa4rTQuoV6yd
         Xt/sxlhO6IR+v3lGZDh0FiTPqOf9BnOQVOLvESBOl7wKMEU16TF26x9jtAcvUSmwD0s2
         Z4s3BAgt4gpcX+3shoLF83bWVpzZ2w/suVJtGl1Ny88veV1vTYNtXqt90WBerwRFULfp
         9CfROxKX7V2wteZu7YNXIHWDQqr9xJGqzNnoCHQO0DrYX7JfD66eUZriP08K0FqrK7mV
         /PAIqJXXTOXfkgWMein8ZOsQOtdiekwKKfnC1dzQesqM/ZVSijfkctrTFDuHYyVyeVCR
         PVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MfBzbOv42rRAiReWCauD0AbaHonJ+8RmdTz4pUa1E/Q=;
        b=KCinoqOAIncjOn7UtN5powmEANyZTSTbppnBGyJLYodi9/UEIpvsk34DBwcIktGeIq
         VQz0CuIc9i/2k1/x611wqeJJqgsDAZdM3+QYNIVzwx4k/jfHxr2HMVOz7I+D7TyqnvUq
         Gakj0pcwGeGZ4o0A6Hx9le1VQIs2mrTMX08HfAC6aR+WSgbw4ltPjqmvFr4r6g1fAFvJ
         wrcYVoLF3JSinZVeAyjfKByo66z35FU4ag3CysKKZqgTI467En/H7eIqifh1jyUE2zFc
         CX/sxK/+Tkja8nfWAT0lz/65V+t61fYebHNSIsxbaulm1YbVG0YQePNe1ZQfM43taRo9
         ioIQ==
X-Gm-Message-State: ACrzQf1whrl9ubtEolIRYyAVtbrvTQCdCC4rd5HwsvBOJ4HlwZKbj06o
        mcYuHO8hsHgNNezOjeAF2WZGsw==
X-Google-Smtp-Source: AMsMyM6V5pDiKk9QTYafbge+gpsWtZWHnOKidEkmcaVU/zdLMpLPHr2bq7qDjg7TnzEn9H/GQQGQgg==
X-Received: by 2002:ac2:5191:0:b0:497:ac0c:cf65 with SMTP id u17-20020ac25191000000b00497ac0ccf65mr2057291lfi.436.1663876624272;
        Thu, 22 Sep 2022 12:57:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:57:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix matching pin config
Date:   Thu, 22 Sep 2022 21:56:45 +0200
Message-Id: <20220922195651.345369-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin controller follows generic pin-controller bindings, so
just like TLMM, should have subnodes with '-state' and '-pins'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index c17cdff6174f..0e0769a7751c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -43,9 +43,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm8450-lpass-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm8450-lpass-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm8450-lpass-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -132,4 +140,28 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpi_tlmm 0 0 23>;
+
+        wsa-swr-active-state {
+            clk-pins {
+                pins = "gpio10";
+                function = "wsa_swr_clk";
+                drive-strength = <2>;
+                slew-rate = <1>;
+                bias-disable;
+            };
+
+            data-pins {
+                pins = "gpio11";
+                function = "wsa_swr_data";
+                drive-strength = <2>;
+                slew-rate = <1>;
+            };
+        };
+
+        tx-swr-sleep-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
     };
-- 
2.34.1


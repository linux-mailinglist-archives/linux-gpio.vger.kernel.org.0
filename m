Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1A65E9AD1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234172AbiIZHpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbiIZHoq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:44:46 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0004513E05
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j24so6450906lja.4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/CQFETLYcASickTGGV8Fyl3JywFDQFEGch29lLspQrQ=;
        b=RWnIyyPzgqZwcjOHuPo1pVt873TbQ4oB4jKezYtX/xFLPK4uTVh0Ty9NFioK9G2MlL
         3IPYmUA+oA4Sfa3u5NsMHelLUW18E9zN16Tw1LXLSD+PNgVrSiTQOYjlPmYAloXchBDP
         uTH+hM9bamWPIh8y7qnUV+HgyIdxihY26FAhDebvluNQKk59NtoS9JVYgSl53WAY4yyX
         vfyn2Gh742Nnxb2NN290UsvqQZ52YQzz2L8K7wv3FFy9L95pSUp2z9KZdmQCdyVCRERv
         aLdyH9nuRW1dE5uMK6zv0Nw9YYcOMEbuRXDmVQ0ptydRop3NF8h1WljMtSWKUrGJhl3n
         IdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/CQFETLYcASickTGGV8Fyl3JywFDQFEGch29lLspQrQ=;
        b=Rvb8geUbjJnyijZQfJbar+nsGwsifmVqm4NGy/fv8Jb2kWOjt42xjfsN5/iKnY/pem
         cV3Oz6gYi6v4tma/1R1TMhXitsOD5Oyd5JCL0JFyU/3OT6nx2YV7hoRSqOvkFdF+aEu1
         xMmkWTH9Yt417j7S3j/0uZD6Ec9HuG25bPBKpLiInZMV+dgmhNOmtH3dPrq+AuOIJoRa
         /RumTii+VWNZEiEGA4EsRmbXqUZo1rvKwkHJD6xOu7zViQHd/Wre2AXfGsoPxEN7X12a
         aIwrYjuAxv4g7IZyOhnaRAMzvze8noo3yC1NLMuTtXbDKx1w+6irVo/IUuZTvcf3lqsr
         rlyw==
X-Gm-Message-State: ACrzQf1LJ2kTFGmIepfkj7mnr1Mn6PQ8ID8dArx08nsKcyZ+GaCQJAv2
        UBq8ULj9kZA11xoJJES6Hilpeg==
X-Google-Smtp-Source: AMsMyM6SREYy44aQio9hVsfg01WAZHUJooiL+uEPksQBL7qz8mYQU5n+Hijj34x7Y1uXZTiPB/KeSg==
X-Received: by 2002:a2e:9c1a:0:b0:26b:2bf7:9154 with SMTP id s26-20020a2e9c1a000000b0026b2bf79154mr6774210lji.417.1664178282741;
        Mon, 26 Sep 2022 00:44:42 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:42 -0700 (PDT)
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
Subject: [PATCH v2 10/33] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
Date:   Mon, 26 Sep 2022 09:43:52 +0200
Message-Id: <20220926074415.53100-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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
index 670eb7162e1a..50d8b04bb590 100644
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


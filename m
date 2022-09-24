Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFBF5E897D
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbiIXIGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbiIXIF3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:29 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEAD12059B
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id j24so2321879lja.4
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=s3LeD0fQ3lVXSe5LvWDqJOXNGaIcujKmFDelUx6yqVs=;
        b=zxo6hgeU0xtFLAXGPyymOXWMWlrXDjjARqZr/ipT2IQMQEE/CXf0N+eVputLmNjMi8
         AMlb6K0Ppm/hnICiVRknz1Mkp8As8y+9QcEtoihcdzZqFSAF4tvnF3+oHVtE8ZZJ584B
         v3ZVhgw4XJAASLaDorORHZ7T3mGh+lMzvNyFlMTgiRmG3CrDTv1JSX1WHl4uiKtlBb6q
         oz/LCg/hw28eavkRAtdUQMCqUcQAIFHLFALkTVYnOcO3om2OkVAZO1SR21oun7vD8v4P
         2JHvhtatopRyXgmo3/wVdmEQeyd3xQeJ4f0n2o+vJfJWfPDnUem3xBFK7wwo6rKODnOT
         kiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s3LeD0fQ3lVXSe5LvWDqJOXNGaIcujKmFDelUx6yqVs=;
        b=Tu9TpOdbshQUv/veJH8vYdFHqOhRyfU0PJt/zuJC2nkV3t7tgAavZpw7mS4bWqQXFt
         7UUcXPuCWeB2uxGPZzxmNgaG6U1/hTWsUQASDt6xliikca7wuhDrYRTn18K1K59bngGk
         P4Uo6PxQK5nWXARklBKRsAuO7YZa10aDHKCIphOP9vp1YL4Q42k96zhzgme+SLAXDPWy
         D9ll9Nl5AJphCB2mr/W6Qooi6U0LMbveyyEHAHZMxILXmU+YDdkcQroEFQ/OvrCSDwye
         TMsuvn62VKCwv0lfAm3QfADBFUd5JCi/3L1veJ0lZ+ZutuvIYA/F2QARqmjwz4bwhPfN
         tb4g==
X-Gm-Message-State: ACrzQf072+tqRWYaE+u+2IxDhdI7XoAZoB5NISWaQOq1nwX8NxjpGJbp
        25CMsy+Fntzsih6WWFE4zxL+Dw==
X-Google-Smtp-Source: AMsMyM52kN7DLYNG8Q6Lzb5UyWtfA2Y3HQHTEBjh00lg7JefgmzEPj9aKQ6TZi3uxMslQN0KdboEJA==
X-Received: by 2002:a2e:9209:0:b0:26c:7b01:ddb with SMTP id k9-20020a2e9209000000b0026c7b010ddbmr2131449ljg.347.1664006723208;
        Sat, 24 Sep 2022 01:05:23 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:22 -0700 (PDT)
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
Subject: [PATCH 12/32] dt-bindings: pinctrl: qcom,msm8226: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:39 +0200
Message-Id: <20220924080459.13084-13-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ab4a2b4cfda2..ecb90c77f666 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -45,9 +45,17 @@ properties:
   gpio-reserved-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8226-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8226-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8226-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -126,7 +134,7 @@ examples:
                 #interrupt-cells = <2>;
                 interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
-                serial-pins {
+                serial-state {
                         pins = "gpio8", "gpio9";
                         function = "blsp_uart3";
                         drive-strength = <8>;
-- 
2.34.1


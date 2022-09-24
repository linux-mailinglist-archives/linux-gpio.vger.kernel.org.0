Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7F75E8993
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbiIXIGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbiIXIF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0536012058C
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:20 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w8so3474354lft.12
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7FqghC6uXqvYVM4jUoLVE3N8bLSjgKHMBRM6ctfL5lI=;
        b=MEP/t71E71QXsD4bHfaWQbje9pDNFGcxqBpMonBslOH3sAiXdDkf+tZppxfnc+QCPr
         7bhEABuCGLGVRS4NIsBK0Gw579nLbriNEnbLIQ0wTOHssUtejJRiyEMTaD/SHPjylw3S
         R8AOcIZSnORpjg6DhlN3WE96R8Gk2jcJ2ZVba2CzM0jwtmJsnORuj64h2PKkfp7pJYEn
         kDE+/sontiUNYIPjpDAFGIeCLp12etihHXzg2MueKmW0T5ILOsj98E5m4TUHx/C2FIJ3
         FUTqBHp8lx82bIMdOGg8rl0Mshesf6Tbuj9K9gPAhdmrPX+Q8A2EPkuiSvaYHx3Rwi5h
         XYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7FqghC6uXqvYVM4jUoLVE3N8bLSjgKHMBRM6ctfL5lI=;
        b=W+APsgl2wqFQs+67+JdTaHzB+ksmr0svJRwsTPHri1RZfBpGmR3XBxqPfX98Athnyr
         UbuMSyB9DAjXXrhU+x4DpfrjofsQdpzu3A0+kjRR0xoW42NueEzVeLVhEyHnmHrRKCjG
         yNtq/jlhP/hnYrGR6+723JncK1AeSYpu+swAaREFDO5n2xQeKGShdkzXA7cuDLS1x96t
         v1nCAmh4fJiUhcngGcYXFHfOxICucCpbfJu4BoWJGGgE2D7ze77hQhqwxX1aeO7uOeQ5
         CCHejkQBE90YFc8RM4200X8ZoAG+/AcyksK757EwIY0ulpD+XM9wKpKV+iWvL3gI35Tu
         b8Bg==
X-Gm-Message-State: ACrzQf1YVNI2Uuw6NgtHOWzdQLS48kocuklzAvCiqYzoKGnaXSgQZlxJ
        bPO2A24iBZvLVes3Kx95cwaz2A==
X-Google-Smtp-Source: AMsMyM5jLMZR6CE3XAHPXKwevMWf6fzrpA+nhyjor/UxENBX4IbTzwOKnz3af4G59hVxceZI0r1Omg==
X-Received: by 2002:ac2:4d2b:0:b0:498:fbf0:4f89 with SMTP id h11-20020ac24d2b000000b00498fbf04f89mr4619853lfk.500.1664006720473;
        Sat, 24 Sep 2022 01:05:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:19 -0700 (PDT)
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
Subject: [PATCH 10/32] dt-bindings: pinctrl: qcom,ipq6018: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:37 +0200
Message-Id: <20220924080459.13084-11-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index e7f3106ccd39..2026fdac9fa8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -56,7 +56,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
 
     properties:
       pins:
@@ -121,7 +120,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([1-9]|[1-7][0-9]|80)$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1


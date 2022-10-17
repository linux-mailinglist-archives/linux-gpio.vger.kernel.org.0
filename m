Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00FAF601D6F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJQXOF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiJQXN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:13:57 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EED7696C4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:13:44 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f193so11815827pgc.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0C1L6kOIdb7uBBS651widzpOjAhyGK+kNAfE8fg7HE=;
        b=bTV54Ur/0BheFKTpOpmcB5X7K6BbR02j59Q8gHbJPtz49tPQc2RsTUMZfNekgcv3jV
         RtktqPmv37cOaVbzkNbgV/mwenG6MjFZzA6USXolDGvGtCLvUo0jnpyAPQTVhK1NFFV8
         nK6nRBQItiVmLu1AhoCHphETS6zH8O7FejRqq487/gWhnm+tTlXA82p4EgVCAigcLzwn
         NFH1NRD3kDXrkhp1/wTSdGA8/DpEW3JJF46XmI48MyoCi60RqinIls/Ieh5PJeUmeN12
         505ZdHjyXjJz7omyMXibXTBzfYFVdye9HA7uMy0uU0PPcPOFlT3wQM+cBxZ25xwQZN1m
         FWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0C1L6kOIdb7uBBS651widzpOjAhyGK+kNAfE8fg7HE=;
        b=IQ8zVygR+jEU96qVccELgZfV6dX1B1brX1KswGQXrsL6abEHGajb28HvxUl9Eqcv9A
         e5kwkhNX4s2Q1JXpiHTdnFfl6mu0HSKn85pD1Gky2yOAEtXNhVT5dvQ1yLrSMRXu4tM5
         s+hg8FNUTdc717a8zlZ8+KTAkOOGb8bxUckBmZrRCcetR2HddeQxQatOIQFv0WE+aRyf
         /iwI8jFYXC2sIsoGM/m2QKZcdSynFUvCxC+1cSO8eUPjTXBOZEAdvy7PCZZOwjs49Qo7
         JIvWgfd50oH2e06vtCkOkjWM9JMeHubzB4hqu0Ov0pv/yulL9ZXPqxhqfcScDw0heTH9
         ldnQ==
X-Gm-Message-State: ACrzQf1RqbxWfQtLIGX9lvrqPgIutuTIe4UqBVk9bquiTJeOUs1R7VZp
        cGSxJG+4TUJ0Ak9DHfOuRqJQRLo3dilAOw==
X-Google-Smtp-Source: AMsMyM6iQ/9ARfuPLgRqzDtyIVBMQoJfG02L1718PtgYn2I1xx6/HJQeUbpzU0UUtS7vfwciYpiKxA==
X-Received: by 2002:ad4:5be6:0:b0:4b3:ff39:7ad4 with SMTP id k6-20020ad45be6000000b004b3ff397ad4mr10197951qvc.126.1666047690650;
        Mon, 17 Oct 2022 16:01:30 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 29/33] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:08 -0400
Message-Id: <20221017230012.47878-30-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bd54c92287d6..8270debd4f25 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -4,15 +4,14 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SC7280 SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SC7280 SoC.
 
 properties:
   compatible:
@@ -29,7 +28,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -107,7 +106,7 @@ required:
   - compatible
   - reg
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1


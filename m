Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710035F6699
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbiJFMsb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbiJFMri (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:38 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52273A3444
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:22 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m14so2116737ljg.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BhbTeBROl4/tOR51peuLJrLs0zaAX19oqYrmPX71dUc=;
        b=yCCjRXoAmJP0S6lgERbIi5iJYiYoBPwMKrA0sSuuCpleyMGy7yr2b28FYfmM4vURsq
         9VaqdyWCePZ2bRmswXlmVnyDSoGEHu8hAqoukq6fumRUCV7Ofus4fbhYZs70hGiFlK0i
         +fHpttUjGCln5rr5+m0F3ck0HSiDxwDv1DmUcK2CqIWIwDWmuVXsxA/uG6VD/rZ7+ccC
         s5Lgika30VtVu7jn8kWmo8o5mKKbbVKzZCBUk04ZYdOAezGNL18Km4Jn52T8S7WY6ONS
         O/uc6n1c8btPKjnmV6517mr5Ex4NOrPK0kfgRtG2pIHleEOUvKCgY2qthwYjidunJsGJ
         VJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BhbTeBROl4/tOR51peuLJrLs0zaAX19oqYrmPX71dUc=;
        b=R4943P/tJ3QBq6UBvwNVWFN2i4LrfiiY9YIWgnWezBVJM4Ki7y1aOjVVwsBwMT+SdZ
         o3nyasjVO/Ue5BSlJuIL4gH9IlC8V++GrRwdgR8C7N7BrXkC3Zikg+VEBIAPivKqfRNm
         QLfu2aB7MuDoyyuXALtM/lP0ZUt4T8NdUwrlNWmJ3FeB4cFgk/H1J3CZFoQ7DqMnyWlo
         Fs436sqbKHvih4RcUSJQHP5q81KX7GNafVuTpUVEz+iODFmj4Z0eTUQpcAe8cuA029J4
         9Xh1kBva6LhsQTG37jCOF0IObViWPDR1qG+fbEehh4dI6BMLQKCUdx43LExaHrs/Bw2T
         F81A==
X-Gm-Message-State: ACrzQf0cQU3w7o8aEDWk3xervvZQNjFFp2KHcmorCzOE+AD/oXxz7+Nv
        RScu18Re8b8x5YC6nNM8tSydZw==
X-Google-Smtp-Source: AMsMyM6VWYKjknNg/GEn95XfCDfHxTvyfGwlJ/ypT2LrshsmsO8fKd6hRSRKQHC9kupxUaNqdXrIyg==
X-Received: by 2002:a2e:9d5a:0:b0:25e:2c67:edaf with SMTP id y26-20020a2e9d5a000000b0025e2c67edafmr1714927ljj.437.1665060442427;
        Thu, 06 Oct 2022 05:47:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:21 -0700 (PDT)
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
Subject: [PATCH v4 18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:43 +0200
Message-Id: <20221006124659.217540-19-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index e03530091478..b1735918fa90 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -43,8 +43,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-msm8909-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-msm8909-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-msm8909-tlmm-state:
@@ -136,13 +137,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "blsp_uart1";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "blsp_uart1";
                                 bias-disable;
-- 
2.34.1


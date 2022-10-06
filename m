Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48C5F692A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbiJFOIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbiJFOIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:08:13 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A037BA7ABE
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:07:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j4so2982865lfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RI5opIkopQW8M6sigF4XenVf7gqfYu6K0REJfglixgU=;
        b=qsGcIKS4jP2Sd1hlAsuXAv33UGp90YVYRXbUpXTAElk2QP2drtHCE5QASQjUauIfgX
         OmI2oHrAcc+HROemn7zy2C6zIFApQjId42b8JeZjG1kLCoG7g8Oyu5GYEQGjAhc8ETjb
         VJImUYyZDNjCdgHOVXv1M0NFx9Qj+LaT6I8cScj2D2qmzVYj6BFIC22XPVZ1WnGqgOK7
         Fmw3KeT5VRtYV3BaiyvuV8haHtCTnzbTdrvCzGxNWJyTC8EHyf+tfwOuyJRoLrFJWEXk
         MMa/VNpQg/Jyfdek+E364aQHCf3ZAe/O/BQAeeQ5YThhIjgsDvu5JPF9n3Phtz2UTLGK
         cDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RI5opIkopQW8M6sigF4XenVf7gqfYu6K0REJfglixgU=;
        b=WjqsskK2ZeErIEoyEAwaUDiRzyay0Uzv2CrYPisS/uWG3lWWCcPe6GXX7A++4iCc1a
         JAj2W/lzy0qQ05HeoeCv9i1iNE3tAz87QRJEsnHr/YsrQqlRwPeVInpNm8ZkK1WDCMWy
         E0VGkutN1V17mumTudY3Sx/A+VXAxM+SeiGEqpOyyY2G1QE0GgioVH02+nHZRX9xbpPm
         ZHa9t7oA0da3lRTN/1qYUU1UfTe8WFnRBDWqSCYfAMCI2jJ53OT0hSzT+d/+lT1G9zjM
         1vB3HOoMBtS8thvdUiys3b+f2TrwSY9pD5E2I2IoF9Xc92fPEredulirmbhDHKtqvasl
         ubNA==
X-Gm-Message-State: ACrzQf2T9YjPT3BEDx5r+KnnXHCDN0cf5/HqaZHCGgyAP2Eqn3TdksR/
        nPzXVhexF8ysPLnmzQsaRwiMNw==
X-Google-Smtp-Source: AMsMyM5o8RFFTwuQy2SRtJ2dgktmNks9PKa6dyQ0ccSSIIJ3TjxT7XoakE8wZtbdoXNBtMt4F+xP7Q==
X-Received: by 2002:ac2:4e0d:0:b0:4a2:6fdf:6698 with SMTP id e13-20020ac24e0d000000b004a26fdf6698mr55964lfr.288.1665065241999;
        Thu, 06 Oct 2022 07:07:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:21 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 30/34] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:33 +0200
Message-Id: <20221006140637.246665-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


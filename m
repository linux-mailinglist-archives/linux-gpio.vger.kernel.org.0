Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3825E8972
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbiIXIHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiIXIGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:06:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900AA126B52
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id k10so3535054lfm.4
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xvXRb0zwWe37WFjqVxzmYbo7BlnZOnYHNQaO1Kmsw4c=;
        b=Vbx6fjcxdI4URQ5mGd34Rh6hNGO15J2BW3J0yM7ZdJRLJw46XtLcfRBF7X98IWmsdq
         f0vJgMwvjU94NJ0ArdZEIYqN9JOxunHjJ8aUnsdxS0h3RBCfum95aJuWFGBP57Zj+sGm
         F/hhKHKQy62NzAZfVBJDm0iqulzzWqNtxXWhQUK8FtcO97O3dSdOmDmLTZl7JMqPiIEY
         crMCZj4bJPeM5+BogWl4OUhlcx0TTa9orzMMk3KMW3dWkGOLa87ZeWbr0JW+RgQg8w6y
         sToM4v3Dfe7s85+FSlADpgLonRep71LkinR4Yq9EDYBmIZM2QTBUnBcLUPap8ntHhzvg
         066A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xvXRb0zwWe37WFjqVxzmYbo7BlnZOnYHNQaO1Kmsw4c=;
        b=NjWuku8sX/cYY/Lt1kvX+chQ9gsJz1FZFuv+Uo3nkZFbHr6enJGbSkjwIFw+o8z/V6
         tFmeEw5so1eST7vGcn6MxW0sB1u/qQqBVaNfrLx5DmdHwZtmq41VHoZxWKFhruB5HHEZ
         tlkZ5eNPPR6UbcdExLGxsyiE3M8vUnU1qTzFcxv3fZIGMHY+OY9EPBMfZm4zG8rIHNlO
         x5URI+BIDWgoMXuOn7bTbxwjK//ffhu2tEtyCTmnJdCw885xEXK7aETXwwWaJJ5oofme
         DVoEhNVuY8SLZaFCzikUhaBi3MwCUIcdKxSs6Fda5GzH8q4laEbCpl2J/UyDSsdE4yZf
         gpoA==
X-Gm-Message-State: ACrzQf1Vq+ERRUKPt8ejKE5is6w7aIEtqjy+OlWgjI5mebWlYtqzqCWV
        PRfdJ3ZuZck4SgyOfGnbxO9Mlg==
X-Google-Smtp-Source: AMsMyM7r7AHN4fwhNau/v10IiRAB0j5Idl3h4smJwZTOVUYaQTyxriGuFPv7cBkAROeYQ5JI+DorEQ==
X-Received: by 2002:a05:6512:3e10:b0:498:f317:e57e with SMTP id i16-20020a0565123e1000b00498f317e57emr5078453lfv.328.1664006739014;
        Sat, 24 Sep 2022 01:05:39 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:38 -0700 (PDT)
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
Subject: [PATCH 24/32] dt-bindings: pinctrl: qcom,qcm2290: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:51 +0200
Message-Id: <20220924080459.13084-25-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,qcm2290-pinctrl.yaml           | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
index 3f4f1c0360b5..5324b61eb4f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -50,8 +50,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-qcm2290-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-qcm2290-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-qcm2290-tlmm-state:
@@ -146,19 +147,19 @@ examples:
         gpio-ranges = <&tlmm 0 0 127>;
 
         sdc2_on_state: sdc2-on-state {
-            clk {
+            clk-pins {
                 pins = "sdc2_clk";
                 bias-disable;
                 drive-strength = <16>;
             };
 
-            cmd {
+            cmd-pins {
                 pins = "sdc2_cmd";
                 bias-pull-up;
                 drive-strength = <10>;
             };
 
-            data {
+            data-pins {
                 pins = "sdc2_data";
                 bias-pull-up;
                 drive-strength = <10>;
-- 
2.34.1


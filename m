Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D45C5FB982
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiJKR3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJKR2Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:28:24 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCD072B4D
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:58 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id mg6so9373180qvb.10
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZqgsGmvSE1+fOZ/tmTIcifOBksip+9lbghJPY68QP4=;
        b=vPXxTUbZsnBH1Yu6GMxW7NLtgMFhQ7VSB9n6YZrE8UNP+0+OZmtzvjNJuN303FfomJ
         +Z2cEd+f6dMDujix6TychJphPvMq5snoZAQuNN7rD/qV7imnmfHJucy9vQXMW8v5F3uT
         WVzM4Bw9uXIhHUXhrYTZTHl9HVaHFI6r+xoXAgJif85BMQbOiyd3TowPFb2hvp7JasyI
         QNutDHEehvYKGz++/on/UZCWRHPWIyJD2ey9zBHMzsReAzCdIA4wMfrBCRx/JkoGrj4M
         wxcPipvr0+RhszfIOma6FYoOieQSkCUKPIk7LVATvTI7sjnNR8y+Ix7sV3W0aAG0bBgg
         w1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZqgsGmvSE1+fOZ/tmTIcifOBksip+9lbghJPY68QP4=;
        b=71eq+m++5h/bGhkn9+zZLzjPG2BJ6SW0JNkGdvKs+03voA9KqedGPWgKATbuxGromI
         Y5ZKQx+K8JzzlE4bqyYFkm2BvYG+TPqZDGiQbwaspJx+UMmaKIq23noxFiqzhHRh4uDB
         6WcDE4oDQiydDFQ3tY2Md5RHk1khIAkMWMb56/5zRfXf3MJ8fJmlC2v/EvSCUnnTlBHV
         +c2ei2GkFGJYTP3LP3xxZSG/WwWnJ8pF70u4zh049UzB0Tsp/tJ8R9f/nh9bGI87ekMi
         EexJKd/RRSIXL8holFLb3pT0da+WoEadRwLy8MmiT8/Ajti1ccoiO//YPBZfK6VtdAbr
         VZJQ==
X-Gm-Message-State: ACrzQf0W7MkCDSB4enr8Yv861s2YdFgIt5hHhWufl2rU0jyDURgTmK0S
        iIc9QzyieD/C4+TG28AG1Um/cQ==
X-Google-Smtp-Source: AMsMyM7EyVZ42UGOJwH2pdWOeRUHLK+sl5hKP5+r2Bo/8YwEKZSr5IEQHtUK1ebfpE0Yzr+T7ehQlQ==
X-Received: by 2002:a05:6214:2a4b:b0:4b1:8bce:2cc3 with SMTP id jf11-20020a0562142a4b00b004b18bce2cc3mr19650506qvb.58.1665509198961;
        Tue, 11 Oct 2022 10:26:38 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:38 -0700 (PDT)
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
Subject: [PATCH v2 21/34] dt-bindings: pinctrl: qcom,sc8180x-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:45 -0400
Message-Id: <20221011172358.69043-22-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant quotes
and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...180x-pinctrl.yaml => qcom,sc8180x-tlmm.yaml} | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sc8180x-pinctrl.yaml => qcom,sc8180x-tlmm.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
index 71ca4cfd567c..24191d5f64ac 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sc8180x-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sc8180x-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SC8180X TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SC8180X TLMM block
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC8180X platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SC8180X SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,9 +24,9 @@ properties:
 
   reg-names:
     items:
-      - const: "west"
-      - const: "east"
-      - const: "south"
+      - const: west
+      - const: east
+      - const: south
 
   interrupts: true
   interrupt-controller: true
@@ -46,7 +45,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sc8180x-tlmm-state"
       - patternProperties:
@@ -54,7 +53,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sc8180x-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sc8180x-tlmm-state:
     type: object
     description:
-- 
2.34.1


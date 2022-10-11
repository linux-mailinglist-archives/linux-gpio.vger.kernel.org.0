Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F165B5FB967
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiJKR2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiJKR1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:27:07 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00B12A433
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:37 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id d13so2603592qko.5
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDmxwEg+B/4q8c1cMWPLLkxQ8o7pPpk8gQ5B3bQLKYg=;
        b=n7M4eRhCHfJpJKTUBZSSUYAZZHwA0+IKG51VhoAIu97oZM/OsqwUGUMsgBjEtZTldh
         Hv+hv5oUJV4XBgCEQfgRSZUX/F0cq6ewyQLAQZhoLGhRSxTvb+McdPLmF+NvJCCqAbrU
         d+I6nM5GV2LINDmafpPlHAmXMRzcD4cHShdIz70Ss5U0cFIyiMoHiptoub+ykOVWTHEK
         NohVsxRaDpoOGQgA3rm5qNcQNARtmighuK3PBW0lXpnkNy1nU2d3rKyBfg6S8QJcelyP
         O8ADW5nVLIqFeEfNItC2ZPLbTJAh/mTGy7av0cT/aaBs9A30SP90BhV7KvOtJFe+iorA
         1m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDmxwEg+B/4q8c1cMWPLLkxQ8o7pPpk8gQ5B3bQLKYg=;
        b=qliaDC07QXvGjGYpqCcwx2n+rsMvVtFdUdoHOdsHXJobrnGu9wjjuKKgivIPIOOT9O
         sjuaEAfxFKp7+dzBXnaxU7Ye2iaPGyufW2azSO548dy/td2WhwgCIvx6C1SmY8qL4GUy
         vY6cwvo3nG42xP5XBkj/OAgbEarbb0sBl1XnEKDBnD0yRAwEekpqD20KXIHi4A6dUY6B
         GPFHk4/ZLrLRJZibv2KOe6gAZjLdrECzURSWkisMSxrBMyd7ZX0WoXgZ8UVdtNOsEqtE
         tuMceJOMuXZrEsZ/R+y76qCKiAPFOFcX6CNQuVwbRqlzl3tShFdACO8PVxhjvB79Vzfe
         iXyw==
X-Gm-Message-State: ACrzQf0K1jyNjgHwgnC4Mh1JHvzL646RvAKzabQzq1xyYV2RomW+weUs
        ZAPW87ulFoDNIL4sbcOXlLJcSg==
X-Google-Smtp-Source: AMsMyM7cPqgv3BgCPxFSHH3BT024sEVuC+qmjwibq2M7rhteBt3RM7qASCqLoJqhgs/99rYg0FEruQ==
X-Received: by 2002:a05:620a:2113:b0:6ee:13dc:4cdb with SMTP id l19-20020a05620a211300b006ee13dc4cdbmr5735360qkl.74.1665509197247;
        Tue, 11 Oct 2022 10:26:37 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:36 -0700 (PDT)
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
Subject: [PATCH v2 20/34] dt-bindings: pinctrl: qcom,sdx65-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:44 -0400
Message-Id: <20221011172358.69043-21-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding
convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...{qcom,sdx65-pinctrl.yaml => qcom,sdx65-tlmm.yaml} | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sdx65-pinctrl.yaml => qcom,sdx65-tlmm.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
index ad1a2446a8af..9e0d80f776b8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sdx65-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdx65-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SDX65 TLMM block
@@ -10,8 +10,7 @@ maintainers:
   - Vamsi krishna Lanka <quic_vamslank@quicinc.com>
 
 description:
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SDX65 platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm SDX65 SoC.
 
 properties:
   compatible:
@@ -30,9 +29,8 @@ properties:
   gpio-reserved-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sdx65-tlmm-state"
       - patternProperties:
@@ -40,13 +38,13 @@ patternProperties:
             $ref: "#/$defs/qcom-sdx65-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sdx65-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99325FB973
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJKR2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiJKR1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:27:48 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF2270E6D
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:52 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id l19so9377694qvu.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDCLzVbjOgxRU7JZ70wpVDQAouZMXtGx+a003k3YuIU=;
        b=fUGciDIhnug8uz/vpWOLrjkTNxBOSAXv5L1InUC85SaDFG0Dxun+Af1QUchwgxRwMu
         4R9/dXIGCYajMAKz0oGKqlEoAN05vVVdksyqKL/u3c0Idjdgx2Gr8LAOMPPurSOX51l6
         vOhV0BseIThDekIteN73G6VqVWnmXX6BmDqCYz0IDWZu92JCgXSXYrQ8MquOkXOA4Hd9
         MBzp/SvDxU8P6azwyTXZFOvTZhYMlUP29FjxfOO0yKmMPL59ux4fE0XG1k/mw1dv6k8q
         Lwzpb40CULNFYnepcEf4UiE9ULjZPC7T7UHzSu5BCepxQy1rpZ0EOIx9enq04IX1Z9Vl
         Ii1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDCLzVbjOgxRU7JZ70wpVDQAouZMXtGx+a003k3YuIU=;
        b=VznIwv/xT6SH6Lp2sxlhHfhU1C0FX7CWH88PcWyiYx9n3NsDAkGgSrf4dDwCEbP/XC
         5EyIVAASQ35AeLOWvkdaB3qf3tdLR7lAXgc/mJDx4dFXwUDaP5iBLPOaULpxcOOYY0p3
         4SQQIAGaIptNn84lJ/APg4zguorxZYzPsrxi2g30oE0b0BpTIvgBG2ufdWzI+qC+DGR9
         6TYB8yVAFWxtG820akK/l/WBgZVGgqN1cxHVUZ5cKwiFUqxF87q/SSdCoOdiJtOYTESs
         Yh+5efiQUDyNBcwvgSxRqsMk5iqzzZcbocWIlEO1/rsuJX/paw6ABCarYjSE7XdHoMMF
         Fdyw==
X-Gm-Message-State: ACrzQf2DFczhv2n0bsYfqQGrlP1oN7GLdpfxRUzuNUNLTAbCPHngyEI1
        bfqAcc5FuVGHywCutS55MFJr1g==
X-Google-Smtp-Source: AMsMyM6Dhx7uuOC9iYLaxSWQ8IMmkUu5SW2Tjpz74+40CsHl9Fq2wL1YomA354wv1hRD15P7fMlYWA==
X-Received: by 2002:ad4:596b:0:b0:4b1:ee66:1cb8 with SMTP id eq11-20020ad4596b000000b004b1ee661cb8mr20090523qvb.3.1665509195657;
        Tue, 11 Oct 2022 10:26:35 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:35 -0700 (PDT)
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
Subject: [PATCH v2 19/34] dt-bindings: pinctrl: qcom,qcm2290-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:43 -0400
Message-Id: <20221011172358.69043-20-krzysztof.kozlowski@linaro.org>
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
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...m,qcm2290-pinctrl.yaml => qcom,qcm2290-tlmm.yaml} | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,qcm2290-pinctrl.yaml => qcom,qcm2290-tlmm.yaml} (93%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
index 0d73abeea715..a02a64de60d2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,qcm2290-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,qcm2290-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. QCM2290 TLMM block
@@ -10,8 +10,7 @@ maintainers:
   - Shawn Guo <shawn.guo@linaro.org>
 
 description:
-  This binding describes the Top Level Mode Multiplexer block found in the
-  QCM2290 platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm QCM2290 SoC.
 
 properties:
   compatible:
@@ -28,9 +27,8 @@ properties:
   gpio-ranges: true
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-qcm2290-tlmm-state"
       - patternProperties:
@@ -38,13 +36,13 @@ patternProperties:
             $ref: "#/$defs/qcom-qcm2290-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-qcm2290-tlmm-state:
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA27601D5D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiJQXKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiJQXKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:10:09 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51764DED1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:09:58 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id l28so8729257qtv.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZWdexLhgCkz4RKT/YZM2KYQoYIDCIwvJvdXHwfAfFg=;
        b=Apj0/wZgBHJ96yHj3MSoxpjBBkqMHwBnTkoow+ZPbMFcQvZO3yUl1OMoBAOygJadWn
         OGu2t+7mo0L+7fwJF0DWo7qQfSvSYlAO0OQSKNeG7zrspgtJRNgclHx6bspVNHxvZ24Q
         /HSfEKA4eeMK7FzoqN7iJL3fm4BhtT7H0inpOUzPKzyGJmOigMFcrPazBCy/D+n/2ROV
         lsGagbDwtAyplwPxyFrvkOHAtJvj1oV/VRb1Bfe9eAgDz17Em4Kamh6MK96ktFh8lF3r
         eIwtBUr/RVRuitVlJ9pAg5RTRqmf4f2b98i7+VEBaZXHey1Sxx2jQzV6EB2Cl8Slviaq
         iuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZWdexLhgCkz4RKT/YZM2KYQoYIDCIwvJvdXHwfAfFg=;
        b=gJoqzH/pn4ukfPrpIRtEJ8N80npc766HueG978XiSFUTmU5AMNZSIIXrjWrs+uyBzE
         bivv1lCUPI8ECPp75U33oerpMg2X5e26sMfcJ5VgpTDypowFicmK3f22stEEnqcEjVtJ
         zQrr4pr8HoufFcxCRJgL2gtbPMAlLZCAluNmPq4zoB/ryjEdL1W53V3j00LHXzWKIgIw
         CPbt3oFF09Q4E+kWXVZHB8Kk5XdeI5NsA8uXd5TK2jW1r61w/LS2TnJsZmm/CbcATqUk
         8rHVjqXBNJpdPmLWV4iHDxZz6EuWYGt3khfijQ8hFt/VzH3/KAjzemLi6vtU0XG6KB6N
         MI0g==
X-Gm-Message-State: ACrzQf2ObilkS5UNkpUjA9btoYGSArzF84TsrXWI7uPLnEYTfhgnyEPN
        PTSwJuEkIuhRk3AC1TZUPS5YY4TsUc0Miw==
X-Google-Smtp-Source: AMsMyM7Fb3efPFGmK0wHxnBJmQvno7W2HB6x0iALoP50UlJ16y+J2p14wXrxVLTk01nACnw0LiPxgQ==
X-Received: by 2002:a05:622a:1206:b0:39c:eac7:bf0e with SMTP id y6-20020a05622a120600b0039ceac7bf0emr6233797qtx.626.1666047689021;
        Mon, 17 Oct 2022 16:01:29 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:28 -0700 (PDT)
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
Subject: [PATCH v3 28/33] dt-bindings: pinctrl: qcom,sm8450-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:07 -0400
Message-Id: <20221017230012.47878-29-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...om,sm8450-pinctrl.yaml => qcom,sm8450-tlmm.yaml} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm8450-pinctrl.yaml => qcom,sm8450-tlmm.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
index 7ab9a0eec017..4a1d10d6c5e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SM8450 TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SM8450 TLMM block
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM8450 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM8450 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,7 +24,7 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
 
   gpio-reserved-ranges:
@@ -35,7 +34,7 @@ properties:
   gpio-line-names:
     maxItems: 209
 
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -46,7 +45,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm8450-tlmm-state"
       - patternProperties:
-- 
2.34.1


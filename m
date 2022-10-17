Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85CB601D11
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiJQXCg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbiJQXBw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:01:52 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF9D8306F
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:28 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id a24so8702334qto.10
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiYopYJx4FFnWBL4nPbArasO7f6m/tH0C3clqIKSJU4=;
        b=k2ZVzpRp4ho7iEgksiDQSEQuVqjRQHuEz4OC/JXTzGH5lJsFXZK+u/uRShcU/9rOsp
         mEm2XLYU95SKhV5N+9rGEOPKBNNakjz9ouUa+3k+DTN/ldw/DnxYmsCPtBKmyEM54MPV
         /IKui3pEUe6f7rGp6L2A6IKhDNuMFNIxdwfckkzGA1Tlv8LBGWbEO9xQXcwENUc09VVN
         yhCY2/ZRskTHX+Vsr9ohupiWcy7fK2rHBszKTISzowC6o02I088s/hJ7JmEOpRZ/lQHx
         d+Y19SdqDWvhzPXyYlfkAPuuItNK4SBTRKDFMNoOMH2hg7qqh1wyiifWnjFkHKlEZhPv
         QsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiYopYJx4FFnWBL4nPbArasO7f6m/tH0C3clqIKSJU4=;
        b=25MICD2ySe318w/H3cWo3BPDZpjpcwf5BBBaXp8biYKSl1ejVeXMF1m6jHXZq4FlGJ
         SIn8CY++j0FuiYlWDldMNwKMn85le/SL+EIjyn3sIKGz/4B2rAQbdYG5iNC6DiQZR3v7
         XsjNjXpTxWg4bw64oz8kZF8YunoIqiJZzfXZVpIdMm+WwWTb2rucd9vPaGztcE21R8qi
         +vyvtiX8o0ixGj9DNtykpEVmhsqevygAuLm29mUFLVK5XT1E7/URKSfMA/mbh0WKu0sV
         UrT1d3EuhmPjR3njZ/7qbwYwdg/Vee+zWYrWv0SVd15vu0N5rctrOgvA2MT6d5NMTV3d
         ZFwQ==
X-Gm-Message-State: ACrzQf0zVRdt0EAd9lySak/K+Oa5OeH5GeH1JZ1OP68s1moaz6R35llF
        xSA2thdHoFclQk6/qrx2tIH5Ww==
X-Google-Smtp-Source: AMsMyM7xNyooEmNYvDNGFskvon9BQ4DygYRa/WxAuWoUX3XZPu5/VUyc90LBmCrJUbE7z4Q0P28STA==
X-Received: by 2002:a05:622a:492:b0:35d:518d:2b58 with SMTP id p18-20020a05622a049200b0035d518d2b58mr278qtx.78.1666047687165;
        Mon, 17 Oct 2022 16:01:27 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:26 -0700 (PDT)
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
Subject: [PATCH v3 27/33] dt-bindings: pinctrl: qcom,sm8350-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:06 -0400
Message-Id: <20221017230012.47878-28-krzysztof.kozlowski@linaro.org>
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
 ...om,sm8350-pinctrl.yaml => qcom,sm8350-tlmm.yaml} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm8350-pinctrl.yaml => qcom,sm8350-tlmm.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
index cae726b5fc79..0b1e4aa5819e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SM8350 TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SM8350 TLMM block
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM8350 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM8350 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -39,7 +38,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm8350-tlmm-state"
       - patternProperties:
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066985F6951
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbiJFOJy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbiJFOIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:08:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC636B14C3
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:07:42 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 10so2882273lfy.5
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=blLQTq9+j5uZEra8Ae2S+s/ZwBy3OJUhQEovum2+Jvs=;
        b=YNRusYNjnZEAuX/4uiqgIY37FwQlxOqEteeE//bDeiyVlSot4ItQDqv3NUx1CV19ej
         wSNuFr/PxbnV51NLFvDwEhlayVE+AZR0Ye3ewVq92HRcBg+T+zSKiRIdHXD2KMkfQL8+
         uCwA4Ve99kXlqoP1UKa2Fz4L2hxRdKMf2CwDmCMh8l3KVUAxARJKulpI3DteSFo4X8wK
         ad86xBm8All//xPX/ZuhxyKpcr2Q9XoLNnKOUB43l2r3y5Bg6NMB0a4yAnEhqsSlU+uF
         ikzMGtsXvUhlQ5NBX0pdj0RQeN6ATQpW7J9aYL8T38Df4qrbd8apowwNFwTShKKOFzoi
         E0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=blLQTq9+j5uZEra8Ae2S+s/ZwBy3OJUhQEovum2+Jvs=;
        b=T1o7a5+5Lw6pf1LUqHdVDpy24yZXQwOM0g5QDVEby0NmVk60Vg1/u1HZUV1cUXdAa4
         6FfHLfIOZKVvylwoJYQiX664xS+Ij2Nbxmvqeg3ZO/zIXP4X9LCajYBVUbs7ove3qzam
         6fTWrlTbg+xKgVGVOiDLpr1+pXSUBn5c8yxOssYmbtgeaQDbY+Es5IxgswDjdzPvobho
         TBz6wh3jj+t+rt5C/bvzEdL3qefcaoAa/bYeWY9k5SCxR8Ua0VweAUSl7Ve0E8SY/+Od
         ktbLgGi9K4I7mkBVZakijHn5MMcWcmY6EPkTFDp47m7/qXFlkQ7oHFxMtBZH5C4CIi7L
         IELQ==
X-Gm-Message-State: ACrzQf1cayTv86wOWD9Lrp/5h9uVo6blVkuTtLKFycJpSjTFGEfuC96y
        aEuUfZFwZ1R7/6oMEuuMf5pvKw==
X-Google-Smtp-Source: AMsMyM7bdRXNWW0fAI+5WtMnIi4d25Zq5+oJOA3VBjSRwCmmdxg87/wyiHJz55CMsrD+9NJJIejFYw==
X-Received: by 2002:a05:6512:1694:b0:48a:9d45:763f with SMTP id bu20-20020a056512169400b0048a9d45763fmr48967lfb.662.1665065243518;
        Thu, 06 Oct 2022 07:07:23 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:22 -0700 (PDT)
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
Subject: [PATCH 31/34] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:34 +0200
Message-Id: <20221006140637.246665-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), drop redundant minItems, use double quotes
consistently and drop redundant quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml   | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 290ba2375e92..bd45faa3f078 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -4,22 +4,20 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SM8250 SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM8250 SoC.
 
 properties:
   compatible:
     const: qcom,sm8250-lpass-lpi-pinctrl
 
   reg:
-    minItems: 2
     maxItems: 2
 
   clocks:
@@ -34,7 +32,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -110,7 +108,7 @@ $defs:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
@@ -118,7 +116,7 @@ required:
   - clocks
   - clock-names
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1


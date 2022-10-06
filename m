Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40685F68E4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbiJFOHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiJFOG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB05AAC3A2
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id by36so2375665ljb.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tOBbF15hJ9TYNqAughaiocWON6qhxiUlu39zAvw94ug=;
        b=bFx3cX2R/6JU56I55rhCeSBqEVW+14r8TU3bpBlVQIZiGj0yCBMvSssfxF8pubnW2J
         ki9I6mwEoRC7pte9l/NwOcgjRsEcgD05ZZaqu/m2T1iuA+LN/gkhxqK4H6TBJkWECb3D
         CLNNlXFNWbptQJGFBf3NxXXg/Nr+5dFOmtVwOihScp4VsobBJyXNIHX64FOMt5NAgm3o
         MVlB30zd4jhf6XFQBM22Oc1jX24dUHOWQ6NRY/RzicBada5cz4YYR4Zwb775ar2THays
         CX8hRGyvsiUhzHFYA5DFGmrBlRZZMHWTD5PYsNRmr+uSJtjRdWtjQ/segUe5nlTZQoxC
         n5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tOBbF15hJ9TYNqAughaiocWON6qhxiUlu39zAvw94ug=;
        b=HJ7f7PvR8ujZ4eL09axQSUQsk34rSKCJ0nwEhDOqJ6Ysk/2FeOKo9o5FVCEV/zlkip
         xl03+F/zCcP02mXRxFccEPwV+N1o21fysx3Jv/qMGzwYUEVLbxHAyO1ramZOiK8jsOtX
         AgnGaG6A8j9NvuBCGomGBYL/CZIphYbJpFXN6GgpuHEulb4lymD8r+e6+XATDWEQLKfb
         mZ+dmPTJtlPddOSWYLa7cy5r9PZO/z0pmoeNtDdmduAufXAmTuFBCcVHtBvZaGLfAt7d
         jdgMzcycum4DOVbpgwFL+jQ3ecYrsGiHZ06wfjqd9QGPyjyHHjOlO9EwlAzKxS6Chgja
         7kBQ==
X-Gm-Message-State: ACrzQf1dJ3SFqS2vZiT1cQsmyfRncab72BQ7T3DjNu01t30ju4IY/755
        p/fYy4+YXh9uXePe6rSficheZw==
X-Google-Smtp-Source: AMsMyM4WPmQByHLjahfWmNzJVHU8K6fhLUqG2qT2UZMAZlVDrdq0xpY4RAlipHxgCw5D9Mlp1hZxjA==
X-Received: by 2002:a2e:bc09:0:b0:26b:fb61:dd22 with SMTP id b9-20020a2ebc09000000b0026bfb61dd22mr1858220ljf.1.1665065212178;
        Thu, 06 Oct 2022 07:06:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:51 -0700 (PDT)
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
Subject: [PATCH 07/34] dt-bindings: pinctrl: qcom,sm6125: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:10 +0200
Message-Id: <20221006140637.246665-8-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 5cb8b272cb7d..843d110df240 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -61,6 +61,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -112,16 +113,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio[0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2]$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1


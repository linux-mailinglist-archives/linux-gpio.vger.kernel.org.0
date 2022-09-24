Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5215E89DE
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbiIXIIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiIXIHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:07:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908C3155644
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:59 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id c7so2273802ljm.12
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HNwxWQOq48N1VUFnvQ2D5d/loFw4gC2TJinoSqyo+l8=;
        b=BiVzSgMFabdIamj0lCD/Het6ygXdhSXgsoFt9JwIJrvxpsOyaJniaB7g4RlJIc8Agc
         CvcoxUVOt9bVH4JhMYuW65fo3vjZEkM9i94vZ2Ci2oYOS3FAX0o/Oqpo9lNhoCo3ylzg
         gKqGgEeJcDn3lhk6gZ0E6Qb5+Ei69O7/URA38uxk1PSZMfRmo6Rctm62OfyOL3+dQIEM
         b46XV6hqTVMQ+Fqcztvi+MxaPcp9Yf4kJUGhct5mAhTgi34F2kNXeeVnCp5j/QrSdhl1
         TwyQpBeObzLfov3diQMO5vddlS+Z0DOT7mU3ijAO4yfJ5kxXqBo1w2L0FeQwfNpq8ltb
         SQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HNwxWQOq48N1VUFnvQ2D5d/loFw4gC2TJinoSqyo+l8=;
        b=3mzhMXjkqskpRX2FHfxgXeh2tBHVqQFhSiUaY3n1Ek1h3XamYev8RgUozQw3tao3Xv
         6IMz1Rzk9e6Q1jyvzUih60smMKav3d3SybesoH1JiTTV9GPvnSVlRCmKMWUWfaoASFDO
         mQNCfKJSj4HWDYN6fxREOcIMseN+92zpJKSPZC9Mv/laehqPOtyYUehX/B7cOa6Df/hH
         biOXm4sIreh6dgz5QKpAaWh5Wn1jl6WYKPniBg8xSVVqthL0hDUwvaVR95wgMWJQkjA2
         EpUODOBuXxTJT2I/uwr0U6INjst7gbKaS6LJYpWG33sE/RpjDv3L4eFepyP8lmwVpxp/
         ETXA==
X-Gm-Message-State: ACrzQf07M/wy1n/a6lizL7Tb3CHU+dx67lvnrfCv0IxIa6/cHHAgjeF/
        pUG6oR1JU8bN7b8Oq2fXJcs9cw==
X-Google-Smtp-Source: AMsMyM6GwrYhOjw4DiSyDWrcY3mKxoP5UbseKfXQTYb8bBXaTxmPBodlXStoAJewcXc71Aquw2FImA==
X-Received: by 2002:a2e:958f:0:b0:26c:fd2:80b4 with SMTP id w15-20020a2e958f000000b0026c0fd280b4mr3890692ljh.147.1664006746974;
        Sat, 24 Sep 2022 01:05:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:46 -0700 (PDT)
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
Subject: [PATCH 30/32] dt-bindings: pinctrl: qcom,sdx65: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:57 +0200
Message-Id: <20220924080459.13084-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml         | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index 0f796f1f0104..a45dc81cfb98 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -59,7 +59,6 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -142,7 +141,16 @@ patternProperties:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-7])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1


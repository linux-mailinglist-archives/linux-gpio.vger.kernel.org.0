Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC8C686A49
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 16:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjBAPa2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 10:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjBAPa0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 10:30:26 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E0111148
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 07:30:24 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so1666090wmb.4
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e2vajhQRGz6tVBbUNED/4hod8rqStI0ha++lJD4Wrmo=;
        b=cBV/3Rnb8c4xCJsid84iSTM6xdYv9y+2SentKtI7JrEYTvuVQOKMgGw4ZSM2+vLTNy
         UFDhLv7HUbUN43yVbaWSl2A7vlho0ZXsjR1vjVIhmW6N9HGxrKjeZPW68yXuoULYUoCi
         KyHvHf0xFIsbnAMdI3P1HLDFMyIPgJSHuyS67SYv0lJltSTRR1GTlYjsbaG2e2GuK5dy
         qfDLp1Kzq0PW1wK9HVeeDu4pd662b00tT4FVxdq4c/RurTCuqNvb1spNStdVjFM3o5Mv
         RVyFE3JlwEQ+DcwDGSi5KAQwREUnTGFDOcaiy97D0uW1p0HHTyStZzWYa0dP3eckLY+s
         ni/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2vajhQRGz6tVBbUNED/4hod8rqStI0ha++lJD4Wrmo=;
        b=xz/6LvOcPJ0PXwOgouSzC/93Y4b37/VBmY6VppdoucUllLKGd5pcv+M564vzXQxqgg
         SOY8Sb73hJg6kX1k5bCxI033zwRXCkwPigJzozioc/6phSY83U7EA5Vma94jR17Y2UbC
         GhAuBXfdykFxFnyBR40IYbkqDA47QSYDxCILOUG6H43fRtMnsSKBLDm2yovcfW8sjpvk
         u973UtEXcFMK1e7JtKwljWstmETLvf+wJNEN66dJSFU0Q8qfTNIm9xBgDK/tn5+7l1pT
         2tmC0c86Po25C0ejEGJTKyS/9NWKwTHHPhuQA0dgkgqNuvfP2HJRWNhc0OH9JCktGXSf
         jnzw==
X-Gm-Message-State: AO0yUKUISsZFAEoQRvCC6DqKcWKODx+veWaYUPj8Plw1C318/8a1lkM4
        oKp1ckS4X0tEwucS5+2Z8Wsgng==
X-Google-Smtp-Source: AK7set8zbyrq/7G4eviSWTfVxnY/oF5bveG5azjEqpjLmK0AW/sRGPyTWzabN/xGU6QJCgqXlYQfYg==
X-Received: by 2002:a05:600c:3b17:b0:3db:2e06:4091 with SMTP id m23-20020a05600c3b1700b003db2e064091mr2605005wms.37.1675265422970;
        Wed, 01 Feb 2023 07:30:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003dc4fd6e624sm2168032wmi.19.2023.02.01.07.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:30:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/7] dt-bindings: pinctrl: qcom,msm8226: correct GPIO name pattern
Date:   Wed,  1 Feb 2023 16:30:13 +0100
Message-Id: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The MSM8226 TLMM pin controller has GPIOs 0-116, so correct the pattern
to bring back missing 107-109.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index a29b8a9e1f31..6cb667fa8665 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -56,7 +56,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-6])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
         minItems: 1
         maxItems: 36
-- 
2.34.1


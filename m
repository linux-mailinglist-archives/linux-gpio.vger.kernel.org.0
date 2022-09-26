Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD32A5E9AEE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbiIZHrB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbiIZHqV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:46:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D602BB35
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:58 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 10so9508280lfy.5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d361UG0+W1HR68pH28QUdU73b8SedKMO+BvUFZbi11M=;
        b=TAWl+Y11p5mK2NgD3nuGSyTJzbsfNgV9h/jW7+2gXWdKq3RYbQxaVWTGlxCGq7hNX6
         ZxqaXfJvZu1ed3c7ViWVKkQRjdSWVmmJqrPm+8h7yRu2E3BeZGt7vH3QoLJaqkUwoS72
         ll60ihO6Fcacw+YcmUTWDevH9zxi6WDlkJCVbRAl29rb3UaOFz/4Lx52FXOzPI79x54p
         nSuVJsgozXGK8w6i3AOMjgdMDZUri9fSIGLZwFCTocFo+Ha+hcIMtjO52ZZswhJaDhPc
         Bbtp6ERjxr4VsM8g0zCLRNssINxk9w46qj2/R47033I/kQgCpeseRIxGsOI2nf2TLT8p
         oSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d361UG0+W1HR68pH28QUdU73b8SedKMO+BvUFZbi11M=;
        b=aIrtcosWKTtsdTZijJOkjvOvzaJfNWO3cujNgQNkphJqvlkvpxcALR5E6ZaDa8fn74
         O0C0pwGzxBshmqkuepaOYT7670V4yCZY78QatkYibYrud5vy+yK8210jKqyDs/kSoP79
         49UmfN6O9OL45mkmSm3uuRXfotvfF4MZhtV4nNHMhtGMRqp6hRY2lvII3nDAQIfoTyrS
         QdM4y873517sRo2QJl38J1LYVDu8sMf7gmWUkwX+42DRqoqADvJbfsOQH3VfEmsSvpz3
         dUeqnGbQA5ljDT8AH93TOlLQwokMDMKRV07UfhP6+AkSL+DQ4ExwOMES5WsZ/clzthhZ
         CkBw==
X-Gm-Message-State: ACrzQf3Psdlj6x8C6y/aLA4Qb9ZaMfZ/xShxgAzaCq2es2XSzAIaSVXJ
        9lwCMm71IaO49opVHrKGn1I+Hw==
X-Google-Smtp-Source: AMsMyM4Zz1JRrNG014jekNM+LqhfpKiV0ZAo6Ry0TI7ovAn8ylhht8yNJXIQPvNEm1gSkemtf7N5wA==
X-Received: by 2002:a05:6512:22c6:b0:498:fff7:b57f with SMTP id g6-20020a05651222c600b00498fff7b57fmr7991751lfu.582.1664178297888;
        Mon, 26 Sep 2022 00:44:57 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 18/33] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on non-GPIOs
Date:   Mon, 26 Sep 2022 09:44:00 +0200
Message-Id: <20220926074415.53100-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index b1735918fa90..08e2dd5cbebe 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -113,7 +113,6 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
-- 
2.34.1


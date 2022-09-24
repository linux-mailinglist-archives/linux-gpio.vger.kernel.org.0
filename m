Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2E45E8989
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbiIXIGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbiIXIF7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:05:59 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD6D12206B
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a8so3475557lff.13
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2TwKdNWuZMW4tDzGDR4b3f+SkPIFjsrJJLyu1c45nTY=;
        b=BX+VAm5C4U7EgFkWkAtZsTQt2H8S+glrOaE5O8XZcBgHUcBuOgyd58r28Vj/CwPLDr
         AmLMPNblOgTajSQKAXxgYJXXLegeI7WcAaPIHRqihtQ8GgDWAEBAmgQZxosW6J5U8n3t
         R3BNMDNHrn0+2Tl08koflm5rEGX8Is4FvBng+xMZOJknG3aXJ5w7w4DQgmBqs6GH+a6d
         pUlfP5C6txjSHxQ1YBFQ+cMKCKsVhsJybSIztQg5KLRzmOfYDgziSRt/xluuhJ3thRUM
         g2/d5uV0I17wacRFUJj2D4KkWK7VL+94+TRYHHKWTQ1uDT9Un+ErCmpO9nExWgPi+vUJ
         r4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2TwKdNWuZMW4tDzGDR4b3f+SkPIFjsrJJLyu1c45nTY=;
        b=JpQ4TS0izWTogvI5+nQqhCmf/lCDj6LbheXcpazM8LjONOjs22c7EIOlnId9L6FnI/
         9NLIJpYpR/EtSRhrK5C+8zYHxR7VnWdFZoIL7ZIWSj9dKrzhzCgvi5vW0fOk9MUDg+si
         EXkiuyfOZETm8HypZsbQrmqR26F6s4nrdLvHCpRZcamuGpd37Ko0i/XFg22IE3GfdEeM
         aMW25VY2LkYJWz3VFs/HfzwNDNba7aEWndoZrNMXjXT0m/Bsq9CYeZf0QccfC14wHvhN
         BJOqETlXU5mfLXovOrbQriWKVJBnz3Hg6PZev0+15ZFadDEY7woC42qgeRc/vbAAcQtg
         ioMw==
X-Gm-Message-State: ACrzQf1/QiVKuSYS0TsK6kel5njT72z7nmXkJtBirL5FxTXzMkGhFrrs
        a6WDYtfsPXKoOZRdNSHkhbrXGA==
X-Google-Smtp-Source: AMsMyM74XcWpxpndDWngG2GWNCotgtK1uoLqNmEioxLx/JHoTqKYKTmK2jus5plKWsiXe0tw1AF5fQ==
X-Received: by 2002:a05:6512:694:b0:498:ff40:24e with SMTP id t20-20020a056512069400b00498ff40024emr4441740lfe.265.1664006729604;
        Sat, 24 Sep 2022 01:05:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:29 -0700 (PDT)
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
Subject: [PATCH 17/32] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:44 +0200
Message-Id: <20220924080459.13084-18-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml          | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index b1735918fa90..e4332e628698 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -53,7 +53,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -113,7 +112,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-7])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1


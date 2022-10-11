Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39125FB92F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiJKR0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiJKR0P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:26:15 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115BA32ABF
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:13 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id a5so3906050qkl.6
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIrBy8IF6iGbWcZ0YVqj9pp5C/hpdRh+/4SU5uYRz10=;
        b=u1hKAipfvELU3lnV93L2zt/Jp95vb/foEbL+34Kdft7we9KS1BgPk4s6WcL77eRcq7
         PlWSMb92E48rg+p3+s+hDe9UkPsi40yAvsGRUf58Izw7q5G9u4SNkrdsU+3sCO3R/h5m
         cK7MX+3Pk4RcDQ5z7cPThnCLqDWWlqzP0R3mczWDEzY5iwBLa08tEpZ5jP/9S0CNZEf3
         VUPKGf84QkcHi5iATOTMyqSEi+1rARn7/RpowBRWNsA1iqEUwgDFegkYEhA4pj37+Pmu
         Wjh5rwxejuY42U8n2TbGEqBXMsicOyMMMbWKJSZWwye80e9PMZnVrePPKgU79knFfdYz
         IIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIrBy8IF6iGbWcZ0YVqj9pp5C/hpdRh+/4SU5uYRz10=;
        b=04b94B+VVx/2CKY3oE+C/yBeOsKY46S9TTM3XgrTyzYaKKezCOzEK6BJWQ1pRqh4K7
         ek5vQ/9dbbA38/lTK4GxU6b6BrHqXi2dU4rP4C0BQ0rksst8eLHjrKsw88+T2gZk+Ais
         x5T7dpEJa/vh1YIAm3c7hSs01yIz+VgEfaPmGUp4XZNtpVB66/1BxgyRIvJ9rOD0yZMx
         vbSpmaJo98CDm9ufvxNwjXei55uIapJeDXM0mP6zHeVnsV06pavB095Y6IY8XgTrwcyr
         Z7IqmQTo5WZwN5szovx9+zWs+YS4XXbS8uveyBpyMh4LbBH/ndI32aCQzl5H5w+4a8xN
         HIaQ==
X-Gm-Message-State: ACrzQf32MGysrBc18XfHjgcijGAo9ntpyUIAqgDHfdFK8PW796/qsuNz
        zHqR/P3vsxL6QAny614IRTe6kA==
X-Google-Smtp-Source: AMsMyM70d0L3ZDkDZFu/5mI0yxhXIDHDjA5fsNj3UJPGXi9RTC4MMJW2BLaSUi3jrkC6OyO6cbK4Ig==
X-Received: by 2002:a37:b5c1:0:b0:6e3:5c02:f6b with SMTP id e184-20020a37b5c1000000b006e35c020f6bmr16806321qkf.299.1665509172798;
        Tue, 11 Oct 2022 10:26:12 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:12 -0700 (PDT)
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
Subject: [PATCH v2 05/34] dt-bindings: pinctrl: qcom,sc8280xp: drop checks used in common TLMM
Date:   Tue, 11 Oct 2022 13:23:29 -0400
Message-Id: <20221011172358.69043-6-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml       | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 0b251caaebf2..886d4e76af44 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -53,6 +53,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -113,16 +114,6 @@ patternProperties:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-1][0-9]|22[0-7])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1


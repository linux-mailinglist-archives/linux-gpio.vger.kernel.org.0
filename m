Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F2B5FB93D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiJKR0i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiJKR0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:26:21 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5E627CC7
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:17 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id t25so1859730qkm.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eexU8QFju8foCFKK6LIrBeBMIjjHKwOcOdgfsoR5Zts=;
        b=qJg502JCCzGtCOXo1iydsBXwROQpoVQBUq5jr6c5qP88Z5RfRS86WWJ5MYg6B8z1id
         ZtZ4/8LsdlJMh8CGaQ/U2hCzVgqf74v7gYpel5UiEx/jDhoSYXBECHE5UybTeC9IPH8H
         E3A+ToB/LZPkscQkjS6z4R4kQn3rN61FUABun4Kw91OTHt0g2TCN14IP2oEmA4QSZywL
         3wy/1dEIm3SzpfxaBp1cOPovPZvOUjo4IW4eYhx5v5dghb0B9jxUuDlBfejGcMetMul2
         t+a8LhVR6CwNuNZjRKb4TsskBtH6nZAKj1Jz5rhu6k1F3njJBIYvL97U4bP5IYIRdhG7
         4nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eexU8QFju8foCFKK6LIrBeBMIjjHKwOcOdgfsoR5Zts=;
        b=tKIOxCZZ20wSw5IalY5zOBn802AI5en80uxgHaPKYUJjNH7uFGtJ2wQvj47Y73FkHd
         Bn2E358QD5boLTFd58iLgetpymKucOxft8Nq+cHjhdCLjhMONotkUhCxHMmQDVULYPrk
         yIAG6/RbNoGWuf5D5v5P1hhBmcGlNgCQm3dYUZ9VlxolD4oEDmKc5x1CzzOGJM6+kk7w
         LiaJYZsw2iJuee77Bfu/71U79w8tUKaFYt/HROhb3w9wiqA3VppaplVx2hrQRyQVyOaX
         6CtmGKPcnrvWERUyz+s61AVDantu8mV94F2/LjuxsfZWfBRivh7dH6uUlKzFpbTd9rvk
         5oaA==
X-Gm-Message-State: ACrzQf09ubavD2QlTWy5+Np7Wmdy2vxRiQdxRB9rqyPWy5CMH8o6v/3V
        wLDETloi8f7tw2zfuozsFrCLPg==
X-Google-Smtp-Source: AMsMyM72U5wvbPcaUfrXy0dlzb7UYbYJh0yCiirbtEPI/iHMlwBiuRihmXIPGxcqutA4/OjvlKrT3g==
X-Received: by 2002:a05:620a:2893:b0:6bc:6ecd:2c44 with SMTP id j19-20020a05620a289300b006bc6ecd2c44mr16917020qkp.593.1665509175865;
        Tue, 11 Oct 2022 10:26:15 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:15 -0700 (PDT)
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
Subject: [PATCH v2 07/34] dt-bindings: pinctrl: qcom,sm6125: drop checks used in common TLMM
Date:   Tue, 11 Oct 2022 13:23:31 -0400
Message-Id: <20221011172358.69043-8-krzysztof.kozlowski@linaro.org>
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44335F68DE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiJFOHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbiJFOG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F4CA7AAD
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y5so2885003lfl.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xBxAAAZqbJepJDx7ev8I2JTmsTNcdA/fWXko/W5ivCo=;
        b=pSMml90/TjIKtdorzvxFhhT133Jo9ciYhASMz19zV2kK50XdjAwJwv5lO1VYVwqyED
         II6rwRGfYwIIXEE+dQYkMSSATa3bK9VVxTiHZ0gdtuIAv4ynKdD2L0/yQNADEDyxZBbt
         fcidvUjivcz7Ho5QV7RYge/D4B9+h4NJoV+/fkHrpxoDZ2hRAnHNeA/0eaGU8+fPZy0A
         gNsJLdbHoLPDsj0NfQgaQ7YXtrbsa5kox9fZqeBiNnXtmFIfc/XmzEv1s8DTlumnX4OF
         AxsZiGQv5e4zyAFmBbiZi5cEcHOVRtEgFkmNWoQfc6FHdcorcPQZFVTeIuhUi3yfGChK
         oeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xBxAAAZqbJepJDx7ev8I2JTmsTNcdA/fWXko/W5ivCo=;
        b=X+WHm3IjDe9ohVIY6lduNlXK3d1g7zI5AC6HtudbkmUvnRu2oPghGAQgd+EGHwLV+1
         EL9CucUxnVAgnRnjsjC57WPobl2duSNeSJqkxRl1RMTUZkViOadsR2XAfYCE5H/T1vF/
         re1Vq5WQOE/9kprO7Qi9C7KyAHqtyAg0CNtKUXh1ZFO/AluxAubVBa3rFgn+YRBdYQQq
         i11NUOp7qdt3qkOzjC5G6ezFK+6vICKXQMY7TZddd/ySviOCoHBG+4PPlWylVrJCmLLP
         ltgaNCXKZxwMrRZlUU+qCeuB4fmf2uVG2vNiUKiOsYEti1zU5MQqkfg39E4TkPUwiuv0
         gsvw==
X-Gm-Message-State: ACrzQf3KbMbyVYo8eUZwan4TiW8gwrRNSAFjBJynvnNjMoq4V39vb1c6
        hbaUZhMjQ4wEV9Ta80imx17OCw==
X-Google-Smtp-Source: AMsMyM5epxxixVYR1h2JmGaRPhjjWr5aupqaYOaxREtZesEZceShhNnnkKmi4ISFZYgNk1jE+ZKfAA==
X-Received: by 2002:ac2:5108:0:b0:4a2:3d2f:7bb9 with SMTP id q8-20020ac25108000000b004a23d2f7bb9mr46186lfb.49.1665065209493;
        Thu, 06 Oct 2022 07:06:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:49 -0700 (PDT)
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
Subject: [PATCH 05/34] dt-bindings: pinctrl: qcom,sc8280xp: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:08 +0200
Message-Id: <20221006140637.246665-6-krzysztof.kozlowski@linaro.org>
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


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804D2601CC8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiJQXAq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiJQXAn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:00:43 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AC718B3B
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:00:42 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id m6so7667141qkm.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4y246bMRiyXgggpw2m0x5+DX7a97KLlgQ9WDTK7SfM=;
        b=mUFEJCSk09jb8jGoWwQa0vKEid6CLvvtNHin4oambt6KWMAHfn80JmDsDmg5Brvx/1
         P8iMhQs94FKl7rnOvzgnVROSyYVJfiZGZzWPvEAah6dsAh9vN4iltnZcxGkb1cJejnC7
         1KN/9cW/bKOKYedaH2GFnP+sg84ddFRgmLSsJEiQjmGJFtfUKgZm2qY39xwRhc14YYk4
         qi1UnXFFIYMoO7c0EFv4wB9ocR3hSdmk8vheSH7KQeXOG1OcTMPaK/CaSwabXQZxCYKg
         G4+ZQUr9Vt+fG0PMhl6kk2oXX013WjUL6LTwjnvcoCQc+/dwxzfMwIhv3m4MEhWeIpZN
         6ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4y246bMRiyXgggpw2m0x5+DX7a97KLlgQ9WDTK7SfM=;
        b=c6QW0Z13LZhrXlb3TyJIQC7txYa3odJQ8nEf4QLKLRXSftvL25NoR741qE0uGVTIWv
         9J9jVgMPzLxwqcDBb4xbmsr5zRXXYTCNjK+ozMAbEsE8/vNN+8+Plb9NFqWAugf/N/wy
         M4JO3UZ61VBeCbjl3gO6yDIXlyvl37CgsFxvtwcksx5SeW9ISBnsurkTk9LvnCcILYhK
         ChduBhS65Tf8htlbqnyWYtxDDySOqK3N6dMHUJLQ1+HzZwTeRpvJtRXa1+nfZaVo24TY
         tlUgJWpIPVGL3JglciEg8ClrGAvcvebRsUiEq3aT7Rsk1pKGEA1ZGYBCf0W1QRb7guVg
         uw3w==
X-Gm-Message-State: ACrzQf3DchKdUaDb5jWs9bP29qCzImIP4U3UZKDv5MUgl54H+6N8bIsG
        nS8ftJfzZRq0jlTAVAQ8ltl9/Q==
X-Google-Smtp-Source: AMsMyM726XhVvb4hYJrzGKBDrYt4jGbTNBIMU0J9pzNnhlVZdfT1IaARxDLULixo9htT6PA3OtrpnA==
X-Received: by 2002:a05:620a:440d:b0:6ee:b5eb:a0c6 with SMTP id v13-20020a05620a440d00b006eeb5eba0c6mr9642121qkp.356.1666047641226;
        Mon, 17 Oct 2022 16:00:41 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:40 -0700 (PDT)
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
Subject: [PATCH v3 03/33] dt-bindings: pinctrl: qcom,sc8180x: drop checks used in common TLMM
Date:   Mon, 17 Oct 2022 18:59:42 -0400
Message-Id: <20221017230012.47878-4-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc8180x-pinctrl.yaml        | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 62d0ea7bbc62..71ca4cfd567c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -60,6 +60,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -111,16 +112,6 @@ patternProperties:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-8][0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1


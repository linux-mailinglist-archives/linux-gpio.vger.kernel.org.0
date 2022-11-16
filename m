Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7E962BB15
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 12:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbiKPLLt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 06:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiKPLL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 06:11:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7063C6CC
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:58:01 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id g12so29055526wrs.10
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEdbDk2wJVkl3rubNY+LO4i7Rgy5Hk/w2qu0GygUSzI=;
        b=ZIVY5j/2cma1itu6fm6wJ2QJFrXzr3QsiYqTHhe9PEmEuPOfA8D4Vr/N9aWI+iHMIR
         bozG3vZTiqQ25I3mSzS9neCkJW0sIddE4dAqZ1laLuK0ObPCJGS/V005Hb92pJGp0hKJ
         UVvm0tgI8Fh8RN4zd4mPiBd/Gu5M68c5utAop6dq/GqAIsz2R35g2zoaGIOtzMZ+MXQF
         U926K3QwYLorrqbyb2W11DWO+81W93sf461GyfZeReV9O1nN+L/rGjMnSiiEVa6+cRRD
         nAxRDvSoxWSDxssqal9SN020ggWEgJcmHIzMMxsiMklo7J9Dua/LI4RI/hfKHh9RoLW8
         LVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEdbDk2wJVkl3rubNY+LO4i7Rgy5Hk/w2qu0GygUSzI=;
        b=PWFnzj81w5eZ0Pbjj50ca9vnD+OElphiFEMlDzDUBVAGd8b/P9TcypQc99qbeo+rZE
         QtpKJiVwvQejKfBNKQrQ3kiltAn2OKPnjEN0+TdF9ixtQi0ThkOZTf8ZgG3FEcNlTNMK
         kh6hRGL6SaIZHsgS2AJZFW4pRiY3tNzYOvxW7uAQaVHPiWmEa4xZwnHT9eYwVL5LCRJN
         bcBkP1LwMlHxprrU4HjjQ9yZseHOkrZ4luygYZK+GDfuA58bUZ61gWzYFjizFRJhErFI
         K8ZAk4S7IDwhryJYpIUyWsf4JlwID5s1/kLZGkpjqT91zuLItrSWnyEqlEf+sIU1L02i
         TIFg==
X-Gm-Message-State: ANoB5pm1BNZPKcuYJ04W2YehO8k/6+jpxI2R2tH0c/JxD4AZHpFxIB6d
        3eI10LVjH3Pr9305ZZgM2UOxUw==
X-Google-Smtp-Source: AA0mqf5vUX/IzsOOWPxAELgcvX6K8puEuHEQSgib0rAROSBiGm0lwbkW6ySoip+YBPxFa9Evn24tgQ==
X-Received: by 2002:a05:6000:152:b0:22e:34c2:c6f0 with SMTP id r18-20020a056000015200b0022e34c2c6f0mr13308116wrx.232.1668596279968;
        Wed, 16 Nov 2022 02:57:59 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00236e9755c02sm14935053wrm.111.2022.11.16.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:57:59 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document i2c pull property
Date:   Wed, 16 Nov 2022 12:57:22 +0200
Message-Id: <20221116105724.2600349-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116105724.2600349-1-abel.vesa@linaro.org>
References: <20221116105724.2600349-1-abel.vesa@linaro.org>
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Document the new i2c_pull property introduced for SM8550 setting
an I2C specific pull mode on I2C able pins.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index e1354f0c64f8..eddd58eafba9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -77,6 +77,9 @@ $defs:
       input-enable: true
       output-high: true
       output-low: true
+      qcom,i2c-pull:
+        type: boolean
+        description: enable bias pull feature designed for i2c on pin
 
     allOf:
       - $ref: pincfg-node.yaml#
-- 
2.34.1


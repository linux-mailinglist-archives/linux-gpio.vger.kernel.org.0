Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66BC689F8E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 17:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjBCQtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 11:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjBCQtC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 11:49:02 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BFD69518
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 08:49:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k16so4334116wms.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Feb 2023 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7fygOdZsaKNxAZfY0Nswu9GQwo+E0g2Om6LbR6cFEI=;
        b=UakTA1yo55uI6IxCEGC8dvi2NMX0aJaywq3sGxRp3vZjASo6VacmEoo29lmw1jA9oZ
         vpQpFyaVtLnSM3RzAmqzK2BSjIr0z4OLj3Roan959PrConZ0u3MfzSQldi5Y4B5fGJcb
         XDGd1QdaKQL+Y9ohtNa8euoR8Tkjy3hJ+KFZ1CvzT5aGP/AF/VRsRc0uGZALIjooSidr
         NJUxFMTfUAY4lI90FKEpRKnIHkRYaOl+AJFRHAiTaUFocplZyeNZ7QCAYo2jZ9KRHzEw
         MRvl03QraFdET0Tdgdvg+1SfBFFxBRi4NAlViPrB3pDvVS0KLabnTep7jt790HbUi7uo
         J3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7fygOdZsaKNxAZfY0Nswu9GQwo+E0g2Om6LbR6cFEI=;
        b=elBuTAM0Jrj5bDYyuYDlbBzNmIfce3PNrTSUNQyn91QETzxpbrQUxqVWYfHNn+9aES
         tNdDT+CpQRDaL/F28QH7gx0zYIb/4r7lkga5Te6fDtf4yiKdvXxnThDWkHSAu102pE+Q
         wmwR+Q7HHjhRBJK1S+8Uz4dntwP3QOq4gZ4UC6TxIgY3XwTiGff91FkT9ufw4qCCajFu
         PpxFpjMvXDcuwhqWZFEOy8qJ4MLilxLkrxqk7I3TLTOp5H6OesbXRAFI0KxWaQh7rjSe
         93v2IzNCM6QAQ6nKSnpG3QsYDb/i63/CKNZQvPE3qk/OyDpL1Vbnur6UHLut+CJ2Rwm5
         uwag==
X-Gm-Message-State: AO0yUKUqJjzzb0yV53hwV8ETyWYHl6uH5idtDwOn0nB5qt8MgWoP7Fpj
        gt7hV6pMqwkXU6UEwGyQ5El76A==
X-Google-Smtp-Source: AK7set9TShnTLHbIW6/3pFDi/PX83KRo46a/xv9wdTY72kFHj9XQ+9+Bw6MA81M1FTrL+vS58KxoMQ==
X-Received: by 2002:a05:600c:3b1e:b0:3dc:4d94:62de with SMTP id m30-20020a05600c3b1e00b003dc4d9462demr10240148wms.14.1675442939439;
        Fri, 03 Feb 2023 08:48:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c355500b003dc4b4dea31sm3503247wmq.27.2023.02.03.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:48:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: correct GPIO name pattern
Date:   Fri,  3 Feb 2023 17:48:50 +0100
Message-Id: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
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

The SC7280 LPASS pin controller has GPIOs 0-14, so narrow the pattern of
possible GPIO names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index f7ec8a4f664f..e51feb4c0700 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -59,7 +59,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9])$"
+            - pattern: "^gpio([0-9]|1[0-4])$"
         minItems: 1
         maxItems: 15
 
-- 
2.34.1


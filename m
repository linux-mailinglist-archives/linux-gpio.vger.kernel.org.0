Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9763D686A4B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 16:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjBAPaj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 10:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbjBAPai (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 10:30:38 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C3B30B2C
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 07:30:35 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1757420wms.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFMfHAkjUDblLlWHVZSYqqN498dZqtZtB7jcm99lH8=;
        b=P69JYgkUILRcU/LLDR66GsXPRDrZ2phcrXvvbt3odNO/hNLQzhUsqF+SRTzUj4ZevT
         9MRN8wWZL5khOUOwHCe/q1Bwz7Z8KxuCsQpedqK+A+xYS7cslW/lalWauswo2eGvtHEg
         bFZUIzgObD+0Kt7swpAvjYMrZtYVOZAmw59X6UNvgGIhla8YVNo1ACNs/VQWJ0kG5PP7
         i+VOxz7niQ5gmG++Vq+sYbFbTllyj0Kv0ljSGeUfJYCd6HiN/GVxiHBphSZ72K5j+Qmp
         gdgHkhHisyLHZzljpMo57zpgAu9rKupqzEKthIffLDCIzpZcC4b425yAqPYZgfjK27gd
         LroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yFMfHAkjUDblLlWHVZSYqqN498dZqtZtB7jcm99lH8=;
        b=TV0fNlbBWlrkBl4ldWH+XzRYy3RBgIgQ1pc/ryVJigQGEAeC8kTmODbyU8k2CBdnkq
         T2njyqTsoEb67BlI84k7SCNVG4VqJzFhm8tp+Ci+m1Ddhy7Sz9eMSF/45EgST7h+2cfT
         +chtm0thUWWcLOymFEshCvq6ZC9FNTxSH0p3nDvz6esrQSx96CU0GbWgE/m6JQmP/ZQs
         44x12aFqn2zWje1Q+3640ztzPCJAYSPfr1uifhYy3kVGS1znqBDIRdBqAdUMVXcA594b
         PZ5Jyc/pkQZjBK5zY1iGdEiQhAgeNB15khUCDbLrH9r3U2O1gyb64cR7IZTfvVwS4292
         t5+Q==
X-Gm-Message-State: AO0yUKU4POs+/3EwaVhRWdq7975OPG5/yn/N2yysIXmUjhwGLee7x2cq
        DuOOp5epWZJgKi/789mR/XKpzw==
X-Google-Smtp-Source: AK7set9qPY9BG9Uq0BAn3+LzX/IMvJwx7QPL5mLDwFnJAQ3KYRPNRxuoFxmHuHHNbEX/cpg/4i1uww==
X-Received: by 2002:a05:600c:b8e:b0:3da:fa42:bbf2 with SMTP id fl14-20020a05600c0b8e00b003dafa42bbf2mr2617121wmb.28.1675265434267;
        Wed, 01 Feb 2023 07:30:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003dc4fd6e624sm2168032wmi.19.2023.02.01.07.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:30:33 -0800 (PST)
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
Subject: [PATCH 2/7] dt-bindings: pinctrl: qcom,msm8909: correct GPIO name pattern and example
Date:   Wed,  1 Feb 2023 16:30:14 +0100
Message-Id: <20230201153019.269718-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
References: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MSM8909 TLMM pin controller has GPIOs 0-112, so narrow the pattern
and gpio-ranges in the example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index 449e6e34be61..85082adc1811 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -63,7 +63,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-7])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
                       sdc2_data, qdsd_clk, qdsd_cmd, qdsd_data0, qdsd_data1,
                       qdsd_data2, qdsd_data3 ]
@@ -127,7 +127,7 @@ examples:
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
         gpio-controller;
         #gpio-cells = <2>;
-        gpio-ranges = <&tlmm 0 0 117>;
+        gpio-ranges = <&tlmm 0 0 113>;
         interrupt-controller;
         #interrupt-cells = <2>;
 
-- 
2.34.1


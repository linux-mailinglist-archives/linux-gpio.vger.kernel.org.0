Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94AAA5B4E02
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiIKLOW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbiIKLNS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:13:18 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09023C8D9
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o2so8202121lfc.10
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZI124F7nFvecFQ6h5oN/++WSRxanSVcUeZ0lQ6afuW0=;
        b=zlAYo3ARhSagRIyM8pMBozYeCVh+GZM9nwNF3eMunOVp4+60djhiSTSPFzotCJlwnf
         5mR/X2Hw5rO9HB0F7I+sG9JdKSYhZLknhKpiTBkQ78zTxnKLTESmnrdVKDYJHuMh/2aC
         ZcHHUOpeeXSVpaJF0e2HRP25ZJmWlvfiAKRpFrsIjxUOi825d6+eK9fY2lFf9IeLH1sC
         fV4F6AddIOcVyh0w8hJhGa8fIVWHwoeNcrFCcBDc+hm2fxeujJf0JMet8jTSbTZ9TafG
         cOJqO8TV2YpQgiLjqc+Gc3MuuevbS+f9tIDmA5qnZWFIcrK8Anwu4P6QBmKI9pqMo7zd
         gfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZI124F7nFvecFQ6h5oN/++WSRxanSVcUeZ0lQ6afuW0=;
        b=PQd1buAWAg8VcxsTiLSJkksh89kYzP03bpsqL1V7t6G7lMG91qT7KH8/fk/vD26O4H
         deehX43n3fl/oN7m2/6kxzAyA2PyfhzNJH3Vhs5PQN7jyvQw/NEsd8zBiL7AyKfJT6zz
         2szZMMoAyBGAoirjrxkcfIf++5Gg+Kxj18Pl86DxEIJQBl/pv6NWTDfEnZLPqgQRHYk9
         6fVYoUsHkwwZswI24MBvgqaN1dS+pQigImETqayYNahxEv1MjfrqMyE9wPhF875agq6b
         J1iHm6VTYceP5KGxoN1JwUKSiaqVAlyOyo+KIBhfH8hmyTI1v84ludBCX8kxAV+7ca94
         0aJQ==
X-Gm-Message-State: ACgBeo3IKSSHdT1BZj5oRnGZ16LyFYA0ne86hGggEmn0Dc9Z9F9JIh/c
        JJfGLVylHa5BECeSM+kHy2j/1Q==
X-Google-Smtp-Source: AA6agR4Hl7vpJPy1Av5m6PEy6vumrvOlEFfhHsyZAj/7n2Ulwx882n5nr/jJtIbfPjN1gsXMbCSxGQ==
X-Received: by 2002:ac2:4bc1:0:b0:48b:2ac7:bd67 with SMTP id o1-20020ac24bc1000000b0048b2ac7bd67mr7231159lfq.499.1662894758471;
        Sun, 11 Sep 2022 04:12:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 26/40] dt-bindings: pinctrl: qcom,sc7280-pinctrl: reference tlmm schema
Date:   Sun, 11 Sep 2022 13:11:46 +0200
Message-Id: <20220911111200.199182-27-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qualcomm TLMM pin controller bindings should reference generic TLMM
schema (which also pulls generic pinctrl schema).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 35d3962dac58..b29fac302e6e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -134,7 +134,7 @@ patternProperties:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1


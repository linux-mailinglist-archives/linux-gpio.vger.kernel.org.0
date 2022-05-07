Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70DA751E9A9
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 21:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbiEGTxd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 15:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446974AbiEGTxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 15:53:30 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AAB240AA
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 12:49:32 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so8650366wms.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 May 2022 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilc0VbonCcRhi9mLGg0w5D3YQpFVaF2AQJc4whr2j6c=;
        b=GaZ9tzvXpjNcgmgnxuWraCdmeumQAoW/3TXkmO1wuvMU9opQ3dpO9bj45L8Jr/5EnX
         8/LvmS1ksrLMJvrHMEIYATBlxOPm20DZttBmCbk5s5rZshwBWOq5CuQtoD4+2gf4csjy
         V50Z5dA0syf/7Hyl5Jnf93lIK1SXy8gyUqVN8ucOCQqEqr/v7ajFIEDgG3blc5BHKvpZ
         RsLMzX1v2wn3ERVX67erl2nsnu2RWHUU69TXhnBJecMYumFbjCVQIe8EEaPmbEe+x7Iy
         f1OWmzHAsuMyjFHiKlXY0KUQXcTh5OsVENptEep1b3kRee7hVEVw3iexJZO6bfC2cmcb
         VzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilc0VbonCcRhi9mLGg0w5D3YQpFVaF2AQJc4whr2j6c=;
        b=rsLwjhknftr1lrZRQ/fRcSVRP3buK8te0vsssWZWs59cjp/q433ZczoWPe7hlEywyo
         PoNZ1W+vnoJCg4Ch8sRtKLK3RugCyo7cZm7yyKEk8oYZIN4LyLJZowywvASoqV7jUbZs
         Dx5rLv6HrDzjMBDD7+8OQcn9axeIUvbnU/aRa/Oqg6Z22EUb1cg7fY6BNJg4sABRW5VE
         /x6bErBRMtmi3VBvvbIuHt4ck/aQGU7swhryc9diRpdiXRu6o/bvo4epeys2ef9svser
         nVpvM4mQpYIW485ZjGpVOL/0SlOo1DuqxftNh5ESkLYoyPCcjpj5ObD9wGQYlQtx4kcj
         4q9g==
X-Gm-Message-State: AOAM530Inrl1ClvFwov/qeO82guxKIx8KjlDNLgKTCyzgBZRPlrV13ks
        Mw6MaE+IikikGiOiJNWLrrsYDg==
X-Google-Smtp-Source: ABdhPJyqbr4VcTdRcSr3fwIjiPUCv49n0I43wzga/jVDHpbwMGIuFgzWHkAlhzgnAITpSkHXZw3ohg==
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id v16-20020a1cf710000000b003941960e8a1mr9020862wmh.154.1651952972430;
        Sat, 07 May 2022 12:49:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/11] ARM: dts: qcom: pmx65: add fallback compatible to PMIC GPIO
Date:   Sat,  7 May 2022 21:49:13 +0200
Message-Id: <20220507194913.261121-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bindings require all PMIC GPIO nodes to have two compatibles -
specific followed by SPMI or SSBI fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-pmx65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-pmx65.dtsi b/arch/arm/boot/dts/qcom-pmx65.dtsi
index 5411b833d26e..8701396fe1f2 100644
--- a/arch/arm/boot/dts/qcom-pmx65.dtsi
+++ b/arch/arm/boot/dts/qcom-pmx65.dtsi
@@ -21,7 +21,7 @@ pmx65_temp: temp-alarm@a00 {
 		};
 
 		pmx65_gpios: pinctrl@8800 {
-			compatible = "qcom,pmx65-gpio";
+			compatible = "qcom,pmx65-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.32.0


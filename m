Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F2251E9B6
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 21:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446970AbiEGTxe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 15:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446967AbiEGTx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 15:53:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2691FA4C
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 12:49:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k2so14232530wrd.5
        for <linux-gpio@vger.kernel.org>; Sat, 07 May 2022 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bn1bYo3rfTp+kQjSGjTgdHLhWctyyLpcgYXuKqk6sfA=;
        b=q/mTe6uK1LPgnLjX089F/NJ0ag+m1jxn/pfDMj+85rL33sW+ZPL72lhtWnm5pT22g/
         CMOv4+Y1vySN0BUPrcu0WauYvwgvhIQNXwSz6aPbOMAgrdRoTzj6gKeDK/2DUXBV1NtZ
         TNvMJxP1riEqUweFsg8FP7ISRaTWsdQSu0EkkM3LPtHIjJhy/SxM9AO19qaJpdhNjND+
         RleCG5SEKGUwNxdTgBkMDhj0/A4iHJfpFOD/c56mIzFNyVcBBqG9kwrYsEDixvJQHXue
         r3puYabHsrPZpGn/UWfXyCCEg2jUDN0hR1xfc7h+gZs4tu+9A/6DEkTR/ZHYOuoVCgiJ
         yBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bn1bYo3rfTp+kQjSGjTgdHLhWctyyLpcgYXuKqk6sfA=;
        b=e+MjKtVhX0wNYsZHlVm7T4Eo4gMvphTKgpZJprhO5zGoCoskS3qsebWlubmvzK94/l
         QWGaNlt7m1eS7CWxV3TTkGUZ80jlitZbmqL3yIFSOdKKNeFuI3AWA0/AQCeiidryloJS
         3RbIf9igkdNN2BcQCirlNUjgavO5fz4wiT6oNq4sZIQVqG3/IU7gp+RgnoSg1ZsfQ5n+
         zuss+dBaXogExVr/X7H78vniXOv7D5pNQDrVf8j7tSMecJgJUnFgfjv3rofdtxnhEeZU
         8rtfGZzr98WBDeXXzLhgK4m7vkTjSJxD7rRrJp51G6bMoVlrWqr8a5FvPQJGImthDzj2
         z50g==
X-Gm-Message-State: AOAM530hIQ+IStwuWVJpw/eMm57IciUQlo8jxAPXkLliTa/052YFnnoP
        I2n4VzbZSLlOW+4ryJeNIh647w==
X-Google-Smtp-Source: ABdhPJxMgZlkqSqn1qzb5GweXdY4+YkHB8X32AP4XU2KNu2d3eF0LDpW9fG1ehmZMCnvL/QgN1aNgA==
X-Received: by 2002:adf:db46:0:b0:20a:c903:4711 with SMTP id f6-20020adfdb46000000b0020ac9034711mr7522275wrj.625.1651952971269;
        Sat, 07 May 2022 12:49:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:30 -0700 (PDT)
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
Subject: [PATCH 10/11] ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
Date:   Sat,  7 May 2022 21:49:12 +0200
Message-Id: <20220507194913.261121-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
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

'reg' property is required in SSBI children:
  qcom-mdm9615-wp8548-mangoh-green.dtb: gpio@150: 'reg' is a required property

Fixes: 2c5e596524e7 ("ARM: dts: Add MDM9615 dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 8f0752ce1c7b..0ce0d04bd994 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -321,6 +321,7 @@ rtc@11d {
 
 				pmicgpio: gpio@150 {
 					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
+					reg = <0x150>;
 					interrupt-controller;
 					#interrupt-cells = <2>;
 					gpio-controller;
-- 
2.32.0


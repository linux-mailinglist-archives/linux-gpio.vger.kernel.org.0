Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACEB687AC1
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 11:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbjBBKre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 05:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjBBKrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 05:47:06 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD18573066
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 02:46:41 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id t6-20020a1c7706000000b003dfdaa1d998so667892wmi.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 02:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsl9i9PR9xIBvk9d/QNjecKRQT6bhvU1gZ+MPBAKYIc=;
        b=cNrqwyZ+Ot05xc2GKcyvVpdVcLtxwFvnqM+6WLzyICsLC/QJoRNRuoJBuSDb+yuWxw
         iqzW26Ln4DDtI/8t56ro+95Z7afloi3YacDkqySFETeJ/zN5FyZDyCsAkegHlbQUO4Mz
         CumrdQRTq4V1OPDzbiLrUP0S2ryAwk4kX3VIbPVl8V4eH1v4gQkQuMecSUOxltJUrHWs
         p43YiNdTTxBQi5HsvnDZCykwxYHiAbkS5fxYHsRZJHs33dsNDyp5x+5PAN0jmUEB8tDl
         Jm4HLbVoqte35YbdiTtnYmDoKHE5Mr+k2iBxiIPONvXRWaESM29+CY30e+FtLFXaTiK+
         3m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vsl9i9PR9xIBvk9d/QNjecKRQT6bhvU1gZ+MPBAKYIc=;
        b=7QberB/IfYd342SQkBXvpsQhcjsJ213tl9EOyIgw7HYLEKvPPQwTJHj6lIPjMd8kg5
         8859WcijKl+caPsRQ67UwvcJvhZjxhWc2TIhxn6H3FRFV2cp9n1t3PuH7jL22zC3wYGA
         Mz0/5OQ+hatqH+TX+BguLN5M4HRPkx/71piEfhrIKypJAo0chztWmQJlsIDF7ZeyTq4I
         lnILZ7wPrmKkdmkIjqYcRlHAimJ1N18MpiM6DfO1aEVh953aiNMWxRCEvaOs5jdAR5z3
         4ox5XKREoAjgrCtsZK/oAz724owuUYsnMFPT7lAy0HtKz8GDEfC7gKCokwX3VTKZ+WVI
         MfhQ==
X-Gm-Message-State: AO0yUKVViqofCH64FeVkpmbcbARzb74NXWXHnDLtUmatsrdBatEZKenR
        IjqWin0SZ5aHRAotcY5xpJF2tg==
X-Google-Smtp-Source: AK7set+9D9+qU7CuocALvUhiIpLYQzG3x3yel9az0gJxjOwKrbNnfj+lcyLDXCEJCvIFAWXitJ8nDw==
X-Received: by 2002:a05:600c:3b18:b0:3df:e1d8:cd8f with SMTP id m24-20020a05600c3b1800b003dfe1d8cd8fmr276052wms.6.1675334766670;
        Thu, 02 Feb 2023 02:46:06 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:46:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 09/10] arm64: dts: qcom: msm8953: correct TLMM gpio-ranges
Date:   Thu,  2 Feb 2023 11:44:51 +0100
Message-Id: <20230202104452.299048-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in TLMM pin controller.

Fixes: 9fb08c801923 ("arm64: dts: qcom: Add MSM8953 device tree")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 4e17bc9f8167..610f3e3fc0c2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -399,7 +399,7 @@ tlmm: pinctrl@1000000 {
 			reg = <0x1000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			gpio-ranges = <&tlmm 0 0 155>;
+			gpio-ranges = <&tlmm 0 0 142>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCBB95FE3C6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 23:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiJMVJn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 17:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiJMVJm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 17:09:42 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5EEDC0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 14:09:36 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id df9so2083471qvb.9
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZtwkVcmFeREjbHg2IbPGzv0D1AjraFsKLqfRNwOXEg=;
        b=lbcDaLLV+xm5LcT+W0wx6GXTIgptRh6dkXO+NcZm9QvxjMqPiP39TwEtUDdyKMTNdg
         hVAbQ/50igQ+ib9K7XIQAiQ1V503ZzsMkTxyrr3qQYfm5sw21Ld+nCv9tfXEaWcCZJ92
         MWzvRa6wQZKGmaPLn3kyDAbLNQ5IuAT7peEVk2HnewgxUDQWa7kBMzM+THX/NK5rY0yv
         fiXU2+D0uT2cJgHJicR+sXJb87ygy9/2hYg3hzKofMzDxSlFa3Xlpu2GmIBA/B0vWLfz
         U8Njr+g+fxPdsCCVLJCZoHXULf7OeWGXQ8FOCN2M1Ij4lJIQphydAT8xLdZazqH0OwqA
         NT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZtwkVcmFeREjbHg2IbPGzv0D1AjraFsKLqfRNwOXEg=;
        b=N5jkYpH/e9DhriF9c/juSm0wuFZAMlhNMrB4Qg+zF/kKwQtfbxgXsDI+bCZCqyEWqX
         OVReBgvWpHlZiaJ+DnrfOfkC6cZ5RfXBM014F+roumCUlbq65eHTROt1ewQGEWGaMeuE
         HbYFGvuhdkG3YES/gvQwdrzCzTkv+2aKpuRvrqvdxsvxXwU/dp8GKvALtEchXneNYkQ4
         RldL1v/HDk4l3vY0y2WFiCS6kWut0Mrd/dZUpJ293gB+zE+jXFzzX8RzZXO+BuL5oPdc
         sXgVNkWOFlLuhjplQASZSEfgNthyJXEubgWx5psi4VH3l8szmgiX7Ky+b2ojTGFWBH93
         bFkQ==
X-Gm-Message-State: ACrzQf1+/OvUhjxwZtZDbaZzTf3UxkI8j8gDjaguj0Ul30SLylUWh87h
        QZT7n4H0FAqlKVf59KF5e0O/LUtwHNu/cA==
X-Google-Smtp-Source: AMsMyM6RCSD1qWQGnAsB4pqDhnvQApT/yPvDVpgXn8cnvEzh/BiDwCvG7xnQYonqqGfLSlZojmgEGg==
X-Received: by 2002:a05:6214:d06:b0:4b4:6bdb:27a with SMTP id 6-20020a0562140d0600b004b46bdb027amr1492425qvh.53.1665695375487;
        Thu, 13 Oct 2022 14:09:35 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s1-20020a05620a29c100b006eeb3165554sm753071qkp.19.2022.10.13.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:08:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
Date:   Thu, 13 Oct 2022 17:06:09 -0400
Message-Id: <20221013210612.95994-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Qualcomm pinctrl bindings and drivers expect gpio-ranges property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. None
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f05f16ac5cc1..2c4acf227253 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1056,6 +1056,7 @@ tlmm: pinctrl@3400000 {
 			compatible = "qcom,msm8998-pinctrl";
 			reg = <0x03400000 0xc00000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 150>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986E56C1AAC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 16:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjCTP7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 11:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbjCTP6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 11:58:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB590A5DE
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:25 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i9so10824973wrp.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xRNDjKLu/qtHRgpSQobAlJCFssXXVfJ8ZXiT2IEFPU=;
        b=yJoMzdUsI2UywRktpSCtzJYc2bgWfldiJnS2JSSWUb1T2dV4wFgV1gdX9gpL0aTRg8
         RzKyvwAZDFaGOH90yYTsb/GPwKH5lqt7mc4D50zxAObLJMboMoJXPQKddFImLh03a3pg
         33+2GIqEWJh9II4+XP7H9oXDEZn/cPgVuVh5URyHk5Lz6cht6zwAaE3pW2DQMLzdLqWz
         fTavmhLFdVaorvx4v24epXdqEotbe4wXaysh/t+/s+k+mpFTuxiMHp384ulXbUnzLO/I
         bXTpqr3F8EQhe92sEc/M5vYiFcsU6VsZ5bhGLNRT1ruDCnBUni/18mz4xcJNBCQ8ItLI
         PvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xRNDjKLu/qtHRgpSQobAlJCFssXXVfJ8ZXiT2IEFPU=;
        b=LqWku+dnUVZM3WyJxfYpj9UKSOH3+q8wooDhFpkSus46LeUcE8qkuSoHa684mt2suy
         tAA67Oc3uSseomMNPKU66shPrcBCVTAcF71IIUYFKWmiBr2seNReidcQabCknOUfjggC
         xxTEzlDX7S0JORV30gUJQGfV+/mBtfIFN/eMVbEwUxbZz1ikYr8zFHw9E1dXRUsCjCKV
         fGUYbrGvSh82ZCMGAp6UGRWrB6NbhAONCNh0pfzlIHc0A2rbG9JGhdCKc5d1SeA/DE1U
         HMvvL+/wBSsRzRiJYrIDcy2Lzv3aY/cANfO/7DTmbW+AJw2bCSgFWmFLppp22opYjPAo
         kqyA==
X-Gm-Message-State: AO0yUKUNEwDGV3gaNZO2ZoZMpbh1b8D51Y79gEb6QBNeNt//x6bnaYHw
        mlQgkGdYlH1p8KWFQz05t6KRnQ==
X-Google-Smtp-Source: AK7set+pZutuMENHNrd18kVq8CFM7/djdz09/3nCkCKq4vSnCIiTBENabcnDSJOCCij5Algury1YXQ==
X-Received: by 2002:a05:6000:1a54:b0:2cf:ef5e:eae5 with SMTP id t20-20020a0560001a5400b002cfef5eeae5mr15597951wry.25.1679327343715;
        Mon, 20 Mar 2023 08:49:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:49:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 13/15] dt-bindings: pinctrl: qcom,pmic-gpio: add compatible for pmm8654au-gpio
Date:   Mon, 20 Mar 2023 16:48:39 +0100
Message-Id: <20230320154841.327908-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new compatible for the GPIO controller on the pm8654au PMIC. It
has 12 pins with no holes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index db505fdeac86..512378a2d4fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
           - qcom,pmm8155au-gpio
+          - qcom,pmm8654au-gpio
           - qcom,pmp8074-gpio
           - qcom,pmr735a-gpio
           - qcom,pmr735b-gpio
@@ -439,6 +440,7 @@ $defs:
                  - gpio1-gpio4 for pmk8350
                  - gpio1-gpio6 for pmk8550
                  - gpio1-gpio10 for pmm8155au
+                 - gpio1-gpio12 for pmm8654au
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
                  - gpio1-gpio4 for pmr735a
                  - gpio1-gpio4 for pmr735b
-- 
2.37.2


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03ED71A262
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 17:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbjFAPU7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 11:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234864AbjFAPUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 11:20:52 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250CF1AC
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 08:20:43 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-514953b3aa6so1468532a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685632841; x=1688224841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AIeQ2/lsiYoThkaM/iRVe1rvj796gjOf4pjaRKczNA=;
        b=g+CqcM3a0K8v5hRlgVv/g4iE/8ozOgc/Qc4CwCtEK9OTmTVvmvjm46Th834Bcn6MlZ
         Z59jP/726shOY0dWtxYzDhyM60VuqPhNE53rO9hSSN8rtzq/SFf/Lx1GURXoZ+jlGTXm
         4H9Gtrs+uZ9PFqhJ9xmSInROARJY0kNiQ8bZ6y+2LzhceED8881RMebzUex9/bczyvZB
         Dl/6bmfewEYx26T2rOf3LPwK8c7zt9ZITPuUb0mabgFZI8G8MRBIauzKQ540RjDSf3DD
         +jRn4JBJ6g1bgYcn4Vg4LK0QhkeGIdqckQejyUrkk8R5q/YFszh6zfnILNisxq6XFm+W
         gyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685632841; x=1688224841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AIeQ2/lsiYoThkaM/iRVe1rvj796gjOf4pjaRKczNA=;
        b=e730BSdeHvcN7Pb4Bn8nIRZJSryEO2YN9DJ3xP5ooP0RLOGxDw0AZu1diJq4MtZDRV
         XBbfGU6cdXaZYn8Sz2bG2VC5u5IC3FIkXvPUkQG5iGLnZCN/ObSiF5rHCZ3T/978rYRz
         gvy4F0cKxI/W1Ek/SVyZsx/xYTK1gOyWoglKyLoBsQioNip74oLg87cYdOS8KTxzkoSh
         +oolzd6Y5zhPzbPZnA9urLkRtJu9ItXuOpSXeouGAgdmFWpa+i+APcfRFOhUGFRqrprl
         ckijSHRssWhE4g7mtDggBfbRDun98sd8ZPVoNum9h2HMXhNOe0qTR0qQTorm0Im8eUka
         N0ng==
X-Gm-Message-State: AC+VfDz/lOZTyXu5z0DI0LvcxmWyiw3iRPlQ41l5YuMa3v2kjNykzg/t
        yQhGUle+qdPRbsIZPmClzRI4Xg==
X-Google-Smtp-Source: ACHHUZ5zsjAbDpaa6ldRS82porWOJNaWql4VObFNDnr36plQKpGtwIlFlEv6O3kOxAK0dVKl2a3Fvg==
X-Received: by 2002:a05:6402:618:b0:514:667f:5ac4 with SMTP id n24-20020a056402061800b00514667f5ac4mr206200edv.10.1685632841204;
        Thu, 01 Jun 2023 08:20:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402160e00b0051422f31b1bsm7298664edv.63.2023.06.01.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:20:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] pinctrl: qcom: fix indentation in Kconfig
Date:   Thu,  1 Jun 2023 17:20:20 +0200
Message-Id: <20230601152026.1182648-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
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

Use tab for correct Kconfig indentation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 28b19458b20d..9f957d16cd68 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -245,7 +245,7 @@ config PINCTRL_QCOM_SPMI_PMIC
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-  select GPIOLIB
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -260,7 +260,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-  select GPIOLIB
+	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
-- 
2.34.1


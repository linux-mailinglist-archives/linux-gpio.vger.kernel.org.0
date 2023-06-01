Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA5471A26E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 17:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbjFAPVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 11:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbjFAPVb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 11:21:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F69E67
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 08:21:10 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso1531486a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685632869; x=1688224869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8nlnubYNvCAitFaTU3QcGudPdM58mPtxVVVjolot6o=;
        b=ZBlWEL/ihwO0cFS/n2toyk7ftzADUjob1wvn3YHoGaKAAJ09OTOPQNtqpI9c3dMpq6
         jn79y3OCgfqnETxRkcFOQ7opzpV3ygDgg6ZJGEwnfJNfZk/lVV8YEWvpYAcVpjCEJC8b
         J64gQNgmoX/RYlpAMh7xkYxpTRM/xYpbrHQzF0BOdqTYm6xOyQTGears331hMKY1eLWc
         vuUZjuwsZmE9xICsVK4SdtRYdqSHNMqpKzz+Gg2wbLn8JXnLmJ1w4EXXVevZjjp6F7sO
         xjF3htV7Sg0KWqhh8itD70MxaZ4+RBahFoIOwgMhnIhGPkFT0+kUsJCDRCKBdPua8cgk
         cWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685632869; x=1688224869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8nlnubYNvCAitFaTU3QcGudPdM58mPtxVVVjolot6o=;
        b=LQXHhgEFgEDwWeKYjHhMTxces8FZfn/m60ccMiH/RoYFY8qUyi+lzXZ7/F2CbcS7zG
         D3DuUv80FMc6cZDRkoNuems7QNEW/bPiOh4NEcCGwX7+EIDl/Af+jUDIVXa+7F+TM8Zu
         QcN5AmvRUD/KxHVi5neq6ucoygrMMAycxqwTn/bB7qDsH2UT1sdpSqD4XqgKGM47g377
         EbegFvYpt+tpy1Gmb+DnKmUDh3FJ4y4KJzoHq6PgOaqjRZUSRfUsq2rv7oA9o93LtZGi
         myVqcquHXnsFoR7+ODjbU2J9HlRfTiVZ7bcks9YexbnSuZbuwpwEkQJkTJ+Nvs3vyUYd
         wgSA==
X-Gm-Message-State: AC+VfDyqmsCqzm7Anb1TjdXp9DgSTY9qhkhFaKGYUQTa6rLuXC/ICsko
        kUi9l04s7PoBfgddg2HWKnILCQ==
X-Google-Smtp-Source: ACHHUZ7HdSjfTb+UKgw2wxq5n+2gX9erM3Q8mxltpuSD7QNKz0z27jxUUUSTVhhvj/z2bq8NvrAwiA==
X-Received: by 2002:aa7:d389:0:b0:509:f221:cee2 with SMTP id x9-20020aa7d389000000b00509f221cee2mr122915edq.32.1685632869070;
        Thu, 01 Jun 2023 08:21:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402160e00b0051422f31b1bsm7298664edv.63.2023.06.01.08.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:21:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] pinctrl: qcom: organize audio drivers in menuconfig
Date:   Thu,  1 Jun 2023 17:20:26 +0200
Message-Id: <20230601152026.1182648-8-krzysztof.kozlowski@linaro.org>
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

The audio pin controller drivers depend on PINCTRL_LPASS_LPI, but since
PINCTRL_LPASS_LPI is not the first entry, they are not displayed in
menuconfig as dependent of PINCTRL_LPASS_LPI.  Re-order the entries to
fix this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index f1c23a641fe1..634c75336983 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -47,6 +47,18 @@ config PINCTRL_QCOM_SSBI_PMIC
 	 which are using SSBI for communication with SoC. Example PMIC's
 	 devices are pm8058 and pm8921.
 
+config PINCTRL_LPASS_LPI
+	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	depends on GPIOLIB
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
+
 config PINCTRL_SC7280_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
@@ -93,16 +105,4 @@ config PINCTRL_SM8550_LPASS_LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM8550
 	  platform.
 
-config PINCTRL_LPASS_LPI
-	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
-	select PINMUX
-	select PINCONF
-	select GENERIC_PINCONF
-	select GENERIC_PINCTRL_GROUPS
-	depends on GPIOLIB
-	help
-	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
-	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
-
 endif
-- 
2.34.1


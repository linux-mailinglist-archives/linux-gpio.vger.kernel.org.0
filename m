Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651F671A261
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 17:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjFAPU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 11:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbjFAPUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 11:20:55 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D6D195
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 08:20:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso1524196a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685632845; x=1688224845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgPUH5cGYMmY60HUrNnRGii8eMkgEIeR+r8LwzEV9Ok=;
        b=jPMO3u83esEkjTlWOHylRifeBIHzaO925sRq3IMFKe6eeTKQTUsWY0J4EsCFsUwEPT
         zSANlFThuTa3M231CUKoucLuX7/juWgk2Zy3WAtWrg7UusT9ZlgyjTBdIq+iqiWaOZvj
         VuwBrC/P5fFcX+ju0MJaSfdje0eSUCTfGg4pBE9cQAFDZPUPeT9/T+GaTc1wfuEwgTgl
         dmRB8h1qss6YNOM3z7NWiL6LUQmJjp9d6VPxZQlP9BLCR2Qt2amSH4CRWMjJYqthx7WX
         wtsAXvFo2gX7E/yHurLOMlVLmCagpPzLW7z0IZTckX0XJwHRP6fmTkd9T1oIZ9yfUYXl
         Iq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685632845; x=1688224845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgPUH5cGYMmY60HUrNnRGii8eMkgEIeR+r8LwzEV9Ok=;
        b=gA+Bkmkc3xp+O+31jw03NogZtX2Ce7PsA9fYxX5kWvRoy2jQRumAwHtKEIdyoRaT3D
         yKEO9b5Jma+yvX97ewlo5xvYupJKE/+60f7nlXwprDr4tIhec9o2ULUr+3BHeU/FYG6J
         IxVTM8Dsw57PGMhKNjPpA1Isybg97l/Ge0YFlMyULtjGkUZz6v3BJAMO/7OZST7iCQwM
         BRHDyeyUrmorU1UHkivi+FFG1IIiihOie2mujvF/dPqhwXOk0ZOcC73fN0A/ShRyOoQo
         qBBRfw9+b+tpHUE1JOwD77/pYhp3+RTJ/NksBOEL1oGlmFgZLSYHE9VCNNgjiGtXpLBt
         HQdg==
X-Gm-Message-State: AC+VfDymbzg0LQBhNjj/ktXRL+Jgdv0bGBtra03SFmH8lLNyVjXcqD6t
        RhawuyNzG50FO4VoIMWryfuuw6Joc1qBEtCQcG4=
X-Google-Smtp-Source: ACHHUZ4iyt/dNb+CrOekWhkmdPQauaBY3EFZUq4MI8C4nPUd1Gr70BXsiOlPBEb2E/r8YXqOc5YWng==
X-Received: by 2002:aa7:d405:0:b0:514:ad09:44df with SMTP id z5-20020aa7d405000000b00514ad0944dfmr151558edq.28.1685632845232;
        Thu, 01 Jun 2023 08:20:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402160e00b0051422f31b1bsm7298664edv.63.2023.06.01.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:20:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] pinctrl: qcom: correct language typo (Technologies)
Date:   Thu,  1 Jun 2023 17:20:21 +0200
Message-Id: <20230601152026.1182648-3-krzysztof.kozlowski@linaro.org>
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

Correct typo: Tehcnologies->Technologies.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 9f957d16cd68..b03a62ecdc07 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -270,7 +270,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 	 devices are pm8058 and pm8921.
 
 config PINCTRL_QDU1000
-	tristate "Qualcomm Tehcnologies Inc QDU1000/QRU1000 pin controller driver"
+	tristate "Qualcomm Technologies Inc QDU1000/QRU1000 pin controller driver"
 	depends on GPIOLIB && OF
 	depends on ARM64 || COMPILE_TEST
 	depends on PINCTRL_MSM
-- 
2.34.1


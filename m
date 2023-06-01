Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3C171A25E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 17:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbjFAPU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 11:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbjFAPUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 11:20:45 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9703E19D
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 08:20:37 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5149c51fd5bso1477487a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685632836; x=1688224836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkgUgrpwwxa79E2joMX5PCkdnw3FEmz5/0UeRIQYLVE=;
        b=P633ue8sHaY7BHRgYVc7juuqy0oe9r2WhMKEdB11z0z/6xOjNJVCssxN2oaSiP87hf
         Z7246lLMyd9l8YiHhf8ErlrYNk89w7EJD1EWW3VOFIRe14v7tLvVyG8kTGza8NuM+g3J
         DJ1PiTLiiIO9pxNyr7e8MWZCR9KkZaCdacfZw6MkiXWkLsNOfyA0jhrFDi2ZacNT2O3e
         CWU1jOuWiihcCJOdMnqh7eCCpLNPVjGO/+UKQ7XbcNvXOW9XpfJBs9P/Q5+lrbMgK2ZT
         SqdYOiXRISXxvSyDQUNstJCQ+9cKt8j+86sdWA2OHF690cFGubfFTYHH4SZuk54li6fd
         CT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685632836; x=1688224836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkgUgrpwwxa79E2joMX5PCkdnw3FEmz5/0UeRIQYLVE=;
        b=K7NJapixtO2uDHwcJOV2mx0qfQn41SsXhcUp3dIqJ4GHVk+JZHlvIT3XLb2WNT53hx
         GTHh9dCkBlZjrSKhZHYYyqgKBGG8fNGO506aytnrN9fsbZdSMMBVPR5IFtWA4TlY6UjH
         sHGEj1ozxaKNWWE5UDBMDrrqseReGcgtmLl4sUKr7N1lujAHI83hbixlcVDfjAKMtdRh
         peqotu7fIy/ZUgVqQBrtenB0bDrPwIJfuAtELOMHdfjeCN08C/cXbP0JD3AiuBBULGRT
         OyxHTedBIXivVWc1+DRBB808cWsOFFyud0x5Fw1Amhxx2O+lJeykHTGMxKOONy4B5md7
         dQSw==
X-Gm-Message-State: AC+VfDwOykqWLOZ5ShMhI0N+SNbYkDihRpk5Y0ZVH6rjCjky4TAdOWnI
        zzPRELrL5BqB6P0+uAQjjC+hLg==
X-Google-Smtp-Source: ACHHUZ7+sNgPkjN3e1dqjJA7PlmTAc8/cPlgCrX0tpo4wDYy5GnPEr/Uiaj7gRM7574oJNLRCQMNqw==
X-Received: by 2002:a05:6402:6d4:b0:514:9528:6e6f with SMTP id n20-20020a05640206d400b0051495286e6fmr192608edy.7.1685632835839;
        Thu, 01 Jun 2023 08:20:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402160e00b0051422f31b1bsm7298664edv.63.2023.06.01.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:20:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] pinctrl: qcom: qdf2xxx: drop ACPI_PTR
Date:   Thu,  1 Jun 2023 17:20:19 +0200
Message-Id: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Driver can bind only via ACPI matching and acpi_device_id is there
unconditionally, so drop useless ACPI_PTR() macro.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
index b0f1b3dc6831..b5808fcfb13c 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
@@ -142,7 +142,7 @@ MODULE_DEVICE_TABLE(acpi, qdf2xxx_acpi_ids);
 static struct platform_driver qdf2xxx_pinctrl_driver = {
 	.driver = {
 		.name = "qdf2xxx-pinctrl",
-		.acpi_match_table = ACPI_PTR(qdf2xxx_acpi_ids),
+		.acpi_match_table = qdf2xxx_acpi_ids,
 	},
 	.probe = qdf2xxx_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.34.1


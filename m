Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588503DBEFA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 21:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhG3T3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 15:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhG3T3O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 15:29:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEFDC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 12:29:07 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id n2so14617652eda.10
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+G1KU9O9GZ1sNF9QX6iHGTi6E8dVhlKip5BdOYRKkM=;
        b=SZTMUlE/RFHZQmOOfMjDlpQNSDIaO75ajntg+b7rHW5Lcmmw2KZWxTvdX5fxB+iN/X
         p8djIXAgUU41f0ALAHQNOgtlsLhQ4HE2lwkDOFI/Mfmd/8nzmptjZTdX1Cbany2yrbXz
         K/NNnn++SQI6E4IlxytLNOZLvBFO6qfjcaM9oalWseoSXV1UoIU+YHx+Fp8KPHWq/i/i
         /tk2pm3d9U8IlIVmFLhS9wAKC5aTBTN6nnavOfX9ojW/C2FapqeOhPGWDZ4t73o5VWb0
         lBed1vLDF8+de5GGl/v9jiJG0JKKKe8oio6hF2E7VpbXwD15Cxlt17JfwFIN5DrKJqSP
         OT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+G1KU9O9GZ1sNF9QX6iHGTi6E8dVhlKip5BdOYRKkM=;
        b=H5SSr3dfwRYwQkWVOuibP7dz5C/BjSw8XaICddg4u0abgCzSMR6xVMbYagx6KsXS//
         Wfs2lGuib5k2RiV+mRrDzgYO+p+KbWV2UtWD8HybazlvKXn5N+p2ZiNxZfwivEHmOjcA
         pXJlgBMmeXLdxCk9bjqrzrMQKV/vblnJHV3QXEqOwurlqM2vmkdLYs/JhVuHlqrm1D8P
         WKkJPs2nniC3V0WiP7ayrYDdjCSJ2eFygo1wWV5vYVTgv1hA6laBwlUG0yyhJ6rolMuV
         YN3c9ta/l5dViGF9rYGsGzl05xTi9IiiHjDavpl1diznsC8dkr2KJfviVt4AY0yF9+5g
         EzpQ==
X-Gm-Message-State: AOAM533gIydWr7TqOetYPJeO0CYCMepaGDLXggRPcMR1Zt0XfKfwsnwe
        F9D/6doupFwIvjkDRgOfaUs25w==
X-Google-Smtp-Source: ABdhPJw4Il7BYgUJiZsVLELxwk4WFGIASGrtKGnek5eVocA4B7txBJ3euxIyDEjgJB5N3cqxmmhPRQ==
X-Received: by 2002:a05:6402:1b11:: with SMTP id by17mr4981656edb.110.1627673346495;
        Fri, 30 Jul 2021 12:29:06 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bs13sm875938ejb.98.2021.07.30.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 12:29:06 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: Fix pinctrl bank pin count
Date:   Fri, 30 Jul 2021 22:29:05 +0300
Message-Id: <20210730192905.7173-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jaehyoung Choi <jkkkkk.choi@samsung.com>

Commit 1abd18d1a51a ("pinctrl: samsung: Register pinctrl before GPIO")
changes the order of GPIO and pinctrl registration: now pinctrl is
registered before GPIO. That means gpio_chip->ngpio is not set when
samsung_pinctrl_register() called, and one cannot rely on that value
anymore. Use `pin_bank->nr_pins' instead of `pin_bank->gpio_chip.ngpio'
to fix mentioned inconsistency.

Fixes: 1abd18d1a51a ("pinctrl: samsung: Register pinctrl before GPIO")
Signed-off-by: Jaehyoung Choi <jkkkkk.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
NOTE: Re-sending this fix separately, to exclude it from
"Add minimal support for Exynos850 SoC" series

 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 376876bd6605..2975b4369f32 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -918,7 +918,7 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		pin_bank->grange.pin_base = drvdata->pin_base
 						+ pin_bank->pin_base;
 		pin_bank->grange.base = pin_bank->grange.pin_base;
-		pin_bank->grange.npins = pin_bank->gpio_chip.ngpio;
+		pin_bank->grange.npins = pin_bank->nr_pins;
 		pin_bank->grange.gc = &pin_bank->gpio_chip;
 		pinctrl_add_gpio_range(drvdata->pctl_dev, &pin_bank->grange);
 	}
-- 
2.30.2


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A363816B3
	for <lists+linux-gpio@lfdr.de>; Sat, 15 May 2021 09:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhEOIAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 May 2021 04:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbhEOIAh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 May 2021 04:00:37 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0079C061756
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:59:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id di13so1100528edb.2
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8BjOD14/zfrRT9J2IBjHxA1EstqGY6nrbX9XG/Uqgw=;
        b=Q/ehuhlO06rEtD0RVIMgwXJe67yhu6Fz46cpD/Ye6XiyQnAV6R+srVKCqlVhfPM3jP
         45xUAQnK0YJGk/25MIGqW4qNEmAUIkgK/v6dGejdo2lCiaCfxUUD1dRFi4LgFBmadDwv
         G4vYwJDu8opTGhesnOItmD82eRQTy8CKQq6/gDHr7qgV/45DlR4kl07n/gcLGyyoQgE/
         d9NlkuBtPJHDnzxal8JtfQJ+drCK/MdFQeZtWh3s6bDSccfu/x9YZW9Te3myFn/TZu12
         RihZo7CpZnDgtFF8l0bwz8ohCkMqS8f59cxOfgGe3LJp90WYtcKf83GuF6woGTYm9WhJ
         p6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8BjOD14/zfrRT9J2IBjHxA1EstqGY6nrbX9XG/Uqgw=;
        b=UDzHJFJmtY8H00MxYdUyxaI2dJXSZXfrM0bPiwnYofSTw9aAAbOsnQKAge966fJWKd
         ruhfvgkG4QgkMsOwtk9QpreWkhDZdSiBLoy9ZknNtA7m2308HwwrMlOEM5Omf0Jszvji
         UyiEitq3J7QnzVzulBMGs0xUZcUlrSpfbK6g9kxsnx2+eI+DO2VKz0SIatu9e4zyKGck
         wF5WCINjN4LtJjaqpurr8Gr8s/9cSS0irfsbnepGbLQbKBbPDSvkmVP/tN+LSl4G2JoW
         DnvPfE3qYGX6+tlq009FG/ps7t9T/Ck0enlF5b8sJ9ZFqFXY+U7HBMo0VXSIDxlzR5rV
         +/2A==
X-Gm-Message-State: AOAM532pQjByzJ6tQ4B3pHhQGlmOjqvv8HIa5baXajWlXi5ECH41wn9W
        Na1TfjAJdgbYcFdZ9yDdG6eWojbTMn8/VNsiLYI=
X-Google-Smtp-Source: ABdhPJzEMypq/3EyajT0dRbWrPY8bLNymglDBOtSpgmLaFZdgFURQuip3b5LhNIDHb7dwKy0Mj8qDg==
X-Received: by 2002:a05:6402:204b:: with SMTP id bc11mr60780971edb.40.1621065563457;
        Sat, 15 May 2021 00:59:23 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id ch30sm6185520edb.92.2021.05.15.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 00:59:23 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 1/2] gpio: gpio-tegra186: remove empty remove hook
Date:   Sat, 15 May 2021 10:59:04 +0300
Message-Id: <20210515075905.12150-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The tegra186_gpio_remove hook simply does a return 0.
Not defining it yields pretty much the same result.
So, this can be removed.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-tegra186.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bd9e44df718..10d3597e9ac2 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -750,11 +750,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra186_gpio_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 #define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
 	[TEGRA186_MAIN_GPIO_PORT_##_name] = {			\
 		.name = #_name,					\
@@ -924,7 +919,6 @@ static struct platform_driver tegra186_gpio_driver = {
 		.of_match_table = tegra186_gpio_of_match,
 	},
 	.probe = tegra186_gpio_probe,
-	.remove = tegra186_gpio_remove,
 };
 module_platform_driver(tegra186_gpio_driver);
 
-- 
2.31.1


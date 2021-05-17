Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85A382B2C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 13:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236750AbhEQLhX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 07:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236774AbhEQLhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 07:37:22 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991F8C061573
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:36:05 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id v5so6439512edc.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tviugaqYYD/qDQshMzP6z0fQJQ4qs4SDge/5xfu2sQ=;
        b=R7NOoJLMh5XqQ268Ix/yo1dMCK2Y0qS7nGzpVCyEJsNPth7tB7RQFruRAMJf3MWj/J
         gOS8C0KxgQ5OjGnJ/SglX69VNSZ7w/1a1mB9nFFcumO1NTaSWasgIULHiJD/pTsmLQ1x
         MgxszqcgkpgBLvxS/U2etggFjerrD0ahIY4pCzZu2uQYAvpM8G2lH6HAqKn0qhU2Bk5R
         EU0MeC/W65+5SNsSJds6Wq5w9QKvKrXddvpE+er+wj3VLcvJ/ohzAwCIuC0DyDWRjOeV
         hJmavNkaDTfugMYAlPEzYgSMg4Wd8the5xj1gEuZybe5fh6A8O1dDsol2FSV8BFmwxtY
         FOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tviugaqYYD/qDQshMzP6z0fQJQ4qs4SDge/5xfu2sQ=;
        b=CEulajWpuZkM6UaHErOFjyZHoRso0yEzDWnkZyvHUVOn/Vln1oWZucbuhTSqNuXc98
         ucu8IjZXihrLkPmmUss6OQxGl16JsG6wJqmxkZK61M6hM2+uNAlzlDH9nun59l6m8lBe
         lYoexZVeEHU11IVnw2jUy3/KOgXUeBHlvCCIR4bUL74J1ZTJ7J0Yg8JZCKK5RY7toML+
         CC7iYwLXBK7v6Z5tRWdiyX20AMsPijM4skK/Z2JeS/WBDIElLxchwiEKL3yFmCcO3kOK
         M5kWU0N1mIRpS180eBfVZtr4I9hPW7UjiQqohJlQKGXm1TaVJmUo+XpP6JJaf5RdjZO9
         A2pA==
X-Gm-Message-State: AOAM530jthGA3l07qieUp95nLa2BnDIeZlRFvhLYrXlK7z9BcFNHgf3I
        2gVtqOAQC6kS/x9fKEfjoaQ79MtvG6jRf7CCqT8=
X-Google-Smtp-Source: ABdhPJyZDR9blfB9nMtRodGlEHRNYwmozwuZ2lvgcm/HDmsOSOFFvHmSksisSzixW8x6xIM0t/qsPQ==
X-Received: by 2002:aa7:d491:: with SMTP id b17mr24989029edr.376.1621251364085;
        Mon, 17 May 2021 04:36:04 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id v24sm2903703eds.19.2021.05.17.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 04:36:03 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-wm831x: remove platform_set_drvdata() + cleanup probe
Date:   Mon, 17 May 2021 14:35:38 +0300
Message-Id: <20210517113540.237495-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

If this is removed, we can also just do a direct return on
devm_gpiochip_add_data(). We don't need to print that this call failed as
there are other ways to log/see this during probe.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-wm831x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index a3a32a77041f..9cf1e5ebb352 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -261,7 +261,6 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	struct wm831x *wm831x = dev_get_drvdata(pdev->dev.parent);
 	struct wm831x_pdata *pdata = &wm831x->pdata;
 	struct wm831x_gpio *wm831x_gpio;
-	int ret;
 
 	wm831x_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm831x_gpio),
 				   GFP_KERNEL);
@@ -280,16 +279,7 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	wm831x_gpio->gpio_chip.of_node = wm831x->dev->of_node;
 #endif
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip,
-				     wm831x_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, wm831x_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip, wm831x_gpio);
 }
 
 static struct platform_driver wm831x_gpio_driver = {
-- 
2.31.1


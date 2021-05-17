Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98020382B2F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 13:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbhEQLh0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 07:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236828AbhEQLhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 07:37:25 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B82C061760
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:36:07 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lz27so8660534ejb.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B3U4sFVt7KjRPqeulougyIA4myDGMkTfpXl0wugLAP8=;
        b=vGuA9zYVOz5i6yfV/p5x6UO8dLJWh4heuAb1VjYaYcaBGPYw1uED4k2J6HY9qzg2nA
         T1cxTEQhMJr+5lDtyWpYn+k7CZpMLMdjnmKUylnjNcUUMfJvkddE6QsnNnT5r4KkD7nw
         yjUdLgXSmO+4hyYNZG3bIO8OYb+1+e3pWar51voyxBlMRQ5963L+o+aS0otfGEDIqCia
         aCIknv7SY+2zMkVl5k3l+uHLLtRsULEo6LitmcGZEvYA6asDqw2oGCDpkTo/6bV2rOMx
         bmMiWHcEZkGlVCkcEyVmT9Q9j6dJCsuWzXVGdczcuDjtiT87M8HZgCeG2p7FbuGkGbM+
         mZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3U4sFVt7KjRPqeulougyIA4myDGMkTfpXl0wugLAP8=;
        b=r1HggqOTcf1M5BNA0UA9kMZwjiub10NZLAoe4vIzMatJTlftIDjTyn7LcFNYzcxfSy
         TJb1wv5HrhfF4vutBO0wdk7YWBsWOqgSlaL07F3dnikwU9/EWTsFbYx2zOBX/851zHNP
         pFgM/ioTnJA4BSLshQkr7pMTzXtWp3V7rmqTATLibXZg+JB870nhkLU4j0gcs/6zwRKX
         hDNbh7SdQMfwp6nPcIt/p0gFWDAsTpI86Z9s2f2P4Puzx0GZN5Oji+SXEFK85O97zTd9
         RSXAW6v0/UuDshuGEmmXSUOmag3o8IgyEU8yk0ZrKJEetJBq/W43lDFnGRZBhxhifAZY
         mcSw==
X-Gm-Message-State: AOAM5334Lw9vFp+GUnSby1bSuBNnW9fO4uPi+MqP0/UhY2VVbgRcsi9k
        hcF7qrelCaidFD5VLt4q4z1Ijs/UYeV8N0X0zHw=
X-Google-Smtp-Source: ABdhPJxfbICzaIghksBO0l9YVZgy9DbYgwPQ43Kd4QE3T2c8/Jf29r/4PJgbARe6s1SYQ643JHhweA==
X-Received: by 2002:a17:907:9008:: with SMTP id ay8mr21043176ejc.474.1621251365894;
        Mon, 17 May 2021 04:36:05 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id v24sm2903703eds.19.2021.05.17.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 04:36:05 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-wm8994: remove platform_set_drvdata() + cleanup probe
Date:   Mon, 17 May 2021 14:35:40 +0300
Message-Id: <20210517113540.237495-3-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517113540.237495-1-aardelean@deviqon.com>
References: <20210517113540.237495-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-wm8994.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 9af89cf7f6bc..f4a474cef32d 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -263,7 +263,6 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
 	struct wm8994 *wm8994 = dev_get_drvdata(pdev->dev.parent);
 	struct wm8994_pdata *pdata = dev_get_platdata(wm8994->dev);
 	struct wm8994_gpio *wm8994_gpio;
-	int ret;
 
 	wm8994_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm8994_gpio),
 				   GFP_KERNEL);
@@ -279,17 +278,7 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
 	else
 		wm8994_gpio->gpio_chip.base = -1;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &wm8994_gpio->gpio_chip,
-				     wm8994_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
-			ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, wm8994_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &wm8994_gpio->gpio_chip, wm8994_gpio);
 }
 
 static struct platform_driver wm8994_gpio_driver = {
-- 
2.31.1


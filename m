Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637633805A9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 10:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbhENI6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 04:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhENI6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 04:58:04 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C5DC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 01:56:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id v5so22803501edc.8
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xfLV1nYUVE1ZnJSakkYj6xvjl6r5j5i0hj4qr/7M2gA=;
        b=GubL38k3QmfEjpfnVILU1RGDevNxkNmMmsZwDSPavE62Kvk+fNH1QynWxnjBfTDvkr
         70Gbk3NLAMwUWePH88slhpqmE248hN++kRC61Bw8cS1r7y5Qdk2/mKLMfvoWTXzkjlsG
         x2OgsKvwqvODq48M0EydCP6onvJydW0xZxfUTfDpleMXbVkO/qXWC7y0Ql2tuYQ17QfT
         R0pg+I4dWf/7ES/WAGcGXF6yhhgmLxK6gKNOeucW5q3B6b+Ehx9zTAq0A5IsWpoxZH9R
         AqnKIp3mYQq4dZxYECu0PNzd1XDzFsuGvjyWY/3i8jw1PLUbjbMqDzKjkPsWyszFK0Ph
         J43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xfLV1nYUVE1ZnJSakkYj6xvjl6r5j5i0hj4qr/7M2gA=;
        b=OYW59s4mjA581eUgyegjGrv8tZFN9hHtBmfjPxUqsOWy0Pr8XipfB0WU6U7mH20c4n
         XgPgTydQPFVxKCmEW7CxHw0bqsVbJQchw3CzF+f/m9pvO3NH9onEUQdB43bEPxw6M5CV
         uFL4u1USCR9i1xHIPXFAnSoWLimZzImDBTHC5nOa4FopH6HEyww3Klz49dwV19a5S5+w
         8IQLxbDyQ1srfL21Sl+Q98qcQTrl6NpFeWFC9Q4A21OgA9COYBq5fqHDW0XS+BZ5AiOU
         ddqY4c0Jv602WxYhBOqQ9pvvY50n/ZTT/uICT+CR5RCJ8G9/Lz9hqttj781BKuB/9u00
         KmNQ==
X-Gm-Message-State: AOAM530AJuqP1dquPYkzzJRsy92IPSsvzCd5K3ITY+6prCz23iEO7cMq
        gVD5EWx9Hdn9af/v3Zu5QgL7OFvqQzJk9FRtP1s=
X-Google-Smtp-Source: ABdhPJzftkaGj2fWO2un3BLJdYuKBtXvDZJSBsWQLiNy9hI8XPgpgg2ibYxTQ78dtqUZTrFV1BzxFA==
X-Received: by 2002:a05:6402:438d:: with SMTP id o13mr35433389edc.324.1620982612284;
        Fri, 14 May 2021 01:56:52 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id a24sm4102908edr.74.2021.05.14.01.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 01:56:51 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michael.hennerich@analog.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-adp5520: cleanup probe error path + remove platform_set_drvdata()
Date:   Fri, 14 May 2021 11:56:27 +0300
Message-Id: <20210514085627.11230-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

This also means that the 'err' label can be removed and all goto statements
replaced with direct returns (with error codes).

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-adp5520.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index 0386ede53f3a..c55e821c63b6 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -113,10 +113,8 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 		if (pdata->gpio_en_mask & (1 << i))
 			dev->lut[gpios++] = 1 << i;
 
-	if (gpios < 1) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (gpios < 1)
+		return -EINVAL;
 
 	gc = &dev->gpio_chip;
 	gc->direction_input  = adp5520_gpio_direction_input;
@@ -148,18 +146,10 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(&pdev->dev, "failed to write\n");
-		goto err;
+		return ret;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &dev->gpio_chip, dev);
-	if (ret)
-		goto err;
-
-	platform_set_drvdata(pdev, dev);
-	return 0;
-
-err:
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &dev->gpio_chip, dev);
 }
 
 static struct platform_driver adp5520_gpio_driver = {
-- 
2.31.1


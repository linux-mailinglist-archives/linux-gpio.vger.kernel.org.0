Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DA03F6FFA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Aug 2021 09:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239198AbhHYHDK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Aug 2021 03:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239123AbhHYHCu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Aug 2021 03:02:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14EBC061757
        for <linux-gpio@vger.kernel.org>; Wed, 25 Aug 2021 00:02:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ia27so27258546ejc.10
        for <linux-gpio@vger.kernel.org>; Wed, 25 Aug 2021 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ejMs/5dhUynEVzAUaCGRN6F3/ti7cOnDiR6ZoSB0tPA=;
        b=c6O3dXO8+ghpyR+PV4yUq7w3PTw2Fcv8Vj3CAjBPWFm1MseFK0FGPNEAVTn1TMBHpf
         EpDM301+y1CLdQzjhUJpbpSOzfpc2PPgd//dLeGG9xxxJfLBobunVwZrjo5SJjy0Oaf3
         Z+bmvXnhDnBqtUTzLko+DVHYth9nmYf4U//4D7ZnOa/hm0QSuyOkdyLQ2+Cq8vYUNLY6
         qjUyb0WCenrIuDS0QTkT5T2yE7hAsknBz1Sbi9dE61qbqRnTaE9UjXe9DJZeCdw6YMXm
         422oCbOPAcESpoaGo8qbqrWy3DjTz570+d1MYaVNEj0hpbf2nkFyQdE264D8aFemHH/v
         kwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ejMs/5dhUynEVzAUaCGRN6F3/ti7cOnDiR6ZoSB0tPA=;
        b=c77kzYHBdlxXgVtPn/qRFZH0JyXLhVKh8WiQO0YgpRJLQ8Ud+4YHwtzCrWEPRdE6Le
         HR0ScsP1ErlWjsIhxltRZpNhtvjki1MFY42IWIifrczcklZioYIxqDYah97d1Cgl9vi6
         AeBeiUwAzcV0msCMHnZJPkz6ihoV4hA5vIbEM5PY4bLIcKiLAQYpvJFl02hW98FWn8SZ
         iGYeWhwtRnvW5JNR0AVlgWUUc2p3zwGaW7DBJk50KOsG1e8PH5+fYtYajq5/ZBUrjDjX
         kuckhweFnwIjcEyiD5pIV+3In7P+7vAxC6MgOxu5gqqicWl6ZwKsOD/cN8IMleDztZfT
         aU1g==
X-Gm-Message-State: AOAM530RzzbnWet8I/WF5BVzXufSpmI3U1nSCyjUwMMmzIr8Gfca3J/m
        dU2FYN6FE7jMU0s7qRuV8eAc5Lp+CxviH1X5
X-Google-Smtp-Source: ABdhPJwzLOe3KIOxj0DYLa9cbtZTe9lqRd7Rux32hJcSUztznRZBHnJ7R6x/KxM9NtFQR1PSrCH7dw==
X-Received: by 2002:a17:906:354a:: with SMTP id s10mr4807156eja.357.1629874923308;
        Wed, 25 Aug 2021 00:02:03 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id w13sm13755183ede.24.2021.08.25.00.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 00:02:02 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH v2] gpio: viperboard: remove platform_set_drvdata() call in probe
Date:   Wed, 25 Aug 2021 10:01:25 +0300
Message-Id: <20210825070125.32918-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707135144.191567-1-aardelean@deviqon.com>
References: <20210707135144.191567-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

This change removes it.
Also removing with this change is some logging about the failure to init
the gpio chip data. There are other logging methods to view that this
failed.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---

Changelog v1 -> v2:
* remove dev_err() prints
* [styling] added empty line before first devm_gpiochip_add_data()

 drivers/gpio/gpio-viperboard.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index c301c1d56dd2..e55d28a8a66f 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -404,11 +404,10 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpioa.get = vprbrd_gpioa_get;
 	vb_gpio->gpioa.direction_input = vprbrd_gpioa_direction_input;
 	vb_gpio->gpioa.direction_output = vprbrd_gpioa_direction_output;
+
 	ret = devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpioa, vb_gpio);
-	if (ret < 0) {
-		dev_err(vb_gpio->gpioa.parent, "could not add gpio a");
+	if (ret < 0)
 		return ret;
-	}
 
 	/* registering gpio b */
 	vb_gpio->gpiob.label = "viperboard gpio b";
@@ -421,15 +420,8 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpiob.get = vprbrd_gpiob_get;
 	vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
 	vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;
-	ret = devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpiob, vb_gpio);
-	if (ret < 0) {
-		dev_err(vb_gpio->gpiob.parent, "could not add gpio b");
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, vb_gpio);
 
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpiob, vb_gpio);
 }
 
 static struct platform_driver vprbrd_gpio_driver = {
-- 
2.31.1


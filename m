Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E26038061D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 11:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhENJYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 05:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbhENJYt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 05:24:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C5AC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:23:37 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n2so43739844ejy.7
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmlUFVkQ6uD6pUb8XfWfoeJo9HT3302ShZH0nB1le0I=;
        b=KmgSKURBJx/Vc2rhXTYKGXTtIterSj4KTcg1FcgtQ5x984hBMLS2XqBtX3s9u4Eegh
         qfjjT0NcE+L3r8/e/b4eCZX+uFQS16+cMdJLO4n8IL6XJHVDk1OrZWHxA2CVz4cegpPj
         JUHjecTd0VKxF4UIdPssGWpvs3TqIz6i06s+NWUHEUPycSw7Lacay3LU4lZ3700xZIKB
         tndi7UVe4z/cSgC9dzGCKAtnPV8ibgDeJfFO44Cx7+GUb37Qa1yUIRQll9UNtl7hMDMl
         9bIZ6t1eegwdWnCfjwGXyNuDtV1O30OGtJWNOb911vNkogq4/5HXv/ZIG9xrOgKD1dBD
         GnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmlUFVkQ6uD6pUb8XfWfoeJo9HT3302ShZH0nB1le0I=;
        b=rpT7BzQS5QG7uMCJxmtQUyt92+A+A6HciZz7r/Ip0lCTXgKSwCqV0f35QskhmEQoJa
         r/c3DJVjO9Gjy1AEzvjhMvA1BVcA2At6CBJsZaU1Bl8utbY9yDaJTWkTLQywzys/SOuW
         Ln/M0EXH6Wv9NDL0EAyFY6gny50EqEtLueAgEQ4kQpq6EfwqDeY0AYudneb6LUC7v31d
         Gp/DxuU/uAyvnPp1WcSYoqjYU0DtkfLAISY539483xEKWI4RclGYW9l2rCWjkcqCmS/3
         1Q/YrZuk1V3zrqvVplwzFbQV7IE0StiUiVkrJrkTjnq1K6wxi0H+mlpcXs4Xcwf+Sy+i
         KpGw==
X-Gm-Message-State: AOAM533pURWBmJB+Wmwx/kY0B6Q6eKYP1UJeAsFusIDY7W1PvOMvcASW
        qIvrPvPwYuRtXdvKRYzoH0IAAq/V9mgyhVFKDSA=
X-Google-Smtp-Source: ABdhPJxm204+NKwNwHBbo83HCeUN5nr7NJj9e+yftkEfM2nkUwYN8vMR34iiNYtaUeYjDQ6HpHgAPA==
X-Received: by 2002:a17:906:8299:: with SMTP id h25mr3619511ejx.81.1620984216327;
        Fri, 14 May 2021 02:23:36 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id c3sm4264226edn.16.2021.05.14.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:23:36 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        support.opensource@diasemi.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-da9055: remove platform_set_drvdata() + cleanup probe
Date:   Fri, 14 May 2021 12:23:32 +0300
Message-Id: <20210514092332.19966-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-da9055.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 6ad0c37b862e..49446a030f10 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -133,7 +133,6 @@ static int da9055_gpio_probe(struct platform_device *pdev)
 {
 	struct da9055_gpio *gpio;
 	struct da9055_pdata *pdata;
-	int ret;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -146,15 +145,7 @@ static int da9055_gpio_probe(struct platform_device *pdev)
 	if (pdata && pdata->gpio_base)
 		gpio->gp.base = pdata->gpio_base;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, gpio);
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
 }
 
 static struct platform_driver da9055_gpio_driver = {
-- 
2.31.1


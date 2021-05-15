Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5843816A9
	for <lists+linux-gpio@lfdr.de>; Sat, 15 May 2021 09:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhEOH4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 May 2021 03:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbhEOH4Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 May 2021 03:56:16 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD2EC061756
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:55:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id z12so447066ejw.0
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3vLwW+VzRaxjESKCqXUtPcyQh1X0uzwp7Rpbs5RV5U=;
        b=VtdMewbitiV1KF4LGZiKuYoOrGK5e6TmWfRfHQkdoU3FnoAGXgQ+hTTgx0lvSlnSaA
         n4592UsITYm0/vCXB4f5cqP7YLlCsWowyipJFsepFyrFdWY2Rnd994Z+BkZ7FZwO708Y
         SkRmcYBkZRb0+LL7kJD/z9IgQ9PqT1uNDocIEreQKpAl25OsuVeYW0Z7lQaGw+atpHZr
         ppv4uuVvmKMlvg82uAh1Kk8zZQQ0zuvMYLarBY9pRmPnM5IagrMjPoc3PowT7ltYjT7K
         gCQpk4Fi0DnJqrPf2OlN63Zsk7/YPp4qOwJpQTqZm56NlOUvxnd+WzXqjBB3akYVX3dE
         Nm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3vLwW+VzRaxjESKCqXUtPcyQh1X0uzwp7Rpbs5RV5U=;
        b=YHHQ7G2Lt55l9yN1FfQiacxzK/xGkytuGfrLPQiNbvTqeUE6rJdchh+eQ/68ZtFcdT
         5xfTUxo/0weHUkqveq4AWp/NA2mzzMTl+1YHZfJiFFggay/E2o5bYS1UjWmnEyw1e7xG
         LEn2FqN/2Zp5tHy/OoiKTwv+DVpLTAj/NOrpHfUXl/ZyDbRsjYWpT8qBIgWjo/lzzoV7
         u66UN94GhYkOoVjHBOHHyp2hn2B7EygLMC7rE0MK4ROQ5FqB6R/jDzVtzRyP3mdCBJ7m
         0cDaDnfSIHDQ68g/fdaqHP7aFjBEqapjmpv2fTmRlaOb97UW/aqWdzVdfI0Vm5NdH/T9
         lirQ==
X-Gm-Message-State: AOAM531rQ/UaMbBEnVm7/c4NMCSfCexT+DwTaYWozVWsfkqRENwlg6wh
        g6iYvg4oiO2JtBSNFZ+3q4j34yj1T65/EqZQX5Y=
X-Google-Smtp-Source: ABdhPJxkx3f8TGV6oKOgiHV4JzUhvMYSvanBfTJn72/CwIK812lJLfh+3Jdsrm00DW1/yKWfYlT20w==
X-Received: by 2002:a17:906:84d:: with SMTP id f13mr9182085ejd.451.1621065301903;
        Sat, 15 May 2021 00:55:01 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id q18sm6182629edd.3.2021.05.15.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 00:55:01 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-tps65218: remove platform_set_drvdata() + cleanup probe
Date:   Sat, 15 May 2021 10:54:44 +0300
Message-Id: <20210515075444.9210-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-tps65218.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 43a1150055ce..66461ed192d7 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -187,7 +187,6 @@ static int tps65218_gpio_probe(struct platform_device *pdev)
 {
 	struct tps65218 *tps65218 = dev_get_drvdata(pdev->dev.parent);
 	struct tps65218_gpio *tps65218_gpio;
-	int ret;
 
 	tps65218_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps65218_gpio),
 				     GFP_KERNEL);
@@ -201,16 +200,7 @@ static int tps65218_gpio_probe(struct platform_device *pdev)
 	tps65218_gpio->gpio_chip.of_node = pdev->dev.of_node;
 #endif
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &tps65218_gpio->gpio_chip,
-				     tps65218_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, tps65218_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &tps65218_gpio->gpio_chip, tps65218_gpio);
 }
 
 static const struct of_device_id tps65218_dt_match[] = {
-- 
2.31.1


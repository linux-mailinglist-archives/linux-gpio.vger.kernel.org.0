Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E86298F04
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781155AbgJZOTO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:19:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35694 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781124AbgJZOTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:19:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id n15so12818128wrq.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNlfGqR+PgAe0QneJuZnZZA8sj+er/tRH9Y2OabUbQ0=;
        b=gh4HzeCCQLfL5jHFIUm26UdGLVfvp3opWY/OVkpIQohdrvtI3hdU8aERlCPcZ3dOvE
         f1zOUGsmlti2vWFn/1wF5rhe74W9kraydJuqtvjm7vvJubXDuKFINX3Dpek4SVfCUBjh
         udZ2K96ZTuXt+h/iOnMJV6/Eahh/jafnEweDc/eHnfDK0V0yEbC/V3k9M5YuS9cOBz13
         2GuWQPyRw36d12wY22Os7QVDUPrldvVBSeSPNc0auOOW3d3O7RHXaFz/6Cp5i9+5DTiv
         Y3NVheSPaAvC1fSkLSvoq69gnZSD4jrW5jEsVHAeGIZ32/GJex7HvS50vHIXC4TXLv1H
         v7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNlfGqR+PgAe0QneJuZnZZA8sj+er/tRH9Y2OabUbQ0=;
        b=ejy24vth+yOwP7q8KdkUNP/YjzQHu6K/z84/MSTsvBER47TW8hEk9ytj5yxhOGAM9m
         yidupE0ABZpaC+y9Rzi0mcANk4TYKKrnA2WaPtLFKOclPlQSBaiKi0SehLychDfK+Xnk
         4GphpPdn9zrK8qU7AOmVu9tj8sw2ucM0wqcl4ws+30Q9NWhHgaSEVmI+0WLuAZ37WAMT
         tHQcA5CY6a9x+vLuvNbAsQhTSkuPLtw9Gi/bSiPpu1LnL4ziUrRdGXM6MgW9nIOi/kwg
         w8QueBAAAIztlyfdTZynIbEYfM8Ns+CU+KypPy3mOwE+GV7on0wTkSgDltHug4Sw0qy5
         rhMg==
X-Gm-Message-State: AOAM530mbUxEwkae4mzeq9e83QkGc5EWQbb7SlBDudT1ncBa5rM6cBcF
        6l8jS95nRusESTRfJzqWQP6ofg==
X-Google-Smtp-Source: ABdhPJyjVcdemCo73EyobrFHZh8UvBBGsFPmk5fAb9DNhV+vH0yKvtXmZog+D8tGQZw2qD+6tmnEUg==
X-Received: by 2002:a5d:4648:: with SMTP id j8mr17852406wrs.131.1603721937895;
        Mon, 26 Oct 2020 07:18:57 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id e15sm21920841wro.13.2020.10.26.07.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:18:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 7/7] gpio: exar: use devm action for freeing the IDA and drop remove()
Date:   Mon, 26 Oct 2020 15:18:39 +0100
Message-Id: <20201026141839.28536-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026141839.28536-1-brgl@bgdev.pl>
References: <20201026141839.28536-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can simplify the error path in probe() and drop remove() entirely if
we provide a devm action for freeing the device ID.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index e4da278f74a2..fda9346d1dc0 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -110,6 +110,13 @@ static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
 	return 0;
 }
 
+static void exar_devm_ida_free(void *data)
+{
+	struct exar_gpio_chip *exar_gpio = data;
+
+	ida_free(&ida_index, exar_gpio->index);
+}
+
 static const struct regmap_config exar_regmap_config = {
 	.name		= "exar-gpio",
 	.reg_bits	= 8,
@@ -157,6 +164,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (index < 0)
 		return index;
 
+	ret = devm_add_action_or_reset(dev, exar_devm_ida_free, exar_gpio);
+	if (ret)
+		return ret;
+
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
 	exar_gpio->gpio_chip.parent = dev;
@@ -173,29 +184,15 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 	ret = devm_gpiochip_add_data(dev, &exar_gpio->gpio_chip, exar_gpio);
 	if (ret)
-		goto err_destroy;
+		return ret;
 
 	platform_set_drvdata(pdev, exar_gpio);
 
-	return 0;
-
-err_destroy:
-	ida_free(&ida_index, index);
-	return ret;
-}
-
-static int gpio_exar_remove(struct platform_device *pdev)
-{
-	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
-
-	ida_free(&ida_index, exar_gpio->index);
-
 	return 0;
 }
 
 static struct platform_driver gpio_exar_driver = {
 	.probe	= gpio_exar_probe,
-	.remove	= gpio_exar_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 	},
-- 
2.29.1


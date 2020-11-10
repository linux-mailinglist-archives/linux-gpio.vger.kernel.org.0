Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F8A2AD963
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732326AbgKJO42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731562AbgKJO4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:56:15 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437DDC0617A7
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:14 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h2so3293067wmm.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IQh6Jo5zoHL7/3I5hGMlwjltjV3kz9H+4fZOBa3eDu8=;
        b=dHlBKlolnhqDQUiW04dQgyoqrmqH4sPOBeDpM+s/gEPkY9Fd552NUSYcptJJCPHOk7
         ak6DPDgZ5pgdVJQ/LlxjCMqrETWDnz1Y7QPIM/e/6v1f06k3U9v/uRj+QnuruoU8yik6
         PE22kni59Wt8ooHuvyLlSYaG2BA1AzVYuV/k9Msd3cXyFcO36UvvKC2iJ93qmhYZqJ8c
         u/d3Hzxfa9QaHfJENsmfkiN5nWIPx8HU88R5Adok4gUIHTbKghxsZyS2DjR8iotznRqN
         iXawjQznG4Enn1JEOuPZnXvZiPQeqfJvKZYeFkGdYYOfFiSgCy0b7A9tV7fkCBnfwsgV
         WUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IQh6Jo5zoHL7/3I5hGMlwjltjV3kz9H+4fZOBa3eDu8=;
        b=EL92ierFbBSfTY0cuIaWfyP+uirk0wmJWAQt6klZpF7slx7idPQELxu5vPZ8cY8P0Y
         4P7tGMXKpMnNl6+DUVkPVYrV4PJRCKXd3C5tkzIkhH12HwwU3FyDgOBU2bLoLgjAhZn2
         IAZ0/dIBx02jagX4BsyQSYPUOkKYxX9lByElUa/s2dqp2+TZeRVGR1HTN7T+Uv/+iz1F
         /RG2JCilbPobGLZwLvOK7O2FeNa4yeU0g58JbU8FV75rvS6KaeL45tdLEnK5fqeyUFmh
         DvnLitvOT7h+UBIRctjMNuCm2pfh+tKSh2kgNrF/V393U6xXC1sLZRtIByQe4Vhxg1vU
         TuIA==
X-Gm-Message-State: AOAM5330PsP5+oMto7UFohcZSb9VUHp+YgttHEvw+DXc1q4SBld0NxAQ
        +iVP3JQFciszMJnf7Z8etUCJjQ==
X-Google-Smtp-Source: ABdhPJzHAt9kZO/l5er2IvaDzk5nsY8wRTuZO4a5c5akLJXdSs7Q4ajjgdyStZuZs6jxse0ZVMn6lg==
X-Received: by 2002:a1c:9e12:: with SMTP id h18mr42650wme.11.1605020173067;
        Tue, 10 Nov 2020 06:56:13 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f17sm3261827wmf.41.2020.11.10.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 06:56:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 7/7] gpio: exar: use devm action for freeing the IDA and drop remove()
Date:   Tue, 10 Nov 2020 15:55:52 +0100
Message-Id: <20201110145552.23024-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110145552.23024-1-brgl@bgdev.pl>
References: <20201110145552.23024-1-brgl@bgdev.pl>
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
index 2fdca872c7c0..d37de78247a6 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -111,6 +111,13 @@ static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
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
 	.reg_bits	= 16,
@@ -158,6 +165,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
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


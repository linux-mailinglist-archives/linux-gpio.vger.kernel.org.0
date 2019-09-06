Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F43FAB276
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 08:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392232AbfIFG1g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 02:27:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41824 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfIFG1g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 02:27:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so2626051pls.8;
        Thu, 05 Sep 2019 23:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n30qcH046iWaW71uUfJO57qHyXMN57OJWxHknUR+29c=;
        b=tYI7NDikpxLUXtA/lqOpvKs/cEOU/szl6gmUMcA6n5Wqn7oOYYahU9r0V8AnAf0reF
         4nHQ1YC8+oXk9P+lJMfs0XzzTqyi09hRp9tSP67QUu5MoQSmzCfP9LXuuI7b9K3UuE5b
         mdN50wGfFfRALcDAkydIcx5fNlo6PYSgzXZ9PfXokso3Nqyswhlrapw1UpqxIMK/X767
         DjWdSGMBSz+cXvuh5vOE14GhX5xL26XbLSFsNS2jEX/CbeTssvrLih94s65BfzXQykgB
         xXXX99uB+tDkk2QMc1kyNw4OJPr4PKPFxd2Q7NMMnAWnetg7z9ZcbOcNvEgP28bB/QJP
         R/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n30qcH046iWaW71uUfJO57qHyXMN57OJWxHknUR+29c=;
        b=SfZVnt9vrjb/ZkryDoNDlralIBTagbyaqEL5NLkIe1GldKu2ZmmXzU8Des45lSIaaN
         TwT7m/1P2OJ6pbkOdAo5/9qhbT8OyYSJrWx/s6TD/wMa3cW9EgeUOtYdnCgICMmIqRgT
         lkHyIbk0CP30x8ceaBqAMdkc4wsy+YsXnVEApc5RlHSqz+hNQJUyKBGNEYqD8FBf02un
         HKFQAEUyspVBD1KVHCvgB++UpY6jo+owE5hIomqL45VimHUS8nWsCKoxlBdKOIH4eAXd
         PB0O6mf5TgdFB52mubLXe8dOOpc8NzUJQqodPqpRenmI0kj1q+AM9lUznomsO0/04M+T
         HS8w==
X-Gm-Message-State: APjAAAV1wh16Kpu/jUw46DYVrXOI8tvGZOx0n8nq7YuYI33ssVTK1kwC
        AFXdECKTA558vR/eagAAQSY=
X-Google-Smtp-Source: APXvYqzTYD4UT8lYUo5iEkHosGPzmhfer4sXZbHMDlzxTN6P9Gg1Nm+xU4PDIY7OW2IN4o6EWNWUmg==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr1975472pla.196.1567751255165;
        Thu, 05 Sep 2019 23:27:35 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id j2sm4752728pfe.130.2019.09.05.23.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 23:27:34 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/5] gpios: Use ngpio property from device tree if available
Date:   Fri,  6 Sep 2019 16:27:26 +1000
Message-Id: <20190906062727.13521-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the ngpio property from the device tree if it exists. If it doesn't
then fallback to the hardcoded value in the config.

This is in preparation for adding ast2600 support. The ast2600 SoC has
two GPIO controllers and so requires two instances of the GPIO driver.
We use the ngpio property to different between them as they have
different numbers of GPIOs.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 16c6eaf70857..c3d5ecba343b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -694,7 +694,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 		for_each_clear_bit(offset, &input, 32) {
 			unsigned int i = props->bank * 32 + offset;
 
-			if (i >= gpio->config->nr_gpios)
+			if (i >= gpio->chip.ngpio)
 				break;
 
 			clear_bit(i, gpio->chip.irq.valid_mask);
@@ -1007,10 +1007,10 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	unsigned long flags;
 
 	if (!gpio->cf_copro_bankmap)
-		gpio->cf_copro_bankmap = kzalloc(gpio->config->nr_gpios >> 3, GFP_KERNEL);
+		gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
 	if (!gpio->cf_copro_bankmap)
 		return -ENOMEM;
-	if (offset < 0 || offset > gpio->config->nr_gpios)
+	if (offset < 0 || offset > gpio->chip.ngpio)
 		return -EINVAL;
 	bindex = offset >> 3;
 
@@ -1055,7 +1055,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 	if (!gpio->cf_copro_bankmap)
 		return -ENXIO;
 
-	if (offset < 0 || offset > gpio->config->nr_gpios)
+	if (offset < 0 || offset > gpio->chip.ngpio)
 		return -EINVAL;
 	bindex = offset >> 3;
 
@@ -1119,7 +1119,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
 	struct aspeed_gpio *gpio;
-	int rc, i, banks;
+	int rc, i, banks, err;
+	u32 ngpio;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -1145,7 +1146,10 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->config = gpio_id->data;
 
 	gpio->chip.parent = &pdev->dev;
-	gpio->chip.ngpio = gpio->config->nr_gpios;
+	err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
+	gpio->chip.ngpio = (u16) ngpio;
+	if (err)
+		gpio->chip.ngpio = gpio->config->nr_gpios;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
 	gpio->chip.get_direction = aspeed_gpio_get_direction;
@@ -1158,7 +1162,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
+	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1


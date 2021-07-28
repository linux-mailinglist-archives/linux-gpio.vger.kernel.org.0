Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411A93D867A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 06:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhG1ENB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 00:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbhG1ENA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 00:13:00 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A2CC061757;
        Tue, 27 Jul 2021 21:12:58 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u15so515666wmj.1;
        Tue, 27 Jul 2021 21:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AZE/n8nHO8tmFP8WpdcBu1uhnFlE4lMP9BlPoJxj9zA=;
        b=bQ6nA3hNQAoVZiLJZT8w2r2yHZFLQLdk7bvD6tnFi1lK9517+ev70VExHvG1EGnXNt
         JglNISt+tq2CdbskMa4ycfxTrDGCbIRspXi1cTF5Jh/g4ubX9Qx1yGG0yffk99tCgO1Y
         2JSzAeC4HVrLOYBboFF2QJkm6z87mLTqWKcb/7Awlz7g1aRc7Yq2q5P4FI2dtZHpqsdW
         Vrz26p9YLoRdbhIpLfUfyyrlJjHpH8y4pgOVjC+TsBiHCDXkiIicbl+j5mn1ICaSrUfm
         rlJS77bOi2CQNPlbnB9SxQ0lLcj6w0epr4c0MUipp9UL+7Sqt/77YZpRVhBZJqzRvVlv
         16+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AZE/n8nHO8tmFP8WpdcBu1uhnFlE4lMP9BlPoJxj9zA=;
        b=tk6hBhB8W/RRASllRWj7ZG7OiTCaxkYpeGxLX/kIZgCqIgbiXGPj0z3xQzPkLP4QDC
         HneH7EHGfPFVIg52a2LMu7Mn6niaSc5sMlEyrwkNjoTEJCLsfeRx79p144Uua3rem4kF
         dJVkW0PbRpOVhLpaCIZTGDopBBRmYAXF4iRXxnEccfcFjxxxwGhUIV1fiqh5Jb96XnaB
         doJrZdQQdkwEdJvR/Auivh8F1Pwl8YgMnNT0J5ZvbIDXLOuSDobqdJLV1ULT4kdkIFHI
         vNWyNEenJ7Dyeml5gQ3ZQMlHdQE7Madv3ZgyJbLJw8HRt+aqe/9EhJl2odO+IKwhd47H
         2r4w==
X-Gm-Message-State: AOAM5325IhIIRVmFEs6s6XqDHpEYN2wEW95RCvjn1296stRVi7HXIDaj
        971l1jQy/L4ZqlhLUU+34TJAroLiuYz9oISy
X-Google-Smtp-Source: ABdhPJzqEc5SM3buYkgVZdH+T+9gj2BNkXa9ViCeNClS5OnRiLb1rDZxPlfqgLEmUbdsgXwEi9J6yg==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr7215903wmk.84.1627445576881;
        Tue, 27 Jul 2021 21:12:56 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id e6sm6274184wrg.18.2021.07.27.21.12.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 21:12:56 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip banks per device
Date:   Wed, 28 Jul 2021 06:12:51 +0200
Message-Id: <20210728041253.15382-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The default gpiolib-of implementation does not work with the multiple
gpiochip banks per device structure used for example by the gpio-mt7621
and gpio-brcmstb drivers. To fix these kind of situations driver code
is forced to fill the names to avoid the gpiolib code to set names
repeated along the banks. Instead of continue with that antipattern
fix the gpiolib core function to get expected behaviour for every
single situation adding a field 'offset' in the gpiochip structure.
Doing in this way, we can assume this offset will be zero for normal
driver code where only one gpiochip bank per device is used but
can be set explicitly in those drivers that really need more than
one gpiochip.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Gregory Fong <gregory.0xf0@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++++++++-----
 include/linux/gpio/driver.h |  4 ++++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 27c07108496d..d1b9b721218f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -382,10 +382,18 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	if (count < 0)
 		return 0;
 
-	if (count > gdev->ngpio) {
-		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
-			 count, gdev->ngpio);
-		count = gdev->ngpio;
+	/*
+	 * When offset is set in the driver side we assume the driver internally
+	 * is using more than one gpiochip per the same device. We have to stop
+	 * setting friendly names if the specified ones with 'gpio-line-names'
+	 * are less than the offset in the device itself. This means all the
+	 * lines are not present for every single pin within all the internal
+	 * gpiochips.
+	 */
+	if (count <= chip->offset) {
+		dev_warn(&gdev->dev, "gpio-line-names too short (length %d), cannot map names for the gpiochip at offset %u\n",
+			 count, chip->offset);
+		return 0;
 	}
 
 	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
@@ -400,8 +408,22 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 		return ret;
 	}
 
+	/*
+	 * When more that one gpiochip per device is used, 'count' can
+	 * contain at most number gpiochips x chip->ngpio. We have to
+	 * correctly distribute all defined lines taking into account
+	 * chip->offset as starting point from where we will assign
+	 * the names to pins from the 'names' array. Since property
+	 * 'gpio-line-names' cannot contains gaps, we have to be sure
+	 * we only assign those pins that really exists since chip->ngpio
+	 * can be different of the chip->offset.
+	 */
+	count = (count > chip->offset) ? count - chip->offset : count;
+	if (count > chip->ngpio)
+		count = chip->ngpio;
+
 	for (i = 0; i < count; i++)
-		gdev->descs[i].name = names[i];
+		gdev->descs[i].name = names[chip->offset + i];
 
 	kfree(names);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3a268781fcec..a0f9901dcae6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -312,6 +312,9 @@ struct gpio_irq_chip {
  *	get rid of the static GPIO number space in the long run.
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
  *	handled is (base + ngpio - 1).
+ * @offset: when multiple gpio chips belong to the same device this
+ *	can be used as offset within the device so friendly names can
+ *	be properly assigned.
  * @names: if set, must be an array of strings to use as alternative
  *      names for the GPIOs in this chip. Any entry in the array
  *      may be NULL if there is no alias for the GPIO, however the
@@ -398,6 +401,7 @@ struct gpio_chip {
 
 	int			base;
 	u16			ngpio;
+	u16			offset;
 	const char		*const *names;
 	bool			can_sleep;
 
-- 
2.25.1


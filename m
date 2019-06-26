Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C03BA564DC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfFZIqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:46:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33015 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfFZIqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:46:03 -0400
Received: by mail-wm1-f66.google.com with SMTP id h19so4088644wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8W5vMi9MdrqpXAU5Ufa9GPoycXyS4HH7ZnprQ1k/xT4=;
        b=HdWr1UCkK+SdQQlojDzl40R1zx7OoQrR6zxFq6o7GBW/Rr7kOKEBkWLqqvbAj7FJ7q
         1E/7hAqK7FymCxRho9h7Puo3OA3c+KBf1t8pCC4LrsCxytS5+908kOBx9SAbyr+eQ26r
         2CpZafsOxYgG7VhXjmuK4+7EvK2HhJuaPfNkwx0Hc8PdWe8VuwKaUFtpKjbD2gKSW82D
         I2K8nk9TrPyQq6+YYoeYIpHVOM96UUKcl5R8PoZle1hhHEY1jWUyt99zeiSJGufWHAF4
         W0KMHahBWXjKLSXchOOGTnNC1U/4RNPdCC0G8jumdobBD9C8SqOkVa9rHciamo7FalHp
         cMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8W5vMi9MdrqpXAU5Ufa9GPoycXyS4HH7ZnprQ1k/xT4=;
        b=uI1wEmTAMD7ee0Nzer8qNIDK1lyIcDeW8+qL3fkwigcA7Ob3pYjnpOAP86/JZ18tD6
         NLtFAtgbC4+T1I8PA77Q5QVN1dm/E6fYRYOOWhudFrx8hB/iW3GisHevyuupGxaSfdWl
         myrrnsyM1uMXmxuGlzsViwthENYlx+7+cwp6Q5mbb+S9bw9TZ4EhS8IjaRwWZeW2eyD6
         XTyETt6Ru3SUo2l7lOtaIePv6zVKo3KNfZuFj26mBdeNudJcIstIsW9gGHSr69or3TUl
         5Zm2CvqZpGzALimAqdjJburg+Q0t0dPc4I7TGiW6ZO6TQGMlBTNPym8gfXkPAB+ZTD8h
         oohQ==
X-Gm-Message-State: APjAAAWGUYCOfeOyGfzR4jUX+gVI7i8k1ctkTIRJMgGFD7pBddZMzkWm
        70ZBXdFsOC65PA6SBk6V1TacZA==
X-Google-Smtp-Source: APXvYqwV1p7sn9iItWJLAmJOQoTeWjrx2419LxfBi0SgwbNq/Dyd11Gt8JoLHH3NtSQoCcXHrISSYw==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr1751412wmk.99.1561538760632;
        Wed, 26 Jun 2019 01:46:00 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id v204sm1383715wma.20.2019.06.26.01.45.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 01:46:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3] gpio: mockup: no need to check return value of debugfs_create functions
Date:   Wed, 26 Jun 2019 10:45:57 +0200
Message-Id: <20190626084557.11847-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Bartosz: removed one more check for debugfs return value]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- fix build warning found by kbuild
- fix build error found by kbuild

v2 -> v3:
- remove one more unnecessary ifdef

 drivers/gpio/gpio-mockup.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index b6a4efce7c92..f1a9c0544e3f 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -315,7 +315,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 				      struct gpio_mockup_chip *chip)
 {
 	struct gpio_mockup_dbgfs_private *priv;
-	struct dentry *evfile;
 	struct gpio_chip *gc;
 	const char *devname;
 	char *name;
@@ -325,32 +324,25 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	devname = dev_name(&gc->gpiodev->dev);
 
 	chip->dbg_dir = debugfs_create_dir(devname, gpio_mockup_dbg_dir);
-	if (IS_ERR_OR_NULL(chip->dbg_dir))
-		goto err;
 
 	for (i = 0; i < gc->ngpio; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
 		if (!name)
-			goto err;
+			return;
 
 		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 		if (!priv)
-			goto err;
+			return;
 
 		priv->chip = chip;
 		priv->offset = i;
 		priv->desc = &gc->gpiodev->descs[i];
 
-		evfile = debugfs_create_file(name, 0200, chip->dbg_dir, priv,
-					     &gpio_mockup_debugfs_ops);
-		if (IS_ERR_OR_NULL(evfile))
-			goto err;
+		debugfs_create_file(name, 0200, chip->dbg_dir, priv,
+				    &gpio_mockup_debugfs_ops);
 	}
 
 	return;
-
-err:
-	dev_err(dev, "error creating debugfs files\n");
 }
 
 static int gpio_mockup_name_lines(struct device *dev,
@@ -447,8 +439,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (rv)
 		return rv;
 
-	if (!IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
-		gpio_mockup_debugfs_setup(dev, chip);
+	gpio_mockup_debugfs_setup(dev, chip);
 
 	return 0;
 }
@@ -501,8 +492,6 @@ static int __init gpio_mockup_init(void)
 	}
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
-	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
-		gpio_mockup_err("error creating debugfs directory\n");
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-- 
2.21.0


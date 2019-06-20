Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87ECD4C85D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 09:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbfFTHZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 03:25:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfFTHZX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Jun 2019 03:25:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 510192084B;
        Thu, 20 Jun 2019 07:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561015522;
        bh=TqUziFOecWZr7m4Cz2baTN25z+pXraW9FShc0dT53g4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=erV/CFJZZZpYqly3cYIV9lk//f83LDNwTOZ1Ugf4EIV4Ho9XbHIFhJGHvrNtrSHhi
         dWdHQPJTnFBuwHJAgvq96U7uitnjc4cZHcuyXrCuVpE8YhFCqZkFLjnnqNJwXyI8Zm
         /QcBCiApTRGXxDuDonpJxNfS4i4NlOlvdiWkBL6U=
Date:   Thu, 20 Jun 2019 09:25:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     bamv2005@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH v2] gpio: mockup: no need to check return value of
 debugfs_create functions
Message-ID: <20190620072519.GA21046@kroah.com>
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
 <20190618155047.16894-3-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618155047.16894-3-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: fix build warning found by kbuild
    fix build error found by kbuild.  Did I even build this thing
    myself???

 drivers/gpio/gpio-mockup.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index b6a4efce7c92..135dac099d1e 100644
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
@@ -501,8 +493,6 @@ static int __init gpio_mockup_init(void)
 	}
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
-	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
-		gpio_mockup_err("error creating debugfs directory\n");
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-- 
2.22.0


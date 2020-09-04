Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7267525DE27
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgIDPrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgIDPrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:47:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25294C0619C8
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so7168887wrl.12
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PIlCfY52QBAW0QciXTZrA2LEScpvUt4DRPmsiC/uEZE=;
        b=kAyUu5S4J7u5PlMhXeERMKYijow5Uvf1vPja4sMCKpKoqg1hWx6dKZnZ/RK1/SPZL0
         ShdgcMAKyIlUyaaawlpACApsdJEU9Md54uEqjYZVNnziiwX3GSZK7HTG7sRNd+i38HTH
         ZbL4kHdZ4gdnIFby9G8JkznCdrrjXsLk97q+STs6HDZ+JMgQJvLpIFZL/wFag4h3uo/A
         9aHWpE6j5E9xny7wjYFiPcwiZX4Bpo4aaPbd6AIcpdti97HzajyZMSE0d4pMOPAFvXW4
         yDiILL2k08sdQyEtXASc2pmHHINCz0ouQpMf3SaQvWo3GU1CGb4HNcpCvpcnduXDhPUp
         umng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PIlCfY52QBAW0QciXTZrA2LEScpvUt4DRPmsiC/uEZE=;
        b=LFvYt4aFV4Yi3cu/TtwHi3QAedE1gVUjpI8Z8A5kGBh9nkzSJ7/Tzrom3zsuKij5xu
         L8FoMGSOQ/RDyXXDlkD3SIAoKAdvb9QRWSOhgemJ/N1zqkYpKvTuJCUN7xoW8p9RwP+r
         cjore2fEK/VMn1XbbsSFOTctxg9SfnjkistOQ+YWdk2wguVBXQxAj+DD1Q/NhW4j5y4b
         T21XqZMhi2Vd+PipdJcbkiq7Mf3+WWhO7IwsHjzTQFealUa93FobVv9cWg9uSeDVObUc
         fpiEYMTr0iUHADqcKHEwV/warLNTCR+gdMgywN4mo7DdRLfAmv+/G4pwmtoh/E8WTEfx
         9+gw==
X-Gm-Message-State: AOAM530Ds9g4P5GA93ddxx4AymKvsi5Um0aw8Qmcunx/TV1llTw0t3BE
        sN3bGBXFFpQm7TbqSCji0iLV+jyW1zxGcQ==
X-Google-Smtp-Source: ABdhPJzViJgklFpsKr9s/TzyGNKVym3EXiIR7NoW1xlL8zZyDomQRh8eo9NSw71P/nbQ3slOTg815w==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr8386100wrp.356.1599234407810;
        Fri, 04 Sep 2020 08:46:47 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 14/23] gpio: mockup: use the generic 'gpio-line-names' property
Date:   Fri,  4 Sep 2020 17:45:38 +0200
Message-Id: <20200904154547.3836-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

GPIO line names are currently created by the driver from the chip label.
We'll want to support custom formats for line names (for instance: to
name all lines the same) for user-space tests so create them in the
module init function and pass them to the driver using the standard
'gpio-line-names' property.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 70 +++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index ce83f1df1933..96976ba66598 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 
 #include "gpiolib.h"
@@ -378,29 +379,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	return;
 }
 
-static int gpio_mockup_name_lines(struct device *dev,
-				  struct gpio_mockup_chip *chip)
-{
-	struct gpio_chip *gc = &chip->gc;
-	char **names;
-	int i;
-
-	names = devm_kcalloc(dev, gc->ngpio, sizeof(char *), GFP_KERNEL);
-	if (!names)
-		return -ENOMEM;
-
-	for (i = 0; i < gc->ngpio; i++) {
-		names[i] = devm_kasprintf(dev, GFP_KERNEL,
-					  "%s-%d", gc->label, i);
-		if (!names[i])
-			return -ENOMEM;
-	}
-
-	gc->names = (const char *const *)names;
-
-	return 0;
-}
-
 static void gpio_mockup_dispose_mappings(void *data)
 {
 	struct gpio_mockup_chip *chip = data;
@@ -468,12 +446,6 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	for (i = 0; i < gc->ngpio; i++)
 		chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
 
-	if (device_property_read_bool(dev, "named-gpio-lines")) {
-		rv = gpio_mockup_name_lines(dev, chip);
-		if (rv)
-			return rv;
-	}
-
 	chip->irq_sim_domain = devm_irq_domain_create_sim(dev, NULL,
 							  gc->ngpio);
 	if (IS_ERR(chip->irq_sim_domain))
@@ -524,6 +496,27 @@ static void gpio_mockup_unregister_devices(void)
 	}
 }
 
+static __init char **gpio_mockup_make_line_names(const char *label,
+						 unsigned int num_lines)
+{
+	unsigned int i;
+	char **names;
+
+	names = kcalloc(num_lines + 1, sizeof(char *), GFP_KERNEL);
+	if (!names)
+		return NULL;
+
+	for (i = 0; i < num_lines; i++) {
+		names[i] = kasprintf(GFP_KERNEL, "%s-%u", label, i);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return NULL;
+		}
+	}
+
+	return names;
+}
+
 static int __init gpio_mockup_init(void)
 {
 	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
@@ -531,6 +524,7 @@ static int __init gpio_mockup_init(void)
 	struct gpio_mockup_device *mockup_dev;
 	int i, prop, num_chips, err = 0, base;
 	struct platform_device_info pdevinfo;
+	char **line_names;
 	u16 ngpio;
 
 	if ((gpio_mockup_num_ranges < 2) ||
@@ -563,6 +557,7 @@ static int __init gpio_mockup_init(void)
 		memset(properties, 0, sizeof(properties));
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 		prop = 0;
+		line_names = NULL;
 
 		snprintf(chip_label, sizeof(chip_label),
 			 "gpio-mockup-%c", i + 'A');
@@ -578,9 +573,18 @@ static int __init gpio_mockup_init(void)
 				 : gpio_mockup_range_ngpio(i) - base;
 		properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
 
-		if (gpio_mockup_named_lines)
-			properties[prop++] = PROPERTY_ENTRY_BOOL(
-						"named-gpio-lines");
+		if (gpio_mockup_named_lines) {
+			line_names = gpio_mockup_make_line_names(chip_label,
+								 ngpio);
+			if (!line_names) {
+				err = -ENOMEM;
+				goto err_out;
+			}
+
+			properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+						"gpio-line-names",
+						line_names, ngpio);
+		}
 
 		pdevinfo.name = "gpio-mockup";
 		pdevinfo.id = i;
@@ -588,11 +592,13 @@ static int __init gpio_mockup_init(void)
 
 		mockup_dev = kzalloc(sizeof(*mockup_dev), GFP_KERNEL);
 		if (!mockup_dev) {
+			kfree_strarray(line_names, ngpio);
 			err = -ENOMEM;
 			goto err_out;
 		}
 
 		mockup_dev->pdev = platform_device_register_full(&pdevinfo);
+		kfree_strarray(line_names, ngpio);
 		if (IS_ERR(mockup_dev->pdev)) {
 			pr_err("error registering device");
 			kfree(mockup_dev);
-- 
2.26.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E302C25DE24
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIDPr0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgIDPrK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:47:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B799C0619CC
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:51 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so7207810wrp.8
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WyjmVjhpnGXquX37FrO09soycBHp0c7Voe0C2epUSlY=;
        b=XDPUd88fmww602TEmlb1AFnsBF7aMaMMz01k+ffuXxprMalJqR6eyMNzsTRxZEfwAA
         1ox2ek9rTQm5/aptSk9xqkCU96Ac7wp2wnDnezd49Eea/HzZ6JRt7B+Ri7EHpSHOzlLu
         PtyNqnUehKdFIFiSa9SD0TYYewXOLoRs9KBte+t/qX8FbK+8z8uw1BTgZm99d6R4VQte
         gqx2WRLW9Legr8TXPHfiCtaw9kZGji9PlCnFvCOIgEZFC4RS/BiVgpoO1N5vfbTkd+W6
         WGYVVm/uZuL0eyDZWC0EXmMnvzv0oNbN4YJRPr1LSrOUlwzCrgHx/by+VM8VzJXFvA9Z
         wYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WyjmVjhpnGXquX37FrO09soycBHp0c7Voe0C2epUSlY=;
        b=CxH8tUOMlwWPIvC7GDH+V73BbmwcS6c9AtLSOL3sG1TcwmGYR2zru377GdCHtZxbVj
         pykwahUr+ECSAPilmgJDrtXuoE5iFzopvCVHIQJ0jk0Nd7a/icfx0cLISIQXrcunBHKk
         I4usW7pFGcBvHQRWX35ofZ7RaOLbm2qJFsj9RkIhfyJUsTjFVRlsg/Xn3YZeKkT7tkXW
         511U/NZ7H3T7hYy3LbfrU6VKaHW6PIy2sVDOTlMsdYFOiZbqFuXhiFI8bE3hBKOJ9/Ye
         N7R4AnFYxg0fDeLTX7b6DX4ozM1XfMucNjYmD9OnQR9dKjQiBHL2ZcR38Ec2PqyrkVo4
         l06w==
X-Gm-Message-State: AOAM530NqH0vEDZbF1CIFuJI1Ko0+TAk+2YZb1Hn13ZEGZul5NGcTj55
        KMmmoE2RIGJtm2dwmnSl16Y+9g==
X-Google-Smtp-Source: ABdhPJwRZP17TzqitYdLKGr/J+BkXLEmQHMeFZF4HdwgXX1c+JFwPa7Dg8g7z+8i2CrZFVQjF1jEtQ==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr8628829wrj.92.1599234410024;
        Fri, 04 Sep 2020 08:46:50 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 16/23] gpio: mockup: refactor the module init function
Date:   Fri,  4 Sep 2020 17:45:40 +0200
Message-Id: <20200904154547.3836-17-brgl@bgdev.pl>
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

This is in preparation for dynamically created chips.

Let's split out the code that can be reused when creating chips at
run-time. Let's also move the code preparing the device properties into
a separate routine. This has the advantage of simplifying the error
handling.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 165 ++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 75 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 995e37fef9c5..eb94ddac5fee 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -524,16 +524,78 @@ static __init char **gpio_mockup_make_line_names(const char *label,
 	return names;
 }
 
-static int __init gpio_mockup_init(void)
+static int __init gpio_mockup_register_device(struct property_entry *properties)
 {
-	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
-	char chip_label[GPIO_MOCKUP_LABEL_SIZE];
 	struct gpio_mockup_device *mockup_dev;
-	int i, prop, num_chips, err = 0, base;
 	struct platform_device_info pdevinfo;
-	char **line_names;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	mockup_dev = kzalloc(sizeof(*mockup_dev), GFP_KERNEL);
+	if (!mockup_dev)
+		return -ENOMEM;
+
+	pdevinfo.name = "gpio-mockup";
+	pdevinfo.properties = properties;
+
+	pdevinfo.id = ida_alloc(&gpio_mockup_ida, GFP_KERNEL);
+	if (pdevinfo.id < 0) {
+		kfree(mockup_dev);
+		return pdevinfo.id;
+	}
+
+	mockup_dev->pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(mockup_dev->pdev)) {
+		ida_free(&gpio_mockup_ida, pdevinfo.id);
+		kfree(mockup_dev);
+		return PTR_ERR(mockup_dev->pdev);
+	}
+
+	list_add(&mockup_dev->list, &gpio_mockup_devices);
+
+	return 0;
+}
+
+static int __init gpio_mockup_register_one_chip_from_params(int idx)
+{
+	char chip_label[GPIO_MOCKUP_LABEL_SIZE], **line_names = NULL;
+	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
+	int prop = 0, base, ret;
 	u16 ngpio;
 
+	memset(properties, 0, sizeof(properties));
+
+	snprintf(chip_label, sizeof(chip_label), "gpio-mockup-%c", idx + 'A');
+	properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
+						   chip_label);
+
+	base = gpio_mockup_range_base(idx);
+	if (base >= 0)
+		properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",
+							base);
+
+	ngpio = base < 0 ? gpio_mockup_range_ngpio(idx)
+			 : gpio_mockup_range_ngpio(idx) - base;
+	properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
+
+	if (gpio_mockup_named_lines) {
+		line_names = gpio_mockup_make_line_names(chip_label, ngpio);
+		if (!line_names)
+			return -ENOMEM;
+
+		properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+					"gpio-line-names", line_names, ngpio);
+	}
+
+	ret = gpio_mockup_register_device(properties);
+	kfree_strarray(line_names, ngpio);
+	return ret;
+}
+
+static int __init gpio_mockup_register_chips_from_params(void)
+{
+	int num_chips, i, ret;
+
 	if ((gpio_mockup_num_ranges < 2) ||
 	    (gpio_mockup_num_ranges % 2) ||
 	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
@@ -551,86 +613,39 @@ static int __init gpio_mockup_init(void)
 			return -EINVAL;
 	}
 
-	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
-
-	err = platform_driver_register(&gpio_mockup_driver);
-	if (err) {
-		pr_err("error registering platform driver\n");
-		debugfs_remove_recursive(gpio_mockup_dbg_dir);
-		return err;
-	}
-
 	for (i = 0; i < num_chips; i++) {
-		memset(properties, 0, sizeof(properties));
-		memset(&pdevinfo, 0, sizeof(pdevinfo));
-		prop = 0;
-		line_names = NULL;
-
-		snprintf(chip_label, sizeof(chip_label),
-			 "gpio-mockup-%c", i + 'A');
-		properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
-							   chip_label);
-
-		base = gpio_mockup_range_base(i);
-		if (base >= 0)
-			properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",
-								base);
-
-		ngpio = base < 0 ? gpio_mockup_range_ngpio(i)
-				 : gpio_mockup_range_ngpio(i) - base;
-		properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
-
-		if (gpio_mockup_named_lines) {
-			line_names = gpio_mockup_make_line_names(chip_label,
-								 ngpio);
-			if (!line_names) {
-				err = -ENOMEM;
-				goto err_out;
-			}
-
-			properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
-						"gpio-line-names",
-						line_names, ngpio);
+		ret = gpio_mockup_register_one_chip_from_params(i);
+		if (ret) {
+			gpio_mockup_unregister_devices();
+			return ret;
 		}
+	}
 
-		pdevinfo.name = "gpio-mockup";
-		pdevinfo.properties = properties;
+	return 0;
+}
 
-		pdevinfo.id = ida_alloc(&gpio_mockup_ida, GFP_KERNEL);
-		if (pdevinfo.id < 0) {
-			kfree_strarray(line_names, ngpio);
-			err = pdevinfo.id;
-			goto err_out;
-		}
+static int __init gpio_mockup_init(void)
+{
+	int ret;
 
-		mockup_dev = kzalloc(sizeof(*mockup_dev), GFP_KERNEL);
-		if (!mockup_dev) {
-			kfree_strarray(line_names, ngpio);
-			ida_free(&gpio_mockup_ida, pdevinfo.id);
-			err = -ENOMEM;
-			goto err_out;
-		}
+	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
 
-		mockup_dev->pdev = platform_device_register_full(&pdevinfo);
-		kfree_strarray(line_names, ngpio);
-		if (IS_ERR(mockup_dev->pdev)) {
-			pr_err("error registering device");
-			ida_free(&gpio_mockup_ida, pdevinfo.id);
-			kfree(mockup_dev);
-			err = PTR_ERR(mockup_dev->pdev);
-			goto err_out;
-		}
+	ret = platform_driver_register(&gpio_mockup_driver);
+	if (ret) {
+		pr_err("error registering platform driver\n");
+		debugfs_remove_recursive(gpio_mockup_dbg_dir);
+		return ret;
+	}
 
-		list_add(&mockup_dev->list, &gpio_mockup_devices);
+	ret = gpio_mockup_register_chips_from_params();
+	if (ret) {
+		pr_err("error registering device");
+		debugfs_remove_recursive(gpio_mockup_dbg_dir);
+		platform_driver_unregister(&gpio_mockup_driver);
+		return ret;
 	}
 
 	return 0;
-
-err_out:
-	platform_driver_unregister(&gpio_mockup_driver);
-	gpio_mockup_unregister_devices();
-	debugfs_remove_recursive(gpio_mockup_dbg_dir);
-	return err;
 }
 
 static void __exit gpio_mockup_exit(void)
-- 
2.26.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24FF27C1F0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgI2KKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgI2KK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD70C0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:28 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so4026218wmi.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5IXYJy1aFbKAfJ2j0jd6nrzx4/J96MOWdHGgnxvVt6s=;
        b=Bqytaag0rKTC4QQ+qWveXzavNNaEqHxevK8DaMXu1cdj3IcaYIwILRVECn0LlsZlDc
         bnhyR/r3/XoHuludwRQr28qFAPFKWr0AZEF7QZz9+TtNfGvZqbgZrKdsegz+wQXj4wv5
         xmkq4qQYA3gJ8FDNAK8gQx8auHkllj9drpMYNFboiODpmVJSJUIjJ5Jyyf8XxhWf3K/e
         CmjKXbMUB6mEdq72CITa+YZBDRsqM7ibnLRv80UkzpbbwNp+/puwaEJBuakwp9NlkrYY
         l0oTkharOXBwsHyFFJF+XhQW0a7JUSu2q9W8iRFs7Lf2jhDCzCkcmCMxvNqJYj7U31R4
         E4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5IXYJy1aFbKAfJ2j0jd6nrzx4/J96MOWdHGgnxvVt6s=;
        b=CKyw1xttEzf1zcySFlgoqYkeKMHKnhGwtWweXHP0BmEaAaGZxo0xX/8awuWXF/BGlc
         UMoHcY/VpM8KfJsNasla6KhDSO1nfis8uTB3L/xpRP9oO9GIdynbBOe0DtYoTatEs3xL
         BEud5HdKRc9AVZI6Rqr1HhEUNVqe3unjX9Ft3MZr+yb7zip6RkT7s8qb9aoqCwdLt8LH
         hazz3KwdauhWxt8ncyRwqN0ZYikR7nAvsgBz51kXd9srRNn1LJBmvvdytM/08U8LzjlR
         uZqsTvdm/+SJVIVMYGc15IZqPtksC4UBnPk1D7XahDmCrlU5maj/fXdyluLRB7kIwL60
         YFPA==
X-Gm-Message-State: AOAM533dLzySovdH3sa+AfsJwrT7B2tfiLRtWae320B6qTtigCUCj888
        UZvoYfYz9rbgkwu29qxm3JIUKA==
X-Google-Smtp-Source: ABdhPJx/gvhzd/FKB6LjGn/+S/FIU5fpZIb48PI+CI+pS5wtR75htsMkj9kuqlUircqtHdieIIOSPQ==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr3533161wmi.109.1601374226929;
        Tue, 29 Sep 2020 03:10:26 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 10/10] gpio: mockup: refactor the module init function
Date:   Tue, 29 Sep 2020 12:10:04 +0200
Message-Id: <20200929101004.20288-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Let's move the code preparing the device properties into a separate
routine. This has the advantage of simplifying the error handling and
makes the indentation less deep.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 96 +++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 2d865b530fe9..67ed4f238d43 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -503,16 +503,59 @@ static __init char **gpio_mockup_make_line_names(const char *label,
 	return names;
 }
 
-static int __init gpio_mockup_init(void)
+static int __init gpio_mockup_register_chip(int idx)
 {
 	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
-	int i, prop, num_chips, err = 0, base;
 	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
+	char **line_names = NULL;
 	char chip_label[32];
-	char **line_names;
+	int prop = 0, base;
 	u16 ngpio;
 
+	memset(properties, 0, sizeof(properties));
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	snprintf(chip_label, sizeof(chip_label), "gpio-mockup-%c", idx + 'A');
+	properties[prop++] = PROPERTY_ENTRY_STRING("chip-label", chip_label);
+
+	base = gpio_mockup_range_base(idx);
+	if (base >= 0)
+		properties[prop++] = PROPERTY_ENTRY_U32("gpio-base", base);
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
+	pdevinfo.name = "gpio-mockup";
+	pdevinfo.id = idx;
+	pdevinfo.properties = properties;
+
+	pdev = platform_device_register_full(&pdevinfo);
+	kfree_strarray(line_names, ngpio);
+	if (IS_ERR(pdev)) {
+		pr_err("error registering device");
+		return PTR_ERR(pdev);
+	}
+
+	gpio_mockup_pdevs[idx] = pdev;
+
+	return 0;
+}
+
+static int __init gpio_mockup_init(void)
+{
+	int i, num_chips, err;
+
 	if ((gpio_mockup_num_ranges < 2) ||
 	    (gpio_mockup_num_ranges % 2) ||
 	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
@@ -540,54 +583,13 @@ static int __init gpio_mockup_init(void)
 	}
 
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
-				platform_driver_unregister(&gpio_mockup_driver);
-				gpio_mockup_unregister_pdevs();
-				return -ENOMEM;
-			}
-
-			properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
-						"gpio-line-names",
-						line_names, ngpio);
-		}
-
-		pdevinfo.name = "gpio-mockup";
-		pdevinfo.id = i;
-		pdevinfo.properties = properties;
-
-		pdev = platform_device_register_full(&pdevinfo);
-		kfree_strarray(line_names, ngpio);
-		if (IS_ERR(pdev)) {
-			pr_err("error registering device");
+		err = gpio_mockup_register_chip(i);
+		if (err) {
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
 			debugfs_remove_recursive(gpio_mockup_dbg_dir);
-			return PTR_ERR(pdev);
+			return err;
 		}
-
-		gpio_mockup_pdevs[i] = pdev;
 	}
 
 	return 0;
-- 
2.26.1


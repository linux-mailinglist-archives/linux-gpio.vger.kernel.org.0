Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466F827AC0F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgI1KmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgI1KmM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:42:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F03C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o5so699733wrn.13
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WjvGzyO62y8+TE10NX89uaVC3jyOwciikUlJLtdxrSc=;
        b=UP6FbU97hiLI3MWndLsukFiAqWATwepolyDq9C2sft9a4uW61HXqHHdlmryW5fOeGk
         AvFbXjzWssoioAlwHVB3m5lWEYWDLceWZl0e58Vm5AQGKqTIvcUPq/VD42dMRUDleFXJ
         rbWSwvwmEFUQ+1NWBfpmnNzrNh5aJfp9m8GjGfTqhtBJrigyA/oFNUJo9kM5zZXt3IVA
         n84qcoYzzop6WqR2np2o1mJ0liJiPJFKTNFnmuykYCp+5qpnhRV4e7F87pD7fLqgzMYs
         rxq4OxP+5BO29PuQHj1fKaMi41SisX7vk9ByFuBsfwPV6Ia/fSHrzTnfen6IWxajQS1+
         v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjvGzyO62y8+TE10NX89uaVC3jyOwciikUlJLtdxrSc=;
        b=DXJwaKgSapI/1E+GX+FcH91W46St3iR60Trr0vnCu36djHWqHn/qs4KBG+vB7L8Akn
         npyaXtQ0SgMaLHuw+jwoQ6ya+KjUt+EeJmUOO/3dPNVb7HiGfkZ1WDTmGn+TzJjOPISr
         IR/X83Zk6ElfeuTEYFUgqk+yhSRkw0iZUFLSOSUHmD4VvrJNQgZ1lQcIwC78ZXxCwVjz
         TKJMUBOZ3o6mPQCDO+/JW7k721G7rNKS+dXGg+S6YgajE6NJT9YPo62qMidz2ZX7dzgT
         loWnPQg21wqCZ5Aip0IwIcM0EEqsuKWR0qnXZS5Alag0h9yIhWu/vqaYSQJHfsdJfpeG
         UuoA==
X-Gm-Message-State: AOAM530LTPqSsLTrdL/VdgaeRSRKwNC9UgO9cLiY9X1RFHPs5PDInGk9
        lvc08k66yIQ+WIXurjz931Zosg==
X-Google-Smtp-Source: ABdhPJxPHM6y/EAjEjcY3fXmak9oChruhF6beTZp/+Z1PorBJ+2DWmZynuhGzwunOEQGzof6DeRUsA==
X-Received: by 2002:a5d:43cb:: with SMTP id v11mr1044613wrr.188.1601289730189;
        Mon, 28 Sep 2020 03:42:10 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 9/9] gpio: mockup: refactor the module init function
Date:   Mon, 28 Sep 2020 12:41:55 +0200
Message-Id: <20200928104155.7385-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
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
index 47b7de6d5ab1..02eea05a09dd 100644
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


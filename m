Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AB627C1F3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgI2KKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbgI2KK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:28 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3567C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so4190119wmm.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5qQDilT3y+n2e7orjLtQr7y3ivdCr40o5nxvBAQH2pM=;
        b=N8jeGR+80RDEID6XklAcnFTzZawT2bhdku5p9RFEQV+di6rgCovEBGHTsfkmNtnShb
         zBJ7h4bKzOF9trfrVtL8fq3jz0nOoHH8Z4oNU2HLWX+OI5NiJyEg5s46j3syUCRi7ftX
         WgLQcKaOPX/i4fHvGcQjBiDy2IALZNaGXqFEa6J63OZeQvhiMq+J8aV/K1oEbwnNsrwa
         fpGvNgXQawbYb50Vus3ssvqWsI6dPY3qjDkWiavvMumRpnLoeCYmqLc+M3iDPyUa2WNF
         qjchwXN/rKaDue00bFzhfdytYJwKnHluKsL64gZ4Z0Mke+oEirZo/Gt1ZnNI3RnecgDq
         as+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5qQDilT3y+n2e7orjLtQr7y3ivdCr40o5nxvBAQH2pM=;
        b=Mg7iKjh9kC/OVAe201Jnx73SYuzIMT5IGEJFkrLPAvtUufWjcp6GmdXvqM60USfO2a
         Dzlu0vClteGYu9PCZd7BYUWsU8e4yrGqKdwl6BKSEHTfXh8jARJhFwTc7Cxdliw40VwU
         lNIDOAltNHx/PagQN5Pjcejwd3M848Q2XwJ8M3q4a/8EJI4479lmmAfYrJ2e7e/LAgyq
         uraNde+vPjxpCy7E9HcrDQHF44ETRqdbtSAwWR71peW2ewflGfVXNzKR6dNqTXYZ4aU6
         /eS6gzEKUqWdrT1OLZAIeX6vF9HKASL8IvK8IY1oc6DZ5jbyK0EEYqg5hmIqi4+KuHxe
         UJGQ==
X-Gm-Message-State: AOAM533S90ziHkmU1GubygMXqzZbOdFRU8B2ST2qy0t4oCRR9d+64n79
        bRM7h+4euQQlWZwjGX5SH4U/7w==
X-Google-Smtp-Source: ABdhPJwZ+XcVDmhYbQnrVbYHU0N1B+Wj2NfG5DLkgZwDj+bvs2T5stE6pk6Sy9+BGhWryWNkn4sZcg==
X-Received: by 2002:a1c:a184:: with SMTP id k126mr3676184wme.39.1601374225482;
        Tue, 29 Sep 2020 03:10:25 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 09/10] gpio: mockup: use the generic 'gpio-line-names' property
Date:   Tue, 29 Sep 2020 12:10:03 +0200
Message-Id: <20200929101004.20288-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 70 +++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1466f480aacd..2d865b530fe9 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 
 #include "gpiolib.h"
@@ -374,29 +375,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	}
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
@@ -464,12 +442,6 @@ static int gpio_mockup_probe(struct platform_device *pdev)
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
@@ -510,6 +482,27 @@ static void gpio_mockup_unregister_pdevs(void)
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
@@ -517,6 +510,7 @@ static int __init gpio_mockup_init(void)
 	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
 	char chip_label[32];
+	char **line_names;
 	u16 ngpio;
 
 	if ((gpio_mockup_num_ranges < 2) ||
@@ -549,6 +543,7 @@ static int __init gpio_mockup_init(void)
 		memset(properties, 0, sizeof(properties));
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 		prop = 0;
+		line_names = NULL;
 
 		snprintf(chip_label, sizeof(chip_label),
 			 "gpio-mockup-%c", i + 'A');
@@ -564,15 +559,26 @@ static int __init gpio_mockup_init(void)
 				 : gpio_mockup_range_ngpio(i) - base;
 		properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
 
-		if (gpio_mockup_named_lines)
-			properties[prop++] = PROPERTY_ENTRY_BOOL(
-						"named-gpio-lines");
+		if (gpio_mockup_named_lines) {
+			line_names = gpio_mockup_make_line_names(chip_label,
+								 ngpio);
+			if (!line_names) {
+				platform_driver_unregister(&gpio_mockup_driver);
+				gpio_mockup_unregister_pdevs();
+				return -ENOMEM;
+			}
+
+			properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+						"gpio-line-names",
+						line_names, ngpio);
+		}
 
 		pdevinfo.name = "gpio-mockup";
 		pdevinfo.id = i;
 		pdevinfo.properties = properties;
 
 		pdev = platform_device_register_full(&pdevinfo);
+		kfree_strarray(line_names, ngpio);
 		if (IS_ERR(pdev)) {
 			pr_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
-- 
2.26.1


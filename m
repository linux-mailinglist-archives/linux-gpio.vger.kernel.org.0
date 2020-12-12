Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E262D8380
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 01:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbgLLAhx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 19:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437765AbgLLAhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 19:37:32 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E78C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:36:51 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 23so15847632lfg.10
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ttjqXhxQi+pNizwAm4tpfBYhH9e2m0KKEEwUkI5pPkw=;
        b=V4rIX9tGub7KABlVbhEWkOc8JyvTIimSGi9ZCxXgEZXicY8lL22Tl+8wTUixpT+KJd
         MpCVltyw5Y6xAKfXa8Zn7UD78JWuknfQtyceOftl7xEY7r1HuFI5NrI1FW928ihY1onJ
         +o24L3HgNMdhfBhCqY/9YAXGj0h1eFxHMXYpXxZie/Z0EOHV5IX/oF5qJEq2WOcV+OKN
         XFE0Nn1DjkxIDVOgJZTGTuWi9Px2Pav3TIh9iVJjFweC6L3wke4qPCI02F9jztRcPEbK
         pI4noO24N4EB+oqhpUgZ6Vys74oViN6siVIka5EoXXFK04XkQRnu9eVN1L9ICWxW+duT
         xRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ttjqXhxQi+pNizwAm4tpfBYhH9e2m0KKEEwUkI5pPkw=;
        b=WKGIFtRNgWAWEmqOUepc0QaYfR5fZuETDmiiwVyJu72ULUBncJHjFz0v2uVBsSXYJo
         HFaN7BiU9MGxpeJKyOoRm/7+2bNJ8xIOe2WCsBBSE76Mc/PMPucf8O2uo+QNpcQYJH4W
         9B9KEvy2D6zCHVEPJ0LClQvgDVQb8HLxMUvYqN2ASmFl7xx4+inj58kJHqh11ZkFeN/0
         1WpyMMrmBwNtMbUcK/JrbQ2C1xefnQoLSnjOVgo7C2wgBZZeMKKTQIv3gXgAJ9eaE/la
         84h4N9fmve7viZehyWi3lhQ+JnfihwjKH3QaJRpiyy9Yj5PEJunHYQZ7JQakONg+CYCR
         W4uw==
X-Gm-Message-State: AOAM530neryfCOiYtje8mBoyMg+ucggP/szA7T5DGldalRJgoxkNRsyD
        HNSg+dfOikEHa3VlIOLIQpVQYJVY6YbbQMnw
X-Google-Smtp-Source: ABdhPJygSLsOht2j04f7E6A/vo6z5NziyQvjseJAV15q87u5r/xVCGYHyTWqUaz6lKGMJpN+MZUNxg==
X-Received: by 2002:a2e:5018:: with SMTP id e24mr6218830ljb.425.1607733410214;
        Fri, 11 Dec 2020 16:36:50 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id i29sm1053519lfc.193.2020.12.11.16.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 16:36:49 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpiolib: Disallow identical line names in the same chip
Date:   Sat, 12 Dec 2020 01:34:47 +0100
Message-Id: <20201212003447.238474-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to make this namespace hierarchical: at least do not
allow two lines on the same chip to have the same name, this
is just too much flexibility. If we name a line on a chip,
name it uniquely on that chip.

I don't know what happens if we just apply this, I *hope* there
are not a lot of systems out there breaking this simple and
intuitive rule.

As a side effect, this makes the device tree naming code
scream a bit if names are not globally unique.

I think there are not super-many device trees out there naming
their lines so let's fix this before the problem becomes
widespread.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This may be just the first step in tightening this up.
Googling gives at hand that the colission warning doesn't
happen much so we might go as far as to say the name can
be required to be globally unique, but that creates a flat
namespace so I don't know if that is desireable.
---
 drivers/gpio/gpiolib.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5ce0c14c637b..be4b3e9032b2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -330,11 +330,9 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 /*
  * Take the names from gc->names and assign them to their GPIO descriptors.
- * Warn if a name is already used for a GPIO line on a different GPIO chip.
  *
- * Note that:
- *   1. Non-unique names are still accepted,
- *   2. Name collisions within the same GPIO chip are not reported.
+ * - Fail if a name is already used for a GPIO line on the same chip.
+ * - Allow names to not be globally unique but warn about it.
  */
 static int gpiochip_set_desc_names(struct gpio_chip *gc)
 {
@@ -343,13 +341,19 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 
 	/* First check all names if they are unique */
 	for (i = 0; i != gc->ngpio; ++i) {
-		struct gpio_desc *gpio;
+		struct gpio_desc *gpiod;
 
-		gpio = gpio_name_to_desc(gc->names[i]);
-		if (gpio)
+		gpiod = gpio_name_to_desc(gc->names[i]);
+		if (gpiod) {
 			dev_warn(&gdev->dev,
 				 "Detected name collision for GPIO name '%s'\n",
 				 gc->names[i]);
+			if (gpiod->gdev == gdev) {
+				dev_err(&gdev->dev,
+					"GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names\n");
+				return -EINVAL;
+			}
+		}
 	}
 
 	/* Then add all names to the GPIO descriptors */
@@ -402,8 +406,22 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 		return ret;
 	}
 
-	for (i = 0; i < count; i++)
+	for (i = 0; i < count; i++) {
+		struct gpio_desc *gpiod;
+
+		gpiod = gpio_name_to_desc(names[i]);
+		if (gpiod) {
+			dev_warn(&gdev->dev,
+                                 "Detected name collision for GPIO name '%s'\n",
+                                 names[i]);
+			if (gpiod->gdev == gdev) {
+				dev_err(&gdev->dev,
+					"GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names\n");
+				return -EINVAL;
+			}
+		}
 		gdev->descs[i].name = names[i];
+	}
 
 	kfree(names);
 
-- 
2.28.0


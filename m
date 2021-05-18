Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222EF387CD8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 17:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345951AbhERPvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 11:51:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:45895 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240361AbhERPvU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 11:51:20 -0400
IronPort-SDR: yGzgACAx1xS3+M6KIwUZWrUBoutGsHQY9BNdiqT+fXMM3hqt0VXswBFxQKjy7XW/0d3RXrJ/iu
 SQB9IO2JNcJQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197657334"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="197657334"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 08:50:01 -0700
IronPort-SDR: fbd72Sc3wSKHE5OFTWe1UWU5h5glrGatWwUc3NlZjyK7XSwj3JnGnGvIpuhI6ovC74ZAkCtjcq
 nPOUQPjvd35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="411328261"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 18 May 2021 08:49:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1486750E; Tue, 18 May 2021 18:50:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/2] gpiolib: Introduce gpiod_request_user() helper
Date:   Tue, 18 May 2021 18:50:13 +0300
Message-Id: <20210518155013.45622-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpiod_request_user() is a special helper to avoid propagating stuff
to user space that should not be propagated, e.g. internal error codes.

For now, hide EPROBE_DEFER with ENODEV.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c  | 21 ++++++---------------
 drivers/gpio/gpiolib-sysfs.c |  7 ++-----
 drivers/gpio/gpiolib.h       | 12 ++++++++++++
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1d8f66880d63..8a934914f93a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -330,12 +330,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			goto out_free_lh;
 		}
 
-		ret = gpiod_request(desc, lh->label);
-		if (ret) {
-			if (ret == -EPROBE_DEFER)
-				ret = -ENODEV;
+		ret = gpiod_request_user(desc, lh->label);
+		if (ret)
 			goto out_free_lh;
-		}
 		lh->descs[i] = desc;
 		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
 
@@ -1381,12 +1378,9 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			goto out_free_linereq;
 		}
 
-		ret = gpiod_request(desc, lr->label);
-		if (ret) {
-			if (ret == -EPROBE_DEFER)
-				ret = -ENODEV;
+		ret = gpiod_request_user(desc, lr->label);
+		if (ret)
 			goto out_free_linereq;
-		}
 
 		lr->lines[i].desc = desc;
 		flags = gpio_v2_line_config_flags(lc, i);
@@ -1770,12 +1764,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
-	ret = gpiod_request(desc, le->label);
-	if (ret) {
-		if (ret == -EPROBE_DEFER)
-			ret = -ENODEV;
+	ret = gpiod_request_user(desc, le->label);
+	if (ret)
 		goto out_free_le;
-	}
 	le->desc = desc;
 	le->eflags = eflags;
 
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index d836aba91d3c..22a9ad1a2978 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -473,12 +473,9 @@ static ssize_t export_store(struct class *class,
 	 * they may be undone on its behalf too.
 	 */
 
-	status = gpiod_request(desc, "sysfs");
-	if (status) {
-		if (status == -EPROBE_DEFER)
-			status = -ENODEV;
+	status = gpiod_request_user(desc, "sysfs");
+	if (status)
 		goto done;
-	}
 
 	status = gpiod_set_transitory(desc, false);
 	if (!status) {
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 69c96a4276de..7f760745c457 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -142,6 +142,18 @@ struct gpio_desc {
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
+
+static inline int gpiod_request_user(struct gpio_desc *desc, const char *label)
+{
+	int ret;
+
+	ret = gpiod_request(desc, label);
+	if (ret == -EPROBE_DEFER)
+		ret = -ENODEV;
+
+	return ret;
+}
+
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);
-- 
2.30.2


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A080B176E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 05:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfIMDWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 23:22:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42580 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfIMDWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 23:22:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id w22so17198010pfi.9;
        Thu, 12 Sep 2019 20:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qe2h9NfhcUmoPESIDtsAXWHsKPsyhEADzKG8omWLqSM=;
        b=rmgYQxJ4cZAskQbfVPERybuMb0Dl9tUFzioHbDqTUtIEWrauDr0t5m1UgZTnf+SyKf
         /iM4v1a6CukTZFa9dnGIMNKmuIFiK0cUlC3XxPwhjGxNv9BHQ1HR+LUBGuqmXi3MUwBx
         M71xyAjYpdnCmS8/vCfac5bu91xvWlDhbYfjkoRiSVamtNz71B37w3qHvP/e5L20a9AG
         n9Zw98X8RMPbe4PEXbJV6ZxP4O0uAz/SLE1JUCjxNLt1k43j3mG5l2K5Md2mISjSSjhV
         i1jGrn29gEcdqGfW2GvlqHR48nIU+p0YbffPJW5X8E5+MhvY7uPuycGUbqS5clc71/T/
         DsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qe2h9NfhcUmoPESIDtsAXWHsKPsyhEADzKG8omWLqSM=;
        b=YnPVlfnLxcvo/IjBE+28adLTGcmMvZ6jAHcPw4cEsN6oiTtHSrmvFwbgQV2+DSGakY
         oHAvvwAHFWY1TcrdhsFYadHpIUHzsulsWt1ANNDSdIO2iQtncrkMFPUYRXRmBbv2mEfO
         L7Zk1v24zohPMErVQ6kM0hb1IulDdF34+i5oKgmue5OlOcC871pCNHowE8gigA05DBgx
         Fps7Icn5ggB025QfaCOyGEhlaGd9U2/B+/63H32h/WRrZbiO+wZKa9WyYRf4lu7I3ehn
         m+CfT5Of5/xU+/3r6l5hep5ReT+iBBt/41l9uTZrsL2/5QWNeYkbWzBeCbvKtY7+FDQL
         0DSA==
X-Gm-Message-State: APjAAAVX7wL1YnBDjnmNrKhm2IRdTVeQncdGjc6Jk7HjEpMNz4xOJUkO
        kS1AdqJGeEc7a5+LFYVot6Un8usvumY=
X-Google-Smtp-Source: APXvYqwnCcBzoRXJqlbD5UgaqK1idemNl6UNFB40/cc29W2d/CmEtBZh8z6Ik+hdu8CCyUxb/W3Fnw==
X-Received: by 2002:a63:c107:: with SMTP id w7mr40148025pgf.283.1568344966677;
        Thu, 12 Sep 2019 20:22:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b2sm8060936pfd.81.2019.09.12.20.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 20:22:45 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/2] gpiolib: introduce fwnode_gpiod_get_index()
Date:   Thu, 12 Sep 2019 20:22:39 -0700
Message-Id: <20190913032240.50333-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
References: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This introduces fwnode_gpiod_get_index() that iterates through common gpio
suffixes when trying to locate a GPIO within a given firmware node.

We also switch devm_fwnode_gpiod_get_index() to call
fwnode_gpiod_get_index() instead of iterating through GPIO suffixes on
its own.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

Changes in v2:
- rebased on top of Linus W devel branch
- added Andy's Reviewed-by

 drivers/gpio/gpiolib-devres.c | 16 +-----------
 drivers/gpio/gpiolib.c        | 48 +++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h | 13 ++++++++++
 3 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 9a0475c87f95..4421be09b960 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -205,29 +205,15 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      enum gpiod_flags flags,
 					      const char *label)
 {
-	char prop_name[32]; /* 32 is max size of property name */
 	struct gpio_desc **dr;
 	struct gpio_desc *desc;
-	unsigned int i;
 
 	dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
 			  GFP_KERNEL);
 	if (!dr)
 		return ERR_PTR(-ENOMEM);
 
-	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
-		if (con_id)
-			snprintf(prop_name, sizeof(prop_name), "%s-%s",
-					    con_id, gpio_suffixes[i]);
-		else
-			snprintf(prop_name, sizeof(prop_name), "%s",
-					    gpio_suffixes[i]);
-
-		desc = fwnode_get_named_gpiod(fwnode, prop_name, index, flags,
-					      label);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
-			break;
-	}
+	desc = fwnode_gpiod_get_index(fwnode, con_id, index, flags, label);
 	if (IS_ERR(desc)) {
 		devres_free(dr);
 		return desc;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 158e327a1285..11a6f4777436 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4317,6 +4317,54 @@ static int platform_gpio_count(struct device *dev, const char *con_id)
 	return count;
 }
 
+/**
+ * fwnode_gpiod_get_index - obtain a GPIO from firmware node
+ * @fwnode:	handle of the firmware node
+ * @con_id:	function within the GPIO consumer
+ * @index:	index of the GPIO to obtain for the consumer
+ * @flags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * This function can be used for drivers that get their configuration
+ * from opaque firmware.
+ *
+ * The function properly finds the corresponding GPIO using whatever is the
+ * underlying firmware interface and then makes sure that the GPIO
+ * descriptor is requested before it is returned to the caller.
+ *
+ * Returns:
+ * On successful request the GPIO pin is configured in accordance with
+ * provided @flags.
+ *
+ * In case of error an ERR_PTR() is returned.
+ */
+struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
+					 const char *con_id, int index,
+					 enum gpiod_flags flags,
+					 const char *label)
+{
+	struct gpio_desc *desc;
+	char prop_name[32]; /* 32 is max size of property name */
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
+		if (con_id)
+			snprintf(prop_name, sizeof(prop_name), "%s-%s",
+					    con_id, gpio_suffixes[i]);
+		else
+			snprintf(prop_name, sizeof(prop_name), "%s",
+					    gpio_suffixes[i]);
+
+		desc = fwnode_get_named_gpiod(fwnode, prop_name, index, flags,
+					      label);
+		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
+			break;
+	}
+
+	return desc;
+}
+EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
+
 /**
  * gpiod_count - return the number of GPIOs associated with a device / function
  *		or -ENOENT if no GPIO has been assigned to the requested function
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index dc0ddcd30515..5215fdba6b9a 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -176,6 +176,10 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 					 const char *propname, int index,
 					 enum gpiod_flags dflags,
 					 const char *label);
+struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
+					 const char *con_id, int index,
+					 enum gpiod_flags flags,
+					 const char *label);
 struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      struct fwnode_handle *child,
 					      const char *con_id, int index,
@@ -531,6 +535,15 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline
+struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
+					 const char *con_id, int index,
+					 enum gpiod_flags flags,
+					 const char *label)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      struct fwnode_handle *fwnode,
-- 
2.23.0.237.gc6a4ce50a0-goog


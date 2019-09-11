Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D21FAF74D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfIKHwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44540 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfIKHwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so11085908pgl.11;
        Wed, 11 Sep 2019 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZjTHObEKixs8LSO1T9izKW4ihbkh6Q2u2Ly3Tz9PLw=;
        b=Yw4ZWghdqi+tilfwEq8eGDvup5cVDslChdBq8mdHBtOVrwOkhRsJb7E61qIe0Ud3Ge
         VzPLQVsnMHe8WsyiKX4wvt5pzZycp53UJnB+S5NpKAqckqz5LcIE5IAUHaDs2Do8QFw1
         5Rl6Bg/X1kiSaGlIn4TQBVEhmxpSP9DcmGrlCbcr3v3qLereTDbcGkHy15CJJwKGTtSD
         DCQ4WGJx1ntv0ELCXNJ0oB9MqWsJEWKFZaTxnA/iRQvH8ESsgKA9wjvRkrnZGBbaf6X+
         NhK1QAnorfTSviS7JLXUWuk1YYtvs9ZcAY+yetuBKLYHeHR24DOqkeNRatzEYTaBsS5Y
         RfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZjTHObEKixs8LSO1T9izKW4ihbkh6Q2u2Ly3Tz9PLw=;
        b=BNnPvHG28VhCYwzsXp9tCaw70rFDqZhUz6S3VlyIx8S0soJPnMJ33Q/cK6WrkbXRVV
         jrHnenIWCIwDF2iMy1gVRKHL0EsKy+x2e3qwZoczAjyRE/Yq/MpFmZh+SIyCmCjQBESB
         1RYvYwQWJhwshnqcNs7xfPtpMs5WA/AFIAlWafIUjGFIAoTh//NUHdl6pJgoIMqRvx2O
         r0ih1uHUitr+C97EGfRdruYtExPf0OBe4iaTibYdbRVsJZxIzOaFhoT4RTYUxjukyYNn
         lws9FNxDDF+Ye2SgqwR6it+GM0LnJ4E6SHaIiI3fRcfVQUagf4Cmgzi2NusYXsBNSYwD
         cCvA==
X-Gm-Message-State: APjAAAXrzrf7HAlhxaWcjn5LDffXYRBjZEPCHjXeJDgYM6vka2DRSUKc
        7sl5aRwl/v/Lfq2ggaGRCKc=
X-Google-Smtp-Source: APXvYqyfy5LHnZLdPp4PhaqHIf0Z/L0ZOO/vby33lSOxw+QjdTEMvTP56Yjd749vCj1i6F2wm1lt/A==
X-Received: by 2002:a63:4522:: with SMTP id s34mr31462544pga.362.1568188343074;
        Wed, 11 Sep 2019 00:52:23 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:22 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 03/11] gpiolib: introduce fwnode_gpiod_get_index()
Date:   Wed, 11 Sep 2019 00:52:07 -0700
Message-Id: <20190911075215.78047-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/gpio/gpiolib-devres.c | 16 +-----------
 drivers/gpio/gpiolib.c        | 48 +++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h | 13 ++++++++++
 3 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 190ce7c43b4e..693dcaf811bb 100644
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
index edc1ea68db20..f15e3880aae5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4314,6 +4314,54 @@ static int platform_gpio_count(struct device *dev, const char *con_id)
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
2.23.0.162.g0b9fbb3734-goog


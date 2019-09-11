Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E832AF731
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfIKHwb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39417 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfIKHwa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id i1so4304061pfa.6;
        Wed, 11 Sep 2019 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0mtFDbuxn1IOZpcxM11NR5KyKNmc2EZSsbKRNbTKgY=;
        b=CykovYYCJFbtebwlWICvDMJzoqPcbgpvsGwITSV6y3b8FIbS1do4wJZZRms1RWaZqa
         2p+YcSXvU36gBOx7g7zGJJ44eH54nekRMd0WF2Ymje7PQsHUnaUoMIWeF5dP0fAwmhVC
         ZwpxaPSPKF8hjWnGSpl+7yDlJ5RsPXxQC9Zp1BMB2NY1oGlpMCUg6jghADLX5GU/QZ7n
         pkYMLtm95Cu5J12ZS4xyxuZ7vgr0iAUUUposPu+Ji0t+D1JX/rGERbZ1nhNkfB3O55Vi
         FY4Uohsr+CPps9J8vMKmYJDaIGY1S1rejCM6RnUFT0sMqUKOWUj1WvcKQ13XzKPuYVJz
         B8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0mtFDbuxn1IOZpcxM11NR5KyKNmc2EZSsbKRNbTKgY=;
        b=GiA0UNqfQhb/MoPKWQrirMZ6mUS4eLAD3UWg7hE0O1e0VgLm4hXaIypb9TGNBn/+6L
         t56kEX9Q3F2bchtNO0j7hIjE8jAXZJviX1YbcS7dCzCV/IoAgDkFKueXhotcvmvXMiUn
         qJgX4pS6Sr/q+nPEt8CyXofcSUIt0gxqm89EmF0CqmKiJUqVn8wPDQ4vTkwHIpsyMum/
         4Lhj1ueKQvOSnAOpFisNZM3DLa7OHk1/qtYoS1+UAWWJiearl00jjBAHx+VI/brCAu/z
         sR8HhjDFsX1e4OfLQQ9hhmSKOreK9xdQwdlHENXLRopMhOeKsYwE8lqmEhcW9Gzv2jbG
         mb3Q==
X-Gm-Message-State: APjAAAWoLp6Nl8evGUi7iBd0Il2GEJa98M3sXu+H9xRuovR5AmEVqI4M
        uctD5hnxf79Fln8+XBUxCgM=
X-Google-Smtp-Source: APXvYqx3AbemSW3KwBi6m5s2E+P/uo/TESCr7naFP/MlL1ueVqjqu723RCisd4yivomsuqFjx+hP9Q==
X-Received: by 2002:a65:4489:: with SMTP id l9mr32580551pgq.207.1568188349075;
        Wed, 11 Sep 2019 00:52:29 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:28 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 08/11] gpiolib: of: tease apart of_find_gpio()
Date:   Wed, 11 Sep 2019 00:52:12 -0700
Message-Id: <20190911075215.78047-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tease apart of_find_gpio() into common function that works on the
firmware node, and a fallback handler that works on the device
structure, so that we can later use of_find_gpio() in
fwnode_gpiod_get_index().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/gpio/gpiolib-of.c | 149 +++++++++++++++++++-------------------
 drivers/gpio/gpiolib-of.h |  26 +++++--
 drivers/gpio/gpiolib.c    |   7 +-
 3 files changed, 99 insertions(+), 83 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8b773f7d7724..1d1a18e0ad93 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -276,6 +276,28 @@ int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 }
 EXPORT_SYMBOL(of_get_named_gpio_flags);
 
+static void of_gpio_flags_to_lookup(enum of_gpio_flags of_flags,
+				    unsigned long *flags)
+{
+	if (of_flags & OF_GPIO_ACTIVE_LOW)
+		*flags |= GPIO_ACTIVE_LOW;
+
+	if (of_flags & OF_GPIO_SINGLE_ENDED) {
+		if (of_flags & OF_GPIO_OPEN_DRAIN)
+			*flags |= GPIO_OPEN_DRAIN;
+		else
+			*flags |= GPIO_OPEN_SOURCE;
+	}
+
+	if (of_flags & OF_GPIO_TRANSITORY)
+		*flags |= GPIO_TRANSITORY;
+
+	if (of_flags & OF_GPIO_PULL_UP)
+		*flags |= GPIO_PULL_UP;
+	if (of_flags & OF_GPIO_PULL_DOWN)
+		*flags |= GPIO_PULL_DOWN;
+}
+
 /**
  * gpiod_get_from_of_node() - obtain a GPIO from an OF node
  * @node:	handle of the OF node
@@ -298,10 +320,6 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 	unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	struct gpio_desc *desc;
 	enum of_gpio_flags flags;
-	bool active_low = false;
-	bool single_ended = false;
-	bool open_drain = false;
-	bool transitory = false;
 	int ret;
 
 	desc = of_get_named_gpiod_flags(node, propname,
@@ -311,29 +329,13 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 		return desc;
 	}
 
-	active_low = flags & OF_GPIO_ACTIVE_LOW;
-	single_ended = flags & OF_GPIO_SINGLE_ENDED;
-	open_drain = flags & OF_GPIO_OPEN_DRAIN;
-	transitory = flags & OF_GPIO_TRANSITORY;
-
 	ret = gpiod_request(desc, label);
 	if (ret == -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
 		return desc;
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (active_low)
-		lflags |= GPIO_ACTIVE_LOW;
-
-	if (single_ended) {
-		if (open_drain)
-			lflags |= GPIO_OPEN_DRAIN;
-		else
-			lflags |= GPIO_OPEN_SOURCE;
-	}
-
-	if (transitory)
-		lflags |= GPIO_TRANSITORY;
+	of_gpio_flags_to_lookup(flags, &lflags);
 
 	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
 	if (ret < 0) {
@@ -345,6 +347,46 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 }
 EXPORT_SYMBOL(gpiod_get_from_of_node);
 
+static struct gpio_desc *of_find_node_gpio(struct device_node *np,
+					   const char *con_id, unsigned int idx,
+					   enum of_gpio_flags *of_flags)
+{
+	struct gpio_desc *desc;
+	char prop_name[32]; /* 32 is max size of property name */
+	unsigned int i;
+
+	/* Try GPIO property "foo-gpios" and "foo-gpio" */
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
+		if (con_id)
+			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
+				 gpio_suffixes[i]);
+		else
+			snprintf(prop_name, sizeof(prop_name), "%s",
+				 gpio_suffixes[i]);
+
+		desc = of_get_named_gpiod_flags(np, prop_name, idx, of_flags);
+		if (!IS_ERR(desc) || PTR_ERR(desc) != -ENOENT)
+			break;
+	}
+
+	return desc;
+}
+
+struct gpio_desc *of_find_gpio(struct fwnode_handle *fwnode,
+			       const char *con_id, unsigned int idx,
+			       unsigned long *flags)
+{
+	struct device_node *np = to_of_node(fwnode);
+	struct gpio_desc *desc;
+	enum of_gpio_flags of_flags;
+
+	desc = of_find_node_gpio(np, con_id, idx, &of_flags);
+	if (!IS_ERR(desc))
+		of_gpio_flags_to_lookup(of_flags, flags);
+
+	return desc;
+}
+
 /*
  * The SPI GPIO bindings happened before we managed to establish that GPIO
  * properties should be named "foo-gpios" so we have this special kludge for
@@ -383,7 +425,7 @@ static struct gpio_desc *of_find_spi_gpio(struct device *dev, const char *con_id
 static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
 					     const char *con_id,
 					     unsigned int idx,
-					     unsigned long *flags)
+					     enum of_gpio_flags *of_flags)
 {
 	struct device_node *np = dev->of_node;
 
@@ -403,7 +445,7 @@ static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
 	 * uses just "gpios" so translate to that when "cs-gpios" is
 	 * requested.
 	 */
-	return of_find_gpio(dev, NULL, idx, flags);
+	return of_find_node_gpio(dev->of_node, NULL, idx, of_flags);
 }
 
 /*
@@ -451,41 +493,18 @@ static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
 	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
 }
 
-struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
-			       unsigned int idx, unsigned long *flags)
+struct gpio_desc *of_find_gpio_fallback(struct device *dev,
+					const char *con_id, unsigned int idx,
+					unsigned long *flags)
 {
-	char prop_name[32]; /* 32 is max size of property name */
-	enum of_gpio_flags of_flags;
 	struct gpio_desc *desc;
-	unsigned int i;
-
-	/* Try GPIO property "foo-gpios" and "foo-gpio" */
-	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
-		if (con_id)
-			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
-				 gpio_suffixes[i]);
-		else
-			snprintf(prop_name, sizeof(prop_name), "%s",
-				 gpio_suffixes[i]);
-
-		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
-						&of_flags);
-
-		if (!IS_ERR(desc) || PTR_ERR(desc) != -ENOENT)
-			break;
-	}
+	enum of_gpio_flags of_flags;
 
-	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT) {
-		/* Special handling for SPI GPIOs if used */
-		desc = of_find_spi_gpio(dev, con_id, &of_flags);
-	}
+	/* Special handling for SPI GPIOs if used */
+	desc = of_find_spi_gpio(dev, con_id, &of_flags);
 
-	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT) {
-		/* This quirk looks up flags and all */
-		desc = of_find_spi_cs_gpio(dev, con_id, idx, flags);
-		if (!IS_ERR(desc))
-			return desc;
-	}
+	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
+		desc = of_find_spi_cs_gpio(dev, con_id, idx, &of_flags);
 
 	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT) {
 		/* Special handling for regulator GPIOs if used */
@@ -495,26 +514,8 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
 		desc = of_find_arizona_gpio(dev, con_id, &of_flags);
 
-	if (IS_ERR(desc))
-		return desc;
-
-	if (of_flags & OF_GPIO_ACTIVE_LOW)
-		*flags |= GPIO_ACTIVE_LOW;
-
-	if (of_flags & OF_GPIO_SINGLE_ENDED) {
-		if (of_flags & OF_GPIO_OPEN_DRAIN)
-			*flags |= GPIO_OPEN_DRAIN;
-		else
-			*flags |= GPIO_OPEN_SOURCE;
-	}
-
-	if (of_flags & OF_GPIO_TRANSITORY)
-		*flags |= GPIO_TRANSITORY;
-
-	if (of_flags & OF_GPIO_PULL_UP)
-		*flags |= GPIO_PULL_UP;
-	if (of_flags & OF_GPIO_PULL_DOWN)
-		*flags |= GPIO_PULL_DOWN;
+	if (!IS_ERR(desc))
+		of_gpio_flags_to_lookup(of_flags, flags);
 
 	return desc;
 }
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 454d1658ee2d..580539cd995f 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -3,14 +3,17 @@
 #ifndef GPIOLIB_OF_H
 #define GPIOLIB_OF_H
 
+struct fwnode_handle;
 struct gpio_chip;
 enum of_gpio_flags;
 
 #ifdef CONFIG_OF_GPIO
-struct gpio_desc *of_find_gpio(struct device *dev,
-			       const char *con_id,
-			       unsigned int idx,
-			       unsigned long *lookupflags);
+struct gpio_desc *of_find_gpio(struct fwnode_handle *fwnode,
+			       const char *con_id, unsigned int idx,
+			       unsigned long *flags);
+struct gpio_desc *of_find_gpio_fallback(struct device *dev,
+					const char *con_id, unsigned int idx,
+					unsigned long *flags);
 struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		   const char *list_name, int index, enum of_gpio_flags *flags);
 int of_gpiochip_add(struct gpio_chip *gc);
@@ -18,10 +21,17 @@ void of_gpiochip_remove(struct gpio_chip *gc);
 int of_gpio_get_count(struct device *dev, const char *con_id);
 bool of_gpio_need_valid_mask(const struct gpio_chip *gc);
 #else
-static inline struct gpio_desc *of_find_gpio(struct device *dev,
-					     const char *con_id,
-					     unsigned int idx,
-					     unsigned long *lookupflags)
+static inline
+struct gpio_desc *of_find_gpio(struct fwnode_handle *fwnode,
+			       const char *con_id, unsigned int idx,
+			       unsigned long *flags)
+{
+	return ERR_PTR(-ENOENT);
+}
+static inline
+struct gpio_desc *of_find_gpio_fallback(struct device *dev,
+					const char *con_id, unsigned int idx,
+					unsigned long *flags)
 {
 	return ERR_PTR(-ENOENT);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 54db2c42e9a0..1248e61f9a23 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4562,7 +4562,12 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		/* Using device tree? */
 		if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 			dev_dbg(dev, "using device tree for GPIO lookup\n");
-			desc = of_find_gpio(dev, con_id, idx, &lookupflags);
+			desc = of_find_gpio(dev_fwnode(dev),
+					    con_id, idx, &lookupflags);
+			if (desc == ERR_PTR(-ENOENT))
+				desc = of_find_gpio_fallback(dev, con_id, idx,
+							     &lookupflags);
+
 		} else if (ACPI_COMPANION(dev)) {
 			dev_dbg(dev, "using ACPI for GPIO lookup\n");
 			desc = acpi_find_gpio(dev, con_id, idx, &flags, &lookupflags);
-- 
2.23.0.162.g0b9fbb3734-goog


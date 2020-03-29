Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD26196DCD
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2020 16:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgC2OGR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Mar 2020 10:06:17 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45696 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgC2OGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Mar 2020 10:06:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id v4so11661485lfo.12
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2020 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ynbE1bcIxKvJsb1bvldmdJa/OmqE16JAg/L20Lq6jbM=;
        b=XPCq/hpfeMo9eMyaw6TGWpWIxu3+PwAJ48siMcApmwXiaeW+BxUvYXTyqjrQgmdkhu
         nGpt0IT/561qcjaezu/hJXMklTpVKUDjxMEJc0E6ZpaobUdvhv4dKRcEyCZ1K/idamYZ
         KSTr5aS4k/QEhPOjTQimONYKGE1cbIbWv7lKYLPiAdE0N79rat1PEKZJkKDPs49gAMjs
         j5Yx8GjU+ABxNNCavlyYa2jEMF2rL1/YCLA7cQnTKPaPQHncO0mQjzdVSNB0IbUKpEPy
         0Oq22WFAajfq1S53vFB8CAYVB9Tp0zjBCAr/j2sRvPXanfONOS1xRNrhBGw1Rb1PwaW+
         1BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ynbE1bcIxKvJsb1bvldmdJa/OmqE16JAg/L20Lq6jbM=;
        b=dtTowVCxryx4Xqg1TDi+MCIEW2u229NoYdofyGvyxXeAQfIpjJVZbYXIA078xOUUtS
         HD8MEqzWPo/J/MVMuxC5rR+HWHfD5u4ztOW3XpfMC0kgjZB6oabyIaltdDsDW9WFBln3
         hkcpzlz9MhPWQdCZUQ6bTJmU5yrfRg4OoyXH4/iz9lkWzAuE39IHedry827I6JzReQoY
         qYp1Op/nCMGAvk5lTmKLAjQVLJx9ueULvp3xqWnlZF2v8PgvwOrRYSt5VC4AYsVfHsx4
         VVN4jy8KSnsnxPMHri7DU2uwehU1flnnqibkk3xd36cBImrvnsGCZqO8xol6l1IKbUcX
         Phhg==
X-Gm-Message-State: AGi0PuYwTT8XkQV2IQYgix3GTKC3suVra5SMcJRPu6906is4BLwWZ05T
        euDqUzWrlII5GlN0FNrhuhngSbhfc8k/cw==
X-Google-Smtp-Source: APiQypJmf4xQaldUhjDP5tgda5RT00SHMK6GkXWzUSUbf9tEFo3bTRpNAiiH1j7PYBNbPfuAP24hcw==
X-Received: by 2002:ac2:4c3b:: with SMTP id u27mr5471212lfq.7.1585490768901;
        Sun, 29 Mar 2020 07:06:08 -0700 (PDT)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id d16sm1319938lfm.91.2020.03.29.07.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 07:06:07 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Rename variable in core APIs
Date:   Sun, 29 Mar 2020 16:04:05 +0200
Message-Id: <20200329140405.52276-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is struct gpio *gc, *chip and *gpiochip, and yes
I am responsible for some of the inconsistencies. I want
this to be just gc everywhere for minimizing cognitive
resistance when reading the code: more compact function
signatures and less clutter.

Purely syntactic changes intended. No semantic effects.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Planning to merge this right before the merge window so
we don't disturb any development in the next cycle.
---
 drivers/gpio/gpiolib.c      | 825 ++++++++++++++++++------------------
 include/linux/gpio/driver.h | 138 +++---
 2 files changed, 482 insertions(+), 481 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8acb0c96fa4c..4525cb0e7078 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -81,14 +81,14 @@ LIST_HEAD(gpio_devices);
 static DEFINE_MUTEX(gpio_machine_hogs_mutex);
 static LIST_HEAD(gpio_machine_hogs);
 
-static void gpiochip_free_hogs(struct gpio_chip *chip);
-static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
+static void gpiochip_free_hogs(struct gpio_chip *gc);
+static int gpiochip_add_irqchip(struct gpio_chip *gc,
 				struct lock_class_key *lock_key,
 				struct lock_class_key *request_key);
-static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
-static int gpiochip_irqchip_init_hw(struct gpio_chip *gpiochip);
-static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
-static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
+static void gpiochip_irqchip_remove(struct gpio_chip *gc);
+static int gpiochip_irqchip_init_hw(struct gpio_chip *gc);
+static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc);
+static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc);
 
 static bool gpiolib_initialized;
 
@@ -132,17 +132,17 @@ EXPORT_SYMBOL_GPL(gpio_to_desc);
 /**
  * gpiochip_get_desc - get the GPIO descriptor corresponding to the given
  *                     hardware number for this chip
- * @chip: GPIO chip
+ * @gc: GPIO chip
  * @hwnum: hardware number of the GPIO for this chip
  *
  * Returns:
  * A pointer to the GPIO descriptor or ``ERR_PTR(-EINVAL)`` if no GPIO exists
  * in the given chip for the specified hardware number.
  */
-struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
+struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc,
 				    unsigned int hwnum)
 {
-	struct gpio_device *gdev = chip->gpiodev;
+	struct gpio_device *gdev = gc->gpiodev;
 
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
@@ -213,11 +213,11 @@ static int gpiochip_find_base(int ngpio)
  */
 int gpiod_get_direction(struct gpio_desc *desc)
 {
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 	unsigned offset;
 	int ret;
 
-	chip = gpiod_to_chip(desc);
+	gc = gpiod_to_chip(desc);
 	offset = gpio_chip_hwgpio(desc);
 
 	/*
@@ -228,10 +228,10 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	    test_bit(FLAG_IS_OUT, &desc->flags))
 		return 0;
 
-	if (!chip->get_direction)
+	if (!gc->get_direction)
 		return -ENOTSUPP;
 
-	ret = chip->get_direction(chip, offset);
+	ret = gc->get_direction(gc, offset);
 	if (ret < 0)
 		return ret;
 
@@ -359,16 +359,16 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	return 0;
 }
 
-static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
+static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
 {
 	unsigned long *p;
 
-	p = bitmap_alloc(chip->ngpio, GFP_KERNEL);
+	p = bitmap_alloc(gc->ngpio, GFP_KERNEL);
 	if (!p)
 		return NULL;
 
 	/* Assume by default all GPIOs are valid */
-	bitmap_fill(p, chip->ngpio);
+	bitmap_fill(p, gc->ngpio);
 
 	return p;
 }
@@ -395,10 +395,10 @@ static int gpiochip_init_valid_mask(struct gpio_chip *gc)
 	return 0;
 }
 
-static void gpiochip_free_valid_mask(struct gpio_chip *gpiochip)
+static void gpiochip_free_valid_mask(struct gpio_chip *gc)
 {
-	bitmap_free(gpiochip->valid_mask);
-	gpiochip->valid_mask = NULL;
+	bitmap_free(gc->valid_mask);
+	gc->valid_mask = NULL;
 }
 
 static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
@@ -409,13 +409,13 @@ static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
 	return 0;
 }
 
-bool gpiochip_line_is_valid(const struct gpio_chip *gpiochip,
+bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
 	/* No mask means all valid */
-	if (likely(!gpiochip->valid_mask))
+	if (likely(!gc->valid_mask))
 		return true;
-	return test_bit(offset, gpiochip->valid_mask);
+	return test_bit(offset, gc->valid_mask);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 
@@ -1156,7 +1156,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 				  struct gpioline_info *info)
 {
-	struct gpio_chip *chip = desc->gdev->chip;
+	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -1185,7 +1185,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
 	    test_bit(FLAG_EXPORT, &desc->flags) ||
 	    test_bit(FLAG_SYSFS, &desc->flags) ||
-	    !pinctrl_gpio_can_use_line(chip->base + info->line_offset))
+	    !pinctrl_gpio_can_use_line(gc->base + info->line_offset))
 		info->flags |= GPIOLINE_FLAG_KERNEL;
 	if (test_bit(FLAG_IS_OUT, &desc->flags))
 		info->flags |= GPIOLINE_FLAG_IS_OUT;
@@ -1222,13 +1222,13 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct gpio_chardev_data *priv = filp->private_data;
 	struct gpio_device *gdev = priv->gdev;
-	struct gpio_chip *chip = gdev->chip;
+	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
 	struct gpio_desc *desc;
 	__u32 offset;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!chip)
+	if (!gc)
 		return -ENODEV;
 
 	/* Fill in the struct and pass to userspace */
@@ -1254,7 +1254,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
 
-		desc = gpiochip_get_desc(chip, lineinfo.line_offset);
+		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
@@ -1275,7 +1275,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
 
-		desc = gpiochip_get_desc(chip, offset);
+		desc = gpiochip_get_desc(gc, offset);
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
@@ -1518,12 +1518,12 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	return ret;
 }
 
-static void gpiochip_machine_hog(struct gpio_chip *chip, struct gpiod_hog *hog)
+static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
 {
 	struct gpio_desc *desc;
 	int rv;
 
-	desc = gpiochip_get_desc(chip, hog->chip_hwnum);
+	desc = gpiochip_get_desc(gc, hog->chip_hwnum);
 	if (IS_ERR(desc)) {
 		pr_err("%s: unable to get GPIO desc: %ld\n",
 		       __func__, PTR_ERR(desc));
@@ -1536,18 +1536,18 @@ static void gpiochip_machine_hog(struct gpio_chip *chip, struct gpiod_hog *hog)
 	rv = gpiod_hog(desc, hog->line_name, hog->lflags, hog->dflags);
 	if (rv)
 		pr_err("%s: unable to hog GPIO line (%s:%u): %d\n",
-		       __func__, chip->label, hog->chip_hwnum, rv);
+		       __func__, gc->label, hog->chip_hwnum, rv);
 }
 
-static void machine_gpiochip_add(struct gpio_chip *chip)
+static void machine_gpiochip_add(struct gpio_chip *gc)
 {
 	struct gpiod_hog *hog;
 
 	mutex_lock(&gpio_machine_hogs_mutex);
 
 	list_for_each_entry(hog, &gpio_machine_hogs, list) {
-		if (!strcmp(chip->label, hog->chip_label))
-			gpiochip_machine_hog(chip, hog);
+		if (!strcmp(gc->label, hog->chip_label))
+			gpiochip_machine_hog(gc, hog);
 	}
 
 	mutex_unlock(&gpio_machine_hogs_mutex);
@@ -1566,14 +1566,14 @@ static void gpiochip_setup_devs(void)
 	}
 }
 
-int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
+int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *lock_key,
 			       struct lock_class_key *request_key)
 {
 	unsigned long	flags;
 	int		ret = 0;
 	unsigned	i;
-	int		base = chip->base;
+	int		base = gc->base;
 	struct gpio_device *gdev;
 
 	/*
@@ -1584,19 +1584,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (!gdev)
 		return -ENOMEM;
 	gdev->dev.bus = &gpio_bus_type;
-	gdev->chip = chip;
-	chip->gpiodev = gdev;
-	if (chip->parent) {
-		gdev->dev.parent = chip->parent;
-		gdev->dev.of_node = chip->parent->of_node;
+	gdev->chip = gc;
+	gc->gpiodev = gdev;
+	if (gc->parent) {
+		gdev->dev.parent = gc->parent;
+		gdev->dev.of_node = gc->parent->of_node;
 	}
 
 #ifdef CONFIG_OF_GPIO
 	/* If the gpiochip has an assigned OF node this takes precedence */
-	if (chip->of_node)
-		gdev->dev.of_node = chip->of_node;
+	if (gc->of_node)
+		gdev->dev.of_node = gc->of_node;
 	else
-		chip->of_node = gdev->dev.of_node;
+		gc->of_node = gdev->dev.of_node;
 #endif
 
 	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
@@ -1607,37 +1607,37 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	device_initialize(&gdev->dev);
 	dev_set_drvdata(&gdev->dev, gdev);
-	if (chip->parent && chip->parent->driver)
-		gdev->owner = chip->parent->driver->owner;
-	else if (chip->owner)
+	if (gc->parent && gc->parent->driver)
+		gdev->owner = gc->parent->driver->owner;
+	else if (gc->owner)
 		/* TODO: remove chip->owner */
-		gdev->owner = chip->owner;
+		gdev->owner = gc->owner;
 	else
 		gdev->owner = THIS_MODULE;
 
-	gdev->descs = kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GFP_KERNEL);
+	gdev->descs = kcalloc(gc->ngpio, sizeof(gdev->descs[0]), GFP_KERNEL);
 	if (!gdev->descs) {
 		ret = -ENOMEM;
 		goto err_free_ida;
 	}
 
-	if (chip->ngpio == 0) {
-		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
+	if (gc->ngpio == 0) {
+		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
 		ret = -EINVAL;
 		goto err_free_descs;
 	}
 
-	if (chip->ngpio > FASTPATH_NGPIO)
-		chip_warn(chip, "line cnt %u is greater than fast path cnt %u\n",
-			  chip->ngpio, FASTPATH_NGPIO);
+	if (gc->ngpio > FASTPATH_NGPIO)
+		chip_warn(gc, "line cnt %u is greater than fast path cnt %u\n",
+			  gc->ngpio, FASTPATH_NGPIO);
 
-	gdev->label = kstrdup_const(chip->label ?: "unknown", GFP_KERNEL);
+	gdev->label = kstrdup_const(gc->label ?: "unknown", GFP_KERNEL);
 	if (!gdev->label) {
 		ret = -ENOMEM;
 		goto err_free_descs;
 	}
 
-	gdev->ngpio = chip->ngpio;
+	gdev->ngpio = gc->ngpio;
 	gdev->data = data;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -1650,7 +1650,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	 * of the sysfs interface anyways.
 	 */
 	if (base < 0) {
-		base = gpiochip_find_base(chip->ngpio);
+		base = gpiochip_find_base(gc->ngpio);
 		if (base < 0) {
 			ret = base;
 			spin_unlock_irqrestore(&gpio_lock, flags);
@@ -1662,7 +1662,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		 * see if anyone makes use of this, else drop this and assign
 		 * a poison instead.
 		 */
-		chip->base = base;
+		gc->base = base;
 	}
 	gdev->base = base;
 
@@ -1672,7 +1672,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		goto err_free_label;
 	}
 
-	for (i = 0; i < chip->ngpio; i++)
+	for (i = 0; i < gc->ngpio; i++)
 		gdev->descs[i].gdev = gdev;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
@@ -1683,51 +1683,51 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
 
-	ret = gpiochip_set_desc_names(chip);
+	ret = gpiochip_set_desc_names(gc);
 	if (ret)
 		goto err_remove_from_list;
 
-	ret = gpiochip_alloc_valid_mask(chip);
+	ret = gpiochip_alloc_valid_mask(gc);
 	if (ret)
 		goto err_remove_from_list;
 
-	ret = of_gpiochip_add(chip);
+	ret = of_gpiochip_add(gc);
 	if (ret)
 		goto err_free_gpiochip_mask;
 
-	ret = gpiochip_init_valid_mask(chip);
+	ret = gpiochip_init_valid_mask(gc);
 	if (ret)
 		goto err_remove_of_chip;
 
-	for (i = 0; i < chip->ngpio; i++) {
+	for (i = 0; i < gc->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
 
-		if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
+		if (gc->get_direction && gpiochip_line_is_valid(gc, i)) {
 			assign_bit(FLAG_IS_OUT,
-				   &desc->flags, !chip->get_direction(chip, i));
+				   &desc->flags, !gc->get_direction(gc, i));
 		} else {
 			assign_bit(FLAG_IS_OUT,
-				   &desc->flags, !chip->direction_input);
+				   &desc->flags, !gc->direction_input);
 		}
 	}
 
-	ret = gpiochip_add_pin_ranges(chip);
+	ret = gpiochip_add_pin_ranges(gc);
 	if (ret)
 		goto err_remove_of_chip;
 
-	acpi_gpiochip_add(chip);
+	acpi_gpiochip_add(gc);
 
-	machine_gpiochip_add(chip);
+	machine_gpiochip_add(gc);
 
-	ret = gpiochip_irqchip_init_valid_mask(chip);
+	ret = gpiochip_irqchip_init_valid_mask(gc);
 	if (ret)
 		goto err_remove_acpi_chip;
 
-	ret = gpiochip_irqchip_init_hw(chip);
+	ret = gpiochip_irqchip_init_hw(gc);
 	if (ret)
 		goto err_remove_acpi_chip;
 
-	ret = gpiochip_add_irqchip(chip, lock_key, request_key);
+	ret = gpiochip_add_irqchip(gc, lock_key, request_key);
 	if (ret)
 		goto err_remove_irqchip_mask;
 
@@ -1747,17 +1747,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	return 0;
 
 err_remove_irqchip:
-	gpiochip_irqchip_remove(chip);
+	gpiochip_irqchip_remove(gc);
 err_remove_irqchip_mask:
-	gpiochip_irqchip_free_valid_mask(chip);
+	gpiochip_irqchip_free_valid_mask(gc);
 err_remove_acpi_chip:
-	acpi_gpiochip_remove(chip);
+	acpi_gpiochip_remove(gc);
 err_remove_of_chip:
-	gpiochip_free_hogs(chip);
-	of_gpiochip_remove(chip);
+	gpiochip_free_hogs(gc);
+	of_gpiochip_remove(gc);
 err_free_gpiochip_mask:
-	gpiochip_remove_pin_ranges(chip);
-	gpiochip_free_valid_mask(chip);
+	gpiochip_remove_pin_ranges(gc);
+	gpiochip_free_valid_mask(gc);
 err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&gdev->list);
@@ -1772,7 +1772,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
 	       gdev->base, gdev->base + gdev->ngpio - 1,
-	       chip->label ? : "generic", ret);
+	       gc->label ? : "generic", ret);
 	kfree(gdev);
 	return ret;
 }
@@ -1780,39 +1780,39 @@ EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
 
 /**
  * gpiochip_get_data() - get per-subdriver data for the chip
- * @chip: GPIO chip
+ * @gc: GPIO chip
  *
  * Returns:
  * The per-subdriver data for the chip.
  */
-void *gpiochip_get_data(struct gpio_chip *chip)
+void *gpiochip_get_data(struct gpio_chip *gc)
 {
-	return chip->gpiodev->data;
+	return gc->gpiodev->data;
 }
 EXPORT_SYMBOL_GPL(gpiochip_get_data);
 
 /**
  * gpiochip_remove() - unregister a gpio_chip
- * @chip: the chip to unregister
+ * @gc: the chip to unregister
  *
  * A gpio_chip with any GPIOs still requested may not be removed.
  */
-void gpiochip_remove(struct gpio_chip *chip)
+void gpiochip_remove(struct gpio_chip *gc)
 {
-	struct gpio_device *gdev = chip->gpiodev;
+	struct gpio_device *gdev = gc->gpiodev;
 	unsigned long	flags;
 	unsigned int	i;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
-	gpiochip_free_hogs(chip);
+	gpiochip_free_hogs(gc);
 	/* Numb the device, cancelling all outstanding operations */
 	gdev->chip = NULL;
-	gpiochip_irqchip_remove(chip);
-	acpi_gpiochip_remove(chip);
-	of_gpiochip_remove(chip);
-	gpiochip_remove_pin_ranges(chip);
-	gpiochip_free_valid_mask(chip);
+	gpiochip_irqchip_remove(gc);
+	acpi_gpiochip_remove(gc);
+	of_gpiochip_remove(gc);
+	gpiochip_remove_pin_ranges(gc);
+	gpiochip_free_valid_mask(gc);
 	/*
 	 * We accept no more calls into the driver from this point, so
 	 * NULL the driver data pointer
@@ -1821,7 +1821,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	for (i = 0; i < gdev->ngpio; i++) {
-		if (gpiochip_is_requested(chip, i))
+		if (gpiochip_is_requested(gc, i))
 			break;
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
@@ -1853,31 +1853,31 @@ EXPORT_SYMBOL_GPL(gpiochip_remove);
  * more gpio_chips.
  */
 struct gpio_chip *gpiochip_find(void *data,
-				int (*match)(struct gpio_chip *chip,
+				int (*match)(struct gpio_chip *gc,
 					     void *data))
 {
 	struct gpio_device *gdev;
-	struct gpio_chip *chip = NULL;
+	struct gpio_chip *gc = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(gdev, &gpio_devices, list)
 		if (gdev->chip && match(gdev->chip, data)) {
-			chip = gdev->chip;
+			gc = gdev->chip;
 			break;
 		}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	return chip;
+	return gc;
 }
 EXPORT_SYMBOL_GPL(gpiochip_find);
 
-static int gpiochip_match_name(struct gpio_chip *chip, void *data)
+static int gpiochip_match_name(struct gpio_chip *gc, void *data)
 {
 	const char *name = data;
 
-	return !strcmp(chip->label, name);
+	return !strcmp(gc->label, name);
 }
 
 static struct gpio_chip *find_chip_by_name(const char *name)
@@ -1917,21 +1917,21 @@ static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc)
 	return 0;
 }
 
-static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
+static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
 {
-	bitmap_free(gpiochip->irq.valid_mask);
-	gpiochip->irq.valid_mask = NULL;
+	bitmap_free(gc->irq.valid_mask);
+	gc->irq.valid_mask = NULL;
 }
 
-bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
+bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
-	if (!gpiochip_line_is_valid(gpiochip, offset))
+	if (!gpiochip_line_is_valid(gc, offset))
 		return false;
 	/* No mask means all valid */
-	if (likely(!gpiochip->irq.valid_mask))
+	if (likely(!gc->irq.valid_mask))
 		return true;
-	return test_bit(offset, gpiochip->irq.valid_mask);
+	return test_bit(offset, gc->irq.valid_mask);
 }
 EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
 
@@ -1983,16 +1983,16 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gc,
 
 /**
  * gpiochip_set_nested_irqchip() - connects a nested irqchip to a gpiochip
- * @gpiochip: the gpiochip to set the irqchip nested handler to
+ * @gc: the gpiochip to set the irqchip nested handler to
  * @irqchip: the irqchip to nest to the gpiochip
  * @parent_irq: the irq number corresponding to the parent IRQ for this
  * nested irqchip
  */
-void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
+void gpiochip_set_nested_irqchip(struct gpio_chip *gc,
 				 struct irq_chip *irqchip,
 				 unsigned int parent_irq)
 {
-	gpiochip_set_cascaded_irqchip(gpiochip, parent_irq, NULL);
+	gpiochip_set_cascaded_irqchip(gc, parent_irq, NULL);
 }
 EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
 
@@ -2169,7 +2169,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	return ret;
 }
 
-static unsigned int gpiochip_child_offset_to_irq_noop(struct gpio_chip *chip,
+static unsigned int gpiochip_child_offset_to_irq_noop(struct gpio_chip *gc,
 						      unsigned int offset)
 {
 	return offset;
@@ -2229,7 +2229,7 @@ static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
 	return !!gc->irq.parent_domain;
 }
 
-void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,
 					     unsigned int parent_hwirq,
 					     unsigned int parent_type)
 {
@@ -2239,7 +2239,7 @@ void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
 	if (!fwspec)
 		return NULL;
 
-	fwspec->fwnode = chip->irq.parent_domain->fwnode;
+	fwspec->fwnode = gc->irq.parent_domain->fwnode;
 	fwspec->param_count = 2;
 	fwspec->param[0] = parent_hwirq;
 	fwspec->param[1] = parent_type;
@@ -2248,7 +2248,7 @@ void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
 }
 EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_twocell);
 
-void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *gc,
 					      unsigned int parent_hwirq,
 					      unsigned int parent_type)
 {
@@ -2258,7 +2258,7 @@ void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
 	if (!fwspec)
 		return NULL;
 
-	fwspec->fwnode = chip->irq.parent_domain->fwnode;
+	fwspec->fwnode = gc->irq.parent_domain->fwnode;
 	fwspec->param_count = 4;
 	fwspec->param[0] = 0;
 	fwspec->param[1] = parent_hwirq;
@@ -2296,28 +2296,28 @@ static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
 int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq)
 {
-	struct gpio_chip *chip = d->host_data;
+	struct gpio_chip *gc = d->host_data;
 	int ret = 0;
 
-	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
+	if (!gpiochip_irqchip_irq_valid(gc, hwirq))
 		return -ENXIO;
 
-	irq_set_chip_data(irq, chip);
+	irq_set_chip_data(irq, gc);
 	/*
 	 * This lock class tells lockdep that GPIO irqs are in a different
 	 * category than their parents, so it won't report false recursion.
 	 */
-	irq_set_lockdep_class(irq, chip->irq.lock_key, chip->irq.request_key);
-	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
+	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
+	irq_set_chip_and_handler(irq, gc->irq.chip, gc->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
-	if (chip->irq.threaded)
+	if (gc->irq.threaded)
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
-	if (chip->irq.num_parents == 1)
-		ret = irq_set_parent(irq, chip->irq.parents[0]);
-	else if (chip->irq.map)
-		ret = irq_set_parent(irq, chip->irq.map[hwirq]);
+	if (gc->irq.num_parents == 1)
+		ret = irq_set_parent(irq, gc->irq.parents[0]);
+	else if (gc->irq.map)
+		ret = irq_set_parent(irq, gc->irq.map[hwirq]);
 
 	if (ret < 0)
 		return ret;
@@ -2326,8 +2326,8 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
 	 * is passed as default type.
 	 */
-	if (chip->irq.default_type != IRQ_TYPE_NONE)
-		irq_set_irq_type(irq, chip->irq.default_type);
+	if (gc->irq.default_type != IRQ_TYPE_NONE)
+		irq_set_irq_type(irq, gc->irq.default_type);
 
 	return 0;
 }
@@ -2335,9 +2335,9 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_map);
 
 void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
-	struct gpio_chip *chip = d->host_data;
+	struct gpio_chip *gc = d->host_data;
 
-	if (chip->irq.threaded)
+	if (gc->irq.threaded)
 		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
@@ -2369,9 +2369,9 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
 int gpiochip_irq_domain_activate(struct irq_domain *domain,
 				 struct irq_data *data, bool reserve)
 {
-	struct gpio_chip *chip = domain->host_data;
+	struct gpio_chip *gc = domain->host_data;
 
-	return gpiochip_lock_as_irq(chip, data->hwirq);
+	return gpiochip_lock_as_irq(gc, data->hwirq);
 }
 EXPORT_SYMBOL_GPL(gpiochip_irq_domain_activate);
 
@@ -2387,17 +2387,17 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_activate);
 void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 				    struct irq_data *data)
 {
-	struct gpio_chip *chip = domain->host_data;
+	struct gpio_chip *gc = domain->host_data;
 
-	return gpiochip_unlock_as_irq(chip, data->hwirq);
+	return gpiochip_unlock_as_irq(gc, data->hwirq);
 }
 EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
-static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
+static int gpiochip_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct irq_domain *domain = chip->irq.domain;
+	struct irq_domain *domain = gc->irq.domain;
 
-	if (!gpiochip_irqchip_irq_valid(chip, offset))
+	if (!gpiochip_irqchip_irq_valid(gc, offset))
 		return -ENXIO;
 
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
@@ -2406,7 +2406,7 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 
 		spec.fwnode = domain->fwnode;
 		spec.param_count = 2;
-		spec.param[0] = chip->irq.child_offset_to_irq(chip, offset);
+		spec.param[0] = gc->irq.child_offset_to_irq(gc, offset);
 		spec.param[1] = IRQ_TYPE_NONE;
 
 		return irq_create_fwspec_mapping(&spec);
@@ -2418,50 +2418,50 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 
 static int gpiochip_irq_reqres(struct irq_data *d)
 {
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	return gpiochip_reqres_irq(chip, d->hwirq);
+	return gpiochip_reqres_irq(gc, d->hwirq);
 }
 
 static void gpiochip_irq_relres(struct irq_data *d)
 {
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	gpiochip_relres_irq(chip, d->hwirq);
+	gpiochip_relres_irq(gc, d->hwirq);
 }
 
 static void gpiochip_irq_enable(struct irq_data *d)
 {
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	gpiochip_enable_irq(chip, d->hwirq);
-	if (chip->irq.irq_enable)
-		chip->irq.irq_enable(d);
+	gpiochip_enable_irq(gc, d->hwirq);
+	if (gc->irq.irq_enable)
+		gc->irq.irq_enable(d);
 	else
-		chip->irq.chip->irq_unmask(d);
+		gc->irq.chip->irq_unmask(d);
 }
 
 static void gpiochip_irq_disable(struct irq_data *d)
 {
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	if (chip->irq.irq_disable)
-		chip->irq.irq_disable(d);
+	if (gc->irq.irq_disable)
+		gc->irq.irq_disable(d);
 	else
-		chip->irq.chip->irq_mask(d);
-	gpiochip_disable_irq(chip, d->hwirq);
+		gc->irq.chip->irq_mask(d);
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
-static void gpiochip_set_irq_hooks(struct gpio_chip *gpiochip)
+static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
 {
-	struct irq_chip *irqchip = gpiochip->irq.chip;
+	struct irq_chip *irqchip = gc->irq.chip;
 
 	if (!irqchip->irq_request_resources &&
 	    !irqchip->irq_release_resources) {
 		irqchip->irq_request_resources = gpiochip_irq_reqres;
 		irqchip->irq_release_resources = gpiochip_irq_relres;
 	}
-	if (WARN_ON(gpiochip->irq.irq_enable))
+	if (WARN_ON(gc->irq.irq_enable))
 		return;
 	/* Check if the irqchip already has this hook... */
 	if (irqchip->irq_enable == gpiochip_irq_enable) {
@@ -2469,27 +2469,27 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gpiochip)
 		 * ...and if so, give a gentle warning that this is bad
 		 * practice.
 		 */
-		chip_info(gpiochip,
+		chip_info(gc,
 			  "detected irqchip that is shared with multiple gpiochips: please fix the driver.\n");
 		return;
 	}
-	gpiochip->irq.irq_enable = irqchip->irq_enable;
-	gpiochip->irq.irq_disable = irqchip->irq_disable;
+	gc->irq.irq_enable = irqchip->irq_enable;
+	gc->irq.irq_disable = irqchip->irq_disable;
 	irqchip->irq_enable = gpiochip_irq_enable;
 	irqchip->irq_disable = gpiochip_irq_disable;
 }
 
 /**
  * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
- * @gpiochip: the GPIO chip to add the IRQ chip to
+ * @gc: the GPIO chip to add the IRQ chip to
  * @lock_key: lockdep class for IRQ lock
  * @request_key: lockdep class for IRQ request
  */
-static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
+static int gpiochip_add_irqchip(struct gpio_chip *gc,
 				struct lock_class_key *lock_key,
 				struct lock_class_key *request_key)
 {
-	struct irq_chip *irqchip = gpiochip->irq.chip;
+	struct irq_chip *irqchip = gc->irq.chip;
 	const struct irq_domain_ops *ops = NULL;
 	struct device_node *np;
 	unsigned int type;
@@ -2498,13 +2498,13 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 	if (!irqchip)
 		return 0;
 
-	if (gpiochip->irq.parent_handler && gpiochip->can_sleep) {
-		chip_err(gpiochip, "you cannot have chained interrupts on a chip that may sleep\n");
+	if (gc->irq.parent_handler && gc->can_sleep) {
+		chip_err(gc, "you cannot have chained interrupts on a chip that may sleep\n");
 		return -EINVAL;
 	}
 
-	np = gpiochip->gpiodev->dev.of_node;
-	type = gpiochip->irq.default_type;
+	np = gc->gpiodev->dev.of_node;
+	type = gc->irq.default_type;
 
 	/*
 	 * Specifying a default trigger is a terrible idea if DT or ACPI is
@@ -2515,74 +2515,74 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 		 "%s: Ignoring %u default trigger\n", np->full_name, type))
 		type = IRQ_TYPE_NONE;
 
-	if (has_acpi_companion(gpiochip->parent) && type != IRQ_TYPE_NONE) {
-		acpi_handle_warn(ACPI_HANDLE(gpiochip->parent),
+	if (has_acpi_companion(gc->parent) && type != IRQ_TYPE_NONE) {
+		acpi_handle_warn(ACPI_HANDLE(gc->parent),
 				 "Ignoring %u default trigger\n", type);
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->to_irq = gpiochip_to_irq;
-	gpiochip->irq.default_type = type;
-	gpiochip->irq.lock_key = lock_key;
-	gpiochip->irq.request_key = request_key;
+	gc->to_irq = gpiochip_to_irq;
+	gc->irq.default_type = type;
+	gc->irq.lock_key = lock_key;
+	gc->irq.request_key = request_key;
 
 	/* If a parent irqdomain is provided, let's build a hierarchy */
-	if (gpiochip_hierarchy_is_hierarchical(gpiochip)) {
-		int ret = gpiochip_hierarchy_add_domain(gpiochip);
+	if (gpiochip_hierarchy_is_hierarchical(gc)) {
+		int ret = gpiochip_hierarchy_add_domain(gc);
 		if (ret)
 			return ret;
 	} else {
 		/* Some drivers provide custom irqdomain ops */
-		if (gpiochip->irq.domain_ops)
-			ops = gpiochip->irq.domain_ops;
+		if (gc->irq.domain_ops)
+			ops = gc->irq.domain_ops;
 
 		if (!ops)
 			ops = &gpiochip_domain_ops;
-		gpiochip->irq.domain = irq_domain_add_simple(np,
-			gpiochip->ngpio,
-			gpiochip->irq.first,
-			ops, gpiochip);
-		if (!gpiochip->irq.domain)
+		gc->irq.domain = irq_domain_add_simple(np,
+			gc->ngpio,
+			gc->irq.first,
+			ops, gc);
+		if (!gc->irq.domain)
 			return -EINVAL;
 	}
 
-	if (gpiochip->irq.parent_handler) {
-		void *data = gpiochip->irq.parent_handler_data ?: gpiochip;
+	if (gc->irq.parent_handler) {
+		void *data = gc->irq.parent_handler_data ?: gc;
 
-		for (i = 0; i < gpiochip->irq.num_parents; i++) {
+		for (i = 0; i < gc->irq.num_parents; i++) {
 			/*
 			 * The parent IRQ chip is already using the chip_data
 			 * for this IRQ chip, so our callbacks simply use the
 			 * handler_data.
 			 */
-			irq_set_chained_handler_and_data(gpiochip->irq.parents[i],
-							 gpiochip->irq.parent_handler,
+			irq_set_chained_handler_and_data(gc->irq.parents[i],
+							 gc->irq.parent_handler,
 							 data);
 		}
 	}
 
-	gpiochip_set_irq_hooks(gpiochip);
+	gpiochip_set_irq_hooks(gc);
 
-	acpi_gpiochip_request_interrupts(gpiochip);
+	acpi_gpiochip_request_interrupts(gc);
 
 	return 0;
 }
 
 /**
  * gpiochip_irqchip_remove() - removes an irqchip added to a gpiochip
- * @gpiochip: the gpiochip to remove the irqchip from
+ * @gc: the gpiochip to remove the irqchip from
  *
  * This is called only from gpiochip_remove()
  */
-static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
+static void gpiochip_irqchip_remove(struct gpio_chip *gc)
 {
-	struct irq_chip *irqchip = gpiochip->irq.chip;
+	struct irq_chip *irqchip = gc->irq.chip;
 	unsigned int offset;
 
-	acpi_gpiochip_free_interrupts(gpiochip);
+	acpi_gpiochip_free_interrupts(gc);
 
-	if (irqchip && gpiochip->irq.parent_handler) {
-		struct gpio_irq_chip *irq = &gpiochip->irq;
+	if (irqchip && gc->irq.parent_handler) {
+		struct gpio_irq_chip *irq = &gc->irq;
 		unsigned int i;
 
 		for (i = 0; i < irq->num_parents; i++)
@@ -2591,18 +2591,18 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 	}
 
 	/* Remove all IRQ mappings and delete the domain */
-	if (gpiochip->irq.domain) {
+	if (gc->irq.domain) {
 		unsigned int irq;
 
-		for (offset = 0; offset < gpiochip->ngpio; offset++) {
-			if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
+		for (offset = 0; offset < gc->ngpio; offset++) {
+			if (!gpiochip_irqchip_irq_valid(gc, offset))
 				continue;
 
-			irq = irq_find_mapping(gpiochip->irq.domain, offset);
+			irq = irq_find_mapping(gc->irq.domain, offset);
 			irq_dispose_mapping(irq);
 		}
 
-		irq_domain_remove(gpiochip->irq.domain);
+		irq_domain_remove(gc->irq.domain);
 	}
 
 	if (irqchip) {
@@ -2611,20 +2611,20 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 			irqchip->irq_release_resources = NULL;
 		}
 		if (irqchip->irq_enable == gpiochip_irq_enable) {
-			irqchip->irq_enable = gpiochip->irq.irq_enable;
-			irqchip->irq_disable = gpiochip->irq.irq_disable;
+			irqchip->irq_enable = gc->irq.irq_enable;
+			irqchip->irq_disable = gc->irq.irq_disable;
 		}
 	}
-	gpiochip->irq.irq_enable = NULL;
-	gpiochip->irq.irq_disable = NULL;
-	gpiochip->irq.chip = NULL;
+	gc->irq.irq_enable = NULL;
+	gc->irq.irq_disable = NULL;
+	gc->irq.chip = NULL;
 
-	gpiochip_irqchip_free_valid_mask(gpiochip);
+	gpiochip_irqchip_free_valid_mask(gc);
 }
 
 /**
  * gpiochip_irqchip_add_key() - adds an irqchip to a gpiochip
- * @gpiochip: the gpiochip to add the irqchip to
+ * @gc: the gpiochip to add the irqchip to
  * @irqchip: the irqchip to add to the gpiochip
  * @first_irq: if not dynamically assigned, the base (first) IRQ to
  * allocate gpiochip irqs from
@@ -2649,7 +2649,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
  * the pins on the gpiochip can generate a unique IRQ. Everything else
  * need to be open coded.
  */
-int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
+int gpiochip_irqchip_add_key(struct gpio_chip *gc,
 			     struct irq_chip *irqchip,
 			     unsigned int first_irq,
 			     irq_flow_handler_t handler,
@@ -2660,23 +2660,23 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 {
 	struct device_node *of_node;
 
-	if (!gpiochip || !irqchip)
+	if (!gc || !irqchip)
 		return -EINVAL;
 
-	if (!gpiochip->parent) {
+	if (!gc->parent) {
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
-	gpiochip->irq.threaded = threaded;
-	of_node = gpiochip->parent->of_node;
+	gc->irq.threaded = threaded;
+	of_node = gc->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
 	 * If the gpiochip has an assigned OF node this takes precedence
-	 * FIXME: get rid of this and use gpiochip->parent->of_node
+	 * FIXME: get rid of this and use gc->parent->of_node
 	 * everywhere
 	 */
-	if (gpiochip->of_node)
-		of_node = gpiochip->of_node;
+	if (gc->of_node)
+		of_node = gc->of_node;
 #endif
 	/*
 	 * Specifying a default trigger is a terrible idea if DT or ACPI is
@@ -2686,29 +2686,29 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	if (WARN(of_node && type != IRQ_TYPE_NONE,
 		 "%pOF: Ignoring %d default trigger\n", of_node, type))
 		type = IRQ_TYPE_NONE;
-	if (has_acpi_companion(gpiochip->parent) && type != IRQ_TYPE_NONE) {
-		acpi_handle_warn(ACPI_HANDLE(gpiochip->parent),
+	if (has_acpi_companion(gc->parent) && type != IRQ_TYPE_NONE) {
+		acpi_handle_warn(ACPI_HANDLE(gc->parent),
 				 "Ignoring %d default trigger\n", type);
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->irq.chip = irqchip;
-	gpiochip->irq.handler = handler;
-	gpiochip->irq.default_type = type;
-	gpiochip->to_irq = gpiochip_to_irq;
-	gpiochip->irq.lock_key = lock_key;
-	gpiochip->irq.request_key = request_key;
-	gpiochip->irq.domain = irq_domain_add_simple(of_node,
-					gpiochip->ngpio, first_irq,
-					&gpiochip_domain_ops, gpiochip);
-	if (!gpiochip->irq.domain) {
-		gpiochip->irq.chip = NULL;
+	gc->irq.chip = irqchip;
+	gc->irq.handler = handler;
+	gc->irq.default_type = type;
+	gc->to_irq = gpiochip_to_irq;
+	gc->irq.lock_key = lock_key;
+	gc->irq.request_key = request_key;
+	gc->irq.domain = irq_domain_add_simple(of_node,
+					gc->ngpio, first_irq,
+					&gpiochip_domain_ops, gc);
+	if (!gc->irq.domain) {
+		gc->irq.chip = NULL;
 		return -EINVAL;
 	}
 
-	gpiochip_set_irq_hooks(gpiochip);
+	gpiochip_set_irq_hooks(gc);
 
-	acpi_gpiochip_request_interrupts(gpiochip);
+	acpi_gpiochip_request_interrupts(gc);
 
 	return 0;
 }
@@ -2716,37 +2716,37 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
-static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
+static inline int gpiochip_add_irqchip(struct gpio_chip *gc,
 				       struct lock_class_key *lock_key,
 				       struct lock_class_key *request_key)
 {
 	return 0;
 }
-static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
+static void gpiochip_irqchip_remove(struct gpio_chip *gc) {}
 
-static inline int gpiochip_irqchip_init_hw(struct gpio_chip *gpiochip)
+static inline int gpiochip_irqchip_init_hw(struct gpio_chip *gc)
 {
 	return 0;
 }
 
-static inline int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
+static inline int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc)
 {
 	return 0;
 }
-static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
+static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
 { }
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
 /**
  * gpiochip_generic_request() - request the gpio function for a pin
- * @chip: the gpiochip owning the GPIO
+ * @gc: the gpiochip owning the GPIO
  * @offset: the offset of the GPIO to request for GPIO function
  */
-int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
 {
-	if (!list_empty(&chip->gpiodev->pin_ranges))
-		return pinctrl_gpio_request(chip->gpiodev->base + offset);
+	if (!list_empty(&gc->gpiodev->pin_ranges))
+		return pinctrl_gpio_request(gc->gpiodev->base + offset);
 
 	return 0;
 }
@@ -2754,25 +2754,25 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
 /**
  * gpiochip_generic_free() - free the gpio function from a pin
- * @chip: the gpiochip to request the gpio function for
+ * @gc: the gpiochip to request the gpio function for
  * @offset: the offset of the GPIO to free from GPIO function
  */
-void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset)
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
 {
-	pinctrl_gpio_free(chip->gpiodev->base + offset);
+	pinctrl_gpio_free(gc->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 
 /**
  * gpiochip_generic_config() - apply configuration for a pin
- * @chip: the gpiochip owning the GPIO
+ * @gc: the gpiochip owning the GPIO
  * @offset: the offset of the GPIO to apply the configuration
  * @config: the configuration to be applied
  */
-int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
 			    unsigned long config)
 {
-	return pinctrl_gpio_set_config(chip->gpiodev->base + offset, config);
+	return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
@@ -2780,7 +2780,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
 /**
  * gpiochip_add_pingroup_range() - add a range for GPIO <-> pin mapping
- * @chip: the gpiochip to add the range for
+ * @gc: the gpiochip to add the range for
  * @pctldev: the pin controller to map to
  * @gpio_offset: the start offset in the current gpio_chip number space
  * @pin_group: name of the pin group inside the pin controller
@@ -2790,24 +2790,24 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_config);
  * Documentation/devicetree/bindings/gpio/gpio.txt on how to
  * bind pinctrl and gpio drivers via the "gpio-ranges" property.
  */
-int gpiochip_add_pingroup_range(struct gpio_chip *chip,
+int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,
 			unsigned int gpio_offset, const char *pin_group)
 {
 	struct gpio_pin_range *pin_range;
-	struct gpio_device *gdev = chip->gpiodev;
+	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
 	if (!pin_range) {
-		chip_err(chip, "failed to allocate pin ranges\n");
+		chip_err(gc, "failed to allocate pin ranges\n");
 		return -ENOMEM;
 	}
 
 	/* Use local offset as range ID */
 	pin_range->range.id = gpio_offset;
-	pin_range->range.gc = chip;
-	pin_range->range.name = chip->label;
+	pin_range->range.gc = gc;
+	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->pctldev = pctldev;
 
@@ -2821,7 +2821,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 
 	pinctrl_add_gpio_range(pctldev, &pin_range->range);
 
-	chip_dbg(chip, "created GPIO range %d->%d ==> %s PINGRP %s\n",
+	chip_dbg(gc, "created GPIO range %d->%d ==> %s PINGRP %s\n",
 		 gpio_offset, gpio_offset + pin_range->range.npins - 1,
 		 pinctrl_dev_get_devname(pctldev), pin_group);
 
@@ -2833,7 +2833,7 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
 
 /**
  * gpiochip_add_pin_range() - add a range for GPIO <-> pin mapping
- * @chip: the gpiochip to add the range for
+ * @gc: the gpiochip to add the range for
  * @pinctl_name: the dev_name() of the pin controller to map to
  * @gpio_offset: the start offset in the current gpio_chip number space
  * @pin_offset: the start offset in the pin controller number space
@@ -2848,24 +2848,24 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
  * Documentation/devicetree/bindings/gpio/gpio.txt on how to
  * bind pinctrl and gpio drivers via the "gpio-ranges" property.
  */
-int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
+int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
 			   unsigned int npins)
 {
 	struct gpio_pin_range *pin_range;
-	struct gpio_device *gdev = chip->gpiodev;
+	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
 	pin_range = kzalloc(sizeof(*pin_range), GFP_KERNEL);
 	if (!pin_range) {
-		chip_err(chip, "failed to allocate pin ranges\n");
+		chip_err(gc, "failed to allocate pin ranges\n");
 		return -ENOMEM;
 	}
 
 	/* Use local offset as range ID */
 	pin_range->range.id = gpio_offset;
-	pin_range->range.gc = chip;
-	pin_range->range.name = chip->label;
+	pin_range->range.gc = gc;
+	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
 	pin_range->range.npins = npins;
@@ -2873,11 +2873,11 @@ int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 			&pin_range->range);
 	if (IS_ERR(pin_range->pctldev)) {
 		ret = PTR_ERR(pin_range->pctldev);
-		chip_err(chip, "could not create pin range\n");
+		chip_err(gc, "could not create pin range\n");
 		kfree(pin_range);
 		return ret;
 	}
-	chip_dbg(chip, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
+	chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
 		 gpio_offset, gpio_offset + npins - 1,
 		 pinctl_name,
 		 pin_offset, pin_offset + npins - 1);
@@ -2890,12 +2890,12 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pin_range);
 
 /**
  * gpiochip_remove_pin_ranges() - remove all the GPIO <-> pin mappings
- * @chip: the chip to remove all the mappings for
+ * @gc: the chip to remove all the mappings for
  */
-void gpiochip_remove_pin_ranges(struct gpio_chip *chip)
+void gpiochip_remove_pin_ranges(struct gpio_chip *gc)
 {
 	struct gpio_pin_range *pin_range, *tmp;
-	struct gpio_device *gdev = chip->gpiodev;
+	struct gpio_device *gdev = gc->gpiodev;
 
 	list_for_each_entry_safe(pin_range, tmp, &gdev->pin_ranges, node) {
 		list_del(&pin_range->node);
@@ -2914,7 +2914,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
  */
 static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
-	struct gpio_chip	*chip = desc->gdev->chip;
+	struct gpio_chip	*gc = desc->gdev->chip;
 	int			ret;
 	unsigned long		flags;
 	unsigned		offset;
@@ -2940,12 +2940,12 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 		goto done;
 	}
 
-	if (chip->request) {
-		/* chip->request may sleep */
+	if (gc->request) {
+		/* gc->request may sleep */
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		offset = gpio_chip_hwgpio(desc);
-		if (gpiochip_line_is_valid(chip, offset))
-			ret = chip->request(chip, offset);
+		if (gpiochip_line_is_valid(gc, offset))
+			ret = gc->request(gc, offset);
 		else
 			ret = -EINVAL;
 		spin_lock_irqsave(&gpio_lock, flags);
@@ -2957,8 +2957,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 			goto done;
 		}
 	}
-	if (chip->get_direction) {
-		/* chip->get_direction may sleep */
+	if (gc->get_direction) {
+		/* gc->get_direction may sleep */
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		gpiod_get_direction(desc);
 		spin_lock_irqsave(&gpio_lock, flags);
@@ -3034,7 +3034,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 {
 	bool			ret = false;
 	unsigned long		flags;
-	struct gpio_chip	*chip;
+	struct gpio_chip	*gc;
 
 	might_sleep();
 
@@ -3042,12 +3042,12 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	chip = desc->gdev->chip;
-	if (chip && test_bit(FLAG_REQUESTED, &desc->flags)) {
-		if (chip->free) {
+	gc = desc->gdev->chip;
+	if (gc && test_bit(FLAG_REQUESTED, &desc->flags)) {
+		if (gc->free) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			might_sleep_if(chip->can_sleep);
-			chip->free(chip, gpio_chip_hwgpio(desc));
+			might_sleep_if(gc->can_sleep);
+			gc->free(gc, gpio_chip_hwgpio(desc));
 			spin_lock_irqsave(&gpio_lock, flags);
 		}
 		kfree_const(desc->label);
@@ -3085,7 +3085,7 @@ void gpiod_free(struct gpio_desc *desc)
 
 /**
  * gpiochip_is_requested - return string iff signal was requested
- * @chip: controller managing the signal
+ * @gc: controller managing the signal
  * @offset: of signal within controller's 0..(ngpio - 1) range
  *
  * Returns NULL if the GPIO is not currently requested, else a string.
@@ -3096,14 +3096,14 @@ void gpiod_free(struct gpio_desc *desc)
  * help with diagnostics, and knowing that the signal is used as a GPIO
  * can help avoid accidentally multiplexing it to another controller.
  */
-const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
+const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned offset)
 {
 	struct gpio_desc *desc;
 
-	if (offset >= chip->ngpio)
+	if (offset >= gc->ngpio)
 		return NULL;
 
-	desc = gpiochip_get_desc(chip, offset);
+	desc = gpiochip_get_desc(gc, offset);
 	if (IS_ERR(desc))
 		return NULL;
 
@@ -3115,7 +3115,7 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
 
 /**
  * gpiochip_request_own_desc - Allow GPIO chip to request its own descriptor
- * @chip: GPIO chip
+ * @gc: GPIO chip
  * @hwnum: hardware number of the GPIO for which to request the descriptor
  * @label: label for the GPIO
  * @lflags: lookup flags for this GPIO or 0 if default, this can be used to
@@ -3134,17 +3134,17 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
  * A pointer to the GPIO descriptor, or an ERR_PTR()-encoded negative error
  * code on failure.
  */
-struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
+struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    unsigned int hwnum,
 					    const char *label,
 					    enum gpio_lookup_flags lflags,
 					    enum gpiod_flags dflags)
 {
-	struct gpio_desc *desc = gpiochip_get_desc(chip, hwnum);
+	struct gpio_desc *desc = gpiochip_get_desc(gc, hwnum);
 	int ret;
 
 	if (IS_ERR(desc)) {
-		chip_err(chip, "failed to get GPIO descriptor\n");
+		chip_err(gc, "failed to get GPIO descriptor\n");
 		return desc;
 	}
 
@@ -3154,7 +3154,7 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
 
 	ret = gpiod_configure_flags(desc, label, lflags, dflags);
 	if (ret) {
-		chip_err(chip, "setup of own GPIO %s failed\n", label);
+		chip_err(gc, "setup of own GPIO %s failed\n", label);
 		gpiod_free_commit(desc);
 		return ERR_PTR(ret);
 	}
@@ -3198,7 +3198,7 @@ static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
 
 static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
-	struct gpio_chip *chip = desc->gdev->chip;
+	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long config;
 	unsigned arg;
 
@@ -3213,7 +3213,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 	}
 
 	config = PIN_CONF_PACKED(mode, arg);
-	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
+	return gpio_do_set_config(gc, gpio_chip_hwgpio(desc), config);
 }
 
 static int gpio_set_bias(struct gpio_desc *desc)
@@ -3247,18 +3247,18 @@ static int gpio_set_bias(struct gpio_desc *desc)
  */
 int gpiod_direction_input(struct gpio_desc *desc)
 {
-	struct gpio_chip	*chip;
+	struct gpio_chip	*gc;
 	int			ret = 0;
 
 	VALIDATE_DESC(desc);
-	chip = desc->gdev->chip;
+	gc = desc->gdev->chip;
 
 	/*
 	 * It is legal to have no .get() and .direction_input() specified if
 	 * the chip is output-only, but you can't specify .direction_input()
 	 * and not support the .get() operation, that doesn't make sense.
 	 */
-	if (!chip->get && chip->direction_input) {
+	if (!gc->get && gc->direction_input) {
 		gpiod_warn(desc,
 			   "%s: missing get() but have direction_input()\n",
 			   __func__);
@@ -3271,10 +3271,10 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	 * direction (if .get_direction() is supported) else we silently
 	 * assume we are in input mode after this.
 	 */
-	if (chip->direction_input) {
-		ret = chip->direction_input(chip, gpio_chip_hwgpio(desc));
-	} else if (chip->get_direction &&
-		  (chip->get_direction(chip, gpio_chip_hwgpio(desc)) != 1)) {
+	if (gc->direction_input) {
+		ret = gc->direction_input(gc, gpio_chip_hwgpio(desc));
+	} else if (gc->get_direction &&
+		  (gc->get_direction(gc, gpio_chip_hwgpio(desc)) != 1)) {
 		gpiod_warn(desc,
 			   "%s: missing direction_input() operation and line is output\n",
 			   __func__);
@@ -3437,12 +3437,12 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output);
  */
 int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
 {
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
-	chip = desc->gdev->chip;
+	gc = desc->gdev->chip;
 
-	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
+	return gpio_do_set_config(gc, gpio_chip_hwgpio(desc), config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_config);
 
@@ -3474,7 +3474,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_debounce);
  */
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 {
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 	unsigned long packed;
 	int gpio;
 	int rc;
@@ -3487,14 +3487,14 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	assign_bit(FLAG_TRANSITORY, &desc->flags, transitory);
 
 	/* If the driver supports it, set the persistence state now */
-	chip = desc->gdev->chip;
-	if (!chip->set_config)
+	gc = desc->gdev->chip;
+	if (!gc->set_config)
 		return 0;
 
 	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
 					  !transitory);
 	gpio = gpio_chip_hwgpio(desc);
-	rc = gpio_do_set_config(chip, gpio, packed);
+	rc = gpio_do_set_config(gc, gpio, packed);
 	if (rc == -ENOTSUPP) {
 		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
 				gpio);
@@ -3553,28 +3553,28 @@ EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
-	struct gpio_chip	*chip;
+	struct gpio_chip	*gc;
 	int offset;
 	int value;
 
-	chip = desc->gdev->chip;
+	gc = desc->gdev->chip;
 	offset = gpio_chip_hwgpio(desc);
-	value = chip->get ? chip->get(chip, offset) : -EIO;
+	value = gc->get ? gc->get(gc, offset) : -EIO;
 	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
 }
 
-static int gpio_chip_get_multiple(struct gpio_chip *chip,
+static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
-	if (chip->get_multiple) {
-		return chip->get_multiple(chip, mask, bits);
-	} else if (chip->get) {
+	if (gc->get_multiple) {
+		return gc->get_multiple(gc, mask, bits);
+	} else if (gc->get) {
 		int i, value;
 
-		for_each_set_bit(i, mask, chip->ngpio) {
-			value = chip->get(chip, i);
+		for_each_set_bit(i, mask, gc->ngpio) {
+			value = gc->get(gc, i);
 			if (value < 0)
 				return value;
 			__assign_bit(i, bits, value);
@@ -3622,26 +3622,26 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 	}
 
 	while (i < array_size) {
-		struct gpio_chip *chip = desc_array[i]->gdev->chip;
+		struct gpio_chip *gc = desc_array[i]->gdev->chip;
 		unsigned long fastpath[2 * BITS_TO_LONGS(FASTPATH_NGPIO)];
 		unsigned long *mask, *bits;
 		int first, j, ret;
 
-		if (likely(chip->ngpio <= FASTPATH_NGPIO)) {
+		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath;
 		} else {
-			mask = kmalloc_array(2 * BITS_TO_LONGS(chip->ngpio),
+			mask = kmalloc_array(2 * BITS_TO_LONGS(gc->ngpio),
 					   sizeof(*mask),
 					   can_sleep ? GFP_KERNEL : GFP_ATOMIC);
 			if (!mask)
 				return -ENOMEM;
 		}
 
-		bits = mask + BITS_TO_LONGS(chip->ngpio);
-		bitmap_zero(mask, chip->ngpio);
+		bits = mask + BITS_TO_LONGS(gc->ngpio);
+		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
-			WARN_ON(chip->can_sleep);
+			WARN_ON(gc->can_sleep);
 
 		/* collect all inputs belonging to the same chip */
 		first = i;
@@ -3656,9 +3656,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				i = find_next_zero_bit(array_info->get_mask,
 						       array_size, i);
 		} while ((i < array_size) &&
-			 (desc_array[i]->gdev->chip == chip));
+			 (desc_array[i]->gdev->chip == gc));
 
-		ret = gpio_chip_get_multiple(chip, mask, bits);
+		ret = gpio_chip_get_multiple(gc, mask, bits);
 		if (ret) {
 			if (mask != fastpath)
 				kfree(mask);
@@ -3796,13 +3796,13 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
 static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0;
-	struct gpio_chip *chip = desc->gdev->chip;
+	struct gpio_chip *gc = desc->gdev->chip;
 	int offset = gpio_chip_hwgpio(desc);
 
 	if (value) {
-		ret = chip->direction_input(chip, offset);
+		ret = gc->direction_input(gc, offset);
 	} else {
-		ret = chip->direction_output(chip, offset, 0);
+		ret = gc->direction_output(gc, offset, 0);
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	}
@@ -3821,15 +3821,15 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0;
-	struct gpio_chip *chip = desc->gdev->chip;
+	struct gpio_chip *gc = desc->gdev->chip;
 	int offset = gpio_chip_hwgpio(desc);
 
 	if (value) {
-		ret = chip->direction_output(chip, offset, 1);
+		ret = gc->direction_output(gc, offset, 1);
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	} else {
-		ret = chip->direction_input(chip, offset);
+		ret = gc->direction_input(gc, offset);
 	}
 	trace_gpio_direction(desc_to_gpio(desc), !value, ret);
 	if (ret < 0)
@@ -3840,33 +3840,34 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 
 static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
-	struct gpio_chip	*chip;
+	struct gpio_chip	*gc;
 
-	chip = desc->gdev->chip;
+	gc = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	chip->set(chip, gpio_chip_hwgpio(desc), value);
+	gc->set(gc, gpio_chip_hwgpio(desc), value);
 }
 
 /*
  * set multiple outputs on the same chip;
  * use the chip's set_multiple function if available;
  * otherwise set the outputs sequentially;
+ * @chip: the GPIO chip we operate on
  * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
  *        defines which outputs are to be changed
  * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
  *        defines the values the outputs specified by mask are to be set to
  */
-static void gpio_chip_set_multiple(struct gpio_chip *chip,
+static void gpio_chip_set_multiple(struct gpio_chip *gc,
 				   unsigned long *mask, unsigned long *bits)
 {
-	if (chip->set_multiple) {
-		chip->set_multiple(chip, mask, bits);
+	if (gc->set_multiple) {
+		gc->set_multiple(gc, mask, bits);
 	} else {
 		unsigned int i;
 
 		/* set outputs if the corresponding mask bit is set */
-		for_each_set_bit(i, mask, chip->ngpio)
-			chip->set(chip, i, test_bit(i, bits));
+		for_each_set_bit(i, mask, gc->ngpio)
+			gc->set(gc, i, test_bit(i, bits));
 	}
 }
 
@@ -3905,26 +3906,26 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 	}
 
 	while (i < array_size) {
-		struct gpio_chip *chip = desc_array[i]->gdev->chip;
+		struct gpio_chip *gc = desc_array[i]->gdev->chip;
 		unsigned long fastpath[2 * BITS_TO_LONGS(FASTPATH_NGPIO)];
 		unsigned long *mask, *bits;
 		int count = 0;
 
-		if (likely(chip->ngpio <= FASTPATH_NGPIO)) {
+		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath;
 		} else {
-			mask = kmalloc_array(2 * BITS_TO_LONGS(chip->ngpio),
+			mask = kmalloc_array(2 * BITS_TO_LONGS(gc->ngpio),
 					   sizeof(*mask),
 					   can_sleep ? GFP_KERNEL : GFP_ATOMIC);
 			if (!mask)
 				return -ENOMEM;
 		}
 
-		bits = mask + BITS_TO_LONGS(chip->ngpio);
-		bitmap_zero(mask, chip->ngpio);
+		bits = mask + BITS_TO_LONGS(gc->ngpio);
+		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
-			WARN_ON(chip->can_sleep);
+			WARN_ON(gc->can_sleep);
 
 		do {
 			struct gpio_desc *desc = desc_array[i];
@@ -3960,10 +3961,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				i = find_next_zero_bit(array_info->set_mask,
 						       array_size, i);
 		} while ((i < array_size) &&
-			 (desc_array[i]->gdev->chip == chip));
+			 (desc_array[i]->gdev->chip == gc));
 		/* push collected bits to outputs */
 		if (count != 0)
-			gpio_chip_set_multiple(chip, mask, bits);
+			gpio_chip_set_multiple(gc, mask, bits);
 
 		if (mask != fastpath)
 			kfree(mask);
@@ -4125,7 +4126,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 	int offset;
 
 	/*
@@ -4136,10 +4137,10 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
 		return -EINVAL;
 
-	chip = desc->gdev->chip;
+	gc = desc->gdev->chip;
 	offset = gpio_chip_hwgpio(desc);
-	if (chip->to_irq) {
-		int retirq = chip->to_irq(chip, offset);
+	if (gc->to_irq) {
+		int retirq = gc->to_irq(gc, offset);
 
 		/* Zero means NO_IRQ */
 		if (!retirq)
@@ -4153,17 +4154,17 @@ EXPORT_SYMBOL_GPL(gpiod_to_irq);
 
 /**
  * gpiochip_lock_as_irq() - lock a GPIO to be used as IRQ
- * @chip: the chip the GPIO to lock belongs to
+ * @gc: the chip the GPIO to lock belongs to
  * @offset: the offset of the GPIO to lock as IRQ
  *
  * This is used directly by GPIO drivers that want to lock down
  * a certain GPIO line to be used for IRQs.
  */
-int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
+int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
-	desc = gpiochip_get_desc(chip, offset);
+	desc = gpiochip_get_desc(gc, offset);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -4171,18 +4172,18 @@ int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
 	 * If it's fast: flush the direction setting if something changed
 	 * behind our back
 	 */
-	if (!chip->can_sleep && chip->get_direction) {
+	if (!gc->can_sleep && gc->get_direction) {
 		int dir = gpiod_get_direction(desc);
 
 		if (dir < 0) {
-			chip_err(chip, "%s: cannot get GPIO direction\n",
+			chip_err(gc, "%s: cannot get GPIO direction\n",
 				 __func__);
 			return dir;
 		}
 	}
 
 	if (test_bit(FLAG_IS_OUT, &desc->flags)) {
-		chip_err(chip,
+		chip_err(gc,
 			 "%s: tried to flag a GPIO set as output for IRQ\n",
 			 __func__);
 		return -EIO;
@@ -4205,17 +4206,17 @@ EXPORT_SYMBOL_GPL(gpiochip_lock_as_irq);
 
 /**
  * gpiochip_unlock_as_irq() - unlock a GPIO used as IRQ
- * @chip: the chip the GPIO to lock belongs to
+ * @gc: the chip the GPIO to lock belongs to
  * @offset: the offset of the GPIO to lock as IRQ
  *
  * This is used directly by GPIO drivers that want to indicate
  * that a certain GPIO is no longer used exclusively for IRQ.
  */
-void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
+void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_desc *desc;
 
-	desc = gpiochip_get_desc(chip, offset);
+	desc = gpiochip_get_desc(gc, offset);
 	if (IS_ERR(desc))
 		return;
 
@@ -4228,9 +4229,9 @@ void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
-void gpiochip_disable_irq(struct gpio_chip *chip, unsigned int offset)
+void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset)
 {
-	struct gpio_desc *desc = gpiochip_get_desc(chip, offset);
+	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
 
 	if (!IS_ERR(desc) &&
 	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)))
@@ -4238,9 +4239,9 @@ void gpiochip_disable_irq(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_disable_irq);
 
-void gpiochip_enable_irq(struct gpio_chip *chip, unsigned int offset)
+void gpiochip_enable_irq(struct gpio_chip *gc, unsigned int offset)
 {
-	struct gpio_desc *desc = gpiochip_get_desc(chip, offset);
+	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
 
 	if (!IS_ERR(desc) &&
 	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags))) {
@@ -4250,63 +4251,63 @@ void gpiochip_enable_irq(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_enable_irq);
 
-bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset)
+bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
+	if (offset >= gc->ngpio)
 		return false;
 
-	return test_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
+	return test_bit(FLAG_USED_AS_IRQ, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_irq);
 
-int gpiochip_reqres_irq(struct gpio_chip *chip, unsigned int offset)
+int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	if (!try_module_get(chip->gpiodev->owner))
+	if (!try_module_get(gc->gpiodev->owner))
 		return -ENODEV;
 
-	ret = gpiochip_lock_as_irq(chip, offset);
+	ret = gpiochip_lock_as_irq(gc, offset);
 	if (ret) {
-		chip_err(chip, "unable to lock HW IRQ %u for IRQ\n", offset);
-		module_put(chip->gpiodev->owner);
+		chip_err(gc, "unable to lock HW IRQ %u for IRQ\n", offset);
+		module_put(gc->gpiodev->owner);
 		return ret;
 	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiochip_reqres_irq);
 
-void gpiochip_relres_irq(struct gpio_chip *chip, unsigned int offset)
+void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset)
 {
-	gpiochip_unlock_as_irq(chip, offset);
-	module_put(chip->gpiodev->owner);
+	gpiochip_unlock_as_irq(gc, offset);
+	module_put(gc->gpiodev->owner);
 }
 EXPORT_SYMBOL_GPL(gpiochip_relres_irq);
 
-bool gpiochip_line_is_open_drain(struct gpio_chip *chip, unsigned int offset)
+bool gpiochip_line_is_open_drain(struct gpio_chip *gc, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
+	if (offset >= gc->ngpio)
 		return false;
 
-	return test_bit(FLAG_OPEN_DRAIN, &chip->gpiodev->descs[offset].flags);
+	return test_bit(FLAG_OPEN_DRAIN, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_drain);
 
-bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset)
+bool gpiochip_line_is_open_source(struct gpio_chip *gc, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
+	if (offset >= gc->ngpio)
 		return false;
 
-	return test_bit(FLAG_OPEN_SOURCE, &chip->gpiodev->descs[offset].flags);
+	return test_bit(FLAG_OPEN_SOURCE, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_source);
 
-bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
+bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
+	if (offset >= gc->ngpio)
 		return false;
 
-	return !test_bit(FLAG_TRANSITORY, &chip->gpiodev->descs[offset].flags);
+	return !test_bit(FLAG_TRANSITORY, &gc->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
 
@@ -4544,7 +4545,7 @@ EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
  */
 void gpiod_add_hogs(struct gpiod_hog *hogs)
 {
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 	struct gpiod_hog *hog;
 
 	mutex_lock(&gpio_machine_hogs_mutex);
@@ -4556,9 +4557,9 @@ void gpiod_add_hogs(struct gpiod_hog *hogs)
 		 * The chip may have been registered earlier, so check if it
 		 * exists and, if so, try to hog the line now.
 		 */
-		chip = find_chip_by_name(hog->chip_label);
-		if (chip)
-			gpiochip_machine_hog(chip, hog);
+		gc = find_chip_by_name(hog->chip_label);
+		if (gc)
+			gpiochip_machine_hog(gc, hog);
 	}
 
 	mutex_unlock(&gpio_machine_hogs_mutex);
@@ -4608,7 +4609,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		return desc;
 
 	for (p = &table->table[0]; p->chip_label; p++) {
-		struct gpio_chip *chip;
+		struct gpio_chip *gc;
 
 		/* idx must always match exactly */
 		if (p->idx != idx)
@@ -4618,9 +4619,9 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
 			continue;
 
-		chip = find_chip_by_name(p->chip_label);
+		gc = find_chip_by_name(p->chip_label);
 
-		if (!chip) {
+		if (!gc) {
 			/*
 			 * As the lookup table indicates a chip with
 			 * p->chip_label should exist, assume it may
@@ -4633,15 +4634,15 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		if (chip->ngpio <= p->chip_hwnum) {
+		if (gc->ngpio <= p->chip_hwnum) {
 			dev_err(dev,
 				"requested GPIO %u (%u) is out of range [0..%u] for chip %s\n",
-				idx, p->chip_hwnum, chip->ngpio - 1,
-				chip->label);
+				idx, p->chip_hwnum, gc->ngpio - 1,
+				gc->label);
 			return ERR_PTR(-EINVAL);
 		}
 
-		desc = gpiochip_get_desc(chip, p->chip_hwnum);
+		desc = gpiochip_get_desc(gc, p->chip_hwnum);
 		*flags = p->flags;
 
 		return desc;
@@ -5036,20 +5037,20 @@ EXPORT_SYMBOL_GPL(gpiod_get_index_optional);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 	      unsigned long lflags, enum gpiod_flags dflags)
 {
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 	struct gpio_desc *local_desc;
 	int hwnum;
 	int ret;
 
-	chip = gpiod_to_chip(desc);
+	gc = gpiod_to_chip(desc);
 	hwnum = gpio_chip_hwgpio(desc);
 
-	local_desc = gpiochip_request_own_desc(chip, hwnum, name,
+	local_desc = gpiochip_request_own_desc(gc, hwnum, name,
 					       lflags, dflags);
 	if (IS_ERR(local_desc)) {
 		ret = PTR_ERR(local_desc);
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed, %d\n",
-		       name, chip->label, hwnum, ret);
+		       name, gc->label, hwnum, ret);
 		return ret;
 	}
 
@@ -5067,15 +5068,15 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 
 /**
  * gpiochip_free_hogs - Scan gpio-controller chip and release GPIO hog
- * @chip:	gpio chip to act on
+ * @gc:	gpio chip to act on
  */
-static void gpiochip_free_hogs(struct gpio_chip *chip)
+static void gpiochip_free_hogs(struct gpio_chip *gc)
 {
 	int id;
 
-	for (id = 0; id < chip->ngpio; id++) {
-		if (test_bit(FLAG_IS_HOGGED, &chip->gpiodev->descs[id].flags))
-			gpiochip_free_own_desc(&chip->gpiodev->descs[id]);
+	for (id = 0; id < gc->ngpio; id++) {
+		if (test_bit(FLAG_IS_HOGGED, &gc->gpiodev->descs[id].flags))
+			gpiochip_free_own_desc(&gc->gpiodev->descs[id]);
 	}
 }
 
@@ -5098,7 +5099,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	struct gpio_desc *desc;
 	struct gpio_descs *descs;
 	struct gpio_array *array_info = NULL;
-	struct gpio_chip *chip;
+	struct gpio_chip *gc;
 	int count, bitmap_size;
 
 	count = gpiod_count(dev, con_id);
@@ -5118,7 +5119,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 		descs->desc[descs->ndescs] = desc;
 
-		chip = gpiod_to_chip(desc);
+		gc = gpiod_to_chip(desc);
 		/*
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
@@ -5126,8 +5127,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
-			bitmap_size = BITS_TO_LONGS(chip->ngpio > count ?
-						    chip->ngpio : count);
+			bitmap_size = BITS_TO_LONGS(gc->ngpio > count ?
+						    gc->ngpio : count);
 
 			array = kzalloc(struct_size(descs, desc, count) +
 					struct_size(array_info, invert_mask,
@@ -5150,7 +5151,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 			array_info->desc = descs->desc;
 			array_info->size = count;
-			array_info->chip = chip;
+			array_info->chip = gc;
 			bitmap_set(array_info->get_mask, descs->ndescs,
 				   count - descs->ndescs);
 			bitmap_set(array_info->set_mask, descs->ndescs,
@@ -5158,7 +5159,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			descs->info = array_info;
 		}
 		/* Unmark array members which don't belong to the 'fast' chip */
-		if (array_info && array_info->chip != chip) {
+		if (array_info && array_info->chip != gc) {
 			__clear_bit(descs->ndescs, array_info->get_mask);
 			__clear_bit(descs->ndescs, array_info->set_mask);
 		}
@@ -5183,8 +5184,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			}
 		} else if (array_info) {
 			/* Exclude open drain or open source from fast output */
-			if (gpiochip_line_is_open_drain(chip, descs->ndescs) ||
-			    gpiochip_line_is_open_source(chip, descs->ndescs))
+			if (gpiochip_line_is_open_drain(gc, descs->ndescs) ||
+			    gpiochip_line_is_open_source(gc, descs->ndescs))
 				__clear_bit(descs->ndescs,
 					    array_info->set_mask);
 			/* Identify 'fast' pins which require invertion */
@@ -5290,7 +5291,7 @@ core_initcall(gpiolib_dev_init);
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
 	unsigned		i;
-	struct gpio_chip	*chip = gdev->chip;
+	struct gpio_chip	*gc = gdev->chip;
 	unsigned		gpio = gdev->base;
 	struct gpio_desc	*gdesc = &gdev->descs[0];
 	bool			is_out;
@@ -5313,7 +5314,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 		seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s",
 			gpio, gdesc->name ? gdesc->name : "", gdesc->label,
 			is_out ? "out" : "in ",
-			chip->get ? (chip->get(chip, i) ? "hi" : "lo") : "?  ",
+			gc->get ? (gc->get(gc, i) ? "hi" : "lo") : "?  ",
 			is_irq ? "IRQ " : "",
 			active_low ? "ACTIVE LOW" : "");
 		seq_printf(s, "\n");
@@ -5365,10 +5366,10 @@ static void gpiolib_seq_stop(struct seq_file *s, void *v)
 static int gpiolib_seq_show(struct seq_file *s, void *v)
 {
 	struct gpio_device *gdev = v;
-	struct gpio_chip *chip = gdev->chip;
+	struct gpio_chip *gc = gdev->chip;
 	struct device *parent;
 
-	if (!chip) {
+	if (!gc) {
 		seq_printf(s, "%s%s: (dangling chip)", (char *)s->private,
 			   dev_name(&gdev->dev));
 		return 0;
@@ -5377,19 +5378,19 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	seq_printf(s, "%s%s: GPIOs %d-%d", (char *)s->private,
 		   dev_name(&gdev->dev),
 		   gdev->base, gdev->base + gdev->ngpio - 1);
-	parent = chip->parent;
+	parent = gc->parent;
 	if (parent)
 		seq_printf(s, ", parent: %s/%s",
 			   parent->bus ? parent->bus->name : "no-bus",
 			   dev_name(parent));
-	if (chip->label)
-		seq_printf(s, ", %s", chip->label);
-	if (chip->can_sleep)
+	if (gc->label)
+		seq_printf(s, ", %s", gc->label);
+	if (gc->can_sleep)
 		seq_printf(s, ", can sleep");
 	seq_printf(s, ":\n");
 
-	if (chip->dbg_show)
-		chip->dbg_show(s, chip);
+	if (gc->dbg_show)
+		gc->dbg_show(s, gc);
 	else
 		gpiolib_dbg_show(s, gdev);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ed65e00ee977..b8fc92c177eb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -87,7 +87,7 @@ struct gpio_irq_chip {
 	 * @need_valid_mask to make these GPIO lines unavailable for
 	 * translation.
 	 */
-	int (*child_to_parent_hwirq)(struct gpio_chip *chip,
+	int (*child_to_parent_hwirq)(struct gpio_chip *gc,
 				     unsigned int child_hwirq,
 				     unsigned int child_type,
 				     unsigned int *parent_hwirq,
@@ -102,7 +102,7 @@ struct gpio_irq_chip {
 	 * variant named &gpiochip_populate_parent_fwspec_fourcell is also
 	 * available.
 	 */
-	void *(*populate_parent_alloc_arg)(struct gpio_chip *chip,
+	void *(*populate_parent_alloc_arg)(struct gpio_chip *gc,
 				       unsigned int parent_hwirq,
 				       unsigned int parent_type);
 
@@ -114,7 +114,7 @@ struct gpio_irq_chip {
 	 * callback. If this is not specified, then a default callback will be
 	 * provided that returns the line offset.
 	 */
-	unsigned int (*child_offset_to_irq)(struct gpio_chip *chip,
+	unsigned int (*child_offset_to_irq)(struct gpio_chip *gc,
 					    unsigned int pin);
 
 	/**
@@ -209,7 +209,7 @@ struct gpio_irq_chip {
 	 * a particular driver wants to clear IRQ related registers
 	 * in order to avoid undesired events.
 	 */
-	int (*init_hw)(struct gpio_chip *chip);
+	int (*init_hw)(struct gpio_chip *gc);
 
 	/**
 	 * @init_valid_mask: optional routine to initialize @valid_mask, to be
@@ -220,7 +220,7 @@ struct gpio_irq_chip {
 	 * then directly set some bits to "0" if they cannot be used for
 	 * interrupts.
 	 */
-	void (*init_valid_mask)(struct gpio_chip *chip,
+	void (*init_valid_mask)(struct gpio_chip *gc,
 				unsigned long *valid_mask,
 				unsigned int ngpios);
 
@@ -348,40 +348,40 @@ struct gpio_chip {
 	struct device		*parent;
 	struct module		*owner;
 
-	int			(*request)(struct gpio_chip *chip,
+	int			(*request)(struct gpio_chip *gc,
 						unsigned offset);
-	void			(*free)(struct gpio_chip *chip,
+	void			(*free)(struct gpio_chip *gc,
 						unsigned offset);
-	int			(*get_direction)(struct gpio_chip *chip,
+	int			(*get_direction)(struct gpio_chip *gc,
 						unsigned offset);
-	int			(*direction_input)(struct gpio_chip *chip,
+	int			(*direction_input)(struct gpio_chip *gc,
 						unsigned offset);
-	int			(*direction_output)(struct gpio_chip *chip,
+	int			(*direction_output)(struct gpio_chip *gc,
 						unsigned offset, int value);
-	int			(*get)(struct gpio_chip *chip,
+	int			(*get)(struct gpio_chip *gc,
 						unsigned offset);
-	int			(*get_multiple)(struct gpio_chip *chip,
+	int			(*get_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
-	void			(*set)(struct gpio_chip *chip,
+	void			(*set)(struct gpio_chip *gc,
 						unsigned offset, int value);
-	void			(*set_multiple)(struct gpio_chip *chip,
+	void			(*set_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
-	int			(*set_config)(struct gpio_chip *chip,
+	int			(*set_config)(struct gpio_chip *gc,
 					      unsigned offset,
 					      unsigned long config);
-	int			(*to_irq)(struct gpio_chip *chip,
+	int			(*to_irq)(struct gpio_chip *gc,
 						unsigned offset);
 
 	void			(*dbg_show)(struct seq_file *s,
-						struct gpio_chip *chip);
+						struct gpio_chip *gc);
 
-	int			(*init_valid_mask)(struct gpio_chip *chip,
+	int			(*init_valid_mask)(struct gpio_chip *gc,
 						   unsigned long *valid_mask,
 						   unsigned int ngpios);
 
-	int			(*add_pin_ranges)(struct gpio_chip *chip);
+	int			(*add_pin_ranges)(struct gpio_chip *gc);
 
 	int			base;
 	u16			ngpio;
@@ -458,11 +458,11 @@ struct gpio_chip {
 #endif /* CONFIG_OF_GPIO */
 };
 
-extern const char *gpiochip_is_requested(struct gpio_chip *chip,
+extern const char *gpiochip_is_requested(struct gpio_chip *gc,
 			unsigned offset);
 
 /* add/remove chips */
-extern int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
+extern int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 				      struct lock_class_key *lock_key,
 				      struct lock_class_key *request_key);
 
@@ -490,43 +490,43 @@ extern int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
  * Otherwise it returns zero as a success code.
  */
 #ifdef CONFIG_LOCKDEP
-#define gpiochip_add_data(chip, data) ({		\
+#define gpiochip_add_data(gc, data) ({		\
 		static struct lock_class_key lock_key;	\
 		static struct lock_class_key request_key;	  \
-		gpiochip_add_data_with_key(chip, data, &lock_key, \
+		gpiochip_add_data_with_key(gc, data, &lock_key, \
 					   &request_key);	  \
 	})
 #else
-#define gpiochip_add_data(chip, data) gpiochip_add_data_with_key(chip, data, NULL, NULL)
+#define gpiochip_add_data(gc, data) gpiochip_add_data_with_key(gc, data, NULL, NULL)
 #endif /* CONFIG_LOCKDEP */
 
-static inline int gpiochip_add(struct gpio_chip *chip)
+static inline int gpiochip_add(struct gpio_chip *gc)
 {
-	return gpiochip_add_data(chip, NULL);
+	return gpiochip_add_data(gc, NULL);
 }
-extern void gpiochip_remove(struct gpio_chip *chip);
-extern int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *chip,
+extern void gpiochip_remove(struct gpio_chip *gc);
+extern int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
 				  void *data);
 
 extern struct gpio_chip *gpiochip_find(void *data,
-			      int (*match)(struct gpio_chip *chip, void *data));
+			      int (*match)(struct gpio_chip *gc, void *data));
 
-bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset);
-int gpiochip_reqres_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_relres_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_disable_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_enable_irq(struct gpio_chip *chip, unsigned int offset);
+bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
+int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
+void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
+void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset);
+void gpiochip_enable_irq(struct gpio_chip *gc, unsigned int offset);
 
 /* Line status inquiry for drivers */
-bool gpiochip_line_is_open_drain(struct gpio_chip *chip, unsigned int offset);
-bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset);
+bool gpiochip_line_is_open_drain(struct gpio_chip *gc, unsigned int offset);
+bool gpiochip_line_is_open_source(struct gpio_chip *gc, unsigned int offset);
 
 /* Sleep persistence inquiry for drivers */
-bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset);
-bool gpiochip_line_is_valid(const struct gpio_chip *chip, unsigned int offset);
+bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int offset);
+bool gpiochip_line_is_valid(const struct gpio_chip *gc, unsigned int offset);
 
 /* get driver data */
-void *gpiochip_get_data(struct gpio_chip *chip);
+void *gpiochip_get_data(struct gpio_chip *gc);
 
 struct bgpio_pdata {
 	const char *label;
@@ -536,23 +536,23 @@ struct bgpio_pdata {
 
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
-void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,
 					     unsigned int parent_hwirq,
 					     unsigned int parent_type);
-void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *gc,
 					      unsigned int parent_hwirq,
 					      unsigned int parent_type);
 
 #else
 
-static inline void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+static inline void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,
 						    unsigned int parent_hwirq,
 						    unsigned int parent_type)
 {
 	return NULL;
 }
 
-static inline void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+static inline void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *gc,
 						     unsigned int parent_hwirq,
 						     unsigned int parent_type)
 {
@@ -583,11 +583,11 @@ int gpiochip_irq_domain_activate(struct irq_domain *domain,
 void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 				    struct irq_data *data);
 
-void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
+void gpiochip_set_nested_irqchip(struct gpio_chip *gc,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq);
 
-int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
+int gpiochip_irqchip_add_key(struct gpio_chip *gc,
 			     struct irq_chip *irqchip,
 			     unsigned int first_irq,
 			     irq_flow_handler_t handler,
@@ -596,7 +596,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     struct lock_class_key *lock_key,
 			     struct lock_class_key *request_key);
 
-bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
+bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 				unsigned int offset);
 
 #ifdef CONFIG_LOCKDEP
@@ -607,7 +607,7 @@ bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
  * boilerplate static inlines provides such a key for each
  * unique instance.
  */
-static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
+static inline int gpiochip_irqchip_add(struct gpio_chip *gc,
 				       struct irq_chip *irqchip,
 				       unsigned int first_irq,
 				       irq_flow_handler_t handler,
@@ -616,12 +616,12 @@ static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	static struct lock_class_key lock_key;
 	static struct lock_class_key request_key;
 
-	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
 					handler, type, false,
 					&lock_key, &request_key);
 }
 
-static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
+static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
 			  struct irq_chip *irqchip,
 			  unsigned int first_irq,
 			  irq_flow_handler_t handler,
@@ -631,35 +631,35 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
 	static struct lock_class_key lock_key;
 	static struct lock_class_key request_key;
 
-	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
 					handler, type, true,
 					&lock_key, &request_key);
 }
 #else /* ! CONFIG_LOCKDEP */
-static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
+static inline int gpiochip_irqchip_add(struct gpio_chip *gc,
 				       struct irq_chip *irqchip,
 				       unsigned int first_irq,
 				       irq_flow_handler_t handler,
 				       unsigned int type)
 {
-	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
 					handler, type, false, NULL, NULL);
 }
 
-static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
+static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
 			  struct irq_chip *irqchip,
 			  unsigned int first_irq,
 			  irq_flow_handler_t handler,
 			  unsigned int type)
 {
-	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
+	return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
 					handler, type, true, NULL, NULL);
 }
 #endif /* CONFIG_LOCKDEP */
 
-int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset);
-void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset);
-int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset);
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset);
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
 			    unsigned long config);
 
 /**
@@ -676,25 +676,25 @@ struct gpio_pin_range {
 
 #ifdef CONFIG_PINCTRL
 
-int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
+int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
 			   unsigned int npins);
-int gpiochip_add_pingroup_range(struct gpio_chip *chip,
+int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,
 			unsigned int gpio_offset, const char *pin_group);
-void gpiochip_remove_pin_ranges(struct gpio_chip *chip);
+void gpiochip_remove_pin_ranges(struct gpio_chip *gc);
 
 #else /* ! CONFIG_PINCTRL */
 
 static inline int
-gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
+gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 		       unsigned int gpio_offset, unsigned int pin_offset,
 		       unsigned int npins)
 {
 	return 0;
 }
 static inline int
-gpiochip_add_pingroup_range(struct gpio_chip *chip,
+gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,
 			unsigned int gpio_offset, const char *pin_group)
 {
@@ -702,27 +702,27 @@ gpiochip_add_pingroup_range(struct gpio_chip *chip,
 }
 
 static inline void
-gpiochip_remove_pin_ranges(struct gpio_chip *chip)
+gpiochip_remove_pin_ranges(struct gpio_chip *gc)
 {
 }
 
 #endif /* CONFIG_PINCTRL */
 
-struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
+struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    unsigned int hwnum,
 					    const char *label,
 					    enum gpio_lookup_flags lflags,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
-void devprop_gpiochip_set_names(struct gpio_chip *chip,
+void devprop_gpiochip_set_names(struct gpio_chip *gc,
 				const struct fwnode_handle *fwnode);
 
 #ifdef CONFIG_GPIOLIB
 
 /* lock/unlock as IRQ */
-int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
+void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
@@ -736,14 +736,14 @@ static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 	return ERR_PTR(-ENODEV);
 }
 
-static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
+static inline int gpiochip_lock_as_irq(struct gpio_chip *gc,
 				       unsigned int offset)
 {
 	WARN_ON(1);
 	return -EINVAL;
 }
 
-static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
+static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 					  unsigned int offset)
 {
 	WARN_ON(1);
-- 
2.25.1


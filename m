Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02806A4A6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 11:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbfGPJLw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 05:11:52 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35956 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfGPJLw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 05:11:52 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so19174060ljj.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cpHZZ84iDEUbHnkgGd3NsmeSoTzAUOtYI5ZUIAiYjMM=;
        b=AsP7qD8iL5NNuBy2JAB78DdgIQSZnCnaK1wTkEOJX4ZDGULUSWsev1XzUEdB0Mi1rq
         DJORj4iWDaHcQoN94IxzwJ8zHO007btXtD2KMZhBBgvFA55zn2LRdF1W7vFzTp4CZz4T
         TER3A6TWkXAuGYbxMbAtsw3LmqXwFtmQJEVhxbsCuFqInictK5hbg3ZSsHBUe/D+lxQr
         9JHIrKGy53XC/icxFdjwoNqs8CDfw4vAeMgMvxCoAVJj2axCM9uz6ZSdGMjiMZ6BEXVT
         XyEEdD90RHW9iMTKR1ehY2G1pVTmj248OXyZuTHIFCsUlLXhj8H+mL2iIE4hoZsg8yym
         gLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cpHZZ84iDEUbHnkgGd3NsmeSoTzAUOtYI5ZUIAiYjMM=;
        b=bGqYYO+H8sMuM2FYHeyG/iQ43chSpvjRNKU1qklUqPwXtZIrcqvWenmSSnYukWwzu6
         vpSGLN3d/KWcgjAubv/E/wGn859KSdUSVIHlmbrbs42DebYKHkd9fLR4RHmgY2iE063B
         bLGag2jNqW6ErgqVLHB+fwbcFjBAJeroiCIDwREhLB22MZi37IPuyPACyqwXhCHvGvto
         QA7JpNaKQmQ1StyGb0UWM5ZZTQ8icKuQGMBDGTNt52yke8Hb5P2PshrMC3C3wNd++yNa
         hVrQrCpICqZJ8lAJJS5Min946qfwP7yV14OYnPETbkdNDxX2CqCGDSCSwIzX/ounUzED
         n7iA==
X-Gm-Message-State: APjAAAU81kcBYJNduj/WB+iFsUdYaDjXEn6WJPjnSAJx3rvYiXR0cBfp
        cv7Ybph/R8lZo+pAghxwmJfiigAfZE8=
X-Google-Smtp-Source: APXvYqygcg8ZJHZcAjaeVwMOuC+R+HFy/bcrmkkN9v7VIvk/jTA3TusSKSZByBQvfcYCgsJpqWP9Pw==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr17025660lji.171.1563268308088;
        Tue, 16 Jul 2019 02:11:48 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id g5sm3659861ljj.69.2019.07.16.02.11.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 02:11:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: gpiolib: Normalize return code variable name
Date:   Tue, 16 Jul 2019 11:11:45 +0200
Message-Id: <20190716091145.8235-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is confusing to name return variables mixedly "status",
"err" or "ret". I just changed them all to "ret", by personal
preference, to lower cognitive stress.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 220 ++++++++++++++++++++---------------------
 1 file changed, 110 insertions(+), 110 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3ee99d070608..24300f401fce 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -213,7 +213,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 {
 	struct gpio_chip *chip;
 	unsigned offset;
-	int status;
+	int ret;
 
 	chip = gpiod_to_chip(desc);
 	offset = gpio_chip_hwgpio(desc);
@@ -221,17 +221,17 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (!chip->get_direction)
 		return -ENOTSUPP;
 
-	status = chip->get_direction(chip, offset);
-	if (status > 0) {
+	ret = chip->get_direction(chip, offset);
+	if (ret > 0) {
 		/* GPIOF_DIR_IN, or other positive */
-		status = 1;
+		ret = 1;
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
-	if (status == 0) {
+	if (ret == 0) {
 		/* GPIOF_DIR_OUT */
 		set_bit(FLAG_IS_OUT, &desc->flags);
 	}
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_get_direction);
 
@@ -1172,21 +1172,21 @@ static void gpiodevice_release(struct device *dev)
 
 static int gpiochip_setup_dev(struct gpio_device *gdev)
 {
-	int status;
+	int ret;
 
 	cdev_init(&gdev->chrdev, &gpio_fileops);
 	gdev->chrdev.owner = THIS_MODULE;
 	gdev->dev.devt = MKDEV(MAJOR(gpio_devt), gdev->id);
 
-	status = cdev_device_add(&gdev->chrdev, &gdev->dev);
-	if (status)
-		return status;
+	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
+	if (ret)
+		return ret;
 
 	chip_dbg(gdev->chip, "added GPIO chardev (%d:%d)\n",
 		 MAJOR(gpio_devt), gdev->id);
 
-	status = gpiochip_sysfs_register(gdev);
-	if (status)
+	ret = gpiochip_sysfs_register(gdev);
+	if (ret)
 		goto err_remove_device;
 
 	/* From this point, the .release() function cleans up gpio_device */
@@ -1199,7 +1199,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 err_remove_device:
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
-	return status;
+	return ret;
 }
 
 static void gpiochip_machine_hog(struct gpio_chip *chip, struct gpiod_hog *hog)
@@ -1240,13 +1240,13 @@ static void machine_gpiochip_add(struct gpio_chip *chip)
 static void gpiochip_setup_devs(void)
 {
 	struct gpio_device *gdev;
-	int err;
+	int ret;
 
 	list_for_each_entry(gdev, &gpio_devices, list) {
-		err = gpiochip_setup_dev(gdev);
-		if (err)
+		ret = gpiochip_setup_dev(gdev);
+		if (ret)
 			pr_err("%s: Failed to initialize gpio device (%d)\n",
-			       dev_name(&gdev->dev), err);
+			       dev_name(&gdev->dev), ret);
 	}
 }
 
@@ -1255,7 +1255,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 			       struct lock_class_key *request_key)
 {
 	unsigned long	flags;
-	int		status = 0;
+	int		ret = 0;
 	unsigned	i;
 	int		base = chip->base;
 	struct gpio_device *gdev;
@@ -1285,7 +1285,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
 	if (gdev->id < 0) {
-		status = gdev->id;
+		ret = gdev->id;
 		goto err_free_gdev;
 	}
 	dev_set_name(&gdev->dev, "gpiochip%d", gdev->id);
@@ -1301,13 +1301,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	gdev->descs = kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GFP_KERNEL);
 	if (!gdev->descs) {
-		status = -ENOMEM;
+		ret = -ENOMEM;
 		goto err_free_ida;
 	}
 
 	if (chip->ngpio == 0) {
 		chip_err(chip, "tried to insert a GPIO chip with zero lines\n");
-		status = -EINVAL;
+		ret = -EINVAL;
 		goto err_free_descs;
 	}
 
@@ -1317,7 +1317,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	gdev->label = kstrdup_const(chip->label ?: "unknown", GFP_KERNEL);
 	if (!gdev->label) {
-		status = -ENOMEM;
+		ret = -ENOMEM;
 		goto err_free_descs;
 	}
 
@@ -1336,7 +1336,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (base < 0) {
 		base = gpiochip_find_base(chip->ngpio);
 		if (base < 0) {
-			status = base;
+			ret = base;
 			spin_unlock_irqrestore(&gpio_lock, flags);
 			goto err_free_label;
 		}
@@ -1350,8 +1350,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	}
 	gdev->base = base;
 
-	status = gpiodev_add_to_list(gdev);
-	if (status) {
+	ret = gpiodev_add_to_list(gdev);
+	if (ret) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		goto err_free_label;
 	}
@@ -1365,28 +1365,28 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
 
-	status = gpiochip_set_desc_names(chip);
-	if (status)
+	ret = gpiochip_set_desc_names(chip);
+	if (ret)
 		goto err_remove_from_list;
 
-	status = gpiochip_irqchip_init_valid_mask(chip);
-	if (status)
+	ret = gpiochip_irqchip_init_valid_mask(chip);
+	if (ret)
 		goto err_remove_from_list;
 
-	status = gpiochip_alloc_valid_mask(chip);
-	if (status)
+	ret = gpiochip_alloc_valid_mask(chip);
+	if (ret)
 		goto err_remove_irqchip_mask;
 
-	status = gpiochip_add_irqchip(chip, lock_key, request_key);
-	if (status)
+	ret = gpiochip_add_irqchip(chip, lock_key, request_key);
+	if (ret)
 		goto err_free_gpiochip_mask;
 
-	status = of_gpiochip_add(chip);
-	if (status)
+	ret = of_gpiochip_add(chip);
+	if (ret)
 		goto err_remove_chip;
 
-	status = gpiochip_init_valid_mask(chip);
-	if (status)
+	ret = gpiochip_init_valid_mask(chip);
+	if (ret)
 		goto err_remove_of_chip;
 
 	for (i = 0; i < chip->ngpio; i++) {
@@ -1413,8 +1413,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	 * Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
-		status = gpiochip_setup_dev(gdev);
-		if (status)
+		ret = gpiochip_setup_dev(gdev);
+		if (ret)
 			goto err_remove_acpi_chip;
 	}
 	return 0;
@@ -1444,9 +1444,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
 	       gdev->base, gdev->base + gdev->ngpio - 1,
-	       chip->label ? : "generic", status);
+	       chip->label ? : "generic", ret);
 	kfree(gdev);
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
 
@@ -1740,7 +1740,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
-	int err = 0;
+	int ret = 0;
 
 	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
 		return -ENXIO;
@@ -1758,12 +1758,12 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	irq_set_noprobe(irq);
 
 	if (chip->irq.num_parents == 1)
-		err = irq_set_parent(irq, chip->irq.parents[0]);
+		ret = irq_set_parent(irq, chip->irq.parents[0]);
 	else if (chip->irq.map)
-		err = irq_set_parent(irq, chip->irq.map[hwirq]);
+		ret = irq_set_parent(irq, chip->irq.map[hwirq]);
 
-	if (err < 0)
-		return err;
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
@@ -2321,7 +2321,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
 static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	struct gpio_chip	*chip = desc->gdev->chip;
-	int			status;
+	int			ret;
 	unsigned long		flags;
 	unsigned		offset;
 
@@ -2339,10 +2339,10 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 
 	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0) {
 		desc_set_label(desc, label ? : "?");
-		status = 0;
+		ret = 0;
 	} else {
 		kfree_const(label);
-		status = -EBUSY;
+		ret = -EBUSY;
 		goto done;
 	}
 
@@ -2351,12 +2351,12 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		offset = gpio_chip_hwgpio(desc);
 		if (gpiochip_line_is_valid(chip, offset))
-			status = chip->request(chip, offset);
+			ret = chip->request(chip, offset);
 		else
-			status = -EINVAL;
+			ret = -EINVAL;
 		spin_lock_irqsave(&gpio_lock, flags);
 
-		if (status < 0) {
+		if (ret < 0) {
 			desc_set_label(desc, NULL);
 			kfree_const(label);
 			clear_bit(FLAG_REQUESTED, &desc->flags);
@@ -2371,7 +2371,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	}
 done:
 	spin_unlock_irqrestore(&gpio_lock, flags);
-	return status;
+	return ret;
 }
 
 /*
@@ -2414,24 +2414,24 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
-	int status = -EPROBE_DEFER;
+	int ret = -EPROBE_DEFER;
 	struct gpio_device *gdev;
 
 	VALIDATE_DESC(desc);
 	gdev = desc->gdev;
 
 	if (try_module_get(gdev->owner)) {
-		status = gpiod_request_commit(desc, label);
-		if (status < 0)
+		ret = gpiod_request_commit(desc, label);
+		if (ret < 0)
 			module_put(gdev->owner);
 		else
 			get_device(&gdev->dev);
 	}
 
-	if (status)
-		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
+	if (ret)
+		gpiod_dbg(desc, "%s: status %d\n", __func__, ret);
 
-	return status;
+	return ret;
 }
 
 static bool gpiod_free_commit(struct gpio_desc *desc)
@@ -2533,22 +2533,22 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
 					    enum gpiod_flags dflags)
 {
 	struct gpio_desc *desc = gpiochip_get_desc(chip, hwnum);
-	int err;
+	int ret;
 
 	if (IS_ERR(desc)) {
 		chip_err(chip, "failed to get GPIO descriptor\n");
 		return desc;
 	}
 
-	err = gpiod_request_commit(desc, label);
-	if (err < 0)
-		return ERR_PTR(err);
+	ret = gpiod_request_commit(desc, label);
+	if (ret < 0)
+		return ERR_PTR(ret);
 
-	err = gpiod_configure_flags(desc, label, lflags, dflags);
-	if (err) {
+	ret = gpiod_configure_flags(desc, label, lflags, dflags);
+	if (ret) {
 		chip_err(chip, "setup of own GPIO %s failed\n", label);
 		gpiod_free_commit(desc);
-		return ERR_PTR(err);
+		return ERR_PTR(ret);
 	}
 
 	return desc;
@@ -2611,7 +2611,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 int gpiod_direction_input(struct gpio_desc *desc)
 {
 	struct gpio_chip	*chip;
-	int			status = 0;
+	int			ret = 0;
 
 	VALIDATE_DESC(desc);
 	chip = desc->gdev->chip;
@@ -2635,7 +2635,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	 * assume we are in input mode after this.
 	 */
 	if (chip->direction_input) {
-		status = chip->direction_input(chip, gpio_chip_hwgpio(desc));
+		ret = chip->direction_input(chip, gpio_chip_hwgpio(desc));
 	} else if (chip->get_direction &&
 		  (chip->get_direction(chip, gpio_chip_hwgpio(desc)) != 1)) {
 		gpiod_warn(desc,
@@ -2643,7 +2643,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 			   __func__);
 		return -EIO;
 	}
-	if (status == 0)
+	if (ret == 0)
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 
 	if (test_bit(FLAG_PULL_UP, &desc->flags))
@@ -2653,9 +2653,9 @@ int gpiod_direction_input(struct gpio_desc *desc)
 		gpio_set_config(chip, gpio_chip_hwgpio(desc),
 				PIN_CONFIG_BIAS_PULL_DOWN);
 
-	trace_gpio_direction(desc_to_gpio(desc), 1, status);
+	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
 
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
@@ -2927,7 +2927,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
-	int err, i = 0;
+	int ret, i = 0;
 
 	/*
 	 * Validate array_info against desc_array and its size.
@@ -2940,11 +2940,11 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		if (!can_sleep)
 			WARN_ON(array_info->chip->can_sleep);
 
-		err = gpio_chip_get_multiple(array_info->chip,
+		ret = gpio_chip_get_multiple(array_info->chip,
 					     array_info->get_mask,
 					     value_bitmap);
-		if (err)
-			return err;
+		if (ret)
+			return ret;
 
 		if (!raw && !bitmap_empty(array_info->invert_mask, array_size))
 			bitmap_xor(value_bitmap, value_bitmap,
@@ -3132,24 +3132,24 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
  */
 static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
-	int err = 0;
+	int ret = 0;
 	struct gpio_chip *chip = desc->gdev->chip;
 	int offset = gpio_chip_hwgpio(desc);
 
 	if (value) {
-		err = chip->direction_input(chip, offset);
-		if (!err)
+		ret = chip->direction_input(chip, offset);
+		if (!ret)
 			clear_bit(FLAG_IS_OUT, &desc->flags);
 	} else {
-		err = chip->direction_output(chip, offset, 0);
-		if (!err)
+		ret = chip->direction_output(chip, offset, 0);
+		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	}
-	trace_gpio_direction(desc_to_gpio(desc), value, err);
-	if (err < 0)
+	trace_gpio_direction(desc_to_gpio(desc), value, ret);
+	if (ret < 0)
 		gpiod_err(desc,
 			  "%s: Error in set_value for open drain err %d\n",
-			  __func__, err);
+			  __func__, ret);
 }
 
 /*
@@ -3159,24 +3159,24 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
  */
 static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
-	int err = 0;
+	int ret = 0;
 	struct gpio_chip *chip = desc->gdev->chip;
 	int offset = gpio_chip_hwgpio(desc);
 
 	if (value) {
-		err = chip->direction_output(chip, offset, 1);
-		if (!err)
+		ret = chip->direction_output(chip, offset, 1);
+		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	} else {
-		err = chip->direction_input(chip, offset);
-		if (!err)
+		ret = chip->direction_input(chip, offset);
+		if (!ret)
 			clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
-	trace_gpio_direction(desc_to_gpio(desc), !value, err);
-	if (err < 0)
+	trace_gpio_direction(desc_to_gpio(desc), !value, ret);
+	if (ret < 0)
 		gpiod_err(desc,
 			  "%s: Error in set_value for open source err %d\n",
-			  __func__, err);
+			  __func__, ret);
 }
 
 static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
@@ -4108,7 +4108,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_optional);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags)
 {
-	int status;
+	int ret;
 
 	if (lflags & GPIO_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
@@ -4141,9 +4141,9 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	else if (lflags & GPIO_PULL_DOWN)
 		set_bit(FLAG_PULL_DOWN, &desc->flags);
 
-	status = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
-	if (status < 0)
-		return status;
+	ret = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
+	if (ret < 0)
+		return ret;
 
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
@@ -4153,12 +4153,12 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
 	/* Process flags */
 	if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
-		status = gpiod_direction_output(desc,
+		ret = gpiod_direction_output(desc,
 				!!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
 	else
-		status = gpiod_direction_input(desc);
+		ret = gpiod_direction_input(desc);
 
-	return status;
+	return ret;
 }
 
 /**
@@ -4182,7 +4182,7 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 {
 	unsigned long lookupflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	struct gpio_desc *desc = NULL;
-	int status;
+	int ret;
 	/* Maybe we have a device name, maybe not */
 	const char *devname = dev ? dev_name(dev) : "?";
 
@@ -4217,9 +4217,9 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	 * If a connection label was passed use that, else attempt to use
 	 * the device name as label
 	 */
-	status = gpiod_request(desc, con_id ? con_id : devname);
-	if (status < 0) {
-		if (status == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE) {
+	ret = gpiod_request(desc, con_id ? con_id : devname);
+	if (ret < 0) {
+		if (ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE) {
 			/*
 			 * This happens when there are several consumers for
 			 * the same GPIO line: we just return here without
@@ -4232,15 +4232,15 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 				 con_id ? con_id : devname);
 			return desc;
 		} else {
-			return ERR_PTR(status);
+			return ERR_PTR(ret);
 		}
 	}
 
-	status = gpiod_configure_flags(desc, con_id, lookupflags, flags);
-	if (status < 0) {
+	ret = gpiod_configure_flags(desc, con_id, lookupflags, flags);
+	if (ret < 0) {
 		dev_dbg(dev, "setup of GPIO %s failed\n", con_id);
 		gpiod_put(desc);
-		return ERR_PTR(status);
+		return ERR_PTR(ret);
 	}
 
 	return desc;
@@ -4424,7 +4424,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	struct gpio_chip *chip;
 	struct gpio_desc *local_desc;
 	int hwnum;
-	int status;
+	int ret;
 
 	chip = gpiod_to_chip(desc);
 	hwnum = gpio_chip_hwgpio(desc);
@@ -4432,10 +4432,10 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name,
 					       lflags, dflags);
 	if (IS_ERR(local_desc)) {
-		status = PTR_ERR(local_desc);
+		ret = PTR_ERR(local_desc);
 		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed, %d\n",
-		       name, chip->label, hwnum, status);
-		return status;
+		       name, chip->label, hwnum, ret);
+		return ret;
 	}
 
 	/* Mark GPIO as hogged so it can be identified and removed later */
-- 
2.21.0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0492B103B97
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729676AbfKTNe2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:34:28 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60762 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbfKTNe1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 08:34:27 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKDYJRs084129;
        Wed, 20 Nov 2019 07:34:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574256859;
        bh=93jDsIoC/lLn4wCLLrHfnQA7IVj/2lmIBXl4qP8C3bY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uLDStWxrDF0qEfXCjWAPzAUG86mj4c1WqPkLfBjUBECXgBVMvYM/1d8QN02YaBnj6
         xE4KIPVh3jRmMVeU94TOovf6UVY3r0ms1ZSnXhegypf/sSjIxF/RKSnrgvETGezDK/
         kpesFJFDfjXZ3VtjaiUSnIPBIpkyCL5BwyfTK2qU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKDYJVY070590
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 Nov 2019 07:34:19 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 07:34:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 07:34:19 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDY9Ek096098;
        Wed, 20 Nov 2019 07:34:16 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <mripard@kernel.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
Subject: [RFC 2/2] gpiolib: Support for (output only) shared GPIO line
Date:   Wed, 20 Nov 2019 15:34:09 +0200
Message-ID: <20191120133409.9217-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120133409.9217-1-peter.ujfalusi@ti.com>
References: <20191120133409.9217-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds basic support for handling shared GPIO lines in the core.
The line must be configured with a child node in DT.
Based on the configuration the core will use different strategy to manage
the shared line:
refcounted low: Keep the line low as long as there is at least one low
		request is registered
refcounted high: Keep the line high as long as there is at least one high
		request is registered
pass through: all requests are allowed to go through without refcounting.

The pass through mode is equivalent to how currently the
GPIOD_FLAGS_BIT_NONEXCLUSIVE is handled.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/gpio/gpiolib-of.c |  28 ++++++--
 drivers/gpio/gpiolib.c    | 132 +++++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h    |  10 +++
 3 files changed, 157 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bd06743a5d7c..fbb628e6d8bc 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -531,6 +531,7 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
  * @lflags:	bitmask of gpio_lookup_flags GPIO_* values - returned from
  *		of_find_gpio() or of_parse_own_gpio()
  * @dflags:	gpiod_flags - optional GPIO initialization flags
+ * @sflags:	Extra flags for the shared GPIO usage
  *
  * Returns GPIO descriptor to use with Linux GPIO API, or one of the errno
  * value on the error condition.
@@ -539,7 +540,8 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 					   struct gpio_chip *chip,
 					   unsigned int idx, const char **name,
 					   unsigned long *lflags,
-					   enum gpiod_flags *dflags)
+					   enum gpiod_flags *dflags,
+					   unsigned long *sflags)
 {
 	struct device_node *chip_np;
 	enum of_gpio_flags xlate_flags;
@@ -592,6 +594,15 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 		return ERR_PTR(-EINVAL);
 	}
 
+	if (sflags) {
+		*sflags = 0;
+
+		if (of_property_read_bool(np, "refcounted-low"))
+			set_bit(FLAG_REFCOUNT_LOW, sflags);
+		else if (of_property_read_bool(np, "refcounted-high"))
+			set_bit(FLAG_REFCOUNT_HIGH, sflags);
+	}
+
 	if (name && of_property_read_string(np, "line-name", name))
 		*name = np->name;
 
@@ -611,22 +622,29 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 	struct gpio_desc *desc = NULL;
 	struct device_node *np;
 	const char *name;
-	unsigned long lflags;
+	unsigned long lflags, sflags;
 	enum gpiod_flags dflags;
 	unsigned int i;
 	int ret;
 
 	for_each_available_child_of_node(chip->of_node, np) {
-		if (!of_property_read_bool(np, "gpio-hog"))
+		bool is_hog = of_property_read_bool(np, "gpio-hog");
+		bool is_shared = of_property_read_bool(np, "gpio-shared");
+		if (!is_hog && !is_shared)
 			continue;
 
 		for (i = 0;; i++) {
 			desc = of_parse_own_gpio(np, chip, i, &name, &lflags,
-						 &dflags);
+						&dflags,
+						is_shared ? &sflags : NULL);
 			if (IS_ERR(desc))
 				break;
 
-			ret = gpiod_hog(desc, name, lflags, dflags);
+			if (is_hog)
+				ret = gpiod_hog(desc, name, lflags, dflags);
+			if (is_shared)
+				ret = gpiod_share(desc, name, lflags, dflags,
+						  sflags);
 			if (ret < 0) {
 				of_node_put(np);
 				return ret;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dba5f08f308c..b01836cd9e58 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -81,7 +81,7 @@ LIST_HEAD(gpio_devices);
 static DEFINE_MUTEX(gpio_machine_hogs_mutex);
 static LIST_HEAD(gpio_machine_hogs);
 
-static void gpiochip_free_hogs(struct gpio_chip *chip);
+static void gpiochip_free_owns(struct gpio_chip *chip);
 static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 				struct lock_class_key *lock_key,
 				struct lock_class_key *request_key);
@@ -1558,7 +1558,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 err_remove_acpi_chip:
 	acpi_gpiochip_remove(chip);
 err_remove_of_chip:
-	gpiochip_free_hogs(chip);
+	gpiochip_free_owns(chip);
 	of_gpiochip_remove(chip);
 err_free_gpiochip_mask:
 	gpiochip_remove_pin_ranges(chip);
@@ -1612,7 +1612,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
-	gpiochip_free_hogs(chip);
+	gpiochip_free_owns(chip);
 	/* Numb the device, cancelling all outstanding operations */
 	gdev->chip = NULL;
 	gpiochip_irqchip_remove(chip);
@@ -2788,6 +2788,13 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0) {
 		desc_set_label(desc, label ? : "?");
 		ret = 0;
+	} else 	if (test_bit(FLAG_IS_SHARED, &desc->flags)) {
+		desc->shared_users++;
+		pr_info("New user for shared GPIO line %d\n",
+			desc_to_gpio(desc));
+		kfree_const(label);
+		ret = 0;
+		goto done;
 	} else {
 		kfree_const(label);
 		ret = -EBUSY;
@@ -2894,6 +2901,15 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
+	if (test_bit(FLAG_IS_SHARED, &desc->flags) && desc->shared_users) {
+		if (--desc->shared_users) {
+			spin_unlock_irqrestore(&gpio_lock, flags);
+			pr_info("User dropped for shared GPIO line %d\n",
+				desc_to_gpio(desc));
+			return true;
+		}
+	}
+
 	chip = desc->gdev->chip;
 	if (chip && test_bit(FLAG_REQUESTED, &desc->flags)) {
 		if (chip->free) {
@@ -3126,10 +3142,44 @@ int gpiod_direction_input(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
+static int gpiod_get_refcounted_value(struct gpio_desc *desc, int value)
+{
+	value = !!value;
+
+	if (!test_bit(FLAG_IS_SHARED, &desc->flags))
+		return value;
+
+	if (test_bit(FLAG_REFCOUNT_LOW, &desc->flags)) {
+		if (!value)
+			desc->level_refcount++;
+		else if (desc->level_refcount)
+			desc->level_refcount--;
+
+		if (desc->level_refcount)
+			value = 0;
+	} else if (test_bit(FLAG_REFCOUNT_HIGH, &desc->flags)) {
+		if (value)
+			desc->level_refcount++;
+		else if (desc->level_refcount)
+			desc->level_refcount--;
+
+		if (desc->level_refcount)
+			value = 1;
+	}
+
+	pr_debug("Shared %s GPIO line %d: counter: %d: value: %d\n",
+		test_bit(FLAG_REFCOUNT_LOW, &desc->flags) ? "refcounted low" :
+		test_bit(FLAG_REFCOUNT_HIGH, &desc->flags) ? "refcounted high" :
+		"pass through", desc_to_gpio(desc), desc->level_refcount,
+		 value);
+
+	return value;
+}
+
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
-	int val = !!value;
+	int val;
 	int ret = 0;
 
 	/*
@@ -3144,6 +3194,8 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		return -EIO;
 	}
 
+	val = gpiod_get_refcounted_value(desc, value);
+
 	if (gc->direction_output) {
 		ret = gc->direction_output(gc, gpio_chip_hwgpio(desc), val);
 	} else {
@@ -3665,6 +3717,7 @@ static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 	struct gpio_chip	*chip;
 
 	chip = desc->gdev->chip;
+	value = gpiod_get_refcounted_value(desc, value);
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
 	chip->set(chip, gpio_chip_hwgpio(desc), value);
 }
@@ -4618,6 +4671,9 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 {
 	int ret;
 
+	if (test_bit(FLAG_IS_SHARED, &desc->flags))
+		goto out;
+
 	if (lflags & GPIO_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
@@ -4659,6 +4715,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		return 0;
 	}
 
+out:
 	/* Process flags */
 	if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
 		ret = gpiod_direction_output(desc,
@@ -4890,16 +4947,72 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 }
 
 /**
- * gpiochip_free_hogs - Scan gpio-controller chip and release GPIO hog
+ * gpiod_share - Share the specified GPIO desc given the provided flags
+ * @desc:	gpio whose value will be assigned
+ * @name:	gpio line name
+ * @lflags:	bitmask of gpio_lookup_flags GPIO_* values - returned from
+ *		of_find_gpio() or of_get_gpio_hog()
+ * @dflags:	gpiod_flags - optional GPIO initialization flags
+ * @sflags:	Extra flags for the shared GPIO usage
+ */
+int gpiod_share(struct gpio_desc *desc, const char *name,
+		unsigned long lflags, enum gpiod_flags dflags,
+		unsigned long sflags)
+{
+	struct gpio_chip *chip;
+	struct gpio_desc *local_desc;
+	int hwnum;
+	int ret;
+
+	chip = gpiod_to_chip(desc);
+	hwnum = gpio_chip_hwgpio(desc);
+
+	if (!(dflags & GPIOD_FLAGS_BIT_DIR_OUT)) {
+		pr_err("shared GPIO %s (chip %s, offset %d) must be output\n",
+		       name, chip->label, hwnum);
+		return -EINVAL;
+	}
+
+	local_desc = gpiochip_request_own_desc(chip, hwnum, name,
+					       lflags, dflags);
+	if (IS_ERR(local_desc)) {
+		ret = PTR_ERR(local_desc);
+		pr_err("requesting shared GPIO %s (chip %s, offset %d) failed, %d\n",
+		       name, chip->label, hwnum, ret);
+		return ret;
+	}
+
+	/* Mark GPIO as shared and set refcounting level if not pass through */
+	set_bit(FLAG_IS_SHARED, &desc->flags);
+	if (test_bit(FLAG_REFCOUNT_LOW, &sflags))
+		set_bit(FLAG_REFCOUNT_LOW, &desc->flags);
+	else if (test_bit(FLAG_REFCOUNT_HIGH, &sflags))
+		set_bit(FLAG_REFCOUNT_HIGH, &desc->flags);
+
+	pr_info("GPIO line %d (%s) shared as %s\n",
+		desc_to_gpio(desc), name,
+		test_bit(FLAG_REFCOUNT_LOW, &desc->flags) ? "refcounted low"  :
+		test_bit(FLAG_REFCOUNT_HIGH, &desc->flags) ? "refcounted high" :
+		"pass through");
+
+	return 0;
+}
+
+/**
+ * gpiochip_free_owns - Scan gpio-controller chip and release hogged or shared
+ *			GPIOs
  * @chip:	gpio chip to act on
  */
-static void gpiochip_free_hogs(struct gpio_chip *chip)
+static void gpiochip_free_owns(struct gpio_chip *chip)
 {
 	int id;
 
 	for (id = 0; id < chip->ngpio; id++) {
 		if (test_bit(FLAG_IS_HOGGED, &chip->gpiodev->descs[id].flags))
 			gpiochip_free_own_desc(&chip->gpiodev->descs[id]);
+
+		if (test_bit(FLAG_IS_SHARED, &chip->gpiodev->descs[id].flags))
+			gpiochip_free_own_desc(&chip->gpiodev->descs[id]);
 	}
 }
 
@@ -5115,6 +5228,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 	bool			is_out;
 	bool			is_irq;
 	bool			active_low;
+	bool			shared;
 
 	for (i = 0; i < gdev->ngpio; i++, gpio++, gdesc++) {
 		if (!test_bit(FLAG_REQUESTED, &gdesc->flags)) {
@@ -5129,12 +5243,14 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 		is_out = test_bit(FLAG_IS_OUT, &gdesc->flags);
 		is_irq = test_bit(FLAG_USED_AS_IRQ, &gdesc->flags);
 		active_low = test_bit(FLAG_ACTIVE_LOW, &gdesc->flags);
-		seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s",
+		shared = test_bit(FLAG_IS_SHARED, &gdesc->flags);
+		seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s%s",
 			gpio, gdesc->name ? gdesc->name : "", gdesc->label,
 			is_out ? "out" : "in ",
 			chip->get ? (chip->get(chip, i) ? "hi" : "lo") : "?  ",
 			is_irq ? "IRQ " : "",
-			active_low ? "ACTIVE LOW" : "");
+			active_low ? "ACTIVE LOW " : "",
+			shared ? "SHARED" : "");
 		seq_printf(s, "\n");
 	}
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index ca9bc1e4803c..0eec0857e3a8 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -111,11 +111,18 @@ struct gpio_desc {
 #define FLAG_PULL_UP    13	/* GPIO has pull up enabled */
 #define FLAG_PULL_DOWN  14	/* GPIO has pull down enabled */
 #define FLAG_BIAS_DISABLE    15	/* GPIO has pull disabled */
+#define FLAG_IS_SHARED 16	/* GPIO is shared */
+#define FLAG_REFCOUNT_LOW 17	/* Shared GPIO is refcounted for raw low */
+#define FLAG_REFCOUNT_HIGH 18	/* Shared GPIO is refcounted for raw high */
 
 	/* Connection label */
 	const char		*label;
 	/* Name of the GPIO */
 	const char		*name;
+	/* Number of users of a shared GPIO */
+	int			shared_users;
+	/* Reference counter for shared GPIO (low or high level) */
+	int			level_refcount;
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
@@ -124,6 +131,9 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
+int gpiod_share(struct gpio_desc *desc, const char *name,
+		unsigned long lflags, enum gpiod_flags dflags,
+		unsigned long sflags);
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


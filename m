Return-Path: <linux-gpio+bounces-19462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3095AA0E52
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DE317C0F1
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274AB2D86AC;
	Tue, 29 Apr 2025 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="plz7ZTKy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CE2D3231;
	Tue, 29 Apr 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935717; cv=none; b=YUP1HPKnLh7FgpOVUnQHuAT6JlO9AYszhXpLRJ5jVvbcKFbP/iLo7//F5jDqNb1Wc4rPAHVfJV8uFnqcWCm3oMhg892taSbcZi8kVMmXPPQA5fzHHTsOP/guE8XRyKoit0dPgSi3JJ5O8UGCrS3sUIbJy7hqH8pIK8vgy+LhInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935717; c=relaxed/simple;
	bh=Kux6kg91nZEZ5t+r78l6tNzMVeDuCEC9IcEg9zdaVTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udmMQ1u/LZ8LWwv3bX+CCCtJQX8wctD6LPo8/eqDbtA5iz9I/nGbpQDYQftyhlUXrqXVv/M4aGZWJseYBezlxt8LYpHCY3RwnvuVMa+fM4geA9sR/2riAW1FZ3rzSYHgpHU0ZqN8YJlUCpbiVu52lffrNSDQugjLkbxZXXndMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=plz7ZTKy; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39CEA438CD;
	Tue, 29 Apr 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=giD8gEdsv8R+MDrpOd9yBnf/Hxj0TCDP2kFlQOnCZLU=;
	b=plz7ZTKyjSoRUXi0ZfsD0BQWMBqGbcgQ9qj2mf/9sksvdJ0w8z9OR6b5uOgWc2WPkYK4ZR
	ciyPZNsJvhogUGJSLAAW82Oz6zAon1khRwd+QO2Nh6wcCDIBChmk2WdLzIJ6aMx7I66p/m
	izinV5cCP7W9ajZtt/WVd1whCFGGCJRd9aDy4eL08kd6sAqhFEtzbeDM/0nlk/cs191/V2
	4tsNeeHBxTibORCT4wM5PNQoYpa5dMJM6+ZJn5IrnBwE9Nm+2FleDVDBTJohoijbEPHQ0a
	QG50kRqkTOdNpv8lIm9DLuNlWnRstUTkA3K6egm+7aoWS8B5U7iaeej0Hp/c7g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:23 +0200
Subject: [PATCH v4 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-9-b3fffc11417d@bootlin.com>
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 linux-hardening@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add request() callback to check if the GPIO descriptor was well registered
in the gpiochip_fwd before to use it. This is done to handle the case
where GPIO descriptor is added at runtime in the forwarder.

If at least one GPIO descriptor was not added before the forwarder
registration, we assume the forwarder can sleep as if a GPIO is added at
runtime it may sleep.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 55 ++++++++++++++++++++++++++++++++++++------
 include/linux/gpio/forwarder.h |  4 +++
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index accf4be68238..230bd8398119 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -268,6 +268,7 @@ struct gpiochip_fwd {
 		spinlock_t slock;	/* protects tmp[] if !can_sleep */
 	};
 	struct gpiochip_fwd_timing *delay_timings;
+	unsigned long *valid_mask;
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
@@ -288,6 +289,21 @@ struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_gpiochip, "GPIO_FORWARDER");
 
+/**
+ * gpio_fwd_request - Request a line of the GPIO forwarder
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line to request
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return test_bit(offset, fwd->valid_mask) ? 0 : -ENODEV;
+}
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_request, "GPIO_FORWARDER");
+
 /**
  * gpio_fwd_get_direction - Return the current direction of a GPIO forwarder line
  * @chip: GPIO chip in the forwarder
@@ -299,6 +315,13 @@ int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
+	/*
+	 * get_direction() is called during gpiochip registration, return input
+	 * direction if there is no descriptor for the line
+	 */
+	if (!test_bit(offset, fwd->valid_mask))
+		return GPIO_LINE_DIRECTION_IN;
+
 	return gpiod_get_direction(fwd->descs[offset]);
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_direction, "GPIO_FORWARDER");
@@ -618,11 +641,16 @@ devm_gpio_fwd_alloc(struct device *dev, unsigned int ngpios)
 	if (!fwd->descs)
 		return ERR_PTR(-ENOMEM);
 
+	fwd->valid_mask = devm_bitmap_zalloc(dev, ngpios, GFP_KERNEL);
+	if (!fwd->valid_mask)
+		return ERR_PTR(-ENOMEM);
+
 	chip = &fwd->chip;
 
 	chip->label = label;
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
+	chip->request = gpio_fwd_request;
 	chip->get_direction = gpio_fwd_get_direction;
 	chip->direction_input = gpio_fwd_direction_input;
 	chip->direction_output = gpio_fwd_direction_output;
@@ -649,27 +677,21 @@ EXPORT_SYMBOL_NS_GPL(devm_gpio_fwd_alloc, "GPIO_FORWARDER");
 int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 		      unsigned int offset)
 {
-	struct gpio_chip *parent = gpiod_to_chip(desc);
 	struct gpio_chip *chip = &fwd->chip;
 
 	if (offset > chip->ngpio)
 		return -EINVAL;
 
-	if (fwd->descs[offset])
+	if (test_and_set_bit(offset, fwd->valid_mask))
 		return -EEXIST;
 
 	/*
 	 * If any of the GPIO lines are sleeping, then the entire forwarder
 	 * will be sleeping.
-	 * If any of the chips support .set_config(), then the forwarder will
-	 * support setting configs.
 	 */
 	if (gpiod_cansleep(desc))
 		chip->can_sleep = true;
 
-	if (parent && parent->set_config)
-		chip->set_config = gpio_fwd_set_config;
-
 	fwd->descs[offset] = desc;
 
 	dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
@@ -679,6 +701,18 @@ int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_add, "GPIO_FORWARDER");
 
+/**
+ * gpio_fwd_gpio_free - Remove a GPIO from the forwarder
+ * @fwd: GPIO forwarder
+ * @offset: offset of GPIO to remove
+ */
+void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	if (test_and_clear_bit(offset, fwd->valid_mask))
+		gpiod_put(fwd->descs[offset]);
+}
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_free, "GPIO_FORWARDER");
+
 /**
  * gpio_fwd_register - Register a GPIO forwarder
  * @fwd: GPIO forwarder
@@ -689,6 +723,13 @@ int gpio_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
+	/*
+	 * Some gpio_desc were not registered. They will be registered at runtime
+	 * but we have to suppose they can sleep.
+	 */
+	if (bitmap_full(fwd->valid_mask, chip->ngpio))
+		chip->can_sleep = true;
+
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index 73a1a15e09a5..f0deb7573f36 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -12,6 +12,8 @@ struct gpiochip_fwd;
 
 struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
 
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
+
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
 
 int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);
@@ -40,6 +42,8 @@ struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
 int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
 		      struct gpio_desc *desc, unsigned int offset);
 
+void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset);
+
 int gpio_fwd_register(struct gpiochip_fwd *fwd);
 
 #endif

-- 
2.39.5



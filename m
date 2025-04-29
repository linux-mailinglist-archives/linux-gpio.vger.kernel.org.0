Return-Path: <linux-gpio+bounces-19461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA0AA0E49
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 560A71B6421E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1DC2D86A8;
	Tue, 29 Apr 2025 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S8Ywwn6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E762D320D;
	Tue, 29 Apr 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935717; cv=none; b=YbRK3CG/ePnXJs+PIodsdvHDoMoQg5BPfJT6BYecIYytw5QGHXbey6wpmxHLvfgOggSzGixaRd/IUzLeaKgba+PNhyprNSYZcfX+ap4uRzwBSQS5skEdnos8ag6F8qCx0VfH88Tp8dyQ9FtMZw5dN4i2Ksx4STi8dzM1v7Ofb+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935717; c=relaxed/simple;
	bh=CPON8ZKknXYWorbKNxM9Y+Ut8Sv1lh61yP77dR82DPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvKQqxA1I5FNfFO573XIaYasLmHgwVg5kOi6TfOxX0CZXwWr4nDGmagOhOuDa5EZXR0yJNFtf2VkuRPBRhFzbFtO4UCvVF+aOsKGT+7iWUTbtYOnP5PxHlFrO9bMRUW1UJzzySudV5yzwh2AcZN1D8TZGPMMsuQ1rmur974G0w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S8Ywwn6D; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97FEA438CB;
	Tue, 29 Apr 2025 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9O7ZqLaXmGendkTEo1CFEkLo5rrjkuCOjbUYkDD5FQ=;
	b=S8Ywwn6DHwq4p+vIXZExATYeZiPPRl+SN6X4Y0cgeyg4AoUd6kGDyAjanPD0Y6zKL0zmkf
	YW/UDIywfI2LcowDhEKnYuYCR/2XNIbH071bW5EbGPo4k4nVQTclUJnmVA74DAGj4eQWvt
	FIw8HmnxtGHzbJPA79Q/pzARqmO16G3VdCU2JXxux27YsscljBm8a6n5GOYmneD4n+rBNY
	z6agEF+btQrUefinM3g1h6jqWPxD3WcNOMCyY6peX2O0+9DFBBr8vLXjPkK8RhfVqGVIi6
	HPV9+NVefHmOemoE3YOB2mAEkE59kk9t1Xys1nIXlrUaSLzBMNcfzQsxDh8SbQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:22 +0200
Subject: [PATCH v4 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-8-b3fffc11417d@bootlin.com>
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

Export all symbols and create header file for the GPIO forwarder library.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 191 +++++++++++++++++++++++++++++++++--------
 include/linux/gpio/forwarder.h |  45 ++++++++++
 2 files changed, 201 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index f186572b5c9e..accf4be68238 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -25,6 +25,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/forwarder.h>
 #include <linux/gpio/machine.h>
 
 #define AGGREGATOR_MAX_GPIOS 512
@@ -275,35 +276,81 @@ struct gpiochip_fwd {
 
 #define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
 
-static int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
+/**
+ * gpio_fwd_get_gpiochip - Get the GPIO chip for the GPIO forwarder
+ * @fwd: GPIO forwarder
+ *
+ * Returns: The GPIO chip for the GPIO forwarder
+ */
+struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
+{
+	return &fwd->chip;
+}
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_gpiochip, "GPIO_FORWARDER");
+
+/**
+ * gpio_fwd_get_direction - Return the current direction of a GPIO forwarder line
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: 0 for output, 1 for input, or an error code in case of error.
+ */
+int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_get_direction(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_direction, "GPIO_FORWARDER");
 
-static int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
+/**
+ * gpio_fwd_direction_input - Set a GPIO forwarder line direction to input
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_direction_input(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_direction_input, "GPIO_FORWARDER");
 
-static int gpio_fwd_direction_output(struct gpio_chip *chip,
-				     unsigned int offset, int value)
+/**
+ * gpio_fwd_direction_output - Set a GPIO forwarder line direction to output
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ * @value: value to set
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_direction_output(struct gpio_chip *chip,
+			      unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_direction_output(fwd->descs[offset], value);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_direction_output, "GPIO_FORWARDER");
 
-static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
+/**
+ * gpio_fwd_get - Return a GPIO forwarder line's value
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: The GPIO's logical value, i.e. taking the ACTIVE_LOW status into
+ * account, or negative errno on failure.
+ */
+int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return chip->can_sleep ? gpiod_get_value_cansleep(fwd->descs[offset])
 			       : gpiod_get_value(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get, "GPIO_FORWARDER");
 
 static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				 unsigned long *bits)
@@ -331,8 +378,18 @@ static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 	return 0;
 }
 
-static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
-					unsigned long *mask, unsigned long *bits)
+/**
+ * gpio_fwd_get_multiple_locked - Get values for multiple GPIO forwarder lines
+ * @chip: GPIO chip in the forwarder
+ * @mask: bit mask array; one bit per line; BITS_PER_LONG bits per word defines
+ *        which lines are to be read
+ * @bits: bit value array; one bit per line; BITS_PER_LONG bits per word will
+ *        contains the read values for the lines specified by mask
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_get_multiple_locked(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -350,6 +407,7 @@ static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
 
 	return error;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_multiple_locked, "GPIO_FORWARDER");
 
 static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int value)
 {
@@ -372,7 +430,15 @@ static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int valu
 		udelay(delay_us);
 }
 
-static int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
+/**
+ * gpio_fwd_set - Assign value to a GPIO forwarder line.
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ * @value: value to set
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	int ret;
@@ -389,6 +455,7 @@ static int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_set, "GPIO_FORWARDER");
 
 static int gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				 unsigned long *bits)
@@ -410,8 +477,18 @@ static int gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 	return ret;
 }
 
-static int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
-					unsigned long *mask, unsigned long *bits)
+/**
+ * gpio_fwd_set_multiple_locked - Assign values to multiple GPIO forwarder lines
+ * @chip: GPIO chip in the forwarder
+ * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
+ *        defines which outputs are to be changed
+ * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
+ *        defines the values the outputs specified by mask are to be set to
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -429,21 +506,41 @@ static int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_set_multiple_locked, "GPIO_FORWARDER");
 
-static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
-			       unsigned long config)
+/**
+ * gpio_fwd_set_config - Set @config for a GPIO forwarder line
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ * @config: Same packed config format as generic pinconf
+ *
+ * Returns: 0 on success, %-ENOTSUPP if the controller doesn't support setting
+ * the configuration.
+ */
+int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
+			unsigned long config)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_set_config(fwd->descs[offset], config);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_set_config, "GPIO_FORWARDER");
 
-static int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
+/**
+ * gpio_fwd_to_irq - Return the IRQ corresponding to a GPIO forwarder line
+ * @chip: GPIO chip in the forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: The IRQ corresponding to the passed line, or an error code in case
+ * of error.
+ */
+int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_to_irq(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_to_irq, "GPIO_FORWARDER");
 
 /*
  * The GPIO delay provides a way to configure platform specific delays
@@ -454,9 +551,9 @@ static int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
 #define FWD_FEATURE_DELAY		BIT(0)
 
 #ifdef CONFIG_OF_GPIO
-static int gpiochip_fwd_delay_of_xlate(struct gpio_chip *chip,
-				       const struct of_phandle_args *gpiospec,
-				       u32 *flags)
+static int gpio_fwd_delay_of_xlate(struct gpio_chip *chip,
+				   const struct of_phandle_args *gpiospec,
+				   u32 *flags)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	struct gpiochip_fwd_timing *timings;
@@ -476,7 +573,7 @@ static int gpiochip_fwd_delay_of_xlate(struct gpio_chip *chip,
 	return line;
 }
 
-static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
+static int gpio_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
@@ -486,20 +583,28 @@ static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 	if (!fwd->delay_timings)
 		return -ENOMEM;
 
-	chip->of_xlate = gpiochip_fwd_delay_of_xlate;
+	chip->of_xlate = gpio_fwd_delay_of_xlate;
 	chip->of_gpio_n_cells = 3;
 
 	return 0;
 }
 #else
-static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
+static int gpio_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
 	return 0;
 }
 #endif	/* !CONFIG_OF_GPIO */
 
-static struct gpiochip_fwd *
-devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
+/**
+ * devm_gpio_fwd_alloc - Allocate and initialize a new GPIO forwarder
+ * @dev: Parent device pointer
+ * @ngpios: Number of GPIOs in the forwarder
+ *
+ * Returns: An opaque object pointer, or an ERR_PTR()-encoded negative error
+ * code on failure.
+ */
+struct gpiochip_fwd *
+devm_gpio_fwd_alloc(struct device *dev, unsigned int ngpios)
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
@@ -531,10 +636,18 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 
 	return fwd;
 }
+EXPORT_SYMBOL_NS_GPL(devm_gpio_fwd_alloc, "GPIO_FORWARDER");
 
-static int gpiochip_fwd_gpio_add(struct gpiochip_fwd *fwd,
-				 struct gpio_desc *desc,
-				 unsigned int offset)
+/**
+ * gpio_fwd_gpio_add - Add a GPIO in the forwader
+ * @fwd: GPIO forwarder
+ * @desc: GPIO decriptor to register
+ * @offset: offset for the GPIO in the forwarder
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
+		      unsigned int offset)
 {
 	struct gpio_chip *parent = gpiod_to_chip(desc);
 	struct gpio_chip *chip = &fwd->chip;
@@ -564,8 +677,15 @@ static int gpiochip_fwd_gpio_add(struct gpiochip_fwd *fwd,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_add, "GPIO_FORWARDER");
 
-static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+/**
+ * gpio_fwd_register - Register a GPIO forwarder
+ * @fwd: GPIO forwarder
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpio_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
@@ -576,9 +696,10 @@ static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_register, "GPIO_FORWARDER");
 
 /**
- * gpiochip_fwd_create() - Create a new GPIO forwarder
+ * gpio_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
  * @ngpios: Number of GPIOs in the forwarder.
  * @descs: Array containing the GPIO descriptors to forward to.
@@ -592,32 +713,32 @@ static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
  * Return: An opaque object pointer, or an ERR_PTR()-encoded negative error
  *         code on failure.
  */
-static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
-						unsigned int ngpios,
-						struct gpio_desc *descs[],
-						unsigned long features)
+static struct gpiochip_fwd *gpio_fwd_create(struct device *dev,
+					    unsigned int ngpios,
+					    struct gpio_desc *descs[],
+					    unsigned long features)
 {
 	struct gpiochip_fwd *fwd;
 	unsigned int i;
 	int error;
 
-	fwd = devm_gpiochip_fwd_alloc(dev, ngpios);
+	fwd = devm_gpio_fwd_alloc(dev, ngpios);
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ngpios; i++) {
-		error = gpiochip_fwd_gpio_add(fwd, descs[i], i);
+		error = gpio_fwd_gpio_add(fwd, descs[i], i);
 		if (error)
 			return ERR_PTR(error);
 	}
 
 	if (features & FWD_FEATURE_DELAY) {
-		error = gpiochip_fwd_setup_delay_line(fwd);
+		error = gpio_fwd_setup_delay_line(fwd);
 		if (error)
 			return ERR_PTR(error);
 	}
 
-	error = gpiochip_fwd_register(fwd);
+	error = gpio_fwd_register(fwd);
 	if (error)
 		return ERR_PTR(error);
 
@@ -652,7 +773,7 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-	fwd = gpiochip_fwd_create(dev, n, descs, features);
+	fwd = gpio_fwd_create(dev, n, descs, features);
 	if (IS_ERR(fwd))
 		return PTR_ERR(fwd);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
new file mode 100644
index 000000000000..73a1a15e09a5
--- /dev/null
+++ b/include/linux/gpio/forwarder.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_GPIO_FORWARDER_H
+#define __LINUX_GPIO_FORWARDER_H
+
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/mutex.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+
+struct gpiochip_fwd;
+
+struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
+
+int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
+
+int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);
+
+int gpio_fwd_direction_output(struct gpio_chip *chip, unsigned int offset,
+			      int value);
+
+int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset);
+
+int gpio_fwd_get_multiple_locked(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits);
+
+int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value);
+
+int gpio_fwd_set_multiple_locked(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits);
+
+int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
+			unsigned long config);
+
+int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
+
+struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
+					 unsigned int ngpios);
+
+int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
+		      struct gpio_desc *desc, unsigned int offset);
+
+int gpio_fwd_register(struct gpiochip_fwd *fwd);
+
+#endif

-- 
2.39.5



Return-Path: <linux-gpio+bounces-21119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA44AD1B06
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD42916BB2B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A968253F14;
	Mon,  9 Jun 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JnrVN4XD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C424EAAA;
	Mon,  9 Jun 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462676; cv=none; b=APYZg2Qd8R7iE6KVdOJTemQH35Iauog967R3YZrrmtYS1KUIVXelIu9b81kzSW9Lwbshkj8DZCbYfLxCrtTedGFYlSxbPFTCjZ6X0c6YR4b8OwN9pbF3bJHlSib9+HDdQdFs8L8Px3RmjGEmBpjB4t0y3ihQMwovvHbjRs8z0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462676; c=relaxed/simple;
	bh=60uiZ3w3u7JTB5XrnrlMFwlv0BpRd89FU8UPEYVKk0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAE3AMH/bVxy5Gm/2FhSQvC00tFiPUKlL3sXu44njCqUdiRWZoWDlxYPzEszgxGDr2PM0OkREcenIHNbHYv3V3EXa+nqwjTur/Ig6rul2sMChUFqey+vamAqgGXTwIMQuZS3qpUfh74QU/1kR/FuEz0AjDZtO9WjCuhx5LDf1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JnrVN4XD; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75768439FD;
	Mon,  9 Jun 2025 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXgtV0zEom2tdK5EGyle0dPiCEkkesVZ3KCat3xpqqY=;
	b=JnrVN4XDa0Mmpwu35sDluJP0R5MLX5ZSepNpVQwp17JxsJDS2HR71AW5lI/LZw3ykU6MDM
	yMDR3a62v1jFiMsslkMgCzSjVHPTSZl+sPyxYIN87qkIdjyZL3Z0Xn6UShy3iYhhbHHgJG
	HBag0Ks+W7XMPfn8zHq9m5uuvSBZ9UUOZZCjkizUusk7ZUVMCr99UjCu/g+ZQadRbQcZHc
	fLSpgIpJGJCwOZCDBlTcY1AfiS9fQOMynQsIsbe0iDfGhI4jy+/8j4t1Grwsig+LKDL1En
	XtndEwLKZGphITx2KBz0hOcc64rR4nlmP4ZpRpKrSulTm9lgS2Si6EsZIsV74Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 11:51:04 +0200
Subject: [PATCH v7 06/10] gpio: aggregator: export symbols of the GPIO
 forwarder library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-6-1ab73ec0cb98@bootlin.com>
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
In-Reply-To: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Export all symbols and create header file for the GPIO forwarder library.
It will be used in the next changes.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 201 +++++++++++++++++++++++++++++++++++++++--
 include/linux/gpio/forwarder.h |  37 ++++++++
 2 files changed, 232 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index f1f48ceed75f..ea2a6d15cd14 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -28,6 +28,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/forwarder.h>
 #include <linux/gpio/machine.h>
 
 #include "dev-sync-probe.h"
@@ -475,8 +476,180 @@ static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 }
 #endif	/* !CONFIG_OF_GPIO */
 
-static struct gpiochip_fwd *
-devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
+/**
+ * gpiochip_fwd_get_gpiochip - Get the GPIO chip for the GPIO forwarder
+ * @fwd: GPIO forwarder
+ *
+ * Returns: The GPIO chip for the GPIO forwarder
+ */
+struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
+{
+	return &fwd->chip;
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_gpiochip, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_get_direction - Return the current direction of a GPIO forwarder line
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: 0 for output, 1 for input, or an error code in case of error.
+ */
+int gpiochip_fwd_gpio_get_direction(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_get_direction(gc, offset);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_get_direction, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_direction_output - Set a GPIO forwarder line direction to
+ * output
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ * @value: value to set
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_direction_output(struct gpiochip_fwd *fwd, unsigned int offset,
+				       int value)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_direction_output(gc, offset, value);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_direction_output, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_direction_input - Set a GPIO forwarder line direction to input
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_direction_input(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_direction_input(gc, offset);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_direction_input, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_get - Return a GPIO forwarder line's value
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: The GPIO's logical value, i.e. taking the ACTIVE_LOW status into
+ * account, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_get(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_get(gc, offset);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_get, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_get_multiple - Get values for multiple GPIO forwarder lines
+ * @fwd: GPIO forwarder
+ * @mask: bit mask array; one bit per line; BITS_PER_LONG bits per word defines
+ *        which lines are to be read
+ * @bits: bit value array; one bit per line; BITS_PER_LONG bits per word will
+ *        contains the read values for the lines specified by mask
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_get_multiple_locked(gc, mask, bits);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_get_multiple, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_set - Assign value to a GPIO forwarder line.
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ * @value: value to set
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_set(struct gpiochip_fwd *fwd, unsigned int offset, int value)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_set(gc, offset, value);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_set, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_set_multiple - Assign values to multiple GPIO forwarder lines
+ * @fwd: GPIO forwarder
+ * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
+ *        defines which outputs are to be changed
+ * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
+ *        defines the values the outputs specified by mask are to be set to
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_set_multiple_locked(gc, mask, bits);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_set_multiple, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_set_config - Set @config for a GPIO forwarder line
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ * @config: Same packed config format as generic pinconf
+ *
+ * Returns: 0 on success, %-ENOTSUPP if the controller doesn't support setting
+ * the configuration.
+ */
+int gpiochip_fwd_gpio_set_config(struct gpiochip_fwd *fwd, unsigned int offset,
+				 unsigned long config)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_set_config(gc, offset, config);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_set_config, "GPIO_FORWARDER");
+
+/**
+ * gpiochip_fwd_gpio_to_irq - Return the IRQ corresponding to a GPIO forwarder line
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line
+ *
+ * Returns: The Linux IRQ corresponding to the passed line, or an error code in
+ * case of error.
+ */
+int gpiochip_fwd_gpio_to_irq(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_to_irq(gc, offset);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_to_irq, "GPIO_FORWARDER");
+
+/**
+ * devm_gpiochip_fwd_alloc - Allocate and initialize a new GPIO forwarder
+ * @dev: Parent device pointer
+ * @ngpios: Number of GPIOs in the forwarder
+ *
+ * Returns: An opaque object pointer, or an ERR_PTR()-encoded negative error
+ * code on failure.
+ */
+struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
+					     unsigned int ngpios)
 {
 	struct gpiochip_fwd *fwd;
 	struct gpio_chip *chip;
@@ -507,10 +680,18 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 
 	return fwd;
 }
+EXPORT_SYMBOL_NS_GPL(devm_gpiochip_fwd_alloc, "GPIO_FORWARDER");
 
-static int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
-				 struct gpio_desc *desc,
-				 unsigned int offset)
+/**
+ * gpiochip_fwd_desc_add - Add a GPIO desc in the forwarder
+ * @fwd: GPIO forwarder
+ * @desc: GPIO descriptor to register
+ * @offset: offset for the GPIO in the forwarder
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
+			  unsigned int offset)
 {
 	struct gpio_chip *parent = gpiod_to_chip(desc);
 	struct gpio_chip *chip = &fwd->chip;
@@ -537,8 +718,15 @@ static int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_desc_add, "GPIO_FORWARDER");
 
-static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+/**
+ * gpiochip_fwd_register - Register a GPIO forwarder
+ * @fwd: GPIO forwarder
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
@@ -549,6 +737,7 @@ static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_register, "GPIO_FORWARDER");
 
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
new file mode 100644
index 000000000000..e21a1b7b1905
--- /dev/null
+++ b/include/linux/gpio/forwarder.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_GPIO_FORWARDER_H
+#define __LINUX_GPIO_FORWARDER_H
+
+struct gpio_desc;
+struct gpio_chip;
+struct gpiochip_fwd;
+
+struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
+					     unsigned int ngpios);
+int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
+			  struct gpio_desc *desc, unsigned int offset);
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd);
+
+struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
+
+int gpiochip_fwd_gpio_get_direction(struct gpiochip_fwd *fwd,
+				    unsigned int offset);
+int gpiochip_fwd_gpio_direction_input(struct gpiochip_fwd *fwd,
+				      unsigned int offset);
+int gpiochip_fwd_gpio_direction_output(struct gpiochip_fwd *fwd,
+				       unsigned int offset,
+				       int value);
+int gpiochip_fwd_gpio_get(struct gpiochip_fwd *fwd, unsigned int offset);
+int gpiochip_fwd_gpio_get_multiple(struct gpiochip_fwd *fwd,
+				   unsigned long *mask,
+				   unsigned long *bits);
+int gpiochip_fwd_gpio_set(struct gpiochip_fwd *fwd, unsigned int offset,
+			  int value);
+int gpiochip_fwd_gpio_set_multiple(struct gpiochip_fwd *fwd,
+				   unsigned long *mask,
+				   unsigned long *bits);
+int gpiochip_fwd_gpio_set_config(struct gpiochip_fwd *fwd, unsigned int offset,
+				 unsigned long config);
+int gpiochip_fwd_gpio_to_irq(struct gpiochip_fwd *fwd, unsigned int offset);
+
+#endif

-- 
2.39.5



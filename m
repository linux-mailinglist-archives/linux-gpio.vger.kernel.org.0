Return-Path: <linux-gpio+bounces-18962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE56A90620
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDDF3BA369
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14C7205AA1;
	Wed, 16 Apr 2025 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LLxtHQz9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A61FF610;
	Wed, 16 Apr 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812504; cv=none; b=PC+Z0CSYWcDRbzBmGEdjl5YYH4qvw67aJNWsKr71yaRM04jblAZ/1p5NQn15zm3RdxS/xdKhtCoSOLJpV1Qg3oc5xGyATfJK0w+HAaSG9TPkc0bO4cN1Fi/KaoYQc86cowOIoLYgWNZ7XRQUgXY3e2MjAly50AO2Fdo0TjJ4y/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812504; c=relaxed/simple;
	bh=h3PmyUV6UKgJWmJ3x2auZJOhAr78fY+AdTmRjGfTX/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eySQnGcI195JWx182dWsB3RglnkdktIpvVO3wUtn8/m1Zw09WKzEVUaoZror6zMwteEX0YjSyo2aS/tgY+OMCH/UJ3NimeWETfRHPJRbjNTBcppPguhd0N3zztJjPLkAiXrECqAXudN+IwNf2sKEX2DdvzKz/Xrp9mJoRZh8jjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LLxtHQz9; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 870C941A8C;
	Wed, 16 Apr 2025 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Q6lf2AkKJHTcCF3tWMeQNqsbEbMgSyPSCIrnjuqMvg=;
	b=LLxtHQz9qFJuFBH2PJYBa9Lk75vrkqKePt3/SiUiBvYTB8YlKvGdipbAfAvu4GJVZUS++j
	pjudVfERNxr93bifMwvm4TeTQ7LdIF9QEMQu7LdkaOz+LtZptUYe9/p/1hxyMml03BuAao
	/A891QkgcTgHUaCbuIfZq1LqKYK5lYbOXifrmAUZ+viefXYx2JHAfJdDYGgDjZcG/hJyHJ
	5+HsOZ6fjLuuorbk2hTA4jOzPAcoBl6ytBWlG5rBKCffXlyBLFxHiOUI3veJmfTbTEVBfe
	tAKU0mfP989ZoZ66p1IgmNGgnRAAcCIXB/3v1v3PV67joaKhTSH9VRSlP5JQ0w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:15 +0200
Subject: [PATCH v3 07/10] gpio: aggregator: export symbols of the GPIO
 forwarder library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-7-f40776bd06ee@bootlin.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffheknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffhekpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrt
 ghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhl
X-GND-Sasl: thomas.richard@bootlin.com

Export all symbols and create header file for the GPIO forwarder library.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 98 ++++++++++++++++++++----------------------
 include/linux/gpio/forwarder.h | 60 ++++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 96b82974969d..5743f84e1310 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -25,6 +25,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/forwarder.h>
 #include <linux/gpio/machine.h>
 
 #define AGGREGATOR_MAX_GPIOS 512
@@ -254,56 +255,44 @@ static void __exit gpio_aggregator_remove_all(void)
  *  GPIO Forwarder
  */
 
-struct gpiochip_fwd_timing {
-	u32 ramp_up_us;
-	u32 ramp_down_us;
-};
-
-struct gpiochip_fwd {
-	struct gpio_chip chip;
-	struct gpio_desc **descs;
-	union {
-		struct mutex mlock;	/* protects tmp[] if can_sleep */
-		spinlock_t slock;	/* protects tmp[] if !can_sleep */
-	};
-	struct gpiochip_fwd_timing *delay_timings;
-	unsigned long tmp[];		/* values and descs for multiple ops */
-};
-
 #define fwd_tmp_values(fwd)	&(fwd)->tmp[0]
 #define fwd_tmp_descs(fwd)	(void *)&(fwd)->tmp[BITS_TO_LONGS((fwd)->chip.ngpio)]
 
 #define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
 
-static int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_get_direction(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_direction, "GPIO_FORWARDER");
 
-static int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_direction_input(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_direction_input, "GPIO_FORWARDER");
 
-static int gpio_fwd_direction_output(struct gpio_chip *chip,
-				     unsigned int offset, int value)
+int gpio_fwd_direction_output(struct gpio_chip *chip,
+			      unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_direction_output(fwd->descs[offset], value);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_direction_output, "GPIO_FORWARDER");
 
-static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return chip->can_sleep ? gpiod_get_value_cansleep(fwd->descs[offset])
 			       : gpiod_get_value(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get, "GPIO_FORWARDER");
 
 static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				 unsigned long *bits)
@@ -331,8 +320,8 @@ static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 	return 0;
 }
 
-static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
-					unsigned long *mask, unsigned long *bits)
+int gpio_fwd_get_multiple_locked(struct gpio_chip *chip, unsigned long *mask,
+			  unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -350,6 +339,7 @@ static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
 
 	return error;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_multiple_locked, "GPIO_FORWARDER");
 
 static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int value)
 {
@@ -372,7 +362,7 @@ static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int valu
 		udelay(delay_us);
 }
 
-static int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
+int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	int ret;
@@ -389,6 +379,7 @@ static int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_set, "GPIO_FORWARDER");
 
 static int gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				 unsigned long *bits)
@@ -410,8 +401,8 @@ static int gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 	return ret;
 }
 
-static int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
-					unsigned long *mask, unsigned long *bits)
+int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -429,21 +420,24 @@ static int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_set_multiple_locked, "GPIO_FORWARDER");
 
-static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
-			       unsigned long config)
+int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
+			unsigned long config)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_set_config(fwd->descs[offset], config);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_set_config, "GPIO_FORWARDER");
 
-static int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_to_irq(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_to_irq, "GPIO_FORWARDER");
 
 /*
  * The GPIO delay provides a way to configure platform specific delays
@@ -454,9 +448,9 @@ static int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
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
@@ -476,7 +470,7 @@ static int gpiochip_fwd_delay_of_xlate(struct gpio_chip *chip,
 	return line;
 }
 
-static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
+static int gpio_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
@@ -486,20 +480,20 @@ static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
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
+struct gpiochip_fwd *
+devm_gpio_fwd_alloc(struct device *dev, unsigned int ngpios)
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
@@ -532,10 +526,10 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 
 	return fwd;
 }
+EXPORT_SYMBOL_NS_GPL(devm_gpio_fwd_alloc, "GPIO_FORWARDER");
 
-static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
-				      struct gpio_desc *desc,
-				      unsigned int offset)
+int gpio_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
+			   unsigned int offset)
 {
 	struct gpio_chip *parent = gpiod_to_chip(desc);
 	struct gpio_chip *chip = &fwd->chip;
@@ -565,8 +559,9 @@ static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_add_gpio_desc, "GPIO_FORWARDER");
 
-static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+int gpio_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 	int error;
@@ -580,9 +575,10 @@ static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 
 	return error;
 }
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_register, "GPIO_FORWARDER");
 
 /**
- * gpiochip_fwd_create() - Create a new GPIO forwarder
+ * gpio_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
  * @ngpios: Number of GPIOs in the forwarder.
  * @descs: Array containing the GPIO descriptors to forward to.
@@ -596,32 +592,32 @@ static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
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
-		error = gpiochip_fwd_add_gpio_desc(fwd, descs[i], i);
+		error = gpio_fwd_add_gpio_desc(fwd, descs[i], i);
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
 
@@ -656,7 +652,7 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-	fwd = gpiochip_fwd_create(dev, n, descs, features);
+	fwd = gpio_fwd_create(dev, n, descs, features);
 	if (IS_ERR(fwd))
 		return PTR_ERR(fwd);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
new file mode 100644
index 000000000000..78adfe6f162f
--- /dev/null
+++ b/include/linux/gpio/forwarder.h
@@ -0,0 +1,60 @@
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
+struct gpio_chip;
+struct gpio_desc;
+
+struct gpiochip_fwd_timing {
+	u32 ramp_up_us;
+	u32 ramp_down_us;
+};
+
+struct gpiochip_fwd {
+	struct gpio_chip chip;
+	struct gpio_desc **descs;
+	union {
+		struct mutex mlock;	/* protects tmp[] if can_sleep */
+		spinlock_t slock;	/* protects tmp[] if !can_sleep */
+	};
+	struct gpiochip_fwd_timing *delay_timings;
+	unsigned long tmp[];		/* values and descs for multiple ops */
+};
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
+int gpio_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
+			   struct gpio_desc *desc, unsigned int offset);
+
+int gpio_fwd_register(struct gpiochip_fwd *fwd);
+
+#endif

-- 
2.39.5



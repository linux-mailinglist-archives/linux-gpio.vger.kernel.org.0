Return-Path: <linux-gpio+bounces-17694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3813A655E4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1B31899967
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979A324A05D;
	Mon, 17 Mar 2025 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BUFTGzO6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38992459E3;
	Mon, 17 Mar 2025 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225904; cv=none; b=goc91dxp6SECEEei+fnb8rdypoxYBnICAWynsMRbuuPZ2yygq4eTnD+wcHLUZ9zjg2mUsbqyU5N9SnGSZMFr9FoV1Eg4i9hELR5r9aiN20anZ4y7I5JiEvNT2yZ/SBjOsq3AFvra7M/Ln84W4KpgOXyw0KfnhI+gSbGRHCXrqV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225904; c=relaxed/simple;
	bh=aXzIaM+/duKZNiQ6+WwHY2qlZTzwQMp4X+yyhwfquZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RkAS60wW+Rlcm8vBk6/gu/Gk3G/pH+XsqCfAEw7hI0GFKmrY3FgOrHRKFMMe3kaoPXqV8PxlixImONJ2x6bCRNtrjZ9DrVKf9RQ7agHVOw7r4m7Ad9wEkyTufxdlgbBoldFGIWHypgtfTVd61gukrxcZ/qhmG2U6rQxuIJGR8s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BUFTGzO6; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C79C2058A;
	Mon, 17 Mar 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742225900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2liigtIFKXPPoEvA6ezIPYXh8ADf6WeqxnJ8bMjGVU=;
	b=BUFTGzO6Lp0EcDs+fSJfpBCQBk03NvvyvE4AlXeialKFNHLgePEtX/PK0Uvh0snfuqUYBN
	yW1OIyr2nUc2Y8AQXUiUprPBcEpGrbK1jKRppHnnJWLcpQjVGYX3rJGg11Ynkl2cZWcjqT
	HJoOdL/Odx5CHokxqonTKZU04Au0DikGqoUWeYV/8rjEqHRL+iK8gNcxi8ALdjuvTIP7MB
	GW9lLtStyZl22lAbQTQnNF9UeTCAiQQ+oVIjy5ieBhOhCcMy3pP/xHjyEJHBKXuGWfNE4U
	7jZRldFVoVU3k7fXP2LZcCM5AtTqk8Xa5KcT1H5s2GJSGC7pK9TUll/hhbrxyQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 17 Mar 2025 16:38:01 +0100
Subject: [PATCH RFC v2 3/6] gpio: aggregator: export symbols of the
 gpio-fwd library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-aaeon-up-board-pinctrl-support-v2-3-36126e30aa62@bootlin.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijhesl
 hhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfi
X-GND-Sasl: thomas.richard@bootlin.com

Export all symbols and create header file for the gpio-fwd library.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 87 ++++++++++++++++++++----------------------
 include/linux/gpio/gpio-fwd.h  | 53 +++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index a86e76daf67ab..7d00247f5268c 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -25,6 +25,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/gpio-fwd.h>
 #include <linux/gpio/machine.h>
 
 #define AGGREGATOR_MAX_GPIOS 512
@@ -254,60 +255,47 @@ static void __exit gpio_aggregator_remove_all(void)
  *  GPIO Forwarder
  */
 
-struct gpiochip_fwd_timing {
-	u32 ramp_up_us;
-	u32 ramp_down_us;
-};
-
-struct gpiochip_fwd {
-	struct device *dev;
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
+EXPORT_SYMBOL_GPL(gpio_fwd_get_direction);
 
-static int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_direction_input(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_direction_input);
 
-static int gpio_fwd_direction_output(struct gpio_chip *chip,
-				     unsigned int offset, int value)
+int gpio_fwd_direction_output(struct gpio_chip *chip,
+			      unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_direction_output(fwd->descs[offset], value);
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_direction_output);
 
-static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return chip->can_sleep ? gpiod_get_value_cansleep(fwd->descs[offset])
 			       : gpiod_get_value(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_get);
 
-static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
-				 unsigned long *bits)
+static int gpio_fwd_get_multiple_unlocked(struct gpiochip_fwd *fwd,
+					  unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_desc **descs = fwd_tmp_descs(fwd);
 	unsigned long *values = fwd_tmp_values(fwd);
@@ -332,8 +320,8 @@ static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 	return 0;
 }
 
-static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
-					unsigned long *mask, unsigned long *bits)
+int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+			  unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -341,16 +329,17 @@ static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
 
 	if (chip->can_sleep) {
 		mutex_lock(&fwd->mlock);
-		error = gpio_fwd_get_multiple(fwd, mask, bits);
+		error = gpio_fwd_get_multiple_unlocked(fwd, mask, bits);
 		mutex_unlock(&fwd->mlock);
 	} else {
 		spin_lock_irqsave(&fwd->slock, flags);
-		error = gpio_fwd_get_multiple(fwd, mask, bits);
+		error = gpio_fwd_get_multiple_unlocked(fwd, mask, bits);
 		spin_unlock_irqrestore(&fwd->slock, flags);
 	}
 
 	return error;
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_get_multiple);
 
 static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int value)
 {
@@ -373,7 +362,7 @@ static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int valu
 		udelay(delay_us);
 }
 
-static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
+void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
@@ -385,9 +374,11 @@ static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 	if (fwd->delay_timings)
 		gpio_fwd_delay(chip, offset, value);
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_set);
 
-static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
-				  unsigned long *bits)
+static void gpio_fwd_set_multiple_unlocked(struct gpiochip_fwd *fwd,
+					   unsigned long *mask,
+					   unsigned long *bits)
 {
 	struct gpio_desc **descs = fwd_tmp_descs(fwd);
 	unsigned long *values = fwd_tmp_values(fwd);
@@ -404,37 +395,40 @@ static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 		gpiod_set_array_value(j, descs, NULL, values);
 }
 
-static void gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
-					 unsigned long *mask, unsigned long *bits)
+void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+			   unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	if (chip->can_sleep) {
 		mutex_lock(&fwd->mlock);
-		gpio_fwd_set_multiple(fwd, mask, bits);
+		gpio_fwd_set_multiple_unlocked(fwd, mask, bits);
 		mutex_unlock(&fwd->mlock);
 	} else {
 		spin_lock_irqsave(&fwd->slock, flags);
-		gpio_fwd_set_multiple(fwd, mask, bits);
+		gpio_fwd_set_multiple_unlocked(fwd, mask, bits);
 		spin_unlock_irqrestore(&fwd->slock, flags);
 	}
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_set_multiple);
 
-static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
-			       unsigned long config)
+int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
+			unsigned long config)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_set_config(fwd->descs[offset], config);
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_set_config);
 
-static int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
+int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
 	return gpiod_to_irq(fwd->descs[offset]);
 }
+EXPORT_SYMBOL_GPL(gpio_fwd_to_irq);
 
 /*
  * The GPIO delay provides a way to configure platform specific delays
@@ -489,8 +483,8 @@ static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 }
 #endif	/* !CONFIG_OF_GPIO */
 
-static struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
-						    unsigned int ngpios)
+struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
+					     unsigned int ngpios)
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
@@ -515,18 +509,19 @@ static struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
 	chip->direction_input = gpio_fwd_direction_input;
 	chip->direction_output = gpio_fwd_direction_output;
 	chip->get = gpio_fwd_get;
-	chip->get_multiple = gpio_fwd_get_multiple_locked;
+	chip->get_multiple = gpio_fwd_get_multiple;
 	chip->set = gpio_fwd_set;
-	chip->set_multiple = gpio_fwd_set_multiple_locked;
+	chip->set_multiple = gpio_fwd_set_multiple;
 	chip->to_irq = gpio_fwd_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;
 
 	return fwd;
 }
+EXPORT_SYMBOL_GPL(devm_gpiochip_fwd_alloc);
 
-static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
-				      unsigned int offset)
+int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
+			       unsigned int offset)
 {
 	struct gpio_chip *chip = &fwd->chip;
 	struct gpio_chip *parent = gpiod_to_chip(desc);
@@ -556,8 +551,9 @@ static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gpiochip_fwd_add_gpio_desc);
 
-static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 	struct device *dev = fwd->dev;
@@ -572,6 +568,7 @@ static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 
 	return error;
 }
+EXPORT_SYMBOL_GPL(gpiochip_fwd_register);
 
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
diff --git a/include/linux/gpio/gpio-fwd.h b/include/linux/gpio/gpio-fwd.h
new file mode 100644
index 0000000000000..d705b6d7ad76a
--- /dev/null
+++ b/include/linux/gpio/gpio-fwd.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_GPIO_FWD_H
+#define __LINUX_GPIO_FWD_H
+
+struct gpiochip_fwd_timing {
+	u32 ramp_up_us;
+	u32 ramp_down_us;
+};
+
+struct gpiochip_fwd {
+	struct device *dev;
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
+int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+			  unsigned long *bits);
+
+void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value);
+
+void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+			   unsigned long *bits);
+
+int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
+			unsigned long config);
+
+int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
+
+struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
+					     unsigned int ngpios);
+
+int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
+			       struct gpio_desc *desc,
+			       unsigned int offset);
+
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd);
+
+#endif

-- 
2.39.5



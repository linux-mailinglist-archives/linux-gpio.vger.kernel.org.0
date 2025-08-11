Return-Path: <linux-gpio+bounces-24180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78177B20A23
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEE527A7C45
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A44D2DFF22;
	Mon, 11 Aug 2025 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jYVbcGn5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0F2DE6F7;
	Mon, 11 Aug 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918765; cv=none; b=G/OvPcD5zlCj99DFe5WSvMt6YGBiLBVjL59hMigQK70Y6fMlgX1jmqbG7j2GdbpQIE6Cry9RDi31yQ46NJ5eA48DSfEmma905jjta4oUEZcSxRE2mL8+uRDfwE9oy0vPnlpPikQ7GSe/8rvmPEQzNCXDTmis5UPf0DGTXyMXQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918765; c=relaxed/simple;
	bh=kKIawou/G/8TQqOepeDxdzcBpRasNZh9VEFe4nKlPmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5KCuylkLUBvQ6FIkd7llvL6lLFvspsTmEN3tMirRGyrRXLUYSyi3xB94RnwJDF8eROy1Rc0W6BxYCzRmza5rMayHKm6OLow3I5GtIF1v4+1BXk7w5wULA5iwv4Kx3otzqwva7MyG3zHGdsncxfNeFwk6OIjADmFDHJ/u4TaPg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jYVbcGn5; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13ABC44427;
	Mon, 11 Aug 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1nkhU+y5fjiygPfkq88fmpQ7jYZH2S7giU80GikX4k0=;
	b=jYVbcGn5bTAwtBfeZ+Jjv/pw0zmGlSk3c493DGqN6CulZ+Y/AMfjQb7AEPgW6KrHjSyS8D
	TfUioTSVWmFVaGtAgifF1V/QfW0GFErKVmpCUWLL1QBDw0nCz4ZB+jddq8+0tqkH12O8+8
	P1dHP3m0Vq0aVhTOiJqPcqn6Eg18NSlJazgtG1r8HHVj08H6Eb73IIuEif6yitLvHm46lS
	wzlIGVSVjK+UAanMH4hEdEplt9XSKYn+anCyiP2sz8Tim5oUeaXyFjJHMbJv2S5Nd5qmib
	nZYQ8qo9U9m5Qj0r0C2/WmulJoWJf8CGB7YtMKjwPa/9kw3H6c8eZKub9FGDDg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 11 Aug 2025 15:25:50 +0200
Subject: [PATCH v9 07/10] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-7-29f0cbbdfb30@bootlin.com>
References: <20250811-aaeon-up-board-pinctrl-support-v9-0-29f0cbbdfb30@bootlin.com>
In-Reply-To: <20250811-aaeon-up-board-pinctrl-support-v9-0-29f0cbbdfb30@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 linux-hardening@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtt
 hhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Add request() callback to check if the GPIO descriptor was well registered
in the gpiochip_fwd before using it. This is done to handle the case where
GPIO descriptor is added at runtime in the forwarder.

If at least one GPIO descriptor was not added before the forwarder
registration, we assume the forwarder can sleep as if a GPIO is added at
runtime it may sleep.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 63 ++++++++++++++++++++++++++++++++++++++----
 include/linux/gpio/forwarder.h |  2 ++
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index c1952b28b7b7f9314a7e2e73bf2f257b00e49bab..f0d38d76cf73fccbc7baf83f8d0d33732787762b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -246,6 +246,7 @@ struct gpiochip_fwd {
 		spinlock_t slock;	/* protects tmp[] if !can_sleep */
 	};
 	struct gpiochip_fwd_timing *delay_timings;
+	unsigned long *valid_mask;
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
@@ -254,10 +255,24 @@ struct gpiochip_fwd {
 
 #define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
 
+static int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return test_bit(offset, fwd->valid_mask) ? 0 : -ENODEV;
+}
+
 static int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 
+	/*
+	 * get_direction() is called during gpiochip registration, return
+	 * -ENODEV if there is no GPIO desc for the line.
+	 */
+	if (!test_bit(offset, fwd->valid_mask))
+		return -ENODEV;
+
 	return gpiod_get_direction(fwd->descs[offset]);
 }
 
@@ -489,6 +504,21 @@ struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
 }
 EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_gpiochip, "GPIO_FORWARDER");
 
+/**
+ * gpiochip_fwd_gpio_request - Request a line of the GPIO forwarder
+ * @fwd: GPIO forwarder
+ * @offset: the offset of the line to request
+ *
+ * Returns: 0 on success, or negative errno on failure.
+ */
+int gpiochip_fwd_gpio_request(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
+
+	return gpio_fwd_request(gc, offset);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_gpio_request, "GPIO_FORWARDER");
+
 /**
  * gpiochip_fwd_gpio_get_direction - Return the current direction of a GPIO forwarder line
  * @fwd: GPIO forwarder
@@ -663,11 +693,16 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
 	if (!fwd->descs)
 		return ERR_PTR(-ENOMEM);
 
+	fwd->valid_mask = devm_bitmap_zalloc(dev, ngpios, GFP_KERNEL);
+	if (!fwd->valid_mask)
+		return ERR_PTR(-ENOMEM);
+
 	chip = &fwd->chip;
 
 	chip->label = dev_name(dev);
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
+	chip->request = gpio_fwd_request;
 	chip->get_direction = gpio_fwd_get_direction;
 	chip->direction_input = gpio_fwd_direction_input;
 	chip->direction_output = gpio_fwd_direction_output;
@@ -694,24 +729,21 @@ EXPORT_SYMBOL_NS_GPL(devm_gpiochip_fwd_alloc, "GPIO_FORWARDER");
 int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 			  unsigned int offset)
 {
-	struct gpio_chip *parent = gpiod_to_chip(desc);
 	struct gpio_chip *chip = &fwd->chip;
 
 	if (offset > chip->ngpio)
 		return -EINVAL;
 
+	if (test_and_set_bit(offset, fwd->valid_mask))
+		return -EEXIST;
+
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
@@ -721,6 +753,18 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 }
 EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_desc_add, "GPIO_FORWARDER");
 
+/**
+ * gpiochip_fwd_desc_free - Remove a GPIO desc from the forwarder
+ * @fwd: GPIO forwarder
+ * @offset: offset of GPIO desc to remove
+ */
+void gpiochip_fwd_desc_free(struct gpiochip_fwd *fwd, unsigned int offset)
+{
+	if (test_and_clear_bit(offset, fwd->valid_mask))
+		gpiod_put(fwd->descs[offset]);
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_desc_free, "GPIO_FORWARDER");
+
 /**
  * gpiochip_fwd_register - Register a GPIO forwarder
  * @fwd: GPIO forwarder
@@ -731,6 +775,13 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
+	/*
+	 * Some gpio_desc were not registered. They will be registered at runtime
+	 * but we have to suppose they can sleep.
+	 */
+	if (!bitmap_full(fwd->valid_mask, chip->ngpio))
+		chip->can_sleep = true;
+
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index e21a1b7b190525ac96c9be9ea1e2052702eed6f5..45e0190308f09fdf953b71504a82c75fa47771c0 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -10,10 +10,12 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
 					     unsigned int ngpios);
 int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
 			  struct gpio_desc *desc, unsigned int offset);
+void gpiochip_fwd_desc_free(struct gpiochip_fwd *fwd, unsigned int offset);
 int gpiochip_fwd_register(struct gpiochip_fwd *fwd);
 
 struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
 
+int gpiochip_fwd_gpio_request(struct gpiochip_fwd *fwd, unsigned int offset);
 int gpiochip_fwd_gpio_get_direction(struct gpiochip_fwd *fwd,
 				    unsigned int offset);
 int gpiochip_fwd_gpio_direction_input(struct gpiochip_fwd *fwd,

-- 
2.47.2



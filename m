Return-Path: <linux-gpio+bounces-19684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E80AAC94E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126353BE53E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73439283CBA;
	Tue,  6 May 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g8mWBFnu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06622A4F0;
	Tue,  6 May 2025 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544895; cv=none; b=mLpNQQEYmcf5ZQMcbOkELChSyQgoa1qDOa7OuiPq/Mzi/6rBFjQlxfqcrpq1HT6foSBK5leaaoP70WvJpytJIQCy34l8sKVS6+awci2IEgLc9KHDmBh6+XghfjkOR4A7+W+D9DDkRt0OttcF7NDkdlQh5wBT9b13VbwuLsHif5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544895; c=relaxed/simple;
	bh=S2EEdVZOoePzaH7MtcuLAmg39V5C9k7NS6rzzXbNtMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/+SV3+6DgubITInyG1b3mYZYWvCJRa5DZpXrgC5TqLfNeHrccnOh1fjIGbg31ujlH7JaMbqsS2dHFkx/kXvsRLT4/rGgMmcS1/h1VO+/uzkKhK89kUnvU7vv2Kr8uK2QG5thjBp2F1gSf+Jm7IWJ//pXtVo3YEGcpvQk3WogvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g8mWBFnu; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1551543B42;
	Tue,  6 May 2025 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cn2I5YeF0IITjufg1g6ZWoqrwhd3Mok5VANAi6J/Seo=;
	b=g8mWBFnuIFqVM355zL2tA+sEx4BmpKXSDlaB81+CkY40AdvmsPmHnT16MiKOxRrePSniCF
	FkQPqTm8FS4WLfw1d9p+sxqJ72tYz0Coh/vu7ny968Sc8jP42PjQiBvKV70PEkXxIGwQfO
	CdQwBxuM8n12XSPFTvvRrPV9bn7+SzL7lxFsCZ2rjG3Eim71lh1dTvxt2qlJOgEC1BbRk5
	dUSsEdLiyAowQVjMovtUC0cB2HuF96wsCgIwRavmiVsb3uFd4cNwggbIAUw7R+EaBsV+Iq
	rxwlheY1tsYJPGhVU8n4wHL590RhXDTc8uDSOfVvZ7yfwwePLt3USKUrfYDCzQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:27 +0200
Subject: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvt
 ghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add request() callback to check if the GPIO descriptor was well registered
in the gpiochip_fwd before using it. This is done to handle the case where
GPIO descriptor is added at runtime in the forwarder.

If at least one GPIO descriptor was not added before the forwarder
registration, we assume the forwarder can sleep as if a GPIO is added at
runtime it may sleep.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 56 +++++++++++++++++++++++++++++++++++++-----
 include/linux/gpio/forwarder.h |  4 +++
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 79fd44c2ceac..234f2f55c306 100644
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
+	 * direction if there is no descriptor for the line.
+	 */
+	if (!test_bit(offset, fwd->valid_mask))
+		return GPIO_LINE_DIRECTION_IN;
+
 	return gpiod_get_direction(fwd->descs[offset]);
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_direction, "GPIO_FORWARDER");
@@ -617,11 +640,16 @@ struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev, unsigned int ngpios
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
@@ -648,24 +676,21 @@ EXPORT_SYMBOL_NS_GPL(devm_gpio_fwd_alloc, "GPIO_FORWARDER");
 int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
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
@@ -675,6 +700,18 @@ int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
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
@@ -685,6 +722,13 @@ int gpio_fwd_register(struct gpiochip_fwd *fwd)
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
index b17ad2c8e031..f799b0377efd 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -9,6 +9,8 @@ struct gpiochip_fwd;
 
 struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
 
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
+
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
 
 int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);
@@ -37,6 +39,8 @@ struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
 int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
 		      struct gpio_desc *desc, unsigned int offset);
 
+void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset);
+
 int gpio_fwd_register(struct gpiochip_fwd *fwd);
 
 #endif

-- 
2.39.5



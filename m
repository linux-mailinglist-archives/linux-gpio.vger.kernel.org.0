Return-Path: <linux-gpio+bounces-20335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9DAABD956
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3873D3BBE34
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B25F242D74;
	Tue, 20 May 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zq9YjJ1S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2950422C33A;
	Tue, 20 May 2025 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747733; cv=none; b=o7IUUJML3XdBo5C0xFBONoalLOgVgh5AWgVE56oz2p9IpFz2kYaQnAmAW1k5tb/IP0ROhgE6G9kMKFF9MqG6ZPQEUyz/YS6wqtArqKVCNBLBZl62O6rXib6KluTTbjLPz3cVL8zVOiQwX55S8w9kD1F7RjlR+vX7eiGKYaH9M8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747733; c=relaxed/simple;
	bh=o9yuSfZ0rL7KFjgmuQFQS7Gos/fXHEUA0rjy7Q7QFTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZImnLCHqIRjCBWiIf/F0Rzkpw9QuV7TCQCKW9vbKDy26AYL2vOjNFZEmbqUWj/M3444k7P7pwAl8pjRjBCvGVCk9P+py1mCEp+VGmasmul5DEkRJNnHA2N0PFOwqgC9Wvoq8yLktRdxb6TP1o7HPrx8OJQkER+joIW/qhZj5Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zq9YjJ1S; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F067C43B71;
	Tue, 20 May 2025 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1sd9L5emI5hctcuVVK2i6NFuJ0seKkuCcyLlVlvaMc=;
	b=Zq9YjJ1SAXc3eayD1gssplPjuheKC+6ncRc4CyWiNYFr+hOtaW8Xf+PBI9KUnThPW07XFE
	zkDne0RO+BDyuTsss98pQsnMQC3KLF7uKWxMRSMC+Raa7SnMKOd2Le9f/moap4vcgQjBi0
	9Sckp+fSCc8/K4alxWvmLN1tB9qIehk2xdzKcph+xLjFgeFCqFzCIQ8btW/fQecsqj2bH5
	I9kvsjHv8u3sqOl0vWzfQscVH85CaimLrgQ0yy3aH4w01DS5e7bwx6CvHfjF4BvgRG0yzZ
	bMMFpx2qBkxLvQe9plhmaDtN1Epb1LJEaSEP2xO0xoPYEyHy22jijR1lY0KMiQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 20 May 2025 15:28:33 +0200
Subject: [PATCH v6 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-9-dcb3756be3c6@bootlin.com>
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrt
 ghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

Add request() callback to check if the GPIO descriptor was well registered
in the gpiochip_fwd before using it. This is done to handle the case where
GPIO descriptor is added at runtime in the forwarder.

If at least one GPIO descriptor was not added before the forwarder
registration, we assume the forwarder can sleep as if a GPIO is added at
runtime it may sleep.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 63 ++++++++++++++++++++++++++++++++++++++----
 include/linux/gpio/forwarder.h |  2 ++
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 1c21dd409a25..8901d2c000ed 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -268,6 +268,7 @@ struct gpiochip_fwd {
 		spinlock_t slock;	/* protects tmp[] if !can_sleep */
 	};
 	struct gpiochip_fwd_timing *delay_timings;
+	unsigned long *valid_mask;
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
@@ -276,10 +277,24 @@ struct gpiochip_fwd {
 
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
 
@@ -511,6 +526,21 @@ struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
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
@@ -685,11 +715,16 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
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
@@ -716,24 +751,21 @@ EXPORT_SYMBOL_NS_GPL(devm_gpiochip_fwd_alloc, "GPIO_FORWARDER");
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
@@ -743,6 +775,18 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
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
@@ -753,6 +797,13 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
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
index e21a1b7b1905..45e0190308f0 100644
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
2.39.5



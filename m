Return-Path: <linux-gpio+bounces-17692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE00A655E0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 705AF1899960
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74848248887;
	Mon, 17 Mar 2025 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nqvNh7XK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F772459E6;
	Mon, 17 Mar 2025 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225903; cv=none; b=IPWW6t7UKWVbc7sTQ7X14SEVw23oH/Z4mb+As11Z2DAUGbFzpcJzds/hjoRQ/F94v7rpNGgXQo8+Jy9RNDArn9FjTCoPj+03Kr1fyRL5tGeZyxP82DIhnDQDJTgu0bKOZG/4DdIrsKFikEQ45ap9H6ZUzcaFy9Y0N3OwiwO+Eaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225903; c=relaxed/simple;
	bh=4vwExdkd4/aTsZ+cAr2mwz3WygtkPcekbkMAF0XvE1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5nzElP81dY7Hmjaeca0Sheo2ogRmZ8b9Ao/0vYUg2ZAvQStsN6PyqxjJCHX0hZ7EQW5p2ofrc2K27yRCFVMOggjTGLTzm1xedlWu2KsLYbci2n/Ic1mZZoDD83jVf9VDwxhH0HeF1pyVv5V4qqYIGqD1h6vq5+9Ve9R+eWXMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nqvNh7XK; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1575F20580;
	Mon, 17 Mar 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742225899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOEMAt6ccyt8eSiWxutIUXvmrC5PYEjCmjQH21bUQXU=;
	b=nqvNh7XKPNEIA5AxS0dOXOzwgYv976tFhrBZs9HYGPo2cuN4niKlxuz41RNOt4qg5KpfR6
	6Ct/tU7a262QMgvbD0VeyMh9gMbu8B5ImEIEP7VgHAPR745/vmj8YGTKTQ6axrWRGNyy9Q
	QfDDlLTQGGSiGRsv7GiAVU34YUl4SZ/LkxsJyPsVdCseKEb0+yrzZE1/LSDtmAf5cdoD3S
	73c77rzVxaZf/lFh3hYvmdcrD8012cpPD1XWyOMO2Lbf/boEpTfc5oyeHO026q8c2vu18d
	t6frf0nyGsyLUIEQxsdffpe97Mz/X5CRyyg0NNk74zOZPvsiUcQ2gQZqjR6dxw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 17 Mar 2025 16:38:00 +0100
Subject: [PATCH RFC v2 2/6] gpio: aggregator: refactor the forwarder part.
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-aaeon-up-board-pinctrl-support-v2-2-36126e30aa62@bootlin.com>
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

Prepare the code to create a gpio-fwd library. This library will allow to
create and register a gpiochip forwarder.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 140 +++++++++++++++++++++++++++--------------
 1 file changed, 94 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d668ddb2e81d3..a86e76daf67ab 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -260,6 +260,7 @@ struct gpiochip_fwd_timing {
 };
 
 struct gpiochip_fwd {
+	struct device *dev;
 	struct gpio_chip chip;
 	struct gpio_desc **descs;
 	union {
@@ -466,10 +467,11 @@ static int gpiochip_fwd_delay_of_xlate(struct gpio_chip *chip,
 	return line;
 }
 
-static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *chip,
-					 struct gpiochip_fwd *fwd)
+static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
-	fwd->delay_timings = devm_kcalloc(dev, chip->ngpio,
+	struct gpio_chip *chip = &fwd->chip;
+
+	fwd->delay_timings = devm_kcalloc(fwd->dev, chip->ngpio,
 					  sizeof(*fwd->delay_timings),
 					  GFP_KERNEL);
 	if (!fwd->delay_timings)
@@ -481,63 +483,30 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 	return 0;
 }
 #else
-static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *chip,
-					 struct gpiochip_fwd *fwd)
+static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
 	return 0;
 }
 #endif	/* !CONFIG_OF_GPIO */
 
-/**
- * gpiochip_fwd_create() - Create a new GPIO forwarder
- * @dev: Parent device pointer
- * @ngpios: Number of GPIOs in the forwarder.
- * @descs: Array containing the GPIO descriptors to forward to.
- *         This array must contain @ngpios entries, and must not be deallocated
- *         before the forwarder has been destroyed again.
- * @features: Bitwise ORed features as defined with FWD_FEATURE_*.
- *
- * This function creates a new gpiochip, which forwards all GPIO operations to
- * the passed GPIO descriptors.
- *
- * Return: An opaque object pointer, or an ERR_PTR()-encoded negative error
- *         code on failure.
- */
-static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
-						unsigned int ngpios,
-						struct gpio_desc *descs[],
-						unsigned long features)
+static struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
+						    unsigned int ngpios)
 {
 	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
 	struct gpio_chip *chip;
-	unsigned int i;
-	int error;
 
 	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
 			   GFP_KERNEL);
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
-	chip = &fwd->chip;
+	fwd->descs = devm_kcalloc(dev, ngpios, sizeof(*fwd->descs),
+				  GFP_KERNEL);
 
-	/*
-	 * If any of the GPIO lines are sleeping, then the entire forwarder
-	 * will be sleeping.
-	 * If any of the chips support .set_config(), then the forwarder will
-	 * support setting configs.
-	 */
-	for (i = 0; i < ngpios; i++) {
-		struct gpio_chip *parent = gpiod_to_chip(descs[i]);
+	fwd->dev = dev;
 
-		dev_dbg(dev, "%u => gpio %d irq %d\n", i,
-			desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));
-
-		if (gpiod_cansleep(descs[i]))
-			chip->can_sleep = true;
-		if (parent && parent->set_config)
-			chip->set_config = gpio_fwd_set_config;
-	}
+	chip = &fwd->chip;
 
 	chip->label = label;
 	chip->parent = dev;
@@ -552,20 +521,99 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	chip->to_irq = gpio_fwd_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;
-	fwd->descs = descs;
+
+	return fwd;
+}
+
+static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
+				      unsigned int offset)
+{
+	struct gpio_chip *chip = &fwd->chip;
+	struct gpio_chip *parent = gpiod_to_chip(desc);
+
+	if (offset > chip->ngpio)
+		return -EINVAL;
+
+	if (fwd->descs[offset])
+		return -EEXIST;
+
+	/*
+	 * If any of the GPIO lines are sleeping, then the entire forwarder
+	 * will be sleeping.
+	 * If any of the chips support .set_config(), then the forwarder will
+	 * support setting configs.
+	 */
+	if (gpiod_cansleep(desc))
+		chip->can_sleep = true;
+
+	if (parent && parent->set_config)
+		chip->set_config = gpio_fwd_set_config;
+
+	fwd->descs[offset] = desc;
+
+	dev_dbg(fwd->dev, "%u => gpio %d irq %d\n", offset,
+		desc_to_gpio(desc), gpiod_to_irq(desc));
+
+	return 0;
+}
+
+static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+{
+	struct gpio_chip *chip = &fwd->chip;
+	struct device *dev = fwd->dev;
+	int error;
 
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else
 		spin_lock_init(&fwd->slock);
 
+	error = devm_gpiochip_add_data(dev, chip, fwd);
+
+	return error;
+}
+
+/**
+ * gpiochip_fwd_create() - Create a new GPIO forwarder
+ * @dev: Parent device pointer
+ * @ngpios: Number of GPIOs in the forwarder.
+ * @descs: Array containing the GPIO descriptors to forward to.
+ *         This array must contain @ngpios entries, and must not be deallocated
+ *         before the forwarder has been destroyed again.
+ * @features: Bitwise ORed features as defined with FWD_FEATURE_*.
+ *
+ * This function creates a new gpiochip, which forwards all GPIO operations to
+ * the passed GPIO descriptors.
+ *
+ * Return: An opaque object pointer, or an ERR_PTR()-encoded negative error
+ *         code on failure.
+ */
+static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
+						unsigned int ngpios,
+						struct gpio_desc *descs[],
+						unsigned long features)
+{
+	struct gpiochip_fwd *fwd;
+	unsigned int i;
+	int error;
+
+	fwd = devm_gpiochip_fwd_alloc(dev, ngpios);
+	if (!fwd)
+		return fwd;
+
+	for (i = 0; i < ngpios; i++) {
+		error = gpiochip_fwd_add_gpio_desc(fwd, descs[i], i);
+		if (error)
+			return ERR_PTR(error);
+	}
+
 	if (features & FWD_FEATURE_DELAY) {
-		error = gpiochip_fwd_setup_delay_line(dev, chip, fwd);
+		error = gpiochip_fwd_setup_delay_line(fwd);
 		if (error)
 			return ERR_PTR(error);
 	}
 
-	error = devm_gpiochip_add_data(dev, chip, fwd);
+	error = gpiochip_fwd_register(fwd);
 	if (error)
 		return ERR_PTR(error);
 

-- 
2.39.5



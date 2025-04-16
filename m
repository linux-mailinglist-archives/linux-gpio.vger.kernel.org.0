Return-Path: <linux-gpio+bounces-18963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBFA905F5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C393B8A5FE4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0598C1FBC8B;
	Wed, 16 Apr 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bZXFlDn6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE128200138;
	Wed, 16 Apr 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812504; cv=none; b=NjvZjR73iM0iW6X0MtkeYvRQRXaatpyYWH+YSw3ff7l3W75LZ3KOUapsuH3kIIjWva4dwNQFiVUQqSnpq8rO9c5SOaIB1s0dJ2LHHJRwb3VUuYBrNAYr8+UP+AIisPMj5CpsksPoG7grYKJyzbqgf83K+6HX46T9Nsmkeib9+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812504; c=relaxed/simple;
	bh=XHlcsBAVTL/jD9Tk4g618ODHncR6WfyOtQzZTdE8VtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XncQp6eq5nYBfH4C5Ui+tECO2NxRzZFNqJ9DLLoJjfIzOR8MSphd5MhFbw/gLo7OKrpW/FYSNp/w0gUn++pRdgies4tFaZOh0yeP0ZstsGli0+7nJdzc3891AjOTYHCejyLvdhAsHSFZcqg/T0im7DwFlPjEDdqF9porn9xxLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bZXFlDn6; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F60E43875;
	Wed, 16 Apr 2025 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6n30BiSvWsbJ/WoPUor6tcdp/B/0l5iyRpfJ0iigRDQ=;
	b=bZXFlDn6nl+TUfIrYhBzWLJjLpOD/Q9758cXgTtTbRJYQz3aFDo/36d85aZ0KeoxdqSr2n
	HCtJB3ETBAUWL+7+KdU/VsxJtVfHLdn88DxKeRPu3aK4/H+vWae9OxBSpQFBmgDmEwVEhl
	pk0OGzBxWLoZiFOU2XZ+MXVP0YBlEB2NwDrV3hK5If0Hf7drol+KXqm4ZsZlYhhz7NPWvT
	F7QFDWwdu2tUYPtBhE4p5foj1cmiMFDKhHDmdD6nQwMwOfJ+S8F+wD/jkx9b5FGVHEevc7
	kvbhCtufEq19fjfEBqPvmlw2iP0po99GmcjdiBeNQwn/LGUSOIG1HKlx3ndfeg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:16 +0200
Subject: [PATCH v3 08/10] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-8-f40776bd06ee@bootlin.com>
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

Add request() callback to check if the GPIO descriptor was well registered
in the gpiochip_fwd before to use it. This is done to handle the case
where GPIO descriptor is added at runtime in the forwarder.

If at least one GPIO descriptor was not added before the forwarder
registration, we assume the forwarder can sleep as if a GPIO is added at
runtime it may sleep.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 27 +++++++++++++++++++++------
 include/linux/gpio/forwarder.h |  2 ++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 5743f84e1310..0fb890f0793d 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -260,6 +260,14 @@ static void __exit gpio_aggregator_remove_all(void)
 
 #define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
 
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return fwd->descs[offset] ? 0 : -ENODEV;
+}
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_request, "GPIO_FORWARDER");
+
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
@@ -513,6 +521,7 @@ devm_gpio_fwd_alloc(struct device *dev, unsigned int ngpios)
 	chip->label = label;
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
+	chip->request = gpio_fwd_request;
 	chip->get_direction = gpio_fwd_get_direction;
 	chip->direction_input = gpio_fwd_direction_input;
 	chip->direction_output = gpio_fwd_direction_output;
@@ -531,7 +540,6 @@ EXPORT_SYMBOL_NS_GPL(devm_gpio_fwd_alloc, "GPIO_FORWARDER");
 int gpio_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 			   unsigned int offset)
 {
-	struct gpio_chip *parent = gpiod_to_chip(desc);
 	struct gpio_chip *chip = &fwd->chip;
 
 	if (offset > chip->ngpio)
@@ -543,15 +551,10 @@ int gpio_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
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
@@ -564,8 +567,20 @@ EXPORT_SYMBOL_NS_GPL(gpio_fwd_add_gpio_desc, "GPIO_FORWARDER");
 int gpio_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
+	unsigned int ndescs = 0, i;
 	int error;
 
+	for (i = 0; i < chip->ngpio; i++)
+		if (fwd->descs[i])
+			ndescs++;
+
+	/*
+	 * Some gpio_desc were not registers. They will be registered at runtime
+	 * but we have to suppose they can sleep.
+	 */
+	if (ndescs != chip->ngpio)
+		chip->can_sleep = true;
+
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index 78adfe6f162f..f3fba3c39bda 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -27,6 +27,8 @@ struct gpiochip_fwd {
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
+
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
 
 int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);

-- 
2.39.5



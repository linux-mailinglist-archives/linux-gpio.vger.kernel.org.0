Return-Path: <linux-gpio+bounces-17695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA5A655E5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FEF118998D8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A725624A049;
	Mon, 17 Mar 2025 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fiQnw3FO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F082459EE;
	Mon, 17 Mar 2025 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225904; cv=none; b=CmAIEZygGbDPR5AaOLqhQO3+RmFZTs40cpTnIqPolmKismkMrugVypU3hSS5kcQnPFP46K0QhlkGtBx+gX2RX2szyTAPi1XlyS/7NQQpMzr7dnvuTq+Ou8AFrNycug7zqx+1KKoW5zlPfmym+4mRfTGStqJcWowI745Yj5WHkmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225904; c=relaxed/simple;
	bh=VMAAcL/WwvL21NYlMzVssxdquBcgP0RxtJjIKbPJFO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUiTDah9Pp4z2EzYeXjnDsy8E2GWmeaVA9HJYt0f8t5oW9SF2dARaITz9BSOpTcpsSakimThlfgtZni179s2EUS0KroX3GnYwqSnFegyoHOH5bEywBhdNtJIsJ6/0F/oap06TUCLIiZbiQ4J89J/Pev5oS5fY57kiMWwJmt6wx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fiQnw3FO; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EBCC2058D;
	Mon, 17 Mar 2025 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742225900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xpJPt8JUx5kuaOpf8xU8UQUL/ApFfCPVC40J7NWr08=;
	b=fiQnw3FOG/YTsSWWt5ORo3yVy2wuvsFo3ntvaUbYamrwaxtGb1GO3dCWLuVQ4f3Ajb9DvU
	4qk4mfXq8p/V+hlfAv8C3OvJP2u0tvh6wYhTVg2FEUhfybbJOw4Uxt2ewZ5t3X/nwJPY0D
	deuj+fvxu4EiuaQq0My7BRuZ+vSiMYVszNj+31hGu3g+xFqrPtV6RB8Rgpk9844oYIWXFa
	bdI0FO5q0ietKM/YZDDh2Xiv1AmQXm8vpn3R8ChintYTiC8ZwM74JYAUh7XXY9aiRtHrzm
	2JWQagbty+fwBqvqvWjDA7OD7YX0i5DUiAHC4RI5cQvVQ51UbIgUUof1nH7TMg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 17 Mar 2025 16:38:02 +0100
Subject: [PATCH RFC v2 4/6] gpio: aggregator: handle runtime registration
 of gpio_desc in gpiochip_fwd
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-aaeon-up-board-pinctrl-support-v2-4-36126e30aa62@bootlin.com>
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

Add request() callback to check if the GPIO descriptor was well registered
in the gpiochip_fwd before to use it. This is done to handle the case
where GPIO descriptor is added at runtime in the forwarder.

If at least one GPIO descriptor was not added before the forwarder
registration, we assume the forwarder can sleep as if a GPIO is added at
runtime it may sleep.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 29 ++++++++++++++++++++++-------
 include/linux/gpio/gpio-fwd.h  |  2 ++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 7d00247f5268c..b9026ff2bfdc1 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -260,6 +260,14 @@ static void __exit gpio_aggregator_remove_all(void)
 
 #define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
 
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return fwd->descs[offset] ? 0 : -ENXIO;
+}
+EXPORT_SYMBOL_GPL(gpio_fwd_request);
+
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
@@ -505,6 +513,7 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
 	chip->label = label;
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
+	chip->request = gpio_fwd_request;
 	chip->get_direction = gpio_fwd_get_direction;
 	chip->direction_input = gpio_fwd_direction_input;
 	chip->direction_output = gpio_fwd_direction_output;
@@ -524,7 +533,6 @@ int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 			       unsigned int offset)
 {
 	struct gpio_chip *chip = &fwd->chip;
-	struct gpio_chip *parent = gpiod_to_chip(desc);
 
 	if (offset > chip->ngpio)
 		return -EINVAL;
@@ -535,15 +543,10 @@ int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
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
 
 	dev_dbg(fwd->dev, "%u => gpio %d irq %d\n", offset,
@@ -557,7 +560,19 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 {
 	struct gpio_chip *chip = &fwd->chip;
 	struct device *dev = fwd->dev;
-	int error;
+	int ndescs = 0;
+	int error, i;
+
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
 
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
diff --git a/include/linux/gpio/gpio-fwd.h b/include/linux/gpio/gpio-fwd.h
index d705b6d7ad76a..80ec34ee282fc 100644
--- a/include/linux/gpio/gpio-fwd.h
+++ b/include/linux/gpio/gpio-fwd.h
@@ -19,6 +19,8 @@ struct gpiochip_fwd {
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
+int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
+
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
 
 int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset);

-- 
2.39.5



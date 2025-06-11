Return-Path: <linux-gpio+bounces-21346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F423AD4F24
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363F517F872
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3CE2620D2;
	Wed, 11 Jun 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pHMA5+I/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014025F785;
	Wed, 11 Jun 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632424; cv=none; b=o9Y33Rsf7wThPOAq4/G4ywuzBzG9AOqpLQWUrIpVL7tsoqVWSHslzwo/c3BmTPoOFl97/NJdE0OiLqq8dsn6LUIxXnFgPhesw4TGX7RHMyed6o7BQf8A+GcBNJAt7YI1JMVMyIrpNI3OPI/jPEyuknq8UNjht/dye1P6mSQ6om4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632424; c=relaxed/simple;
	bh=41oKepKpYU0m8ypYcTu1D/Elc2cVO3p9QdMctvoAPLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJH4UDXph5bdXB7iuR8b7bnC/oPmUYQgpiPK0DXsmNJW/PW5nwodBaJd0jmmufneaDjq2qwuWHNCuso3iXpKBy1mCanUm+g1AAtctygII8hneOy6MULkjjgouuyD8LYCLPYXLQA/LA6AXZ+iFpBPd+N5ryNujRkyny7v6L2KlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pHMA5+I/; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF723439EE;
	Wed, 11 Jun 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749632419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcWRNHC5VdvLObEjZlnfNKISP+IeJpfM6USdlnuoE10=;
	b=pHMA5+I/l9k7iAfLxNlROrmtKlZijG8JLEK7n/CCceSAb/8edMF3vxRe8qEkP7O/TtLgbA
	pHNHcukMTSNkg0+b0151z3WrQMrV7sfvcwX6TE5S5mB4vMMHqIPzX/VqBYyyD2oo1XLoyl
	Dh+LeyUDxmiXUGB6hwxEugUU4BPe1EpkxvvyZdpJuSPzHBctC+89Cf+QsmmpzBloVD15Qi
	fDx4RtbGXLxO4G7mU4sEk2hIPNlsLGsH70EMuzqOEpYqzDIB4JBDburiOA8Ue/DUT9KJgg
	1JO7BP7lPj2oTp70xDz6PbyclBEoVYD9PaNR26xNLpRHZZ/p1KBKe0hoTr56vg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Jun 2025 11:00:10 +0200
Subject: [PATCH v8 05/10] gpio: aggregator: update
 gpiochip_fwd_setup_delay_line() parameters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-aaeon-up-board-pinctrl-support-v8-5-3693115599fe@bootlin.com>
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
In-Reply-To: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Remove useless parameters of gpiochip_fwd_setup_delay_line().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 028ac79758d2..f1f48ceed75f 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -453,10 +453,11 @@ static int gpiochip_fwd_delay_of_xlate(struct gpio_chip *chip,
 	return line;
 }
 
-static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *chip,
-					 struct gpiochip_fwd *fwd)
+static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
-	fwd->delay_timings = devm_kcalloc(dev, chip->ngpio,
+	struct gpio_chip *chip = &fwd->chip;
+
+	fwd->delay_timings = devm_kcalloc(chip->parent, chip->ngpio,
 					  sizeof(*fwd->delay_timings),
 					  GFP_KERNEL);
 	if (!fwd->delay_timings)
@@ -468,8 +469,7 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 	return 0;
 }
 #else
-static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *chip,
-					 struct gpiochip_fwd *fwd)
+static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
 	return 0;
 }
@@ -571,7 +571,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 						unsigned long features)
 {
 	struct gpiochip_fwd *fwd;
-	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
 
@@ -579,8 +578,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	if (IS_ERR(fwd))
 		return fwd;
 
-	chip = &fwd->chip;
-
 	for (i = 0; i < ngpios; i++) {
 		error = gpiochip_fwd_desc_add(fwd, descs[i], i);
 		if (error)
@@ -588,7 +585,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	}
 
 	if (features & FWD_FEATURE_DELAY) {
-		error = gpiochip_fwd_setup_delay_line(dev, chip, fwd);
+		error = gpiochip_fwd_setup_delay_line(fwd);
 		if (error)
 			return ERR_PTR(error);
 	}

-- 
2.39.5



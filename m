Return-Path: <linux-gpio+bounces-21343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EECDAD4F20
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1023A8C8B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF55625FA2D;
	Wed, 11 Jun 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IO92zb3w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D225A357;
	Wed, 11 Jun 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632422; cv=none; b=WhcknQCQ6LuSWiTH7KC4/IskGKfty+919IIeicSUg7aruwjrWN/QR7pAnlL1dt6PphavMLBNVFlZF73mVldoP12Wkqaru/iPULXmMuIpCk/hyGN23afmu0C1m9mLoMzMANjc/uDn2eFhYtAcgFd6HP7RlT/bW5jXhNmnAjVOk+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632422; c=relaxed/simple;
	bh=hvvEJnY37tRdbZi05MXx+RghcNgxQldkNULaKTnghls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLy0S4sva4UDvITd8fcgAUCRXqGc4hqYYlouN/UXpKvJ9fjfKKXJQjqvd1s/3EB2N84XZpcrR68rcOoBFBWUISvBicucJss1NSuqbhlHwmkN7HmqXeVzDiLpNlwKH8njV5HsFOakzoIcvVpCxc1Am7En5oQQhKMnDJfn8Ca7F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IO92zb3w; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E5A2432F4;
	Wed, 11 Jun 2025 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749632418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xewKhOp0mBPwnkiZS/NAIbre5TjVJqSCzZ2dfZW/xU=;
	b=IO92zb3wp7N4bROF7nxD4OiSldk6yOVfZreYNQZi5MO705XxFP+wJrSEhHtw2whShnI/vI
	sOOFk/4nCUPf+lvpdhIn2kV5wom4TgD4miGSh5x4zTTEUPNbT9xHXDzNvf+Z+MjOwQtF3A
	gRTrcfPeZC4WFKuMb1ylliPycBN1uihqurIt6onJfPGOoEZcvGHZoyK8bTJut2F0x1U9Kr
	+x+g+g5pbhWbUsoFs5G0kDPMN5fLQdvX3SZ8ympMLb2DeIQnPb7MuyO37/Gx/kh1ZF9tux
	D/+ChKvF/0BhLJg99+vxAPR/WoDUkvjlUXIhySqeOUg9enPLGGAEFoXD3AuPWw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Jun 2025 11:00:08 +0200
Subject: [PATCH v8 03/10] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-aaeon-up-board-pinctrl-support-v8-3-3693115599fe@bootlin.com>
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

Create a dedicated function to add a GPIO desc in the forwarder. Instead of
saving a GPIO descs array pointer, now the GPIO descs are passed one by one
to the forwarder which registers them in its own array. So after the call
of gpiochip_fwd_create(), the passed array can be free.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 59 ++++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index f79bb4e12b20..6285c3e8f6b8 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -485,6 +485,10 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
+	fwd->descs = devm_kcalloc(dev, ngpios, sizeof(*fwd->descs), GFP_KERNEL);
+	if (!fwd->descs)
+		return ERR_PTR(-ENOMEM);
+
 	chip = &fwd->chip;
 
 	chip->label = dev_name(dev);
@@ -504,13 +508,43 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 	return fwd;
 }
 
+static int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
+				 struct gpio_desc *desc,
+				 unsigned int offset)
+{
+	struct gpio_chip *parent = gpiod_to_chip(desc);
+	struct gpio_chip *chip = &fwd->chip;
+
+	if (offset > chip->ngpio)
+		return -EINVAL;
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
+	dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
+		desc_to_gpio(desc), gpiod_to_irq(desc));
+
+	return 0;
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
  * @ngpios: Number of GPIOs in the forwarder.
  * @descs: Array containing the GPIO descriptors to forward to.
- *         This array must contain @ngpios entries, and must not be deallocated
- *         before the forwarder has been destroyed again.
+ *         This array must contain @ngpios entries, and can be deallocated
+ *         as the forwarder has its own array.
  * @features: Bitwise ORed features as defined with FWD_FEATURE_*.
  *
  * This function creates a new gpiochip, which forwards all GPIO operations to
@@ -535,26 +569,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 
 	chip = &fwd->chip;
 
-	/*
-	 * If any of the GPIO lines are sleeping, then the entire forwarder
-	 * will be sleeping.
-	 * If any of the chips support .set_config(), then the forwarder will
-	 * support setting configs.
-	 */
 	for (i = 0; i < ngpios; i++) {
-		struct gpio_chip *parent = gpiod_to_chip(descs[i]);
-
-		dev_dbg(dev, "%u => gpio %d irq %d\n", i,
-			desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));
-
-		if (gpiod_cansleep(descs[i]))
-			chip->can_sleep = true;
-		if (parent && parent->set_config)
-			chip->set_config = gpio_fwd_set_config;
+		error = gpiochip_fwd_desc_add(fwd, descs[i], i);
+		if (error)
+			return ERR_PTR(error);
 	}
 
-	fwd->descs = descs;
-
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else
@@ -1348,6 +1368,7 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 		return PTR_ERR(fwd);
 
 	platform_set_drvdata(pdev, fwd);
+	devm_kfree(dev, descs);
 	return 0;
 }
 

-- 
2.39.5



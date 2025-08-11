Return-Path: <linux-gpio+bounces-24176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8CB20A1B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B672A3142
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C047D2DEA96;
	Mon, 11 Aug 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QtRGcm5R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD12DAFA3;
	Mon, 11 Aug 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918763; cv=none; b=fvnL9+FExIlw0spevz2/XrjLxoQEarNgEvqUHkEyRlKWNUbEjY3Oa+TkZkk7Hx7WANlrS2AMxL1YrA88u+iuKFONkaExxJQslsdggmFKjVWTd5BWVaF4TAsq4G9Wbv6D8vpNbdNDaT3qM0XKwOkTY6ziDU2KkMxRiAnqJtO0rm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918763; c=relaxed/simple;
	bh=Byax4oRZXanb1Ev5aFmWFK9zsBF1XWJf5iSLRJZwAjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfCBhVvCttEqBP5JpDZHoM03+jez6PG6pIPLtTxbgyxV4ed1eE8w4mXJR0LOqz4WEGpuj4FPOJgKwNNlv96sIE3eXfJev4PHqGRb10W17BK4n3HwAd6cyPEfe54n+G3btCrg/h8E9ZZjE4eyZ3wWr45YKLYFx6VED3gsctLQ0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QtRGcm5R; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C06F64441E;
	Mon, 11 Aug 2025 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBDBrSe25kJfGxcGC1XtkMk4s9I8YdzG1wlbRpl1Czw=;
	b=QtRGcm5Rim8iAoRZPlgiYfkifIJP5iDsR4fZM4LJyKrwVOYpVXqh/G5cNGiBOP2rWmiBda
	sBWPlgyRnblVJ4EqEKgWKl5Wgf/QR14cEKvIbAdl4mwmagBavwiei6WsL/rFr6Myf3pDZO
	lFioQcQ0PCd5M11i3Z1aPQDzFNVl2lqcmsUV6xnDXzcFojdJ7eXbq3ok1VrIT2BThM8o2R
	BSwZ6CZCgWO9Cuov2+ut0yDHB/9fzplbT1ni9bta/WUXKnp45WnNI6lSNZ1X5QVxj5TXwE
	XX2ON6FpJQubejTC68qSiPB5o4UFBlkCAoiLpMj81VbQOSrpW6xmpXpAHbGs+w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 11 Aug 2025 15:25:46 +0200
Subject: [PATCH v9 03/10] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-3-29f0cbbdfb30@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtt
 hhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Create a dedicated function to add a GPIO desc in the forwarder. Instead of
saving a GPIO descs array pointer, now the GPIO descs are passed one by one
to the forwarder which registers them in its own array. So after the call
of gpiochip_fwd_create(), the passed array can be free.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 59 ++++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 75c8d0deef2fe25faa61bd5b48af3e74e3817957..43e488ee83834417b12bd23b177cc74b7d28faef 100644
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
2.47.2



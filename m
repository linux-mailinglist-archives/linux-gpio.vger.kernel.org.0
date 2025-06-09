Return-Path: <linux-gpio+bounces-21116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B191DAD1AFF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50BCF188D216
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459362517AF;
	Mon,  9 Jun 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IdGsyh9F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1722AE75;
	Mon,  9 Jun 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462674; cv=none; b=BYKmhGPqWEO2o5rkMA4GkRUOqepnMXXNMn9SoR/CY2gm3fLd7B47vxoGUdzIjZeeBEuS1xuh3sPIKHbhgljCIiKRHcmY1DuRTDCSGmSydxvm4Hpblq5C1zjDQtTFnIRNesBqi7LV4S6qYTQMzuk++kKCoKfdKZLFdVGhKkJ3/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462674; c=relaxed/simple;
	bh=hvvEJnY37tRdbZi05MXx+RghcNgxQldkNULaKTnghls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7RCXx2toQEzEF8GXyJfCbR+2x1XjJN7G1fZXnK3chGiN+QE9V9uldIcQY+Oqx/yLSgPrVdDCjhIBaEJQFCvxKotDR96npcTTC8DVJscNEUzBVDLUX9tqKaA/UhaHWrn6ML/BidcpQ6K2oOzXm6pGMwKhZvnFZfipFTh4fY0EMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IdGsyh9F; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B24C5439F5;
	Mon,  9 Jun 2025 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xewKhOp0mBPwnkiZS/NAIbre5TjVJqSCzZ2dfZW/xU=;
	b=IdGsyh9Fz2WXUe4Njaq3xdy1SWMo+YRhjjCyWG9qHOxshf7F+HmINYik0nCxh7UuE6GZ7t
	HhR2jUIrmlkUAiR3qThX9tp6pP4Y1iY1xl2gZnn8m1ArmtlYtR7VqAzyCyloUJ0QKnwKlG
	F352qg7SBaPGNASMFOQ3qvmn/j5zSWZXDuRDsAmkmkflq7J4s16U+fVvDrHv8/LB7s7YUK
	01cKtnVS/A9ED8qBFBm50+8I81GFENHYmYGZEExzL5AJPaRuqKKMfzoBtxDDS7tz5P/XCx
	huJ5FRa2P/XqMGVGk3KNJgE7luKdF6IbauOtPEiEKOaDcjTot0s1j72r84SHuQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 11:51:01 +0200
Subject: [PATCH v7 03/10] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-3-1ab73ec0cb98@bootlin.com>
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
In-Reply-To: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
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



Return-Path: <linux-gpio+bounces-20343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD26FABD967
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF94E8C1A7A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2427E246773;
	Tue, 20 May 2025 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hm9LDvUN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F44242D8C;
	Tue, 20 May 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747736; cv=none; b=aIngGCkaVodqV2HyKN6phCG4+yP1OLPYaOI1cx0gfsK/IVht36qICYbL0d+crz1k06LQ5WK3Y3p2qdA/3+aw9JLLTTlsu+xROnFhxqP8VQXlHx3ELyRONw6onSPuJ9E3wI2uLO7w5qiJWlbnVVvhgVVDnpEk05sbvqlZCUb7IyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747736; c=relaxed/simple;
	bh=nCAKnSASnpn+6Ho/EYarjD1cfMrmPMLqLqaztpN0k+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hwc0tEenAqpeMT6z7DBOLQCz8V11cXl+H0aPTqZj3nKNRVjuTXmwRzMuFdpRbdPwiMwLMiOCCr3KLYMf0jqpgvbTrQq8h5uzI1QUQ62qNwL5ZEonKFoMyPoRwJ3scdz2Ii9YRYjmFE+lLzd1rDsKhW8ae71pWJjaF7G5kvzEhPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hm9LDvUN; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2289143B57;
	Tue, 20 May 2025 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xyMefgQ0mbE+hBBY4Y1ke8A5E10K93xV2YGEkCqM1go=;
	b=Hm9LDvUNbQ3SLxcAz8AWba7z8n0fXpA1iASM3y/i1oMQvMCAsXZ0M3hlglXGPhJtsqLHuN
	+22g0zC5X88XlpDSOChzXEL+ZrHPmXElnUnyyBuqfSeE7eJj3KfIlnUgMx57HisDC9/SQQ
	Xnai2DfueGFeSd1azwNNJMlyrYr6y5XcsQTrMtmQy1Fu9Iz219gzRvvDpi8G+BliyH+c6S
	eFE6Xr6GLLNilpl5YzfFz+cl6vwIFOQTjW0Tl5CK8sKx9aWnUm542NNmQ5YaYZH4xw9uuC
	SAA7ECioP+EFsAzOng8GKO280mtWAtBNSDiQ4noz9baPWLfzEv3aaJpEMKn4Mw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 20 May 2025 15:28:29 +0200
Subject: [PATCH v6 05/12] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-5-dcb3756be3c6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrt
 ghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
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
index 754680fd810f..ed3fb6abec09 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -508,6 +508,10 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
+	fwd->descs = devm_kcalloc(dev, ngpios, sizeof(*fwd->descs), GFP_KERNEL);
+	if (!fwd->descs)
+		return ERR_PTR(-ENOMEM);
+
 	chip = &fwd->chip;
 
 	chip->label = dev_name(dev);
@@ -527,13 +531,43 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
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
@@ -558,26 +592,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 
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
@@ -629,6 +649,7 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 		return PTR_ERR(fwd);
 
 	platform_set_drvdata(pdev, fwd);
+	devm_kfree(dev, descs);
 	return 0;
 }
 

-- 
2.39.5



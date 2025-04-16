Return-Path: <linux-gpio+bounces-18958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1361A905D5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D105461CDC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10C81F9F73;
	Wed, 16 Apr 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FSj97sqQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1E1F462D;
	Wed, 16 Apr 2025 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812500; cv=none; b=gOy7/3ceEY4bRBRWRyAd7dt/m534UN85dPXpIiQ2vWb1XD21HDMtBoxYXJZANQWEq4yRiJGa2aa5jMAoPHVtv4fxVs9IIgKRtG/huztsNMpJDpFDMvKjL/RDywyUHetGxNy+4HJJEoc0ypWv2Eg0WedWCga/kZmnHll5KmjnOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812500; c=relaxed/simple;
	bh=LHIlwQGLVuPb56ZqRqLwHBU3obc+DKMsySoKzfXQZko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGenKuZAnVH2cErBoVoi8/a5FDRReNCPRSacLWj+NtHd6UH/oAcMUbM4ALc+BTwipQP+cp21Soq+i0Ea1MBJhuSkdM38o7RDdjPbqRikfhfxK9AsM3RkHc1u3fBmlYc120qxzbN+YUsD7llOIQ/M7bRLqsjQy43kzd0gJoJp3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FSj97sqQ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11CB443877;
	Wed, 16 Apr 2025 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5e15nXzy2X8tL+I2OXTCPtB9avL+H+q/yb5U9xroew=;
	b=FSj97sqQ9DKeh1IYuHdgY7EH7ELElOohZGtw+dO7L5p9l6MCQSq5wyhdw8JnisFpl/15Sv
	966y8flpB9TG6Ru1WQwn7Lv64e9g2r4Fq7GGZseXKz//c2eZrKJCq8YLct8ABuXGRxMmJf
	vmTJL8sRi2ZLeBf7S+44XYEDBPL+Ezwz+HihhFC0BaUIim/a/hUFvY3e4pUzPj6o6F4gAj
	nIW5DaOlm4QgsE7ShUKOYUQTo5AMrnljY51Ghfn3xCJX76TTpl7sg4xKS5eJxAp1RSqAi5
	idvT1T45uN+7soDQWc8f6Zyhl8xDj0RDR3+ME78XYHqexphoEOiOH2iA0G9Pmg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:12 +0200
Subject: [PATCH v3 04/10] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-4-f40776bd06ee@bootlin.com>
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

Create a dedicated function to add a GPIO desc in the forwarder. Instead of
passing an array of GPIO desc, now the GPIO desc are passed on by one to
the forwarder.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 57 +++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index a5e3ae4d8813..4d6e41e02659 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -510,6 +510,10 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
+	fwd->descs = devm_kcalloc(dev, ngpios, sizeof(*fwd->descs), GFP_KERNEL);
+	if (!fwd->descs)
+		return ERR_PTR(-ENOMEM);
+
 	chip = &fwd->chip;
 
 	chip->label = label;
@@ -529,6 +533,39 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
 	return fwd;
 }
 
+static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
+				      struct gpio_desc *desc,
+				      unsigned int offset)
+{
+	struct gpio_chip *parent = gpiod_to_chip(desc);
+	struct gpio_chip *chip = &fwd->chip;
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
+	dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
+		desc_to_gpio(desc), gpiod_to_irq(desc));
+
+	return 0;
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -560,26 +597,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 
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
+		error = gpiochip_fwd_add_gpio_desc(fwd, descs[i], i);
+		if (error)
+			return ERR_PTR(error);
 	}
 
-	fwd->descs = descs;
-
 	if (chip->can_sleep)
 		mutex_init(&fwd->mlock);
 	else

-- 
2.39.5



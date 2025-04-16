Return-Path: <linux-gpio+bounces-18960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF966A905DA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B48116E739
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565BC200112;
	Wed, 16 Apr 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S0ab/Feq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE8A1F8755;
	Wed, 16 Apr 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812502; cv=none; b=em+b5RtkViDuRJsyq7Qmx+gY/q48m+KI4VlMZTSjed9Z4l/Lo73jhE1s/a39hFfMFB218w3xvCVPa3tqJo20+nYcHN4Vk7I+OB/bxXTCFo68jgPW3kSkI4gicZRGexA5pr752qmuZ5Yb09MJRjpQw0gdoDivrcwkaDEy759LrDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812502; c=relaxed/simple;
	bh=IUSSnH50SEv3wK+IpC9qmWyKF/i4h3ZwyjGbfYa21u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkrDmKTShiMDm0Ah9XxUiy6xdwbp+sC0/htmNsB+wwfNhhkv/l5HDDjD8FaO1FisocJutnrq6JHNFXYwiM6NvTUcSnFFnA7HJY8/48OTkMQlnny+zzzIpYmvqqwTCc6yR2uEmuphXeQn1UcYUewj9n622pqrg32ix4GVpTmOJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S0ab/Feq; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 552F44314D;
	Wed, 16 Apr 2025 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53EIucSGozzlxQnWzP+KpPtvBMYT/F8TJYe8VlTnG/Y=;
	b=S0ab/FeqPsNsvikHIQ5o7MFem0JlpYxEG1Rh3/2dp5LHR/QWRhYc26G2+6E0xCTyFcT3Sc
	qLGj0CHPzL/oc68Gbui2cOf/PdilYL1n9I0nTAg/ehVnM7mhtULSOxMmupM4TmoaWS7S3k
	VjFhesZnqtuu3yzjt3rfNx/P0xYRCLZZv5lQVBcEQsQIoEscYg1f8m9OQ1ASchMZAW2MVO
	I5J9Uuyq2etE1erg36xU75wIwTEy10tW8OrGQB4vp754Eyi3Nrq4K4RR1cNMM54JR/qUSE
	uWLKEmOlEwXUHBhsZRhBKWVZYvqdekuPzG9z5v9mBYaYt+ZDkcJ+jR7cOhNe4A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:13 +0200
Subject: [PATCH v3 05/10] gpio: aggregator: refactor the forwarder
 registration part
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-5-f40776bd06ee@bootlin.com>
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

Add a new function gpiochip_fwd_register(), which finalizes the
initialization of the forwarder and registers the corresponding gpiochip.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 4d6e41e02659..66ea3daafc03 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -566,6 +566,21 @@ static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
 	return 0;
 }
 
+static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+{
+	struct gpio_chip *chip = &fwd->chip;
+	int error;
+
+	if (chip->can_sleep)
+		mutex_init(&fwd->mlock);
+	else
+		spin_lock_init(&fwd->slock);
+
+	error = devm_gpiochip_add_data(chip->parent, chip, fwd);
+
+	return error;
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -603,18 +618,13 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	if (chip->can_sleep)
-		mutex_init(&fwd->mlock);
-	else
-		spin_lock_init(&fwd->slock);
-
 	if (features & FWD_FEATURE_DELAY) {
 		error = gpiochip_fwd_setup_delay_line(dev, chip, fwd);
 		if (error)
 			return ERR_PTR(error);
 	}
 
-	error = devm_gpiochip_add_data(dev, chip, fwd);
+	error = gpiochip_fwd_register(fwd);
 	if (error)
 		return ERR_PTR(error);
 

-- 
2.39.5



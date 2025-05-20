Return-Path: <linux-gpio+bounces-20342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2059ABD964
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 078808C1A37
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38E2459FE;
	Tue, 20 May 2025 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DcK+kvr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA2242D8D;
	Tue, 20 May 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747736; cv=none; b=c4okl2zbjAvPvmaPxuRT9tO0foy0r1RFDCooymafKQUY3aerx12XtBQd2BzhV+1lbd6hKWohV21d6rrG7HNJGYAdwNv/wnMPmEaPs3sYF/qO6riWtgxqu7/DB91LkR7gdLVa3lnhjgv+nlVjiihIT43jVDqqCm8CmLOgK5AOOE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747736; c=relaxed/simple;
	bh=0dKwVVxTFbuERDVfIQsuNw6xLxNSwbcveYgMiYLFAes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhzacvC4EH4HQlljBGpLkq/wNI4J1HXROA80/CgtCS9r1LoOUSU3Bw6Rh4d54dRsw/7KSvWsIghBo6YDW98MxYMkpsmGuvmWxwHPyUgT/KjBMwmRtTSmLtmaOYqwX43g0t3LJtOpLeCnmAXmN2Omln6NIpM4yHmoUIbB6pChx68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DcK+kvr9; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E311943B65;
	Tue, 20 May 2025 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcNHm5z8ozWFaCp6iHOGdp6n4XI5+GhgZ4Xwe4UzJcY=;
	b=DcK+kvr9psYA6fbwh8sj23/FgyonnHYgT4khOVyYAQDGYRizjIMayklfaOY5HMFrZ+k73I
	luZCOSK2MjcHb2lOVnOjH4wjoLFLb3uEldQX+TtFxMWe1FprA3URoQjHq8+8cTolmL9mqW
	dVRPEfU4W97S2VhaCgudyOJXQlwOUnzeUUZNn9GMt9CQj4UIke3ImPCRu12sZ1M+7mShwN
	Kn1ByclyJAuCdpIbjqfstDvce5cutdhJNAGM6cs2+3oyaQxCV4DCt24d9JXPln1MILLBGH
	rbFdOVe5/g2q4k53qIPxs1SPOI7DQAWkVov2tdH31lhcZOfpsfnQT4yZEb6y1w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 20 May 2025 15:28:30 +0200
Subject: [PATCH v6 06/12] gpio: aggregator: refactor the forwarder
 registration part
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-6-dcb3756be3c6@bootlin.com>
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

Add a new function gpiochip_fwd_register(), which finalizes the
initialization of the forwarder and registers the corresponding gpiochip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index ed3fb6abec09..3a10291fcc61 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -561,6 +561,18 @@ static int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
 	return 0;
 }
 
+static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+{
+	struct gpio_chip *chip = &fwd->chip;
+
+	if (chip->can_sleep)
+		mutex_init(&fwd->mlock);
+	else
+		spin_lock_init(&fwd->slock);
+
+	return devm_gpiochip_add_data(chip->parent, chip, fwd);
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -598,18 +610,13 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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



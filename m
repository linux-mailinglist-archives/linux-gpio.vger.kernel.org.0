Return-Path: <linux-gpio+bounces-21345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947EAD4F22
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF1973A8D8C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1172609C1;
	Wed, 11 Jun 2025 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CWOVmyV4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3D25E806;
	Wed, 11 Jun 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632423; cv=none; b=tLMdPLHWfODPAoEkVE1UEclHutRxYxgFmkCg138kvdfM1pzOt5oRPMZiIwlfOZnlVj8erKKjZSgpNzBKQ59PzjiThEQiMbHM8bqq4EvFywX1P36D5HdpP4KwssVKi8nF8Emi2T9FQglEco2j8t+3wBiA419BfgllgJ4wEuqz1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632423; c=relaxed/simple;
	bh=xePdCpGUw/dupcdXjBwUdPYEfVRH1uIkUMo8amvW3Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgDUz0N8NiTW2RTqAx7XYFavZQ8fhLAds+eU0Ir3vR7Jlycqu/kJaRmwm0al2fwdMXOOx4DO9+aOvNTEW5LCCMz08wv7Uu4yUQAp7D7QuszIihfykcrsLlDMBxX642AWtY/SDVo8xKae7Poe65ATtddTV4LxV5+ufSi0ZjZhAhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CWOVmyV4; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C681439EC;
	Wed, 11 Jun 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749632418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOUaArEGsRcJcBEJqASG5UFqwnkvCe4U51LXcIbmX2U=;
	b=CWOVmyV4KNjmbssMdAM4dg9Vae3J+KDvhzjkYLrevmpuwtrKJjAISxsZ3QkOUDJ3eNgfTr
	5totY57xPZMjVr1X1ToJSdrpk5GE2YE/LJIfuUidv06RrX5+VYj35M6FXbTzzVMfhRVuRX
	wMmVwmo1tjcoW0/Vfrzt/j+qU1OIrS7to+C2nJfPwwF9sSQWJ7j2M4rRA9SB8chxzwLh5w
	N2hkqjKKuqFuZ441p06sXDKLQNGVs96z6xf5rDYsq/c82Dot4pMe5MMfbj7SIfOI+9p+VW
	DYq8zZOU3V1pW+24//WBXre/mEhX3GNDuwvp6f9XGfVgmTJvoqV2pLEMJTUnhg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Jun 2025 11:00:09 +0200
Subject: [PATCH v8 04/10] gpio: aggregator: refactor the forwarder
 registration part
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-aaeon-up-board-pinctrl-support-v8-4-3693115599fe@bootlin.com>
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

Add a new function gpiochip_fwd_register(), which finalizes the
initialization of the forwarder and registers the corresponding gpiochip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 6285c3e8f6b8..028ac79758d2 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -538,6 +538,18 @@ static int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
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
@@ -575,18 +587,13 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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



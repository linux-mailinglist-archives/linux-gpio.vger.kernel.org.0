Return-Path: <linux-gpio+bounces-21115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FBAD1AFD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224C816B920
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99A62512DD;
	Mon,  9 Jun 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mBh9Ckty"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7427F22A802;
	Mon,  9 Jun 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462673; cv=none; b=lgxZ1lK+kxT37kKjl6X/A5JlG2GTyNTa0RZES77eTcozjlfU5Jvqdjg3OUSsjmxAW7M2rUQV5vms/laCYn9LnW0md9+2sZ4oUHpG1oYQOm3uFdwAAeh5JRcnMuu+qxq+92BMND/2uZ39TTZl1ZrEAEoiLo9yJUiWP9AWLpQY1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462673; c=relaxed/simple;
	bh=8HjtCRzmPU9oDI03LQRauWInLwTTqBwt/d7idD7nu0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuutuB2lH8ENWbMxUZbj3NJQaKnpT6eoGlXGker/PUH8m7Ju30/uCTY7ZCAksT2M5wszazwX/TTW9wMFOwNijaXEDu9fEY0A1ZT064awt1ZX8sEJNVWJY+06EktGc1oOqgWqRvyd5bWsC+1X3aup6eQFzTBEWoL62XTO3skqThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mBh9Ckty; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E68E439F4;
	Mon,  9 Jun 2025 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMjp1dRGcXDJQ44pKMzil4By3YRk8eex4ZUKlBuDEJ0=;
	b=mBh9CktyKvZNUmwTJyzOBZxfm7nDOG3VNePuGRgAVhNHOEUMuGVf6z0bSMYUeWf4D+iuGb
	7vvjm/C37aIwBOUGxseKvHJ54trPkvgUSls2t7NAq4lI1h21zdjk4K1seT1q+rj6OOriHk
	BedT0bv6CXRsZl5mUSJH4pj0IYhfWzpJcZCP3M9rGJxGd51zDjwUlnJB2NVIeSiOqTdozT
	XBZs7YVSqVTv4k5hSS30GzCgd/Q+/7L5Q1+MrqRkIGzc3zFBCtCuI+q9LFu757ZlgFJmvo
	7+gJwtVFCKn991CIfUw5hDg+vx1zl1eGXd9eiMJ+AIfKja7qw7eUR1vjS9Ufzg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 11:51:00 +0200
Subject: [PATCH v7 02/10] gpio: aggregator: move GPIO forwarder allocation
 in a dedicated function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-2-1ab73ec0cb98@bootlin.com>
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

Move the GPIO forwarder allocation and static initialization in a dedicated
function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 50 +++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 6f941db02c04..f79bb4e12b20 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -475,6 +475,35 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 }
 #endif	/* !CONFIG_OF_GPIO */
 
+static struct gpiochip_fwd *
+devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
+{
+	struct gpiochip_fwd *fwd;
+	struct gpio_chip *chip;
+
+	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)), GFP_KERNEL);
+	if (!fwd)
+		return ERR_PTR(-ENOMEM);
+
+	chip = &fwd->chip;
+
+	chip->label = dev_name(dev);
+	chip->parent = dev;
+	chip->owner = THIS_MODULE;
+	chip->get_direction = gpio_fwd_get_direction;
+	chip->direction_input = gpio_fwd_direction_input;
+	chip->direction_output = gpio_fwd_direction_output;
+	chip->get = gpio_fwd_get;
+	chip->get_multiple = gpio_fwd_get_multiple_locked;
+	chip->set_rv = gpio_fwd_set;
+	chip->set_multiple_rv = gpio_fwd_set_multiple_locked;
+	chip->to_irq = gpio_fwd_to_irq;
+	chip->base = -1;
+	chip->ngpio = ngpios;
+
+	return fwd;
+}
+
 /**
  * gpiochip_fwd_create() - Create a new GPIO forwarder
  * @dev: Parent device pointer
@@ -495,16 +524,14 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 						struct gpio_desc *descs[],
 						unsigned long features)
 {
-	const char *label = dev_name(dev);
 	struct gpiochip_fwd *fwd;
 	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
 
-	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
-			   GFP_KERNEL);
-	if (!fwd)
-		return ERR_PTR(-ENOMEM);
+	fwd = devm_gpiochip_fwd_alloc(dev, ngpios);
+	if (IS_ERR(fwd))
+		return fwd;
 
 	chip = &fwd->chip;
 
@@ -526,19 +553,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			chip->set_config = gpio_fwd_set_config;
 	}
 
-	chip->label = label;
-	chip->parent = dev;
-	chip->owner = THIS_MODULE;
-	chip->get_direction = gpio_fwd_get_direction;
-	chip->direction_input = gpio_fwd_direction_input;
-	chip->direction_output = gpio_fwd_direction_output;
-	chip->get = gpio_fwd_get;
-	chip->get_multiple = gpio_fwd_get_multiple_locked;
-	chip->set_rv = gpio_fwd_set;
-	chip->set_multiple_rv = gpio_fwd_set_multiple_locked;
-	chip->to_irq = gpio_fwd_to_irq;
-	chip->base = -1;
-	chip->ngpio = ngpios;
 	fwd->descs = descs;
 
 	if (chip->can_sleep)

-- 
2.39.5



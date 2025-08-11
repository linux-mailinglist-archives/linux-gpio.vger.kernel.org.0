Return-Path: <linux-gpio+bounces-24178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B156B20A21
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00CA142776F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBD42DFA27;
	Mon, 11 Aug 2025 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IKmBbBD+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8442DCF7B;
	Mon, 11 Aug 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918764; cv=none; b=p8TpX5ibdprEUasAKHuHZSEAcuLjOLUAQ7fYvziXjwzOYqlO74rVLxrUqt3voLYYQbmjWoJYemPvBNg4jke4ZQ6ph9NMythHDNyho7Iuj2QuhS6fGyQrfUKpbTvTTCbNjzo8rAW01q272hCDfbN1cmH5hK96rOX5CjScK7nXBDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918764; c=relaxed/simple;
	bh=A4WhSq2iVR6YTBxQWcKLsaV917OyvNkCliHFMUlfQRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knLTTOgmbz6ApZ9LANetS1B1KkAEcEBb65Y/W2DjzYzsmeXzF7WdrTF4U9vG4QwA1z4yoQQR13/shqsNYup+WBQSHjqxYmpsPji9gEHK5xRmU8fVpNXiGTaI0iHvTkfdlKoT85SbzPIaw1vJOdF2QUKpFrwiN5t7gqfmAtxRHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IKmBbBD+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E015344425;
	Mon, 11 Aug 2025 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucISnieRUY5q/WmtPzcqiAEB+55q8f7Y8FcoGgZrl2w=;
	b=IKmBbBD+ZzYL8+jfP+Clf9E4PAVcmHhHo2bjW6ImX1UDDLEtKn56EUDd7BIHFfUnv8MZXc
	GtsG30Fk9L0wT65OAi8Kkhgo7guYbicYEP9r16khaFet/dHaamZtwiJhjdZRU552LY+I03
	UvS5p5kWjbr2GxTHnCmP8xy8+fNU/klHIqbRfCuYSKMs74y02kBlyqSQ4MUE4+ip6iyh8x
	mSMWz+ukC28izlN+5Zm3BEfsME/jv7uKrivFYLMB7xPXbVgZcvWPSq/NoKbc4bA3pvh1VW
	Wh/2cuyXVNMq5/jvxPouCKyQPW3/lAKruVWJut4Cgc0UGk9J9bDskRjrz806+A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 11 Aug 2025 15:25:48 +0200
Subject: [PATCH v9 05/10] gpio: aggregator: update
 gpiochip_fwd_setup_delay_line() parameters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-5-29f0cbbdfb30@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtt
 hhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Remove useless parameters of gpiochip_fwd_setup_delay_line().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 95415f92843606550e6494776354f918cd58ab6c..cc54d19f2dd11362e685ccab9e06ebe5ca42d141 100644
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
2.47.2



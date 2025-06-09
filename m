Return-Path: <linux-gpio+bounces-21118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B71AD1B04
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27C8188D3D4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A66325394C;
	Mon,  9 Jun 2025 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q9Ho6NU9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380CA23A9B4;
	Mon,  9 Jun 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462675; cv=none; b=eUFFktGa19MrVt/sFGUltyX3s1YF1wK/CYHuEKgtOrTi+NCG190V/76SbQl1hSa1hQ9lWpOaPN6O/N1c4B9x5FNtuFLE32Z07uB9LN3nCnT7bAMgKRS9f/J3H45IRJuyp0iC/+bV4gqxVOMiwp/eP+H4PYua97aPiOEUPgrFdPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462675; c=relaxed/simple;
	bh=41oKepKpYU0m8ypYcTu1D/Elc2cVO3p9QdMctvoAPLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XP16zlwLbETlkkcjzv4LukW1e4g6EE901Ls2ZqJX4Z5hlIOm7WB5XyzuLpGRvqgaKU2/43ox/GtR3QaVHykn7CQ2qHO2n7LP3+O26Ea7QG+IO/JF87ngEJpjJWOTG++RVIccw7mIGr0yIrb+ASSyl5h1q0GJiDK2j6Q0YJzdjxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q9Ho6NU9; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D912F439FC;
	Mon,  9 Jun 2025 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcWRNHC5VdvLObEjZlnfNKISP+IeJpfM6USdlnuoE10=;
	b=Q9Ho6NU9ozrXrrFIKoOSrwQzi5Hlx/se7VnggRACs8wALYsvlgj2hAmAFA2D/e0XlaQHIi
	1kXdigZUprkNGZeXGVE0YHUEEHFJF3TlubVXoMChSiTHhF7QJM3qDS28ki84d09ZcDyGG5
	CRaPIw77jRmIKFR5wMBmL/UC3CDQgnJQZS9RXq/K1NeHhkFbIcKka1jjEO8xVRHHgQHKjE
	n5jokxzjRdJJfKJq4oOaHnC1kzxtUGvwGHMm0rLM1S1PrB2pw2SOdmqwP4zUl9/BuYKGbX
	IPk72reJ2p85UGnyr4YjP2AVlULhQqVgISBRhceprHSOnnl35/+k8dFrcuEGpA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 11:51:03 +0200
Subject: [PATCH v7 05/10] gpio: aggregator: update
 gpiochip_fwd_setup_delay_line() parameters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-5-1ab73ec0cb98@bootlin.com>
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

Remove useless parameters of gpiochip_fwd_setup_delay_line().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 028ac79758d2..f1f48ceed75f 100644
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
2.39.5



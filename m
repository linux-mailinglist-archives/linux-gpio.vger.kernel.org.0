Return-Path: <linux-gpio+bounces-21117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9AAD1B03
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5986316BAA8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2782252907;
	Mon,  9 Jun 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LfyHNzko"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B42622B5A5;
	Mon,  9 Jun 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462674; cv=none; b=VGRCOXdrsKMWh7pQFe0N97ts21zycZlhYX9/1BGvn2s+YCCdcJZyc9FrT9TVd3EJh/CrFHh9Wbc03HkAn6F+olLwbogYGFRi7MoSHEkVoXsvXsqEmLzypKGIPsjXEJLzjrtf0X7P1OU4hgsDhlv6L92TlWxMD0scH6u6qigbi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462674; c=relaxed/simple;
	bh=xePdCpGUw/dupcdXjBwUdPYEfVRH1uIkUMo8amvW3Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5Xw+KqsDsnGSUzTOwordfoj3q9+cFRIHZ5zBiJn7Wu8j4sNYSocmYdmlU+g/iSUpmYBHsv/ULvU8GLK4+8t1na0lXZN5xnW53Bzr5mh966sZhTczc0hEZuzoFTo9ovnoYz1A93IMPqf5H7jGmUSm+zx7j9oqqgLngszpelimQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LfyHNzko; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44135439F9;
	Mon,  9 Jun 2025 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOUaArEGsRcJcBEJqASG5UFqwnkvCe4U51LXcIbmX2U=;
	b=LfyHNzkohp/O0tFzA1aivZdIID5GjSgpHslcCVdsC+2eBlcy5C+QFNQcYn9i58gyPRljqi
	seQAjHRsR5RW4iWvRLlP5mWbCpG2zuIcYFrSG5UIhp9rNAccavde79BvWoB7S005xi2mQv
	tbZDOkc18ylQV2rKXlAcwfW82iKYZeX+WB1oMgRcXqT5oF1DlKarbMwsRlr96Sz0Nr6x4g
	1Ldn4ZAU1HnYI3KUjfwEprGh+eqHGFeL0vW8ILRLdykiorG+5h9domGj/Hdck3ZpACirCo
	B/8mlO/vf4+PrH54M/Ju4ws8HjkSsScx1/HQPQaGrtqoR0cMcrLwc/pDka6b5g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 11:51:02 +0200
Subject: [PATCH v7 04/10] gpio: aggregator: refactor the forwarder
 registration part
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-4-1ab73ec0cb98@bootlin.com>
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



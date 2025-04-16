Return-Path: <linux-gpio+bounces-18961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C45FAA905DD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E3A174703
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7FC1FCFF0;
	Wed, 16 Apr 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XuVsmb6H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F31FBEA4;
	Wed, 16 Apr 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812503; cv=none; b=npP/8hr1wdhaDEVs5eajtkWpmLmGnhkp9pBBpTpTJPrwTw9PkJ9JQLPIIEYzpGcrg9K5dkPgqktrox+1ShT9x1Fo8YiB+wvi2ojf13sJVMMN1Hl3MqjJ86le2BcY8BsoNbH55zjK4ik1TRFHRpjym+ZlusPlkmm5G5iAW6lBMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812503; c=relaxed/simple;
	bh=wyjE0rrh/LjhSKmxz+tCb6np5ZXFrDh6a9pCjVCsjKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLkZePbw9jTTUZUplrFyTJ517xPjx+h9HRaHPdoFxZh9eLfANL6QXOLnlywwB1aSTEfO8l8HEv88PwX4q4cREktWgVOkRkmmeSCR1fz6KqS3uFSNMGN496cohBdREy/tK4534zhTalizHeSgxi0JhPgNmFx4tSAE62+bApgI8Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XuVsmb6H; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0D9543873;
	Wed, 16 Apr 2025 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVMzc3pAxWm+UN6nbaOf7sa0Nb2flxpigVgMOpMnxYw=;
	b=XuVsmb6HkYXYD6TzUoC9/WFGHUFPjqAk5+ID2KEyjPbgPfpfGsOahfqbbXRSUf1YiQkvS0
	M7YrRNp8d0vXoRMaTSVNGGQLsYHeCnNvVW9MPTZyhVa4pVa72vThwKxaSlaZZ8MpQcdu0X
	cZTvlZXQaTcY1kWFNrXdwd0u7Ob9hjDT4zNcloBTwDtO9TMG+w0PVJoe67gA6rxyc71K9x
	I5nhkhqInJrlqMxx87DqjjR8sfEiHLCti0hLQvoWnItJN4dS7uJhH8HCrHoEueJbCF2PyU
	6L4EHA1r0Ypuyfxr98WuXPOjYcpWsHvsaE5FsQf8GgGbqNHxxXPdi+zlyJ8P6g==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:14 +0200
Subject: [PATCH v3 06/10] gpio: aggregator: update
 gpiochip_fwd_setup_delay_line() parameters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-6-f40776bd06ee@bootlin.com>
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

Remove useless parameters of gpiochip_fwd_setup_delay_line().

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 66ea3daafc03..96b82974969d 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -476,10 +476,11 @@ static int gpiochip_fwd_delay_of_xlate(struct gpio_chip *chip,
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
@@ -491,8 +492,7 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 	return 0;
 }
 #else
-static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *chip,
-					 struct gpiochip_fwd *fwd)
+static int gpiochip_fwd_setup_delay_line(struct gpiochip_fwd *fwd)
 {
 	return 0;
 }
@@ -602,7 +602,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 						unsigned long features)
 {
 	struct gpiochip_fwd *fwd;
-	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
 
@@ -610,8 +609,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
-	chip = &fwd->chip;
-
 	for (i = 0; i < ngpios; i++) {
 		error = gpiochip_fwd_add_gpio_desc(fwd, descs[i], i);
 		if (error)
@@ -619,7 +616,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	}
 
 	if (features & FWD_FEATURE_DELAY) {
-		error = gpiochip_fwd_setup_delay_line(dev, chip, fwd);
+		error = gpiochip_fwd_setup_delay_line(fwd);
 		if (error)
 			return ERR_PTR(error);
 	}

-- 
2.39.5



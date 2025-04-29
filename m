Return-Path: <linux-gpio+bounces-19460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177D7AA0E45
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0946484302A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBE62D4B53;
	Tue, 29 Apr 2025 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fn+rSEHo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F3A2D29C9;
	Tue, 29 Apr 2025 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935716; cv=none; b=JSIbHF9No5kKC+SdF9x1/oPyXFDp1p7rDkLK0crfgbea408jvEpI45e6nIT/wNTrQCIHPdi5ssO6usN3972qnIPC7QP2dWK/+II39SErhyxqVTSHfUY1wApgofNBTOtlCqapRwTJ+mT44ggBWlSftDPLtWdRfH95f+k5qBjmueg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935716; c=relaxed/simple;
	bh=EKe+UzX9veD6TaILUtlEkVCP9CGVq+lTFQLZreR96wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxqPdG/Js4vLVyK4CqGOGMIHa2rGcq9GXb95Pj1h1rBvyyaYqTws/jYAbCvYDGuN93MImL42bt9xVS0Yng6kBUkQMgBFNOOezacBKLpBOrBwTYuJbgeSlSE1ZyKttSkhyeB+B3rlMb8CgjG0IkQkS0a9+yp3aMe8CVaHY0sLbz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fn+rSEHo; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A9DB438C2;
	Tue, 29 Apr 2025 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPKK4dr3Fb/gQ9p+w230lWBmcUbe3hF2FrZI/GdB9fM=;
	b=Fn+rSEHo5AkbbOXnlhZmXoykmT5LeROiYPuTrjqV4I0iuhZwtso1K6tUGVLoLGgrFavCmd
	RhNeBp9Tkg09woJ+27o9xVIB1E6Y5F8F9M2S2pYI8T72giGyNl6oxXtKyTdrZOkIRxfAlD
	w+FsIIiADWYFaJ4mBz5OVN/MKsY+8fskOv5k8/taLwhFuVeQKdx9zie/cFg8s0lXgkIKuK
	dXeiXeURsDTizUSR4igXgTGqR9iF2fu1UZRAeC7bAGtu/RVUxHrUN3/tUUKKhygwnFKcW/
	5/OHXtNjnPKyJWEVxV/xkR8nMYHi96PwQazszvgKcEBRRXIR+e0AwU0GVZ7QmQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:21 +0200
Subject: [PATCH v4 07/12] gpio: aggregator: update
 gpiochip_fwd_setup_delay_line() parameters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-7-b3fffc11417d@bootlin.com>
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Remove useless parameters of gpiochip_fwd_setup_delay_line().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 0bf73584df2a..f186572b5c9e 100644
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
@@ -598,7 +598,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 						unsigned long features)
 {
 	struct gpiochip_fwd *fwd;
-	struct gpio_chip *chip;
 	unsigned int i;
 	int error;
 
@@ -606,8 +605,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
-	chip = &fwd->chip;
-
 	for (i = 0; i < ngpios; i++) {
 		error = gpiochip_fwd_gpio_add(fwd, descs[i], i);
 		if (error)
@@ -615,7 +612,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	}
 
 	if (features & FWD_FEATURE_DELAY) {
-		error = gpiochip_fwd_setup_delay_line(dev, chip, fwd);
+		error = gpiochip_fwd_setup_delay_line(fwd);
 		if (error)
 			return ERR_PTR(error);
 	}

-- 
2.39.5



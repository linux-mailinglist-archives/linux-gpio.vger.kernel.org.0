Return-Path: <linux-gpio+bounces-18964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B0A905E2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80EF21676B0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABBD207678;
	Wed, 16 Apr 2025 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W5lH+9rc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39229204F8B;
	Wed, 16 Apr 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812506; cv=none; b=W/AX8J6PcDJYB0TUSsJmKbrFZmeyXUA+PKpxKs+PE3kvpB49PYr8b2RG0zQ1Fs4aKQRbFwAqhObdMfnPYbcKyWbve+ucd+wuz+gPy5Yno4olqagxnqxZa89GmLmzjnMveDpajK8ePELHzBBteNSxLqebVtFB2BiYlKMU2orvk1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812506; c=relaxed/simple;
	bh=/WXzCZe2ww99W1IgVgEkkR6zrAWb/IEZG19L8y/FeS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rb4iRh6bIEaioq+A6xiRBKd2PUKKKjYjTetCgwbFKCYK7ZLlZVZgpIfvk0aBp+7qu+voVO1wq4Kw7GiO9Lz7tsYFAX5Jj5/tgibEolEYxoq2MuJwe0x9Cn/dBFeKws/AWzaAlXoIfDHm3tpS36eoyqid0RB1wblSvDV7uyKO+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W5lH+9rc; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9782D4386C;
	Wed, 16 Apr 2025 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qb31X88n/dWs7Iwg2yuTXrPVZPgIlMX2YRhDH4jubCI=;
	b=W5lH+9rcVfuRNHICiJn24IDDRiEdW7rW/Qpv1v5DFGgo96WqTWOhfVVX3Hp1KwJzP8pmwS
	UlUXulO7tuD1nIR2oPGHNkyTYRBkn+ozlrBidmwyV3DLdTo5IrOKDNcE73h64hBE9t+PyS
	nr0KFkxKlLWw5104tpe7eDOJw6RCmMWSPWpjxUc0MYVsU5aSozLvyBe90VCis3JO48cmM7
	t+RqaZcvz8VEDfSsOD32k3qLcok0lj7tq3H1Hwhql5GIMo+YBT75som6mUUmGRjqI5D2Ud
	VmtJ68Zu2Mz081MvRq9a16aYguu73H/8JaTAZmU6C2QvUD//JyoWcQRHsAWVZQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:17 +0200
Subject: [PATCH v3 09/10] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-9-f40776bd06ee@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffheknecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffhekpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrt
 ghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhl
X-GND-Sasl: thomas.richard@bootlin.com

Add a data pointer to store private data in the forwarder.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 6 ++++--
 include/linux/gpio/forwarder.h | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 0fb890f0793d..9e27ea3f78ec 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -564,7 +564,7 @@ int gpio_fwd_add_gpio_desc(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_add_gpio_desc, "GPIO_FORWARDER");
 
-int gpio_fwd_register(struct gpiochip_fwd *fwd)
+int gpio_fwd_register(struct gpiochip_fwd *fwd, void *data)
 {
 	struct gpio_chip *chip = &fwd->chip;
 	unsigned int ndescs = 0, i;
@@ -586,6 +586,8 @@ int gpio_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	error = devm_gpiochip_add_data(chip->parent, chip, fwd);
 
 	return error;
@@ -632,7 +634,7 @@ static struct gpiochip_fwd *gpio_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	error = gpio_fwd_register(fwd);
+	error = gpio_fwd_register(fwd, NULL);
 	if (error)
 		return ERR_PTR(error);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index f3fba3c39bda..304c793313db 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -18,6 +18,7 @@ struct gpiochip_fwd_timing {
 
 struct gpiochip_fwd {
 	struct gpio_chip chip;
+	void *data;
 	struct gpio_desc **descs;
 	union {
 		struct mutex mlock;	/* protects tmp[] if can_sleep */
@@ -57,6 +58,6 @@ struct gpiochip_fwd *devm_gpio_fwd_alloc(struct device *dev,
 int gpio_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
 			   struct gpio_desc *desc, unsigned int offset);
 
-int gpio_fwd_register(struct gpiochip_fwd *fwd);
+int gpio_fwd_register(struct gpiochip_fwd *fwd, void *data);
 
 #endif

-- 
2.39.5



Return-Path: <linux-gpio+bounces-18959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351CA905D6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C63A171E5D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11381F9F7C;
	Wed, 16 Apr 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VIURbba1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9A1F4629;
	Wed, 16 Apr 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812500; cv=none; b=jopSvmn5VnUB7iYXAULvDNeFwoFKhrG8Pl6BLyunyFidbEJfzM1s71aLvP9+fRoZPbs6UVCBjE4t4r+67x1cwnjDWdugo23xoS0sgmnY8M4A38ysu/bIYvCPZLw6pnEml5K2LzxDkEWC8B3VD+JSiuPp7fs8C8xkAqDbecWbhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812500; c=relaxed/simple;
	bh=xe/iHdNUbRWY8ph2m/sMx3WsY6MqUEGtkEiU+Pt5zBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Txsby0/A0IJLQUfeoItlpAh8/7gsGvK6hRuLlyHjlG3Ooc6QI+rjn7YuODWFNxtM2RXKNFY58emFkot6fls3khVFgFocGIA7WYm5mg0Q7beNij5mJe7hAlAKNX8ubTMEuGmarvE61SAGf+e7/CYf9eGiUBWaaIknbRrhvYoqyiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VIURbba1; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00D5F4386C;
	Wed, 16 Apr 2025 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmTpTZDU/4RdRhaUbj82fIw4RwehjZBATlmwP/BesC0=;
	b=VIURbba1mlhwA+49Bt6YqJ9N/LFj8HQI5+0MG0o5ToxY389IB083EGNNYf878Zaml5rjdh
	sImHY0WAgEWYHEzti52vStMhXZovF/wEAgAlyFwbwSV9pzQVeZ1YZKq6rt5yjjNyGTqNva
	ofBfziRA+yuJNwha5YsMY8QNqMwiGBfnHjpK7nO+EVg+v8mheaUWbhUs8wfh27oT+ObJJ4
	/pP1Zpfn5DdCg/56+RpvqF3nTBAoEYpycABfnu7hQ6+PZFdmm5b2OZ5kMjuQSLH36mow/D
	DV0ODR6otEylSx8cmIsZuB4me6fwuXtCCbVcuG5XLulU4096C1HkHTJgYWj3XQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:11 +0200
Subject: [PATCH v3 03/10] gpio: aggregator: move GPIO forwarder allocation
 in a dedicated function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-3-f40776bd06ee@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffheknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtleemugdtgeejmeelieefrgemvdgvfhdumedujeeimeejsgegudemudhffhekpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrt
 ghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhl
X-GND-Sasl: thomas.richard@bootlin.com

Move the GPIO forwarder allocation and static initialization in a dedicated
function.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 48 ++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d232ea865356..a5e3ae4d8813 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -498,6 +498,37 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
 }
 #endif	/* !CONFIG_OF_GPIO */
 
+static struct gpiochip_fwd *
+devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
+{
+	const char *label = dev_name(dev);
+	struct gpiochip_fwd *fwd;
+	struct gpio_chip *chip;
+
+	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
+			   GFP_KERNEL);
+	if (!fwd)
+		return ERR_PTR(-ENOMEM);
+
+	chip = &fwd->chip;
+
+	chip->label = label;
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
@@ -518,14 +549,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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
+	fwd = devm_gpiochip_fwd_alloc(dev, ngpios);
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
@@ -549,19 +578,6 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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



Return-Path: <linux-gpio+bounces-24175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36698B20A1C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3246B18A6D45
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C9F2DEA7B;
	Mon, 11 Aug 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WelN54sK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F1B2D9784;
	Mon, 11 Aug 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918763; cv=none; b=Hll6g5ATv7/DaFU8UgXYjT3v3cPpQSap7PF2BNKrjDoGdzzyNUmscWM/vyRqIQBlX1b0eBXRL+gIUdTodusqid5pGd9DyecUSWjCWzWw4B7fBwPhMJasA1l39xi7sIaMtAtDNkS9zohH7nVINwvZcZJFLNagC3ZKjSXXy8Xho7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918763; c=relaxed/simple;
	bh=TUtuGucGMx5956bjrpc5c6x95Id5/b0DWoUrFgx/lrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHTXZHsMhd4tD4T6Xs3XTAADQaO1ldHGU5pTDh+bfvOVtDTRIBnV4GJIJSzIV6TqdR79TMoHnQWxAlQ9kPSBz5gKnMq68LHGlzTi1EjhPtJyEPqo0/YF5dkHxfQtrfrmzatpVRfeIC4WEZY4btCCr4wwIpbE2+xn3crIyKI4cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WelN54sK; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C7EF4441B;
	Mon, 11 Aug 2025 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2xGn0js6GqCCD9hVZuFcppXRuk2GDkngn7py0Oeq38=;
	b=WelN54sKx2BtOoDlok4mLVGRDjHtie0d5M8LPdfJ7JfI10E65YdgbezvW0EaNJPRU8F4fm
	ldzcZsQiSVgbFFPlbT0zoAp0zea/6hRPVMXBi+WwrALt1o3d5fc3NxJqxo45PhlX/Xp1pF
	R3/RVS/7bT2bC5JQ2PDnx07mhtyW7xfEU8UwCW13MSMesE1P9YglAt++g0YzhQJEwOh6sm
	MPmJPXyT2AAEg9U+9ltpRHmkr/yUdrHWiFMDQ7kfvsa10vY+uhyjxNVjO+IX+Q4Mbw3oWC
	8RwxNkx30VthWsMv2GBzD23JoXHi4AwDD3Grln6FP9jP/zA+Fggu6xkbuJNoGg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 11 Aug 2025 15:25:45 +0200
Subject: [PATCH v9 02/10] gpio: aggregator: move GPIO forwarder allocation
 in a dedicated function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-2-29f0cbbdfb30@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtt
 hhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Move the GPIO forwarder allocation and static initialization in a dedicated
function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 50 +++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index af9d8b3a711dad9e7ca048243443d26d09030713..75c8d0deef2fe25faa61bd5b48af3e74e3817957 100644
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
+	chip->set = gpio_fwd_set;
+	chip->set_multiple = gpio_fwd_set_multiple_locked;
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
-	chip->set = gpio_fwd_set;
-	chip->set_multiple = gpio_fwd_set_multiple_locked;
-	chip->to_irq = gpio_fwd_to_irq;
-	chip->base = -1;
-	chip->ngpio = ngpios;
 	fwd->descs = descs;
 
 	if (chip->can_sleep)

-- 
2.47.2



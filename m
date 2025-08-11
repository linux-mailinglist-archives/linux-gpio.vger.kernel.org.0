Return-Path: <linux-gpio+bounces-24181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3FDB20A26
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4298718A6B11
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576CF2DEA93;
	Mon, 11 Aug 2025 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K74fiFlz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727CF2DCF73;
	Mon, 11 Aug 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918766; cv=none; b=lTGvyjUCpZ/P6y2r0Pcw14tnzn75C1F/McHec0nWLWdxlTqWyWILhi159Vq4Fnsxrq2gYcxhIIvgUbYFWHDspghHsJYmnYBWVtgRVy2+RIIP8ebBc5za4lJpqQyXCk7+Qto29BwcQGKLMjca4Fsxf43UYYA6MqfAQxgVXWmsdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918766; c=relaxed/simple;
	bh=bSuL5ScRGkx+RI2lG49Tf6SURMZ6ECqzFJUhGRKClp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EV0f8fuQ8jWQEnVMyYjYhGcSuCgKWzaVgLtKApBLMMTsFYhtTiJCha9kswYByjVY5oomfrR1bKzU1K0cfM8eTXixvzHLLRo9B+W8MDUiIUodrq1Bs5kUqNg8uknQ5FuUqUL6vCvb9nBPGcHS8xQzHeYlb2MBJfMRIYZKIY7nFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K74fiFlz; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F27B4442D;
	Mon, 11 Aug 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sslvADh9v8O30b2SaW/mZWtjvJg8TBCmJ5cCCC52rk=;
	b=K74fiFlzxlKd4QCsPjM+YLhgyfxp3qL8G9EH4YlwzF8U8n9VIJ2/NthKUCWVI77WxTjUwC
	ufWJ56xLLQ4oGbF83ekp+jEKO1y9T1sDHgMSQslUKhho0al+sv3MmRMM4yIE8vebOYusN8
	hVRe3sbImO1xH9nyepSNTR9nlBC0lM3F5A9x/KTPaMQDFPGMAWoODKAAME+PPaS/dGycBM
	1F3KpE/x8VAq3ouGZzfqH4oha66tibTqzJ6DMOaPwrZe8a2Tw0jdNXhUnLA1JrbnhRTwlo
	+Kps8y3F1duJsfI6E7XGlQ3AbglazGFV3m2ZuVsqWZOkR83vQ8cjvQneQxS/1A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 11 Aug 2025 15:25:51 +0200
Subject: [PATCH v9 08/10] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-8-29f0cbbdfb30@bootlin.com>
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

Add a data pointer to store private data in the forwarder.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 20 ++++++++++++++++++--
 include/linux/gpio/forwarder.h |  4 +++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index f0d38d76cf73fccbc7baf83f8d0d33732787762b..fb3694d581d1edc412f44c661585643b7b59e31a 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -246,6 +246,7 @@ struct gpiochip_fwd {
 		spinlock_t slock;	/* protects tmp[] if !can_sleep */
 	};
 	struct gpiochip_fwd_timing *delay_timings;
+	void *data;
 	unsigned long *valid_mask;
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
@@ -504,6 +505,18 @@ struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
 }
 EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_gpiochip, "GPIO_FORWARDER");
 
+/**
+ * gpiochip_fwd_get_data - Get driver-private data for the GPIO forwarder
+ * @fwd: GPIO forwarder
+ *
+ * Returns: The driver-private data for the GPIO forwarder
+ */
+void *gpiochip_fwd_get_data(struct gpiochip_fwd *fwd)
+{
+	return fwd->data;
+}
+EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_data, "GPIO_FORWARDER");
+
 /**
  * gpiochip_fwd_gpio_request - Request a line of the GPIO forwarder
  * @fwd: GPIO forwarder
@@ -768,10 +781,11 @@ EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_desc_free, "GPIO_FORWARDER");
 /**
  * gpiochip_fwd_register - Register a GPIO forwarder
  * @fwd: GPIO forwarder
+ * @data: driver-private data associated with this forwarder
  *
  * Returns: 0 on success, or negative errno on failure.
  */
-int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd, void *data)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
@@ -787,6 +801,8 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
 EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_register, "GPIO_FORWARDER");
@@ -831,7 +847,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	error = gpiochip_fwd_register(fwd);
+	error = gpiochip_fwd_register(fwd, NULL);
 	if (error)
 		return ERR_PTR(error);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index 45e0190308f09fdf953b71504a82c75fa47771c0..ee5d8355f7355767ff3da85fc42fe244a81ce0da 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -11,10 +11,12 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
 int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd,
 			  struct gpio_desc *desc, unsigned int offset);
 void gpiochip_fwd_desc_free(struct gpiochip_fwd *fwd, unsigned int offset);
-int gpiochip_fwd_register(struct gpiochip_fwd *fwd);
+int gpiochip_fwd_register(struct gpiochip_fwd *fwd, void *data);
 
 struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
 
+void *gpiochip_fwd_get_data(struct gpiochip_fwd *fwd);
+
 int gpiochip_fwd_gpio_request(struct gpiochip_fwd *fwd, unsigned int offset);
 int gpiochip_fwd_gpio_get_direction(struct gpiochip_fwd *fwd,
 				    unsigned int offset);

-- 
2.47.2



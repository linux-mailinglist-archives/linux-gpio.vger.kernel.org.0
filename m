Return-Path: <linux-gpio+bounces-21120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F83AD1B07
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2FD188D59F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFC1254AF0;
	Mon,  9 Jun 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YIaMB/n+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC14C2522A4;
	Mon,  9 Jun 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462676; cv=none; b=sNqFQjUBjVg1A0uSdyCb6+sCEqJg+RNimNn9zXnf93h/gbeBYym5ofLK4BNiyEfppzYqygGRr+QKpTfNglIUJK3hGoTgsUPQVzwGIQ7KY9w0fCoELEShF4CW29Lnlh04gA1WJ54uKV+I82VGh7VDEfH+sQrlXzLU/6H9rkBJNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462676; c=relaxed/simple;
	bh=hcgkUbePmitcVMVMvJYgScE+OWGArqSthabAljwKX1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lll8u/1U04k+8EaAIhQ4ndRBSmkSH5GfTG9pMJMQYBpirfpaKpxuzEbiTLZ77pgF2l0vKyG4xdI6yjyh/Z64Z8jTmKZTARpdkR431sSQTf8fbEKUFcslYc87Q/IWu+lQIYGsPrdvuUuGXnTcWvBZmGzi2vXvffMffnlmoWhT3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YIaMB/n+; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9219D439FE;
	Mon,  9 Jun 2025 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+2z08DOpBpWjZPy/nEPspJJs1vIWcB9y7DeqUo3AOM=;
	b=YIaMB/n+ZGxJOacjNmk0sXHjqShbZcuLt7623/Wh6hANpP0vcBan6NccHXB2SmbU0Kf/1H
	hsCZtdDTel7AH06WoPUGE2Pu5z9pGvgRj1u11cNmN3lwO2gx68MM2yS4rc+CS0wmh7v3Qi
	HInTRoqRSh6ckW8Cal5mzOe3xnIhErh7LdwVQf/poJKGcmPyPQzDx87S2T1kDXGeZIhiJN
	HPrCsLcg+VS3sbKuufgjJUZ3S6K0q3KbYAGeik2q5RmoxdcUJh5F1Y6IaIQbkQg7xlcYG3
	qaRaukj5PVYs53UUucLmJYUMh2sYaM/DgTJJ1I06SJKl5XwK9sX63Ww1CffivQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 11:51:06 +0200
Subject: [PATCH v7 08/10] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-8-1ab73ec0cb98@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Add a data pointer to store private data in the forwarder.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 20 ++++++++++++++++++--
 include/linux/gpio/forwarder.h |  4 +++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 2f5833d08bb8..74ebf3ccd911 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -245,6 +245,7 @@ struct gpiochip_fwd {
 		spinlock_t slock;	/* protects tmp[] if !can_sleep */
 	};
 	struct gpiochip_fwd_timing *delay_timings;
+	void *data;
 	unsigned long *valid_mask;
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
@@ -503,6 +504,18 @@ struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
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
@@ -767,10 +780,11 @@ EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_desc_free, "GPIO_FORWARDER");
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
 
@@ -786,6 +800,8 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
 EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_register, "GPIO_FORWARDER");
@@ -830,7 +846,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	error = gpiochip_fwd_register(fwd);
+	error = gpiochip_fwd_register(fwd, NULL);
 	if (error)
 		return ERR_PTR(error);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index 45e0190308f0..ee5d8355f735 100644
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
2.39.5



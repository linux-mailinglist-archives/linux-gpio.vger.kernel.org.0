Return-Path: <linux-gpio+bounces-19693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C2AAC95D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A9A3A483A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9528541F;
	Tue,  6 May 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NgxL0LL5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB9283FED;
	Tue,  6 May 2025 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544899; cv=none; b=JN/tp8CRso+AhbXWpwEZ4Czmc9DoGSyOMFejR0dBACgPXZ145Zk1MoisQAT7ABuKY5wKMrIt5XQbnu6G4V94Lhx3dfQI/MIlSydUoxfm0w3fkOa8nmI8cwUeSW8TMi9FUUo7bMyHhD153OIg5ZbWl2vxUqW4mgFF8FnQklRvxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544899; c=relaxed/simple;
	bh=8ZojBhH8SC9IQKM+gRCef0n5m7k3csgRxWFhEmByAgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHarFE2Ta1OxjfUwfcD4wIgpvAGOkN+oCK9DpQicZyeJuHh8c0VRt8v73wIpUcWnS1pnmRo+/ZDudH+lVAZPdMgPE7qQiVmVzMLBN7hk63puZgVfQcxZwLQjXduKdSWFeTDRosyEu1ffoVbzRhX8zQujM700QtJLCTQ4UcY/oGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NgxL0LL5; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A064C43B43;
	Tue,  6 May 2025 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RrTt6YOR2RDmIgOFmK3Bea23zIK1IY+chIFKWyua1g=;
	b=NgxL0LL5wV46uQS/XEdXoxLvUaLRPYZsJ3B7caSBpYRT3bmuF7cq1wzNQDYuuFt0wJm4WJ
	2eNThtdyOT+ZrKQtrM+zmJLXBEryMI1kwL5TDrMcAI0h+DxSYJ5lXvpCr+9yVreSPhEZhn
	tnW1yheebyKJXRdUGRfB+pMzK3UCOTPkY0ql1WFKueAKrHkfbIZv0tmkjoRzXomTnlm3MG
	TdTuBsqEXCi1q9O79eefaxtUelkcbD71kVnGuLe0DR6eMx5YXWT4DoEhr7u/KQgKyJNLSv
	HXSLxpBoORmutoIPyEt7W4r/nmifAWdhvEbEFm0+AwaTJZiLjd3U9abZYkpF8Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:28 +0200
Subject: [PATCH v5 10/12] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-10-3906529757d2@bootlin.com>
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvt
 ghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add a data pointer to store private data in the forwarder.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 20 ++++++++++++++++++--
 include/linux/gpio/forwarder.h |  4 +++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 234f2f55c306..102205793015 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -268,6 +268,7 @@ struct gpiochip_fwd {
 		spinlock_t slock;	/* protects tmp[] if !can_sleep */
 	};
 	struct gpiochip_fwd_timing *delay_timings;
+	void *data;
 	unsigned long *valid_mask;
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
@@ -289,6 +290,18 @@ struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_gpiochip, "GPIO_FORWARDER");
 
+/**
+ * gpio_fwd_get_data - Get data for the GPIO forwarder
+ * @fwd: GPIO forwarder
+ *
+ * Returns: The data for the GPIO forwarder
+ */
+void *gpio_fwd_get_data(struct gpiochip_fwd *fwd)
+{
+	return fwd->data;
+}
+EXPORT_SYMBOL_NS_GPL(gpio_fwd_get_data, "GPIO_FORWARDER");
+
 /**
  * gpio_fwd_request - Request a line of the GPIO forwarder
  * @chip: GPIO chip in the forwarder
@@ -715,10 +728,11 @@ EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_free, "GPIO_FORWARDER");
 /**
  * gpio_fwd_register - Register a GPIO forwarder
  * @fwd: GPIO forwarder
+ * @data: driver-private data associated with this forwarder
  *
  * Returns: 0 on success, or negative errno on failure.
  */
-int gpio_fwd_register(struct gpiochip_fwd *fwd)
+int gpio_fwd_register(struct gpiochip_fwd *fwd, void *data)
 {
 	struct gpio_chip *chip = &fwd->chip;
 
@@ -734,6 +748,8 @@ int gpio_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_register, "GPIO_FORWARDER");
@@ -778,7 +794,7 @@ static struct gpiochip_fwd *gpio_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	error = gpio_fwd_register(fwd);
+	error = gpio_fwd_register(fwd, NULL);
 	if (error)
 		return ERR_PTR(error);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index f799b0377efd..dc9b0f13413d 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -9,6 +9,8 @@ struct gpiochip_fwd;
 
 struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
 
+void *gpio_fwd_get_data(struct gpiochip_fwd *fwd);
+
 int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
 
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
@@ -41,6 +43,6 @@ int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
 
 void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset);
 
-int gpio_fwd_register(struct gpiochip_fwd *fwd);
+int gpio_fwd_register(struct gpiochip_fwd *fwd, void *data);
 
 #endif

-- 
2.39.5



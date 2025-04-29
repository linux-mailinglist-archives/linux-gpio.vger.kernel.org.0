Return-Path: <linux-gpio+bounces-19463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B301CAA0E4B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CA6842834
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586A22C17AE;
	Tue, 29 Apr 2025 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gzNwQmmO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA12D3A6A;
	Tue, 29 Apr 2025 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935718; cv=none; b=ki+kHQnpTvpaQ1xsZesw8/1CLAwULrboC2LUXEPlUE4tz6FUIycZKM/M+jOedWG63YAVXzSQKchRhwrtj/POksLVD+pVA0qpemosjygCizLNnptitSZnblNmct4156SBp7Ecn638sRTyUTQuach9XQ9qRN4uzJ13ZOLc94ExP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935718; c=relaxed/simple;
	bh=CLXN8WvFddWSjPsluPuK8XqiYPk1UR31J74404mnddM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwNlfKv1blwX52J1007v0jVj+SC0npiEFN1Th0sKZj5jx4jihYjuxjOeui0Thapq8XD03ZxrJcCPrGqXVjnmDFqeCSaVbUCuXiqQ9mrP/LUJCvm4ZOTNzymZCVbGiAUhmNe3ty3pk5SsAFJXNz4YkmxcTknYb644hN/Ncas1CHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gzNwQmmO; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B83ED438AD;
	Tue, 29 Apr 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XtTmzoo2Mnt3fPlCoSOQdnvYtOkdpYsj02VuG46fnw=;
	b=gzNwQmmOXrLZ/6gQgIdP5hgoTZksQwE871CJaOwE9IJolWamrlhj3w/9byoAH6n+cgNexc
	CNUHYI9V/0OuG7OZuo6bpoDWt3/zaG5MKImSM3S4aqJ9IYiCtIkH0UZpyLPiFR2tP3zDfy
	zf2gs2UR5r6re6213hyN4hYRQvEPlT9NQcoOYT+nrDk6PUtr/E1JV0d81CaOuiaHoTMbWO
	6pnGJYlmIOt+sKLntaL09Qazt7MpMxW/IXwC6CY4kv+/KT/AvZmsWOz8z8f9DOwMaSHm2M
	JjHGATo+deCzy2yiyBULUpJZ5GgTnDr+VuykLUwxhJBJjV6rOBNEWHSqZhF4UQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:24 +0200
Subject: [PATCH v4 10/12] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-10-b3fffc11417d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add a data pointer to store private data in the forwarder.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpio-aggregator.c | 20 ++++++++++++++++++--
 include/linux/gpio/forwarder.h |  4 +++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 230bd8398119..1a6483fc817c 100644
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
@@ -716,10 +729,11 @@ EXPORT_SYMBOL_NS_GPL(gpio_fwd_gpio_free, "GPIO_FORWARDER");
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
 
@@ -735,6 +749,8 @@ int gpio_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
 EXPORT_SYMBOL_NS_GPL(gpio_fwd_register, "GPIO_FORWARDER");
@@ -779,7 +795,7 @@ static struct gpiochip_fwd *gpio_fwd_create(struct device *dev,
 			return ERR_PTR(error);
 	}
 
-	error = gpio_fwd_register(fwd);
+	error = gpio_fwd_register(fwd, NULL);
 	if (error)
 		return ERR_PTR(error);
 
diff --git a/include/linux/gpio/forwarder.h b/include/linux/gpio/forwarder.h
index f0deb7573f36..9bb62a1a6224 100644
--- a/include/linux/gpio/forwarder.h
+++ b/include/linux/gpio/forwarder.h
@@ -12,6 +12,8 @@ struct gpiochip_fwd;
 
 struct gpio_chip *gpio_fwd_get_gpiochip(struct gpiochip_fwd *fwd);
 
+void *gpio_fwd_get_data(struct gpiochip_fwd *fwd);
+
 int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset);
 
 int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset);
@@ -44,6 +46,6 @@ int gpio_fwd_gpio_add(struct gpiochip_fwd *fwd,
 
 void gpio_fwd_gpio_free(struct gpiochip_fwd *fwd, unsigned int offset);
 
-int gpio_fwd_register(struct gpiochip_fwd *fwd);
+int gpio_fwd_register(struct gpiochip_fwd *fwd, void *data);
 
 #endif

-- 
2.39.5



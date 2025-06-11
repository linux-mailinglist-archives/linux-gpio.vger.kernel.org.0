Return-Path: <linux-gpio+bounces-21348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A6AD4F2E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66373A9A0D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2952641EA;
	Wed, 11 Jun 2025 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LeCCPbar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A2A260569;
	Wed, 11 Jun 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632425; cv=none; b=SsAIBYWcCqlqebKLddYFsNvicSFGjEvpuenU3qy7qHSPpPoA/xtIKG4ETNRMN2028ris4NFSMTt7TEBEF39J8kDxsWrdo54kOn6uWn80NwhShr+hxae50HLl2Hnfk9OWPcRGfyCRM3STtlYfYRLO6bxXO3uUFdow0PSvGoVv4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632425; c=relaxed/simple;
	bh=OBNeBiI8bRPO9EXjZInloACtWTfqR448bfRYAWFLdNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qn24tfqggOXX4lAWHecpkO3x6+yVcmtkQSgMbhnCc2UheaeEZAh32wNXFZJUHeoiSttQqYWe7DAMMWXy5935Af/qgKEgLfy8WAyeOMvTd/DiGGcrwzjc9EpCFsfAfADF0Bw6V3JaZYeAyaYn1bt0KP1WZTBZYYE6iCMp/Htn6GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LeCCPbar; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCC21439F5;
	Wed, 11 Jun 2025 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749632421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9j9oK2ljdnWfPxqsLtF6zcelvKnibzsu3HImSSZFt0=;
	b=LeCCPbarnaiiwbvPlQ6cUyv7hqW2h5JawU96lZlLRCnSfUHpWuc8WV1h0MBeXtZBqKB+Uz
	+Kpm843ND1Utb69OD8kyYrXnc9GCq2FGqgIS0VRfGxaO6JBw+7+HwfynRqlUNIA2gD0GE9
	NFmVlfgZWTL4WEUF7iKmVo3xiYz9yaLavPVB98GYCrCcIOmp3y8oHGTiJW8lXDEU+gPAIu
	s2CFFKAKqCvmeLWG1JYG2Y3J7gGeMtpU/RF879ZrwkGTMljM6+xhCtS4jEXJF0iia8iCd1
	1zqFg6PmrgrKonGeJ26K+geqRIY7o45x56o7T308L0OJ7sxTk4I0VUXg0lMlQQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Jun 2025 11:00:13 +0200
Subject: [PATCH v8 08/10] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-aaeon-up-board-pinctrl-support-v8-8-3693115599fe@bootlin.com>
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
In-Reply-To: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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
index 8bdde022f292..c70912d4b39b 100644
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



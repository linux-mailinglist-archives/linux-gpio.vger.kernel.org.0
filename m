Return-Path: <linux-gpio+bounces-20345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C8ABD968
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810CA1B65317
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B73E242914;
	Tue, 20 May 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SyGFB1i4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D7242D95;
	Tue, 20 May 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747737; cv=none; b=GmtZuePFWmZO1F8oGbA+db3JCTi+Fc0Cv8gq2IMGRBwW5SZ4ojpoX/vEYdhKIKYKXUyNAQGn51vh6atq0dtg0PH5DDsdHFxF0/9UtNOPmBeh2WJHd09yFH+5XGfkLhu1x9kQqbOFb36uYPOkVkeFYBQK+IidykCElHACfApIzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747737; c=relaxed/simple;
	bh=1SBcAutvlzI9D80LRJ1rpB2cyejQH/4UTJXcbcFX4HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qrFCzErKDw1ksPAiE1C+gyy8IXEgkwEBidUCCokIN4QK3q+wyhEORJCOK4WiWfp8xjsHOmVYok+Go4yVyaOweUvfkU0Lnksw39ea5MYc8Vvi+qmVHyVPXKa7wlP735/IG4ruhsT9IPRsqHhhb3rziNnxdfl3/GvrLzRnDaPMkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SyGFB1i4; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A01E843B7D;
	Tue, 20 May 2025 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpwXN0vSTDBm/ravmIOJrOxezQzFq/q3l8yVyamYB38=;
	b=SyGFB1i4Y/iHSBTka/VU70Njtl5zdDBVjPSVJZsqUCZNR3wpfYjFCUBsuU6oiEq0bvK8bE
	7cmwcgX/F75QR6EQxDbQyEXEpP9A25CaLrRK548F7Zx/wezH1RRa5712DW+qXk8XuQT0E0
	YOwfLC83HVQe6zbSbvE0d4CU65I9Bo9t+xUmK1j4sLUz3IjiuYx2B4YEGoeAMjSfgxNvNn
	LNUY0CGA6pYKVZTF3i01S6n2IF6UneSt16s6bOA/Cdmqz7RW5oUGH7+1aTaiuGhQPxambw
	rtlql66QqRFLeNtY+QbugqYmpLyb3D2EUDwzY9mIGjmR3aFSrraBicd0Xt38vA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 20 May 2025 15:28:34 +0200
Subject: [PATCH v6 10/12] gpio: aggregator: add possibility to attach data
 to the forwarder
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-10-dcb3756be3c6@bootlin.com>
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrt
 ghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
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
index 8901d2c000ed..c0d7ec39c888 100644
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
@@ -526,6 +527,18 @@ struct gpio_chip *gpiochip_fwd_get_gpiochip(struct gpiochip_fwd *fwd)
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
@@ -790,10 +803,11 @@ EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_desc_free, "GPIO_FORWARDER");
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
 
@@ -809,6 +823,8 @@ int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
 	else
 		spin_lock_init(&fwd->slock);
 
+	fwd->data = data;
+
 	return devm_gpiochip_add_data(chip->parent, chip, fwd);
 }
 EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_register, "GPIO_FORWARDER");
@@ -853,7 +869,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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



Return-Path: <linux-gpio+bounces-19685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C5AAC94B
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FAF94E4846
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F05283FCB;
	Tue,  6 May 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gqjew4MF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5929F283C91;
	Tue,  6 May 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544895; cv=none; b=n7a2rteL3q6V93NGviAEuFyvcNUMB8rQFwmMV5ApChDJXMBUalCbcynFkKJjZ8BgCsJwBFmFguTzVPaQMLMf4NfWwTg2rGaLGrBWYa4vktOTTWJf75YH4lspoyieFb1b2NEHtImyr/dCHxKjRCZXPHDY0OpxUvG8tG9frXhbSlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544895; c=relaxed/simple;
	bh=ArpSGaELRtIcEnBIvydZufpYt2tcyW531ny0FgKVEU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XO+8GUsvuaKu1FEWzKc390f4HbA2OQDwxPhF6HMrXS7tXdCqvNIOXaynrsliF5Mv5dEt3gH/f1H0+Pjfr3VnOMpUYkgiyDE1+478iLxjSpxSyT+Gs9iYgxOGo59aDC53Bfnq+qjhN5OxPWkNzMTwqOeAdorNeg7ylz4N0QKMIqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gqjew4MF; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 926E743B39;
	Tue,  6 May 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwFqRYJCao11TjqazPLblrbyeF94Ji0bncnET8QI318=;
	b=Gqjew4MFzYRG59G3QLvlV954CBniwkS/NmSLbgQCuroaqMGRCr+WM1SNVnd5ekoDadOHMe
	/4E9RuEl2KTdqpUp6NutGChL8n1/8s/OZDanH44MdxTljdfnFmh1PTxT7CFZtWyh/h8JD/
	qFxU1SezjKxQg9frrORZHzIO+n2HqAcGgIRMtykrdWC61YJYTfSStzDbcp4hCVOwx9GRxi
	3ulD8BOvLArl+6reaz+L6ClVjI80ydJbr6hIyqx31YtOe78BmDyDMTeiTPeFkrVWUr+7Zr
	AfzEaOMltX7krOctQWGRUYW2Zyd251MZ/gtwDUY4N0aVAHHk4+aAx62864CRtg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:19 +0200
Subject: [PATCH v5 01/12] gpiolib: add support to register sparse pin range
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-1-3906529757d2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvt
 ghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add support to register for GPIO<->pin mapping using a list of non
consecutive pins. The core already supports sparse pin range (pins member
of struct pinctrl_gpio_range), but it was not possible to register one. If
pins is not NULL the core uses it, otherwise it assumes that a consecutive
pin range was registered and it uses pin_base.

The function gpiochip_add_pin_range() which allocates and fills the struct
pinctrl_gpio_range was renamed to gpiochip_add_pin_range_with_pins() and
the pins parameter was added.

Two new functions were added, gpiochip_add_pin_range() and
gpiochip_add_sparse_pin_range() to register a consecutive or sparse pins
range. Both use gpiochip_add_pin_range_with_pins().

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpiolib.c      | 29 ++++++++++++++++++--------
 include/linux/gpio/driver.h | 51 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cd4fecbb41f2..b59fc4d751da 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2283,11 +2283,13 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
 
 /**
- * gpiochip_add_pin_range() - add a range for GPIO <-> pin mapping
+ * gpiochip_add_pin_range_with_pins() - add a range for GPIO <-> pin mapping
  * @gc: the gpiochip to add the range for
  * @pinctl_name: the dev_name() of the pin controller to map to
  * @gpio_offset: the start offset in the current gpio_chip number space
  * @pin_offset: the start offset in the pin controller number space
+ * @pins: the list of non consecutive pins to accumulate in this range (if not
+ *	NULL, pin_offset is ignored by pinctrl core)
  * @npins: the number of pins from the offset of each pin space (GPIO and
  *	pin controller) to accumulate in this range
  *
@@ -2299,9 +2301,12 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
  * Returns:
  * 0 on success, or a negative errno on failure.
  */
-int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
-			   unsigned int gpio_offset, unsigned int pin_offset,
-			   unsigned int npins)
+int gpiochip_add_pin_range_with_pins(struct gpio_chip *gc,
+				     const char *pinctl_name,
+				     unsigned int gpio_offset,
+				     unsigned int pin_offset,
+				     unsigned int const *pins,
+				     unsigned int npins)
 {
 	struct gpio_pin_range *pin_range;
 	struct gpio_device *gdev = gc->gpiodev;
@@ -2319,6 +2324,7 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
+	pin_range->range.pins = pins;
 	pin_range->range.npins = npins;
 	pin_range->pctldev = pinctrl_find_and_add_gpio_range(pinctl_name,
 			&pin_range->range);
@@ -2328,16 +2334,21 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 		kfree(pin_range);
 		return ret;
 	}
-	chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
-		 gpio_offset, gpio_offset + npins - 1,
-		 pinctl_name,
-		 pin_offset, pin_offset + npins - 1);
+	if (pin_range->range.pins)
+		chip_dbg(gc, "created GPIO range %d->%d ==> %s %d sparse PIN range { %d, ... }",
+			 gpio_offset, gpio_offset + npins - 1,
+			 pinctl_name, npins, pins[0]);
+	else
+		chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
+			 gpio_offset, gpio_offset + npins - 1,
+			 pinctl_name,
+			 pin_offset, pin_offset + npins - 1);
 
 	list_add_tail(&pin_range->node, &gdev->pin_ranges);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(gpiochip_add_pin_range);
+EXPORT_SYMBOL_GPL(gpiochip_add_pin_range_with_pins);
 
 /**
  * gpiochip_remove_pin_ranges() - remove all the GPIO <-> pin mappings
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4c0294a9104d..6142837ea403 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -784,23 +784,68 @@ struct gpio_pin_range {
 
 #ifdef CONFIG_PINCTRL
 
-int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
-			   unsigned int gpio_offset, unsigned int pin_offset,
-			   unsigned int npins);
+int gpiochip_add_pin_range_with_pins(struct gpio_chip *gc,
+				     const char *pinctl_name,
+				     unsigned int gpio_offset,
+				     unsigned int pin_offset,
+				     unsigned int const *pins,
+				     unsigned int npins);
 int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,
 			unsigned int gpio_offset, const char *pin_group);
 void gpiochip_remove_pin_ranges(struct gpio_chip *gc);
 
+static inline int
+gpiochip_add_pin_range(struct gpio_chip *gc,
+		       const char *pinctl_name,
+		       unsigned int gpio_offset,
+		       unsigned int pin_offset,
+		       unsigned int npins)
+{
+	return gpiochip_add_pin_range_with_pins(gc, pinctl_name, gpio_offset,
+						pin_offset, NULL, npins);
+}
+
+static inline int
+gpiochip_add_sparse_pin_range(struct gpio_chip *gc,
+			      const char *pinctl_name,
+			      unsigned int gpio_offset,
+			      unsigned int const *pins,
+			      unsigned int npins)
+{
+	return gpiochip_add_pin_range_with_pins(gc, pinctl_name, gpio_offset, 0,
+						pins, npins);
+}
 #else /* ! CONFIG_PINCTRL */
 
+static inline int
+gpiochip_add_pin_range_with_pins(struct gpio_chip *gc,
+				 const char *pinctl_name,
+				 unsigned int gpio_offset,
+				 unsigned int pin_offset,
+				 unsigned int npins)
+{
+	return 0;
+}
+
 static inline int
 gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 		       unsigned int gpio_offset, unsigned int pin_offset,
 		       unsigned int npins)
+{
+	return 0
+}
+
+static inline int
+gpiochip_add_sparse_pin_range(struct gpio_chip *gc,
+			      const char *pinctl_name,
+			      unsigned int gpio_offset,
+			      unsigned int const *pins,
+			      unsigned int npins)
 {
 	return 0;
 }
+
 static inline int
 gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,

-- 
2.39.5



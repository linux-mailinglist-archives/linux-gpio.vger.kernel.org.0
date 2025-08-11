Return-Path: <linux-gpio+bounces-24173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C5B20A13
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A14C7A19A5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBC42DE6E6;
	Mon, 11 Aug 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iyjEqSj8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA719342F;
	Mon, 11 Aug 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918761; cv=none; b=Mn3x7TjGg/tZ0phKvKvz/oq7aN3Ld24hw4yeXihCzRvBb9qPgYjoog581uWzAy1SczXm9ww/qV/UKfOfbHO8Pc8vRx/h+mlC7/N2MiEdwTalr9s+8Rba+vhU66ZydLFg/2f0c5h4KX94hz+94pxojRmOSMtLrWad+MJ7RShcz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918761; c=relaxed/simple;
	bh=pH0HUEbkrKy/2V+sOLiaYzE8BF/L4xR3G+OgLOjYbGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNcTXAf9iPJLjx7KFcY39zacecKHnhLtzEINt1T9Su8EXPA/XdU0nTtZEfdzzmKw+MVTJJItz1uuTdxKHhwwvEGXi3JZzAZFezlegPS8uEUWdzkhqdn/Qg87/DtJsj1k4hCTXbb1PmsUnqSAENQVPYWJGuXoM3VplVQn0QABZyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iyjEqSj8; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A022A44418;
	Mon, 11 Aug 2025 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi6uko5QIzfNpYwHg8wHgx93w/BENh/D/lptujvzU2Q=;
	b=iyjEqSj8DACgURW06km6sLiQ6UmIRcVEt4gVSKAeQi4F6w+yCCbsuA5O3Pmj/vSaVLcI8K
	waHRgzyVvvspDbSsau1yGMGUl1ic1yJpR4C4xCKbGNfTI8rwN2loB7X4052L7mvxZYVLcR
	YXdO0jW18IgJBpShsn0fa9vOTtlkatqfjftJy7FEiogSh6FqHopboc2odlW7rUlHO6h0jA
	cXCPszx0dDngGBS+CrtsG4dKGGtfpN3eSwCPg1VU1jWWb6Wcd4XcbTpsxT+Rky96U+sobA
	QBNkPcCNYKs2YvIR43cg/T+olOof72P5NMAG7SG0D9JDwXZXmfDk+pWbeIkc0Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 11 Aug 2025 15:25:44 +0200
Subject: [PATCH v9 01/10] gpiolib: add support to register sparse pin range
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-1-29f0cbbdfb30@bootlin.com>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpiolib.c      | 29 ++++++++++++++++++--------
 include/linux/gpio/driver.h | 51 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0d2b470a252eebf70c888fc282e3c66d06b838ab..98d2fa602490566b0c78ba0171297ed2ec11e393 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2349,11 +2349,13 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
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
@@ -2365,9 +2367,12 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
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
@@ -2385,6 +2390,7 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
+	pin_range->range.pins = pins;
 	pin_range->range.npins = npins;
 	pin_range->pctldev = pinctrl_find_and_add_gpio_range(pinctl_name,
 			&pin_range->range);
@@ -2394,16 +2400,21 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
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
index 667f8fd58a793fff32b7551ef3ec76706ae9bc4a..9fcd4a988081f74d25dc88535705ba9265e56fd2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -772,16 +772,50 @@ struct gpio_pin_range {
 
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
@@ -789,6 +823,17 @@ gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 {
 	return 0;
 }
+
+static inline int
+gpiochip_add_sparse_pin_range(struct gpio_chip *gc,
+			      const char *pinctl_name,
+			      unsigned int gpio_offset,
+			      unsigned int const *pins,
+			      unsigned int npins)
+{
+	return 0;
+}
+
 static inline int
 gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,

-- 
2.47.2



Return-Path: <linux-gpio+bounces-18956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C711A905F6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAFF8E1F1F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA191C68A6;
	Wed, 16 Apr 2025 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L1RtJqE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BAC12C544;
	Wed, 16 Apr 2025 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812498; cv=none; b=pR3z+9Ok4rxj/vz9qIbctVd2Sr3+pk3nYPLpaWsIjSvpipotEk1tjxHDF2/QyZ6pRzL+NqmVbClpT8qbLKV7y+IMoyrfmA7wG1uVUPg98osvg126WjMRV5Ilfx3ubmiagVH+ZveiWxtslt9kPYcNwqSZcfRTWPCJqXOMC+vZBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812498; c=relaxed/simple;
	bh=zGLfqtmxYgE1HkXQX9lyvosQ0NKfUFl2gJZ00OfTSVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UprGyZwftg/V4ZDt6yPXsX2ijfB/6iBdm7c6fZVL/FyKVdsr4CtsFYcC4zj9xUzVEePUvY8eIsjuItllFyMIZ1DxEs+DjO3TcEYcCeaIM0cff/HNYNSJAf6Y9L6JSaFMfJl9khx+7ifhLHDuRavi3Y0chVUAdd2pVM9ezOjmfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L1RtJqE0; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 046EE41A8C;
	Wed, 16 Apr 2025 14:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMsUXYRx4t1cDMJ1YbLQiEKhKymS93z4Bd+a/Lx5mio=;
	b=L1RtJqE0pUZKG+kfO/O0/WpwU9fgAsRxxX873YfvHQeL1yg+cbnxteyCGJWIJtlb6O+fMg
	+6amGJF6VfoGz8M7h/ly5NjAPV16Embfmksg0DlXNzKR29r+2tz+vpz8NfN40pCq5MJ2Cu
	Q95wp1IOUuHWr2F5btrHud5xECK2eE29GuKHrmdhtx/ys1qD27ZG54ln1SsdS922tOWI4O
	mawMpiZY4AuEYH1cFYhvrgR32qSM82SHA3hSMDa1Ys5VtjlVbkvq7KR9lkbnKHQS9Tb87X
	v8PpGIDwFD09zvp5EbZv8jXMMh6+VXITAUy925/vZFweE5+zWdPYC5evDxlA4Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 16 Apr 2025 16:08:09 +0200
Subject: [PATCH v3 01/10] gpiolib: add support to register sparse pin range
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-1-f40776bd06ee@bootlin.com>
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

Add support to register for GPIO<->pin mapping using a list of non
consecutive pins. The core already support sparse pin range (pins member
of struct pinctrl_gpio_range), but it was not possible to register one. If
pins is not NULL the core uses it, otherwise it assumes that a consecutive
pin range was registered and it uses pin_base.

The function gpiochip_add_pin_range() which allocates and fill the struct
pinctrl_gpio_range was renamed to gpiochip_add_pin_range_with_pins() and
the pins parameter was added.

Two new functions were added, gpiochip_add_pin_range() and
gpiochip_add_sparse_pin_range() to register a consecutive or sparse pins
range. Both use gpiochip_add_pin_range_with_pins().

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpiolib.c      | 29 ++++++++++++++++++--------
 include/linux/gpio/driver.h | 51 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e70197e39f55..6451dd4565c9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2285,11 +2285,13 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
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
@@ -2301,9 +2303,12 @@ EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
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
@@ -2321,6 +2326,7 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
+	pin_range->range.pins = pins;
 	pin_range->range.npins = npins;
 	pin_range->pctldev = pinctrl_find_and_add_gpio_range(pinctl_name,
 			&pin_range->range);
@@ -2330,16 +2336,21 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 		kfree(pin_range);
 		return ret;
 	}
-	chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
-		 gpio_offset, gpio_offset + npins - 1,
-		 pinctl_name,
-		 pin_offset, pin_offset + npins - 1);
+	if (!pin_range->range.pins)
+		chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
+			 gpio_offset, gpio_offset + npins - 1,
+			 pinctl_name,
+			 pin_offset, pin_offset + npins - 1);
+	else
+		chip_dbg(gc, "created GPIO range %d->%d ==> %s %d sparse PIN range { %d, ... }",
+			 gpio_offset, gpio_offset + npins - 1,
+			 pinctl_name, npins, pins[0]);
 
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



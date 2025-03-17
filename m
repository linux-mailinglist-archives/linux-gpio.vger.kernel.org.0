Return-Path: <linux-gpio+bounces-17693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6138A655E2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAFAB1899984
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F386E248897;
	Mon, 17 Mar 2025 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j2CdbUe/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00492376ED;
	Mon, 17 Mar 2025 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225903; cv=none; b=cB/db4N5RMGh7MpuJduKrRLZX45+Mhq+ckZfXVc3nc9u5ted4acFWkEOA4Qe31I3d/9nLpRLvf0nmhHck4CHLx2Uk96xECB3KAdAXcjymL4r39VfCOflv33TlzN7d5LrW+POrYZpFZ4ylvaflHAWtuUppRpvtB0dxeZzQqi7KR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225903; c=relaxed/simple;
	bh=InaWakI9JDNtGtiE+ddJL+KFXdL0LBoOohV5I9ZQwb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrxRx70Zqx6wqD6rHDV0R3MpFA9fi6ybboD6U8IOS6c1JgwotnJcgBKknvlZVbUxdcQN74Uasu+I4gHqjQj3Kc0var1ta4wkzdK8wAoK6JP5LTeMXPAaqUEK9vovo7OrHU2gJe1CAz2AstrtEyMA+ENaMkO9C4Ri/pdjmDyvRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j2CdbUe/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A4EE20572;
	Mon, 17 Mar 2025 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742225899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6Egs1c8tkOk8BnB4TbE2gE8y+mt621Ltuv0RFYW+ks=;
	b=j2CdbUe/+t53HhzI+pEifmHvZ7uQbSMrAn2j3Vnp5AKVyAXQtnyZyoLxCLcdsgc8WPOE6J
	Ail4VGBs3/JLC6pv66fnnaiO1DrWcx7WI1taooNX539DS5eQCmnrlB1Xo+NFt+4ZTxNl+q
	7Qdw2JLN1Sh8YzqEzzeCOBXEA9WFo2F5FboiZyNHn/ePlbuM9EHGC0c9OroX0zrQ1sjUVI
	LHo7CJxaakHG956KG4ta9AvvdbKke8kmgipAZFMfVkvywftVVsoPpADlnfwG90iS598se3
	J8au3sKOQNAxeTDiNaut+jV2E8zmJhWdLQBkSvekQFxpGo3rdkHaA4MojMkGlg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 17 Mar 2025 16:37:59 +0100
Subject: [PATCH RFC v2 1/6] gpiolib: add gpiochip_add_pin_range_sparse()
 function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62@bootlin.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijhesl
 hhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

Add gpiochip_add_pin_range_sparse() function to add a range for GPIO<->pin
mapping, using a list of non consecutive pins.
Previously, it was only possible to add range of consecutive pins using
gpiochip_add_pin_range_sparse().

The struct pinctrl_gpio_range has a 'pins' member which allows to set a
list of pins (which can be non consecutive).
gpiochip_add_pin_range_sparse() is identical to gpiochip_add_pin_range(),
except it set 'pins' member instead of 'pin_base' member.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpiolib.c      | 74 +++++++++++++++++++++++++++++++++------------
 include/linux/gpio/driver.h | 12 ++++++++
 2 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 16d190c1d6802..5a6d97116be9f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2234,26 +2234,9 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_add_pingroup_range);
 
-/**
- * gpiochip_add_pin_range() - add a range for GPIO <-> pin mapping
- * @gc: the gpiochip to add the range for
- * @pinctl_name: the dev_name() of the pin controller to map to
- * @gpio_offset: the start offset in the current gpio_chip number space
- * @pin_offset: the start offset in the pin controller number space
- * @npins: the number of pins from the offset of each pin space (GPIO and
- *	pin controller) to accumulate in this range
- *
- * Calling this function directly from a DeviceTree-supported
- * pinctrl driver is DEPRECATED. Please see Section 2.1 of
- * Documentation/devicetree/bindings/gpio/gpio.txt on how to
- * bind pinctrl and gpio drivers via the "gpio-ranges" property.
- *
- * Returns:
- * 0 on success, or a negative errno on failure.
- */
-int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
-			   unsigned int gpio_offset, unsigned int pin_offset,
-			   unsigned int npins)
+static int __gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
+				    unsigned int gpio_offset, unsigned int pin_offset,
+				    unsigned int const *pins, unsigned int npins)
 {
 	struct gpio_pin_range *pin_range;
 	struct gpio_device *gdev = gc->gpiodev;
@@ -2271,6 +2254,7 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
+	pin_range->range.pins = pins;
 	pin_range->range.npins = npins;
 	pin_range->pctldev = pinctrl_find_and_add_gpio_range(pinctl_name,
 			&pin_range->range);
@@ -2289,8 +2273,58 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 
 	return 0;
 }
+
+/**
+ * gpiochip_add_pin_range() - add a range for GPIO <-> pin mapping
+ * @gc: the gpiochip to add the range for
+ * @pinctl_name: the dev_name() of the pin controller to map to
+ * @gpio_offset: the start offset in the current gpio_chip number space
+ * @pin_offset: the start offset in the pin controller number space
+ * @npins: the number of pins from the offset of each pin space (GPIO and
+ *	pin controller) to accumulate in this range
+ *
+ * Calling this function directly from a DeviceTree-supported
+ * pinctrl driver is DEPRECATED. Please see Section 2.1 of
+ * Documentation/devicetree/bindings/gpio/gpio.txt on how to
+ * bind pinctrl and gpio drivers via the "gpio-ranges" property.
+ *
+ * Returns:
+ * 0 on success, or a negative errno on failure.
+ */
+int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
+			   unsigned int gpio_offset, unsigned int pin_offset,
+			   unsigned int npins)
+{
+	return __gpiochip_add_pin_range(gc, pinctl_name, gpio_offset,
+					pin_offset, NULL, npins);
+}
 EXPORT_SYMBOL_GPL(gpiochip_add_pin_range);
 
+/**
+ * gpiochip_add_pin_range_sparse() - add a range for GPIO <-> pin mapping
+ * @gc: the gpiochip to add the range for
+ * @pinctl_name: the dev_name() of the pin controller to map to
+ * @gpio_offset: the start offset in the current gpio_chip number space
+ * @pin_list: the list of pins to accumulate in this range
+ * @npins: the number of pins to accumulate in this range
+ *
+ * Calling this function directly from a DeviceTree-supported
+ * pinctrl driver is DEPRECATED. Please see Section 2.1 of
+ * Documentation/devicetree/bindings/gpio/gpio.txt on how to
+ * bind pinctrl and gpio drivers via the "gpio-ranges" property.
+ *
+ * Returns:
+ * 0 on success, or a negative errno on failure.
+ */
+int gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
+				  unsigned int gpio_offset, unsigned int const *pins,
+				  unsigned int npins)
+{
+	return __gpiochip_add_pin_range(gc, pinctl_name, gpio_offset, 0, pins,
+					npins);
+}
+EXPORT_SYMBOL_GPL(gpiochip_add_pin_range_sparse);
+
 /**
  * gpiochip_remove_pin_ranges() - remove all the GPIO <-> pin mappings
  * @gc: the chip to remove all the mappings for
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a..0402f94ec6a02 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -751,6 +751,9 @@ struct gpio_pin_range {
 int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
 			   unsigned int npins);
+int gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
+				  unsigned int gpio_offset, unsigned int const *pins,
+				  unsigned int npins);
 int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,
 			unsigned int gpio_offset, const char *pin_group);
@@ -765,6 +768,15 @@ gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 {
 	return 0;
 }
+
+static inline int
+gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
+			      unsigned int gpio_offset, unsigned int const *pins,
+			      unsigned int npins)
+{
+	return 0;
+}
+
 static inline int
 gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,

-- 
2.39.5



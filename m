Return-Path: <linux-gpio+bounces-13769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A19ED18B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31BBB161FA3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141B01DDA24;
	Wed, 11 Dec 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jFYOe4Yq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493091DD0DC;
	Wed, 11 Dec 2024 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934481; cv=none; b=CvtObbKbYN959zvHbYUwotRajc1iz+7J4bEwIKomSZMm62jWbFRVJuAejIOdpYozTDPsiRdZ9KIkn9LUDHKmGpGnIZWo+UY6b0zAYqSTbypKHD3ZwCOUBuRlnWPbfKnEtbHaMRL1NtNCTSG2s81pYI9G5lB9QWvGkjzyPsg1ptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934481; c=relaxed/simple;
	bh=R9Ph2LuNSizL9cZ5KwZKjg48Yy4GVSq4AuUp2eZ53Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzhLuTxnSGfdT0o61VR2qkrSGxfBQiWppM5qKT3/Yjil+WGNc44q7AKA+ssFbWF7khv5fVxe/Mw9Qlfze6Vqq9iQnMamgVC4XlCL5yq17UhvvGMGFga0gQYK+xjWi3iRxG3MXv1idyq7asNFQRr1aWrfk2VEBEvd0W2cRmDtmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jFYOe4Yq; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19D3624000C;
	Wed, 11 Dec 2024 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733934472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJLX7UutB8ehS0hHXBDQ4WgR2Cmh6ovxEz75/hzjYaI=;
	b=jFYOe4YqQizwu6An/9RPBSvh2vpj9zksMTEK3eBWi66gZ2Dxo2ZpAAmqDCanz62rpsNjh6
	lhS8HWxuaCkcf/rkWCgGfQFcI/hA9CvH/uU+QQ9eICZiuclHKA0EYxyviocdOSxSZxF4aY
	FavOqmrxdWAfIE3OiwOdcNzdzfDL0pHhK6DZFTMCUnW+Q1BJgr0vt+PzS4oxzaR9CdKRnu
	I4FyJfGanB8km/tHOY0Ne4PR+/QBOWDff9PNdUnd/bepvoDpPvXMj8CpiM38GQW/EAkzwi
	hIV3oBswyaNUOVqEleGvQanKaZEgCA1yO+JmDOxbpTwQZRCpBeMssvIv12wu8A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Dec 2024 17:27:18 +0100
Subject: [PATCH 3/5] gpiolib: add gpiochip_add_pinlist_range() function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

Add gpiochip_add_pinlist_range() function to add a range for GPIO <-> pin
mapping, using a list of non consecutive pins.
Previously, it was only possible to add range of consecutive pins using
gpiochip_add_pin_range().

The struct pinctrl_gpio_range has a 'pins' member which allows to set a
list of pins (which can be non consecutive). gpiochip_add_pinlist_range()
is identical to gpiochip_add_pin_range(), except it set 'pins' member
instead of 'pin_base' member.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/gpiolib.c      | 74 +++++++++++++++++++++++++++++++++------------
 include/linux/gpio/driver.h | 12 ++++++++
 2 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3c8ec7f3a83b..e0fe07167e62 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2227,26 +2227,9 @@ int gpiochip_add_pingroup_range(struct gpio_chip *gc,
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
@@ -2264,6 +2247,7 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 	pin_range->range.name = gc->label;
 	pin_range->range.base = gdev->base + gpio_offset;
 	pin_range->range.pin_base = pin_offset;
+	pin_range->range.pins = pins;
 	pin_range->range.npins = npins;
 	pin_range->pctldev = pinctrl_find_and_add_gpio_range(pinctl_name,
 			&pin_range->range);
@@ -2282,8 +2266,58 @@ int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 
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
+ * gpiochip_add_pinlist_range() - add a range for GPIO <-> pin mapping
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
+int gpiochip_add_pinlist_range(struct gpio_chip *gc, const char *pinctl_name,
+			       unsigned int gpio_offset, unsigned int const *pins,
+			       unsigned int npins)
+{
+	return __gpiochip_add_pin_range(gc, pinctl_name, gpio_offset, 0, pins,
+					npins);
+}
+EXPORT_SYMBOL_GPL(gpiochip_add_pinlist_range);
+
 /**
  * gpiochip_remove_pin_ranges() - remove all the GPIO <-> pin mappings
  * @gc: the chip to remove all the mappings for
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..8037f9a1e2a9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -751,6 +751,9 @@ struct gpio_pin_range {
 int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
 			   unsigned int npins);
+int gpiochip_add_pinlist_range(struct gpio_chip *gc, const char *pinctl_name,
+			       unsigned int gpio_offset, unsigned int const *pins,
+			       unsigned int npins);
 int gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,
 			unsigned int gpio_offset, const char *pin_group);
@@ -765,6 +768,15 @@ gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
 {
 	return 0;
 }
+
+static inline int
+gpiochip_add_pinlist_range(struct gpio_chip *gc, const char *pinctl_name,
+			   unsigned int gpio_offset, unsigned int const *pins,
+			   unsigned int npins)
+{
+	return 0;
+}
+
 static inline int
 gpiochip_add_pingroup_range(struct gpio_chip *gc,
 			struct pinctrl_dev *pctldev,

-- 
2.39.5



Return-Path: <linux-gpio+bounces-21233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB014AD3B4F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8D663A42D2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56625220F23;
	Tue, 10 Jun 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dcGzJ6EE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4331F130B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566315; cv=none; b=FlJWGvS5XHWhx11k8qKMkbC9H3c3CLzW+lYn5QtyMpqUu1szNcP9CB+qg2AV1/CiGrAiYglaS2vu2i7YufAceiFBHNaXy/6UQgnjhfFKfd6+D1uRiuzfO3mc+EfPvTJ3BvIqzhvAeQRLg9U79qZ90F+9oPYjgp1CfogyIoR/SHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566315; c=relaxed/simple;
	bh=3iywfMmfWuguiGrQGZCARkYMwz88+y8SW6qE3RQFQbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ+0ducg0LLFIWd4ADYhUfI3cWdq6Q47kSFKoSEkGIEi4R5ihtB3gXBR1JmC61KUHIzbcWlHK9VdrEPihu8c+f8930EEm8WObLjYnztKqcPmvHZ327sdO3pCESsI5nKwYLWiWfJsabVI9Af2JDmhgddADnjASd6eXkO21n3lPog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dcGzJ6EE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45024721cbdso48009485e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566312; x=1750171112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbAeNQNfAA6yD3395Up6TwuixaQ4LQ4OsQ45S++RIdI=;
        b=dcGzJ6EEoAnF9WeTiriEvCIv3CGffAoZZ7YcdnNzecHt9hc8CagyAhsFx3w+qQfoux
         L92SLZknMBjVJgRYI/S/QrFUaFXlRuhirh9U6KpcnEr7XQ2+KmldS4wquvZja78pct3E
         ekfgx3meI9HSvnmu9Af1AK1Clwi+rM+Q0s3hUDdwzN3u0GhqH08bBOw+QkIvjGB2/4xi
         /01enJEcvqwlY5TqgI33qeLF8bzYVsXfDAzddQH8Te/FlDMzcaQElSNiHG2VK6t+Fc8k
         og+3b/o1oSsZXbibmDLZ1ivv5z7dT29um+iyj5YXsAsISy26m68SxgZ++XqXHdV6UZqV
         NSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566312; x=1750171112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbAeNQNfAA6yD3395Up6TwuixaQ4LQ4OsQ45S++RIdI=;
        b=Umvdon48NCDlP3+gm+KaO4oc3h49nHLigtuBS6BGy9qy5CJmTpTRbnDsIg9Uh5Y0vK
         fyxRoQ17NQhoKuSRnNwRIEStE+qh4z9/q9hCcPjVm4NG5ZmLZPs6/HHUFSavSOJCLsPL
         uxJMAp4XQSDLG1M5QwVzn0PASZ7xlRFfD9tiWQBbyzHuHSluj47pkcZS5bcaumR3COew
         ah3KIJv/Mfbv/EnaUkclxhJmbePIK3uT+/4LtDJI0hW9xv3f+SUSMRdWT9lYJ0zBFAoU
         H857Vatz1+HZmOkbHHuNVSJtCv7sp55T2JrtS8CVWupsWwe/Z7tGXuId4pqfyP9+UI5h
         t5pw==
X-Gm-Message-State: AOJu0Yz6D8ieUGsOX4mjEi/3ibflrIL0JvOBmGSIa7brBcUhtsL8lJ/2
	88Oytb7uw5LC5OkfRpFj38Vy3Uj0fg/WRLpiJRtK/nCaYSrepLbzkkz54V7R2l29Zz0=
X-Gm-Gg: ASbGnctAYYhzeHbb8751SPmXl7MseLyswMhr7+F1Q9ngthBvT9bx+lgVdQt3buXXDv9
	QHCMply3GeuGowu2Xh8IapcE6Aazv9ABpJ4rb3WQNuSV1+3enE9IuxQ7Os2t6B4tpDGT9d1Zw3D
	Xb2XPsDhIqu13ADWqK8qI/p8GJmkgxqq9nIwz83quN5x4O7QV4cw3OXj+37ygm+bzAieIEsP0ok
	Z2rtusxeUp/Ug6Ml9DfwTV3AwPzy91l7TRr88QqvGhPfjKjFAvZIIc6E1T7KNiN8XUTysAoI92U
	nc0eTaWET+1rRflt6SRf2UqYqQwBeBfUOzTkRsf04lU1rdSRtp++
X-Google-Smtp-Source: AGHT+IGNoAiYQhAXMTIDwG94By+OiA1TtpkzZkBJ/W0lgErFNRiyObiTaY3Fg7oTYTkdJbB8ZGUVgQ==
X-Received: by 2002:a05:600c:6994:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4531dea9c40mr32956955e9.30.1749566311703;
        Tue, 10 Jun 2025 07:38:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:19 +0200
Subject: [PATCH RFC/RFT 04/15] gpio: sysfs: refactor the coding style
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-4-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7880;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zLQu1FIKLYBrG00ZMRkDPgP4mnshxpjIaGpQE6BbTbI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENgPxH8hZgvL6dsa6Tj3ckOBEhY1xZCFwMEl
 YzLo7uB3omJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYAAKCRARpy6gFHHX
 ctnVEAC07XkQBi0m2E/8rFvXYo1msouUY/fyTCXM6HKZyQQYwGD4C0SfqV0rLG3MzMrL2MZtjqN
 Zffl1iIFjAM+fQ/SiTwQ/1OhKVQx2xOGjvc/MaER8/5OKV9jP93na7sTr7X2B4eTnxxj8OOLKlo
 QtveQaTq/ExxSmZq0l5xYcsiqGS/l0uw/zPnJ1TUIixjJaittsHQBM7N+gFEm4ejt/OxHhhTAS0
 bkqrvaImD8jGTjvkIUIMbgyKi8YrPHWW2/J9eRBsqTHjoHMMmfER9vF2qDqnCLyiLLd5mOelOYv
 noWJBvpK+AN20Q3JV+kIagt35RXA5hnb8Wc4Yvmwl1uqkgknmFIRG8Rdgvl+4EP/KKFikNxy4Ns
 LbZ1xHhW38TWgJebZkAYQUQu+kd0cUOvpvYQeL0kpr6q0HTMT+DdiAS9Hkk086BKxqWbsr0YWsf
 NIMwbr7PYT/yXCdwJSjUDhGR+TllEfH9OA5Zj2XF8FJGjXGMPDDxadeP7e6cqJjDOtzxjrluXXs
 DIdxmMR06hGKbk44bsidvIN3R99/viChoEKqEhTRYuWKwp+XudwevuCk/PBfsQ/2qZe/gyHWJp4
 l1Zx1ZK4/hAaXzLHY/gA/ybklpxDYTS2Cm3g9bLR9yI5YO3GlmJ9hI2fimGb5GPvnSatuMJxBtu
 lp/uZrbCWZBf/lA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update the code to be more consistent with the rest of the codebase.
Mostly correctly align line-breaks, remove unneeded tabs, stray newlines
& spaces and tweak the comment style.

No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 67 ++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index cd3381a4bc93a94b9a975248ae3e4bd8c2a3eb4b..88f97018fc7995c1e1195c0da4b6a8377af62e0b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -73,7 +73,7 @@ static DEFINE_MUTEX(sysfs_lock);
  */
 
 static ssize_t direction_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+			      struct device_attribute *attr, char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
@@ -88,11 +88,12 @@ static ssize_t direction_show(struct device *dev,
 }
 
 static ssize_t direction_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
-	ssize_t			status;
+	ssize_t status;
 
 	guard(mutex)(&data->mutex);
 
@@ -109,12 +110,12 @@ static ssize_t direction_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(direction);
 
-static ssize_t value_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t value_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
-	ssize_t			status;
+	ssize_t status;
 
 	scoped_guard(mutex, &data->mutex)
 		status = gpiod_get_value_cansleep(desc);
@@ -125,8 +126,8 @@ static ssize_t value_show(struct device *dev,
 	return sysfs_emit(buf, "%zd\n", status);
 }
 
-static ssize_t value_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t value_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
@@ -179,22 +180,22 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	irq_flags = IRQF_SHARED;
 	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
-			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
+				IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
 		set_bit(FLAG_EDGE_FALLING, &desc->flags);
 	}
 	if (flags & GPIO_IRQF_TRIGGER_RISING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
-			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+				IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 		set_bit(FLAG_EDGE_RISING, &desc->flags);
 	}
 
 	/*
 	 * FIXME: This should be done in the irq_request_resources callback
-	 *        when the irq is requested, but a few drivers currently fail
-	 *        to do so.
+	 * when the irq is requested, but a few drivers currently fail to do
+	 * so.
 	 *
-	 *        Remove this redundant call (along with the corresponding
-	 *        unlock) when those drivers have been fixed.
+	 * Remove this redundant call (along with the corresponding unlock)
+	 * when those drivers have been fixed.
 	 */
 	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	if (ret < 0)
@@ -240,15 +241,15 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	sysfs_put(data->value_kn);
 }
 
-static const char * const trigger_names[] = {
+static const char *const trigger_names[] = {
 	[GPIO_IRQF_TRIGGER_NONE]	= "none",
 	[GPIO_IRQF_TRIGGER_FALLING]	= "falling",
 	[GPIO_IRQF_TRIGGER_RISING]	= "rising",
 	[GPIO_IRQF_TRIGGER_BOTH]	= "both",
 };
 
-static ssize_t edge_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	int flags;
@@ -262,8 +263,8 @@ static ssize_t edge_show(struct device *dev,
 	return sysfs_emit(buf, "%s\n", trigger_names[flags]);
 }
 
-static ssize_t edge_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	ssize_t status = size;
@@ -302,7 +303,6 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
 
-
 	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
 		return 0;
 
@@ -310,7 +310,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
-					flags == GPIO_IRQF_TRIGGER_RISING) {
+	    flags == GPIO_IRQF_TRIGGER_RISING) {
 		gpio_sysfs_free_irq(dev);
 		status = gpio_sysfs_request_irq(dev, flags);
 	}
@@ -321,7 +321,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 }
 
 static ssize_t active_low_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+			       struct device_attribute *attr, char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
@@ -334,7 +334,8 @@ static ssize_t active_low_show(struct device *dev,
 }
 
 static ssize_t active_low_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+				struct device_attribute *attr,
+				const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	ssize_t status;
@@ -397,8 +398,8 @@ static const struct attribute_group *gpio_groups[] = {
  *   /ngpio ... matching gpio_chip.ngpio
  */
 
-static ssize_t base_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t base_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
@@ -406,8 +407,8 @@ static ssize_t base_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(base);
 
-static ssize_t label_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t label_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
@@ -415,8 +416,8 @@ static ssize_t label_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(label);
 
-static ssize_t ngpio_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
@@ -439,8 +440,8 @@ ATTRIBUTE_GROUPS(gpiochip);
  *	integer N ... number of GPIO to unexport
  */
 static ssize_t export_store(const struct class *class,
-				const struct class_attribute *attr,
-				const char *buf, size_t len)
+			    const struct class_attribute *attr,
+			    const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
 	int status, offset;
@@ -498,8 +499,8 @@ static ssize_t export_store(const struct class *class,
 static CLASS_ATTR_WO(export);
 
 static ssize_t unexport_store(const struct class *class,
-				const struct class_attribute *attr,
-				const char *buf, size_t len)
+			      const struct class_attribute *attr,
+			      const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
 	int status;

-- 
2.48.1



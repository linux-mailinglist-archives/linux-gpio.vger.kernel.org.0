Return-Path: <linux-gpio+bounces-16054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B37A368EA
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 00:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3B4C3AB2B2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 23:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B70B1FCCF6;
	Fri, 14 Feb 2025 23:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z1T7OEzi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61521FC0F7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739574771; cv=none; b=aG7zjt8qxXtOQniSyk4XFrCTcKDWu2ZfwGhsqrgK2H6xe1HkyE7CpxLinDBfbVLlLeNUG/1HBSDZwRj+rMIGhrZB+Ppq5hXD8T/xtr2bx5Ttgr1osqL+94A08m3MGzKmQ/TwWtTLEt8h5qTnV2SfZ0tfhxdzIUYR8fYWMPmrjtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739574771; c=relaxed/simple;
	bh=Z9LTzZRPFLnZJT5XMSZGdfur7lQk3IZ92SFbdqLDh9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDI6Ib9BGcbC3oWAaIzsLBwThFbwO6v+7uk00oI9cdq1TPC3FwunXKIKdGricNyLNaxlF0nbNFSwZAFm6PHHSQcVv+a4YEBF7JZSxgLiTIjOq6r2sBy64k8StjLNyYnGXICo7VM7T0aEQRL3Xk3jFhi9LInp/69cn7Wd9azrymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z1T7OEzi; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30737db1ab1so25235711fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 15:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739574768; x=1740179568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=z1T7OEzi5pANFQihVNKuM4QbqBzCCBd3IlFs80nWJhYs8uwzDZW/zb8IUE8iqCXLp5
         E2PPZpMjRevWGC/9+qAOLqy8RCK4aW6XP4hVN8M5dKNQ/K39PD/jJKIn5r9UAs2fGInB
         au9rP5oBBcRznB6fj3HnICGZy3E6JEOx6BBndMqLdEY1o3t89NzNYoA7QSVZQm45CJWl
         B0vah/COCVU28qsbovMK1daWHJ0DieJIVoi2LJ7T7Z3tsUL/rAlMdbbTdLOBQ8d56a3D
         j7BRnJ1TW84chs1pkl6rYintfPrYFPRTud16OnFlrUJLOxUMX41MqI6zCVmq8Z/yfPeA
         MqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739574768; x=1740179568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=h9oxyCtPNWiSViX3H2qizV/tLZmmVrtIkTUxsXaxsI+KQvpSi3yNpj4AR2WtbD7Zty
         cxYCUUfjjiqO5TGngqvyv7CupAMl/XO4bfoGLDXmqdtpz5LB5iyeTbc4BjwccqVnY/pC
         eCu8L31VgeGtz1dG4uAuP/fRWxnGMtoy8Ds4T6DawyQn/6x2EquEfeJSck/dbgvKUP3H
         xClocITiQl22ZF1OiqgbSe6LR/onUc97ytX8w6Y3msXRLLxtn20Hg/D/GOU4pTv4Mylt
         DOjPQDXxfZi0nLOUHISqFho3b2pk40JVmz5EdzS5k9Oeyeh7XIx8aUHd//bRFhp1F0hY
         i7iw==
X-Gm-Message-State: AOJu0Ywxt7zcGmgCyP0FrD7Iu3muuDjSkHSz62QuP1NS+EwxGJoiQqLt
	ozxqiywP9e58tpjdUASC/uO11YoJT0L00mdy9NWPt2GpcD661XbbTErBcVxWqm8/XA8FtLRINxg
	6
X-Gm-Gg: ASbGncvLuZRva2J0Cwr3luV4ddTunIRgaqHvDozrYK3JLkl/MUC69acDYTgvB3iShey
	HLmrOyGae3CePLxUIrG/p31yMYOOsNUa0QFD/jtNFvF9wU0rKQXJzMXwZcOybVQJHXegXaw3gNI
	amktbpU39PyUPYLy4LjE7TTPE4bDTx5AIblmarHO80poFSnvH+H4IniGoH89IQB5Q0U9eVe5Bq0
	yli46NyjcgaS/O2G1TDx9iKY+rD5kcxzZAQoTzQQ4k2GUDTMtk83pyUVSohLXeINNJbSAxZdv/E
	ZY4RFCwierHMrlHjDK8AAFCw/Q==
X-Google-Smtp-Source: AGHT+IEMDnufbBzp39ppn9ewPPziBTwCqLLg1QleH6Y1u6YA1C75d+PqFQkmEpwc1Czn6L+CJqvfMg==
X-Received: by 2002:a05:6512:2342:b0:545:60b:f394 with SMTP id 2adb3069b0e04-5452fe27255mr451237e87.4.1739574767900;
        Fri, 14 Feb 2025 15:12:47 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f676aa5sm158515e87.50.2025.02.14.15.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:12:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Feb 2025 00:12:45 +0100
Subject: [PATCH v2 1/2] gpio: mmio: Add flag for calling pinctrl back-end
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-vf610-mmio-v2-1-4a91f8c8e8d5@linaro.org>
References: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
In-Reply-To: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Bough Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

It turns out that with this flag we can switch over an entire
driver to use gpio-mmio instead of a bunch of custom code,
also providing get/set_multiple() to it in the process, so it
seems like a reasonable feature to add.

The generic pin control backend requires us to call the
gpiochip_generic_request(), gpiochip_generic_free(),
pinctrl_gpio_direction_output() and pinctrl_gpio_direction_input()
callbacks, so if the new flag for a pin control back-end
is set, we make sure these functions get called as
expected.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 36 ++++++++++++++++++++++++++++--------
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d89e78f0ead31f30c014b201cca4e32ecb377118..d4f72a0f6ed89878d64055ab28d888a7be08b126 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -323,9 +324,19 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
 		gc->write_reg(gc->reg_clr, clear_mask);
 }
 
+static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
+{
+	if (!gc->bgpio_pinctrl)
+		return 0;
+	if (dir_out)
+		return pinctrl_gpio_direction_output(gc, gpio);
+	else
+		return pinctrl_gpio_direction_input(gc, gpio);
+}
+
 static int bgpio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return 0;
+	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -339,7 +350,7 @@ static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 {
 	gc->set(gc, gpio, val);
 
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -357,7 +368,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-	return 0;
+	return bgpio_dir_return(gc, gpio, false);
 }
 
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
@@ -403,7 +414,7 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 {
 	bgpio_dir_out(gc, gpio, val);
 	gc->set(gc, gpio, val);
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
@@ -411,7 +422,7 @@ static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 {
 	gc->set(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
-	return 0;
+	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_setup_accessors(struct device *dev,
@@ -562,10 +573,13 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 
 static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
 {
-	if (gpio_pin < chip->ngpio)
-		return 0;
+	if (gpio_pin >= chip->ngpio)
+		return -EINVAL;
 
-	return -EINVAL;
+	if (chip->bgpio_pinctrl)
+		return gpiochip_generic_request(chip, gpio_pin);
+
+	return 0;
 }
 
 /**
@@ -632,6 +646,12 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	if (ret)
 		return ret;
 
+	if (flags & BGPIOF_PINCTRL_BACKEND) {
+		gc->bgpio_pinctrl = true;
+		/* Currently this callback is only used for pincontrol */
+		gc->free = gpiochip_generic_free;
+	}
+
 	gc->bgpio_data = gc->read_reg(gc->reg_dat);
 	if (gc->set == bgpio_set_set &&
 			!(flags & BGPIOF_UNREADABLE_REG_SET))
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..e867d52daaf26827324f9e17b5c19c55978ed7e7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -394,6 +394,7 @@ struct gpio_irq_chip {
  * @reg_dir_in: direction in setting register for generic GPIO
  * @bgpio_dir_unreadable: indicates that the direction register(s) cannot
  *	be read and we need to rely on out internal state tracking.
+ * @bgpio_pinctrl: the generic GPIO uses a pin control backend.
  * @bgpio_bits: number of register bits used for a generic GPIO i.e.
  *	<register width> * 8
  * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed to keep
@@ -478,6 +479,7 @@ struct gpio_chip {
 	void __iomem *reg_dir_out;
 	void __iomem *reg_dir_in;
 	bool bgpio_dir_unreadable;
+	bool bgpio_pinctrl;
 	int bgpio_bits;
 	raw_spinlock_t bgpio_lock;
 	unsigned long bgpio_data;
@@ -713,6 +715,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 #define BGPIOF_NO_SET_ON_INPUT		BIT(6)
+#define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.48.1



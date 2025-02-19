Return-Path: <linux-gpio+bounces-16244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BFA3CAF4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1D13B2AD2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 21:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4FF254AEF;
	Wed, 19 Feb 2025 21:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPQofNw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7B254AE2
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999080; cv=none; b=aDfkUqsdLqvzyOK4SexqK3zI3vdkKWizYCjt/9QsZGZqeng1awD0Op4I/3e54RSPk7htQvx246IRJT4EQvNZYwvv/sLdVh8Yj8LkorOw8pv95zAKsc29g0hOeJhW5VUmMAAXzTH8bAADu++4mFA0IU/jV8hFS9tWF0lpdkFSH8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999080; c=relaxed/simple;
	bh=Z9LTzZRPFLnZJT5XMSZGdfur7lQk3IZ92SFbdqLDh9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATeINjgn8QmqIoaKpdzgL/eTmvrol4HIBzEP8VK0vjKkqjz30fHEKqXGoJ8nZRJlxiSwiSHWxI3P3DSu8IMvlHZXkQ4RQKjv1a899McN3WumwZ4CExbnO+dkrjUmyv0EBDQ6or3Cn7IpA300Pp9Uz8MYVPNks6KBFPvZVjKylJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPQofNw/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5452c2805bcso286202e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 13:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999076; x=1740603876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=GPQofNw/96e4zpcnjWk5ZwYCYCe0ue+TWegvEUMfvuLc5mad7bEfhuZqhVsfr3DkSu
         70yhMte/C4Sc7pvJhWHo3ufzhsaxsvA2CxyO5aeqxfzeZ+L/LFy05kHcuWvdlaOe7vjN
         xt4Zcxr6BcajiYYReXaruqVV5QSB1ErN6fcg3bVUoKMNNT0AYlpWVcWhqEI8XIfeug+P
         ahPD9ZccHDdDpYdG4hwp4K22A0Mvjla3N6qJQ3znzS2PcGMF5UJGrmnco0iR6ORAmsJu
         7c5vZ/r3WM7d5JaktJGCBJT9P/rrtYGXYArD2ZuUJDtr4PTs/q4eD3Ig2Vdy1riWapHR
         K1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999076; x=1740603876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hj7mvcg1AIpuBCAS0OPKw5ndsiDf9b+OHpTi8fYuGx0=;
        b=FPchHLCYJY/IFhJktHEZZuIhLT2JQiKX/zwHM1VUVDnLINdljVN+6coKVnb85Ni77l
         ihJ2dE6ZgNLujdc3B3SlcVSCYKDg5H+vqPgTdZbf5poxR1keFW93h7PrvHTCr6lg+Yxl
         0kNL4Z7+P5q7DQ9LxuW7JE9pccf/fV+waw7Kk1GZufS0nzM3jxhIjpL7yvzkpZ8zhLjz
         J6At9v6hskuJg19uWoEwewBAvjpJEMT85hqaUXCqYJDV4qa/IJbYPo0YcoWhtuh1sJyf
         2Rwr6q9HGJhlQEYzt88WA8WKDBGMByvkNAtuyHDsYR4GfDQS02G183jz387g1cDSwheR
         jg6A==
X-Gm-Message-State: AOJu0YzDyafxw79cvW3QMIO8Qvm/EtmQmq1UefKjLvih4hrjLL9PMB2D
	Fv+qRX92+R7BZAqkfGW4rnsZqfnAqt2ZELzcMUvsZUR5SyrGcWK1RbHYkHkFtd8=
X-Gm-Gg: ASbGncte6CZXCv8ay4dQGvhk0lWIeNKYDwtdnR4exURSraSJdIAv4NcRCPqzuSjuUiu
	QlkJHFP3Cm6VTjC3q7KzF6i3VR0y6DmDJd+sFC17m9qrZgJ6pBSjyBOhGiJOWRV5W8bumBrjJiK
	1lyEj6c1Mqpz0XIz9EfFAZNyg5/41Aed3n/aPuY0DdsAgc0p//clDApwbkuZUwtS38SWBVZXpag
	KO/jTde3peCgBwN1S2LM2teBAkeUv7nH1njsX96q+rqw/lq1+jXNddGODL3J0I5khXr/pttPD6d
	ps+a4AN7lArZ8oGuK7ejYoqdcw==
X-Google-Smtp-Source: AGHT+IH1x9Cw9H9mZw18iHxJ8baZhcFe+Cur08onjNgjMwMhWZd00SLvBi/a5Qy5aAVes7L3a1w+EQ==
X-Received: by 2002:a05:6512:3992:b0:545:2d27:5ae1 with SMTP id 2adb3069b0e04-5452feae86fmr5642956e87.53.1739999075893;
        Wed, 19 Feb 2025 13:04:35 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18977791fa.84.2025.02.19.13.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:04:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2025 22:04:33 +0100
Subject: [PATCH v3 1/2] gpio: mmio: Add flag for calling pinctrl back-end
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-vf610-mmio-v3-1-588b64f0b689@linaro.org>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
In-Reply-To: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
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



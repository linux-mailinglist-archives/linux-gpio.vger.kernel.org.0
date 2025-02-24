Return-Path: <linux-gpio+bounces-16482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABDA41B0D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99157174403
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C952253B7E;
	Mon, 24 Feb 2025 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLfuTB3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDBF250BE3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392939; cv=none; b=FcsUQ5ZH5K7QDTYhMDnL9/3hKELgI9+HGJEn5+lSQkPz7SVFZVaVlnBAz3TyIUkXv+Aw0BZmLt7ychSYpbnmzh5bTIkSD9mZMJkvntm5cg024CmcZShfcEBTolgOoe8p8HWxk+lJDEq5IIuN+GmcqnKzNZ8H4H5iBsTnZ/cIjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392939; c=relaxed/simple;
	bh=FqmmZSUhI6RyKwWR/If/2tBgmj4WHIx+fVOPvUERPuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iU4TymG01gePdNdU/12VuDNBX0djdarQ0vCOoc2hF92ULu81gT34Qrsdoj8n2dbfcMxAxg05CCFxKkvx1ab2iqAGCDtxwnxWdteOLc59iPSe8ZjULXBxs0cLvxvzMSJsQ150jav1kkdoHRZOpxN+EjRRwvYYZbDtUCMJg4w7vKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLfuTB3F; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abec925a135so7827166b.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 02:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740392935; x=1740997735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CP4PTejJTy5w0W1f0uMRtPVG2eRrPohFIOYgCoWXK4=;
        b=bLfuTB3Fh/vsO1iCPHGUKVXXRMfDhCuEERkH8+HsFhJ2DP8NNPmX5KKHKKzY1R6nDJ
         Ka/je7SAAXW4au8e7qKk0q7yugAr+C21r1Di5D3grrAFwkgyO6QRo5HRArGcZpHA009s
         XrVDrd4h8WSTO2pMmjkb8KXLLwdEr3VXNVOJ9ZtNTRowRxu9/Nmy7b+Hybv87FjLZHTt
         jwMYFVyMA2dNDuly17lCPyCFzkhQo3GR9olZKmLMZVD6PhAEtqJC3ykMr+WL1waryvIB
         dMhzi2NSzshbiUgwE6FkiZnP4NbVXKDloAbyb20txAeRG6CcK3hASfsDRu/5Kx911eD9
         WmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740392935; x=1740997735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CP4PTejJTy5w0W1f0uMRtPVG2eRrPohFIOYgCoWXK4=;
        b=Zkkm8xD/W4SMFrAs38nw63K6e64hwNKBMiAcdVBm5Q5UXo/Tykz6EbrA2k+JzfxQbA
         taVNfraqLdECfwXRc1kwDmjS+K0jU5FMCRo6QrsvHxXSatWhM76CkjfiH/gg7WWs4nmc
         gA9/gJ94mjgzelxIo4k6tGuS/lFeUVWC12O13RyeFYhE2vJtPCr5K/yeep6V0ktUYvsn
         fWGIhO2qyltqcPh8jMYksNjjpN/ZhjvkEg5nprVlltLAfzmh+top2kl7oRz9AjMppS3T
         s0Y8L8mGqoHFF7yCsfssar1OiJaca68PoFW44sqalSMFndiW3niUvymiNaSRrJMXsONr
         EnIw==
X-Forwarded-Encrypted: i=1; AJvYcCWpnxK1/MFD/w4EIrtHz5DAP0WjFaRUNMrD/i7uI4nK0YiOl/Dvx0bAvhOFYOJDD6JAYI+AlqHZq72h@vger.kernel.org
X-Gm-Message-State: AOJu0YzbD92lg53K09eSIl9ctANhT3kAv0Cc+05wkSLnSXe6rlrlF7In
	np3C2DTYBDHqZ5u+UqhYtvM9UAWt2IxTtgbYb4Bk9zQ2Bb8NQjWD30LMLWRGQ38=
X-Gm-Gg: ASbGncvFpdNnbnp0n1brIQjRqLAZ6BMgoGQyW03mIz/zinLY0Q/p81Z0WGjjfJEvlgT
	U5FkA73w+mAMGSMhwiwln+nDUzaav6aRKLIAORqnPGw1chRKn1LNtpQKPIjviBzbxvABiBMG5D1
	D16BXbVOFR8joUCM7VF3KAxasuuFfbJ9bXx6qYJNvTC9GVWVWylaQ8Ee+xu7tSKMihuGWd7aDjm
	1uZYg97/8y2Mo9mIsMcWg19xtju1FYx7E5F6+CulfI5Gkd+QJqFIqi27meuu5c7yTWPxAVffTFe
	Mr37LV1i+E32u3n5repm+AopfLtibi90WaVP3/TP0PTNGXNbxGRNaf501olymCrBQyYSLSURKch
	YZVeKn6HFnw==
X-Google-Smtp-Source: AGHT+IHP5RNPLqlVB9CrzOVqEsQAC7kDNKH7YhWz1BKovw8btgolpsGva7IxHZja9Uez0eg90nK/3Q==
X-Received: by 2002:a17:907:7d9e:b0:ab7:c893:fc80 with SMTP id a640c23a62f3a-abc09ab4a92mr1129252566b.24.1740392934555;
        Mon, 24 Feb 2025 02:28:54 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb186c5d5sm1349206666b.51.2025.02.24.02.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:28:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Feb 2025 10:28:53 +0000
Subject: [PATCH 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-max77759-mfd-v1-5-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.1

The Maxim MAX77759 is a companion Power Management IC for USB Type-C
applications with Battery Charger, Fuel Gauge, temperature sensors, USB
Type-C Port Controller (TCPC), NVMEM, and additional GPIO interfaces.

This driver supports the GPIO functions using the platform device
registered by the core MFD driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                  |   1 +
 drivers/gpio/Kconfig         |  13 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-max77759.c | 522 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 537 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1bbe7165e0d..d119ed1ff279 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14327,6 +14327,7 @@ M:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
+F:	drivers/gpio/gpio-max77759.c
 F:	drivers/mfd/max77759.c
 F:	include/linux/mfd/max77759.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f518f5458446..486b22438c76 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1462,6 +1462,19 @@ config GPIO_MAX77650
 	  GPIO driver for MAX77650/77651 PMIC from Maxim Semiconductor.
 	  These chips have a single pin that can be configured as GPIO.
 
+config GPIO_MAX77759
+	tristate "Maxim Integrated MAX77759 GPIO support"
+	depends on MFD_MAX77759
+	default MFD_MAX77759
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO driver for MAX77759 PMIC from Maxim Integrated.
+	  There are two GPIOs available on these chips in total, both of
+	  which can also generate interrupts.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-max77759.
+
 config GPIO_PALMAS
 	bool "TI PALMAS series PMICs GPIO"
 	depends on MFD_PALMAS
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b58..d7a904047657 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_GPIO_MAX730X)		+= gpio-max730x.o
 obj-$(CONFIG_GPIO_MAX732X)		+= gpio-max732x.o
 obj-$(CONFIG_GPIO_MAX77620)		+= gpio-max77620.o
 obj-$(CONFIG_GPIO_MAX77650)		+= gpio-max77650.o
+obj-$(CONFIG_GPIO_MAX77759)		+= gpio-max77759.o
 obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
diff --git a/drivers/gpio/gpio-max77759.c b/drivers/gpio/gpio-max77759.c
new file mode 100644
index 000000000000..9f21a6cf4567
--- /dev/null
+++ b/drivers/gpio/gpio-max77759.c
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright 2020 Google Inc
+// Copyright 2025 Linaro Ltd.
+//
+// GPIO driver for Maxim MAX77759
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqreturn.h>
+#include <linux/lockdep.h>
+#include <linux/mfd/max77759.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+
+#define MAX77759_N_GPIOS   ARRAY_SIZE(max77759_gpio_line_names)
+static const char * const max77759_gpio_line_names[] = { "GPIO5", "GPIO6" };
+
+struct max77759_gpio_chip {
+	struct regmap *map;
+	struct max77759_mfd *max77759_mfd;
+	struct gpio_chip gc;
+	struct mutex maxq_lock; /* protect MaxQ r/m/w operations */
+
+	struct mutex irq_lock; /* protect irq bus */
+	int irq_mask;
+	int irq_mask_changed;
+	int irq_trig;
+	int irq_trig_changed;
+};
+
+#define MAX77759_GPIOx_TRIGGER(offs, val) (((val) & 1) << (offs))
+#define MAX77759_GPIOx_TRIGGER_MASK(offs) MAX77759_GPIOx_TRIGGER(offs, ~0)
+enum max77759_trigger_gpio_type {
+	MAX77759_GPIO_TRIGGER_RISING = 0,
+	MAX77759_GPIO_TRIGGER_FALLING = 1
+};
+
+#define MAX77759_GPIOx_DIR(offs, dir) (((dir) & 1) << (2 + (3 * (offs))))
+#define MAX77759_GPIOx_DIR_MASK(offs) MAX77759_GPIOx_DIR(offs, ~0)
+enum max77759_control_gpio_dir {
+	MAX77759_GPIO_DIR_IN = 0,
+	MAX77759_GPIO_DIR_OUT = 1
+};
+
+#define MAX77759_GPIOx_OUTVAL(offs, val) (((val) & 1) << (3 + (3 * (offs))))
+#define MAX77759_GPIOx_OUTVAL_MASK(offs) MAX77759_GPIOx_OUTVAL(offs, ~0)
+
+#define MAX77759_GPIOx_INVAL_MASK(offs) (BIT(4) << (3 * (offs)))
+
+static int max77759_gpio_maxq_gpio_trigger_read(struct max77759_gpio_chip *chip)
+{
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length, 1);
+	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length, 2);
+	int ret;
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_READ;
+
+	ret = max77759_maxq_command(chip->max77759_mfd, cmd, rsp);
+	if (ret < 0)
+		return ret;
+
+	return rsp->rsp[1];
+}
+
+static int max77759_gpio_maxq_gpio_trigger_write(struct max77759_gpio_chip *chip,
+						 u8 trigger)
+{
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length, 2);
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_WRITE;
+	cmd->cmd[1] = trigger;
+
+	return max77759_maxq_command(chip->max77759_mfd, cmd, NULL);
+}
+
+static int max77759_gpio_maxq_gpio_control_read(struct max77759_gpio_chip *chip)
+{
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length, 1);
+	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length, 2);
+	int ret;
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_GPIO_CONTROL_READ;
+
+	ret = max77759_maxq_command(chip->max77759_mfd, cmd, rsp);
+	if (ret < 0)
+		return ret;
+
+	return rsp->rsp[1];
+}
+
+static int max77759_gpio_maxq_gpio_control_write(struct max77759_gpio_chip *chip,
+						 u8 ctrl)
+{
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length, 2);
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_GPIO_CONTROL_WRITE;
+	cmd->cmd[1] = ctrl;
+
+	return max77759_maxq_command(chip->max77759_mfd, cmd, NULL);
+}
+
+static int
+max77759_gpio_direction_from_control(int ctrl, unsigned int offset)
+{
+	return (((ctrl & MAX77759_GPIOx_DIR_MASK(offset))
+		 == MAX77759_GPIO_DIR_OUT)
+		? GPIO_LINE_DIRECTION_OUT
+		: GPIO_LINE_DIRECTION_IN);
+}
+
+static int max77759_gpio_get_direction(struct gpio_chip *gc,
+				       unsigned int offset)
+{
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	int ctrl;
+
+	ctrl = max77759_gpio_maxq_gpio_control_read(chip);
+	if (ctrl < 0)
+		return ctrl;
+
+	return max77759_gpio_direction_from_control(ctrl, offset);
+}
+
+static int max77759_gpio_direction_helper(struct gpio_chip *gc,
+					  unsigned int offset,
+					  enum max77759_control_gpio_dir dir,
+					  int value)
+{
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	int ctrl, new_ctrl;
+
+	guard(mutex)(&chip->maxq_lock);
+
+	ctrl = max77759_gpio_maxq_gpio_control_read(chip);
+	if (ctrl < 0)
+		return ctrl;
+
+	new_ctrl = ctrl & ~MAX77759_GPIOx_DIR_MASK(offset);
+	new_ctrl |= MAX77759_GPIOx_DIR(offset, dir);
+
+	if (dir == MAX77759_GPIO_DIR_OUT) {
+		new_ctrl &= ~MAX77759_GPIOx_OUTVAL_MASK(offset);
+		new_ctrl |= MAX77759_GPIOx_OUTVAL(offset, value);
+	}
+
+	if (new_ctrl == ctrl)
+		return 0;
+
+	return max77759_gpio_maxq_gpio_control_write(chip, new_ctrl);
+}
+
+static int max77759_gpio_direction_input(struct gpio_chip *gc,
+					 unsigned int offset)
+{
+	return max77759_gpio_direction_helper(gc, offset,
+					      MAX77759_GPIO_DIR_IN, -1);
+}
+
+static int max77759_gpio_direction_output(struct gpio_chip *gc,
+					  unsigned int offset, int value)
+{
+	return max77759_gpio_direction_helper(gc, offset,
+					      MAX77759_GPIO_DIR_OUT, value);
+}
+
+static int max77759_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	int ctrl, mask;
+
+	ctrl = max77759_gpio_maxq_gpio_control_read(chip);
+	if (ctrl < 0)
+		return ctrl;
+
+	/*
+	 * The input status bit doesn't reflect the pin state when the GPIO is
+	 * configured as an output. Check the direction, and inspect the input
+	 * or output bit accordingly.
+	 */
+	mask = ((max77759_gpio_direction_from_control(ctrl, offset)
+		 == GPIO_LINE_DIRECTION_IN)
+		? MAX77759_GPIOx_INVAL_MASK(offset)
+		: MAX77759_GPIOx_OUTVAL_MASK(offset));
+
+	return !!(ctrl & mask);
+}
+
+static void max77759_gpio_set_value(struct gpio_chip *gc,
+				    unsigned int offset, int value)
+{
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	int ctrl, new_ctrl;
+
+	guard(mutex)(&chip->maxq_lock);
+
+	ctrl = max77759_gpio_maxq_gpio_control_read(chip);
+	if (ctrl < 0)
+		return;
+
+	new_ctrl = ctrl & ~MAX77759_GPIOx_OUTVAL_MASK(offset);
+	new_ctrl |= MAX77759_GPIOx_OUTVAL(offset, value);
+
+	if (new_ctrl == ctrl)
+		return;
+
+	max77759_gpio_maxq_gpio_control_write(chip, new_ctrl);
+}
+
+static void max77759_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	chip->irq_mask &= ~MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(hwirq);
+	chip->irq_mask |= MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(hwirq, 1);
+	chip->irq_mask_changed |= MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(hwirq, 1);
+
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void max77759_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(gc, hwirq);
+
+	chip->irq_mask &= ~MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(hwirq);
+	chip->irq_mask |= MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(hwirq, 0);
+	chip->irq_mask_changed |= MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(hwirq, 1);
+}
+
+static int max77759_gpio_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	chip->irq_trig &= ~MAX77759_GPIOx_TRIGGER_MASK(hwirq);
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		chip->irq_trig |= MAX77759_GPIOx_TRIGGER(hwirq,
+						MAX77759_GPIO_TRIGGER_RISING);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		chip->irq_trig |= MAX77759_GPIOx_TRIGGER(hwirq,
+						MAX77759_GPIO_TRIGGER_FALLING);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	chip->irq_trig_changed |= MAX77759_GPIOx_TRIGGER(hwirq, 1);
+
+	return 0;
+}
+
+static void max77759_gpio_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->irq_lock);
+}
+
+static int max77759_gpio_bus_sync_unlock_helper(struct gpio_chip *gc,
+						struct max77759_gpio_chip *chip)
+					       __must_hold(&chip->maxq_lock)
+{
+	int ctrl, trigger, new_trigger,  new_ctrl;
+	unsigned long irq_trig_changed;
+	int offset;
+	int ret;
+
+	lockdep_assert_held(&chip->maxq_lock);
+
+	ctrl = max77759_gpio_maxq_gpio_control_read(chip);
+	trigger = max77759_gpio_maxq_gpio_trigger_read(chip);
+	if (ctrl < 0 || trigger < 0) {
+		dev_err(gc->parent, "failed to read current state: %d / %d\n",
+			ctrl, trigger);
+		return (ctrl < 0) ? ctrl : trigger;
+	}
+
+	new_trigger = trigger & ~chip->irq_trig_changed;
+	new_trigger |= (chip->irq_trig & chip->irq_trig_changed);
+
+	/* change GPIO direction if required */
+	new_ctrl = ctrl;
+	irq_trig_changed = chip->irq_trig_changed;
+	for_each_set_bit(offset, &irq_trig_changed, MAX77759_N_GPIOS) {
+		new_ctrl &= ~MAX77759_GPIOx_DIR_MASK(offset);
+		new_ctrl |= MAX77759_GPIOx_DIR(offset, MAX77759_GPIO_DIR_IN);
+	}
+
+	if (new_trigger != trigger) {
+		ret = max77759_gpio_maxq_gpio_trigger_write(chip, new_trigger);
+		if (ret) {
+			dev_err(gc->parent,
+				"failed to write new trigger: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (new_ctrl != ctrl) {
+		ret = max77759_gpio_maxq_gpio_control_write(chip, new_ctrl);
+		if (ret) {
+			dev_err(gc->parent,
+				"failed to write new control: %d\n", ret);
+			return ret;
+		}
+	}
+
+	chip->irq_trig_changed = 0;
+
+	return 0;
+}
+
+static void max77759_gpio_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct max77759_gpio_chip *chip = gpiochip_get_data(gc);
+	int ret;
+
+	scoped_guard(mutex, &chip->maxq_lock) {
+		ret = max77759_gpio_bus_sync_unlock_helper(gc, chip);
+		if (ret)
+			goto out_unlock;
+	}
+
+	ret = regmap_update_bits(chip->map,
+				 MAX77759_MAXQ_REG_UIC_INT1_M,
+				 chip->irq_mask_changed, chip->irq_mask);
+	if (ret) {
+		dev_err(gc->parent,
+			"failed to update UIC_INT1 irq mask: %d\n", ret);
+		goto out_unlock;
+	}
+
+	chip->irq_mask_changed = 0;
+
+out_unlock:
+	mutex_unlock(&chip->irq_lock);
+}
+
+static void max77759_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	seq_puts(p, dev_name(gc->parent));
+}
+
+static const struct irq_chip max77759_gpio_irq_chip = {
+	.irq_mask		= max77759_gpio_irq_mask,
+	.irq_unmask		= max77759_gpio_irq_unmask,
+	.irq_set_type		= max77759_gpio_set_irq_type,
+	.irq_bus_lock		= max77759_gpio_bus_lock,
+	.irq_bus_sync_unlock	= max77759_gpio_bus_sync_unlock,
+	.irq_print_chip		= max77759_gpio_irq_print_chip,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t max77759_gpio_irqhandler(int irq, void *data)
+{
+	struct max77759_gpio_chip *chip = data;
+	struct gpio_chip *gc = &chip->gc;
+	int handled = 0;
+
+	/* iterate until no interrupt is pending */
+	handled = 0;
+	while (true) {
+		unsigned int uic_int1;
+		int ret;
+		unsigned long pending;
+		int offset;
+
+		ret = regmap_read(chip->map, MAX77759_MAXQ_REG_UIC_INT1,
+				  &uic_int1);
+		if (ret < 0) {
+			dev_err_ratelimited(gc->parent,
+					    "failed to read IRQ status: %d\n",
+					    ret);
+			/*
+			 * If handled == 0, we have looped not even once, which
+			 * means we should return IRQ_NONE in that case (and
+			 * of course IRQ_HANDLED otherwise).
+			 */
+			return IRQ_RETVAL(handled);
+		}
+
+		pending = uic_int1;
+		pending &= (MAX77759_MAXQ_REG_UIC_INT1_GPIO6I
+			    | MAX77759_MAXQ_REG_UIC_INT1_GPIO5I);
+		if (!pending)
+			break;
+
+		for_each_set_bit(offset, &pending, MAX77759_N_GPIOS) {
+			unsigned int virq;
+
+			/*
+			 * ACK interrupt by writing 1 to bit 'offset', all
+			 * others need to be written as 0. This needs to be
+			 * done unconditionally hence regmap_set_bits() is
+			 * inappropriate here.
+			 */
+			regmap_write(chip->map, MAX77759_MAXQ_REG_UIC_INT1,
+				     BIT(offset));
+
+			virq = irq_find_mapping(gc->irq.domain, offset);
+			handle_nested_irq(virq);
+
+			handled = 1;
+		}
+	}
+
+	return IRQ_RETVAL(handled);
+}
+
+static int max77759_gpio_probe(struct platform_device *pdev)
+{
+	struct max77759_gpio_chip *chip;
+	int irq;
+	struct gpio_irq_chip *girq;
+	int ret;
+	unsigned long irq_flags;
+	struct irq_data *irqd;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->map = dev_get_regmap(pdev->dev.parent, "maxq");
+	if (!chip->map)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Missing regmap\n");
+
+	irq = platform_get_irq_byname(pdev, "GPI");
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "Failed to get IRQ\n");
+
+	chip->max77759_mfd = dev_get_drvdata(pdev->dev.parent);
+	devm_mutex_init(&pdev->dev, &chip->maxq_lock);
+	devm_mutex_init(&pdev->dev, &chip->irq_lock);
+
+	chip->gc.base = -1;
+	chip->gc.label = dev_name(&pdev->dev);
+	chip->gc.parent = &pdev->dev;
+	chip->gc.owner = THIS_MODULE;
+	chip->gc.can_sleep = true;
+
+	chip->gc.names = max77759_gpio_line_names;
+	chip->gc.ngpio = MAX77759_N_GPIOS;
+	chip->gc.get_direction = max77759_gpio_get_direction;
+	chip->gc.direction_input = max77759_gpio_direction_input;
+	chip->gc.direction_output = max77759_gpio_direction_output;
+	chip->gc.get = max77759_gpio_get_value;
+	chip->gc.set = max77759_gpio_set_value;
+
+	girq = &chip->gc.irq;
+	gpio_irq_chip_set_chip(girq, &max77759_gpio_irq_chip);
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to add GPIO chip\n");
+
+	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
+	irqd = irq_get_irq_data(irq);
+	if (irqd)
+		irq_flags |= irqd_get_trigger_type(irqd);
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					max77759_gpio_irqhandler, irq_flags,
+					dev_name(&pdev->dev), chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request IRQ\n");
+
+	return ret;
+}
+
+static const struct of_device_id max77759_gpio_of_id[] = {
+	{ .compatible = "maxim,max77759-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max77759_gpio_of_id);
+
+static struct platform_driver max77759_gpio_driver = {
+	.driver = {
+		.name = "max77759-gpio",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = max77759_gpio_of_id,
+	},
+	.probe = max77759_gpio_probe,
+};
+
+module_platform_driver(max77759_gpio_driver);
+
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_DESCRIPTION("GPIO driver for Maxim MAX77759");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:max77759-gpio");

-- 
2.48.1.658.g4767266eb4-goog



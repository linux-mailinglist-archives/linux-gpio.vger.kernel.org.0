Return-Path: <linux-gpio+bounces-17940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7FA6EB0B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC6E1883993
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E9F255255;
	Tue, 25 Mar 2025 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUH7hCZS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6D253F13
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889778; cv=none; b=o5zyopRRkbkYQnzBw7dPoOwb98G8/UTzLVqsmdxz6QdMmL+p2PK81bnh4CGTpFA/dby+yB+kKn6yD02bG+AvI8FX+r9lgofzkhgon8Z1FfjVfc0/pMzurAvEU0W87yJA/YFyYjRs57cHr03+IVAudp2stOrwH1zjSXujnedBVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889778; c=relaxed/simple;
	bh=J5YkwTE2bNx/sUZYTPs/4b3l9lNrPcVK0d34uNTG3Yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iq9NTdUbMXuzncjgs1KZ+sEFtJoZwAEzljhV968EISHuRInpUTzXCPx//AyO3O2aUmH73bJxKxJkQIw2Ta8T1rB96pECVtJazgO3tY5LP95h6InfAqnRl/zEXQPvEzCTGGdVrQHfcb8QMzjgcPDuf4CBvjTHhVjezjoZHHksrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vUH7hCZS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so9494232a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889773; x=1743494573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ng+L9Y2YgWzj0a+f2OfK8HInzcLMFPPgQeDh/nvHY/k=;
        b=vUH7hCZS3o30n0bFfjW+K43dYd2+UHGxbIKO3A8+C/h+83epfaPmruFjkfmEVxr1JQ
         /PDzV095dKuw7KA+wJuBbFR9DK6t4r0/vW//6VryeY3upc6B1HwX2N03e05cEq7ncNqa
         lRwWPTd1JE76s+mQUTr/YK3ljwkmHOdybQ7N+tTTpj66Wvy0HRzG2hSEANIXrqKZROob
         PfzjJUJhKBQZfnt1CmpZjLTz3FZqIp/JypvyxtFn1jHyP0dcFrFD7WSPgJMpQut6m0kk
         SWqRPmjsB6macMTNIzXrQcIOcsDdOW1+1LvvQmE6kh8gIuSdU31sc2Cw3ecxoCewNluw
         mbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889773; x=1743494573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng+L9Y2YgWzj0a+f2OfK8HInzcLMFPPgQeDh/nvHY/k=;
        b=K+2oEBpV4kjxZnPz3hiRLiXwmR5i9iItNbCNvryEbF9UTGqR/eWjT8IuoI3nfwkbKY
         gXhQc769nfATDuCSfc/xtqSzkTi2W1O6MoV6I+kJAadaNdKlkYbDT1hCaQWC5Sxj9LU9
         fglCP4XmtHQ97hGmVaADrnTlar600Q238+kLU4kTYIRytLQWUcBJTIY2lTO6PuEQMKc/
         ew20xUk9N2kufY2ILHAqxw/VuY2GJCcGaQc+VZ2pAQgtvQ0gvPS0mgkaQej7bFKYpreT
         hhfnuXC9ODU1ayTWClTsrCe8aVN0astsC9Qgp60Ve/BMCW7tEu5kedsxWCVtKU2vtVSU
         bVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw32YSYuxp1SGccv18835iKuV1SEIwQQZkCH4COm70zYWPllJhlo+jY2sJttUq8zggOuAn8biPfPpC@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRdX8AB5ht7YUJocelQSjvBtFuTPbIR5s73wzdATASTeLh51S
	QsQrFosQQAwfiR1D7w/9ZO8ZLUlvS8n6Os8qOltVw3QpDO+ODSA9xCJ5Lvi2IHM=
X-Gm-Gg: ASbGncsNd2RqkcL6AE/NzdJnvMn+uJ266LnBsKTDl0F/MnPB+lSwJzD/OuH9t3p9PCG
	RBXdNogf3LFi1i4zsvPAYbSdYG2mLiaMX4vCSGkEfnfr4V7cSebYIjTPQCIrYe5tg264hhL2XDA
	8aoektuCrgav7NhqSVYM98yrT+UD3nSk3maxLl1cnDpyr2AHf+Obyzy3eNXsL9dH7nOnZDBiZP4
	BrCOuobhMot5QRg7P2OAHD+NiX7mq8s2Ec+/iuYA2buLq1HUoOutt1Dq3RipkIe4vk1TrgfDUNI
	oo11a3ZvDJWS7vqII0kA9I3w8HBS5nS+PpyRbTWQNFELtWX6L/q8c11Wyfp/RDLS9bQhCfR7P1O
	gAyC0HRVBR4SEXh1aESxZ1tQBAUXn
X-Google-Smtp-Source: AGHT+IHI42dB/TiGxBPvK7KZNSOs9JkBuAPNkaoRDv2GUfPa6A4XO+HGiCNHWOBzEU04Oqe6qr4caA==
X-Received: by 2002:a05:6402:440a:b0:5e5:ca1b:c425 with SMTP id 4fb4d7f45d1cf-5ebcd4680c0mr13739943a12.17.1742889773263;
        Tue, 25 Mar 2025 01:02:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb004fsm7446785a12.40.2025.03.25.01.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:02:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:02:28 +0000
Subject: [PATCH v5 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v5-5-69bd6f07a77b@linaro.org>
References: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This driver supports the GPIO functions using the platform device
registered by the core MFD driver.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v5:
* follow API updates of max77759 core driver

v3:
* drop duplicate init of 'handled' variable in irq handler
* use boolean with IRQ_RETVAL() (Linus)
* drop 'virq' variable inside irq handler to avoid confusion (Linus)
* drop assignment of struct gpio_chip::owner (Linus)

v2:
* fix max77759_gpio_direction_from_control()
* add missing error handling of devm_mutex_init() (Christophe)
* align sentinel in max77759_gpio_of_id[] with other max77759 drivers
  (Christophe)
---
 MAINTAINERS                  |   1 +
 drivers/gpio/Kconfig         |  13 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-max77759.c | 524 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 539 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 008a0bc3813292ebb3d9a0036790eff861a0e797..a1abc3fa52a9713da19a1d8d4f625fd9aeee06b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14573,6 +14573,7 @@ M:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
+F:	drivers/gpio/gpio-max77759.c
 F:	drivers/mfd/max77759.c
 F:	include/linux/mfd/max77759.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..5fcd04318ec17922b6959fbc2a2ad79a42cd4d29 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1463,6 +1463,19 @@ config GPIO_MAX77650
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
index af130882ffeeef8b1d518867bfe1493ec4f21b5f..3b9a55f9f79eda33c135cfedb230ef7775b51bee 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_GPIO_MAX730X)		+= gpio-max730x.o
 obj-$(CONFIG_GPIO_MAX732X)		+= gpio-max732x.o
 obj-$(CONFIG_GPIO_MAX77620)		+= gpio-max77620.o
 obj-$(CONFIG_GPIO_MAX77650)		+= gpio-max77650.o
+obj-$(CONFIG_GPIO_MAX77759)		+= gpio-max77759.o
 obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
diff --git a/drivers/gpio/gpio-max77759.c b/drivers/gpio/gpio-max77759.c
new file mode 100644
index 0000000000000000000000000000000000000000..09423ad5ae22d1046189bcda961ca35c828c6f21
--- /dev/null
+++ b/drivers/gpio/gpio-max77759.c
@@ -0,0 +1,524 @@
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
+	struct max77759 *max77759;
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
+	ret = max77759_maxq_command(chip->max77759, cmd, rsp);
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
+	return max77759_maxq_command(chip->max77759, cmd, NULL);
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
+	ret = max77759_maxq_command(chip->max77759, cmd, rsp);
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
+	return max77759_maxq_command(chip->max77759, cmd, NULL);
+}
+
+static int
+max77759_gpio_direction_from_control(int ctrl, unsigned int offset)
+{
+	enum max77759_control_gpio_dir dir;
+
+	dir = !!(ctrl & MAX77759_GPIOx_DIR_MASK(offset));
+	return ((dir == MAX77759_GPIO_DIR_OUT)
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
+	int ctrl, trigger, new_trigger, new_ctrl;
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
+	bool handled = false;
+
+	/* iterate until no interrupt is pending */
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
+			 * If !handled, we have looped not even once, which
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
+			/*
+			 * ACK interrupt by writing 1 to bit 'offset', all
+			 * others need to be written as 0. This needs to be
+			 * done unconditionally hence regmap_set_bits() is
+			 * inappropriate here.
+			 */
+			regmap_write(chip->map, MAX77759_MAXQ_REG_UIC_INT1,
+				     BIT(offset));
+
+			handle_nested_irq(irq_find_mapping(gc->irq.domain,
+							   offset));
+
+			handled = true;
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
+	chip->max77759 = dev_get_drvdata(pdev->dev.parent);
+	ret = devm_mutex_init(&pdev->dev, &chip->maxq_lock);
+	if (ret)
+		return ret;
+	ret = devm_mutex_init(&pdev->dev, &chip->irq_lock);
+	if (ret)
+		return ret;
+
+	chip->gc.base = -1;
+	chip->gc.label = dev_name(&pdev->dev);
+	chip->gc.parent = &pdev->dev;
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
+	{ }
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
2.49.0.395.g12beb8f557-goog



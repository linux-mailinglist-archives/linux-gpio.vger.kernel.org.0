Return-Path: <linux-gpio+bounces-17947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A7AA6EB89
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736FC18940B4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41665255E32;
	Tue, 25 Mar 2025 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRkn9tkI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126152528E5
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891235; cv=none; b=tLKi8M2c6OnO0AVde2qDZOrHZ5eMt27fB8t08exsrlsoZIKzEu7EjOvmVXrzLd4vU2IDQ1vqb+ENJJF4gntETDja1aQ0wi+GUtmpWWS8C2xa+2gDMk7qL6QWa5DxFhx/DbAhIWVBN62t+erq0s0PRaTfFg6okFxxdMHrSGAH8CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891235; c=relaxed/simple;
	bh=J5YkwTE2bNx/sUZYTPs/4b3l9lNrPcVK0d34uNTG3Yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sFbxGBu1cyCHjZ1jnvFkD9n194mNq4ZO+dWkALPOH0ZTN/COEe3N8R8mlHhbAflaMyJK1guX0ojyiLrofPl8OjQZa+TpHPeejqCFMjZY6j9FBOHXXeEcwOM6utAIJwlfePol1sKY6sNXtnBSLFtKieywrBkywuSqlBKxF8gtbmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRkn9tkI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so7969104a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742891229; x=1743496029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ng+L9Y2YgWzj0a+f2OfK8HInzcLMFPPgQeDh/nvHY/k=;
        b=VRkn9tkIB041/q9mJa2kbhrxHG5Ly5Yj+jxo1qGcI9ZkeX61vEBkQcd+r+LJjadsWr
         DSHHXcLl6wPZu9rfCeMnYLmNigupfzu43C5EsMzePXIZm0wuYoIrE8fy5MLupKzAiP5p
         JBRq0w0HAMJsY+/vC/WY7kuALG3/Is+YCaXSMigavlgzl7Xl46AQkWOadCqpEsKXH+yT
         VNheptBnVwKr5mQvHt+UydiNOi4dxJwFnmr+cqIAsQYK5w0pE0doC9SPnpV7mKDxl4AF
         p6OdoJ2HnHR0WXz/PYZyahkLyh0wA8l6tRT5BMNkINsTw9iqZErhaMVM/vQgmZQG/bfY
         mF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891229; x=1743496029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng+L9Y2YgWzj0a+f2OfK8HInzcLMFPPgQeDh/nvHY/k=;
        b=d6zKDK6eMkgOEY5ATLbQaS2eQvUQ7cr2wMboR7hxjB2DJ+c4QQ1Zqd2nZLhDcXwkUV
         CUp5eBDiFxKCbsQKgk0OBDgmusjXC6/VVH7b0RJsqjP/CRMG/g1DsIxHMPC8T+00Bt4g
         pFIzUfEcdOUVHEYa/AdD+ox0rASnMOEWD1pYWgc9Q5xD6HLpg6w5jOEt47RFnaejyHO8
         HxtXca6TqdvBRG0d7kz//Bjc3qHSTL8UneVdhfpqvnc35gkMxL16Zr8y3ssrDVLiu4lL
         7sAfque53b4dbs861FZYXwvc63VHU7zhATNMAnlk+9ibAe2WR0YAVoQOxJR5n1QDOITm
         pG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxDVCfRCNuPuTxflzcasnmJYTAW1mIA0O5sr/lRf8RU55EUg2z37mpjSLjMn9WRVbmIEjOJy10FWTx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CksAxa8pRB7FYyxv6drT4Vt6GQQZ5DT744Nn8w8ifEAGnX6m
	+1+rGmnhA/JHV52AyB/TJ92E8oTYy0Rm/vk0RJOcHDY2TH+doT0KhYaV9reU+oo=
X-Gm-Gg: ASbGncuFUTJ8F+HC7sN65WT8InZvMbDTRUtKPWsiB3ULd6GgKkJsnZFkJiPEcLyKJco
	4PCS48Io/b1sLnhaHs19IgkVTLfR64zBEZP2RRIP87HRo7TApme/nJf4rstu+GcB0cb+QBQdAe2
	pKdHUWFfu/ILnoCXLOMYbDnPPhYMqTofQ+TC6jFyv7+hTZ3zT16Xo7PrDX2ZNadPMy9AvNVCv1q
	lAmfni/WKtwyWq/DU4dmM0EfkLCRb6FfO9h0zpD/WcDMDklzz9RiftNUJDkcKkQy2Zadxk0RJ3n
	tvva0pP+5nu31PGMWcvfeWgS3aH/dNOf/5a/MX2aVLpDnTnivZNHp+o7x3kd7V1wN8H2wku+mTM
	TqJvXavmmY5g+nxoQVygVVWkdkdSC
X-Google-Smtp-Source: AGHT+IGIuGSA5f1mBuiEnByxoHncIUCcjM2iQqkOv+EXlzvsj9COTTYcTplfuAjlLSwvkjOGzA2poA==
X-Received: by 2002:a05:6402:268b:b0:5ec:c919:1b7c with SMTP id 4fb4d7f45d1cf-5ecc9191c88mr4991095a12.5.1742891229248;
        Tue, 25 Mar 2025 01:27:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcce36d66sm7377366a12.0.2025.03.25.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:27:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:27:06 +0000
Subject: [PATCH v6 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v6-5-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
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



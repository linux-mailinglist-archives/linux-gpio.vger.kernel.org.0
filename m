Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAC93EE7EB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 10:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbhHQIB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 04:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbhHQIB7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 04:01:59 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93792C061764;
        Tue, 17 Aug 2021 01:01:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id w24so5349774wmi.5;
        Tue, 17 Aug 2021 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aS9xpuWQ7cV7oWrmqXRiXydvlbggR6/xVxVxKlldG2A=;
        b=pFGPUp4kSUKg9FmnRTvYONtxyYCteiKQTidHOzpn6LqXrk11oui65PlZuQC4jl/Dzl
         PrNpKd4BU67Z6DxDXkgX57sL+CKNq9qSW2+zjc7cp8PnUu4GwFgmDO9Qz8pkLu9phyMp
         uvNs1jsf0CtBqtDfAyRf3cRQZPOn3eVyG651vGQU6f/uIAjiD3eQM6PVeBz25mPkvw5+
         pZOpH6bBwBIa0vwwAGR3P22uFXGExi300wrmkYwzK7m4OsGMb/4/EpWGa3XVhVUlGAzN
         wFqfnet19/msSI7mAdGBzwTSFmXCH8m9tTq5/PxYTsFUxPdIQyWJzsDDjZ3CN4Gbhk0d
         6z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aS9xpuWQ7cV7oWrmqXRiXydvlbggR6/xVxVxKlldG2A=;
        b=IxNBTSJL745ZYhRrUquYZRrwdvTciFgnmvbfBClv8iK2kcVBgQh3VyrD7tLim0v6BQ
         9dUGW5AtLRVQBjR/ft5sVwvtFk+cJRdOWWO0Rh+zkqw8y4/LNg9+Dv81k1toTqlxhKQN
         F5xAyWha9NkpLul9i1lsIIdiLbD7epeNbqD4cAmsq3QWo4feXLLk8uLEo6I7xSVVUXS5
         gkH1xZmgJuo1ePainegMPaAZr2bOjTlipjnWAbxyqYdqcTk8EDrIsLxyg8HiA8t7Z7TX
         saaipieeekLsPZ962Y+FpdkQjOuSBoXfgYpiAeItkYBHtdhs0KRyVkXY+/iTlTVWhaDE
         2FVw==
X-Gm-Message-State: AOAM532UOsLUEgAGkgqUxUQO3YS1czLuoFBYRQniJffdyXU9/OOyAb+K
        LT76MvJpNUWBnxrur5YCxu4=
X-Google-Smtp-Source: ABdhPJxLlkljaDHAjvjfXeQNfMj5qQ/PYZEDlt79p5gmmxYTpHZSjdIMfwaeazfI5FPMDkOEK3Kwiw==
X-Received: by 2002:a05:600c:4e87:: with SMTP id f7mr2053403wmq.42.1629187285139;
        Tue, 17 Aug 2021 01:01:25 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id n3sm1269212wmi.0.2021.08.17.01.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 01:01:24 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions
Date:   Tue, 17 Aug 2021 10:01:18 +0200
Message-Id: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files") removes the
config MACH_MX35_3DS in arch/arm/mach-imx/Kconfig.

Hence, since then, the MX35 3DS BOARD MC9S08DZ60 GPIO functions are dead
code as its config GPIO_MC9S08DZ60 depends on the config MACH_MX35_3DS.

Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:

MACH_MX35_3DS
Referencing files: drivers/gpio/Kconfig

Remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpio/Kconfig           |   6 --
 drivers/gpio/Makefile          |   1 -
 drivers/gpio/gpio-mc9s08dz60.c | 112 ---------------------------------
 3 files changed, 119 deletions(-)
 delete mode 100644 drivers/gpio/gpio-mc9s08dz60.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fab571016adf..9a494cab5dbf 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1010,12 +1010,6 @@ config GPIO_MAX732X_IRQ
 	  Say yes here to enable the max732x to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.
 
-config GPIO_MC9S08DZ60
-	bool "MX35 3DS BOARD MC9S08DZ60 GPIO functions"
-	depends on I2C=y && MACH_MX35_3DS
-	help
-	  Select this to enable the MC9S08DZ60 GPIO driver
-
 config GPIO_PCA953X
 	tristate "PCA95[357]x, PCA9698, TCA64xx, and MAX7310 I/O ports"
 	select REGMAP_I2C
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 32a32659866a..7856222ae855 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -92,7 +92,6 @@ obj-$(CONFIG_GPIO_MAX77620)		+= gpio-max77620.o
 obj-$(CONFIG_GPIO_MAX77650)		+= gpio-max77650.o
 obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
-obj-$(CONFIG_GPIO_MC9S08DZ60)		+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
 obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
 obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08dz60.c
deleted file mode 100644
index a9f17cebd5ed..000000000000
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ /dev/null
@@ -1,112 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2009-2012 Freescale Semiconductor, Inc. All Rights Reserved.
- *
- * Author: Wu Guoxing <b39297@freescale.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/i2c.h>
-#include <linux/gpio/driver.h>
-
-#define GPIO_GROUP_NUM 2
-#define GPIO_NUM_PER_GROUP 8
-#define GPIO_NUM (GPIO_GROUP_NUM*GPIO_NUM_PER_GROUP)
-
-struct mc9s08dz60 {
-	struct i2c_client *client;
-	struct gpio_chip chip;
-};
-
-static void mc9s_gpio_to_reg_and_bit(int offset, u8 *reg, u8 *bit)
-{
-	*reg = 0x20 + offset / GPIO_NUM_PER_GROUP;
-	*bit = offset % GPIO_NUM_PER_GROUP;
-}
-
-static int mc9s08dz60_get_value(struct gpio_chip *gc, unsigned offset)
-{
-	u8 reg, bit;
-	s32 value;
-	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
-
-	mc9s_gpio_to_reg_and_bit(offset, &reg, &bit);
-	value = i2c_smbus_read_byte_data(mc9s->client, reg);
-
-	return (value >= 0) ? (value >> bit) & 0x1 : 0;
-}
-
-static int mc9s08dz60_set(struct mc9s08dz60 *mc9s, unsigned offset, int val)
-{
-	u8 reg, bit;
-	s32 value;
-
-	mc9s_gpio_to_reg_and_bit(offset, &reg, &bit);
-	value = i2c_smbus_read_byte_data(mc9s->client, reg);
-	if (value >= 0) {
-		if (val)
-			value |= 1 << bit;
-		else
-			value &= ~(1 << bit);
-
-		return i2c_smbus_write_byte_data(mc9s->client, reg, value);
-	} else
-		return value;
-
-}
-
-
-static void mc9s08dz60_set_value(struct gpio_chip *gc, unsigned offset, int val)
-{
-	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
-
-	mc9s08dz60_set(mc9s, offset, val);
-}
-
-static int mc9s08dz60_direction_output(struct gpio_chip *gc,
-				       unsigned offset, int val)
-{
-	struct mc9s08dz60 *mc9s = gpiochip_get_data(gc);
-
-	return mc9s08dz60_set(mc9s, offset, val);
-}
-
-static int mc9s08dz60_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
-{
-	struct mc9s08dz60 *mc9s;
-
-	mc9s = devm_kzalloc(&client->dev, sizeof(*mc9s), GFP_KERNEL);
-	if (!mc9s)
-		return -ENOMEM;
-
-	mc9s->chip.label = client->name;
-	mc9s->chip.base = -1;
-	mc9s->chip.parent = &client->dev;
-	mc9s->chip.owner = THIS_MODULE;
-	mc9s->chip.ngpio = GPIO_NUM;
-	mc9s->chip.can_sleep = true;
-	mc9s->chip.get = mc9s08dz60_get_value;
-	mc9s->chip.set = mc9s08dz60_set_value;
-	mc9s->chip.direction_output = mc9s08dz60_direction_output;
-	mc9s->client = client;
-	i2c_set_clientdata(client, mc9s);
-
-	return devm_gpiochip_add_data(&client->dev, &mc9s->chip, mc9s);
-}
-
-static const struct i2c_device_id mc9s08dz60_id[] = {
-	{"mc9s08dz60", 0},
-	{},
-};
-
-static struct i2c_driver mc9s08dz60_i2c_driver = {
-	.driver = {
-		.name = "mc9s08dz60",
-	},
-	.probe = mc9s08dz60_probe,
-	.id_table = mc9s08dz60_id,
-};
-builtin_i2c_driver(mc9s08dz60_i2c_driver);
-- 
2.26.2


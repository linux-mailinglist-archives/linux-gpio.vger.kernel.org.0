Return-Path: <linux-gpio+bounces-28345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550BC4CA8D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6B73A0631
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 09:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC1D2F25FB;
	Tue, 11 Nov 2025 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQTtuPFH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A52ED15D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853235; cv=none; b=D4VqK7fQqOnQRULt36PgdoHPu73ba9gxklz/Os27JWRNAvGww0ScqTH9BSWHrwU/uZh5Y28tn6CG3YKUfG/dvCC2gJHbHjUfYqlgotAW60+lixd2oiEFLEHiKox2DHjWM/BNGjZkQRXeXrdgYvcSt1qSBsSxZp1e2AFb8T41I2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853235; c=relaxed/simple;
	bh=+CVBWtoEqiNso8fK0OPIIuivfGYQiY/ibNKVSUF5xCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rX2RAtmiOPA8xtZd+hAwQd99TFykQNFCikckCsYOnquLIKoUEBx4TpHJAo9R0y9zJiIysskT47RbN5Wz4yJBz1aaO8F7OuznkGGHZlkZgT68mXCVs2RxLNjyyX38OEJ1ZV2DTalKzX7Tk8Pt/Fi0QwzQnhArnAO7tnRidJ6XqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQTtuPFH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so1251252f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 01:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853232; x=1763458032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeKzbt40uI8Z6nTzEM4JNROnGsdZUz7mRBsaMfIaT7M=;
        b=XQTtuPFHcf5HZLJYqOvQ4M8VRNHt8kUsZmrMjFr1ltqFJ6QYm0fhjEfFyGLQBTNMTP
         8H1qOAX4m9R1OgTxp7ZvLb4NKp5PhN9NQoalGaa4X6gtRIokONND9xmtCwbyyvy+mNVM
         pzInDigyawMRTHKvqHhA5G0yfdARLFSD76QSJKYooEESNRVW2Fqg4OliN+e9a4agyCSx
         1l68YMesxw8GCktecGtc/OtT+DIagKFdaPJmIAY3P1k1pwxmnHxSf2koQgcm0GvFXCs3
         icQikUC8OMc0ZZ28OwsoinWRnxmJaoWztSVUNDVDe5HKbzGSJGP60wtP2kvAgtOTXr5H
         lXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853232; x=1763458032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeKzbt40uI8Z6nTzEM4JNROnGsdZUz7mRBsaMfIaT7M=;
        b=CB4o0WFiQqoJKv5QG51gLgZA1AVsWMhiTdNSK0ONLLyhXgyEz3FdPxFESKnk1d3vJd
         g5yD46QeDTb/Htl9gv7c+P35bSbfrwNxuBX2D7zi2qe7DRmWDaEoFlNVnTc9J2wnT8tw
         PpCyjKv+r09uNrD9+rN9t77rzd2Ig80r3W31ghf3D/KoGL6GuP9XepUzZ5PRr3n7VoXd
         GOAcrVHqsY/9aH823Xx5zVmu85hG0zWiOR3/2JCzHhI3NQ7jPRJf5xZU/ozJclgFHOae
         QAnn+Ps/8/IU4MgMIbSGcbltE28UFkFqIElaJH4CnuAVFjqDT5ZwOAyQ98KM/zuplQjc
         P2DQ==
X-Gm-Message-State: AOJu0Yzv1+JoaQA22c3959f1MnJpJDmV5fz/o+sVZWIZr5HEdTTwbzhX
	KOhtO8zUc44KvhkNLO5Y8CiyIwedZNZC+JSdSQSZuAGeb++Pu6cmiiiSmiJpLg==
X-Gm-Gg: ASbGncv9pO9rPSGkI66p31dwpRhWfjrFjGbo/T8SzIeuz0o/8677jnMZ9lPfrEuEKxH
	dgpgZhQ+YX8tS3uLeOP9SzuAMNmfFYNu7ucvFEQwCMNyJXzHTstQxs+uUJzUPUrVs6m3icGQ25r
	n8Z6mp5AbB8nFJzLwAx7UqXFkMDJExx7AEBw/u86GZwmvzCcnLck+YP2Arnulvi/rO8PDp0QnME
	/N+WshNtqn0DCdW57toZ41fRl+XP91LAkgCJ5V423HrigvKP1bwVdDy68kCix1YWXPa3SEGfx6G
	mtQErd/Xv4Qu1Yq3Iz4R9EWXWk/iZx1s3CQFiW8/gxhW/uB0a/E0BgBNfSrhc326dsykO6JRLUA
	3QEEuOJG67c1J9uQPm61vt0UbrtyKWtL6IQguEBXLDKLzTwusfEdU9ebKfciPuYy6uKQmNbWA9p
	A7DY5pIt433MOs/PSBpo8OL1/M
X-Google-Smtp-Source: AGHT+IE9bVtPss6xMDYZ8Z9svDX3dsWvptBxWqqb99TTrnQYZhfM/ZD1vt3P+FWQVe7WddFS7DwtxA==
X-Received: by 2002:a05:6000:3104:b0:429:ef82:585b with SMTP id ffacd0b85a97d-42b2dc16b17mr8823445f8f.9.1762853231629;
        Tue, 11 Nov 2025 01:27:11 -0800 (PST)
Received: from builder.. ([2001:9e8:f12a:4216:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67921c3sm27464641f8f.40.2025.11.11.01.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:27:11 -0800 (PST)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v6 2/2] gpio: add gpio-line-mux driver
Date: Tue, 11 Nov 2025 09:27:04 +0000
Message-ID: <20251111092705.196465-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251111092705.196465-1-jelonek.jonas@gmail.com>
References: <20251111092705.196465-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new driver which provides a 1-to-many mapping for a single real
GPIO using a multiplexer. Each virtual GPIO corresponds to a multiplexer
state which, if set for the multiplexer, connects the real GPIO to the
corresponding virtual GPIO.

This can help in various usecases. One practical case is the special
hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
features two SFP+ ports/cages whose signals are wired directly to the
switch SoC. Although Realtek SoCs are short on GPIOs, there are usually
enough the fit the SFP signals without any hacks.

However, Zyxel did some weird design and connected RX_LOS, MOD_ABS and
TX_FAULT of one SFP cage onto a single GPIO line controlled by a
multiplexer (the same for the other SFP cage). The single multiplexer
controls the lines for both SFP and depending on the state, the
designated 'signal GPIO lines' are connected to one of the three SFP
signals.

Because the SFP core/driver doesn't support multiplexer but needs single
GPIOs for each of the signals, this driver fills the gap between both.
It registers a gpio_chip, provides multiple virtual GPIOs and sets the
backing multiplexer accordingly.

Due to several practical issues, this is input-only and doesn't support
IRQs.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                  |   6 ++
 drivers/gpio/Kconfig         |   9 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-line-mux.c | 126 +++++++++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 drivers/gpio/gpio-line-mux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b..66f8706d9b4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10653,6 +10653,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.yaml
 F:	drivers/media/rc/gpio-ir-tx.c
 
+GPIO LINE MUX
+M:	Jonas Jelonek <jelonek.jonas@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
+F:	drivers/gpio/gpio-line-mux.c
+
 GPIO MOCKUP DRIVER
 M:	Bamvor Jian Zhang <bamv2005@gmail.com>
 L:	linux-gpio@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ce237398fa00..5f8082ae99cc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1986,6 +1986,15 @@ config GPIO_LATCH
 	  Say yes here to enable a driver for GPIO multiplexers based on latches
 	  connected to other GPIOs.
 
+config GPIO_LINE_MUX
+	tristate "GPIO line mux driver"
+	depends on OF_GPIO
+	select MULTIPLEXER
+	help
+	  Say Y here to support the GPIO line mux, which can provide virtual
+	  GPIOs backed by a shared real GPIO and a multiplexer in a 1-to-many
+	  fashion.
+
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver (DEPRECATED)"
 	select IRQ_SIM
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ee260a0809d3..6caee52b0356 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
 obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
+obj-$(CONFIG_GPIO_LINE_MUX)		+= gpio-line-mux.o
 obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
 obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
new file mode 100644
index 000000000000..a4f384306218
--- /dev/null
+++ b/drivers/gpio/gpio-line-mux.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO line mux which acts as virtual gpiochip and provides a 1-to-many
+ * mapping between virtual GPIOs and a real GPIO + multiplexer.
+ *
+ * Copyright (c) 2025 Jonas Jelonek <jelonek.jonas@gmail.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/mux/consumer.h>
+#include <linux/platform_device.h>
+
+#define MUX_SELECT_DELAY_US	100
+
+struct gpio_lmux {
+	struct gpio_chip gc;
+	struct mux_control *mux;
+	struct gpio_desc *muxed_gpio;
+
+	u32 num_gpio_mux_states;
+	unsigned int gpio_mux_states[] __counted_by(num_gpio_mux_states);
+};
+
+static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_lmux *glm = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset > gc->ngpio)
+		return -EINVAL;
+
+	ret = mux_control_select_delay(glm->mux, glm->gpio_mux_states[offset],
+				       MUX_SELECT_DELAY_US);
+	if (ret < 0)
+		return ret;
+
+	ret = gpiod_get_raw_value_cansleep(glm->muxed_gpio);
+	mux_control_deselect(glm->mux);
+	return ret;
+}
+
+static int gpio_lmux_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	return -EOPNOTSUPP;
+}
+
+static int gpio_lmux_gpio_get_direction(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int gpio_lmux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_lmux *glm;
+	unsigned int ngpio;
+	size_t size;
+	int ret;
+
+	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
+	if (!ngpio)
+		return -EINVAL;
+
+	size = struct_size(glm, gpio_mux_states, ngpio);
+	glm = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!glm)
+		return -ENOMEM;
+
+	glm->gc.base = -1;
+	glm->gc.can_sleep = true;
+	glm->gc.fwnode = dev_fwnode(dev);
+	glm->gc.label = dev_name(dev);
+	glm->gc.ngpio = ngpio;
+	glm->gc.owner = THIS_MODULE;
+	glm->gc.parent = dev;
+
+	glm->gc.get = gpio_lmux_gpio_get;
+	glm->gc.set = gpio_lmux_gpio_set;
+	glm->gc.get_direction = gpio_lmux_gpio_get_direction;
+
+	glm->mux = devm_mux_control_get(dev, NULL);
+	if (IS_ERR(glm->mux))
+		return dev_err_probe(dev, PTR_ERR(glm->mux),
+				     "could not get mux controller\n");
+
+	glm->muxed_gpio = devm_gpiod_get(dev, "muxed", GPIOD_IN);
+	if (IS_ERR(glm->muxed_gpio))
+		return dev_err_probe(dev, PTR_ERR(glm->muxed_gpio),
+				     "could not get muxed-gpio\n");
+
+	glm->num_gpio_mux_states = ngpio;
+	ret = device_property_read_u32_array(dev, "gpio-line-mux-states",
+					     &glm->gpio_mux_states[0], ngpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not get mux states\n");
+
+	ret = devm_gpiochip_add_data(dev, &glm->gc, glm);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add gpiochip\n");
+
+	return 0;
+}
+
+static const struct of_device_id gpio_lmux_of_match[] = {
+	{ .compatible = "gpio-line-mux" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpio_lmux_of_match);
+
+static struct platform_driver gpio_lmux_driver = {
+	.driver = {
+		.name = "gpio-line-mux",
+		.of_match_table = gpio_lmux_of_match,
+	},
+	.probe = gpio_lmux_probe,
+};
+module_platform_driver(gpio_lmux_driver);
+
+MODULE_AUTHOR("Jonas Jelonek <jelonek.jonas@gmail.com>");
+MODULE_DESCRIPTION("GPIO line mux driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1



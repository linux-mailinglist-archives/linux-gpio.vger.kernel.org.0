Return-Path: <linux-gpio+bounces-28139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DCC36C0C
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 17:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 039451889C2D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 16:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C749F338925;
	Wed,  5 Nov 2025 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Twym7phR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6381C33555B
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762360596; cv=none; b=FnYBJVGBOwIULYY5cxg8yKSZqRdHqcybMyUVJr6ReXC2LG0iG0XnpKVedMypLcsc/5phgpFQim+Gk/Czaz6Pc9RgHnFXwiRs9hG2ONZg//K+cSg/49XiIb5K4XhkOnluR0HV+0Xq5MMnfNUXuhdDkW87nNs2qTSNLxDWGZnu9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762360596; c=relaxed/simple;
	bh=9RCWFgV8YzhCnpeOlLj3YVQz/zfWGLHE0Nj3mulG4Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfXl78Aj52tlZusGO7X5epqDufT62zkjh7aktmCdCt5PWZVL4kP5iTmw1inWiUfXH7CkHPGCq0/WbLKJcZZufn/kQ2BXggOjdm1/suol38VPm6sZ3Nl1+my1c/yyLSHAcDXkqPh9HVzoagLBIWoaYT7hm79/yBzm7rMzKpkAEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Twym7phR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477442b1de0so27296805e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762360593; x=1762965393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCrpvEixwPU/7I8thg10WVb0CMZHiX7z+jEPCHMkfGA=;
        b=Twym7phRMjjhfhJN47kxvk7MiMY9tnlp59/pamnIDBsOLE+VPiOop4uUaclQKmjRum
         uCVTFWR9gLwN0TzBAYB2r+2u25Ibkk9MkmpG1pCikyxk3VYfafa2oo3BQ9YrBdTmZnup
         YvlHMZo+HwChj/IPhCzAw4lLh5iyng+z+8kz+DI5SYz9Ri4jcuUC03Nf7uRb98ClFwZT
         bnWz8rSBjT33YpChViJAxcxkPQeZzV6gFv/FqFGMachpW872RpK+AhQk4FmvLqx5wfe+
         rRf+laFiiZICYry4/qx34qj21SncTGn0rYysMWVM/rrXF7NT6ghYeGJ8/9X08TYcVtuJ
         MUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360593; x=1762965393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCrpvEixwPU/7I8thg10WVb0CMZHiX7z+jEPCHMkfGA=;
        b=ObNbi3ANVMIZu4uF953rBwo6BhLI17kVMnWFSBlAcP1BMn9Dn3LvAhvCbqiwapYsG4
         zJjl/45/+NrU9oeZ3o8nGYnXNnknXVlkhekNTC1Q0VfBxgARUHiza42ZP05DIn07X3fv
         K7Y6jVfQtYRweTqH+pJqztA/F/vDrjCpH1pviGBrAaMfFurIi874wvrlxZEaj/tujDFH
         6ZyAZl6nd9CfMwIzQK35Ft2azOXZJNJL5A6bAVC8rpMA1zaBXQPiZzwhgbnaC/IXs49v
         kGHy1MxITad8EmvzMqcEj8ZvZold367lWJkSNVO0zkcSZYHYm7PhDwv+LmNNjDFCv6A6
         0oZg==
X-Gm-Message-State: AOJu0YyI7Wl5e9UJgNsqxmNPpTRnJXtT2Pb82/y0ktwM1ba068Qs18M1
	nOfq7Qnr0S7ER437ms1Ur3Ylyi5tv3yh+n0lrnq4vx485RQoieC8WaNV
X-Gm-Gg: ASbGncsjsMYK+ebo3ukjazQh5AVRyRBhWBSnJnm7sJMc88GhgnN150+Y8K2MI9eW5Sq
	FLNgntzHGGrL50LCrE+caJMnp/z8AbdNOB0OJQf2wEkiRhx70eNMpcpYORUVh2k5l1jBfJoVjGA
	JRpQB7wjGJQXt6FvaTDpcuH6ZtByHyBVrCXoUuB5GnAx3QKCQynCPu48a5G8Z/rJe6la/YLRSI2
	oQabeYE6pfu4ioBCS9OQsl1aQJP1Ei006TC4qftSg8kK/pN8XkAq7qSvwCeZTd4d7Ez4d1tkZjH
	zDJjwKDvSh2yHblnczCiiuQuEyBCziPSXXfnDNFZMMaQnSb/pEz0yw+bB8fPF8z8HdPqFx6nu5p
	PNCshJTUC91GFL11k3iO4hKczQNlfxOajG6cH9vIpc3S5s2/06wikmoBh/38cFH8+CRwGcg86MT
	dCb+A=
X-Google-Smtp-Source: AGHT+IG9JVmRhKhhb44eZWxi+cC2+DGCg1vxgGdbrQszkdRQqMHnDOHIs7ZSWb2MCTkhlL7SrZPGiQ==
X-Received: by 2002:a05:600c:a12:b0:477:5b0a:e61a with SMTP id 5b1f17b1804b1-4775cdad61cmr30972835e9.1.1762360592572;
        Wed, 05 Nov 2025 08:36:32 -0800 (PST)
Received: from builder.. ([2001:9e8:f106:5b16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce3ef38sm57026755e9.17.2025.11.05.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:36:32 -0800 (PST)
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
Subject: [PATCH v5 2/2] gpio: add gpio-line-mux driver
Date: Wed,  5 Nov 2025 16:36:10 +0000
Message-ID: <20251105163610.610793-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251105163610.610793-1-jelonek.jonas@gmail.com>
References: <20251105163610.610793-1-jelonek.jonas@gmail.com>
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
---
 MAINTAINERS                  |   6 ++
 drivers/gpio/Kconfig         |   9 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-line-mux.c | 125 +++++++++++++++++++++++++++++++++++
 4 files changed, 141 insertions(+)
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
index 000000000000..759f7880e000
--- /dev/null
+++ b/drivers/gpio/gpio-line-mux.c
@@ -0,0 +1,125 @@
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
+
+	struct gpio_desc *muxed_gpio;
+	/* dynamically sized, must be last */
+	unsigned int gpio_mux_states[];
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



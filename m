Return-Path: <linux-gpio+bounces-26957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D31FABCB1BE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 00:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2C03BB42E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 22:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED6C28726D;
	Thu,  9 Oct 2025 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwHo41s4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32D28689A
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760049323; cv=none; b=biBanK/SKyZFgBgzdTsx9GS9v7+dzmbLmMWrDvWs4i+063AYZTRnMjORGaInDrJI+qGHLZ7LeOfMRPlUX97rq1V9BDOfL4UzCQwQvqTbRITfVnFllglGlou34rVW2VVAJAezTTIus0WKTWbOGnpoyA7oNAAnDuhTg+j+UMMgw6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760049323; c=relaxed/simple;
	bh=PiqFJX7DaQjelivbGJ1zkt3d8F0vNnikrdG+r1OY1/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aATumE6oZFr1llybUZI/Jw+dyOl/3eLACz/lA7WsBEwwvAa8TNVa0CDh9w3QyNkbE5ryf3BeXIpXOhr3fpvvWZWqDIqB4ccutnUjfRjWAIFjTo7v391IQkPxGq6MhwV6a8SoFQeKpaEWWOpUjR0gPPxZymPqiEOjA8/KcXJm/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwHo41s4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so269106166b.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 15:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760049319; x=1760654119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOyZxlvZUezvZb4UBJSZAR11hnNz49iBIAa7TvCXQCI=;
        b=HwHo41s4xilmqNXVQDwdBBsVN43WCmEZaW0QBBf9Mjq6lbPq2QnUixXnyXYSNvryMJ
         gcCwsT82YI8uV+oELEbPIO74dRgpILXj9WMePX4pE5ad4h0cELG7me2w0ut6qloH+Vw/
         MO1CeTZ6P1IAIUBROgkP+vE1ksf5FrWU57GUTzxJNIss9myWYTrgHcFfm5JPkqBrM91Z
         STBvMDkDwJ6jpB77wwN1ZL3eT07uIzuj11Re7e80u0tTqLlEtUsqw83PiKtyWxxKRclx
         Y8Lr/dPGDe0ZlS5SN/2EGBuvEKrbqAwdTA7yyNT9/QkkMUDfK3QXY4rrrbf8cb6R44X8
         nDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760049319; x=1760654119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOyZxlvZUezvZb4UBJSZAR11hnNz49iBIAa7TvCXQCI=;
        b=gGMxuQfCwnECDasAgL1tRhZu8D8Ryhp95Krz66/MxBIdYzm6mC6QwvXGsmBriHgkbU
         hE9lBBZZ83GTgvMquy9Tn+p7LronW7olS3Akp9Fe1UOkyCQvDLF6AF2vEOl65T2HqaOQ
         wbuB6989njlyQUHS2Vqaozqs04PkiNIgjiOyuYjmYkzNrPlABYJBOkt8brhBLcuYQ2E2
         5W9z1aBdLeyKT76qfSosUm1yOD1NuLTQxiTTFcjTSXd/2Wk5TB3yoBPFfkXa02v9dEwU
         yfqvmKJt+RUIBaraSe5S1WIBKMmb4qrkzgCTC3nfpJ63G3dz/Osq3slkvPTTwlTJ/gYF
         NfBQ==
X-Gm-Message-State: AOJu0Yyp1p9TKsxLQZ60D2XB/k1eP8z7+X4q+yiLOTb2AEchBVNVGW/T
	mo03QaxopvU3Kc8ZYGvC2c9rqXnFagePU/Il8mvu0faIpuFYzrMLd8uTK2OkzQ==
X-Gm-Gg: ASbGnct8hXNSz+1drtJ0BOXHz7lYRkmbNZGEWuoAV5EiFti9OO5MgicOJzht0RlpXBi
	riQCmWhqe7mWQDFGLNhmqsQdp3lzW+g133/eoSopoSiAaloEsYBFErY1o6Qhg47yKtx6yzNl4fR
	srzlx1qNXo4lh4nRw0EYVYdch6sfEhEjp6FIbVGQH7M9ymP5BtHcYF888Em2BDAq1Yg9Ppsou3O
	6ipCoPyqA+sHUUXx8ymrwQob4VUdQn5uP4RwGaaBtIGgBCqqECpT6vNmjtSXwNVrII9OF3BTSSU
	2hg6pPUyUxjG8BSdFkyvBiLiyPuu2z8oNozIi/vdM5xIJoCblL8sw3Vp2icteYFxZDPUl9xj3+K
	TOBJdgc/iJSR0olCGB3vsnMsa+wHBpoPz397AEGWvJOADjp+AVA==
X-Google-Smtp-Source: AGHT+IHpvdQ3Lze478kQb743ESJRaIFc+pf9zKNzzGA7lcUz5m44CBD9OWwEjiGXY+Gi37Oo35E6PQ==
X-Received: by 2002:a17:907:26c8:b0:b3f:ccac:af38 with SMTP id a640c23a62f3a-b50ac1cc387mr1058532666b.30.1760049319056;
        Thu, 09 Oct 2025 15:35:19 -0700 (PDT)
Received: from builder.. ([2001:9e8:f121:c116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad80bsm74383766b.16.2025.10.09.15.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:35:18 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [RFC PATCH v1 2/2] gpio: add gpio-split driver
Date: Thu,  9 Oct 2025 22:35:01 +0000
Message-ID: <20251009223501.570949-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251009223501.570949-1-jelonek.jonas@gmail.com>
References: <20251009223501.570949-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new driver which allows to split a physical GPIO into multiple
virtual GPIOs by using a multiplexer.

For now, this doesn't support advanced features like IRQs, just normal
IN and OUT functionality of GPIOs.

This can help in various usecases. One practical case is the special
hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
features two SFP+ ports/cages whose signals are wired to directly to the
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

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 MAINTAINERS               |   6 ++
 drivers/gpio/Kconfig      |   8 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-split.c | 210 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 drivers/gpio/gpio-split.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 681fbc825805..efb7e4a338e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10479,6 +10479,12 @@ F:	Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 F:	drivers/gpio/gpio-sloppy-logic-analyzer.c
 F:	tools/gpio/gpio-sloppy-logic-analyzer.sh
 
+GPIO SPLIT
+M:	Jonas Jelonek <jelonek.jonas@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/gpio-split.yaml
+F:	drivers/gpio/gpio-split.c
+
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 867d82b5ed63..9209bc78bd53 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1988,6 +1988,14 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+config GPIO_SPLIT
+	tristate "GPIO split driver"
+	depends on OF_GPIO
+	select MULTIPLEXER
+	help
+	  Say Y here to support splitting physical GPIOs into multiple virtual
+	  GPIOs using a multiplexer.
+
 config GPIO_VIRTIO
 	tristate "VirtIO GPIO support"
 	depends on VIRTIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 000fa2e397c2..813eb676e5fb 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -167,6 +167,7 @@ obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
+obj-$(CONFIG_GPIO_SPLIT)		+= gpio-split.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
 obj-$(CONFIG_GPIO_STP_XWAY)		+= gpio-stp-xway.o
diff --git a/drivers/gpio/gpio-split.c b/drivers/gpio/gpio-split.c
new file mode 100644
index 000000000000..78da8bf91a0f
--- /dev/null
+++ b/drivers/gpio/gpio-split.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO splitter acting as virtual gpiochip which "splits" a physical GPIO into
+ * multiple using a multiplexer (e.g. SFP signals RX_LOS, TX_FAULT, MOD_DEF0
+ * muxed on a single GPIO).
+ *
+ * Copyright (c) 2025 Jonas Jelonek <jelonek.jonas@gmail.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/mux/consumer.h>
+#include <linux/mux/driver.h>
+#include <linux/platform_device.h>
+
+
+struct gpio_split_gpio {
+	unsigned int mux_state;
+};
+
+struct gpio_split {
+	struct gpio_chip gc;
+	struct mux_control *mux;
+	struct device *dev;
+
+	struct mutex lock;
+
+	struct gpio_desc *shared_gpio;
+	/* dynamically sized, must be last */
+	struct gpio_split_gpio gpios[];
+};
+
+DEFINE_GUARD(gpio_split, struct gpio_split *, mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
+
+static int gpio_split_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_split *gs = (struct gpio_split *)gpiochip_get_data(gc);
+	struct gpio_split_gpio *gs_gpio;
+	int ret;
+
+	if (offset > gc->ngpio)
+		return -EINVAL;
+
+	guard(gpio_split)(gs);
+
+	gs_gpio = &gs->gpios[offset];
+	ret = mux_control_select(gs->mux, gs_gpio->mux_state);
+	if (ret < 0)
+		return ret;
+
+	ret = gpiod_get_raw_value_cansleep(gs->shared_gpio);
+	mux_control_deselect(gs->mux);
+	return ret;
+}
+
+static void gpio_split_gpio_set(struct gpio_chip *gc, unsigned int offset,
+				int value)
+{
+	struct gpio_split *gs = (struct gpio_split *)gpiochip_get_data(gc);
+	struct gpio_split_gpio *gs_gpio;
+	int ret;
+
+	if (offset > gc->ngpio)
+		return;
+
+	guard(gpio_split)(gs);
+
+	gs_gpio = &gs->gpios[offset];
+	ret = mux_control_select(gs->mux, gs_gpio->mux_state);
+	if (ret < 0)
+		return;
+
+	gpiod_set_raw_value_cansleep(gs->shared_gpio, value);
+	mux_control_deselect(gs->mux);
+}
+
+static int gpio_split_gpio_get_direction(struct gpio_chip *gc,
+					 unsigned int offset)
+{
+	struct gpio_split *gs = (struct gpio_split *)gpiochip_get_data(gc);
+
+	if (offset > gc->ngpio)
+		return -EINVAL;
+
+	guard(gpio_split)(gs);
+
+	return gpiod_get_direction(gs->shared_gpio);
+}
+
+static int gpio_split_gpio_direction_input(struct gpio_chip *gc,
+					   unsigned int offset)
+{
+	struct gpio_split *gs = (struct gpio_split *)gpiochip_get_data(gc);
+
+	if (offset > gc->ngpio)
+		return -EINVAL;
+
+	guard(gpio_split)(gs);
+
+	return gpiod_direction_input(gs->shared_gpio);
+}
+
+static int gpio_split_gpio_direction_output(struct gpio_chip *gc,
+					    unsigned int offset, int value)
+{
+	struct gpio_split *gs = (struct gpio_split *)gpiochip_get_data(gc);
+
+	if (offset > gc->ngpio)
+		return -EINVAL;
+
+	guard(gpio_split)(gs);
+
+	return gpiod_direction_output_raw(gs->shared_gpio, value);
+}
+
+static const struct of_device_id gpio_split_of_match[] = {
+	{ .compatible = "gpio-split" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpio_split_of_match);
+
+static int gpio_split_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_split *gs;
+	struct fwnode_handle *child;
+	unsigned int ngpio, size, i;
+	int ret;
+
+	ngpio = device_get_child_node_count(dev);
+	size = sizeof(*gs) + (sizeof(struct gpio_split_gpio) * ngpio);
+
+	gs = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!gs)
+		return -ENOMEM;
+
+	mutex_init(&gs->lock);
+
+	gs->dev = dev;
+	gs->gc.base = -1;
+	gs->gc.can_sleep = true;
+	gs->gc.fwnode = dev_fwnode(dev);
+	gs->gc.label = "gpio-split";
+	gs->gc.ngpio = ngpio;
+	gs->gc.owner = THIS_MODULE;
+	gs->gc.parent = dev;
+
+	gs->gc.get = gpio_split_gpio_get;
+	gs->gc.set = gpio_split_gpio_set;
+	gs->gc.get_direction = gpio_split_gpio_get_direction;
+	gs->gc.direction_input = gpio_split_gpio_direction_input;
+	gs->gc.direction_output = gpio_split_gpio_direction_output;
+
+	gs->mux = devm_mux_control_get(dev, NULL);
+	if (IS_ERR(gs->mux)) {
+		if (PTR_ERR(gs->mux) == -EPROBE_DEFER) {
+			dev_err(dev, "mux-controller not ready, deferring probe\n");
+			return -EPROBE_DEFER;
+		}
+
+		dev_err(dev, "could not get mux-controller\n");
+		return PTR_ERR(gs->mux);
+	}
+
+	gs->shared_gpio = devm_gpiod_get(dev, "shared", GPIOD_ASIS);
+	if (IS_ERR(gs->shared_gpio)) {
+		dev_err(dev, "could not get shared-gpio\n");
+		return PTR_ERR(gs->shared_gpio);
+	}
+
+	i = 0;
+	device_for_each_child_node(dev, child) {
+		struct gpio_split_gpio *gpio = &gs->gpios[i];
+		u32 mux_state;
+
+		ret = fwnode_property_read_u32(child, "mux-state", &mux_state);
+		if (ret) {
+			dev_err(dev, "gpio %u: failed to read mux-state\n", i);
+			return ret;
+		}
+
+		gpio->mux_state = (unsigned int)mux_state;
+		i++;
+	}
+
+	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	if (ret) {
+		dev_err(dev, "failed to add gpiochip: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(dev, "providing %u virtual GPIOs for real GPIO %u\n", i,
+		 desc_to_gpio(gs->shared_gpio));
+	return 0;
+}
+
+static struct platform_driver gpio_split_driver = {
+	.driver = {
+		.name = "gpio-split",
+		.of_match_table = gpio_split_of_match,
+	},
+	.probe = gpio_split_probe,
+};
+module_platform_driver(gpio_split_driver);
+
+MODULE_AUTHOR("Jonas Jelonek <jelonek.jonas@gmail.com>");
+MODULE_DESCRIPTION("GPIO split driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1



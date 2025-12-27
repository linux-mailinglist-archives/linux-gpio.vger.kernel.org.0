Return-Path: <linux-gpio+bounces-29952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D78CE00C5
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 19:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D5463028FDB
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 18:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD597326D4C;
	Sat, 27 Dec 2025 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0jzYcGK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D320FAA4
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858507; cv=none; b=gpw1J+pq2tsDMS5JKcLHYr/V+rhT7Z7JaZa/FRgsquD58BTbRxF4sutlJwv4QSF13r5LtBfH4i9gwR2ySgocVJVzQeQQJPfAtAu25aawYtSysGhRqg3aW5hsOcw5zLgtbARN5vqfO/l6XRdqvGRkaUVTyufaaCigf4nzcTq4ctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858507; c=relaxed/simple;
	bh=e8YVyW49DbFA1obivdBn8/Pnhvbl84qe6o+D/PBtoO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzjqHUBEaiLew4y8vzkSTsViLvgqw3Jg42nBnNce6ULht6TUl+it7qZ5m515qD9/KiNyDscDg8pWKxk1Pv1UiK7UsQH3EdWKteT9bDi4OMwV7vSZmjEQdPxW+smeOWqxkSzL4qoxW6CaM7BWwU5WvkvlhxlvSvjsNVsfUDhRv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0jzYcGK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1631859666b.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858503; x=1767463303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTALi2qrQQaNiy7RTP6OBTzsPFHWxY/VKluyG/WXiPQ=;
        b=H0jzYcGKiQLVoe/KVz063EstGwqVDyRhv/ROFadORH1vQtqNx+Ewr/8LuG5M6PRH3y
         jAps5auXwfvOGvzFR38heBUaO8W0qxYkvyF/8jEYt8ORJa/Mx0/+mfFp/mdB3jk5zsJR
         Ko/Qab0mpw3iSHrCxXxm8GXqmYFf5JMo+KRLBSIRrcfakFf9+W9VF0h7Flqh/CR31+OS
         GdcTKz9Ae8GDjkP62VnT1vBlyO0OiIiwSvCM7ankJlsVfbHqSIABgBGqK8qsaCeWm6XU
         k8iGvZB4OLIykn5H0ESMr8IDXED2Yt4NNT9fU2lXSlwcMqM8bUxtwrK1QoyTPl6dIVGk
         +ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858503; x=1767463303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTALi2qrQQaNiy7RTP6OBTzsPFHWxY/VKluyG/WXiPQ=;
        b=hJNMfgjJkPJF7tOCjDFTu7IuF2K9YJyzH39N+b6s+SpuhOs0x0ij+6Qfh9/SZLdSfM
         ZspVxJX6XuCHxO29OA9ZyfYLphpMWsHbInJSU5WyPri9ewW31KFuX7Omd4EpDiYrvUo0
         jvYataYP+PJj1EYgIgcEEUwjIlal+3MLrY1Wdw4QHrICx7ClIY2vhxbDfTG48tJfl1Hc
         L57GNX2YSNUF3tamvU0zdZkiFVVR7JeJdmhZeT5pZJetqWjqErbyt4Gnm/li/SZzTANb
         DBSOot+zJ6WRY0qtVRtHxqBJoWaP3+MTEH92Kng/665VU8CTXD2JOKlh2OvBWC4nm9DK
         FJmg==
X-Gm-Message-State: AOJu0YyXK+m8VlN0oeStY5r/a9iIa63eYtOkk1kmRSK8acx7cYjYNuzF
	oqjOZyr+q86hBeD8YhpDM8tp/cCM+gxmTddbfSMUsLz7mienNuY8ipgM
X-Gm-Gg: AY/fxX736gS6pKX6JybbaQ/sonO438Iz3Hqfa8ZQ0GPy4e1SLv5muZiTlraw52HWcdF
	goUNscaVtzrIA/abnluZ8hvSHdaxO6vLMB2yFkgWHrpM1CcnjCwg++aNwqSDuDd1mFpwb5TioNJ
	q8/ohlvic2h7SPeZDqmh9zt/5EyzOlE6T+gYvHuSlE7ZScl2VTpWG003crZ2vGSugGqYqgPETuq
	zWZ6u/UKvIbR7IaNZUZ1pIww2CWI4Mss9Hm+zrvzdFNapmbmv2MskZztyqCeBD8qEdpVn9VXN7O
	aBUVIy9s5Xu4nJyMLET2rIQwp3+4NUzy/hvJhLEqe/W1YHOkBQPyHdA5FFTOTpX2480nW5DcxVP
	URtSRs6nPV/BAm+pVu4nmaGfRqaGsSrANkY3novaAF03x1c4Sdqjz0p8qNJ/ahWrv3VP+MI0G+B
	FosLmQgzbVa0JdEHc=
X-Google-Smtp-Source: AGHT+IFiQda7vyrnxfvivqvCgO4e6qjL6oqGwmGim+3hpMHkIza8dH5snrsL7yqxi5m6n45jfh3bMQ==
X-Received: by 2002:a17:907:9719:b0:b80:f4d:4aba with SMTP id a640c23a62f3a-b80371d6999mr2746322966b.47.1766858503444;
        Sat, 27 Dec 2025 10:01:43 -0800 (PST)
Received: from builder.. ([2001:9e8:f10d:7316:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm2794835666b.41.2025.12.27.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 10:01:43 -0800 (PST)
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
Subject: [PATCH v7 2/2] gpio: add gpio-line-mux driver
Date: Sat, 27 Dec 2025 18:01:34 +0000
Message-ID: <20251227180134.1262138-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
References: <20251227180134.1262138-1-jelonek.jonas@gmail.com>
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
index 5b11839cba9d..8056ef0ffbf0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10774,6 +10774,12 @@ S:	Maintained
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
index c33f9305ab97..2efa58f10781 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1994,6 +1994,15 @@ config GPIO_LATCH
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
index 2421a8fd3733..36fa7c52d240 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
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



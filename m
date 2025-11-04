Return-Path: <linux-gpio+bounces-28047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6150C32FF7
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893B618C3C0B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8BB2FC00C;
	Tue,  4 Nov 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo1mnkhe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9522DF137
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762290035; cv=none; b=r9KQNkOrTzszcQZdfxHa+fe168KLbWZhnc64e8qKHniwuUwyFDjes6ydyFlLC0Hq63XE6yjWPCOwA+tq2NT5o4JoWR9nBHFbDg0rBPuGwYOiUWGFe5SI+HjUxILDPhTo+lxr8ikUFM+028AlgF3KHlZGO6GvbD4c+ocB00pJcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762290035; c=relaxed/simple;
	bh=GskfKVaPLqQ/vCmRCVQyHxD0lSp9G/moBVGUDvRGe0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOzzbSKem5p12vLZvLSCg1qhAv/krtuJVGU5bPpWlfj4jk1HkRoLKqvp7zOhT0wzS8ENx8eJtQ+teq9qh9JMnvB21uEcUqpD+YGB846myzQdcLu+TqTiM7/4pyc5Ja+rMJgGSbdfRpGKGxqajeX8YlKSMWxuf5ddqyMuxuWxnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fo1mnkhe; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so10354968a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Nov 2025 13:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762290031; x=1762894831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Z3otzeim6Fx/klRMW+iz5WyDhYisYpULPID5Kk4CcY=;
        b=Fo1mnkheEz8F9UVbkH+mwlNwhw+UrWrUsRuUgMlgm6aMO2fQ1OGue1xuYTNSE6SgwG
         r7jonZ8+KwIcwgswSKC3/rmOmJ8GykunIB9T6FXDjpXqxSWaBIBDc+lDEMd7O5R/E6p7
         rqsNQwi+GwAjLrgghV8e2tY+DmdhtLMk3Ypyztu1snHlaFcjUA6s6ll7KHmmDQKhlIBl
         TKASx90m9ZAXcgYDx5h/KS94+Y/sN56inTpJrYCjxe/A23fzJOQ/Yls71XHGKbwOtrS0
         fiQHLDPOuHFPdGlchwhJonLzdpMZKHwAStvnLbpoLTO71AC3ZZQP1GEmmCAmHt3mvSL0
         iwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762290031; x=1762894831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Z3otzeim6Fx/klRMW+iz5WyDhYisYpULPID5Kk4CcY=;
        b=IVMdTSU34jv4yyFRxkxtlJzYPecMLAXcxVGQBRGO1jpKFurmrsK5kmXtJOodGdMbhu
         GLtFrB/vQwO2bGPkx18wCfLndP6RJUSgMdFHDeZBCVgy/RAp/XSycH6lH3SFUzyc1ILb
         FubijarAqqUuVmKS1HD1dSMpiAWP/uNdPw7AJScoXKJ5zCSqT5QI5L81mUoAGDi947cy
         /p5LGS3jTbWHcBGH6tj8+z880Qa8sPaWHUcXBY5TdjllinZsvClaAR9F16thbjX0LGXK
         mSchjwh4YBVY6wK5lWV4oC5dm97F+eElsjzYGr5ChcbpTpDDjboxWpjefoBpgU7+wl/v
         kpAQ==
X-Gm-Message-State: AOJu0YzbSLBZwRV1prrHADoFMlN8yJcpo9Y1QuqBRdmg8hQa51LxJUxk
	9jRB2sV6Frf29jjGYGXKJeueLipodkbg5zciVIFjzXanq9S6rPFE+T6T
X-Gm-Gg: ASbGnctR6FLsODM/QUiL2SRsVvQAfAwGTn5UTF9NX/aZi4JpVKZCy+5c8G4EWgtVQlB
	hbwJRCnTSKVIBCgAQzVqyk0FWdjv4XWPwl14IPoNvsFX5SrIOljEycbxziR04HGEXUsuZJiIRZ1
	vJoVDKkRFJX0lUk7hGdX0eo7FRDeFLI+VCOoQU2vcsuN+0vVDPCasDZM9vPtYPheifux65eI2e2
	p+pEwLILuODw5IG+BUd1EMCMsfHj5FSrAaNyHTEu4jJ6UNR21EaRDRz1fXNUu5vKlu3Ac25RW6A
	N7ctVVJuY9qLSiGXSXwzJaA+lGApXvPhd/YCSGFqghJNFTD1nEXOye0mhHtcvt3dV1pVl1x3ql5
	7ioIB4K4v2OARQ5QkK20XhaH/S4n3plNqOuDN4FoJOnyCPWzGL5twtEs/0xiIkW7KmQuFpNCq5t
	uA09nyCy9LZKyCIw==
X-Google-Smtp-Source: AGHT+IH5nziiExB9aZmDZ+ym3aHM5MBr8CbYq4Ikkfou+I40LHj7J5IwIjAsXB09UiDpcCtUSu4GiA==
X-Received: by 2002:a05:6402:13cb:b0:640:9ce9:a8e6 with SMTP id 4fb4d7f45d1cf-641058a22c3mr527333a12.4.1762290031318;
        Tue, 04 Nov 2025 13:00:31 -0800 (PST)
Received: from builder.. ([2001:9e8:f13f:9116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a70b5bsm2990017a12.26.2025.11.04.13.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 13:00:31 -0800 (PST)
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
Subject: [PATCH v3 2/2] gpio: add gpio-line-mux driver
Date: Tue,  4 Nov 2025 21:00:21 +0000
Message-ID: <20251104210021.247476-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251104210021.247476-1-jelonek.jonas@gmail.com>
References: <20251104210021.247476-1-jelonek.jonas@gmail.com>
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

Due to several practical issues, this is input-only and doesn't support
IRQs.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 MAINTAINERS                  |   6 ++
 drivers/gpio/Kconfig         |   9 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-line-mux.c | 137 +++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+)
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
index 000000000000..3a9fe899c041
--- /dev/null
+++ b/drivers/gpio/gpio-line-mux.c
@@ -0,0 +1,137 @@
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
+#include <linux/mux/driver.h>
+#include <linux/platform_device.h>
+
+#define MUX_SELECT_DELAY_US	100
+
+struct gpio_lmux {
+	struct gpio_chip gc;
+	struct mux_control *mux;
+	struct mutex lock;
+
+	struct gpio_desc *shared_gpio;
+	/* dynamically sized, must be last */
+	unsigned int gpio_mux_states[];
+};
+
+DEFINE_GUARD(gpio_lmux, struct gpio_lmux *, mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
+
+static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_lmux *glm = (struct gpio_lmux *)gpiochip_get_data(gc);
+	int ret;
+
+	if (offset > gc->ngpio)
+		return -EINVAL;
+
+	guard(gpio_lmux)(glm);
+
+	ret = mux_control_select_delay(glm->mux, glm->gpio_mux_states[offset],
+				       MUX_SELECT_DELAY_US);
+	if (ret < 0)
+		return ret;
+
+	ret = gpiod_get_raw_value_cansleep(glm->shared_gpio);
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
+	mutex_init(&glm->lock);
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
+	glm->shared_gpio = devm_gpiod_get(dev, "shared", GPIOD_ASIS);
+	if (IS_ERR(glm->shared_gpio))
+		return dev_err_probe(dev, PTR_ERR(glm->shared_gpio),
+				     "could not get shared-gpio\n");
+
+	ret = gpiod_direction_input(glm->shared_gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not set shared gpio as input\n");
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



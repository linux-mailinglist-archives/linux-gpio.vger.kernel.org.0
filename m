Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0C932FB8E
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhCFP5t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhCFP5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:21 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26B0C06174A;
        Sat,  6 Mar 2021 07:57:20 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l22so3510474wme.1;
        Sat, 06 Mar 2021 07:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PbeROxoh9X8mgvCeLG5a09JmjgWcqAs6rQV/pAoZGRM=;
        b=E48c3pE4WxF81/ssvuDpF1Vdd4i8V+bJPA+AIwaWEoLwPJrFnS/EASHpojSVu0UcNd
         G9FYBUfi8a4aHTwoLHydFbTduOLl01RApAaptNP0+eyUHpQsg70SIdSRp++coZkJE1E2
         /zOOI0syYGRI0QYswyGMIbGMBiVSzAZLhTnY3z1Lnj5rexAOhR5N8x4QBbkmVWgaLM3w
         Meock/Z3Mj5bFwVJbVUuBH+mn1WcYNfIdAh8AK1nOYwqEPF+bfLv2MVOIVFkm7UbIniv
         aBr9Zm7L2fhAsj2DkQ7rdZcJje0Lh9lQdVDr9E0OY4mTZ234dQCYinaFdzOMhflQ1FqD
         n0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PbeROxoh9X8mgvCeLG5a09JmjgWcqAs6rQV/pAoZGRM=;
        b=tWcSpRAFNblFAacJPOjT9XVdqJgg+jYi3BmYPmZJNvVhC9T68xUGbRKRjf16AUsn7+
         DNPuXWI5FOfVMs0tpNPZjQwKhLSWvTOLj2sO+kFzTeGhFsLQYgLJg8XYBEtyuxm7pqts
         Y93I604zQwnznUVybLNqyJgHT/Qd5b32T2/6FEHkXOMLaSF+N5LrLesq3Dr2pIPRmx5i
         cvgACwYc+cqjLDJAkaiTO8VxbtYSdLF1+6S2U3mkGnYuLtSMA3DG7Eo5DVYGo7WTrFcy
         hWd8TITrGT7YJ6RJxJ7jttS5h51S/v67oCUIKRuGaprGMvyF3KHrBtVsIXI+DyxTgUNH
         Ar6A==
X-Gm-Message-State: AOAM533pM0Do7VCc89i9cETMidT3gqrM9qMNZ+LInRy7TGzvBR6Wefm9
        7qtFKc0kD0RU31Xs2KXZBu8=
X-Google-Smtp-Source: ABdhPJxNjHegJ87sMuclQYkDYwuTK6lYxkxXsVB1qnBQCSD35gvrER9xpiY+V4IK05lSfRWbvmYHPA==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr13872851wmk.102.1615046239558;
        Sat, 06 Mar 2021 07:57:19 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:19 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 07/15] pinctrl: add a pincontrol driver for BCM6358
Date:   Sat,  6 Mar 2021 16:57:04 +0100
Message-Id: <20210306155712.4298-8-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306155712.4298-1-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincotrol driver for BCM6358. BCM6358 allow overlaying different
functions onto the GPIO pins. It does not support configuring individual
pins but only whole groups. These groups may overlap, and still require
the directions to be set correctly in the GPIO register. In addition the
functions register controls other, not directly mux related functions.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v5: add changes suggested by Andy Shevchenko
 v4: no changes
 v3: use new shared code
 v2: switch to GPIO_REGMAP

 drivers/pinctrl/bcm/Kconfig           |   8 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6358.c | 369 ++++++++++++++++++++++++++
 3 files changed, 378 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6358.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index d35e5d3fe26f..ced7cc6ab44f 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -44,6 +44,14 @@ config PINCTRL_BCM6328
 	help
 	   Say Y here to enable the Broadcom BCM6328 GPIO driver.
 
+config PINCTRL_BCM6358
+	bool "Broadcom BCM6358 GPIO driver"
+	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	select PINCTRL_BCM63XX
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6358 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 57e5434a6db6..c3f5b7b2f2f0 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
+obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6358.c b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
new file mode 100644
index 000000000000..d638578727f3
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM6358 GPIO unit (pinctrl + GPIO)
+ *
+ * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
+ * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "../pinctrl-utils.h"
+
+#include "pinctrl-bcm63xx.h"
+
+#define BCM6358_NUM_GPIOS		40
+
+#define BCM6358_MODE_REG		0x18
+#define  BCM6358_MODE_MUX_NONE		0
+#define  BCM6358_MODE_MUX_EBI_CS	BIT(5)
+#define  BCM6358_MODE_MUX_UART1		BIT(6)
+#define  BCM6358_MODE_MUX_SPI_CS	BIT(7)
+#define  BCM6358_MODE_MUX_ASYNC_MODEM	BIT(8)
+#define  BCM6358_MODE_MUX_LEGACY_LED	BIT(9)
+#define  BCM6358_MODE_MUX_SERIAL_LED	BIT(10)
+#define  BCM6358_MODE_MUX_LED		BIT(11)
+#define  BCM6358_MODE_MUX_UTOPIA	BIT(12)
+#define  BCM6358_MODE_MUX_CLKRST	BIT(13)
+#define  BCM6358_MODE_MUX_PWM_SYN_CLK	BIT(14)
+#define  BCM6358_MODE_MUX_SYS_IRQ	BIT(15)
+
+struct bcm6358_pingroup {
+	const char *name;
+	const unsigned * const pins;
+	const unsigned num_pins;
+
+	const uint16_t mode_val;
+
+	/* non-GPIO function muxes require the gpio direction to be set */
+	const uint16_t direction;
+};
+
+struct bcm6358_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned num_groups;
+};
+
+struct bcm6358_priv {
+	struct regmap_field *overlays;
+};
+
+#define BCM6358_GPIO_PIN(a, b, bit1, bit2, bit3)		\
+	{							\
+		.number = a,					\
+		.name = b,					\
+		.drv_data = (void *)(BCM6358_MODE_MUX_##bit1 |	\
+				     BCM6358_MODE_MUX_##bit2 |	\
+				     BCM6358_MODE_MUX_##bit3),	\
+	}
+
+static const struct pinctrl_pin_desc bcm6358_pins[] = {
+	BCM6358_GPIO_PIN(0, "gpio0", LED, NONE, NONE),
+	BCM6358_GPIO_PIN(1, "gpio1", LED, NONE, NONE),
+	BCM6358_GPIO_PIN(2, "gpio2", LED, NONE, NONE),
+	BCM6358_GPIO_PIN(3, "gpio3", LED, NONE, NONE),
+	PINCTRL_PIN(4, "gpio4"),
+	BCM6358_GPIO_PIN(5, "gpio5", SYS_IRQ, NONE, NONE),
+	BCM6358_GPIO_PIN(6, "gpio6", SERIAL_LED, NONE, NONE),
+	BCM6358_GPIO_PIN(7, "gpio7", SERIAL_LED, NONE, NONE),
+	BCM6358_GPIO_PIN(8, "gpio8", PWM_SYN_CLK, NONE, NONE),
+	BCM6358_GPIO_PIN(9, "gpio09", LEGACY_LED, NONE, NONE),
+	BCM6358_GPIO_PIN(10, "gpio10", LEGACY_LED, NONE, NONE),
+	BCM6358_GPIO_PIN(11, "gpio11", LEGACY_LED, NONE, NONE),
+	BCM6358_GPIO_PIN(12, "gpio12", LEGACY_LED, ASYNC_MODEM, UTOPIA),
+	BCM6358_GPIO_PIN(13, "gpio13", LEGACY_LED, ASYNC_MODEM, UTOPIA),
+	BCM6358_GPIO_PIN(14, "gpio14", LEGACY_LED, ASYNC_MODEM, UTOPIA),
+	BCM6358_GPIO_PIN(15, "gpio15", LEGACY_LED, ASYNC_MODEM, UTOPIA),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	BCM6358_GPIO_PIN(22, "gpio22", UTOPIA, NONE, NONE),
+	BCM6358_GPIO_PIN(23, "gpio23", UTOPIA, NONE, NONE),
+	BCM6358_GPIO_PIN(24, "gpio24", UTOPIA, NONE, NONE),
+	BCM6358_GPIO_PIN(25, "gpio25", UTOPIA, NONE, NONE),
+	BCM6358_GPIO_PIN(26, "gpio26", UTOPIA, NONE, NONE),
+	BCM6358_GPIO_PIN(27, "gpio27", UTOPIA, NONE, NONE),
+	BCM6358_GPIO_PIN(28, "gpio28", UTOPIA, UART1, NONE),
+	BCM6358_GPIO_PIN(29, "gpio29", UTOPIA, UART1, NONE),
+	BCM6358_GPIO_PIN(30, "gpio30", UTOPIA, UART1, EBI_CS),
+	BCM6358_GPIO_PIN(31, "gpio31", UTOPIA, UART1, EBI_CS),
+	BCM6358_GPIO_PIN(32, "gpio32", SPI_CS, NONE, NONE),
+	BCM6358_GPIO_PIN(33, "gpio33", SPI_CS, NONE, NONE),
+	PINCTRL_PIN(34, "gpio34"),
+	PINCTRL_PIN(35, "gpio35"),
+	PINCTRL_PIN(36, "gpio36"),
+	PINCTRL_PIN(37, "gpio37"),
+	PINCTRL_PIN(38, "gpio38"),
+	PINCTRL_PIN(39, "gpio39"),
+};
+
+static unsigned ebi_cs_grp_pins[] = { 30, 31 };
+
+static unsigned uart1_grp_pins[] = { 28, 29, 30, 31 };
+
+static unsigned spi_cs_grp_pins[] = { 32, 33 };
+
+static unsigned async_modem_grp_pins[] = { 12, 13, 14, 15 };
+
+static unsigned serial_led_grp_pins[] = { 6, 7 };
+
+static unsigned legacy_led_grp_pins[] = { 9, 10, 11, 12, 13, 14, 15 };
+
+static unsigned led_grp_pins[] = { 0, 1, 2, 3 };
+
+static unsigned utopia_grp_pins[] = {
+	12, 13, 14, 15, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+};
+
+static unsigned pwm_syn_clk_grp_pins[] = { 8 };
+
+static unsigned sys_irq_grp_pins[] = { 5 };
+
+#define BCM6358_GPIO_MUX_GROUP(n, bit, dir)			\
+	{							\
+		.name = #n,					\
+		.pins = n##_pins,				\
+		.num_pins = ARRAY_SIZE(n##_pins),		\
+		.mode_val = BCM6358_MODE_MUX_##bit,		\
+		.direction = dir,				\
+	}
+
+static const struct bcm6358_pingroup bcm6358_groups[] = {
+	BCM6358_GPIO_MUX_GROUP(ebi_cs_grp, EBI_CS, 0x3),
+	BCM6358_GPIO_MUX_GROUP(uart1_grp, UART1, 0x2),
+	BCM6358_GPIO_MUX_GROUP(spi_cs_grp, SPI_CS, 0x6),
+	BCM6358_GPIO_MUX_GROUP(async_modem_grp, ASYNC_MODEM, 0x6),
+	BCM6358_GPIO_MUX_GROUP(legacy_led_grp, LEGACY_LED, 0x7f),
+	BCM6358_GPIO_MUX_GROUP(serial_led_grp, SERIAL_LED, 0x3),
+	BCM6358_GPIO_MUX_GROUP(led_grp, LED, 0xf),
+	BCM6358_GPIO_MUX_GROUP(utopia_grp, UTOPIA, 0x000f),
+	BCM6358_GPIO_MUX_GROUP(pwm_syn_clk_grp, PWM_SYN_CLK, 0x1),
+	BCM6358_GPIO_MUX_GROUP(sys_irq_grp, SYS_IRQ, 0x1),
+};
+
+static const char * const ebi_cs_groups[] = {
+	"ebi_cs_grp"
+};
+
+static const char * const uart1_groups[] = {
+	"uart1_grp"
+};
+
+static const char * const spi_cs_2_3_groups[] = {
+	"spi_cs_2_3_grp"
+};
+
+static const char * const async_modem_groups[] = {
+	"async_modem_grp"
+};
+
+static const char * const legacy_led_groups[] = {
+	"legacy_led_grp",
+};
+
+static const char * const serial_led_groups[] = {
+	"serial_led_grp",
+};
+
+static const char * const led_groups[] = {
+	"led_grp",
+};
+
+static const char * const clkrst_groups[] = {
+	"clkrst_grp",
+};
+
+static const char * const pwm_syn_clk_groups[] = {
+	"pwm_syn_clk_grp",
+};
+
+static const char * const sys_irq_groups[] = {
+	"sys_irq_grp",
+};
+
+#define BCM6358_FUN(n)					\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+	}
+
+static const struct bcm6358_function bcm6358_funcs[] = {
+	BCM6358_FUN(ebi_cs),
+	BCM6358_FUN(uart1),
+	BCM6358_FUN(spi_cs_2_3),
+	BCM6358_FUN(async_modem),
+	BCM6358_FUN(legacy_led),
+	BCM6358_FUN(serial_led),
+	BCM6358_FUN(led),
+	BCM6358_FUN(clkrst),
+	BCM6358_FUN(pwm_syn_clk),
+	BCM6358_FUN(sys_irq),
+};
+
+static int bcm6358_pinctrl_get_group_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6358_groups);
+}
+
+static const char *bcm6358_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						  unsigned group)
+{
+	return bcm6358_groups[group].name;
+}
+
+static int bcm6358_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					  unsigned group, const unsigned **pins,
+					  unsigned *num_pins)
+{
+	*pins = bcm6358_groups[group].pins;
+	*num_pins = bcm6358_groups[group].num_pins;
+
+	return 0;
+}
+
+static int bcm6358_pinctrl_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6358_funcs);
+}
+
+static const char *bcm6358_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
+						 unsigned selector)
+{
+	return bcm6358_funcs[selector].name;
+}
+
+static int bcm6358_pinctrl_get_groups(struct pinctrl_dev *pctldev,
+				      unsigned selector,
+				      const char * const **groups,
+				      unsigned * const num_groups)
+{
+	*groups = bcm6358_funcs[selector].groups;
+	*num_groups = bcm6358_funcs[selector].num_groups;
+
+	return 0;
+}
+
+static int bcm6358_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				   unsigned selector, unsigned group)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	struct bcm6358_priv *priv = pc->driver_data;
+	const struct bcm6358_pingroup *pg = &bcm6358_groups[group];
+	unsigned int val = pg->mode_val;
+	unsigned int mask = val;
+	unsigned pin;
+
+	for (pin = 0; pin < pg->num_pins; pin++)
+		mask |= (unsigned long)bcm6358_pins[pin].drv_data;
+
+	regmap_field_update_bits(priv->overlays, mask, val);
+
+	for (pin = 0; pin < pg->num_pins; pin++) {
+		struct pinctrl_gpio_range *range;
+		unsigned int hw_gpio = bcm6358_pins[pin].number;
+
+		range = pinctrl_find_gpio_range_from_pin(pctldev, hw_gpio);
+		if (range) {
+			struct gpio_chip *gc = range->gc;
+
+			if (pg->direction & BIT(pin))
+				gc->direction_output(gc, hw_gpio, 0);
+			else
+				gc->direction_input(gc, hw_gpio);
+		}
+	}
+
+	return 0;
+}
+
+static int bcm6358_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	struct bcm6358_priv *priv = pc->driver_data;
+	unsigned int mask;
+
+	mask = (unsigned long) bcm6358_pins[offset].drv_data;
+	if (!mask)
+		return 0;
+
+	/* disable all functions using this pin */
+	return regmap_field_update_bits(priv->overlays, mask, 0);
+}
+
+static struct pinctrl_ops bcm6358_pctl_ops = {
+	.dt_free_map = pinctrl_utils_free_map,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.get_group_name = bcm6358_pinctrl_get_group_name,
+	.get_group_pins = bcm6358_pinctrl_get_group_pins,
+	.get_groups_count = bcm6358_pinctrl_get_group_count,
+};
+
+static struct pinmux_ops bcm6358_pmx_ops = {
+	.get_function_groups = bcm6358_pinctrl_get_groups,
+	.get_function_name = bcm6358_pinctrl_get_func_name,
+	.get_functions_count = bcm6358_pinctrl_get_func_count,
+	.gpio_request_enable = bcm6358_gpio_request_enable,
+	.set_mux = bcm6358_pinctrl_set_mux,
+	.strict = true,
+};
+
+static const struct bcm63xx_pinctrl_soc bcm6358_soc = {
+	.ngpios = BCM6358_NUM_GPIOS,
+	.npins = ARRAY_SIZE(bcm6358_pins),
+	.pctl_ops = &bcm6358_pctl_ops,
+	.pins = bcm6358_pins,
+	.pmx_ops = &bcm6358_pmx_ops,
+};
+
+static int bcm6358_pinctrl_probe(struct platform_device *pdev)
+{
+	struct reg_field overlays = REG_FIELD(BCM6358_MODE_REG, 0, 15);
+	struct device *dev = &pdev->dev;
+	struct bcm63xx_pinctrl *pc;
+	struct bcm6358_priv *priv;
+	int err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	err = bcm63xx_pinctrl_probe(pdev, &bcm6358_soc, (void *) priv);
+	if (err)
+		return err;
+
+	pc = platform_get_drvdata(pdev);
+
+	priv->overlays = devm_regmap_field_alloc(dev, pc->regs, overlays);
+	if (IS_ERR(priv->overlays))
+		return PTR_ERR(priv->overlays);
+
+	return 0;
+}
+
+static const struct of_device_id bcm6358_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6358-pinctrl", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver bcm6358_pinctrl_driver = {
+	.probe = bcm6358_pinctrl_probe,
+	.driver = {
+		.name = "bcm6358-pinctrl",
+		.of_match_table = bcm6358_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6358_pinctrl_driver);
-- 
2.20.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DBC33B174
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhCOLmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhCOLm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:28 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA3BC061574;
        Mon, 15 Mar 2021 04:42:28 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo19250484wmq.4;
        Mon, 15 Mar 2021 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hp2b7HqZrlu9nZxQ2UONj+JMKa0I7VIeOfw3ugl/Fbg=;
        b=rcoNb99TqhF/HD+niE32F/sr6whjW5EkEU0h4B3TBkFuTU4fqbiX+6uhT+iKQtdGSV
         +fzDYTxuAofeiVnXFdSexHNvETqPgpc2lGbb07bFnLehUSPvJpvIdqlg+V1E3o4uhnK9
         xUzDOKyiJC8YJpg6mAb+EcfKrpFf/M0LmvdrhViqgmXJcGIGUZMJSxjJFaI4bjGYCHT+
         OI6Ys24poF2qBackZ3F1C3/3QyA1Y2B1ICrg+1s1dIYeBqVs9vc0JJH3/aC6TuJPSruS
         cIoG0wJWOdrCc7P/Fz+28t9eUpHMMrepV81a9RNJ2owaMEpj2NyUIg2N5WvvyvPETmxj
         nvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hp2b7HqZrlu9nZxQ2UONj+JMKa0I7VIeOfw3ugl/Fbg=;
        b=RnFgrY9Dy04cwY/3DZE4SxyCrr+t+tElJzaoBMIp2QOLdMoP6avBI6OtxJ43MukC1U
         zhRdJZ9Y1iFpBsFDc+0wLt5rLHckS+JdT3zZR/HnPx6DB07RO4x+WzaapIhTq/vsZUWS
         Rvh+8SQNW3jIYL4jeYLYRkmDDTUM0/uoSqq14uohU3tAtFlqnwwCwxzVrsFyzEg9dc5i
         xNQrj9WGi4NvG8l3r0wRRSKMNKkW55LAnMW4VAyKj5+yn1pBx0ySZ8UFE4vuEW4MaagS
         /ukWLvHABozPdVjCEG3PyBVvOcxb1blJWCGnol/Te2IE9ysz7SX8tRHdAiVzwO5QH7nt
         0bLA==
X-Gm-Message-State: AOAM533VLBV3A2TZBiZ9Gu7UIhvLypO0kq6BbXmODaZXULF50EY9Osxl
        /UR8CaB50c7l3ye2S90poxs=
X-Google-Smtp-Source: ABdhPJwXk8D5DRiGnrlKhIRr6R2S2qZ+Wu6BygOPYKdWEpcGHC7qCIy2OEWLUq0o/MedzDDAhL5zZg==
X-Received: by 2002:a05:600c:2ca:: with SMTP id 10mr25911245wmn.40.1615808546964;
        Mon, 15 Mar 2021 04:42:26 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:26 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/22] pinctrl: add a pincontrol driver for BCM6358
Date:   Mon, 15 Mar 2021 12:42:02 +0100
Message-Id: <20210315114214.3096-11-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
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

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: no changes
 v6: no changes
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


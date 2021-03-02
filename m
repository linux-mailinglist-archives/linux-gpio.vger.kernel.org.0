Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5E032AD36
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384001AbhCBV3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835598AbhCBTSU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:20 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F92C0617AA;
        Tue,  2 Mar 2021 11:16:31 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id f12so17270289wrx.8;
        Tue, 02 Mar 2021 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ux+Y0fYJffFhrs6S4XpaQn7P1wJwMUN+hrtae8+WiMg=;
        b=DQeVvx9iwRMTmsLSqwYzeIq499R96G9en5DafArAJ6hlLGyNt/X/D6ufCbba73BexZ
         +G7HO6OclxFLf9xMIh7MSzFFxyVAUvx3WVisnn0h0Tchsj+t0ViaVF7+4D1yVq1dRlsb
         dF6rr3nOJWaMxxX2VOTE2UnJQ1+RyH8Z4NPgdxKq8BsFYORBbG1k0GINBNXAPyvP9B1h
         L5k123eW4OoixUpBHk0J/9RktQgAaI9wLa94axDf/ALz/dAn62PcdbiS9FweijcjQEnS
         NQc4VoJjY1G5dhjmCLF3ziMdlWhZTkGu66A7F90EMsSHs9nMqTQoJxIsZSJ0CWm8p351
         Nd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ux+Y0fYJffFhrs6S4XpaQn7P1wJwMUN+hrtae8+WiMg=;
        b=MCvQMIDkYqlFdfftU7fa8x2xr0JHP3367bLcdur98XYNcH5ElgzAX7AXVlV392wEtI
         L/B1xh3zDXMQNXg5eSXGizp1n7JDSVlsx740ItRXwzzFq6k8eP7kQGByqqW8J1iI63pE
         GCJyG/QTmcFur/l4X3e2DAHD0xrthC2H8ecc2RvV7SuJXaELfuO/wUMgjUfXALosDHX+
         77WQdyomqZeuYdaB51Khe6tRFkZTlV9SP/nqUTvVXpFEhJ1A84CrwVnq28D4AoPIsjtp
         nI/wmyyMbbd3rlc2IBnU9GtpnYT6d5wA++qWDAHCQsb92Ocz0xeneXH08t71CPWv0nxm
         /7JQ==
X-Gm-Message-State: AOAM5330NLndJ9XlVT55SMm9iE9gQEpoW4vqXJBbqDE3RAUycLar4r6a
        7u7snMQeJDwnbLrdNUiW0DI=
X-Google-Smtp-Source: ABdhPJxvMU6S72cnTVDx1rG8egeWzQxNLwQN/S8KIwL0sjJvS2D+7su0JudUV6LcEQ9yFNiMqY8nkA==
X-Received: by 2002:adf:a2c7:: with SMTP id t7mr23729027wra.42.1614712589603;
        Tue, 02 Mar 2021 11:16:29 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:29 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>, f.fainelli@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/12] pinctrl: add a pincontrol driver for BCM6358
Date:   Tue,  2 Mar 2021 20:16:05 +0100
Message-Id: <20210302191613.29476-5-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
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

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v2: switch to GPIO_REGMAP

 drivers/pinctrl/bcm/Kconfig           |  11 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6358.c | 429 ++++++++++++++++++++++++++
 3 files changed, 441 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6358.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 76728f097c25..998331219c57 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -42,6 +42,17 @@ config PINCTRL_BCM6328
 	help
 	   Say Y here to enable the Broadcom BCM6328 GPIO driver.
 
+config PINCTRL_BCM6358
+	bool "Broadcom BCM6358 GPIO driver"
+	depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select MFD_SYSCON
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6358 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 7e7c6e25b26d..794d07d97754 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
+obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6358.c b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
new file mode 100644
index 000000000000..5dd0c66d9ed7
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6358.c
@@ -0,0 +1,429 @@
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
+#include <linux/gpio/regmap.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+
+#define MODULE_NAME		"bcm6358-pinctrl"
+#define BCM6358_BANK_GPIOS	32
+#define BCM6358_NUM_GPIOS	40
+
+#define BCM6358_DIROUT_REG	0x04
+#define BCM6358_DATA_REG	0x0c
+#define BCM6358_MODE_REG	0x18
+
+#define BCM6358_MODE_MUX_NONE		0
+#define BCM6358_MODE_MUX_EBI_CS		BIT(5)
+#define BCM6358_MODE_MUX_UART1		BIT(6)
+#define BCM6358_MODE_MUX_SPI_CS		BIT(7)
+#define BCM6358_MODE_MUX_ASYNC_MODEM	BIT(8)
+#define BCM6358_MODE_MUX_LEGACY_LED	BIT(9)
+#define BCM6358_MODE_MUX_SERIAL_LED	BIT(10)
+#define BCM6358_MODE_MUX_LED		BIT(11)
+#define BCM6358_MODE_MUX_UTOPIA		BIT(12)
+#define BCM6358_MODE_MUX_CLKRST		BIT(13)
+#define BCM6358_MODE_MUX_PWM_SYN_CLK	BIT(14)
+#define BCM6358_MODE_MUX_SYS_IRQ	BIT(15)
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
+struct bcm6358_pinctrl {
+	struct device *dev;
+	struct regmap *regs;
+	struct regmap_field *overlays;
+
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip *gpio_chip;
+	struct pinctrl_desc pctl_desc;
+	struct pinctrl_gpio_range gpio_range;
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
+static int bcm6358_reg_mask_xlate(struct gpio_regmap *gpio,
+				  unsigned int base, unsigned int offset,
+				  unsigned int *reg, unsigned int *mask)
+{
+	unsigned int line = offset % gpio->ngpio_per_reg;
+	unsigned int stride = offset / gpio->ngpio_per_reg;
+
+	*reg = base - stride * gpio->reg_stride;
+	*mask = BIT(line);
+
+	return 0;
+}
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
+	struct bcm6358_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm6358_pingroup *pg = &bcm6358_groups[group];
+	unsigned int val = pg->mode_val;
+	unsigned int mask = val;
+	unsigned pin;
+
+	for (pin = 0; pin < pg->num_pins; pin++)
+		mask |= (unsigned long)bcm6358_pins[pin].drv_data;
+
+	regmap_field_update_bits(pc->overlays, mask, val);
+
+	for (pin = 0; pin < pg->num_pins; pin++) {
+		int hw_gpio = bcm6358_pins[pin].number;
+		struct gpio_chip *gc = pc->gpio_chip;
+
+		if (pg->direction & BIT(pin))
+			gc->direction_output(gc, hw_gpio, 0);
+		else
+			gc->direction_input(gc, hw_gpio);
+	}
+
+	return 0;
+}
+
+static int bcm6358_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm6358_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int mask;
+
+	mask = (unsigned long) bcm6358_pins[offset].drv_data;
+	if (!mask)
+		return 0;
+
+	/* disable all functions using this pin */
+	return regmap_field_update_bits(pc->overlays, mask, 0);
+}
+
+static struct pinctrl_ops bcm6358_pctl_ops = {
+	.get_groups_count = bcm6358_pinctrl_get_group_count,
+	.get_group_name = bcm6358_pinctrl_get_group_name,
+	.get_group_pins = bcm6358_pinctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static struct pinmux_ops bcm6358_pmx_ops = {
+	.get_functions_count = bcm6358_pinctrl_get_func_count,
+	.get_function_name = bcm6358_pinctrl_get_func_name,
+	.get_function_groups = bcm6358_pinctrl_get_groups,
+	.set_mux = bcm6358_pinctrl_set_mux,
+	.gpio_request_enable = bcm6358_gpio_request_enable,
+	.strict = true,
+};
+
+static int bcm6358_pinctrl_probe(struct platform_device *pdev)
+{
+	struct reg_field overlays = REG_FIELD(BCM6358_MODE_REG, 0, 15);
+	struct device *dev = &pdev->dev;
+	struct gpio_regmap_config grc = {0};
+	struct gpio_regmap *gr;
+	struct bcm6358_pinctrl *pc;
+	int err;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pc);
+	pc->dev = dev;
+
+	pc->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(pc->regs))
+		return PTR_ERR(pc->regs);
+
+	pc->overlays = devm_regmap_field_alloc(&pdev->dev, pc->regs, overlays);
+	if (IS_ERR(pc->overlays))
+		return PTR_ERR(pc->overlays);
+
+	/* disable all muxes by default */
+	regmap_field_write(pc->overlays, 0);
+
+	grc.parent = dev;
+	grc.ngpio = BCM6358_NUM_GPIOS;
+	grc.ngpio_per_reg = BCM6358_BANK_GPIOS;
+	grc.regmap = pc->regs;
+	grc.reg_dat_base = BCM6358_DATA_REG;
+	grc.reg_dir_out_base = BCM6358_DIROUT_REG;
+	grc.reg_mask_xlate = bcm6358_reg_mask_xlate;
+	grc.reg_set_base = BCM6358_DATA_REG;
+	grc.reg_stride = 4;
+
+	gr = devm_gpio_regmap_register(dev, &grc);
+	err = PTR_ERR_OR_ZERO(gr);
+	if (err) {
+		dev_err(dev, "could not add GPIO chip\n");
+		return err;
+	}
+
+	pc->gpio_chip = &gr->gpio_chip;
+
+	pc->pctl_desc.name = MODULE_NAME;
+	pc->pctl_desc.pins = bcm6358_pins;
+	pc->pctl_desc.npins = ARRAY_SIZE(bcm6358_pins);
+	pc->pctl_desc.pctlops = &bcm6358_pctl_ops;
+	pc->pctl_desc.pmxops = &bcm6358_pmx_ops;
+	pc->pctl_desc.owner = THIS_MODULE;
+
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev)) {
+		gpiochip_remove(&gr->gpio_chip);
+		return PTR_ERR(pc->pctl_dev);
+	}
+
+	pc->gpio_range.name = MODULE_NAME;
+	pc->gpio_range.npins = BCM6358_NUM_GPIOS;
+	pc->gpio_range.base = gr->gpio_chip.base;
+	pc->gpio_range.gc = &gr->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	dev_info(dev, "registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id bcm6358_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6358-pinctrl", },
+	{ },
+};
+
+static struct platform_driver bcm6358_pinctrl_driver = {
+	.probe = bcm6358_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = bcm6358_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6358_pinctrl_driver);
-- 
2.20.1


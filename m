Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A882F347352
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbhCXIUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbhCXITf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:35 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38538C0613DD;
        Wed, 24 Mar 2021 01:19:34 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 12so12371323wmf.5;
        Wed, 24 Mar 2021 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1kfluqEmAMnMwbmUQ3tSyH8HDW9gBVB/ZQflES+0Mvw=;
        b=rd7yXJEQ2QzW7Wn3Toa2MFF9TdJZeM8wWSX4sP+9Fyvc1YiRcIjdJheKc+4w3ihfUH
         1vp7uSxY7eWrGyZJQSZozPTi1DzbJA+jOr1ufiZkYf0HRHJ6ALO7irEPc79wkNnBl2fq
         UBXULdtesg/s6bLwfaRPbT/pdkNNXfhGCy3kVdukuUuqeeSqD7lGTNmHWvBkJNK2ReDU
         2ekhznKuue0lTo1S8R2LMNlKGV0WEHsDW0aAunlAdNG1W81k68XjmWgwJc4Kx/M2hdV/
         wMgf6u2P+IK56jQHrXwlL0oIACEfO2Pe82KXcjSYhi0RXG0EL4aH8Bt4qk2uOPg5irsF
         JS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1kfluqEmAMnMwbmUQ3tSyH8HDW9gBVB/ZQflES+0Mvw=;
        b=M1/DOJdvcUSvg26Va/REVC8aZZu5dZkElzRRjeVDxUepaXzySMucoUK00zevVyw5B7
         bJBZInu64KJ8EQ1Vkf3hHibniJHAClCIOEP5gHNOK25W5bR+1HXVm5abu2RWKXVu3Irx
         eNlCNszOHFGkR+8IpotRTEgxo0xz3YzydbIZnU1djTDhYn53/zxh4Ilk/4XSXdFgC0qN
         Y+WBEJiWqsjg2YUmsIeUhYa+G9o6mZpq8y09UvDD1yg0hO5l4/BmP1a+9Agq2u0NzGUq
         msEssUjwrwR9idzLbE9Ct6t+yVna03HpFNE7YcwX5Nhg5I2NArqw1mR3znHRr9y+/QCX
         sLKQ==
X-Gm-Message-State: AOAM5315QLHjhcYTAgqoh0bYw6YT27fYiNHJ3nIDevjeCH+/2YGSRpLh
        9X1I45RoJ4Phq7zuTczQW2c=
X-Google-Smtp-Source: ABdhPJypHwcKJTgToFbwCIg1BxByQR/egIzbtmCSG3kdnK5aL3YDYOOEKbB9ipcF5bFgoa8WN5jq6w==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr1735366wmj.34.1616573972877;
        Wed, 24 Mar 2021 01:19:32 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:32 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 07/22] pinctrl: add a pincontrol driver for BCM6328
Date:   Wed, 24 Mar 2021 09:19:08 +0100
Message-Id: <20210324081923.20379-8-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincontrol driver for BCM6328. BCM6328 supports muxing 32 pins as
GPIOs, as LEDs for the integrated LED controller, or various other
functions. Its pincontrol mux registers also control other aspects, like
switching the second USB port between host and device mode.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v9: no changes
 v8: no changes
 v7: no changes
 v6: no changes
 v5: add changes suggested by Andy Shevchenko
 v4: no changes
 v3: use new shared code
 v2: switch to GPIO_REGMAP

 drivers/pinctrl/bcm/Kconfig           |   8 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6328.c | 404 ++++++++++++++++++++++++++
 3 files changed, 413 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6328.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 882f19bdc243..d35e5d3fe26f 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -36,6 +36,14 @@ config PINCTRL_BCM63XX
 	select PINCONF
 	select PINMUX
 
+config PINCTRL_BCM6328
+	bool "Broadcom BCM6328 GPIO driver"
+	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	select PINCTRL_BCM63XX
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6328 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 0e3cf9b15c65..57e5434a6db6 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
+obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
new file mode 100644
index 000000000000..c9efce600550
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM6328 GPIO unit (pinctrl + GPIO)
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
+#define BCM6328_NUM_GPIOS	32
+
+#define BCM6328_MODE_REG	0x18
+#define BCM6328_MUX_HI_REG	0x1c
+#define BCM6328_MUX_LO_REG	0x20
+#define BCM6328_MUX_OTHER_REG	0x24
+#define  BCM6328_MUX_MASK	GENMASK(1, 0)
+
+struct bcm6328_pingroup {
+	const char *name;
+	const unsigned * const pins;
+	const unsigned num_pins;
+};
+
+struct bcm6328_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned num_groups;
+
+	unsigned mode_val:1;
+	unsigned mux_val:2;
+};
+
+static const unsigned int bcm6328_mux[] = {
+	BCM6328_MUX_LO_REG,
+	BCM6328_MUX_HI_REG,
+	BCM6328_MUX_OTHER_REG
+};
+
+static const struct pinctrl_pin_desc bcm6328_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	PINCTRL_PIN(27, "gpio27"),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+
+	/*
+	 * No idea where they really are; so let's put them according
+	 * to their mux offsets.
+	 */
+	PINCTRL_PIN(36, "hsspi_cs1"),
+	PINCTRL_PIN(38, "usb_p2"),
+};
+
+static unsigned gpio0_pins[] = { 0 };
+static unsigned gpio1_pins[] = { 1 };
+static unsigned gpio2_pins[] = { 2 };
+static unsigned gpio3_pins[] = { 3 };
+static unsigned gpio4_pins[] = { 4 };
+static unsigned gpio5_pins[] = { 5 };
+static unsigned gpio6_pins[] = { 6 };
+static unsigned gpio7_pins[] = { 7 };
+static unsigned gpio8_pins[] = { 8 };
+static unsigned gpio9_pins[] = { 9 };
+static unsigned gpio10_pins[] = { 10 };
+static unsigned gpio11_pins[] = { 11 };
+static unsigned gpio12_pins[] = { 12 };
+static unsigned gpio13_pins[] = { 13 };
+static unsigned gpio14_pins[] = { 14 };
+static unsigned gpio15_pins[] = { 15 };
+static unsigned gpio16_pins[] = { 16 };
+static unsigned gpio17_pins[] = { 17 };
+static unsigned gpio18_pins[] = { 18 };
+static unsigned gpio19_pins[] = { 19 };
+static unsigned gpio20_pins[] = { 20 };
+static unsigned gpio21_pins[] = { 21 };
+static unsigned gpio22_pins[] = { 22 };
+static unsigned gpio23_pins[] = { 23 };
+static unsigned gpio24_pins[] = { 24 };
+static unsigned gpio25_pins[] = { 25 };
+static unsigned gpio26_pins[] = { 26 };
+static unsigned gpio27_pins[] = { 27 };
+static unsigned gpio28_pins[] = { 28 };
+static unsigned gpio29_pins[] = { 29 };
+static unsigned gpio30_pins[] = { 30 };
+static unsigned gpio31_pins[] = { 31 };
+
+static unsigned hsspi_cs1_pins[] = { 36 };
+static unsigned usb_port1_pins[] = { 38 };
+
+#define BCM6328_GROUP(n)					\
+	{							\
+		.name = #n,					\
+		.pins = n##_pins,				\
+		.num_pins = ARRAY_SIZE(n##_pins),		\
+	}
+
+static struct bcm6328_pingroup bcm6328_groups[] = {
+	BCM6328_GROUP(gpio0),
+	BCM6328_GROUP(gpio1),
+	BCM6328_GROUP(gpio2),
+	BCM6328_GROUP(gpio3),
+	BCM6328_GROUP(gpio4),
+	BCM6328_GROUP(gpio5),
+	BCM6328_GROUP(gpio6),
+	BCM6328_GROUP(gpio7),
+	BCM6328_GROUP(gpio8),
+	BCM6328_GROUP(gpio9),
+	BCM6328_GROUP(gpio10),
+	BCM6328_GROUP(gpio11),
+	BCM6328_GROUP(gpio12),
+	BCM6328_GROUP(gpio13),
+	BCM6328_GROUP(gpio14),
+	BCM6328_GROUP(gpio15),
+	BCM6328_GROUP(gpio16),
+	BCM6328_GROUP(gpio17),
+	BCM6328_GROUP(gpio18),
+	BCM6328_GROUP(gpio19),
+	BCM6328_GROUP(gpio20),
+	BCM6328_GROUP(gpio21),
+	BCM6328_GROUP(gpio22),
+	BCM6328_GROUP(gpio23),
+	BCM6328_GROUP(gpio24),
+	BCM6328_GROUP(gpio25),
+	BCM6328_GROUP(gpio26),
+	BCM6328_GROUP(gpio27),
+	BCM6328_GROUP(gpio28),
+	BCM6328_GROUP(gpio29),
+	BCM6328_GROUP(gpio30),
+	BCM6328_GROUP(gpio31),
+
+	BCM6328_GROUP(hsspi_cs1),
+	BCM6328_GROUP(usb_port1),
+};
+
+/* GPIO_MODE */
+static const char * const led_groups[] = {
+	"gpio0",
+	"gpio1",
+	"gpio2",
+	"gpio3",
+	"gpio4",
+	"gpio5",
+	"gpio6",
+	"gpio7",
+	"gpio8",
+	"gpio9",
+	"gpio10",
+	"gpio11",
+	"gpio12",
+	"gpio13",
+	"gpio14",
+	"gpio15",
+	"gpio16",
+	"gpio17",
+	"gpio18",
+	"gpio19",
+	"gpio20",
+	"gpio21",
+	"gpio22",
+	"gpio23",
+};
+
+/* PINMUX_SEL */
+static const char * const serial_led_data_groups[] = {
+	"gpio6",
+};
+
+static const char * const serial_led_clk_groups[] = {
+	"gpio7",
+};
+
+static const char * const inet_act_led_groups[] = {
+	"gpio11",
+};
+
+static const char * const pcie_clkreq_groups[] = {
+	"gpio16",
+};
+
+static const char * const ephy0_act_led_groups[] = {
+	"gpio25",
+};
+
+static const char * const ephy1_act_led_groups[] = {
+	"gpio26",
+};
+
+static const char * const ephy2_act_led_groups[] = {
+	"gpio27",
+};
+
+static const char * const ephy3_act_led_groups[] = {
+	"gpio28",
+};
+
+static const char * const hsspi_cs1_groups[] = {
+	"hsspi_cs1"
+};
+
+static const char * const usb_host_port_groups[] = {
+	"usb_port1",
+};
+
+static const char * const usb_device_port_groups[] = {
+	"usb_port1",
+};
+
+#define BCM6328_MODE_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.mode_val = 1,				\
+	}
+
+#define BCM6328_MUX_FUN(n, mux)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.mux_val = mux,				\
+	}
+
+static const struct bcm6328_function bcm6328_funcs[] = {
+	BCM6328_MODE_FUN(led),
+	BCM6328_MUX_FUN(serial_led_data, 2),
+	BCM6328_MUX_FUN(serial_led_clk, 2),
+	BCM6328_MUX_FUN(inet_act_led, 1),
+	BCM6328_MUX_FUN(pcie_clkreq, 2),
+	BCM6328_MUX_FUN(ephy0_act_led, 1),
+	BCM6328_MUX_FUN(ephy1_act_led, 1),
+	BCM6328_MUX_FUN(ephy2_act_led, 1),
+	BCM6328_MUX_FUN(ephy3_act_led, 1),
+	BCM6328_MUX_FUN(hsspi_cs1, 2),
+	BCM6328_MUX_FUN(usb_host_port, 1),
+	BCM6328_MUX_FUN(usb_device_port, 2),
+};
+
+static inline unsigned int bcm6328_mux_off(unsigned int pin)
+{
+	return bcm6328_mux[pin / 16];
+}
+
+static int bcm6328_pinctrl_get_group_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6328_groups);
+}
+
+static const char *bcm6328_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						  unsigned group)
+{
+	return bcm6328_groups[group].name;
+}
+
+static int bcm6328_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					  unsigned group, const unsigned **pins,
+					  unsigned *num_pins)
+{
+	*pins = bcm6328_groups[group].pins;
+	*num_pins = bcm6328_groups[group].num_pins;
+
+	return 0;
+}
+
+static int bcm6328_pinctrl_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6328_funcs);
+}
+
+static const char *bcm6328_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
+						 unsigned selector)
+{
+	return bcm6328_funcs[selector].name;
+}
+
+static int bcm6328_pinctrl_get_groups(struct pinctrl_dev *pctldev,
+				      unsigned selector,
+				      const char * const **groups,
+				      unsigned * const num_groups)
+{
+	*groups = bcm6328_funcs[selector].groups;
+	*num_groups = bcm6328_funcs[selector].num_groups;
+
+	return 0;
+}
+
+static void bcm6328_rmw_mux(struct bcm63xx_pinctrl *pc, unsigned pin,
+			    unsigned int mode, unsigned int mux)
+{
+	if (pin < BCM6328_NUM_GPIOS)
+		regmap_update_bits(pc->regs, BCM6328_MODE_REG, BIT(pin),
+				   mode ? BIT(pin) : 0);
+
+	regmap_update_bits(pc->regs, bcm6328_mux_off(pin),
+			   BCM6328_MUX_MASK << ((pin % 16) * 2),
+			   mux << ((pin % 16) * 2));
+}
+
+static int bcm6328_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				   unsigned selector, unsigned group)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm6328_pingroup *pg = &bcm6328_groups[group];
+	const struct bcm6328_function *f = &bcm6328_funcs[selector];
+
+	bcm6328_rmw_mux(pc, pg->pins[0], f->mode_val, f->mux_val);
+
+	return 0;
+}
+
+static int bcm6328_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable all functions using this pin */
+	bcm6328_rmw_mux(pc, offset, 0, 0);
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm6328_pctl_ops = {
+	.dt_free_map = pinctrl_utils_free_map,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.get_group_name = bcm6328_pinctrl_get_group_name,
+	.get_group_pins = bcm6328_pinctrl_get_group_pins,
+	.get_groups_count = bcm6328_pinctrl_get_group_count,
+};
+
+static struct pinmux_ops bcm6328_pmx_ops = {
+	.get_function_groups = bcm6328_pinctrl_get_groups,
+	.get_function_name = bcm6328_pinctrl_get_func_name,
+	.get_functions_count = bcm6328_pinctrl_get_func_count,
+	.gpio_request_enable = bcm6328_gpio_request_enable,
+	.set_mux = bcm6328_pinctrl_set_mux,
+	.strict = true,
+};
+
+static const struct bcm63xx_pinctrl_soc bcm6328_soc = {
+	.ngpios = BCM6328_NUM_GPIOS,
+	.npins = ARRAY_SIZE(bcm6328_pins),
+	.pctl_ops = &bcm6328_pctl_ops,
+	.pins = bcm6328_pins,
+	.pmx_ops = &bcm6328_pmx_ops,
+};
+
+static int bcm6328_pinctrl_probe(struct platform_device *pdev)
+{
+	return bcm63xx_pinctrl_probe(pdev, &bcm6328_soc, NULL);
+}
+
+static const struct of_device_id bcm6328_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6328-pinctrl", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver bcm6328_pinctrl_driver = {
+	.probe = bcm6328_pinctrl_probe,
+	.driver = {
+		.name = "bcm6328-pinctrl",
+		.of_match_table = bcm6328_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6328_pinctrl_driver);
-- 
2.20.1


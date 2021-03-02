Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D48732AD31
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383866AbhCBV2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835591AbhCBTSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:18 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0502C0617A7;
        Tue,  2 Mar 2021 11:16:23 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o16so3872154wmh.0;
        Tue, 02 Mar 2021 11:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5T18IUzNmPrsgotLdqglJGiRlo+egb3xfj4LtdB6EC0=;
        b=Jnzc4KaoHIYwwKGTV2kr4CYFy+aBaN2cxCdArwA6cx8gfKfs3ZsP2I1lFnMXo/R2ba
         R4q0hg+tmnW/pUG+6ZO6VGGUHG40qRLTuigPlmjrMsAkN4bnFjT5kt0oR8VyE7V5YTrd
         kEgfkS+3oj9shhwBVFhXK0WvqzyoEq2ovpoJCnJFfVRdZEbV2Ni6qK77murVSIxlWyZv
         p07mOQoEumaF1CeW/nRvXW8JMMyB/1sk4JuFcflAO7mKG000iBlHwPqzN2/tSszni4ok
         Z1FrdZVm0dRpCLDFxOyPCqBifSQoWuDKHFarMxA67VIAGME+5oshyWcnefg1brrZBSaG
         9rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5T18IUzNmPrsgotLdqglJGiRlo+egb3xfj4LtdB6EC0=;
        b=J+eI5oOP8YeMvE1KntcZd578ZBcKpQy9WGJk/XDS6+3hwS1iiFuiMjnfH52MzyvxDh
         oPQwleyTO0eSpxrgxIvpAVDBhOZj11YoCqq7kVtxFi09AfyKALhp3tiss1ll66pqIRuA
         MIRbrMc30a7SLlwyh7uSSu0GZGEAnieJujnmeIvO4GfPKvQs/106MoEV40PdPxPgkKub
         rF4YTJ9pg5lljHgu/J5gHQlFnD4HJEUUfRaYFGkAFJESG165i4dzpMjFBoPVB4njNPEK
         Ru8d1p+WsbAw1rup0ukzOB68j0hywhOXe9pTdsrYZAXWclzwpSDqYV+Q4yb1EDeoJeFT
         flpw==
X-Gm-Message-State: AOAM5331Ffg+jzU5cNMcVKO6OX00JbAGxTW/qw+LcpZGBH+B5Hz4k1cr
        kvNnSyV5AerenQNkbvPmhlw=
X-Google-Smtp-Source: ABdhPJzpc2ODpSdHq6pKS8mPRQRDsAam5qYfUiPGgQcAwXLasCiRcuCn2c/ftHeYaYOIMjNbsRkfbw==
X-Received: by 2002:a05:600c:3588:: with SMTP id p8mr5470389wmq.71.1614712582548;
        Tue, 02 Mar 2021 11:16:22 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:19 -0800 (PST)
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
Subject: [PATCH v2 02/12] pinctrl: add a pincontrol driver for BCM6328
Date:   Tue,  2 Mar 2021 20:16:03 +0100
Message-Id: <20210302191613.29476-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
GPIOs, as LEDs for the integrated LED controller, or various other
functions. Its pincontrol mux registers also control other aspects, like
switching the second USB port between host and device mode.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v2: switch to GPIO_REGMAP

 drivers/pinctrl/bcm/Kconfig           |  13 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6328.c | 481 ++++++++++++++++++++++++++
 3 files changed, 495 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6328.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 0ed14de0134c..76728f097c25 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -29,6 +29,19 @@ config PINCTRL_BCM2835
 	help
 	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
+config PINCTRL_BCM6328
+	bool "Broadcom BCM6328 GPIO driver"
+	depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
+	select GPIO_REGMAP
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6328 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 79d5e49fdd9a..7e7c6e25b26d 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -3,6 +3,7 @@
 
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
+obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
new file mode 100644
index 000000000000..f2b1a14e7903
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
@@ -0,0 +1,481 @@
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
+#define MODULE_NAME		"bcm6328-pinctrl"
+#define BCM6328_BANK_GPIOS	32
+#define BCM6328_NUM_GPIOS	32
+
+#define BCM6328_DIROUT_REG	0x04
+#define BCM6328_DATA_REG	0x0c
+#define BCM6328_MODE_REG	0x18
+#define BCM6328_MUX_HI_REG	0x1c
+#define BCM6328_MUX_LO_REG	0x20
+#define BCM6328_MUX_OTHER_REG	0x24
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
+struct bcm6328_pinctrl {
+	struct device *dev;
+	struct regmap *regs;
+
+	struct pinctrl_dev *pctl_dev;
+	struct pinctrl_desc pctl_desc;
+	struct pinctrl_gpio_range gpio_range;
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
+static int bcm6328_reg_mask_xlate(struct gpio_regmap *gpio,
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
+static inline unsigned int bcm6328_mux_off(unsigned int pin)
+{
+	static const unsigned int bcm6328_mux[] = {
+		BCM6328_MUX_LO_REG,
+		BCM6328_MUX_HI_REG,
+		BCM6328_MUX_OTHER_REG
+	};
+
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
+static void bcm6328_rmw_mux(struct bcm6328_pinctrl *pc, unsigned pin,
+			    unsigned int mode, unsigned int mux)
+{
+	if (pin < BCM6328_NUM_GPIOS)
+		regmap_update_bits(pc->regs, BCM6328_MODE_REG, BIT(pin),
+				   mode ? BIT(pin) : 0);
+
+	regmap_update_bits(pc->regs, bcm6328_mux_off(pin),
+			   3UL << ((pin % 16) * 2),
+			   mux << ((pin % 16) * 2));
+}
+
+static int bcm6328_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				   unsigned selector, unsigned group)
+{
+	struct bcm6328_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
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
+	struct bcm6328_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable all functions using this pin */
+	bcm6328_rmw_mux(pc, offset, 0, 0);
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm6328_pctl_ops = {
+	.get_groups_count = bcm6328_pinctrl_get_group_count,
+	.get_group_name = bcm6328_pinctrl_get_group_name,
+	.get_group_pins = bcm6328_pinctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static struct pinmux_ops bcm6328_pmx_ops = {
+	.get_functions_count = bcm6328_pinctrl_get_func_count,
+	.get_function_name = bcm6328_pinctrl_get_func_name,
+	.get_function_groups = bcm6328_pinctrl_get_groups,
+	.set_mux = bcm6328_pinctrl_set_mux,
+	.gpio_request_enable = bcm6328_gpio_request_enable,
+	.strict = true,
+};
+
+static int bcm6328_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_regmap_config grc = {0};
+	struct gpio_regmap *gr;
+	struct bcm6328_pinctrl *pc;
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
+	grc.parent = dev;
+	grc.ngpio = BCM6328_NUM_GPIOS;
+	grc.ngpio_per_reg = BCM6328_BANK_GPIOS;
+	grc.regmap = pc->regs;
+	grc.reg_dat_base = BCM6328_DATA_REG;
+	grc.reg_dir_out_base = BCM6328_DIROUT_REG;
+	grc.reg_mask_xlate = bcm6328_reg_mask_xlate;
+	grc.reg_set_base = BCM6328_DATA_REG;
+	grc.reg_stride = 4;
+
+	gr = devm_gpio_regmap_register(dev, &grc);
+	err = PTR_ERR_OR_ZERO(gr);
+	if (err) {
+		dev_err(dev, "could not add GPIO chip\n");
+		return err;
+	}
+
+	pc->pctl_desc.name = MODULE_NAME;
+	pc->pctl_desc.pins = bcm6328_pins;
+	pc->pctl_desc.npins = ARRAY_SIZE(bcm6328_pins);
+	pc->pctl_desc.pctlops = &bcm6328_pctl_ops;
+	pc->pctl_desc.pmxops = &bcm6328_pmx_ops;
+	pc->pctl_desc.owner = THIS_MODULE;
+
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev)) {
+		gpiochip_remove(&gr->gpio_chip);
+		return PTR_ERR(pc->pctl_dev);
+	}
+
+	pc->gpio_range.name = MODULE_NAME;
+	pc->gpio_range.npins = BCM6328_NUM_GPIOS;
+	pc->gpio_range.base = gr->gpio_chip.base;
+	pc->gpio_range.gc = &gr->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	dev_info(dev, "registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id bcm6328_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6328-pinctrl", },
+	{ },
+};
+
+static struct platform_driver bcm6328_pinctrl_driver = {
+	.probe = bcm6328_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = bcm6328_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6328_pinctrl_driver);
-- 
2.20.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8501A32AD39
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384025AbhCBV3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835601AbhCBTSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:21 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9739FC061221;
        Tue,  2 Mar 2021 11:16:38 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k66so3870180wmf.1;
        Tue, 02 Mar 2021 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9g18y6rUbmgQN73zrWbDakRN4uzwWTttdlEQiTdCWIY=;
        b=TijzGVohdT2ShD/XWU6SNQWwcvb0yJq0qjAQ/FTMThGBv5J676/Dazy5hbhl4akNMj
         lMHkDeVuWtjhxs/Dl+0mXbCJYUgEkGrKKto3+IHdxscyU4adFCcfMCkMw+mS6C8gBBDh
         Nie96kRKoJfKsz1RTQ3EXJTYm0bHlOpALUlJAwBiI8Zy/pjhr8pGIehDomMKbu6twy8n
         qnk95hClv07OskwRzxEkSwnMBVK7WRGzJWoJ745rGkKkcl30Y2tx8v5OWfh99/WC9/or
         LA77/MpsPnEacHmLEphS6tkckidJvhRSsMtaP4UvWHCCb/SdI6+ObvVIRYdGTLpTeRgo
         6o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9g18y6rUbmgQN73zrWbDakRN4uzwWTttdlEQiTdCWIY=;
        b=LZJY93F44btzgFKGYT5IOZsgBrSmhoD3O1wa+Hvoz2TF3pRDfsktztSAN82oc80bVV
         WQMk5bV0oGE101uWQRPC6OAxZIKFipTzTGoIcv1XOvoM33QoOmEBQtwSBgFbfnqCK5cT
         VbmqvIOO5Z4a42DQ0U3p8YI6za0wE4dda2F0pJdmPz1IAWmHNxGnB6BCYMxFREQTpBn2
         REU1meSIFViDVZXtTzdsLHPb9z90oQlWbJuiIWtxlUDCwQfeS/u4zzg5N3JJymSKDOoT
         pPZ6FAcLM6LcexaxZRUaQ546H/9DzJ1v7dQmUdX2j5BdX/UG+SYzeYg9oI5BriRnXBnU
         v5zQ==
X-Gm-Message-State: AOAM530f3vSUUz/5A3TMhpTl9X0XXHe44QiYY5RJ+K3jycvb37fYMlkc
        SilFuHBqNmqHshtCSS+3Hcc=
X-Google-Smtp-Source: ABdhPJwaIe06xnVVyju3iT9ft2aiMHy90Q9LUpZzjpmZXxYduEu7UGR7Nt3P3vyrBDlFJw78vBIfPQ==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr5430702wmg.53.1614712597202;
        Tue, 02 Mar 2021 11:16:37 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:36 -0800 (PST)
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
Subject: [PATCH v2 08/12] pinctrl: add a pincontrol driver for BCM6368
Date:   Tue,  2 Mar 2021 20:16:09 +0100
Message-Id: <20210302191613.29476-9-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincontrol driver for BCM6368. BCM6368 allows muxing the first 32
GPIOs onto alternative functions. Not all are documented.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v2: switch to GPIO_REGMAP

 drivers/pinctrl/bcm/Kconfig           |  11 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6368.c | 587 ++++++++++++++++++++++++++
 3 files changed, 599 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6368.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 3dcceba17cd1..3c8e1f6f7bcd 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -64,6 +64,17 @@ config PINCTRL_BCM6362
 	help
 	   Say Y here to enable the Broadcom BCM6362 GPIO driver.
 
+config PINCTRL_BCM6368
+	bool "Broadcom BCM6368 GPIO driver"
+	depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select MFD_SYSCON
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6368 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 0ade52a390cb..2d9c99a41c51 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
+obj-$(CONFIG_PINCTRL_BCM6368)		+= pinctrl-bcm6368.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6368.c b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
new file mode 100644
index 000000000000..2c19d9e73230
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
@@ -0,0 +1,587 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM6368 GPIO unit (pinctrl + GPIO)
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
+#define MODULE_NAME		"bcm6368-pinctrl"
+#define BCM6368_BANK_GPIOS	32
+#define BCM6368_NUM_GPIOS	38
+
+#define BCM6368_DIROUT_REG	0x04
+#define BCM6368_DATA_REG	0x0c
+#define BCM6368_MODE_REG	0x18
+#define BCM6368_BASEMODE_REG	0x38
+#define  BCM6368_BASEMODE_MASK	0x7
+#define  BCM6368_BASEMODE_GPIO	0x0
+#define  BCM6368_BASEMODE_UART1	0x1
+
+struct bcm6368_pingroup {
+	const char *name;
+	const unsigned * const pins;
+	const unsigned num_pins;
+};
+
+struct bcm6368_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned num_groups;
+
+	unsigned dir_out:16;
+	unsigned basemode:3;
+};
+
+struct bcm6368_pinctrl {
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
+#define BCM6368_BASEMODE_PIN(a, b)		\
+	{					\
+		.number = a,			\
+		.name = b,			\
+		.drv_data = (void *)true	\
+	}
+
+static const struct pinctrl_pin_desc bcm6368_pins[] = {
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
+	BCM6368_BASEMODE_PIN(30, "gpio30"),
+	BCM6368_BASEMODE_PIN(31, "gpio31"),
+	BCM6368_BASEMODE_PIN(32, "gpio32"),
+	BCM6368_BASEMODE_PIN(33, "gpio33"),
+	PINCTRL_PIN(34, "gpio34"),
+	PINCTRL_PIN(35, "gpio35"),
+	PINCTRL_PIN(36, "gpio36"),
+	PINCTRL_PIN(37, "gpio37"),
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
+static unsigned uart1_grp_pins[] = { 30, 31, 32, 33 };
+
+#define BCM6368_GROUP(n)				\
+	{						\
+		.name = #n,				\
+		.pins = n##_pins,			\
+		.num_pins = ARRAY_SIZE(n##_pins),	\
+	}
+
+static struct bcm6368_pingroup bcm6368_groups[] = {
+	BCM6368_GROUP(gpio0),
+	BCM6368_GROUP(gpio1),
+	BCM6368_GROUP(gpio2),
+	BCM6368_GROUP(gpio3),
+	BCM6368_GROUP(gpio4),
+	BCM6368_GROUP(gpio5),
+	BCM6368_GROUP(gpio6),
+	BCM6368_GROUP(gpio7),
+	BCM6368_GROUP(gpio8),
+	BCM6368_GROUP(gpio9),
+	BCM6368_GROUP(gpio10),
+	BCM6368_GROUP(gpio11),
+	BCM6368_GROUP(gpio12),
+	BCM6368_GROUP(gpio13),
+	BCM6368_GROUP(gpio14),
+	BCM6368_GROUP(gpio15),
+	BCM6368_GROUP(gpio16),
+	BCM6368_GROUP(gpio17),
+	BCM6368_GROUP(gpio18),
+	BCM6368_GROUP(gpio19),
+	BCM6368_GROUP(gpio20),
+	BCM6368_GROUP(gpio21),
+	BCM6368_GROUP(gpio22),
+	BCM6368_GROUP(gpio23),
+	BCM6368_GROUP(gpio24),
+	BCM6368_GROUP(gpio25),
+	BCM6368_GROUP(gpio26),
+	BCM6368_GROUP(gpio27),
+	BCM6368_GROUP(gpio28),
+	BCM6368_GROUP(gpio29),
+	BCM6368_GROUP(gpio30),
+	BCM6368_GROUP(gpio31),
+	BCM6368_GROUP(uart1_grp),
+};
+
+static const char * const analog_afe_0_groups[] = {
+	"gpio0",
+};
+
+static const char * const analog_afe_1_groups[] = {
+	"gpio1",
+};
+
+static const char * const sys_irq_groups[] = {
+	"gpio2",
+};
+
+static const char * const serial_led_data_groups[] = {
+	"gpio3",
+};
+
+static const char * const serial_led_clk_groups[] = {
+	"gpio4",
+};
+
+static const char * const inet_led_groups[] = {
+	"gpio5",
+};
+
+static const char * const ephy0_led_groups[] = {
+	"gpio6",
+};
+
+static const char * const ephy1_led_groups[] = {
+	"gpio7",
+};
+
+static const char * const ephy2_led_groups[] = {
+	"gpio8",
+};
+
+static const char * const ephy3_led_groups[] = {
+	"gpio9",
+};
+
+static const char * const robosw_led_data_groups[] = {
+	"gpio10",
+};
+
+static const char * const robosw_led_clk_groups[] = {
+	"gpio11",
+};
+
+static const char * const robosw_led0_groups[] = {
+	"gpio12",
+};
+
+static const char * const robosw_led1_groups[] = {
+	"gpio13",
+};
+
+static const char * const usb_device_led_groups[] = {
+	"gpio14",
+};
+
+static const char * const pci_req1_groups[] = {
+	"gpio16",
+};
+
+static const char * const pci_gnt1_groups[] = {
+	"gpio17",
+};
+
+static const char * const pci_intb_groups[] = {
+	"gpio18",
+};
+
+static const char * const pci_req0_groups[] = {
+	"gpio19",
+};
+
+static const char * const pci_gnt0_groups[] = {
+	"gpio20",
+};
+
+static const char * const pcmcia_cd1_groups[] = {
+	"gpio22",
+};
+
+static const char * const pcmcia_cd2_groups[] = {
+	"gpio23",
+};
+
+static const char * const pcmcia_vs1_groups[] = {
+	"gpio24",
+};
+
+static const char * const pcmcia_vs2_groups[] = {
+	"gpio25",
+};
+
+static const char * const ebi_cs2_groups[] = {
+	"gpio26",
+};
+
+static const char * const ebi_cs3_groups[] = {
+	"gpio27",
+};
+
+static const char * const spi_cs2_groups[] = {
+	"gpio28",
+};
+
+static const char * const spi_cs3_groups[] = {
+	"gpio29",
+};
+
+static const char * const spi_cs4_groups[] = {
+	"gpio30",
+};
+
+static const char * const spi_cs5_groups[] = {
+	"gpio31",
+};
+
+static const char * const uart1_groups[] = {
+	"uart1_grp",
+};
+
+#define BCM6368_FUN(n, out)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.dir_out = out,				\
+	}
+
+#define BCM6368_BASEMODE_FUN(n, val, out)		\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.basemode = BCM6368_BASEMODE_##val,	\
+		.dir_out = out,				\
+	}
+
+static const struct bcm6368_function bcm6368_funcs[] = {
+	BCM6368_FUN(analog_afe_0, 1),
+	BCM6368_FUN(analog_afe_1, 1),
+	BCM6368_FUN(sys_irq, 1),
+	BCM6368_FUN(serial_led_data, 1),
+	BCM6368_FUN(serial_led_clk, 1),
+	BCM6368_FUN(inet_led, 1),
+	BCM6368_FUN(ephy0_led, 1),
+	BCM6368_FUN(ephy1_led, 1),
+	BCM6368_FUN(ephy2_led, 1),
+	BCM6368_FUN(ephy3_led, 1),
+	BCM6368_FUN(robosw_led_data, 1),
+	BCM6368_FUN(robosw_led_clk, 1),
+	BCM6368_FUN(robosw_led0, 1),
+	BCM6368_FUN(robosw_led1, 1),
+	BCM6368_FUN(usb_device_led, 1),
+	BCM6368_FUN(pci_req1, 0),
+	BCM6368_FUN(pci_gnt1, 0),
+	BCM6368_FUN(pci_intb, 0),
+	BCM6368_FUN(pci_req0, 0),
+	BCM6368_FUN(pci_gnt0, 0),
+	BCM6368_FUN(pcmcia_cd1, 0),
+	BCM6368_FUN(pcmcia_cd2, 0),
+	BCM6368_FUN(pcmcia_vs1, 0),
+	BCM6368_FUN(pcmcia_vs2, 0),
+	BCM6368_FUN(ebi_cs2, 1),
+	BCM6368_FUN(ebi_cs3, 1),
+	BCM6368_FUN(spi_cs2, 1),
+	BCM6368_FUN(spi_cs3, 1),
+	BCM6368_FUN(spi_cs4, 1),
+	BCM6368_FUN(spi_cs5, 1),
+	BCM6368_BASEMODE_FUN(uart1, UART1, 0x6),
+};
+
+static inline unsigned int bcm6368_bank_pin(unsigned int pin)
+{
+	return pin % BCM6368_BANK_GPIOS;
+}
+
+static int bcm6368_reg_mask_xlate(struct gpio_regmap *gpio,
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
+static int bcm6368_pinctrl_get_group_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6368_groups);
+}
+
+static const char *bcm6368_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						  unsigned group)
+{
+	return bcm6368_groups[group].name;
+}
+
+static int bcm6368_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					  unsigned group, const unsigned **pins,
+					  unsigned *num_pins)
+{
+	*pins = bcm6368_groups[group].pins;
+	*num_pins = bcm6368_groups[group].num_pins;
+
+	return 0;
+}
+
+static int bcm6368_pinctrl_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6368_funcs);
+}
+
+static const char *bcm6368_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
+						 unsigned selector)
+{
+	return bcm6368_funcs[selector].name;
+}
+
+static int bcm6368_pinctrl_get_groups(struct pinctrl_dev *pctldev,
+				      unsigned selector,
+				      const char * const **groups,
+				      unsigned * const num_groups)
+{
+	*groups = bcm6368_funcs[selector].groups;
+	*num_groups = bcm6368_funcs[selector].num_groups;
+
+	return 0;
+}
+
+static int bcm6368_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				   unsigned selector, unsigned group)
+{
+	struct bcm6368_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm6368_pingroup *pg = &bcm6368_groups[group];
+	const struct bcm6368_function *fun = &bcm6368_funcs[selector];
+	int i, pin;
+
+	if (fun->basemode) {
+		unsigned int mask = 0;
+
+		for (i = 0; i < pg->num_pins; i++) {
+			pin = pg->pins[i];
+			if (pin < BCM6368_BANK_GPIOS)
+				mask |= BIT(pin);
+		}
+
+		regmap_update_bits(pc->regs, BCM6368_MODE_REG, mask, 0);
+		regmap_field_write(pc->overlays, fun->basemode);
+	} else {
+		pin = pg->pins[0];
+
+		if (bcm6368_pins[pin].drv_data)
+			regmap_field_write(pc->overlays,
+					   BCM6368_BASEMODE_GPIO);
+
+		regmap_update_bits(pc->regs, BCM6368_MODE_REG, BIT(pin),
+				   BIT(pin));
+	}
+
+	for (pin = 0; pin < pg->num_pins; pin++) {
+		int hw_gpio = bcm6368_pins[pin].number;
+		struct gpio_chip *gc = pc->gpio_chip;
+
+		if (fun->dir_out & BIT(pin))
+			gc->direction_output(gc, hw_gpio, 0);
+		else
+			gc->direction_input(gc, hw_gpio);
+	}
+
+	return 0;
+}
+
+static int bcm6368_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm6368_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	if (offset >= BCM6368_BANK_GPIOS && !bcm6368_pins[offset].drv_data)
+		return 0;
+
+	/* disable all functions using this pin */
+	if (offset < BCM6368_BANK_GPIOS)
+		regmap_update_bits(pc->regs, BCM6368_MODE_REG, BIT(offset), 0);
+
+	if (bcm6368_pins[offset].drv_data)
+		regmap_field_write(pc->overlays, BCM6368_BASEMODE_GPIO);
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm6368_pctl_ops = {
+	.get_groups_count = bcm6368_pinctrl_get_group_count,
+	.get_group_name = bcm6368_pinctrl_get_group_name,
+	.get_group_pins = bcm6368_pinctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static struct pinmux_ops bcm6368_pmx_ops = {
+	.get_functions_count = bcm6368_pinctrl_get_func_count,
+	.get_function_name = bcm6368_pinctrl_get_func_name,
+	.get_function_groups = bcm6368_pinctrl_get_groups,
+	.set_mux = bcm6368_pinctrl_set_mux,
+	.gpio_request_enable = bcm6368_gpio_request_enable,
+	.strict = true,
+};
+
+static int bcm6368_pinctrl_probe(struct platform_device *pdev)
+{
+	struct reg_field overlays = REG_FIELD(BCM6368_BASEMODE_REG, 0, 15);
+	struct device *dev = &pdev->dev;
+	struct gpio_regmap_config grc = {0};
+	struct gpio_regmap *gr;
+	struct bcm6368_pinctrl *pc;
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
+	pc->overlays = devm_regmap_field_alloc(dev, pc->regs, overlays);
+	if (IS_ERR(pc->overlays))
+		return PTR_ERR(pc->overlays);
+
+	/* disable all muxes by default */
+	regmap_field_write(pc->overlays, 0);
+
+	grc.parent = dev;
+	grc.ngpio = BCM6368_NUM_GPIOS;
+	grc.ngpio_per_reg = BCM6368_BANK_GPIOS;
+	grc.regmap = pc->regs;
+	grc.reg_dat_base = BCM6368_DATA_REG;
+	grc.reg_dir_out_base = BCM6368_DIROUT_REG;
+	grc.reg_mask_xlate = bcm6368_reg_mask_xlate;
+	grc.reg_set_base = BCM6368_DATA_REG;
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
+	pc->pctl_desc.name = MODULE_NAME,
+	pc->pctl_desc.pins = bcm6368_pins,
+	pc->pctl_desc.npins = ARRAY_SIZE(bcm6368_pins),
+	pc->pctl_desc.pctlops = &bcm6368_pctl_ops,
+	pc->pctl_desc.pmxops = &bcm6368_pmx_ops,
+	pc->pctl_desc.owner = THIS_MODULE,
+
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev)) {
+		gpiochip_remove(&gr->gpio_chip);
+		return PTR_ERR(pc->pctl_dev);
+	}
+
+	pc->gpio_range.name = MODULE_NAME;
+	pc->gpio_range.npins = BCM6368_NUM_GPIOS;
+	pc->gpio_range.base = gr->gpio_chip.base;
+	pc->gpio_range.gc = &gr->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	dev_info(dev, "registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id bcm6368_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6368-pinctrl", },
+	{ },
+};
+
+static struct platform_driver bcm6368_pinctrl_driver = {
+	.probe = bcm6368_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = bcm6368_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6368_pinctrl_driver);
-- 
2.20.1


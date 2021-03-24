Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DCF34736A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236121AbhCXIUW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233580AbhCXITo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:44 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688FCC0613DC;
        Wed, 24 Mar 2021 01:19:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id y124-20020a1c32820000b029010c93864955so630564wmy.5;
        Wed, 24 Mar 2021 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nBekn0zB4O7mrv13ZxVYMfLLI+quIkOdXbfpsLxsNSc=;
        b=Jjuqp/jOipLUburufXtKsHyTfXOell+WNZo+9iMRdjCmU9VHkQwAZrvNbSq3ksGWff
         1KIp2Y89iqVH/5Fd87/3MVEdgRriMNqNncX3oZcXgkoO/19Nwj1mg3Wq81L+C2JD8Msh
         XgeH2R19rn3qz9s9+tuej23XipOnfjkj7tqfIyhdvSuhgi08HU9iT98F29dtcheUblvi
         WTbOjtmw81fj2xPW8GkvI6PJZAFpi62FlcWSr/jXh77E1OmEwRjWA9XI0b1EVlPD1Jgm
         Ji6ojf0Up4PisXGsVJSYhmkm6fCVpg3vMQK2s2AhF8odt97bQHDEUfUOdZJx1NKQyK9m
         6PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nBekn0zB4O7mrv13ZxVYMfLLI+quIkOdXbfpsLxsNSc=;
        b=W6oq/iGPFr3tZpEeYzrZI0koH/Ii6nJmSIiXEtVq1yOrasJ2AOebY29RQL0gXkyYZJ
         cT0P7X8fOLcKyqpCSqhJ47O1Ghga/WLIJwLN8Ej1v5oO6orZXh0hnbMymFFUczpKt7pl
         l9vF4WgTA0OB88DXlROfgtuXGcP2NNvsm09L3gGEksGysvOTmmNFQlBbAsyedDQyIWDL
         s7v/YCfZ3FG+BUv4cnOZjw+/EA+9JyVUtr7lv+WWn+dd9lhjp22+02B5bF25JCQjkfrK
         BfjESlAx2lw4UJPSafoAM+YjfbUf4QyJtlaiXmNkgE2a53EaicZttkmAVx51MR2+aKWW
         avzw==
X-Gm-Message-State: AOAM531RkXDXwh67k3ooCSThDzC2jwE8XDMJXZqcg6WfstoBvA4cyeZn
        k3XPsXIEd4mJ/L38mgR0Fbc=
X-Google-Smtp-Source: ABdhPJzRrBBvfBaZdEHKiLtOz47i9pizukZpmTA1FggYs9X0vBnL9/g38DDj2kmToKFCtp68hOMPYA==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr1719018wmb.84.1616573982070;
        Wed, 24 Mar 2021 01:19:42 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:41 -0700 (PDT)
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
Subject: [PATCH v9 16/22] pinctrl: add a pincontrol driver for BCM6368
Date:   Wed, 24 Mar 2021 09:19:17 +0100
Message-Id: <20210324081923.20379-17-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincontrol driver for BCM6368. BCM6368 allows muxing the first 32
GPIOs onto alternative functions. Not all are documented.

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
 drivers/pinctrl/bcm/pinctrl-bcm6368.c | 523 ++++++++++++++++++++++++++
 3 files changed, 532 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6368.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index d3101d5e750f..aabd4b762aed 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -60,6 +60,14 @@ config PINCTRL_BCM6362
 	help
 	   Say Y here to enable the Broadcom BCM6362 GPIO driver.
 
+config PINCTRL_BCM6368
+	bool "Broadcom BCM6368 GPIO driver"
+	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	select PINCTRL_BCM63XX
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6368 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index b9b09e5b914c..a1331bb9680e 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
+obj-$(CONFIG_PINCTRL_BCM6368)		+= pinctrl-bcm6368.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6368.c b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
new file mode 100644
index 000000000000..838095f9e890
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6368.c
@@ -0,0 +1,523 @@
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
+#define BCM6368_NUM_GPIOS	38
+
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
+struct bcm6368_priv {
+	struct regmap_field *overlays;
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
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	struct bcm6368_priv *priv = pc->driver_data;
+	const struct bcm6368_pingroup *pg = &bcm6368_groups[group];
+	const struct bcm6368_function *fun = &bcm6368_funcs[selector];
+	int i, pin;
+
+	if (fun->basemode) {
+		unsigned int mask = 0;
+
+		for (i = 0; i < pg->num_pins; i++) {
+			pin = pg->pins[i];
+			if (pin < BCM63XX_BANK_GPIOS)
+				mask |= BIT(pin);
+		}
+
+		regmap_update_bits(pc->regs, BCM6368_MODE_REG, mask, 0);
+		regmap_field_write(priv->overlays, fun->basemode);
+	} else {
+		pin = pg->pins[0];
+
+		if (bcm6368_pins[pin].drv_data)
+			regmap_field_write(priv->overlays,
+					   BCM6368_BASEMODE_GPIO);
+
+		regmap_update_bits(pc->regs, BCM6368_MODE_REG, BIT(pin),
+				   BIT(pin));
+	}
+
+	for (pin = 0; pin < pg->num_pins; pin++) {
+		struct pinctrl_gpio_range *range;
+		int hw_gpio = bcm6368_pins[pin].number;
+
+		range = pinctrl_find_gpio_range_from_pin(pctldev, hw_gpio);
+		if (range) {
+			struct gpio_chip *gc = range->gc;
+
+			if (fun->dir_out & BIT(pin))
+				gc->direction_output(gc, hw_gpio, 0);
+			else
+				gc->direction_input(gc, hw_gpio);
+		}
+	}
+
+	return 0;
+}
+
+static int bcm6368_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	struct bcm6368_priv *priv = pc->driver_data;
+
+	if (offset >= BCM63XX_BANK_GPIOS && !bcm6368_pins[offset].drv_data)
+		return 0;
+
+	/* disable all functions using this pin */
+	if (offset < BCM63XX_BANK_GPIOS)
+		regmap_update_bits(pc->regs, BCM6368_MODE_REG, BIT(offset), 0);
+
+	if (bcm6368_pins[offset].drv_data)
+		regmap_field_write(priv->overlays, BCM6368_BASEMODE_GPIO);
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm6368_pctl_ops = {
+	.dt_free_map = pinctrl_utils_free_map,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.get_group_name = bcm6368_pinctrl_get_group_name,
+	.get_group_pins = bcm6368_pinctrl_get_group_pins,
+	.get_groups_count = bcm6368_pinctrl_get_group_count,
+};
+
+static struct pinmux_ops bcm6368_pmx_ops = {
+	.get_function_groups = bcm6368_pinctrl_get_groups,
+	.get_function_name = bcm6368_pinctrl_get_func_name,
+	.get_functions_count = bcm6368_pinctrl_get_func_count,
+	.gpio_request_enable = bcm6368_gpio_request_enable,
+	.set_mux = bcm6368_pinctrl_set_mux,
+	.strict = true,
+};
+
+static const struct bcm63xx_pinctrl_soc bcm6368_soc = {
+	.ngpios = BCM6368_NUM_GPIOS,
+	.npins = ARRAY_SIZE(bcm6368_pins),
+	.pctl_ops = &bcm6368_pctl_ops,
+	.pins = bcm6368_pins,
+	.pmx_ops = &bcm6368_pmx_ops,
+};
+
+static int bcm6368_pinctrl_probe(struct platform_device *pdev)
+{
+	struct reg_field overlays = REG_FIELD(BCM6368_BASEMODE_REG, 0, 15);
+	struct device *dev = &pdev->dev;
+	struct bcm63xx_pinctrl *pc;
+	struct bcm6368_priv *priv;
+	int err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	err = bcm63xx_pinctrl_probe(pdev, &bcm6368_soc, (void *) priv);
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
+static const struct of_device_id bcm6368_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6368-pinctrl", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver bcm6368_pinctrl_driver = {
+	.probe = bcm6368_pinctrl_probe,
+	.driver = {
+		.name = "bcm6368-pinctrl",
+		.of_match_table = bcm6368_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6368_pinctrl_driver);
-- 
2.20.1


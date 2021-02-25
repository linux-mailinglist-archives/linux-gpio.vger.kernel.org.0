Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B393253C3
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBYQoL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbhBYQnn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:43 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63F7C06178B;
        Thu, 25 Feb 2021 08:42:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g11so1442087wmh.1;
        Thu, 25 Feb 2021 08:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p3etVA4sTuJ3ARxwbMgB9mJU+LSE6+0VAGujoTLmmlk=;
        b=l6/kbEzBM1zO1fiDRCI4TEiXRrdbb/ITG8dlnV2dPlGFdS+1hyILZJdn5upCFS+E3W
         nLhVRt2U9pKigqgvFXRK8mKY6Lz6Z1QtLvubLgoon+8ldbHm7j9AyJuinp76J5TWZM1g
         78l+0WUDkoOyZRDKz9FUmlAuzfhE6urnVm+GSqCMCeAyKMB+wLZlyUDvgAymT0CbKUxX
         JtDtAC2X+xqmY8NU/8uXRLrfIm9PjtC9kSeYNJ5DrY+Du7oQll08TcK/int3nLeRv56O
         IaRaVw5yjKClEKCcYuPBMoU4BtwwTy0v5yMT8hSvUnwe8+rbqMxIyGB3mQfzi73RrOOT
         wSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3etVA4sTuJ3ARxwbMgB9mJU+LSE6+0VAGujoTLmmlk=;
        b=Hg6m8vV+w3/VTzPDrTW/NxddOmNIgs73V0UQnZWf13dEmaz6jBqd2m/a1tNiPOi6qJ
         dX/jNlsRogfjHRlwA+YtpvUMEQogSAYnMr7mqzB1xs8aGRNYSFm/dEpURvkwBWQbUFLJ
         RIuXCD/+sEmQ56U5jW5/iPG0dPZCVSxTfLI2FQFHN+coiGON2fMv4+Zy+XV+DVgo6CbG
         yGCACSUrzhE1qZnTE4LOvO3dqWrhtmW8IjOIe3jczF2SHO5sGLJjNtFoI14IHL5t//Lx
         vewAFK/NKIgKxqBlhp2LX1ws0+XTQXKMRpEI+Dhm77SNAt6lz6+iHhoo3akYf5Aw7IUD
         gNkQ==
X-Gm-Message-State: AOAM530sJM2OKKXbCiKK9TAnULAdKfGHBj3iY6sH3jarJSNBW7Q1mu7b
        TGf03oal6HjnrmSxJufrDp8=
X-Google-Smtp-Source: ABdhPJz8xJ/HWTvx0ILRsBJecWAaxTw1Fn/Vm4iMT3Ew+NOcwweocL92LOP/aAvt62qYqY+jONpuUg==
X-Received: by 2002:a7b:c18b:: with SMTP id y11mr4023375wmi.132.1614271344478;
        Thu, 25 Feb 2021 08:42:24 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:24 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] pinctrl: add a pincontrol driver for BCM6362
Date:   Thu, 25 Feb 2021 17:42:10 +0100
Message-Id: <20210225164216.21124-7-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225164216.21124-1-noltari@gmail.com>
References: <20210225164216.21124-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincotrol driver for BCM6362. BCM6362 allows muxing individual
GPIO pins to the LED controller, to be available by the integrated
wifi, or other functions. It also supports overlay groups, of which
only NAND is documented.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig           |  11 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6362.c | 794 ++++++++++++++++++++++++++
 3 files changed, 806 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6362.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index dd82a34125ed..44517f6407cf 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -51,6 +51,17 @@ config PINCTRL_BCM6358
 	help
 	   Say Y here to enable the Broadcom BCM6358 GPIO driver.
 
+config PINCTRL_BCM6362
+	bool "Broadcom BCM6362 GPIO driver"
+	depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select MFD_SYSCON
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6362 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 794d07d97754..0ade52a390cb 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
+obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
new file mode 100644
index 000000000000..4a34de17ed74
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
@@ -0,0 +1,794 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM6362 GPIO unit (pinctrl + GPIO)
+ *
+ * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
+ * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
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
+#define MODULE_NAME		"bcm6362-pinctrl"
+#define BCM6362_NUM_GPIOS	48
+#define BCM6362_NUM_LEDS	24
+
+#define BANK_SIZE		sizeof(uint32_t)
+#define PINS_PER_BANK		(BANK_SIZE * BITS_PER_BYTE)
+
+#define BCM6362_DIROUT_REG	0x04
+#define BCM6362_DATA_REG	0x0c
+#define BCM6362_LED_REG		0x10
+#define BCM6362_MODE_REG	0x18
+#define BCM6362_CTRL_REG	0x1c
+#define BCM6362_BASEMODE_REG	0x38
+#define  BASEMODE_NAND		BIT(2)
+
+enum bcm6362_pinctrl_reg {
+	BCM6362_LEDCTRL,
+	BCM6362_MODE,
+	BCM6362_CTRL,
+	BCM6362_BASEMODE,
+};
+
+struct bcm6362_pingroup {
+	const char *name;
+	const unsigned * const pins;
+	const unsigned num_pins;
+};
+
+struct bcm6362_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned num_groups;
+
+	enum bcm6362_pinctrl_reg reg;
+	uint32_t basemode_mask;
+};
+
+struct bcm6362_pinctrl {
+	struct device *dev;
+	struct regmap *regs;
+
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip gpio_chip;
+	struct pinctrl_desc pctl_desc;
+	struct pinctrl_gpio_range gpio_range;
+};
+
+#define BCM6362_PIN(a, b, mask)			\
+	{					\
+		.number = a,			\
+		.name = b,			\
+		.drv_data = (void *)(mask),	\
+	}
+
+static const struct pinctrl_pin_desc bcm6362_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	BCM6362_PIN(8, "gpio8", BASEMODE_NAND),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	BCM6362_PIN(12, "gpio12", BASEMODE_NAND),
+	BCM6362_PIN(13, "gpio13", BASEMODE_NAND),
+	BCM6362_PIN(14, "gpio14", BASEMODE_NAND),
+	BCM6362_PIN(15, "gpio15", BASEMODE_NAND),
+	BCM6362_PIN(16, "gpio16", BASEMODE_NAND),
+	BCM6362_PIN(17, "gpio17", BASEMODE_NAND),
+	BCM6362_PIN(18, "gpio18", BASEMODE_NAND),
+	BCM6362_PIN(19, "gpio19", BASEMODE_NAND),
+	BCM6362_PIN(20, "gpio20", BASEMODE_NAND),
+	BCM6362_PIN(21, "gpio21", BASEMODE_NAND),
+	BCM6362_PIN(22, "gpio22", BASEMODE_NAND),
+	BCM6362_PIN(23, "gpio23", BASEMODE_NAND),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	BCM6362_PIN(27, "gpio27", BASEMODE_NAND),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+	PINCTRL_PIN(32, "gpio32"),
+	PINCTRL_PIN(33, "gpio33"),
+	PINCTRL_PIN(34, "gpio34"),
+	PINCTRL_PIN(35, "gpio35"),
+	PINCTRL_PIN(36, "gpio36"),
+	PINCTRL_PIN(37, "gpio37"),
+	PINCTRL_PIN(38, "gpio38"),
+	PINCTRL_PIN(39, "gpio39"),
+	PINCTRL_PIN(40, "gpio40"),
+	PINCTRL_PIN(41, "gpio41"),
+	PINCTRL_PIN(42, "gpio42"),
+	PINCTRL_PIN(43, "gpio43"),
+	PINCTRL_PIN(44, "gpio44"),
+	PINCTRL_PIN(45, "gpio45"),
+	PINCTRL_PIN(46, "gpio46"),
+	PINCTRL_PIN(47, "gpio47"),
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
+static unsigned gpio32_pins[] = { 32 };
+static unsigned gpio33_pins[] = { 33 };
+static unsigned gpio34_pins[] = { 34 };
+static unsigned gpio35_pins[] = { 35 };
+static unsigned gpio36_pins[] = { 36 };
+static unsigned gpio37_pins[] = { 37 };
+static unsigned gpio38_pins[] = { 38 };
+static unsigned gpio39_pins[] = { 39 };
+static unsigned gpio40_pins[] = { 40 };
+static unsigned gpio41_pins[] = { 41 };
+static unsigned gpio42_pins[] = { 42 };
+static unsigned gpio43_pins[] = { 43 };
+static unsigned gpio44_pins[] = { 44 };
+static unsigned gpio45_pins[] = { 45 };
+static unsigned gpio46_pins[] = { 46 };
+static unsigned gpio47_pins[] = { 47 };
+
+static unsigned nand_grp_pins[] = {
+	8, 12, 13, 14, 15, 16, 17,
+	18, 19, 20, 21, 22, 23, 27,
+};
+
+#define BCM6362_GROUP(n)				\
+	{						\
+		.name = #n,				\
+		.pins = n##_pins,			\
+		.num_pins = ARRAY_SIZE(n##_pins),	\
+	}
+
+static struct bcm6362_pingroup bcm6362_groups[] = {
+	BCM6362_GROUP(gpio0),
+	BCM6362_GROUP(gpio1),
+	BCM6362_GROUP(gpio2),
+	BCM6362_GROUP(gpio3),
+	BCM6362_GROUP(gpio4),
+	BCM6362_GROUP(gpio5),
+	BCM6362_GROUP(gpio6),
+	BCM6362_GROUP(gpio7),
+	BCM6362_GROUP(gpio8),
+	BCM6362_GROUP(gpio9),
+	BCM6362_GROUP(gpio10),
+	BCM6362_GROUP(gpio11),
+	BCM6362_GROUP(gpio12),
+	BCM6362_GROUP(gpio13),
+	BCM6362_GROUP(gpio14),
+	BCM6362_GROUP(gpio15),
+	BCM6362_GROUP(gpio16),
+	BCM6362_GROUP(gpio17),
+	BCM6362_GROUP(gpio18),
+	BCM6362_GROUP(gpio19),
+	BCM6362_GROUP(gpio20),
+	BCM6362_GROUP(gpio21),
+	BCM6362_GROUP(gpio22),
+	BCM6362_GROUP(gpio23),
+	BCM6362_GROUP(gpio24),
+	BCM6362_GROUP(gpio25),
+	BCM6362_GROUP(gpio26),
+	BCM6362_GROUP(gpio27),
+	BCM6362_GROUP(gpio28),
+	BCM6362_GROUP(gpio29),
+	BCM6362_GROUP(gpio30),
+	BCM6362_GROUP(gpio31),
+	BCM6362_GROUP(gpio32),
+	BCM6362_GROUP(gpio33),
+	BCM6362_GROUP(gpio34),
+	BCM6362_GROUP(gpio35),
+	BCM6362_GROUP(gpio36),
+	BCM6362_GROUP(gpio37),
+	BCM6362_GROUP(gpio38),
+	BCM6362_GROUP(gpio39),
+	BCM6362_GROUP(gpio40),
+	BCM6362_GROUP(gpio41),
+	BCM6362_GROUP(gpio42),
+	BCM6362_GROUP(gpio43),
+	BCM6362_GROUP(gpio44),
+	BCM6362_GROUP(gpio45),
+	BCM6362_GROUP(gpio46),
+	BCM6362_GROUP(gpio47),
+	BCM6362_GROUP(nand_grp),
+};
+
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
+static const char * const usb_device_led_groups[] = {
+	"gpio0",
+};
+
+static const char * const sys_irq_groups[] = {
+	"gpio1",
+};
+
+static const char * const serial_led_clk_groups[] = {
+	"gpio2",
+};
+
+static const char * const serial_led_data_groups[] = {
+	"gpio3",
+};
+
+static const char * const robosw_led_data_groups[] = {
+	"gpio4",
+};
+
+static const char * const robosw_led_clk_groups[] = {
+	"gpio5",
+};
+
+static const char * const robosw_led0_groups[] = {
+	"gpio6",
+};
+
+static const char * const robosw_led1_groups[] = {
+	"gpio7",
+};
+
+static const char * const inet_led_groups[] = {
+	"gpio8",
+};
+
+static const char * const spi_cs2_groups[] = {
+	"gpio9",
+};
+
+static const char * const spi_cs3_groups[] = {
+	"gpio10",
+};
+
+static const char * const ntr_pulse_groups[] = {
+	"gpio11",
+};
+
+static const char * const uart1_scts_groups[] = {
+	"gpio12",
+};
+
+static const char * const uart1_srts_groups[] = {
+	"gpio13",
+};
+
+static const char * const uart1_sdin_groups[] = {
+	"gpio14",
+};
+
+static const char * const uart1_sdout_groups[] = {
+	"gpio15",
+};
+
+static const char * const adsl_spi_miso_groups[] = {
+	"gpio16",
+};
+
+static const char * const adsl_spi_mosi_groups[] = {
+	"gpio17",
+};
+
+static const char * const adsl_spi_clk_groups[] = {
+	"gpio18",
+};
+
+static const char * const adsl_spi_cs_groups[] = {
+	"gpio19",
+};
+
+static const char * const ephy0_led_groups[] = {
+	"gpio20",
+};
+
+static const char * const ephy1_led_groups[] = {
+	"gpio21",
+};
+
+static const char * const ephy2_led_groups[] = {
+	"gpio22",
+};
+
+static const char * const ephy3_led_groups[] = {
+	"gpio23",
+};
+
+static const char * const ext_irq0_groups[] = {
+	"gpio24",
+};
+
+static const char * const ext_irq1_groups[] = {
+	"gpio25",
+};
+
+static const char * const ext_irq2_groups[] = {
+	"gpio26",
+};
+
+static const char * const ext_irq3_groups[] = {
+	"gpio27",
+};
+
+static const char * const wifi_groups[] = {
+	"gpio32",
+	"gpio33",
+	"gpio34",
+	"gpio35",
+	"gpio36",
+	"gpio37",
+	"gpio38",
+	"gpio39",
+	"gpio40",
+	"gpio41",
+	"gpio42",
+	"gpio43",
+	"gpio44",
+	"gpio45",
+	"gpio46",
+	"gpio47",
+};
+
+static const char * const nand_groups[] = {
+	"nand_grp",
+};
+
+#define BCM6362_LED_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM6362_LEDCTRL,			\
+	}
+
+#define BCM6362_MODE_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM6362_MODE,			\
+	}
+
+#define BCM6362_CTRL_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM6362_CTRL,			\
+	}
+
+#define BCM6362_BASEMODE_FUN(n, mask)			\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM6362_BASEMODE,		\
+		.basemode_mask = (mask),		\
+	}
+
+static const struct bcm6362_function bcm6362_funcs[] = {
+	BCM6362_LED_FUN(led),
+	BCM6362_MODE_FUN(usb_device_led),
+	BCM6362_MODE_FUN(sys_irq),
+	BCM6362_MODE_FUN(serial_led_clk),
+	BCM6362_MODE_FUN(serial_led_data),
+	BCM6362_MODE_FUN(robosw_led_data),
+	BCM6362_MODE_FUN(robosw_led_clk),
+	BCM6362_MODE_FUN(robosw_led0),
+	BCM6362_MODE_FUN(robosw_led1),
+	BCM6362_MODE_FUN(inet_led),
+	BCM6362_MODE_FUN(spi_cs2),
+	BCM6362_MODE_FUN(spi_cs3),
+	BCM6362_MODE_FUN(ntr_pulse),
+	BCM6362_MODE_FUN(uart1_scts),
+	BCM6362_MODE_FUN(uart1_srts),
+	BCM6362_MODE_FUN(uart1_sdin),
+	BCM6362_MODE_FUN(uart1_sdout),
+	BCM6362_MODE_FUN(adsl_spi_miso),
+	BCM6362_MODE_FUN(adsl_spi_mosi),
+	BCM6362_MODE_FUN(adsl_spi_clk),
+	BCM6362_MODE_FUN(adsl_spi_cs),
+	BCM6362_MODE_FUN(ephy0_led),
+	BCM6362_MODE_FUN(ephy1_led),
+	BCM6362_MODE_FUN(ephy2_led),
+	BCM6362_MODE_FUN(ephy3_led),
+	BCM6362_MODE_FUN(ext_irq0),
+	BCM6362_MODE_FUN(ext_irq1),
+	BCM6362_MODE_FUN(ext_irq2),
+	BCM6362_MODE_FUN(ext_irq3),
+	BCM6362_CTRL_FUN(wifi),
+	BCM6362_BASEMODE_FUN(nand, BASEMODE_NAND),
+};
+
+static inline unsigned int bcm6362_bank_pin(unsigned int pin)
+{
+	return pin % PINS_PER_BANK;
+}
+
+static inline unsigned int bcm6362_reg_off(unsigned int reg, unsigned int pin)
+{
+	return reg - (pin / PINS_PER_BANK) * BANK_SIZE;
+}
+
+static int bcm6362_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int pin)
+{
+	struct bcm6362_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int dirout = bcm6362_reg_off(BCM6362_DIROUT_REG, pin);
+	unsigned int bank_pin = bcm6362_bank_pin(pin);
+	int ret;
+
+	/*
+	 * Check with the pinctrl driver whether this pin is usable as
+	 * an input GPIO
+	 */
+	ret = pinctrl_gpio_direction_input(chip->base + pin);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(pc->regs, dirout, BIT(bank_pin), 0);
+
+	return 0;
+}
+
+static int bcm6362_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned int pin, int value)
+{
+	struct bcm6362_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int data = bcm6362_reg_off(BCM6362_DATA_REG, pin);
+	unsigned int dirout = bcm6362_reg_off(BCM6362_DIROUT_REG, pin);
+	unsigned int bank_pin = bcm6362_bank_pin(pin);
+	unsigned int val = value ? BIT(bank_pin) : 0;
+	int ret;
+
+	/*
+	 * Check with the pinctrl driver whether this pin is usable as
+	 * an output GPIO
+	 */
+	ret = pinctrl_gpio_direction_output(chip->base + pin);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(pc->regs, dirout, BIT(bank_pin), BIT(bank_pin));
+	regmap_update_bits(pc->regs, data, BIT(bank_pin), val);
+
+	return 0;
+}
+
+static int bcm6362_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct bcm6362_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int data = bcm6362_reg_off(BCM6362_DATA_REG, pin);
+	unsigned int bank_pin = bcm6362_bank_pin(pin);
+	unsigned int val;
+
+	regmap_read(pc->regs, data, &val);
+
+	return !!(val & BIT(bank_pin));
+}
+
+static int bcm6362_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
+{
+	struct bcm6362_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int dirout = bcm6362_reg_off(BCM6362_DIROUT_REG, pin);
+	unsigned int bank_pin = bcm6362_bank_pin(pin);
+	unsigned int val;
+
+	regmap_read(pc->regs, dirout, &val);
+
+	if (val & BIT(bank_pin))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static void bcm6362_gpio_set(struct gpio_chip *chip, unsigned int pin,
+			     int value)
+{
+	struct bcm6362_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int data = bcm6362_reg_off(BCM6362_DATA_REG, pin);
+	unsigned int bank_pin = bcm6362_bank_pin(pin);
+	unsigned int val = value ? BIT(bank_pin) : 0;
+
+	regmap_update_bits(pc->regs, data, BIT(bank_pin), val);
+}
+
+static int bcm6362_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
+{
+	char irq_name[7];
+
+	sprintf(irq_name, "gpio%d", gpio);
+
+	return of_irq_get_byname(chip->of_node, irq_name);
+}
+
+static int bcm6362_pinctrl_get_group_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6362_groups);
+}
+
+static const char *bcm6362_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						  unsigned group)
+{
+	return bcm6362_groups[group].name;
+}
+
+static int bcm6362_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					  unsigned group, const unsigned **pins,
+					  unsigned *num_pins)
+{
+	*pins = bcm6362_groups[group].pins;
+	*num_pins = bcm6362_groups[group].num_pins;
+
+	return 0;
+}
+
+static int bcm6362_pinctrl_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6362_funcs);
+}
+
+static const char *bcm6362_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
+						 unsigned selector)
+{
+	return bcm6362_funcs[selector].name;
+}
+
+static int bcm6362_pinctrl_get_groups(struct pinctrl_dev *pctldev,
+				      unsigned selector,
+				      const char * const **groups,
+				      unsigned * const num_groups)
+{
+	*groups = bcm6362_funcs[selector].groups;
+	*num_groups = bcm6362_funcs[selector].num_groups;
+
+	return 0;
+}
+
+static void bcm6362_set_gpio(struct bcm6362_pinctrl *pc, unsigned pin)
+{
+	const struct pinctrl_pin_desc *desc = &bcm6362_pins[pin];
+	unsigned int mask = bcm6362_bank_pin(pin);
+
+	if (desc->drv_data)
+		regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG,
+				   (unsigned int) desc->drv_data, 0);
+
+	if (pin < PINS_PER_BANK) {
+		/* base mode 0 => gpio 1 => mux function */
+		regmap_update_bits(pc->regs, BCM6362_MODE_REG, mask, 0);
+
+		/* pins 0-23 might be muxed to led */
+		if (pin < BCM6362_NUM_LEDS)
+			regmap_update_bits(pc->regs, BCM6362_LED_REG, mask, 0);
+	} else {
+		/* ctrl reg 0 => wifi function 1 => gpio */
+		regmap_update_bits(pc->regs, BCM6362_CTRL_REG, mask, mask);
+	}
+}
+
+static int bcm6362_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				   unsigned selector, unsigned group)
+{
+	struct bcm6362_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm6362_pingroup *pg = &bcm6362_groups[group];
+	const struct bcm6362_function *f = &bcm6362_funcs[selector];
+	unsigned i;
+	unsigned int reg;
+	unsigned int val, mask;
+
+	for (i = 0; i < pg->num_pins; i++)
+		bcm6362_set_gpio(pc, pg->pins[i]);
+
+	switch (f->reg) {
+	case BCM6362_LEDCTRL:
+		reg = BCM6362_LED_REG;
+		mask = BIT(pg->pins[0]);
+		val = BIT(pg->pins[0]);
+		break;
+	case BCM6362_MODE:
+		reg = BCM6362_MODE_REG;
+		mask = BIT(pg->pins[0]);
+		val = BIT(pg->pins[0]);
+		break;
+	case BCM6362_CTRL:
+		reg = BCM6362_CTRL_REG;
+		mask = BIT(pg->pins[0]);
+		val = 0;
+		break;
+	case BCM6362_BASEMODE:
+		reg = BCM6362_BASEMODE_REG;
+		mask = f->basemode_mask;
+		val = f->basemode_mask;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(pc->regs, reg, mask, val);
+
+	return 0;
+}
+
+static int bcm6362_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm6362_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable all functions using this pin */
+	bcm6362_set_gpio(pc, offset);
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm6362_pctl_ops = {
+	.get_groups_count = bcm6362_pinctrl_get_group_count,
+	.get_group_name = bcm6362_pinctrl_get_group_name,
+	.get_group_pins = bcm6362_pinctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static struct pinmux_ops bcm6362_pmx_ops = {
+	.get_functions_count = bcm6362_pinctrl_get_func_count,
+	.get_function_name = bcm6362_pinctrl_get_func_name,
+	.get_function_groups = bcm6362_pinctrl_get_groups,
+	.set_mux = bcm6362_pinctrl_set_mux,
+	.gpio_request_enable = bcm6362_gpio_request_enable,
+	.strict = true,
+};
+
+static int bcm6362_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct bcm6362_pinctrl *pc;
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
+	pc->gpio_chip.label = MODULE_NAME;
+	pc->gpio_chip.owner = THIS_MODULE;
+	pc->gpio_chip.request = gpiochip_generic_request;
+	pc->gpio_chip.free = gpiochip_generic_free;
+	pc->gpio_chip.direction_input = bcm6362_gpio_direction_input;
+	pc->gpio_chip.direction_output = bcm6362_gpio_direction_output;
+	pc->gpio_chip.get_direction = bcm6362_gpio_get_direction;
+	pc->gpio_chip.get = bcm6362_gpio_get;
+	pc->gpio_chip.set = bcm6362_gpio_set;
+	pc->gpio_chip.set_config = gpiochip_generic_config;
+	pc->gpio_chip.base = -1;
+	pc->gpio_chip.ngpio = BCM6362_NUM_GPIOS;
+	pc->gpio_chip.can_sleep = false;
+	pc->gpio_chip.parent = dev;
+	pc->gpio_chip.of_node = np;
+
+	if (of_get_property(np, "interrupt-names", NULL))
+		pc->gpio_chip.to_irq = bcm6362_gpio_to_irq;
+
+	err = gpiochip_add_data(&pc->gpio_chip, pc);
+	if (err) {
+		dev_err(dev, "could not add GPIO chip\n");
+		return err;
+	}
+
+	pc->pctl_desc.name = MODULE_NAME,
+	pc->pctl_desc.pins = bcm6362_pins,
+	pc->pctl_desc.npins = ARRAY_SIZE(bcm6362_pins),
+	pc->pctl_desc.pctlops = &bcm6362_pctl_ops,
+	pc->pctl_desc.pmxops = &bcm6362_pmx_ops,
+	pc->pctl_desc.owner = THIS_MODULE,
+
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev)) {
+		gpiochip_remove(&pc->gpio_chip);
+		return PTR_ERR(pc->pctl_dev);
+	}
+
+	pc->gpio_range.name = MODULE_NAME;
+	pc->gpio_range.npins = BCM6362_NUM_GPIOS;
+	pc->gpio_range.base = pc->gpio_chip.base;
+	pc->gpio_range.gc = &pc->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	dev_info(dev, "registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id bcm6362_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6362-pinctrl", },
+	{ },
+};
+
+static struct platform_driver bcm6362_pinctrl_driver = {
+	.probe = bcm6362_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = bcm6362_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6362_pinctrl_driver);
-- 
2.20.1


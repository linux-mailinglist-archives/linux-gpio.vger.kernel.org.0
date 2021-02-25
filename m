Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CC33253C9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbhBYQof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbhBYQn6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:58 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E0BC061797;
        Thu, 25 Feb 2021 08:42:28 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p3so5185099wmc.2;
        Thu, 25 Feb 2021 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X5NgHc9FaWWZxT4P1Jqwe21zSmIseQRtugtLqJFJw7s=;
        b=DYobSuxsjaRNsfW4bCS4u4US+mkP0xFDjxorbq3GCgvbbFlA+e4QenZ0AYRk1+0gY3
         +Wso8SQ3HJatAoj26/KIailwIk0ZqiklkHfzcbie11bKzZIdZ0JLYPVdhPq8aeYR3uIT
         F/LfReXShC412njIZZm8zS47zBxV1LROPsZfkCIRo0PAI16RIqjaRBw4cNkr+YtfZ1JI
         J0dgo/TYZIeFz2GicsgQ4DRpa93quWx/TdOiVzksW8g3drd1RS5OiFAlNWEWCldq3Ioc
         f5Oyq+FgrGLyTkA63ZVXkxNLxc+KgR7ouqrU7ZN6S/wqVf4V/YjJQDhgeSSxOLIuYb4o
         lVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X5NgHc9FaWWZxT4P1Jqwe21zSmIseQRtugtLqJFJw7s=;
        b=c3t4nI/9gcsoNunwixKc7QlwcakzsiHuYdTrzsTfhwquXtMKJ5h9zvAB/F56x28geK
         DSPojhihg99NgBl7wWX9nrx/TmaJYLOeO3Lz8o/QRnW1E1rnnzTy1x80LqMwTMfmEvWr
         OOmQe7SbdOiBQeGcYHzBdiOK+DEjtuCdQBGFmbMFyi5Pe4naDrquEfEYbZxUPg60fmqy
         Ixpgh0yPmnLWwLL6e/COxXnlVIRMmRKoVgie9nKRoBKGGxdZftUrenCTClrgZEVEyBHU
         aMUKd+1JBQhgSa2b8qOOhuYIFuuJopRd4+JwTCtfy2LpWfGyC5u02x5x89dHFd1T/wuQ
         dHVQ==
X-Gm-Message-State: AOAM5331GS1c2khyHhusz29E+vE4dBefWh8I8daJGbcd4PPUSJdkHQJZ
        p9CNsAY2xueYh0OAYihgeHM=
X-Google-Smtp-Source: ABdhPJz3S5axa1PQhwgZ4ey94uunBe/47RKj5Le3aHBT493JxVnIgUKQ+BdsyguWLv9gJjcUKrE17Q==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr4062477wmc.95.1614271347284;
        Thu, 25 Feb 2021 08:42:27 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:27 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] pinctrl: add a pincontrol driver for BCM63268
Date:   Thu, 25 Feb 2021 17:42:14 +0100
Message-Id: <20210225164216.21124-11-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225164216.21124-1-noltari@gmail.com>
References: <20210225164216.21124-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincontrol driver for BCM63268. BCM63268 allows muxing GPIOs
to different functions. Depending on the mux, these are either single
pin configurations or whole pin groups.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig            |  11 +
 drivers/pinctrl/bcm/Makefile           |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm63268.c | 821 +++++++++++++++++++++++++
 3 files changed, 833 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63268.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index b8109f0a692c..8918600466b4 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -73,6 +73,17 @@ config PINCTRL_BCM6368
 	help
 	   Say Y here to enable the Broadcom BCM6368 GPIO driver.
 
+config PINCTRL_BCM63268
+	bool "Broadcom BCM63268 GPIO driver"
+	depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select MFD_SYSCON
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM63268 GPIO driver.
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 2d9c99a41c51..d5a8ee914fc6 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
 obj-$(CONFIG_PINCTRL_BCM6368)		+= pinctrl-bcm6368.o
+obj-$(CONFIG_PINCTRL_BCM63268)		+= pinctrl-bcm63268.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63268.c b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
new file mode 100644
index 000000000000..b58e24d2cd01
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM63268 GPIO unit (pinctrl + GPIO)
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
+#define MODULE_NAME			"bcm63268-pinctrl"
+#define BCM63268_NUM_GPIOS		52
+#define BCM63268_NUM_LEDS		24
+
+#define BANK_SIZE			sizeof(uint32_t)
+#define PINS_PER_BANK			(BANK_SIZE * BITS_PER_BYTE)
+
+#define BCM63268_DIROUT_REG		0x04
+#define BCM63268_DATA_REG		0x0c
+#define BCM63268_LED_REG		0x10
+#define BCM63268_MODE_REG		0x18
+#define BCM63268_CTRL_REG		0x1c
+#define BCM63268_BASEMODE_REG		0x38
+#define  BCM63268_BASEMODE_NAND		BIT(2) /* GPIOs 2-7, 24-31 */
+#define  BCM63268_BASEMODE_GPIO35	BIT(4) /* GPIO 35 */
+#define  BCM63268_BASEMODE_DECTPD	BIT(5) /* GPIOs 8/9 */
+#define  BCM63268_BASEMODE_VDSL_PHY_0	BIT(6) /* GPIOs 10/11 */
+#define  BCM63268_BASEMODE_VDSL_PHY_1	BIT(7) /* GPIOs 12/13 */
+#define  BCM63268_BASEMODE_VDSL_PHY_2	BIT(8) /* GPIOs 24/25 */
+#define  BCM63268_BASEMODE_VDSL_PHY_3	BIT(9) /* GPIOs 26/27 */
+
+enum bcm63268_pinctrl_reg {
+	BCM63268_LEDCTRL,
+	BCM63268_MODE,
+	BCM63268_CTRL,
+	BCM63268_BASEMODE,
+};
+
+struct bcm63268_pingroup {
+	const char *name;
+	const unsigned * const pins;
+	const unsigned num_pins;
+};
+
+struct bcm63268_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned num_groups;
+
+	enum bcm63268_pinctrl_reg reg;
+	uint32_t mask;
+};
+
+struct bcm63268_pinctrl {
+	struct device *dev;
+	struct regmap *regs;
+
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip gpio_chip;
+	struct pinctrl_desc pctl_desc;
+	struct pinctrl_gpio_range gpio_range;
+};
+
+#define BCM63268_PIN(a, b, basemode)			\
+	{						\
+		.number = a,				\
+		.name = b,				\
+		.drv_data = (void *)(basemode)		\
+	}
+
+static const struct pinctrl_pin_desc bcm63268_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	BCM63268_PIN(2, "gpio2", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(3, "gpio3", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(4, "gpio4", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(5, "gpio5", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(6, "gpio6", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(7, "gpio7", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(8, "gpio8", BCM63268_BASEMODE_DECTPD),
+	BCM63268_PIN(9, "gpio9", BCM63268_BASEMODE_DECTPD),
+	BCM63268_PIN(10, "gpio10", BCM63268_BASEMODE_VDSL_PHY_0),
+	BCM63268_PIN(11, "gpio11", BCM63268_BASEMODE_VDSL_PHY_0),
+	BCM63268_PIN(12, "gpio12", BCM63268_BASEMODE_VDSL_PHY_1),
+	BCM63268_PIN(13, "gpio13", BCM63268_BASEMODE_VDSL_PHY_1),
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
+	BCM63268_PIN(24, "gpio24",
+		     BCM63268_BASEMODE_NAND | BCM63268_BASEMODE_VDSL_PHY_2),
+	BCM63268_PIN(25, "gpio25",
+		     BCM63268_BASEMODE_NAND | BCM63268_BASEMODE_VDSL_PHY_2),
+	BCM63268_PIN(26, "gpio26",
+		     BCM63268_BASEMODE_NAND | BCM63268_BASEMODE_VDSL_PHY_3),
+	BCM63268_PIN(27, "gpio27",
+		     BCM63268_BASEMODE_NAND | BCM63268_BASEMODE_VDSL_PHY_3),
+	BCM63268_PIN(28, "gpio28", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(29, "gpio29", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(30, "gpio30", BCM63268_BASEMODE_NAND),
+	BCM63268_PIN(31, "gpio31", BCM63268_BASEMODE_NAND),
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
+	PINCTRL_PIN(48, "gpio48"),
+	PINCTRL_PIN(49, "gpio49"),
+	PINCTRL_PIN(50, "gpio50"),
+	PINCTRL_PIN(51, "gpio51"),
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
+static unsigned gpio48_pins[] = { 48 };
+static unsigned gpio49_pins[] = { 49 };
+static unsigned gpio50_pins[] = { 50 };
+static unsigned gpio51_pins[] = { 51 };
+
+static unsigned nand_grp_pins[] = {
+	2, 3, 4, 5, 6, 7, 24,
+	25, 26, 27, 28, 29, 30, 31,
+};
+
+static unsigned dectpd_grp_pins[] = { 8, 9 };
+static unsigned vdsl_phy0_grp_pins[] = { 10, 11 };
+static unsigned vdsl_phy1_grp_pins[] = { 12, 13 };
+static unsigned vdsl_phy2_grp_pins[] = { 24, 25 };
+static unsigned vdsl_phy3_grp_pins[] = { 26, 27 };
+
+#define BCM63268_GROUP(n)					\
+	{							\
+		.name = #n,					\
+		.pins = n##_pins,				\
+		.num_pins = ARRAY_SIZE(n##_pins),		\
+	}
+
+static struct bcm63268_pingroup bcm63268_groups[] = {
+	BCM63268_GROUP(gpio0),
+	BCM63268_GROUP(gpio1),
+	BCM63268_GROUP(gpio2),
+	BCM63268_GROUP(gpio3),
+	BCM63268_GROUP(gpio4),
+	BCM63268_GROUP(gpio5),
+	BCM63268_GROUP(gpio6),
+	BCM63268_GROUP(gpio7),
+	BCM63268_GROUP(gpio8),
+	BCM63268_GROUP(gpio9),
+	BCM63268_GROUP(gpio10),
+	BCM63268_GROUP(gpio11),
+	BCM63268_GROUP(gpio12),
+	BCM63268_GROUP(gpio13),
+	BCM63268_GROUP(gpio14),
+	BCM63268_GROUP(gpio15),
+	BCM63268_GROUP(gpio16),
+	BCM63268_GROUP(gpio17),
+	BCM63268_GROUP(gpio18),
+	BCM63268_GROUP(gpio19),
+	BCM63268_GROUP(gpio20),
+	BCM63268_GROUP(gpio21),
+	BCM63268_GROUP(gpio22),
+	BCM63268_GROUP(gpio23),
+	BCM63268_GROUP(gpio24),
+	BCM63268_GROUP(gpio25),
+	BCM63268_GROUP(gpio26),
+	BCM63268_GROUP(gpio27),
+	BCM63268_GROUP(gpio28),
+	BCM63268_GROUP(gpio29),
+	BCM63268_GROUP(gpio30),
+	BCM63268_GROUP(gpio31),
+	BCM63268_GROUP(gpio32),
+	BCM63268_GROUP(gpio33),
+	BCM63268_GROUP(gpio34),
+	BCM63268_GROUP(gpio35),
+	BCM63268_GROUP(gpio36),
+	BCM63268_GROUP(gpio37),
+	BCM63268_GROUP(gpio38),
+	BCM63268_GROUP(gpio39),
+	BCM63268_GROUP(gpio40),
+	BCM63268_GROUP(gpio41),
+	BCM63268_GROUP(gpio42),
+	BCM63268_GROUP(gpio43),
+	BCM63268_GROUP(gpio44),
+	BCM63268_GROUP(gpio45),
+	BCM63268_GROUP(gpio46),
+	BCM63268_GROUP(gpio47),
+	BCM63268_GROUP(gpio48),
+	BCM63268_GROUP(gpio49),
+	BCM63268_GROUP(gpio50),
+	BCM63268_GROUP(gpio51),
+
+	/* multi pin groups */
+	BCM63268_GROUP(nand_grp),
+	BCM63268_GROUP(dectpd_grp),
+	BCM63268_GROUP(vdsl_phy0_grp),
+	BCM63268_GROUP(vdsl_phy1_grp),
+	BCM63268_GROUP(vdsl_phy2_grp),
+	BCM63268_GROUP(vdsl_phy3_grp),
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
+static const char * const serial_led_clk_groups[] = {
+	"gpio0",
+};
+
+static const char * const serial_led_data_groups[] = {
+	"gpio1",
+};
+
+static const char * const hsspi_cs4_groups[] = {
+	"gpio16",
+};
+
+static const char * const hsspi_cs5_groups[] = {
+	"gpio17",
+};
+
+static const char * const hsspi_cs6_groups[] = {
+	"gpio8",
+};
+
+static const char * const hsspi_cs7_groups[] = {
+	"gpio9",
+};
+
+static const char * const uart1_scts_groups[] = {
+	"gpio10",
+	"gpio24",
+};
+
+static const char * const uart1_srts_groups[] = {
+	"gpio11",
+	"gpio25",
+};
+
+static const char * const uart1_sdin_groups[] = {
+	"gpio12",
+	"gpio26",
+};
+
+static const char * const uart1_sdout_groups[] = {
+	"gpio13",
+	"gpio27",
+};
+
+static const char * const ntr_pulse_in_groups[] = {
+	"gpio14",
+	"gpio28",
+};
+
+static const char * const dsl_ntr_pulse_out_groups[] = {
+	"gpio15",
+	"gpio29",
+};
+
+static const char * const adsl_spi_miso_groups[] = {
+	"gpio18",
+};
+
+static const char * const adsl_spi_mosi_groups[] = {
+	"gpio19",
+};
+
+static const char * const vreg_clk_groups[] = {
+	"gpio22",
+};
+
+static const char * const pcie_clkreq_b_groups[] = {
+	"gpio23",
+};
+
+static const char * const switch_led_clk_groups[] = {
+	"gpio30",
+};
+
+static const char * const switch_led_data_groups[] = {
+	"gpio31",
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
+	"gpio48",
+	"gpio49",
+	"gpio50",
+	"gpio51",
+};
+
+static const char * const nand_groups[] = {
+	"nand_grp",
+};
+
+static const char * const dectpd_groups[] = {
+	"dectpd_grp",
+};
+
+static const char * const vdsl_phy_override_0_groups[] = {
+	"vdsl_phy_override_0_grp",
+};
+
+static const char * const vdsl_phy_override_1_groups[] = {
+	"vdsl_phy_override_1_grp",
+};
+
+static const char * const vdsl_phy_override_2_groups[] = {
+	"vdsl_phy_override_2_grp",
+};
+
+static const char * const vdsl_phy_override_3_groups[] = {
+	"vdsl_phy_override_3_grp",
+};
+
+#define BCM63268_LED_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM63268_LEDCTRL,		\
+	}
+
+#define BCM63268_MODE_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM63268_MODE,			\
+	}
+
+#define BCM63268_CTRL_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM63268_CTRL,			\
+	}
+
+#define BCM63268_BASEMODE_FUN(n, val)			\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM63268_BASEMODE,		\
+		.mask = val,				\
+	}
+
+static const struct bcm63268_function bcm63268_funcs[] = {
+	BCM63268_LED_FUN(led),
+	BCM63268_MODE_FUN(serial_led_clk),
+	BCM63268_MODE_FUN(serial_led_data),
+	BCM63268_MODE_FUN(hsspi_cs6),
+	BCM63268_MODE_FUN(hsspi_cs7),
+	BCM63268_MODE_FUN(uart1_scts),
+	BCM63268_MODE_FUN(uart1_srts),
+	BCM63268_MODE_FUN(uart1_sdin),
+	BCM63268_MODE_FUN(uart1_sdout),
+	BCM63268_MODE_FUN(ntr_pulse_in),
+	BCM63268_MODE_FUN(dsl_ntr_pulse_out),
+	BCM63268_MODE_FUN(hsspi_cs4),
+	BCM63268_MODE_FUN(hsspi_cs5),
+	BCM63268_MODE_FUN(adsl_spi_miso),
+	BCM63268_MODE_FUN(adsl_spi_mosi),
+	BCM63268_MODE_FUN(vreg_clk),
+	BCM63268_MODE_FUN(pcie_clkreq_b),
+	BCM63268_MODE_FUN(switch_led_clk),
+	BCM63268_MODE_FUN(switch_led_data),
+	BCM63268_CTRL_FUN(wifi),
+	BCM63268_BASEMODE_FUN(nand, BCM63268_BASEMODE_NAND),
+	BCM63268_BASEMODE_FUN(dectpd, BCM63268_BASEMODE_DECTPD),
+	BCM63268_BASEMODE_FUN(vdsl_phy_override_0,
+			      BCM63268_BASEMODE_VDSL_PHY_0),
+	BCM63268_BASEMODE_FUN(vdsl_phy_override_1,
+			      BCM63268_BASEMODE_VDSL_PHY_1),
+	BCM63268_BASEMODE_FUN(vdsl_phy_override_2,
+			      BCM63268_BASEMODE_VDSL_PHY_2),
+	BCM63268_BASEMODE_FUN(vdsl_phy_override_3,
+			      BCM63268_BASEMODE_VDSL_PHY_3),
+};
+
+static inline unsigned int bcm63268_bank_pin(unsigned int pin)
+{
+	return pin % PINS_PER_BANK;
+}
+
+static inline unsigned int bcm63268_reg_off(unsigned int reg, unsigned int pin)
+{
+	return reg - (pin / PINS_PER_BANK) * BANK_SIZE;
+}
+
+static int bcm63268_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int pin)
+{
+	struct bcm63268_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int dirout = bcm63268_reg_off(BCM63268_DIROUT_REG, pin);
+	unsigned int bank_pin = bcm63268_bank_pin(pin);
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
+static int bcm63268_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned int pin, int value)
+{
+	struct bcm63268_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int data = bcm63268_reg_off(BCM63268_DATA_REG, pin);
+	unsigned int dirout = bcm63268_reg_off(BCM63268_DIROUT_REG, pin);
+	unsigned int bank_pin = bcm63268_bank_pin(pin);
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
+static int bcm63268_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct bcm63268_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int data = bcm63268_reg_off(BCM63268_DATA_REG, pin);
+	unsigned int bank_pin = bcm63268_bank_pin(pin);
+	unsigned int val;
+
+	regmap_read(pc->regs, data, &val);
+
+	return !!(val & BIT(bank_pin));
+}
+
+static int bcm63268_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
+{
+	struct bcm63268_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int dirout = bcm63268_reg_off(BCM63268_DIROUT_REG, pin);
+	unsigned int bank_pin = bcm63268_bank_pin(pin);
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
+static void bcm63268_gpio_set(struct gpio_chip *chip, unsigned int pin,
+			     int value)
+{
+	struct bcm63268_pinctrl *pc = gpiochip_get_data(chip);
+	unsigned int data = bcm63268_reg_off(BCM63268_DATA_REG, pin);
+	unsigned int bank_pin = bcm63268_bank_pin(pin);
+	unsigned int val = value ? BIT(bank_pin) : 0;
+
+	regmap_update_bits(pc->regs, data, BIT(bank_pin), val);
+}
+
+static int bcm63268_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
+{
+	char irq_name[7];
+
+	sprintf(irq_name, "gpio%d", gpio);
+
+	return of_irq_get_byname(chip->of_node, irq_name);
+}
+
+static int bcm63268_pinctrl_get_group_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm63268_groups);
+}
+
+static const char *bcm63268_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						   unsigned group)
+{
+	return bcm63268_groups[group].name;
+}
+
+static int bcm63268_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					   unsigned group,
+					   const unsigned **pins,
+					   unsigned *num_pins)
+{
+	*pins = bcm63268_groups[group].pins;
+	*num_pins = bcm63268_groups[group].num_pins;
+
+	return 0;
+}
+
+static int bcm63268_pinctrl_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm63268_funcs);
+}
+
+static const char *bcm63268_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
+						  unsigned selector)
+{
+	return bcm63268_funcs[selector].name;
+}
+
+static int bcm63268_pinctrl_get_groups(struct pinctrl_dev *pctldev,
+				       unsigned selector,
+				       const char * const **groups,
+				       unsigned * const num_groups)
+{
+	*groups = bcm63268_funcs[selector].groups;
+	*num_groups = bcm63268_funcs[selector].num_groups;
+
+	return 0;
+}
+
+static void bcm63268_set_gpio(struct bcm63268_pinctrl *pc, unsigned pin)
+{
+	const struct pinctrl_pin_desc *desc = &bcm63268_pins[pin];
+	unsigned int basemode = (unsigned long) desc->drv_data;
+	unsigned int mask = BIT(bcm63268_bank_pin(pin));
+
+	if (basemode)
+		regmap_update_bits(pc->regs, BCM63268_BASEMODE_REG, basemode,
+				   0);
+
+	if (pin < PINS_PER_BANK) {
+		/* base mode: 0 => gpio, 1 => mux function */
+		regmap_update_bits(pc->regs, BCM63268_MODE_REG, mask, 0);
+
+		/* pins 0-23 might be muxed to led */
+		if (pin < BCM63268_NUM_LEDS)
+			regmap_update_bits(pc->regs, BCM63268_LED_REG, mask,
+					   0);
+	} else if (pin < BCM63268_NUM_GPIOS) {
+		/* ctrl reg: 0 => wifi function, 1 => gpio */
+		regmap_update_bits(pc->regs, BCM63268_CTRL_REG, mask, mask);
+	}
+}
+
+static int bcm63268_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				    unsigned selector, unsigned group)
+{
+	struct bcm63268_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm63268_pingroup *pg = &bcm63268_groups[group];
+	const struct bcm63268_function *f = &bcm63268_funcs[selector];
+	unsigned i;
+	unsigned int reg;
+	unsigned int val, mask;
+
+	for (i = 0; i < pg->num_pins; i++)
+		bcm63268_set_gpio(pc, pg->pins[i]);
+
+	switch (f->reg) {
+	case BCM63268_LEDCTRL:
+		reg = BCM63268_LED_REG;
+		mask = BIT(pg->pins[0]);
+		val = BIT(pg->pins[0]);
+		break;
+	case BCM63268_MODE:
+		reg = BCM63268_MODE_REG;
+		mask = BIT(pg->pins[0]);
+		val = BIT(pg->pins[0]);
+		break;
+	case BCM63268_CTRL:
+		reg = BCM63268_CTRL_REG;
+		mask = BIT(pg->pins[0]);
+		val = 0;
+		break;
+	case BCM63268_BASEMODE:
+		reg = BCM63268_BASEMODE_REG;
+		mask = f->mask;
+		val = f->mask;
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
+static int bcm63268_gpio_request_enable(struct pinctrl_dev *pctldev,
+					struct pinctrl_gpio_range *range,
+					unsigned offset)
+{
+	struct bcm63268_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable all functions using this pin */
+	bcm63268_set_gpio(pc, offset);
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm63268_pctl_ops = {
+	.get_groups_count = bcm63268_pinctrl_get_group_count,
+	.get_group_name = bcm63268_pinctrl_get_group_name,
+	.get_group_pins = bcm63268_pinctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static struct pinmux_ops bcm63268_pmx_ops = {
+	.get_functions_count = bcm63268_pinctrl_get_func_count,
+	.get_function_name = bcm63268_pinctrl_get_func_name,
+	.get_function_groups = bcm63268_pinctrl_get_groups,
+	.set_mux = bcm63268_pinctrl_set_mux,
+	.gpio_request_enable = bcm63268_gpio_request_enable,
+	.strict = true,
+};
+
+static int bcm63268_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct bcm63268_pinctrl *pc;
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
+	pc->gpio_chip.direction_input = bcm63268_gpio_direction_input;
+	pc->gpio_chip.direction_output = bcm63268_gpio_direction_output;
+	pc->gpio_chip.get_direction = bcm63268_gpio_get_direction;
+	pc->gpio_chip.get = bcm63268_gpio_get;
+	pc->gpio_chip.set = bcm63268_gpio_set;
+	pc->gpio_chip.set_config = gpiochip_generic_config;
+	pc->gpio_chip.base = -1;
+	pc->gpio_chip.ngpio = BCM63268_NUM_GPIOS;
+	pc->gpio_chip.can_sleep = false;
+	pc->gpio_chip.parent = dev;
+	pc->gpio_chip.of_node = np;
+
+	if (of_get_property(np, "interrupt-names", NULL))
+		pc->gpio_chip.to_irq = bcm63268_gpio_to_irq;
+
+	err = gpiochip_add_data(&pc->gpio_chip, pc);
+	if (err) {
+		dev_err(dev, "could not add GPIO chip\n");
+		return err;
+	}
+
+	pc->pctl_desc.name = MODULE_NAME,
+	pc->pctl_desc.pins = bcm63268_pins,
+	pc->pctl_desc.npins = ARRAY_SIZE(bcm63268_pins),
+	pc->pctl_desc.pctlops = &bcm63268_pctl_ops,
+	pc->pctl_desc.pmxops = &bcm63268_pmx_ops,
+	pc->pctl_desc.owner = THIS_MODULE,
+
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev)) {
+		gpiochip_remove(&pc->gpio_chip);
+		return PTR_ERR(pc->pctl_dev);
+	}
+
+	pc->gpio_range.name = MODULE_NAME;
+	pc->gpio_range.npins = BCM63268_NUM_GPIOS;
+	pc->gpio_range.base = pc->gpio_chip.base;
+	pc->gpio_range.gc = &pc->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	dev_info(dev, "registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id bcm63268_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm63268-pinctrl", },
+	{ },
+};
+
+static struct platform_driver bcm63268_pinctrl_driver = {
+	.probe = bcm63268_pinctrl_probe,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = bcm63268_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm63268_pinctrl_driver);
-- 
2.20.1


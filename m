Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0E633F306
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbhCQOjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhCQOi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:27 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598C0C06174A;
        Wed, 17 Mar 2021 07:38:27 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g25so1641667wmh.0;
        Wed, 17 Mar 2021 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iX7CLxlDDYTgpu7A0UdLIQo4C7RFTt6S1zrTy0aR36o=;
        b=JO5+lKwr4NSCfPCvwnvTY0YC8+80tyI+24629uIMMbMlivmWsjoexgoeszsWj3PI6A
         Wc9ptTHTLnU+KUBiKCKilejYSd9sGEyXOdmBcK2GNMz5UGgsYhmkAmkaM7MtOapT8l6G
         WzyvLYvhSsbDu2Om1LQUU8x4Tu0rQSqu4MbJXV4jhyO4+ZpL8uoZLRoPm4y+ApqafOZS
         D8PVmnakK9yCZRKbsPjNEig+8n/jp/FWvFvp+RS2fM7WzUSlBUoIdQLwIsaTyffyJ4IG
         /xD1TBUngcGZj+9WDgdBNZzx5EPzWD3IAj6354m8qXAZdNMr1nxYz0ZJELfKmzAH9Yeq
         txCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iX7CLxlDDYTgpu7A0UdLIQo4C7RFTt6S1zrTy0aR36o=;
        b=CecysuS4+fVyh3UTI+O5uuWoGwABOMXmZV1cboXjHr53mjff7llqkLCEy/Zrexme3z
         nKPqNaVLgFIgnyw9qtpk9IPTDzVaiOK+QkdK5Qx+ATYSMnpstRHNEqNW4gjizKMChHZI
         kHFvofVtG2SZjCyHZQ425Wisr2jzemaMziwWl/wSr13CRxv05NWGccQTAqKvUVw2fNYg
         2d0y+LVAixvg+kjD9AaqTrSXpqlvCbNkyIn8wNHcaYwAaUCTriuvktyjEaYFmuVREcIY
         4483ICAeiLWTqX0xlcBMs0ozZGRwgf5ZMRkQeAWHEZ40iacUAUbEOkcmug+k4AgoBrqf
         n0RQ==
X-Gm-Message-State: AOAM531NjgCCBTS1VKkTb/WuS9lJHXwtoPu5CYA28G3KwqFMrQugRXSa
        0e+79n/cjaApflOHqusfo6c=
X-Google-Smtp-Source: ABdhPJyBPkEawblkkjZwmp8ft4zEVzL78U5/LNhPFrBtT9dL3HmrlRGRvrTpQoeQaa5v6I+xw7cT/g==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr4043018wmm.27.1615991906014;
        Wed, 17 Mar 2021 07:38:26 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:25 -0700 (PDT)
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
Subject: [PATCH v8 22/22] pinctrl: add a pincontrol driver for BCM6318
Date:   Wed, 17 Mar 2021 15:38:03 +0100
Message-Id: <20210317143803.26127-23-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a pincontrol driver for BCM6318. BCM6318 allows muxing most GPIOs
to different functions. BCM6318 is similar to BCM6328 with the addition
of a pad register, and the GPIO meaning of the mux register changes
based on the GPIO number.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: no changes
 v7: no changes
 v6: no changes
 v5: add changes suggested by Andy Shevchenko
 v4: no changes
 v3: use new shared code
 v2: switch to GPIO_REGMAP

 drivers/pinctrl/bcm/Kconfig           |   8 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c | 498 ++++++++++++++++++++++++++
 3 files changed, 507 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6318.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 186985846120..33660e8fec05 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -36,6 +36,14 @@ config PINCTRL_BCM63XX
 	select PINCONF
 	select PINMUX
 
+config PINCTRL_BCM6318
+	bool "Broadcom BCM6318 GPIO driver"
+	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	select PINCTRL_BCM63XX
+	default BMIPS_GENERIC
+	help
+	   Say Y here to enable the Broadcom BCM6318 GPIO driver.
+
 config PINCTRL_BCM6328
 	bool "Broadcom BCM6328 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 4117847fd279..00c7b7775e63 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
 obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
+obj-$(CONFIG_PINCTRL_BCM6318)		+= pinctrl-bcm6318.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
 obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6318.c b/drivers/pinctrl/bcm/pinctrl-bcm6318.c
new file mode 100644
index 000000000000..77fd9b58067d
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6318.c
@@ -0,0 +1,498 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM6318 GPIO unit (pinctrl + GPIO)
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
+#define BCM6318_NUM_GPIOS	50
+#define BCM6318_NUM_MUX		48
+
+#define BCM6318_MODE_REG	0x18
+#define BCM6318_MUX_REG		0x1c
+#define  BCM6328_MUX_MASK	GENMASK(1, 0)
+#define BCM6318_PAD_REG		0x54
+#define  BCM6328_PAD_MASK	GENMASK(3, 0)
+
+struct bcm6318_pingroup {
+	const char *name;
+	const unsigned * const pins;
+	const unsigned num_pins;
+};
+
+struct bcm6318_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned num_groups;
+
+	unsigned mode_val:1;
+	unsigned mux_val:2;
+};
+
+static const struct pinctrl_pin_desc bcm6318_pins[] = {
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
+
+#define BCM6318_GROUP(n)					\
+	{							\
+		.name = #n,					\
+		.pins = n##_pins,				\
+		.num_pins = ARRAY_SIZE(n##_pins),		\
+	}
+
+static struct bcm6318_pingroup bcm6318_groups[] = {
+	BCM6318_GROUP(gpio0),
+	BCM6318_GROUP(gpio1),
+	BCM6318_GROUP(gpio2),
+	BCM6318_GROUP(gpio3),
+	BCM6318_GROUP(gpio4),
+	BCM6318_GROUP(gpio5),
+	BCM6318_GROUP(gpio6),
+	BCM6318_GROUP(gpio7),
+	BCM6318_GROUP(gpio8),
+	BCM6318_GROUP(gpio9),
+	BCM6318_GROUP(gpio10),
+	BCM6318_GROUP(gpio11),
+	BCM6318_GROUP(gpio12),
+	BCM6318_GROUP(gpio13),
+	BCM6318_GROUP(gpio14),
+	BCM6318_GROUP(gpio15),
+	BCM6318_GROUP(gpio16),
+	BCM6318_GROUP(gpio17),
+	BCM6318_GROUP(gpio18),
+	BCM6318_GROUP(gpio19),
+	BCM6318_GROUP(gpio20),
+	BCM6318_GROUP(gpio21),
+	BCM6318_GROUP(gpio22),
+	BCM6318_GROUP(gpio23),
+	BCM6318_GROUP(gpio24),
+	BCM6318_GROUP(gpio25),
+	BCM6318_GROUP(gpio26),
+	BCM6318_GROUP(gpio27),
+	BCM6318_GROUP(gpio28),
+	BCM6318_GROUP(gpio29),
+	BCM6318_GROUP(gpio30),
+	BCM6318_GROUP(gpio31),
+	BCM6318_GROUP(gpio32),
+	BCM6318_GROUP(gpio33),
+	BCM6318_GROUP(gpio34),
+	BCM6318_GROUP(gpio35),
+	BCM6318_GROUP(gpio36),
+	BCM6318_GROUP(gpio37),
+	BCM6318_GROUP(gpio38),
+	BCM6318_GROUP(gpio39),
+	BCM6318_GROUP(gpio40),
+	BCM6318_GROUP(gpio41),
+	BCM6318_GROUP(gpio42),
+	BCM6318_GROUP(gpio43),
+	BCM6318_GROUP(gpio44),
+	BCM6318_GROUP(gpio45),
+	BCM6318_GROUP(gpio46),
+	BCM6318_GROUP(gpio47),
+	BCM6318_GROUP(gpio48),
+	BCM6318_GROUP(gpio49),
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
+static const char * const ephy0_spd_led_groups[] = {
+	"gpio0",
+};
+
+static const char * const ephy1_spd_led_groups[] = {
+	"gpio1",
+};
+
+static const char * const ephy2_spd_led_groups[] = {
+	"gpio2",
+};
+
+static const char * const ephy3_spd_led_groups[] = {
+	"gpio3",
+};
+
+static const char * const ephy0_act_led_groups[] = {
+	"gpio4",
+};
+
+static const char * const ephy1_act_led_groups[] = {
+	"gpio5",
+};
+
+static const char * const ephy2_act_led_groups[] = {
+	"gpio6",
+};
+
+static const char * const ephy3_act_led_groups[] = {
+	"gpio7",
+};
+
+static const char * const serial_led_data_groups[] = {
+	"gpio6",
+};
+
+static const char * const serial_led_clk_groups[] = {
+	"gpio7",
+};
+
+static const char * const inet_act_led_groups[] = {
+	"gpio8",
+};
+
+static const char * const inet_fail_led_groups[] = {
+	"gpio9",
+};
+
+static const char * const dsl_led_groups[] = {
+	"gpio10",
+};
+
+static const char * const post_fail_led_groups[] = {
+	"gpio11",
+};
+
+static const char * const wlan_wps_led_groups[] = {
+	"gpio12",
+};
+
+static const char * const usb_pwron_groups[] = {
+	"gpio13",
+};
+
+static const char * const usb_device_led_groups[] = {
+	"gpio13",
+};
+
+static const char * const usb_active_groups[] = {
+	"gpio40",
+};
+
+#define BCM6318_MODE_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.mode_val = 1,				\
+	}
+
+#define BCM6318_MUX_FUN(n, mux)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.mux_val = mux,				\
+	}
+
+static const struct bcm6318_function bcm6318_funcs[] = {
+	BCM6318_MODE_FUN(led),
+	BCM6318_MUX_FUN(ephy0_spd_led, 1),
+	BCM6318_MUX_FUN(ephy1_spd_led, 1),
+	BCM6318_MUX_FUN(ephy2_spd_led, 1),
+	BCM6318_MUX_FUN(ephy3_spd_led, 1),
+	BCM6318_MUX_FUN(ephy0_act_led, 1),
+	BCM6318_MUX_FUN(ephy1_act_led, 1),
+	BCM6318_MUX_FUN(ephy2_act_led, 1),
+	BCM6318_MUX_FUN(ephy3_act_led, 1),
+	BCM6318_MUX_FUN(serial_led_data, 3),
+	BCM6318_MUX_FUN(serial_led_clk, 3),
+	BCM6318_MUX_FUN(inet_act_led, 1),
+	BCM6318_MUX_FUN(inet_fail_led, 1),
+	BCM6318_MUX_FUN(dsl_led, 1),
+	BCM6318_MUX_FUN(post_fail_led, 1),
+	BCM6318_MUX_FUN(wlan_wps_led, 1),
+	BCM6318_MUX_FUN(usb_pwron, 1),
+	BCM6318_MUX_FUN(usb_device_led, 2),
+	BCM6318_MUX_FUN(usb_active, 2),
+};
+
+static inline unsigned int bcm6318_mux_off(unsigned int pin)
+{
+	return BCM6318_MUX_REG + (pin / 16) * 4;
+}
+
+static inline unsigned int bcm6318_pad_off(unsigned int pin)
+{
+	return BCM6318_PAD_REG + (pin / 8) * 4;
+}
+
+static int bcm6318_pinctrl_get_group_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6318_groups);
+}
+
+static const char *bcm6318_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						  unsigned group)
+{
+	return bcm6318_groups[group].name;
+}
+
+static int bcm6318_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					  unsigned group, const unsigned **pins,
+					  unsigned *num_pins)
+{
+	*pins = bcm6318_groups[group].pins;
+	*num_pins = bcm6318_groups[group].num_pins;
+
+	return 0;
+}
+
+static int bcm6318_pinctrl_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm6318_funcs);
+}
+
+static const char *bcm6318_pinctrl_get_func_name(struct pinctrl_dev *pctldev,
+						 unsigned selector)
+{
+	return bcm6318_funcs[selector].name;
+}
+
+static int bcm6318_pinctrl_get_groups(struct pinctrl_dev *pctldev,
+				      unsigned selector,
+				      const char * const **groups,
+				      unsigned * const num_groups)
+{
+	*groups = bcm6318_funcs[selector].groups;
+	*num_groups = bcm6318_funcs[selector].num_groups;
+
+	return 0;
+}
+
+static inline void bcm6318_rmw_mux(struct bcm63xx_pinctrl *pc, unsigned pin,
+				   unsigned int mode, unsigned int mux)
+{
+	if (pin < BCM63XX_BANK_GPIOS)
+		regmap_update_bits(pc->regs, BCM6318_MODE_REG, BIT(pin),
+				   mode ? BIT(pin) : 0);
+
+	if (pin < BCM6318_NUM_MUX)
+		regmap_update_bits(pc->regs,
+				   bcm6318_mux_off(pin),
+				   BCM6328_MUX_MASK << ((pin % 16) * 2),
+				   mux << ((pin % 16) * 2));
+}
+
+static inline void bcm6318_set_pad(struct bcm63xx_pinctrl *pc, unsigned pin,
+				   uint8_t val)
+{
+	regmap_update_bits(pc->regs, bcm6318_pad_off(pin),
+			   BCM6328_PAD_MASK << ((pin % 8) * 4),
+			   val << ((pin % 8) * 4));
+}
+
+static int bcm6318_pinctrl_set_mux(struct pinctrl_dev *pctldev,
+				   unsigned selector, unsigned group)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm6318_pingroup *pg = &bcm6318_groups[group];
+	const struct bcm6318_function *f = &bcm6318_funcs[selector];
+
+	bcm6318_rmw_mux(pc, pg->pins[0], f->mode_val, f->mux_val);
+
+	return 0;
+}
+
+static int bcm6318_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned offset)
+{
+	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable all functions using this pin */
+	if (offset < 13) {
+		/* GPIOs 0-12 use mux 0 as GPIO function */
+		bcm6318_rmw_mux(pc, offset, 0, 0);
+	} else if (offset < 42) {
+		/* GPIOs 13-41 use mux 3 as GPIO function */
+		bcm6318_rmw_mux(pc, offset, 0, 3);
+
+		bcm6318_set_pad(pc, offset, 0);
+	}
+
+	return 0;
+}
+
+static struct pinctrl_ops bcm6318_pctl_ops = {
+	.dt_free_map = pinctrl_utils_free_map,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.get_group_name = bcm6318_pinctrl_get_group_name,
+	.get_group_pins = bcm6318_pinctrl_get_group_pins,
+	.get_groups_count = bcm6318_pinctrl_get_group_count,
+};
+
+static struct pinmux_ops bcm6318_pmx_ops = {
+	.get_function_groups = bcm6318_pinctrl_get_groups,
+	.get_function_name = bcm6318_pinctrl_get_func_name,
+	.get_functions_count = bcm6318_pinctrl_get_func_count,
+	.gpio_request_enable = bcm6318_gpio_request_enable,
+	.set_mux = bcm6318_pinctrl_set_mux,
+	.strict = true,
+};
+
+static const struct bcm63xx_pinctrl_soc bcm6318_soc = {
+	.ngpios = BCM6318_NUM_GPIOS,
+	.npins = ARRAY_SIZE(bcm6318_pins),
+	.pctl_ops = &bcm6318_pctl_ops,
+	.pins = bcm6318_pins,
+	.pmx_ops = &bcm6318_pmx_ops,
+};
+
+static int bcm6318_pinctrl_probe(struct platform_device *pdev)
+{
+	return bcm63xx_pinctrl_probe(pdev, &bcm6318_soc, NULL);
+}
+
+static const struct of_device_id bcm6318_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm6318-pinctrl", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver bcm6318_pinctrl_driver = {
+	.probe = bcm6318_pinctrl_probe,
+	.driver = {
+		.name = "bcm6318-pinctrl",
+		.of_match_table = bcm6318_pinctrl_match,
+	},
+};
+
+builtin_platform_driver(bcm6318_pinctrl_driver);
-- 
2.20.1


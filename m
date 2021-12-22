Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C872147D088
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 12:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244412AbhLVLLV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 06:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244407AbhLVLLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 06:11:21 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D170C061574;
        Wed, 22 Dec 2021 03:11:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bu9so4572753lfb.7;
        Wed, 22 Dec 2021 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MpWr3+a5ScWDLigwHOqdBcOKsz4BG5+PRD1RswYicG8=;
        b=ZYfM+uEG56PCfP6x2UxqEg/9n6DxVMnxlXbNq0wMkrAqeuTt7jApJCvq280kKtRfNy
         29fK42Dcc7O5d0kH5mFgoG/88GjAcw+WqdsMfkfo5f7GJROmMhxdDV/p+AkXGLV/ASi4
         TVixA56VKNousuwzM11lgJG21h4sHx9gVie3/m1VqlwX/QZHbUpUUD7ySK0iPrrbV2tu
         EXALQwtwOYoupGtYpGYblvgnGY71FdijmJnRaIA9QDUITIbiM7LT4JZdL9/j1GNBIE83
         k73yjETqza6NZx7zXThJEmVR4YFqYp6L/1a/dR1AA2wPTqtzqWIvXCGhyk+zOS5zKjwm
         ErJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MpWr3+a5ScWDLigwHOqdBcOKsz4BG5+PRD1RswYicG8=;
        b=qn3GSoGdpSD+usF5C2xNU33tTg5pbeauxFzsS9SDuhYtz+cjjvoDhFFRhMfcISEaz+
         6xb7ijc1VbNyj+l5R2QCLjwiM079r0eny1guj8yi1FjRX/ZtkSMHePbRjjUR2zSL1urN
         yeomOrHb1RDeUmmylZ99M0gzEgebuxJCqxKFYWNAjqHSoY+1Ex/wvLnZ/tMKha2mpAND
         iypkW37sWi45xOd7nYTrYEn1Uy+m74pOjRo1X7t1r2dQ6EijcOvzJ1V4oyvHe2oqom1R
         OQvuypVQv0wWaFdTauZ5l47L+w2f2LPPg2hEPBvlWjAitUyHg9shll1rVnQyMtELoDOG
         oGrQ==
X-Gm-Message-State: AOAM531o7eLVTJ9yxVRPaBl9USmamPK8lM0hHIBl24fUKCnQoA87BHJ6
        SJ40YO51/V5hRqXa1qW3TbU=
X-Google-Smtp-Source: ABdhPJzPm38ed7rEv7wwO7HM6Tpljr6zvHtmTRIjSxGBaduZqx4J7kmGWgTzDoAsCttNTnJVRzC4FA==
X-Received: by 2002:ac2:4ecb:: with SMTP id p11mr2104236lfr.216.1640171478408;
        Wed, 22 Dec 2021 03:11:18 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id m3sm150935lji.112.2021.12.22.03.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:11:18 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
Date:   Wed, 22 Dec 2021 12:11:08 +0100
Message-Id: <20211222111108.13260-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222111108.13260-1-zajec5@gmail.com>
References: <20211222111108.13260-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

BCM4908 has its own pins layout so it needs a custom binding and a Linux
driver.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This patch targets linux-pinctrl.git for-next. It requires commit
bd0aae66c482 ("pinctrl: add one more "const" for generic function groups")

V2: Formatting fixes
    Kconfig fix
    Cleanup of #include-s
    Use devm_kasprintf_strarray()
---
 MAINTAINERS                           |   1 +
 drivers/pinctrl/bcm/Kconfig           |  14 +
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 563 ++++++++++++++++++++++++++
 4 files changed, 579 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm4908.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e352991484e7..7c927fe25e64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3674,6 +3674,7 @@ M:	bcm-kernel-feedback-list@broadcom.com
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
+F:	drivers/pinctrl/bcm/pinctrl-bcm4908.c
 
 BROADCOM BCM5301X ARM ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 5123f4c33854..57d5bfa5b5f2 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -29,6 +29,20 @@ config PINCTRL_BCM2835
 	help
 	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
+config PINCTRL_BCM4908
+	tristate "Broadcom BCM4908 pinmux driver"
+	depends on ARCH_BCM4908 || COMPILE_TEST
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	default ARCH_BCM4908
+	help
+	  Driver for BCM4908 family SoCs with integrated pin controller.
+
+	  If compiled as module it will be called pinctrl-bcm4908.
+
 config PINCTRL_BCM63XX
 	bool
 	select PINMUX
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 00c7b7775e63..82b868ec1471 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -3,6 +3,7 @@
 
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
+obj-$(CONFIG_PINCTRL_BCM4908)		+= pinctrl-bcm4908.o
 obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
 obj-$(CONFIG_PINCTRL_BCM6318)		+= pinctrl-bcm6318.o
 obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
new file mode 100644
index 000000000000..cdfa165fc033
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl> */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string_helpers.h>
+
+#include "../core.h"
+#include "../pinmux.h"
+
+#define BCM4908_NUM_PINS			86
+
+#define BCM4908_TEST_PORT_BLOCK_EN_LSB			0x00
+#define BCM4908_TEST_PORT_BLOCK_DATA_MSB		0x04
+#define BCM4908_TEST_PORT_BLOCK_DATA_LSB		0x08
+#define  BCM4908_TEST_PORT_LSB_PINMUX_DATA_SHIFT	12
+#define BCM4908_TEST_PORT_COMMAND			0x0c
+#define  BCM4908_TEST_PORT_CMD_LOAD_MUX_REG		0x00000021
+
+struct bcm4908_pinctrl {
+	struct device *dev;
+	void __iomem *base;
+	struct mutex mutex;
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_desc pctldesc;
+};
+
+/*
+ * Groups
+ */
+
+struct bcm4908_pinctrl_pin_setup {
+	unsigned int number;
+	unsigned int function;
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_0_pins_a[] = {
+	{ 0, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_1_pins_a[] = {
+	{ 1, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_2_pins_a[] = {
+	{ 2, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_3_pins_a[] = {
+	{ 3, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_4_pins_a[] = {
+	{ 4, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_5_pins_a[] = {
+	{ 5, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_6_pins_a[] = {
+	{ 6, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_7_pins_a[] = {
+	{ 7, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_8_pins_a[] = {
+	{ 8, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_9_pins_a[] = {
+	{ 9, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_10_pins_a[] = {
+	{ 10, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_11_pins_a[] = {
+	{ 11, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_12_pins_a[] = {
+	{ 12, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_13_pins_a[] = {
+	{ 13, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_14_pins_a[] = {
+	{ 14, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_15_pins_a[] = {
+	{ 15, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_16_pins_a[] = {
+	{ 16, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_17_pins_a[] = {
+	{ 17, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_18_pins_a[] = {
+	{ 18, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_19_pins_a[] = {
+	{ 19, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_20_pins_a[] = {
+	{ 20, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_21_pins_a[] = {
+	{ 21, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_22_pins_a[] = {
+	{ 22, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_23_pins_a[] = {
+	{ 23, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_24_pins_a[] = {
+	{ 24, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_25_pins_a[] = {
+	{ 25, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_26_pins_a[] = {
+	{ 26, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_27_pins_a[] = {
+	{ 27, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_28_pins_a[] = {
+	{ 28, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_29_pins_a[] = {
+	{ 29, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_30_pins_a[] = {
+	{ 30, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_31_pins_a[] = {
+	{ 31, 3 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_10_pins_b[] = {
+	{ 8, 2 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_11_pins_b[] = {
+	{ 9, 2 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_12_pins_b[] = {
+	{ 0, 2 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_13_pins_b[] = {
+	{ 1, 2 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup led_31_pins_b[] = {
+	{ 30, 2 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup hs_uart_pins[] = {
+	{ 10, 0 },	/* CTS */
+	{ 11, 0 },	/* RTS */
+	{ 12, 0 },	/* RXD */
+	{ 13, 0 },	/* TXD */
+};
+
+static const struct bcm4908_pinctrl_pin_setup i2c_pins_a[] = {
+	{ 18, 0 },	/* SDA */
+	{ 19, 0 },	/* SCL */
+};
+
+static const struct bcm4908_pinctrl_pin_setup i2c_pins_b[] = {
+	{ 22, 0 },	/* SDA */
+	{ 23, 0 },	/* SCL */
+};
+
+static const struct bcm4908_pinctrl_pin_setup i2s_pins[] = {
+	{ 27, 0 },	/* MCLK */
+	{ 28, 0 },	/* LRCK */
+	{ 29, 0 },	/* SDATA */
+	{ 30, 0 },	/* SCLK */
+};
+
+static const struct bcm4908_pinctrl_pin_setup nand_ctrl_pins[] = {
+	{ 32, 0 },
+	{ 33, 0 },
+	{ 34, 0 },
+	{ 43, 0 },
+	{ 44, 0 },
+	{ 45, 0 },
+	{ 56, 1 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup nand_data_pins[] = {
+	{ 35, 0 },
+	{ 36, 0 },
+	{ 37, 0 },
+	{ 38, 0 },
+	{ 39, 0 },
+	{ 40, 0 },
+	{ 41, 0 },
+	{ 42, 0 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup emmc_ctrl_pins[] = {
+	{ 46, 0 },
+	{ 47, 0 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup usb0_pwr_pins[] = {
+	{ 63, 0 },
+	{ 64, 0 },
+};
+
+static const struct bcm4908_pinctrl_pin_setup usb1_pwr_pins[] = {
+	{ 66, 0 },
+	{ 67, 0 },
+};
+
+struct bcm4908_pinctrl_grp {
+	const char *name;
+	const struct bcm4908_pinctrl_pin_setup *pins;
+	const unsigned int num_pins;
+};
+
+static const struct bcm4908_pinctrl_grp bcm4908_pinctrl_grps[] = {
+	{ "led_0_grp_a", led_0_pins_a, ARRAY_SIZE(led_0_pins_a) },
+	{ "led_1_grp_a", led_1_pins_a, ARRAY_SIZE(led_1_pins_a) },
+	{ "led_2_grp_a", led_2_pins_a, ARRAY_SIZE(led_2_pins_a) },
+	{ "led_3_grp_a", led_3_pins_a, ARRAY_SIZE(led_3_pins_a) },
+	{ "led_4_grp_a", led_4_pins_a, ARRAY_SIZE(led_4_pins_a) },
+	{ "led_5_grp_a", led_5_pins_a, ARRAY_SIZE(led_5_pins_a) },
+	{ "led_6_grp_a", led_6_pins_a, ARRAY_SIZE(led_6_pins_a) },
+	{ "led_7_grp_a", led_7_pins_a, ARRAY_SIZE(led_7_pins_a) },
+	{ "led_8_grp_a", led_8_pins_a, ARRAY_SIZE(led_8_pins_a) },
+	{ "led_9_grp_a", led_9_pins_a, ARRAY_SIZE(led_9_pins_a) },
+	{ "led_10_grp_a", led_10_pins_a, ARRAY_SIZE(led_10_pins_a) },
+	{ "led_11_grp_a", led_11_pins_a, ARRAY_SIZE(led_11_pins_a) },
+	{ "led_12_grp_a", led_12_pins_a, ARRAY_SIZE(led_12_pins_a) },
+	{ "led_13_grp_a", led_13_pins_a, ARRAY_SIZE(led_13_pins_a) },
+	{ "led_14_grp_a", led_14_pins_a, ARRAY_SIZE(led_14_pins_a) },
+	{ "led_15_grp_a", led_15_pins_a, ARRAY_SIZE(led_15_pins_a) },
+	{ "led_16_grp_a", led_16_pins_a, ARRAY_SIZE(led_16_pins_a) },
+	{ "led_17_grp_a", led_17_pins_a, ARRAY_SIZE(led_17_pins_a) },
+	{ "led_18_grp_a", led_18_pins_a, ARRAY_SIZE(led_18_pins_a) },
+	{ "led_19_grp_a", led_19_pins_a, ARRAY_SIZE(led_19_pins_a) },
+	{ "led_20_grp_a", led_20_pins_a, ARRAY_SIZE(led_20_pins_a) },
+	{ "led_21_grp_a", led_21_pins_a, ARRAY_SIZE(led_21_pins_a) },
+	{ "led_22_grp_a", led_22_pins_a, ARRAY_SIZE(led_22_pins_a) },
+	{ "led_23_grp_a", led_23_pins_a, ARRAY_SIZE(led_23_pins_a) },
+	{ "led_24_grp_a", led_24_pins_a, ARRAY_SIZE(led_24_pins_a) },
+	{ "led_25_grp_a", led_25_pins_a, ARRAY_SIZE(led_25_pins_a) },
+	{ "led_26_grp_a", led_26_pins_a, ARRAY_SIZE(led_26_pins_a) },
+	{ "led_27_grp_a", led_27_pins_a, ARRAY_SIZE(led_27_pins_a) },
+	{ "led_28_grp_a", led_28_pins_a, ARRAY_SIZE(led_28_pins_a) },
+	{ "led_29_grp_a", led_29_pins_a, ARRAY_SIZE(led_29_pins_a) },
+	{ "led_30_grp_a", led_30_pins_a, ARRAY_SIZE(led_30_pins_a) },
+	{ "led_31_grp_a", led_31_pins_a, ARRAY_SIZE(led_31_pins_a) },
+	{ "led_10_grp_b", led_10_pins_b, ARRAY_SIZE(led_10_pins_b) },
+	{ "led_11_grp_b", led_11_pins_b, ARRAY_SIZE(led_11_pins_b) },
+	{ "led_12_grp_b", led_12_pins_b, ARRAY_SIZE(led_12_pins_b) },
+	{ "led_13_grp_b", led_13_pins_b, ARRAY_SIZE(led_13_pins_b) },
+	{ "led_31_grp_b", led_31_pins_b, ARRAY_SIZE(led_31_pins_b) },
+	{ "hs_uart_grp", hs_uart_pins, ARRAY_SIZE(hs_uart_pins) },
+	{ "i2c_grp_a", i2c_pins_a, ARRAY_SIZE(i2c_pins_a) },
+	{ "i2c_grp_b", i2c_pins_b, ARRAY_SIZE(i2c_pins_b) },
+	{ "i2s_grp", i2s_pins, ARRAY_SIZE(i2s_pins) },
+	{ "nand_ctrl_grp", nand_ctrl_pins, ARRAY_SIZE(nand_ctrl_pins) },
+	{ "nand_data_grp", nand_data_pins, ARRAY_SIZE(nand_data_pins) },
+	{ "emmc_ctrl_grp", emmc_ctrl_pins, ARRAY_SIZE(emmc_ctrl_pins) },
+	{ "usb0_pwr_grp", usb0_pwr_pins, ARRAY_SIZE(usb0_pwr_pins) },
+	{ "usb1_pwr_grp", usb1_pwr_pins, ARRAY_SIZE(usb1_pwr_pins) },
+};
+
+/*
+ * Functions
+ */
+
+struct bcm4908_pinctrl_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned int num_groups;
+};
+
+static const char * const led_0_groups[] = { "led_0_grp_a" };
+static const char * const led_1_groups[] = { "led_1_grp_a" };
+static const char * const led_2_groups[] = { "led_2_grp_a" };
+static const char * const led_3_groups[] = { "led_3_grp_a" };
+static const char * const led_4_groups[] = { "led_4_grp_a" };
+static const char * const led_5_groups[] = { "led_5_grp_a" };
+static const char * const led_6_groups[] = { "led_6_grp_a" };
+static const char * const led_7_groups[] = { "led_7_grp_a" };
+static const char * const led_8_groups[] = { "led_8_grp_a" };
+static const char * const led_9_groups[] = { "led_9_grp_a" };
+static const char * const led_10_groups[] = { "led_10_grp_a", "led_10_grp_b" };
+static const char * const led_11_groups[] = { "led_11_grp_a", "led_11_grp_b" };
+static const char * const led_12_groups[] = { "led_12_grp_a", "led_12_grp_b" };
+static const char * const led_13_groups[] = { "led_13_grp_a", "led_13_grp_b" };
+static const char * const led_14_groups[] = { "led_14_grp_a" };
+static const char * const led_15_groups[] = { "led_15_grp_a" };
+static const char * const led_16_groups[] = { "led_16_grp_a" };
+static const char * const led_17_groups[] = { "led_17_grp_a" };
+static const char * const led_18_groups[] = { "led_18_grp_a" };
+static const char * const led_19_groups[] = { "led_19_grp_a" };
+static const char * const led_20_groups[] = { "led_20_grp_a" };
+static const char * const led_21_groups[] = { "led_21_grp_a" };
+static const char * const led_22_groups[] = { "led_22_grp_a" };
+static const char * const led_23_groups[] = { "led_23_grp_a" };
+static const char * const led_24_groups[] = { "led_24_grp_a" };
+static const char * const led_25_groups[] = { "led_25_grp_a" };
+static const char * const led_26_groups[] = { "led_26_grp_a" };
+static const char * const led_27_groups[] = { "led_27_grp_a" };
+static const char * const led_28_groups[] = { "led_28_grp_a" };
+static const char * const led_29_groups[] = { "led_29_grp_a" };
+static const char * const led_30_groups[] = { "led_30_grp_a" };
+static const char * const led_31_groups[] = { "led_31_grp_a", "led_31_grp_b" };
+static const char * const hs_uart_groups[] = { "hs_uart_grp" };
+static const char * const i2c_groups[] = { "i2c_grp_a", "i2c_grp_b" };
+static const char * const i2s_groups[] = { "i2s_grp" };
+static const char * const nand_ctrl_groups[] = { "nand_ctrl_grp" };
+static const char * const nand_data_groups[] = { "nand_data_grp" };
+static const char * const emmc_ctrl_groups[] = { "emmc_ctrl_grp" };
+static const char * const usb0_pwr_groups[] = { "usb0_pwr_grp" };
+static const char * const usb1_pwr_groups[] = { "usb1_pwr_grp" };
+
+static const struct bcm4908_pinctrl_function bcm4908_pinctrl_functions[] = {
+	{ "led_0", led_0_groups, ARRAY_SIZE(led_0_groups) },
+	{ "led_1", led_1_groups, ARRAY_SIZE(led_1_groups) },
+	{ "led_2", led_2_groups, ARRAY_SIZE(led_2_groups) },
+	{ "led_3", led_3_groups, ARRAY_SIZE(led_3_groups) },
+	{ "led_4", led_4_groups, ARRAY_SIZE(led_4_groups) },
+	{ "led_5", led_5_groups, ARRAY_SIZE(led_5_groups) },
+	{ "led_6", led_6_groups, ARRAY_SIZE(led_6_groups) },
+	{ "led_7", led_7_groups, ARRAY_SIZE(led_7_groups) },
+	{ "led_8", led_8_groups, ARRAY_SIZE(led_8_groups) },
+	{ "led_9", led_9_groups, ARRAY_SIZE(led_9_groups) },
+	{ "led_10", led_10_groups, ARRAY_SIZE(led_10_groups) },
+	{ "led_11", led_11_groups, ARRAY_SIZE(led_11_groups) },
+	{ "led_12", led_12_groups, ARRAY_SIZE(led_12_groups) },
+	{ "led_13", led_13_groups, ARRAY_SIZE(led_13_groups) },
+	{ "led_14", led_14_groups, ARRAY_SIZE(led_14_groups) },
+	{ "led_15", led_15_groups, ARRAY_SIZE(led_15_groups) },
+	{ "led_16", led_16_groups, ARRAY_SIZE(led_16_groups) },
+	{ "led_17", led_17_groups, ARRAY_SIZE(led_17_groups) },
+	{ "led_18", led_18_groups, ARRAY_SIZE(led_18_groups) },
+	{ "led_19", led_19_groups, ARRAY_SIZE(led_19_groups) },
+	{ "led_20", led_20_groups, ARRAY_SIZE(led_20_groups) },
+	{ "led_21", led_21_groups, ARRAY_SIZE(led_21_groups) },
+	{ "led_22", led_22_groups, ARRAY_SIZE(led_22_groups) },
+	{ "led_23", led_23_groups, ARRAY_SIZE(led_23_groups) },
+	{ "led_24", led_24_groups, ARRAY_SIZE(led_24_groups) },
+	{ "led_25", led_25_groups, ARRAY_SIZE(led_25_groups) },
+	{ "led_26", led_26_groups, ARRAY_SIZE(led_26_groups) },
+	{ "led_27", led_27_groups, ARRAY_SIZE(led_27_groups) },
+	{ "led_28", led_28_groups, ARRAY_SIZE(led_28_groups) },
+	{ "led_29", led_29_groups, ARRAY_SIZE(led_29_groups) },
+	{ "led_30", led_30_groups, ARRAY_SIZE(led_30_groups) },
+	{ "led_31", led_31_groups, ARRAY_SIZE(led_31_groups) },
+	{ "hs_uart", hs_uart_groups, ARRAY_SIZE(hs_uart_groups) },
+	{ "i2c", i2c_groups, ARRAY_SIZE(i2c_groups) },
+	{ "i2s", i2s_groups, ARRAY_SIZE(i2s_groups) },
+	{ "nand_ctrl", nand_ctrl_groups, ARRAY_SIZE(nand_ctrl_groups) },
+	{ "nand_data", nand_data_groups, ARRAY_SIZE(nand_data_groups) },
+	{ "emmc_ctrl", emmc_ctrl_groups, ARRAY_SIZE(emmc_ctrl_groups) },
+	{ "usb0_pwr", usb0_pwr_groups, ARRAY_SIZE(usb0_pwr_groups) },
+	{ "usb1_pwr", usb1_pwr_groups, ARRAY_SIZE(usb1_pwr_groups) },
+};
+
+/*
+ * Groups code
+ */
+
+static const struct pinctrl_ops bcm4908_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+/*
+ * Functions code
+ */
+
+static int bcm4908_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
+			      unsigned int func_selector,
+			      unsigned int group_selector)
+{
+	struct bcm4908_pinctrl *bcm4908_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct bcm4908_pinctrl_grp *group;
+	struct group_desc *group_desc;
+	int i;
+
+	group_desc = pinctrl_generic_get_group(pctrl_dev, group_selector);
+	if (!group_desc)
+		return -EINVAL;
+	group = group_desc->data;
+
+	mutex_lock(&bcm4908_pinctrl->mutex);
+	for (i = 0; i < group->num_pins; i++) {
+		u32 lsb = 0;
+
+		lsb |= group->pins[i].number;
+		lsb |= group->pins[i].function << BCM4908_TEST_PORT_LSB_PINMUX_DATA_SHIFT;
+
+		writel(0x0, bcm4908_pinctrl->base + BCM4908_TEST_PORT_BLOCK_DATA_MSB);
+		writel(lsb, bcm4908_pinctrl->base + BCM4908_TEST_PORT_BLOCK_DATA_LSB);
+		writel(BCM4908_TEST_PORT_CMD_LOAD_MUX_REG,
+		       bcm4908_pinctrl->base + BCM4908_TEST_PORT_COMMAND);
+	}
+	mutex_unlock(&bcm4908_pinctrl->mutex);
+
+	return 0;
+}
+
+static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = bcm4908_pinctrl_set_mux,
+};
+
+/*
+ * Controller code
+ */
+
+static struct pinctrl_desc bcm4908_pinctrl_desc = {
+	.name = "bcm4908-pinctrl",
+	.pctlops = &bcm4908_pinctrl_ops,
+	.pmxops = &bcm4908_pinctrl_pmxops,
+};
+
+static const struct of_device_id bcm4908_pinctrl_of_match_table[] = {
+	{ .compatible = "brcm,bcm4908-pinctrl", },
+	{ }
+};
+
+static int bcm4908_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bcm4908_pinctrl *bcm4908_pinctrl;
+	struct pinctrl_desc *pctldesc;
+	struct pinctrl_pin_desc *pins;
+	char **pin_names;
+	int i;
+
+	bcm4908_pinctrl = devm_kzalloc(dev, sizeof(*bcm4908_pinctrl), GFP_KERNEL);
+	if (!bcm4908_pinctrl)
+		return -ENOMEM;
+	pctldesc = &bcm4908_pinctrl->pctldesc;
+	platform_set_drvdata(pdev, bcm4908_pinctrl);
+
+	/* Set basic properties */
+
+	bcm4908_pinctrl->dev = dev;
+
+	bcm4908_pinctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bcm4908_pinctrl->base))
+		return PTR_ERR(bcm4908_pinctrl->base);
+
+	mutex_init(&bcm4908_pinctrl->mutex);
+
+	memcpy(pctldesc, &bcm4908_pinctrl_desc, sizeof(*pctldesc));
+
+	/* Set pinctrl properties */
+
+	pin_names = devm_kasprintf_strarray(dev, "pin", BCM4908_NUM_PINS);
+	if (IS_ERR(pin_names))
+		return PTR_ERR(pin_names);
+
+	pins = devm_kcalloc(dev, BCM4908_NUM_PINS, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+	for (i = 0; i < BCM4908_NUM_PINS; i++) {
+		pins[i].number = i;
+		pins[i].name = pin_names[i];
+	}
+	pctldesc->pins = pins;
+	pctldesc->npins = BCM4908_NUM_PINS;
+
+	/* Register */
+
+	bcm4908_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, bcm4908_pinctrl);
+	if (IS_ERR(bcm4908_pinctrl->pctldev))
+		return dev_err_probe(dev, PTR_ERR(bcm4908_pinctrl->pctldev),
+				     "Failed to register pinctrl\n");
+
+	/* Groups */
+
+	for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_grps); i++) {
+		const struct bcm4908_pinctrl_grp *group = &bcm4908_pinctrl_grps[i];
+		int *pins;
+		int j;
+
+		pins = devm_kcalloc(dev, group->num_pins, sizeof(*pins), GFP_KERNEL);
+		if (!pins)
+			return -ENOMEM;
+		for (j = 0; j < group->num_pins; j++)
+			pins[j] = group->pins[j].number;
+
+		pinctrl_generic_add_group(bcm4908_pinctrl->pctldev, group->name,
+					  pins, group->num_pins, (void *)group);
+	}
+
+	/* Functions */
+
+	for (i = 0; i < ARRAY_SIZE(bcm4908_pinctrl_functions); i++) {
+		const struct bcm4908_pinctrl_function *function = &bcm4908_pinctrl_functions[i];
+
+		pinmux_generic_add_function(bcm4908_pinctrl->pctldev,
+					    function->name,
+					    function->groups,
+					    function->num_groups, NULL);
+	}
+
+	return 0;
+}
+
+static struct platform_driver bcm4908_pinctrl_driver = {
+	.probe = bcm4908_pinctrl_probe,
+	.driver = {
+		.name = "bcm4908-pinctrl",
+		.of_match_table = bcm4908_pinctrl_of_match_table,
+	},
+};
+
+module_platform_driver(bcm4908_pinctrl_driver);
+
+MODULE_AUTHOR("Rafał Miłecki");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
-- 
2.31.1


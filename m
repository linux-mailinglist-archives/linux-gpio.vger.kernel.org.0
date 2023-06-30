Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F78C74408E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 18:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbjF3Q7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 12:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjF3Q7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 12:59:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A104222
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:58:53 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-313fb7f0f80so2378208f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144331; x=1690736331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zg1sF0UIhXU4VbTlhGZpYL6jVSAOKsNDZIdGApdh4Y=;
        b=km8l8QjPbFt+oYCtaF0LKIHQFAaWR7MANPdu/7TTFROCizBwPNhZnYFLV9Yz/iq6X/
         R4qC4FnsCH/x6DgQPrrkKxJk3CLafrankOMY5JiG8rW5dd3UGsUa/yuAgINlSnrdeyi0
         FYTxxvKXJfxP6X//yhxgQ1LjSs99n4IWKlg+YApYjOmvzRwjnrQOYbKjSqvnygOwNCw3
         Q+0TRX6WBtYu6Mrz+n66Lq1qHwDJh3AVe2ovdtM2lOoVcDVuTYkOGoGl2i3I5F6+hWmp
         3zLRSecrz1mCQNubvy9YHAncVD9re2Mj+OAVbciQNuHxyydv/sOQJMoyQp6AFkJs0kKL
         m71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144331; x=1690736331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zg1sF0UIhXU4VbTlhGZpYL6jVSAOKsNDZIdGApdh4Y=;
        b=hLwpKX6i17RwWvAG13zP5eMIU2Qn60YIbSdz5CD8u/hwTFXT7/8Nh7bDcGWX0gva4I
         hRbUFX0KzamYD1X1wDiH71AJ7QeVBryYydaZvG9sqj38QpgX2gjyiHG/OwR0dWNDGOfX
         iggUHAu+txEweI0js9TEHKTRp641WCqytUnsgWLedn6UcOdU8m94bc3pDJTLYOqNLu+0
         fwefjLj/ER5t7aJSQ/mUE8MoP7IY6NTEOQCh2pHEf60oMPliB6vqn02YmKY9E97AHVZW
         fyAyags5ck6mC5ElYndVcCyJ9TEH9asc6Wuxp0mRfQ3Vq8enBP+T6SFFm5LKfccNETvT
         GUMg==
X-Gm-Message-State: ABy/qLbvb/c5YTKhCnkLK+Gnml9p1ZC68krlHolQ6Frc0NCo/Ocrwvbj
        R/4im/AqXVKGf2qzmCI+PvAsoKi+Db5lYiMKQKyinQ==
X-Google-Smtp-Source: APBJJlEhxfvxkt15rEUBnAyjX39VsckSKORfhX5eaVzwMxvp732JbQqQrPmgk56aht5SpMva6+VLrA==
X-Received: by 2002:adf:f049:0:b0:309:1532:8287 with SMTP id t9-20020adff049000000b0030915328287mr2857912wro.19.1688144331226;
        Fri, 30 Jun 2023 09:58:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:50 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:58:34 +0200
Subject: [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=41138;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0F3ViCZzMXLvzHUyUuJcin8s65eC9Y61ySet6oy0B5s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm30b2exmFhKIOhECYo/VV5bgmGaGZpMWK2981X
 n/50bNSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtwAKCRB33NvayMhJ0RhmD/
 9jq+nfR8ZZbsssVkdwvPV30mOsQNTSLyTmIGA5ksob657XPpc6WdiU+X6Zmxh1TS4wp+hZUZ2UmCEz
 JRnOb6A7XYgGm2xLvbLvnNfWZjQp9BUhE+olXQiPMa0TUNZ38tJPObNJtP0S16wjGWR3FYzHAemG3k
 9ToRzAqArVRgB0DBPAzC1eu7fjwUwV5Qm2WWp0td/j0Z4NyGJoJ1UNhdN8wGnsPX1+8+easUFw1Y2t
 ZxEAliyybvYotHegZX9+fAQrTqGc4sc146SeR15HE9+dyS9APgYUQ3KzGzd2ZA97QYhMb1r1yIJQHS
 1O8qNszovNWuOtnel+KL/tD4QA+rtioJNh4+JtAfDutRW73aeaEueYXqyiMY0BnIH28IDEERhjS4jk
 P/UpQXHrJ1G2Ry5YvEynovkD01U0ybiYL3fj+H7u7nwm6yu9pgY3I1fwlxzShVw6R9TbOAFyVeDKTR
 WlaWMSsvzaVTWPJkkiaeO5Pnp1iHi12936d9b5pZAMIdY7KZE7YpPR2pCK3l3bXUPWozHkrj3nGiDy
 KDRmc8ds3BrfwLwM7gxu08DIg9HkAcyshQ9gdsMklN1SRdtjxPd5iPJdD7v+fu2N4JCm6MgI5ayeaf
 oJEOnG0DGquLJLJkr4qLpZxeD2dW1afJPpQzsRx14gUcEyzCSv945DhHqv1g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 pinctrl & gpio.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/Kconfig         |   11 -
 drivers/pinctrl/Makefile        |    1 -
 drivers/pinctrl/pinctrl-oxnas.c | 1292 ---------------------------------------
 3 files changed, 1304 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 57d57af1f624..7dfb7190580e 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -355,17 +355,6 @@ config PINCTRL_OCELOT
 
 	  If conpiled as a module, the module name will be pinctrl-ocelot.
 
-config PINCTRL_OXNAS
-	bool
-	depends on OF
-	select PINMUX
-	select PINCONF
-	select GENERIC_PINCONF
-	select GPIOLIB
-	select OF_GPIO
-	select GPIOLIB_IRQCHIP
-	select MFD_SYSCON
-
 config PINCTRL_PALMAS
 	tristate "Pinctrl driver for the PALMAS Series MFD devices"
 	depends on OF && MFD_PALMAS
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 482b391b5deb..dd6cda270294 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -38,7 +38,6 @@ obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
 obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+= pinctrl-microchip-sgpio.o
 obj-$(CONFIG_PINCTRL_MLXBF3)	+= pinctrl-mlxbf3.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
-obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
deleted file mode 100644
index fb10a8473ebe..000000000000
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ /dev/null
@@ -1,1292 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Oxford Semiconductor OXNAS SoC Family pinctrl driver
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- *
- * Based on pinctrl-pic32.c
- * Joshua Henderson, <joshua.henderson@microchip.com>
- * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
- */
-#include <linux/gpio/driver.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-
-#include "pinctrl-utils.h"
-
-#define PINS_PER_BANK		32
-
-#define GPIO_BANK_START(bank)		((bank) * PINS_PER_BANK)
-
-/* OX810 Regmap Offsets */
-#define PINMUX_810_PRIMARY_SEL0		0x0c
-#define PINMUX_810_SECONDARY_SEL0	0x14
-#define PINMUX_810_TERTIARY_SEL0	0x8c
-#define PINMUX_810_PRIMARY_SEL1		0x10
-#define PINMUX_810_SECONDARY_SEL1	0x18
-#define PINMUX_810_TERTIARY_SEL1	0x90
-#define PINMUX_810_PULLUP_CTRL0		0xac
-#define PINMUX_810_PULLUP_CTRL1		0xb0
-
-/* OX820 Regmap Offsets */
-#define PINMUX_820_BANK_OFFSET		0x100000
-#define PINMUX_820_SECONDARY_SEL	0x14
-#define PINMUX_820_TERTIARY_SEL		0x8c
-#define PINMUX_820_QUATERNARY_SEL	0x94
-#define PINMUX_820_DEBUG_SEL		0x9c
-#define PINMUX_820_ALTERNATIVE_SEL	0xa4
-#define PINMUX_820_PULLUP_CTRL		0xac
-
-/* GPIO Registers */
-#define INPUT_VALUE	0x00
-#define OUTPUT_EN	0x04
-#define IRQ_PENDING	0x0c
-#define OUTPUT_SET	0x14
-#define OUTPUT_CLEAR	0x18
-#define OUTPUT_EN_SET	0x1c
-#define OUTPUT_EN_CLEAR	0x20
-#define RE_IRQ_ENABLE	0x28
-#define FE_IRQ_ENABLE	0x2c
-
-struct oxnas_function {
-	const char *name;
-	const char * const *groups;
-	unsigned int ngroups;
-};
-
-struct oxnas_pin_group {
-	const char *name;
-	unsigned int pin;
-	unsigned int bank;
-	struct oxnas_desc_function *functions;
-};
-
-struct oxnas_desc_function {
-	const char *name;
-	unsigned int fct;
-};
-
-struct oxnas_gpio_bank {
-	void __iomem *reg_base;
-	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
-	unsigned int id;
-};
-
-struct oxnas_pinctrl {
-	struct regmap *regmap;
-	struct device *dev;
-	struct pinctrl_dev *pctldev;
-	const struct oxnas_function *functions;
-	unsigned int nfunctions;
-	const struct oxnas_pin_group *groups;
-	unsigned int ngroups;
-	struct oxnas_gpio_bank *gpio_banks;
-	unsigned int nbanks;
-};
-
-struct oxnas_pinctrl_data {
-	struct pinctrl_desc *desc;
-	struct oxnas_pinctrl *pctl;
-};
-
-static const struct pinctrl_pin_desc oxnas_ox810se_pins[] = {
-	PINCTRL_PIN(0, "gpio0"),
-	PINCTRL_PIN(1, "gpio1"),
-	PINCTRL_PIN(2, "gpio2"),
-	PINCTRL_PIN(3, "gpio3"),
-	PINCTRL_PIN(4, "gpio4"),
-	PINCTRL_PIN(5, "gpio5"),
-	PINCTRL_PIN(6, "gpio6"),
-	PINCTRL_PIN(7, "gpio7"),
-	PINCTRL_PIN(8, "gpio8"),
-	PINCTRL_PIN(9, "gpio9"),
-	PINCTRL_PIN(10, "gpio10"),
-	PINCTRL_PIN(11, "gpio11"),
-	PINCTRL_PIN(12, "gpio12"),
-	PINCTRL_PIN(13, "gpio13"),
-	PINCTRL_PIN(14, "gpio14"),
-	PINCTRL_PIN(15, "gpio15"),
-	PINCTRL_PIN(16, "gpio16"),
-	PINCTRL_PIN(17, "gpio17"),
-	PINCTRL_PIN(18, "gpio18"),
-	PINCTRL_PIN(19, "gpio19"),
-	PINCTRL_PIN(20, "gpio20"),
-	PINCTRL_PIN(21, "gpio21"),
-	PINCTRL_PIN(22, "gpio22"),
-	PINCTRL_PIN(23, "gpio23"),
-	PINCTRL_PIN(24, "gpio24"),
-	PINCTRL_PIN(25, "gpio25"),
-	PINCTRL_PIN(26, "gpio26"),
-	PINCTRL_PIN(27, "gpio27"),
-	PINCTRL_PIN(28, "gpio28"),
-	PINCTRL_PIN(29, "gpio29"),
-	PINCTRL_PIN(30, "gpio30"),
-	PINCTRL_PIN(31, "gpio31"),
-	PINCTRL_PIN(32, "gpio32"),
-	PINCTRL_PIN(33, "gpio33"),
-	PINCTRL_PIN(34, "gpio34"),
-};
-
-static const struct pinctrl_pin_desc oxnas_ox820_pins[] = {
-	PINCTRL_PIN(0, "gpio0"),
-	PINCTRL_PIN(1, "gpio1"),
-	PINCTRL_PIN(2, "gpio2"),
-	PINCTRL_PIN(3, "gpio3"),
-	PINCTRL_PIN(4, "gpio4"),
-	PINCTRL_PIN(5, "gpio5"),
-	PINCTRL_PIN(6, "gpio6"),
-	PINCTRL_PIN(7, "gpio7"),
-	PINCTRL_PIN(8, "gpio8"),
-	PINCTRL_PIN(9, "gpio9"),
-	PINCTRL_PIN(10, "gpio10"),
-	PINCTRL_PIN(11, "gpio11"),
-	PINCTRL_PIN(12, "gpio12"),
-	PINCTRL_PIN(13, "gpio13"),
-	PINCTRL_PIN(14, "gpio14"),
-	PINCTRL_PIN(15, "gpio15"),
-	PINCTRL_PIN(16, "gpio16"),
-	PINCTRL_PIN(17, "gpio17"),
-	PINCTRL_PIN(18, "gpio18"),
-	PINCTRL_PIN(19, "gpio19"),
-	PINCTRL_PIN(20, "gpio20"),
-	PINCTRL_PIN(21, "gpio21"),
-	PINCTRL_PIN(22, "gpio22"),
-	PINCTRL_PIN(23, "gpio23"),
-	PINCTRL_PIN(24, "gpio24"),
-	PINCTRL_PIN(25, "gpio25"),
-	PINCTRL_PIN(26, "gpio26"),
-	PINCTRL_PIN(27, "gpio27"),
-	PINCTRL_PIN(28, "gpio28"),
-	PINCTRL_PIN(29, "gpio29"),
-	PINCTRL_PIN(30, "gpio30"),
-	PINCTRL_PIN(31, "gpio31"),
-	PINCTRL_PIN(32, "gpio32"),
-	PINCTRL_PIN(33, "gpio33"),
-	PINCTRL_PIN(34, "gpio34"),
-	PINCTRL_PIN(35, "gpio35"),
-	PINCTRL_PIN(36, "gpio36"),
-	PINCTRL_PIN(37, "gpio37"),
-	PINCTRL_PIN(38, "gpio38"),
-	PINCTRL_PIN(39, "gpio39"),
-	PINCTRL_PIN(40, "gpio40"),
-	PINCTRL_PIN(41, "gpio41"),
-	PINCTRL_PIN(42, "gpio42"),
-	PINCTRL_PIN(43, "gpio43"),
-	PINCTRL_PIN(44, "gpio44"),
-	PINCTRL_PIN(45, "gpio45"),
-	PINCTRL_PIN(46, "gpio46"),
-	PINCTRL_PIN(47, "gpio47"),
-	PINCTRL_PIN(48, "gpio48"),
-	PINCTRL_PIN(49, "gpio49"),
-};
-
-static const char * const oxnas_ox810se_fct0_group[] = {
-	"gpio0",  "gpio1",  "gpio2",  "gpio3",
-	"gpio4",  "gpio5",  "gpio6",  "gpio7",
-	"gpio8",  "gpio9",  "gpio10", "gpio11",
-	"gpio12", "gpio13", "gpio14", "gpio15",
-	"gpio16", "gpio17", "gpio18", "gpio19",
-	"gpio20", "gpio21", "gpio22", "gpio23",
-	"gpio24", "gpio25", "gpio26", "gpio27",
-	"gpio28", "gpio29", "gpio30", "gpio31",
-	"gpio32", "gpio33", "gpio34"
-};
-
-static const char * const oxnas_ox810se_fct3_group[] = {
-	"gpio0",  "gpio1",  "gpio2",  "gpio3",
-	"gpio4",  "gpio5",  "gpio6",  "gpio7",
-	"gpio8",  "gpio9",
-	"gpio20",
-	"gpio22", "gpio23", "gpio24", "gpio25",
-	"gpio26", "gpio27", "gpio28", "gpio29",
-	"gpio30", "gpio31", "gpio32", "gpio33",
-	"gpio34"
-};
-
-static const char * const oxnas_ox820_fct0_group[] = {
-	"gpio0",  "gpio1",  "gpio2",  "gpio3",
-	"gpio4",  "gpio5",  "gpio6",  "gpio7",
-	"gpio8",  "gpio9",  "gpio10", "gpio11",
-	"gpio12", "gpio13", "gpio14", "gpio15",
-	"gpio16", "gpio17", "gpio18", "gpio19",
-	"gpio20", "gpio21", "gpio22", "gpio23",
-	"gpio24", "gpio25", "gpio26", "gpio27",
-	"gpio28", "gpio29", "gpio30", "gpio31",
-	"gpio32", "gpio33", "gpio34", "gpio35",
-	"gpio36", "gpio37", "gpio38", "gpio39",
-	"gpio40", "gpio41", "gpio42", "gpio43",
-	"gpio44", "gpio45", "gpio46", "gpio47",
-	"gpio48", "gpio49"
-};
-
-static const char * const oxnas_ox820_fct1_group[] = {
-	"gpio3", "gpio4",
-	"gpio12", "gpio13", "gpio14", "gpio15",
-	"gpio16", "gpio17", "gpio18", "gpio19",
-	"gpio20", "gpio21", "gpio22", "gpio23",
-	"gpio24"
-};
-
-static const char * const oxnas_ox820_fct4_group[] = {
-	"gpio5", "gpio6", "gpio7", "gpio8",
-	"gpio24", "gpio25", "gpio26", "gpio27",
-	"gpio40", "gpio41", "gpio42", "gpio43"
-};
-
-static const char * const oxnas_ox820_fct5_group[] = {
-	"gpio28", "gpio29", "gpio30", "gpio31"
-};
-
-#define FUNCTION(_name, _gr)					\
-	{							\
-		.name = #_name,					\
-		.groups = oxnas_##_gr##_group,			\
-		.ngroups = ARRAY_SIZE(oxnas_##_gr##_group),	\
-	}
-
-static const struct oxnas_function oxnas_ox810se_functions[] = {
-	FUNCTION(gpio, ox810se_fct0),
-	FUNCTION(fct3, ox810se_fct3),
-};
-
-static const struct oxnas_function oxnas_ox820_functions[] = {
-	FUNCTION(gpio, ox820_fct0),
-	FUNCTION(fct1, ox820_fct1),
-	FUNCTION(fct4, ox820_fct4),
-	FUNCTION(fct5, ox820_fct5),
-};
-
-#define OXNAS_PINCTRL_GROUP(_pin, _name, ...)				\
-	{								\
-		.name = #_name,						\
-		.pin = _pin,						\
-		.bank = _pin / PINS_PER_BANK,				\
-		.functions = (struct oxnas_desc_function[]){		\
-			__VA_ARGS__, { } },				\
-	}
-
-#define OXNAS_PINCTRL_FUNCTION(_name, _fct)		\
-	{						\
-		.name = #_name,				\
-		.fct = _fct,				\
-	}
-
-static const struct oxnas_pin_group oxnas_ox810se_groups[] = {
-	OXNAS_PINCTRL_GROUP(0, gpio0,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(1, gpio1,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(2, gpio2,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(3, gpio3,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(4, gpio4,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(5, gpio5,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(6, gpio6,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(7, gpio7,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(8, gpio8,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(9, gpio9,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(10, gpio10,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(11, gpio11,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(12, gpio12,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(13, gpio13,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(14, gpio14,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(15, gpio15,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(16, gpio16,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(17, gpio17,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(18, gpio18,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(19, gpio19,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(20, gpio20,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(21, gpio21,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(22, gpio22,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(23, gpio23,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(24, gpio24,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(25, gpio25,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(26, gpio26,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(27, gpio27,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(28, gpio28,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(29, gpio29,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(30, gpio30,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(31, gpio31,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(32, gpio32,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(33, gpio33,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-	OXNAS_PINCTRL_GROUP(34, gpio34,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
-};
-
-static const struct oxnas_pin_group oxnas_ox820_groups[] = {
-	OXNAS_PINCTRL_GROUP(0, gpio0,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(1, gpio1,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(2, gpio2,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(3, gpio3,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(4, gpio4,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(5, gpio5,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(6, gpio6,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(7, gpio7,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(8, gpio8,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(9, gpio9,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(10, gpio10,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(11, gpio11,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(12, gpio12,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(13, gpio13,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(14, gpio14,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(15, gpio15,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(16, gpio16,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(17, gpio17,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(18, gpio18,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(19, gpio19,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(20, gpio20,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(21, gpio21,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(22, gpio22,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(23, gpio23,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
-	OXNAS_PINCTRL_GROUP(24, gpio24,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct1, 1),
-			OXNAS_PINCTRL_FUNCTION(fct4, 5)),
-	OXNAS_PINCTRL_GROUP(25, gpio25,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(26, gpio26,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(27, gpio27,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(28, gpio28,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
-	OXNAS_PINCTRL_GROUP(29, gpio29,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
-	OXNAS_PINCTRL_GROUP(30, gpio30,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
-	OXNAS_PINCTRL_GROUP(31, gpio31,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
-	OXNAS_PINCTRL_GROUP(32, gpio32,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(33, gpio33,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(34, gpio34,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(35, gpio35,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(36, gpio36,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(37, gpio37,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(38, gpio38,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(39, gpio39,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(40, gpio40,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(41, gpio41,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(42, gpio42,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(43, gpio43,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0),
-			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
-	OXNAS_PINCTRL_GROUP(44, gpio44,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(45, gpio45,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(46, gpio46,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(47, gpio47,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(48, gpio48,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-	OXNAS_PINCTRL_GROUP(49, gpio49,
-			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
-};
-
-static inline struct oxnas_gpio_bank *pctl_to_bank(struct oxnas_pinctrl *pctl,
-						   unsigned int pin)
-{
-	return &pctl->gpio_banks[pin / PINS_PER_BANK];
-}
-
-static int oxnas_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctl->ngroups;
-}
-
-static const char *oxnas_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
-						unsigned int group)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctl->groups[group].name;
-}
-
-static int oxnas_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
-					unsigned int group,
-					const unsigned int **pins,
-					unsigned int *num_pins)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-
-	*pins = &pctl->groups[group].pin;
-	*num_pins = 1;
-
-	return 0;
-}
-
-static const struct pinctrl_ops oxnas_pinctrl_ops = {
-	.get_groups_count = oxnas_pinctrl_get_groups_count,
-	.get_group_name = oxnas_pinctrl_get_group_name,
-	.get_group_pins = oxnas_pinctrl_get_group_pins,
-	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
-	.dt_free_map = pinctrl_utils_free_map,
-};
-
-static int oxnas_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctl->nfunctions;
-}
-
-static const char *
-oxnas_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctl->functions[func].name;
-}
-
-static int oxnas_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
-					    unsigned int func,
-					    const char * const **groups,
-					    unsigned int * const num_groups)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctl->functions[func].groups;
-	*num_groups = pctl->functions[func].ngroups;
-
-	return 0;
-}
-
-static int oxnas_ox810se_pinmux_enable(struct pinctrl_dev *pctldev,
-				       unsigned int func, unsigned int group)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct oxnas_pin_group *pg = &pctl->groups[group];
-	const struct oxnas_function *pf = &pctl->functions[func];
-	const char *fname = pf->name;
-	struct oxnas_desc_function *functions = pg->functions;
-	u32 mask = BIT(pg->pin);
-
-	while (functions->name) {
-		if (!strcmp(functions->name, fname)) {
-			dev_dbg(pctl->dev,
-				"setting function %s bank %d pin %d fct %d mask %x\n",
-				fname, pg->bank, pg->pin,
-				functions->fct, mask);
-
-			regmap_write_bits(pctl->regmap,
-					  (pg->bank ?
-						PINMUX_810_PRIMARY_SEL1 :
-						PINMUX_810_PRIMARY_SEL0),
-					  mask,
-					  (functions->fct == 1 ?
-						mask : 0));
-			regmap_write_bits(pctl->regmap,
-					  (pg->bank ?
-						PINMUX_810_SECONDARY_SEL1 :
-						PINMUX_810_SECONDARY_SEL0),
-					  mask,
-					  (functions->fct == 2 ?
-						mask : 0));
-			regmap_write_bits(pctl->regmap,
-					  (pg->bank ?
-						PINMUX_810_TERTIARY_SEL1 :
-						PINMUX_810_TERTIARY_SEL0),
-					  mask,
-					  (functions->fct == 3 ?
-						mask : 0));
-
-			return 0;
-		}
-
-		functions++;
-	}
-
-	dev_err(pctl->dev, "cannot mux pin %u to function %u\n", group, func);
-
-	return -EINVAL;
-}
-
-static int oxnas_ox820_pinmux_enable(struct pinctrl_dev *pctldev,
-				     unsigned int func, unsigned int group)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct oxnas_pin_group *pg = &pctl->groups[group];
-	const struct oxnas_function *pf = &pctl->functions[func];
-	const char *fname = pf->name;
-	struct oxnas_desc_function *functions = pg->functions;
-	unsigned int offset = (pg->bank ? PINMUX_820_BANK_OFFSET : 0);
-	u32 mask = BIT(pg->pin);
-
-	while (functions->name) {
-		if (!strcmp(functions->name, fname)) {
-			dev_dbg(pctl->dev,
-				"setting function %s bank %d pin %d fct %d mask %x\n",
-				fname, pg->bank, pg->pin,
-				functions->fct, mask);
-
-			regmap_write_bits(pctl->regmap,
-					  offset + PINMUX_820_SECONDARY_SEL,
-					  mask,
-					  (functions->fct == 1 ?
-						mask : 0));
-			regmap_write_bits(pctl->regmap,
-					  offset + PINMUX_820_TERTIARY_SEL,
-					  mask,
-					  (functions->fct == 2 ?
-						mask : 0));
-			regmap_write_bits(pctl->regmap,
-					  offset + PINMUX_820_QUATERNARY_SEL,
-					  mask,
-					  (functions->fct == 3 ?
-						mask : 0));
-			regmap_write_bits(pctl->regmap,
-					  offset + PINMUX_820_DEBUG_SEL,
-					  mask,
-					  (functions->fct == 4 ?
-						mask : 0));
-			regmap_write_bits(pctl->regmap,
-					  offset + PINMUX_820_ALTERNATIVE_SEL,
-					  mask,
-					  (functions->fct == 5 ?
-						mask : 0));
-
-			return 0;
-		}
-
-		functions++;
-	}
-
-	dev_err(pctl->dev, "cannot mux pin %u to function %u\n", group, func);
-
-	return -EINVAL;
-}
-
-static int oxnas_ox810se_gpio_request_enable(struct pinctrl_dev *pctldev,
-					     struct pinctrl_gpio_range *range,
-					     unsigned int offset)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(range->gc);
-	u32 mask = BIT(offset - bank->gpio_chip.base);
-
-	dev_dbg(pctl->dev, "requesting gpio %d in bank %d (id %d) with mask 0x%x\n",
-		offset, bank->gpio_chip.base, bank->id, mask);
-
-	regmap_write_bits(pctl->regmap,
-			  (bank->id ?
-				PINMUX_810_PRIMARY_SEL1 :
-				PINMUX_810_PRIMARY_SEL0),
-			  mask, 0);
-	regmap_write_bits(pctl->regmap,
-			  (bank->id ?
-				PINMUX_810_SECONDARY_SEL1 :
-				PINMUX_810_SECONDARY_SEL0),
-			  mask, 0);
-	regmap_write_bits(pctl->regmap,
-			  (bank->id ?
-				PINMUX_810_TERTIARY_SEL1 :
-				PINMUX_810_TERTIARY_SEL0),
-			  mask, 0);
-
-	return 0;
-}
-
-static int oxnas_ox820_gpio_request_enable(struct pinctrl_dev *pctldev,
-					   struct pinctrl_gpio_range *range,
-					   unsigned int offset)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(range->gc);
-	unsigned int bank_offset = (bank->id ? PINMUX_820_BANK_OFFSET : 0);
-	u32 mask = BIT(offset - bank->gpio_chip.base);
-
-	dev_dbg(pctl->dev, "requesting gpio %d in bank %d (id %d) with mask 0x%x\n",
-		offset, bank->gpio_chip.base, bank->id, mask);
-
-	regmap_write_bits(pctl->regmap,
-			  bank_offset + PINMUX_820_SECONDARY_SEL,
-			  mask, 0);
-	regmap_write_bits(pctl->regmap,
-			  bank_offset + PINMUX_820_TERTIARY_SEL,
-			  mask, 0);
-	regmap_write_bits(pctl->regmap,
-			  bank_offset + PINMUX_820_QUATERNARY_SEL,
-			  mask, 0);
-	regmap_write_bits(pctl->regmap,
-			  bank_offset + PINMUX_820_DEBUG_SEL,
-			  mask, 0);
-	regmap_write_bits(pctl->regmap,
-			  bank_offset + PINMUX_820_ALTERNATIVE_SEL,
-			  mask, 0);
-
-	return 0;
-}
-
-static int oxnas_gpio_get_direction(struct gpio_chip *chip,
-				      unsigned int offset)
-{
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	u32 mask = BIT(offset);
-
-	if (readl_relaxed(bank->reg_base + OUTPUT_EN) & mask)
-		return GPIO_LINE_DIRECTION_OUT;
-
-	return GPIO_LINE_DIRECTION_IN;
-}
-
-static int oxnas_gpio_direction_input(struct gpio_chip *chip,
-				      unsigned int offset)
-{
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	u32 mask = BIT(offset);
-
-	writel_relaxed(mask, bank->reg_base + OUTPUT_EN_CLEAR);
-
-	return 0;
-}
-
-static int oxnas_gpio_get(struct gpio_chip *chip, unsigned int offset)
-{
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	u32 mask = BIT(offset);
-
-	return (readl_relaxed(bank->reg_base + INPUT_VALUE) & mask) != 0;
-}
-
-static void oxnas_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			       int value)
-{
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	u32 mask = BIT(offset);
-
-	if (value)
-		writel_relaxed(mask, bank->reg_base + OUTPUT_SET);
-	else
-		writel_relaxed(mask, bank->reg_base + OUTPUT_CLEAR);
-}
-
-static int oxnas_gpio_direction_output(struct gpio_chip *chip,
-				       unsigned int offset, int value)
-{
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	u32 mask = BIT(offset);
-
-	oxnas_gpio_set(chip, offset, value);
-	writel_relaxed(mask, bank->reg_base + OUTPUT_EN_SET);
-
-	return 0;
-}
-
-static int oxnas_gpio_set_direction(struct pinctrl_dev *pctldev,
-				    struct pinctrl_gpio_range *range,
-				    unsigned int offset, bool input)
-{
-	struct gpio_chip *chip = range->gc;
-
-	if (input)
-		oxnas_gpio_direction_input(chip, offset);
-	else
-		oxnas_gpio_direction_output(chip, offset, 0);
-
-	return 0;
-}
-
-static const struct pinmux_ops oxnas_ox810se_pinmux_ops = {
-	.get_functions_count = oxnas_pinmux_get_functions_count,
-	.get_function_name = oxnas_pinmux_get_function_name,
-	.get_function_groups = oxnas_pinmux_get_function_groups,
-	.set_mux = oxnas_ox810se_pinmux_enable,
-	.gpio_request_enable = oxnas_ox810se_gpio_request_enable,
-	.gpio_set_direction = oxnas_gpio_set_direction,
-};
-
-static const struct pinmux_ops oxnas_ox820_pinmux_ops = {
-	.get_functions_count = oxnas_pinmux_get_functions_count,
-	.get_function_name = oxnas_pinmux_get_function_name,
-	.get_function_groups = oxnas_pinmux_get_function_groups,
-	.set_mux = oxnas_ox820_pinmux_enable,
-	.gpio_request_enable = oxnas_ox820_gpio_request_enable,
-	.gpio_set_direction = oxnas_gpio_set_direction,
-};
-
-static int oxnas_ox810se_pinconf_get(struct pinctrl_dev *pctldev,
-				     unsigned int pin, unsigned long *config)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct oxnas_gpio_bank *bank = pctl_to_bank(pctl, pin);
-	unsigned int param = pinconf_to_config_param(*config);
-	u32 mask = BIT(pin - bank->gpio_chip.base);
-	int ret;
-	u32 arg;
-
-	switch (param) {
-	case PIN_CONFIG_BIAS_PULL_UP:
-		ret = regmap_read(pctl->regmap,
-				  (bank->id ?
-					PINMUX_810_PULLUP_CTRL1 :
-					PINMUX_810_PULLUP_CTRL0),
-				  &arg);
-		if (ret)
-			return ret;
-
-		arg = !!(arg & mask);
-		break;
-	default:
-		return -ENOTSUPP;
-	}
-
-	*config = pinconf_to_config_packed(param, arg);
-
-	return 0;
-}
-
-static int oxnas_ox820_pinconf_get(struct pinctrl_dev *pctldev,
-				   unsigned int pin, unsigned long *config)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct oxnas_gpio_bank *bank = pctl_to_bank(pctl, pin);
-	unsigned int param = pinconf_to_config_param(*config);
-	unsigned int bank_offset = (bank->id ? PINMUX_820_BANK_OFFSET : 0);
-	u32 mask = BIT(pin - bank->gpio_chip.base);
-	int ret;
-	u32 arg;
-
-	switch (param) {
-	case PIN_CONFIG_BIAS_PULL_UP:
-		ret = regmap_read(pctl->regmap,
-				  bank_offset + PINMUX_820_PULLUP_CTRL,
-				  &arg);
-		if (ret)
-			return ret;
-
-		arg = !!(arg & mask);
-		break;
-	default:
-		return -ENOTSUPP;
-	}
-
-	*config = pinconf_to_config_packed(param, arg);
-
-	return 0;
-}
-
-static int oxnas_ox810se_pinconf_set(struct pinctrl_dev *pctldev,
-				     unsigned int pin, unsigned long *configs,
-				     unsigned int num_configs)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct oxnas_gpio_bank *bank = pctl_to_bank(pctl, pin);
-	unsigned int param;
-	unsigned int i;
-	u32 offset = pin - bank->gpio_chip.base;
-	u32 mask = BIT(offset);
-
-	dev_dbg(pctl->dev, "setting pin %d bank %d mask 0x%x\n",
-		pin, bank->gpio_chip.base, mask);
-
-	for (i = 0; i < num_configs; i++) {
-		param = pinconf_to_config_param(configs[i]);
-
-		switch (param) {
-		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pctl->dev, "   pullup\n");
-			regmap_write_bits(pctl->regmap,
-					  (bank->id ?
-						PINMUX_810_PULLUP_CTRL1 :
-						PINMUX_810_PULLUP_CTRL0),
-					  mask, mask);
-			break;
-		default:
-			dev_err(pctl->dev, "Property %u not supported\n",
-				param);
-			return -ENOTSUPP;
-		}
-	}
-
-	return 0;
-}
-
-static int oxnas_ox820_pinconf_set(struct pinctrl_dev *pctldev,
-				   unsigned int pin, unsigned long *configs,
-				   unsigned int num_configs)
-{
-	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct oxnas_gpio_bank *bank = pctl_to_bank(pctl, pin);
-	unsigned int bank_offset = (bank->id ? PINMUX_820_BANK_OFFSET : 0);
-	unsigned int param;
-	unsigned int i;
-	u32 offset = pin - bank->gpio_chip.base;
-	u32 mask = BIT(offset);
-
-	dev_dbg(pctl->dev, "setting pin %d bank %d mask 0x%x\n",
-		pin, bank->gpio_chip.base, mask);
-
-	for (i = 0; i < num_configs; i++) {
-		param = pinconf_to_config_param(configs[i]);
-
-		switch (param) {
-		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pctl->dev, "   pullup\n");
-			regmap_write_bits(pctl->regmap,
-					  bank_offset + PINMUX_820_PULLUP_CTRL,
-					  mask, mask);
-			break;
-		default:
-			dev_err(pctl->dev, "Property %u not supported\n",
-				param);
-			return -ENOTSUPP;
-		}
-	}
-
-	return 0;
-}
-
-static const struct pinconf_ops oxnas_ox810se_pinconf_ops = {
-	.pin_config_get = oxnas_ox810se_pinconf_get,
-	.pin_config_set = oxnas_ox810se_pinconf_set,
-	.is_generic = true,
-};
-
-static const struct pinconf_ops oxnas_ox820_pinconf_ops = {
-	.pin_config_get = oxnas_ox820_pinconf_get,
-	.pin_config_set = oxnas_ox820_pinconf_set,
-	.is_generic = true,
-};
-
-static void oxnas_gpio_irq_ack(struct irq_data *data)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	u32 mask = BIT(data->hwirq);
-
-	writel(mask, bank->reg_base + IRQ_PENDING);
-}
-
-static void oxnas_gpio_irq_mask(struct irq_data *data)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	unsigned int type = irqd_get_trigger_type(data);
-	u32 mask = BIT(data->hwirq);
-
-	if (type & IRQ_TYPE_EDGE_RISING)
-		writel(readl(bank->reg_base + RE_IRQ_ENABLE) & ~mask,
-		       bank->reg_base + RE_IRQ_ENABLE);
-
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		writel(readl(bank->reg_base + FE_IRQ_ENABLE) & ~mask,
-		       bank->reg_base + FE_IRQ_ENABLE);
-}
-
-static void oxnas_gpio_irq_unmask(struct irq_data *data)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
-	unsigned int type = irqd_get_trigger_type(data);
-	u32 mask = BIT(data->hwirq);
-
-	if (type & IRQ_TYPE_EDGE_RISING)
-		writel(readl(bank->reg_base + RE_IRQ_ENABLE) | mask,
-		       bank->reg_base + RE_IRQ_ENABLE);
-
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		writel(readl(bank->reg_base + FE_IRQ_ENABLE) | mask,
-		       bank->reg_base + FE_IRQ_ENABLE);
-}
-
-static unsigned int oxnas_gpio_irq_startup(struct irq_data *data)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-
-	oxnas_gpio_direction_input(chip, data->hwirq);
-	oxnas_gpio_irq_unmask(data);
-
-	return 0;
-}
-
-static int oxnas_gpio_irq_set_type(struct irq_data *data, unsigned int type)
-{
-	if ((type & (IRQ_TYPE_EDGE_RISING|IRQ_TYPE_EDGE_FALLING)) == 0)
-		return -EINVAL;
-
-	irq_set_handler_locked(data, handle_edge_irq);
-
-	return 0;
-}
-
-static void oxnas_gpio_irq_handler(struct irq_desc *desc)
-{
-	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct oxnas_gpio_bank *bank = gpiochip_get_data(gc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned long stat;
-	unsigned int pin;
-
-	chained_irq_enter(chip, desc);
-
-	stat = readl(bank->reg_base + IRQ_PENDING);
-
-	for_each_set_bit(pin, &stat, BITS_PER_LONG)
-		generic_handle_domain_irq(gc->irq.domain, pin);
-
-	chained_irq_exit(chip, desc);
-}
-
-#define GPIO_BANK(_bank)						\
-	{								\
-		.gpio_chip = {						\
-			.label = "GPIO" #_bank,				\
-			.request = gpiochip_generic_request,		\
-			.free = gpiochip_generic_free,			\
-			.get_direction = oxnas_gpio_get_direction,	\
-			.direction_input = oxnas_gpio_direction_input,	\
-			.direction_output = oxnas_gpio_direction_output, \
-			.get = oxnas_gpio_get,				\
-			.set = oxnas_gpio_set,				\
-			.ngpio = PINS_PER_BANK,				\
-			.base = GPIO_BANK_START(_bank),			\
-			.owner = THIS_MODULE,				\
-			.can_sleep = 0,					\
-		},							\
-		.irq_chip = {						\
-			.name = "GPIO" #_bank,				\
-			.irq_startup = oxnas_gpio_irq_startup,	\
-			.irq_ack = oxnas_gpio_irq_ack,		\
-			.irq_mask = oxnas_gpio_irq_mask,		\
-			.irq_unmask = oxnas_gpio_irq_unmask,		\
-			.irq_set_type = oxnas_gpio_irq_set_type,	\
-		},							\
-	}
-
-static struct oxnas_gpio_bank oxnas_gpio_banks[] = {
-	GPIO_BANK(0),
-	GPIO_BANK(1),
-};
-
-static struct oxnas_pinctrl ox810se_pinctrl = {
-	.functions = oxnas_ox810se_functions,
-	.nfunctions = ARRAY_SIZE(oxnas_ox810se_functions),
-	.groups = oxnas_ox810se_groups,
-	.ngroups = ARRAY_SIZE(oxnas_ox810se_groups),
-	.gpio_banks = oxnas_gpio_banks,
-	.nbanks = ARRAY_SIZE(oxnas_gpio_banks),
-};
-
-static struct pinctrl_desc oxnas_ox810se_pinctrl_desc = {
-	.name = "oxnas-pinctrl",
-	.pins = oxnas_ox810se_pins,
-	.npins = ARRAY_SIZE(oxnas_ox810se_pins),
-	.pctlops = &oxnas_pinctrl_ops,
-	.pmxops = &oxnas_ox810se_pinmux_ops,
-	.confops = &oxnas_ox810se_pinconf_ops,
-	.owner = THIS_MODULE,
-};
-
-static struct oxnas_pinctrl ox820_pinctrl = {
-	.functions = oxnas_ox820_functions,
-	.nfunctions = ARRAY_SIZE(oxnas_ox820_functions),
-	.groups = oxnas_ox820_groups,
-	.ngroups = ARRAY_SIZE(oxnas_ox820_groups),
-	.gpio_banks = oxnas_gpio_banks,
-	.nbanks = ARRAY_SIZE(oxnas_gpio_banks),
-};
-
-static struct pinctrl_desc oxnas_ox820_pinctrl_desc = {
-	.name = "oxnas-pinctrl",
-	.pins = oxnas_ox820_pins,
-	.npins = ARRAY_SIZE(oxnas_ox820_pins),
-	.pctlops = &oxnas_pinctrl_ops,
-	.pmxops = &oxnas_ox820_pinmux_ops,
-	.confops = &oxnas_ox820_pinconf_ops,
-	.owner = THIS_MODULE,
-};
-
-static struct oxnas_pinctrl_data oxnas_ox810se_pinctrl_data = {
-	.desc = &oxnas_ox810se_pinctrl_desc,
-	.pctl = &ox810se_pinctrl,
-};
-
-static struct oxnas_pinctrl_data oxnas_ox820_pinctrl_data = {
-	.desc = &oxnas_ox820_pinctrl_desc,
-	.pctl = &ox820_pinctrl,
-};
-
-static const struct of_device_id oxnas_pinctrl_of_match[] = {
-	{ .compatible = "oxsemi,ox810se-pinctrl",
-	  .data = &oxnas_ox810se_pinctrl_data
-	},
-	{ .compatible = "oxsemi,ox820-pinctrl",
-	  .data = &oxnas_ox820_pinctrl_data,
-	},
-	{ },
-};
-
-static int oxnas_pinctrl_probe(struct platform_device *pdev)
-{
-	const struct of_device_id *id;
-	const struct oxnas_pinctrl_data *data;
-	struct oxnas_pinctrl *pctl;
-
-	id = of_match_node(oxnas_pinctrl_of_match, pdev->dev.of_node);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
-	if (!data || !data->pctl || !data->desc)
-		return -EINVAL;
-
-	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
-	if (!pctl)
-		return -ENOMEM;
-	pctl->dev = &pdev->dev;
-	dev_set_drvdata(&pdev->dev, pctl);
-
-	pctl->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-						       "oxsemi,sys-ctrl");
-	if (IS_ERR(pctl->regmap)) {
-		dev_err(&pdev->dev, "failed to get sys ctrl regmap\n");
-		return -ENODEV;
-	}
-
-	pctl->functions = data->pctl->functions;
-	pctl->nfunctions = data->pctl->nfunctions;
-	pctl->groups = data->pctl->groups;
-	pctl->ngroups = data->pctl->ngroups;
-	pctl->gpio_banks = data->pctl->gpio_banks;
-	pctl->nbanks = data->pctl->nbanks;
-
-	pctl->pctldev = pinctrl_register(data->desc, &pdev->dev, pctl);
-	if (IS_ERR(pctl->pctldev)) {
-		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
-		return PTR_ERR(pctl->pctldev);
-	}
-
-	return 0;
-}
-
-static int oxnas_gpio_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct of_phandle_args pinspec;
-	struct oxnas_gpio_bank *bank;
-	unsigned int id, ngpios;
-	int irq, ret;
-	struct gpio_irq_chip *girq;
-
-	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges",
-					     3, 0, &pinspec)) {
-		dev_err(&pdev->dev, "gpio-ranges property not found\n");
-		return -EINVAL;
-	}
-
-	id = pinspec.args[1] / PINS_PER_BANK;
-	ngpios = pinspec.args[2];
-
-	if (id >= ARRAY_SIZE(oxnas_gpio_banks)) {
-		dev_err(&pdev->dev, "invalid gpio-ranges base arg\n");
-		return -EINVAL;
-	}
-
-	if (ngpios > PINS_PER_BANK) {
-		dev_err(&pdev->dev, "invalid gpio-ranges count arg\n");
-		return -EINVAL;
-	}
-
-	bank = &oxnas_gpio_banks[id];
-
-	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(bank->reg_base))
-		return PTR_ERR(bank->reg_base);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	bank->id = id;
-	bank->gpio_chip.parent = &pdev->dev;
-	bank->gpio_chip.ngpio = ngpios;
-	girq = &bank->gpio_chip.irq;
-	girq->chip = &bank->irq_chip;
-	girq->parent_handler = oxnas_gpio_irq_handler;
-	girq->num_parents = 1;
-	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
-				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
-	girq->parents[0] = irq;
-	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_level_irq;
-
-	ret = gpiochip_add_data(&bank->gpio_chip, bank);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to add GPIO chip %u: %d\n",
-			id, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static struct platform_driver oxnas_pinctrl_driver = {
-	.driver = {
-		.name = "oxnas-pinctrl",
-		.of_match_table = oxnas_pinctrl_of_match,
-		.suppress_bind_attrs = true,
-	},
-	.probe = oxnas_pinctrl_probe,
-};
-
-static const struct of_device_id oxnas_gpio_of_match[] = {
-	{ .compatible = "oxsemi,ox810se-gpio", },
-	{ .compatible = "oxsemi,ox820-gpio", },
-	{ },
-};
-
-static struct platform_driver oxnas_gpio_driver = {
-	.driver = {
-		.name = "oxnas-gpio",
-		.of_match_table = oxnas_gpio_of_match,
-		.suppress_bind_attrs = true,
-	},
-	.probe = oxnas_gpio_probe,
-};
-
-static int __init oxnas_gpio_register(void)
-{
-	return platform_driver_register(&oxnas_gpio_driver);
-}
-arch_initcall(oxnas_gpio_register);
-
-static int __init oxnas_pinctrl_register(void)
-{
-	return platform_driver_register(&oxnas_pinctrl_driver);
-}
-arch_initcall(oxnas_pinctrl_register);

-- 
2.34.1


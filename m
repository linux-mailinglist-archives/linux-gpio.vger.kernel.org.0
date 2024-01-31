Return-Path: <linux-gpio+bounces-2815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A6844463
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 17:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F5E1C26832
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 16:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816FF137C3B;
	Wed, 31 Jan 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MvHx0pbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF512CDB9;
	Wed, 31 Jan 2024 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706718444; cv=none; b=NUcTw4ip+Q7QnwnDUzP/1PxVlWKW4EJed0WlZnMxJBPMkHrwEfmMGvSzUzAB78zlRJMc84gNpd/5eexsHHZWMy02nIUnaIZ+PlK12Zb79l4T80rNuvVbZZPfL0yGFoLnlm51tnonSYj3LeBS5C0wSJIexqUN5AppIaq6vO4cTHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706718444; c=relaxed/simple;
	bh=9XwwZemvIQVC4s5AkBmR5cG0jXqdyzEn01USMCsctl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0L8nWd9eIqKvu3bQjFouaBxUqQw42ud0Q7BSkHbDNwvC8+Tr5Ic8aDPo/EtCMlYI1ANHROCvJhIHt13oI1GbgClGg+p3XC9ugthtb/tLbhJVSxXOVXZI/QWuSmCn/In1lP29Jx9k47o4i8/cUlGTzK7R0MSmVWHBFDZamMWYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MvHx0pbt; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD62B40003;
	Wed, 31 Jan 2024 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706718438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ii2QjvrE3V4O1cNGbsWN1pUyqVSUPbk+SS7equC2KsE=;
	b=MvHx0pbtcA4tGRCf8cC6sCwcbMuZ/z5oUEoN91HTF1TeMIuTpCQQymJXtshQfTdT6wWoaO
	MVDTfDcOmdpVbSZca+xr3AP0UFs9wfloM4NHxYEZVg71wMsWda3p328kk+1jBYEd/WKKMv
	TqVEae9hOQJ1tDgggl+vf1gL5zpTrB3o23sFM2peULTa+GLm2copwI7+i8LIq5PfqU2PgU
	+sec/ITZ2MO0PpOZKGha1JW8pCIc5TpjzM1uGbZkPVK6EJSRWxhlUzKmAkx9Oc8TXQNz+1
	zxBAh9GbKoAtfZFxwWogWkuJp7s5DPXZqGhjyWjkXx/1IU/xEMPTeiAkSBIisg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 31 Jan 2024 17:26:23 +0100
Subject: [PATCH v4 10/18] pinctrl: eyeq5: add platform driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240131-mbly-clk-v4-10-bcd00510d6a0@bootlin.com>
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
In-Reply-To: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Add the Mobileye EyeQ5 pin controller driver. It might grow to add later
support of other platforms from Mobileye. It belongs to a syscon region
called OLB.

Existing pins and their function live statically in the driver code
rather than in the devicetree, see compatible match data.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS                     |   1 +
 drivers/pinctrl/Kconfig         |  15 ++
 drivers/pinctrl/Makefile        |   1 +
 drivers/pinctrl/pinctrl-eyeq5.c | 567 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 584 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72edb390a046..c0bb5cb0c7cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14795,6 +14795,7 @@ F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq5.c
+F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq5.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 F:	include/dt-bindings/soc/mobileye,eyeq5.h
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8163a5983166..abe94de85b3d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -195,6 +195,21 @@ config PINCTRL_EQUILIBRIUM
 	  desired pin functions, configure GPIO attributes for LGM SoC pins.
 	  Pin muxing and pin config settings are retrieved from device tree.
 
+config PINCTRL_EYEQ5
+	bool "Mobileye EyeQ5 pinctrl driver"
+	depends on OF
+	depends on MACH_EYEQ5 || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	select MFD_SYSCON
+	default MACH_EYEQ5
+	help
+	  Pin controller driver for the Mobileye EyeQ5 platform. It does both
+	  pin config & pin muxing. It does not handle GPIO.
+
+	  Pin muxing supports two functions for each pin: first is GPIO, second
+	  is pin-dependent. Pin config is about bias & drive strength.
+
 config PINCTRL_GEMINI
 	bool
 	depends on ARCH_GEMINI
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 1071f301cc70..0033940914d9 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
 obj-$(CONFIG_PINCTRL_DA9062)	+= pinctrl-da9062.o
 obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
+obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
diff --git a/drivers/pinctrl/pinctrl-eyeq5.c b/drivers/pinctrl/pinctrl-eyeq5.c
new file mode 100644
index 000000000000..a5ade3a253b5
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-eyeq5.c
@@ -0,0 +1,567 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Pinctrl driver for the Mobileye EyeQ5 platform.
+ *
+ * The registers are located in a syscon region called OLB. There are two pin
+ * banks, each being controlled by 5 registers (see enum eq5p_regs) for
+ * pull-down, pull-up, drive strength and muxing.
+ *
+ * For each pin, muxing is between two functions: (0) GPIO or (1) another one
+ * that is pin-dependent. Functions are declared statically in this driver.
+ *
+ * We create pinctrl groups that are 1:1 equivalent to pins: each group has a
+ * single pin, and its index/selector is the pin number/offset.
+ *
+ * We use eq5p_ as prefix, as-in "EyeQ5 Pinctrl", but way shorter.
+ *
+ * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
+ */
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+#include "core.h"
+#include "pinctrl-utils.h"
+
+struct eq5p_pinctrl {
+	struct pinctrl_desc	desc;
+	void __iomem		*base;
+};
+
+struct eq5p_function {
+	const char		*name;
+	const char * const	*groups;
+	unsigned int		ngroups;
+};
+
+enum eq5p_bank {
+	EQ5P_BANK_A,
+	EQ5P_BANK_B,
+
+	EQ5P_BANK_COUNT,
+};
+
+enum eq5p_regs {
+	EQ5P_PD,
+	EQ5P_PU,
+	EQ5P_DS_LOW,
+	EQ5P_DS_HIGH,
+	EQ5P_IOCR,
+
+	EQ5P_REG_COUNT,
+};
+
+static const unsigned int eq5p_regs[EQ5P_BANK_COUNT][EQ5P_REG_COUNT] = {
+	[EQ5P_BANK_A] = {0x010, 0x014, 0x020, 0x024, 0x000},
+	[EQ5P_BANK_B] = {0x018, 0x01C, 0x028, 0x02C, 0x004},
+};
+
+/*
+ * Comments to the right of each pin are the "signal name" in the datasheet.
+ */
+static const struct pinctrl_pin_desc eq5p_pins[] = {
+	/* Bank A */
+	PINCTRL_PIN(0,  "PA0"),  /* A0_TIMER0_CK */
+	PINCTRL_PIN(1,  "PA1"),  /* A1_TIMER0_EOC */
+	PINCTRL_PIN(2,  "PA2"),  /* A2_TIMER1_CK */
+	PINCTRL_PIN(3,  "PA3"),  /* A3_TIMER1_EOC */
+	PINCTRL_PIN(4,  "PA4"),  /* A4_TIMER2_CK */
+	PINCTRL_PIN(5,  "PA5"),  /* A5_TIMER2_EOC */
+	PINCTRL_PIN(6,  "PA6"),  /* A6_TIMER5_EXT_INCAP1 */
+	PINCTRL_PIN(7,  "PA7"),  /* A7_TIMER5_EXT_INCAP2 */
+	PINCTRL_PIN(8,  "PA8"),  /* A8_TIMER5_EXT_OUTCMP1 */
+	PINCTRL_PIN(9,  "PA9"),  /* A9_TIMER5_EXT_OUTCMP2 */
+	PINCTRL_PIN(10, "PA10"), /* A10_UART_0_TX */
+	PINCTRL_PIN(11, "PA11"), /* A11_UART_0_RX */
+	PINCTRL_PIN(12, "PA12"), /* A12_UART_1_TX */
+	PINCTRL_PIN(13, "PA13"), /* A13_UART_1_RX */
+	PINCTRL_PIN(14, "PA14"), /* A14_CAN_0_TX */
+	PINCTRL_PIN(15, "PA15"), /* A15_CAN_0_RX */
+	PINCTRL_PIN(16, "PA16"), /* A16_CAN_1_TX */
+	PINCTRL_PIN(17, "PA17"), /* A17_CAN_1_RX */
+	PINCTRL_PIN(18, "PA18"), /* A18_SPI_0_DO */
+	PINCTRL_PIN(19, "PA19"), /* A19_SPI_0_DI */
+	PINCTRL_PIN(20, "PA20"), /* A20_SPI_0_CK */
+	PINCTRL_PIN(21, "PA21"), /* A21_SPI_0_CS0 */
+	PINCTRL_PIN(22, "PA22"), /* A22_SPI_0_CS1 */
+	PINCTRL_PIN(23, "PA23"), /* A23_SPI_1_DO */
+	PINCTRL_PIN(24, "PA24"), /* A24_SPI_1_DI */
+	PINCTRL_PIN(25, "PA25"), /* A25_SPI_1_CK */
+	PINCTRL_PIN(26, "PA26"), /* A26_SPI_1_CS0 */
+	PINCTRL_PIN(27, "PA27"), /* A27_SPI_1_CS1 */
+	PINCTRL_PIN(28, "PA28"), /* A28_REF_CLK0 */
+
+#define EQ5P_PIN_OFFSET_BANK_B	29
+
+	/* Bank B */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 0,  "PB0"),  /* B0_TIMER3_CK */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 1,  "PB1"),  /* B1_TIMER3_EOC */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 2,  "PB2"),  /* B2_TIMER4_CK */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 3,  "PB3"),  /* B3_TIMER4_EOC */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 4,  "PB4"),  /* B4_TIMER6_EXT_INCAP1 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 5,  "PB5"),  /* B5_TIMER6_EXT_INCAP2 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 6,  "PB6"),  /* B6_TIMER6_EXT_OUTCMP1 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 7,  "PB7"),  /* B7_TIMER6_EXT_OUTCMP2 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 8,  "PB8"),  /* B8_UART_2_TX */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 9,  "PB9"),  /* B9_UART_2_RX */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 10, "PB10"), /* B10_CAN_2_TX */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 11, "PB11"), /* B11_CAN_2_RX */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 12, "PB12"), /* B12_SPI_2_DO */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 13, "PB13"), /* B13_SPI_2_DI */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 14, "PB14"), /* B14_SPI_2_CK */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 15, "PB15"), /* B15_SPI_2_CS0 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 16, "PB16"), /* B16_SPI_2_CS1 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 17, "PB17"), /* B17_SPI_3_DO */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 18, "PB18"), /* B18_SPI_3_DI */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 19, "PB19"), /* B19_SPI_3_CK */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 20, "PB20"), /* B20_SPI_3_CS0 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 21, "PB21"), /* B21_SPI_3_CS1 */
+	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 22, "PB22"), /* B22_MCLK0 */
+};
+
+static const char * const gpio_groups[] = {
+	/* Bank A */
+	"PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7", "PA8", "PA9",
+	"PA10", "PA11", "PA12", "PA13", "PA14", "PA15", "PA16", "PA17", "PA18",
+	"PA19", "PA20", "PA21", "PA22", "PA23", "PA24", "PA25", "PA26", "PA27",
+	"PA28",
+
+	/* Bank B */
+	"PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7", "PB8", "PB9",
+	"PB10", "PB11", "PB12", "PB13", "PB14", "PB15", "PB16", "PB17", "PB18",
+	"PB19", "PB20", "PB21", "PB22",
+};
+
+/* Groups of functions on bank A */
+static const char * const timer0_groups[] = { "PA0", "PA1" };
+static const char * const timer1_groups[] = { "PA2", "PA3" };
+static const char * const timer2_groups[] = { "PA4", "PA5" };
+static const char * const timer5_groups[] = { "PA6", "PA7", "PA8", "PA9" };
+static const char * const uart0_groups[] = { "PA10", "PA11" };
+static const char * const uart1_groups[] = { "PA12", "PA13" };
+static const char * const can0_groups[] = { "PA14", "PA15" };
+static const char * const can1_groups[] = { "PA16", "PA17" };
+static const char * const spi0_groups[] = { "PA18", "PA19", "PA20", "PA21", "PA22" };
+static const char * const spi1_groups[] = { "PA23", "PA24", "PA25", "PA26", "PA27" };
+static const char * const refclk0_groups[] = { "PA28" };
+
+/* Groups of functions on bank B */
+static const char * const timer3_groups[] = { "PB0", "PB1" };
+static const char * const timer4_groups[] = { "PB2", "PB3" };
+static const char * const timer6_groups[] = { "PB4", "PB5", "PB6", "PB7" };
+static const char * const uart2_groups[] = { "PB8", "PB9" };
+static const char * const can2_groups[] = { "PB10", "PB11" };
+static const char * const spi2_groups[] = { "PB12", "PB13", "PB14", "PB15", "PB16" };
+static const char * const spi3_groups[] = { "PB17", "PB18", "PB19", "PB20", "PB21" };
+static const char * const mclk0_groups[] = { "PB22" };
+
+#define FUNCTION(a, b) { .name = a, .groups = b, .ngroups = ARRAY_SIZE(b) }
+
+static const struct eq5p_function eq5p_functions[] = {
+	/* GPIO having a fixed index is depended upon, see GPIO_FUNC_SELECTOR. */
+	FUNCTION("gpio", gpio_groups),
+#define GPIO_FUNC_SELECTOR 0
+
+	/* Bank A functions */
+	FUNCTION("timer0", timer0_groups),
+	FUNCTION("timer1", timer1_groups),
+	FUNCTION("timer2", timer2_groups),
+	FUNCTION("timer5", timer5_groups),
+	FUNCTION("uart0", uart0_groups),
+	FUNCTION("uart1", uart1_groups),
+	FUNCTION("can0", can0_groups),
+	FUNCTION("can1", can1_groups),
+	FUNCTION("spi0", spi0_groups),
+	FUNCTION("spi1", spi1_groups),
+	FUNCTION("refclk0", refclk0_groups),
+
+	/* Bank B functions */
+	FUNCTION("timer3", timer3_groups),
+	FUNCTION("timer4", timer4_groups),
+	FUNCTION("timer6", timer6_groups),
+	FUNCTION("uart2", uart2_groups),
+	FUNCTION("can2", can2_groups),
+	FUNCTION("spi2", spi2_groups),
+	FUNCTION("spi3", spi3_groups),
+	FUNCTION("mclk0", mclk0_groups),
+};
+
+static void eq5p_update_bits(const struct eq5p_pinctrl *pctrl,
+			     enum eq5p_bank bank, enum eq5p_regs reg,
+			     u32 mask, u32 val)
+{
+	void __iomem *ptr = pctrl->base + eq5p_regs[bank][reg];
+
+	writel((readl(ptr) & ~mask) | (val & mask), ptr);
+}
+
+static bool eq5p_readl_bit(const struct eq5p_pinctrl *pctrl,
+			   enum eq5p_bank bank, enum eq5p_regs reg, int bit)
+{
+	u32 val = readl(pctrl->base + eq5p_regs[bank][reg]);
+
+	return (val & BIT(bit)) != 0;
+}
+
+static enum eq5p_bank eq5p_pin_offset_to_bank(const struct eq5p_pinctrl *pctrl,
+					      unsigned int offset)
+{
+	if (offset < EQ5P_PIN_OFFSET_BANK_B)
+		return EQ5P_BANK_A;
+	else
+		return EQ5P_BANK_B;
+}
+
+static int eq5p_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(eq5p_pins);
+}
+
+static const char *eq5p_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+					       unsigned int selector)
+{
+	return pctldev->desc->pins[selector].name;
+}
+
+static int eq5p_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       const unsigned int **pins,
+				       unsigned int *num_pins)
+{
+	*pins = &pctldev->desc->pins[selector].number;
+	*num_pins = 1;
+	return 0;
+}
+
+static int eq5p_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
+			    unsigned long *config);
+
+static void eq5p_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
+				      struct seq_file *s,
+				      unsigned int offset)
+{
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	enum eq5p_bank bank = eq5p_pin_offset_to_bank(pctrl, offset);
+	const char *pin_name = pctrl->desc.pins[offset].name;
+	const char *func_name, *bias;
+	unsigned long ds_config;
+	u32 drive_strength;
+	bool pd, pu;
+	int i, j;
+
+	/*
+	 * First, let's get the function name. All pins have only two functions:
+	 * GPIO (IOCR == 0) and something else (IOCR == 1).
+	 */
+	if (!eq5p_readl_bit(pctrl, bank, EQ5P_IOCR, offset)) {
+		func_name = eq5p_functions[GPIO_FUNC_SELECTOR].name;
+	} else {
+		func_name = NULL;
+		for (i = 0; i < ARRAY_SIZE(eq5p_functions); i++) {
+			if (i == GPIO_FUNC_SELECTOR)
+				continue;
+
+			for (j = 0; j < eq5p_functions[i].ngroups; j++) {
+				/* Groups and pins are the same thing for us. */
+				const char *x = eq5p_functions[i].groups[j];
+
+				if (strcmp(x, pin_name) == 0) {
+					func_name = eq5p_functions[i].name;
+					break;
+				}
+			}
+
+			if (func_name)
+				break;
+		}
+
+		/*
+		 * We have not found the function attached to this pin, this
+		 * should never occur as all pins have exactly two functions.
+		 */
+		if (!func_name)
+			func_name = "unknown";
+	}
+
+	/* Second, we retrieve the bias. */
+	pd = eq5p_readl_bit(pctrl, bank, EQ5P_PD, offset);
+	pu = eq5p_readl_bit(pctrl, bank, EQ5P_PU, offset);
+	if (pd && pu)
+		bias = "both";
+	else if (pd && !pu)
+		bias = "pulldown";
+	else if (!pd && pu)
+		bias = "pullup";
+	else
+		bias = "none";
+
+	/* Third, we get the drive strength. */
+	ds_config = pinconf_to_config_packed(PIN_CONFIG_DRIVE_STRENGTH, 0);
+	eq5p_pinconf_get(pctldev, offset, &ds_config);
+	drive_strength = pinconf_to_config_argument(ds_config);
+
+	seq_printf(s, "function=%s bias=%s drive_strength=%d",
+		   func_name, bias, drive_strength);
+}
+
+static const struct pinctrl_ops eq5p_pinctrl_ops = {
+	.get_groups_count	= eq5p_pinctrl_get_groups_count,
+	.get_group_name		= eq5p_pinctrl_get_group_name,
+	.get_group_pins		= eq5p_pinctrl_get_group_pins,
+	.pin_dbg_show		= eq5p_pinctrl_pin_dbg_show,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int eq5p_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(eq5p_functions);
+}
+
+static const char *eq5p_pinmux_get_function_name(struct pinctrl_dev *pctldev,
+						 unsigned int selector)
+{
+	return eq5p_functions[selector].name;
+}
+
+static int eq5p_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
+					   unsigned int selector,
+					   const char * const **groups,
+					   unsigned int *num_groups)
+{
+	*groups = eq5p_functions[selector].groups;
+	*num_groups = eq5p_functions[selector].ngroups;
+	return 0;
+}
+
+static int eq5p_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			       unsigned int func_selector, unsigned int offset)
+{
+	const char *group_name = pctldev->desc->pins[offset].name;
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	enum eq5p_bank bank = eq5p_pin_offset_to_bank(pctrl, offset);
+	const char *func_name = eq5p_functions[func_selector].name;
+	bool is_gpio = func_selector == GPIO_FUNC_SELECTOR;
+	u32 mask, val;
+
+	dev_dbg(pctldev->dev, "%s: func=%s group=%s\n", __func__, func_name,
+		group_name);
+
+	mask = BIT(offset);
+	val = is_gpio ? 0 : U32_MAX;
+	eq5p_update_bits(pctrl, bank, EQ5P_IOCR, mask, val);
+	return 0;
+}
+
+static int eq5p_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
+					   struct pinctrl_gpio_range *range,
+					   unsigned int offset)
+{
+	/* Pin offsets and group selectors are the same thing in our case. */
+	return eq5p_pinmux_set_mux(pctldev, GPIO_FUNC_SELECTOR, offset);
+}
+
+static const struct pinmux_ops eq5p_pinmux_ops = {
+	.get_functions_count	= eq5p_pinmux_get_functions_count,
+	.get_function_name	= eq5p_pinmux_get_function_name,
+	.get_function_groups	= eq5p_pinmux_get_function_groups,
+	.set_mux		= eq5p_pinmux_set_mux,
+	.gpio_request_enable	= eq5p_pinmux_gpio_request_enable,
+	.strict			= true,
+};
+
+static int eq5p_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
+			    unsigned long *config)
+{
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	enum eq5p_bank bank = eq5p_pin_offset_to_bank(pctrl, offset);
+	u32 val_ds, arg = 0;
+	bool pd, pu;
+
+	pd = eq5p_readl_bit(pctrl, bank, EQ5P_PD, offset);
+	pu = eq5p_readl_bit(pctrl, bank, EQ5P_PU, offset);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = !(pd || pu);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = pd;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = pu;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		offset *= 2; /* two bits per pin */
+		if (offset >= 32) {
+			val_ds = readl(pctrl->base + eq5p_regs[bank][EQ5P_DS_HIGH]);
+			offset -= 32;
+		} else {
+			val_ds = readl(pctrl->base + eq5p_regs[bank][EQ5P_DS_LOW]);
+		}
+		arg = (val_ds >> offset) & 0b11;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return 0;
+}
+
+static int eq5p_pinconf_set_drive_strength(struct pinctrl_dev *pctldev,
+					   unsigned int offset, u32 arg)
+{
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	enum eq5p_bank bank = eq5p_pin_offset_to_bank(pctrl, offset);
+	unsigned int reg;
+	u32 mask, val;
+
+	if (arg > 3) {
+		dev_err(pctldev->dev, "Unsupported drive strength: %u\n", arg);
+		return -EINVAL;
+	}
+
+	offset *= 2; /* two bits per pin */
+
+	if (offset >= 32) {
+		reg = EQ5P_DS_HIGH;
+		offset -= 32;
+	} else {
+		reg = EQ5P_DS_LOW;
+	}
+
+	mask = 0b11 << offset;
+	val = arg << offset;
+	eq5p_update_bits(pctrl, bank, reg, mask, val);
+	return 0;
+}
+
+static int eq5p_pinconf_set(struct pinctrl_dev *pctldev, unsigned int offset,
+			    unsigned long *configs, unsigned int num_configs)
+{
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	enum eq5p_bank bank = eq5p_pin_offset_to_bank(pctrl, offset);
+	const char *pin_name = pctldev->desc->pins[offset].name;
+	struct device *dev = pctldev->dev;
+	u32 val = BIT(offset);
+	unsigned int i;
+
+	for (i = 0; i < num_configs; i++) {
+		enum pin_config_param param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			dev_dbg(dev, "pin=%s bias_disable\n", pin_name);
+
+			eq5p_update_bits(pctrl, bank, EQ5P_PD, val, 0);
+			eq5p_update_bits(pctrl, bank, EQ5P_PU, val, 0);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			dev_dbg(dev, "pin=%s bias_pull_down arg=%u\n",
+				pin_name, arg);
+
+			if (arg == 0) /* cannot connect to GND */
+				return -ENOTSUPP;
+
+			eq5p_update_bits(pctrl, bank, EQ5P_PD, val, val);
+			eq5p_update_bits(pctrl, bank, EQ5P_PU, val, 0);
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_UP:
+			dev_dbg(dev, "pin=%s bias_pull_up arg=%u\n",
+				pin_name, arg);
+
+			if (arg == 0) /* cannot connect to VDD */
+				return -ENOTSUPP;
+
+			eq5p_update_bits(pctrl, bank, EQ5P_PD, val, 0);
+			eq5p_update_bits(pctrl, bank, EQ5P_PU, val, val);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			dev_dbg(dev, "pin=%s drive_strength arg=%u\n",
+				pin_name, arg);
+
+			eq5p_pinconf_set_drive_strength(pctldev, offset, arg);
+			break;
+
+		default:
+			dev_err(dev, "Unsupported pinconf %u\n", param);
+			return -ENOTSUPP;
+		}
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops eq5p_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = eq5p_pinconf_get,
+	.pin_config_set = eq5p_pinconf_set,
+	/* Pins and groups are equivalent in this driver. */
+	.pin_config_group_get = eq5p_pinconf_get,
+	.pin_config_group_set = eq5p_pinconf_set,
+};
+
+static int eq5p_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pinctrl_dev *pctldev;
+	struct eq5p_pinctrl *pctrl;
+	int ret;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctrl->base))
+		return PTR_ERR(pctrl->base);
+
+	pctrl->desc.name = dev_name(dev);
+	pctrl->desc.pins = eq5p_pins;
+	pctrl->desc.npins = ARRAY_SIZE(eq5p_pins);
+	pctrl->desc.pctlops = &eq5p_pinctrl_ops;
+	pctrl->desc.pmxops = &eq5p_pinmux_ops;
+	pctrl->desc.confops = &eq5p_pinconf_ops;
+	pctrl->desc.owner = THIS_MODULE;
+
+	ret = devm_pinctrl_register_and_init(dev, &pctrl->desc, pctrl, &pctldev);
+	if (ret) {
+		dev_err(dev, "Failed registering pinctrl device: %d\n", ret);
+		return ret;
+	}
+
+	ret = pinctrl_enable(pctldev);
+	if (ret) {
+		dev_err(dev, "Failed enabling pinctrl device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id eq5p_match[] = {
+	{ .compatible = "mobileye,eyeq5-pinctrl" },
+	{},
+};
+
+static struct platform_driver eq5p_driver = {
+	.driver = {
+		.name = "eyeq5-pinctrl",
+		.of_match_table = eq5p_match,
+	},
+	.probe = eq5p_probe,
+};
+
+builtin_platform_driver(eq5p_driver);

-- 
2.43.0



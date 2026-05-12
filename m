Return-Path: <linux-gpio+bounces-36638-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPW3LyqgAmpivAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36638-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 05:36:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE7519583
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 05:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 523DA30488CD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 03:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02EB32E68D;
	Tue, 12 May 2026 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="EuSbJRGU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF08274B44;
	Tue, 12 May 2026 03:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556882; cv=none; b=A6JWLk3bARuzYgL7YR2OuqkrZnjYvvu6XVJDQAtgl36cMo05cEjyzK/SxIn3G3ZmvtW97PP5zGGm2bqwo7UFOu2e7ifpDt0YgF65NoJSZb4nztyfuw1U9NpcNRecxOpJxAnT8tJhVb8dGc1V/tDUnHGhYPmf1ESR5up4v1m0GEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556882; c=relaxed/simple;
	bh=mRyivPpaXo4MgnF+82NEz+sYEYcvIJwwoOpDWr79JiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIXj2iMYYxaiw3saJFEy3OaNRHgEFvP8lh2b2gREy/A6aJM707j3vu5++QImCKxrjTxg82IGnLCrgDl7FPLRISngH5d4mJ7L4zlSb8OZ7hYHtScIzXXXztoivmclO82KVF1wRb5zGf03ZrOjbHBm04LJ8UaDoVBx0VfWDTdPHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=EuSbJRGU; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XJeoC3571943, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556799; bh=XXVO2SlJM/+73Ca3htxBJooDtBB8BvZNrXV/jOOFjXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=EuSbJRGU/9ZXHmPsQA+ClBd7o3ohc2+lIlNfMst8j0iIbyxt74+VwHKSgIVjvbbPE
	 9mNvQW9W8HdJQK5XkQ5EwRVtgFtlF1qyXGD0Y5kRi/XFa++xD0rGP2jgcqYmXZzSax
	 LeFu5kPSTONX4q0Cphr90LtkxpsWgGQ7V+P0Z8By5w/dz2sxf4mI1yog+GzyflzGWM
	 E91W3JkulaZ2HkUeI0zTLQ7yar9OlxJ1HuK+x/nR9gb6xm5NaECDTon/cqZ2ChyQVi
	 VLf1027hZvH6y3iFOaDUz1VBYWp8/2ya/lLiYBmx5mcyA4ewC4tnuYBIBYs6K2CPZX
	 Iup2n+8EeoIbQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XJeoC3571943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:19 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:19 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v3 6/7] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
Date: Tue, 12 May 2026 11:33:16 +0800
Message-ID: <20260512033317.1602537-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 22DE7519583
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36638-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,realtek.com:mid,realtek.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Tzuyi Chang <tychang@realtek.com>

Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.

Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
which manages pins via shared bank registers, the RTD1625 introduces
a per-pin register architecture. Each GPIO line now has its own
dedicated 32-bit control register to manage configuration independently,
including direction, output value, input value, interrupt enable, and
debounce. Therefore, this distinct hardware design requires a separate
driver.

The driver leverages the gpio-regmap framework, utilizing the recently
introduced write-enable and operation-specific mask translation features.

Additionally, because the controller utilizes multiple independent IRQ
status registers (assert, de-assert, and level) which cannot be mapped
via standard regmap_irq_chip, the driver implements a custom irq_domain.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/Kconfig        |  13 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-rtd1625.c | 608 ++++++++++++++++++++++++++++++++++++
 3 files changed, 622 insertions(+)
 create mode 100644 drivers/gpio/gpio-rtd1625.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 504b4bdd75d4..4449b288dfd5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -647,6 +647,19 @@ config GPIO_RTD
 	  Say yes here to support GPIO functionality and GPIO interrupt on
 	  Realtek DHC SoCs.
 
+config GPIO_RTD1625
+	tristate "Realtek DHC RTD1625 GPIO support"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	default ARCH_REALTEK
+	select GPIOLIB_IRQCHIP
+	select GPIO_REGMAP
+	help
+	  This option enables support for the GPIO controller on Realtek
+	  DHC (Digital Home Center) RTD1625 SoC.
+
+	  Say yes here to support both basic GPIO line functionality
+	  and GPIO interrupt handling capabilities for this platform.
+
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
 	depends on OF
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b267598b517d..d837061d2df7 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
+obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
new file mode 100644
index 000000000000..0eae4bb5577d
--- /dev/null
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -0,0 +1,608 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Realtek DHC RTD1625 gpio driver
+ *
+ * Copyright (c) 2023-2026 Realtek Semiconductor Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define RTD1625_GPIO_DIR BIT(0)
+#define RTD1625_GPIO_OUT BIT(2)
+#define RTD1625_GPIO_IN BIT(4)
+#define RTD1625_GPIO_EDGE_INT_DP BIT(6)
+#define RTD1625_GPIO_EDGE_INT_EN BIT(8)
+#define RTD1625_GPIO_LEVEL_INT_EN BIT(16)
+#define RTD1625_GPIO_LEVEL_INT_DP BIT(18)
+#define RTD1625_GPIO_DEBOUNCE GENMASK(30, 28)
+#define RTD1625_GPIO_DEBOUNCE_WREN BIT(31)
+
+#define RTD1625_GPIO_WREN(x) ((x) << 1)
+
+/* Write-enable masks for all GPIO configs and reserved hardware bits */
+#define RTD1625_ISO_GPIO_WREN_ALL 0x8000aa8a
+#define RTD1625_ISOM_GPIO_WREN_ALL 0x800aaa8a
+
+#define RTD1625_GPIO_DEBOUNCE_1US 0
+#define RTD1625_GPIO_DEBOUNCE_10US 1
+#define RTD1625_GPIO_DEBOUNCE_100US 2
+#define RTD1625_GPIO_DEBOUNCE_1MS 3
+#define RTD1625_GPIO_DEBOUNCE_10MS 4
+#define RTD1625_GPIO_DEBOUNCE_20MS 5
+#define RTD1625_GPIO_DEBOUNCE_30MS 6
+#define RTD1625_GPIO_DEBOUNCE_50MS 7
+
+#define GPIO_CONTROL(gpio) ((gpio) * 4)
+
+/**
+ * struct rtd1625_gpio_info - Specific GPIO register information
+ * @num_gpios: The number of GPIOs
+ * @irq_type_support: Supported IRQ types
+ * @gpa_offset: Offset for GPIO assert interrupt status registers
+ * @gpda_offset: Offset for GPIO deassert interrupt status registers
+ * @level_offset: Offset of level interrupt status register
+ * @write_en_all: Write-enable mask for all configurable bits
+ */
+struct rtd1625_gpio_info {
+	unsigned int num_gpios;
+	unsigned int irq_type_support;
+	unsigned int base_offset;
+	unsigned int gpa_offset;
+	unsigned int gpda_offset;
+	unsigned int level_offset;
+	unsigned int write_en_all;
+};
+
+struct rtd1625_gpio {
+	struct gpio_chip *gpio_chip;
+	const struct rtd1625_gpio_info *info;
+	void __iomem *base;
+	struct regmap *regmap;
+	unsigned int irqs[3];
+	raw_spinlock_t lock;
+	struct irq_domain *domain;
+	unsigned int *save_regs;
+};
+
+static unsigned int rtd1625_gpio_gpa_offset(struct rtd1625_gpio *data, unsigned int offset)
+{
+	return data->info->gpa_offset + ((offset / 32) * 4);
+}
+
+static unsigned int rtd1625_gpio_gpda_offset(struct rtd1625_gpio *data, unsigned int offset)
+{
+	return data->info->gpda_offset + ((offset / 32) * 4);
+}
+
+static unsigned int rtd1625_gpio_level_offset(struct rtd1625_gpio *data, unsigned int offset)
+{
+	return data->info->level_offset + ((offset / 32) * 4);
+}
+
+static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
+				  unsigned int base, unsigned int offset, unsigned int *reg,
+				  unsigned int *mask)
+{
+	/* Each GPIO has its own dedicated 32-bit register */
+	*reg = base + offset * 4;
+
+	switch (op) {
+	case GPIO_REGMAP_IN:
+		*mask = RTD1625_GPIO_IN;
+		break;
+	case GPIO_REGMAP_OUT:
+		*mask = RTD1625_GPIO_OUT;
+		break;
+	case GPIO_REGMAP_SET_WREN_OP:
+		*mask = RTD1625_GPIO_WREN(RTD1625_GPIO_OUT);
+		break;
+	case GPIO_REGMAP_SET_WITH_CLEAR_OP:
+	case GPIO_REGMAP_SET_OP:
+		*mask = RTD1625_GPIO_OUT;
+		break;
+	case GPIO_REGMAP_SET_DIR_WREN_OP:
+		*mask = RTD1625_GPIO_WREN(RTD1625_GPIO_DIR);
+		break;
+	case GPIO_REGMAP_GET_OP:
+	case GPIO_REGMAP_GET_DIR_OP:
+		*mask = RTD1625_GPIO_DIR;
+		break;
+	default:
+		*mask = 0;
+		break;
+	}
+
+	return 0;
+}
+
+static unsigned int rtd1625_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+					      unsigned int debounce)
+{
+	struct rtd1625_gpio *data = gpiochip_get_data(chip);
+	u8 deb_val;
+	u32 val;
+
+	switch (debounce) {
+	case 1:
+		deb_val = RTD1625_GPIO_DEBOUNCE_1US;
+		break;
+	case 10:
+		deb_val = RTD1625_GPIO_DEBOUNCE_10US;
+		break;
+	case 100:
+		deb_val = RTD1625_GPIO_DEBOUNCE_100US;
+		break;
+	case 1000:
+		deb_val = RTD1625_GPIO_DEBOUNCE_1MS;
+		break;
+	case 10000:
+		deb_val = RTD1625_GPIO_DEBOUNCE_10MS;
+		break;
+	case 20000:
+		deb_val = RTD1625_GPIO_DEBOUNCE_20MS;
+		break;
+	case 30000:
+		deb_val = RTD1625_GPIO_DEBOUNCE_30MS;
+		break;
+	case 50000:
+		deb_val = RTD1625_GPIO_DEBOUNCE_50MS;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	val = FIELD_PREP(RTD1625_GPIO_DEBOUNCE, deb_val) | RTD1625_GPIO_DEBOUNCE_WREN;
+	regmap_write(data->regmap, GPIO_CONTROL(offset), val);
+
+	return 0;
+}
+
+static int rtd1625_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
+{
+	int debounce;
+
+	if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
+		debounce = pinconf_to_config_argument(config);
+		return rtd1625_gpio_set_debounce(chip, offset, debounce);
+	}
+
+	return gpiochip_generic_config(chip, offset, config);
+}
+
+static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
+{
+	unsigned int (*get_reg_offset)(struct rtd1625_gpio *gpio, unsigned int offset);
+	struct rtd1625_gpio *data = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct irq_domain *domain = data->domain;
+	unsigned int reg_offset, i, j, val;
+	irq_hw_number_t hwirq;
+	unsigned long status;
+	unsigned int girq;
+	u32 irq_type;
+
+	if (irq == data->irqs[0])
+		get_reg_offset = &rtd1625_gpio_gpa_offset;
+	else if (irq == data->irqs[1])
+		get_reg_offset = &rtd1625_gpio_gpda_offset;
+	else if (irq == data->irqs[2])
+		get_reg_offset = &rtd1625_gpio_level_offset;
+	else
+		return;
+
+	chained_irq_enter(chip, desc);
+
+	for (i = 0; i < data->info->num_gpios; i += 32) {
+		reg_offset = get_reg_offset(data, i);
+		regmap_read(data->regmap, reg_offset, &val);
+
+		status = val;
+
+		/* Clear edge interrupts; level interrupts are cleared in ->irq_ack() */
+		if (irq != data->irqs[2])
+			regmap_write(data->regmap, reg_offset, status);
+
+		for_each_set_bit(j, &status, 32) {
+			hwirq = i + j;
+			girq = irq_find_mapping(domain, hwirq);
+			irq_type = irq_get_trigger_type(girq);
+
+			if (irq == data->irqs[1] && irq_type != IRQ_TYPE_EDGE_BOTH)
+				continue;
+
+			generic_handle_domain_irq(domain, hwirq);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void rtd1625_gpio_ack_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 irq_type = irqd_get_trigger_type(d);
+	u32 bit_mask = BIT(hwirq % 32);
+	struct rtd1625_gpio *data;
+	struct gpio_regmap *gpio;
+	int reg_offset;
+
+	gpio = gpiochip_get_data(gc);
+	data = gpio_regmap_get_drvdata(gpio);
+
+	if (irq_type & IRQ_TYPE_LEVEL_MASK) {
+		reg_offset = rtd1625_gpio_level_offset(data, hwirq);
+		regmap_write(data->regmap, reg_offset, bit_mask);
+	}
+}
+
+static void rtd1625_gpio_enable_edge_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	int gpda_reg_offset = rtd1625_gpio_gpda_offset(data, hwirq);
+	int gpa_reg_offset = rtd1625_gpio_gpa_offset(data, hwirq);
+	u32 clr_mask = BIT(hwirq % 32);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	regmap_write(data->regmap, gpa_reg_offset, clr_mask);
+	regmap_write(data->regmap, gpda_reg_offset, clr_mask);
+	val = RTD1625_GPIO_EDGE_INT_EN | RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_EN);
+	regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
+}
+
+static void rtd1625_gpio_disable_edge_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	val = RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_EN);
+	regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
+}
+
+static void rtd1625_gpio_enable_level_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	int level_reg_offset = rtd1625_gpio_level_offset(data, hwirq);
+	u32 clr_mask = BIT(hwirq % 32);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	regmap_write(data->regmap, level_reg_offset, clr_mask);
+	val = RTD1625_GPIO_LEVEL_INT_EN | RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_EN);
+	regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
+}
+
+static void rtd1625_gpio_disable_level_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	val = RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_EN);
+	regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
+}
+
+static void rtd1625_gpio_enable_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 irq_type = irqd_get_trigger_type(d);
+	struct rtd1625_gpio *data;
+	struct gpio_regmap *gpio;
+
+	gpio = gpiochip_get_data(gc);
+	data = gpio_regmap_get_drvdata(gpio);
+
+	gpiochip_enable_irq(gc, hwirq);
+
+	if (irq_type & IRQ_TYPE_EDGE_BOTH)
+		rtd1625_gpio_enable_edge_irq(data, hwirq);
+	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
+		rtd1625_gpio_enable_level_irq(data, hwirq);
+}
+
+static void rtd1625_gpio_disable_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 irq_type = irqd_get_trigger_type(d);
+	struct rtd1625_gpio *data;
+	struct gpio_regmap *gpio;
+
+	gpio = gpiochip_get_data(gc);
+	data = gpio_regmap_get_drvdata(gpio);
+
+	if (irq_type & IRQ_TYPE_EDGE_BOTH)
+		rtd1625_gpio_disable_edge_irq(data, hwirq);
+	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
+		rtd1625_gpio_disable_level_irq(data, hwirq);
+
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
+{
+	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_DP);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct rtd1625_gpio *data;
+	struct gpio_regmap *gpio;
+
+	gpio = gpiochip_get_data(gc);
+	data = gpio_regmap_get_drvdata(gpio);
+	if (!(data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &data->lock) {
+		if (level)
+			val |= RTD1625_GPIO_LEVEL_INT_DP;
+		regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
+	}
+
+	irq_set_handler_locked(d, handle_level_irq);
+
+	return 0;
+}
+
+static int rtd1625_gpio_irq_set_edge_type(struct irq_data *d, bool polarity)
+{
+	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_DP);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct rtd1625_gpio *data;
+	struct gpio_regmap *gpio;
+
+	gpio = gpiochip_get_data(gc);
+	data = gpio_regmap_get_drvdata(gpio);
+	if (!(data->info->irq_type_support & IRQ_TYPE_EDGE_BOTH))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &data->lock) {
+		if (polarity)
+			val |= RTD1625_GPIO_EDGE_INT_DP;
+		regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
+	}
+
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static int rtd1625_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	int ret;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		ret = rtd1625_gpio_irq_set_edge_type(d, 1);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ret = rtd1625_gpio_irq_set_edge_type(d, 0);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		ret = rtd1625_gpio_irq_set_edge_type(d, 1);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		ret = rtd1625_gpio_irq_set_level_type(d, 0);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		ret = rtd1625_gpio_irq_set_level_type(d, 1);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static struct irq_chip rtd1625_iso_gpio_irq_chip = {
+	.name = "rtd1625-gpio",
+	.irq_ack = rtd1625_gpio_ack_irq,
+	.irq_mask = rtd1625_gpio_disable_irq,
+	.irq_unmask = rtd1625_gpio_enable_irq,
+	.irq_set_type = rtd1625_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_gpio *data)
+{
+	int num_irqs, irq, i;
+
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -ENXIO)
+		return 0;
+	if (irq < 0)
+		return irq;
+
+	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;
+
+	for (i = 0; i < num_irqs; i++) {
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+
+		data->irqs[i] = irq;
+		irq_set_chained_handler_and_data(data->irqs[i], rtd1625_gpio_irq_handle, data);
+	}
+
+	return 0;
+}
+
+static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
+				irq_hw_number_t hwirq)
+{
+	struct rtd1625_gpio *data = domain->host_data;
+
+	irq_set_chip_data(irq, data->gpio_chip);
+
+	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_irq);
+
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops rtd1625_gpio_irq_domain_ops = {
+	.map = rtd1625_gpio_irq_map,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static const struct regmap_config rtd1625_gpio_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.disable_locking = true,
+};
+
+static int rtd1625_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_regmap_config config = {0};
+	struct device *dev = &pdev->dev;
+	struct gpio_regmap *gpio_reg;
+	struct rtd1625_gpio *data;
+	void __iomem *irq_base;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->info = device_get_match_data(dev);
+	if (!data->info)
+		return -EINVAL;
+
+	irq_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(irq_base))
+		return PTR_ERR(irq_base);
+
+	data->regmap = devm_regmap_init_mmio(dev, irq_base,
+					     &rtd1625_gpio_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	data->save_regs = devm_kzalloc(dev, data->info->num_gpios *
+				       sizeof(*data->save_regs), GFP_KERNEL);
+	if (!data->save_regs)
+		return -ENOMEM;
+
+	config.parent = dev;
+	config.regmap = data->regmap;
+	config.ngpio = data->info->num_gpios;
+	config.reg_dat_base = data->info->base_offset;
+	config.reg_set_base = data->info->base_offset;
+	config.reg_mask_xlate = rtd1625_reg_mask_xlate;
+	config.set_config = rtd1625_gpio_set_config;
+	config.reg_dir_out_base = data->info->base_offset;
+
+	data->domain = irq_domain_add_linear(dev->of_node,
+					     data->info->num_gpios,
+					     &rtd1625_gpio_irq_domain_ops,
+					     data);
+	if (!data->domain)
+		return -ENOMEM;
+
+	ret = rtd1625_gpio_setup_irq(pdev, data);
+	if (ret) {
+		irq_domain_remove(data->domain);
+		return ret;
+	}
+
+	config.irq_domain = data->domain;
+	config.drvdata = data;
+	platform_set_drvdata(pdev, data);
+
+	gpio_reg = devm_gpio_regmap_register(dev, &config);
+	if (IS_ERR(gpio_reg)) {
+		irq_domain_remove(data->domain);
+		return PTR_ERR(gpio_reg);
+	}
+
+	data->gpio_chip = gpio_regmap_get_gpiochip(gpio_reg);
+
+	return 0;
+}
+
+static const struct rtd1625_gpio_info rtd1625_iso_gpio_info = {
+	.num_gpios		= 166,
+	.irq_type_support	= IRQ_TYPE_EDGE_BOTH,
+	.base_offset		= 0x100,
+	.gpa_offset		= 0x0,
+	.gpda_offset		= 0x20,
+	.write_en_all		= RTD1625_ISO_GPIO_WREN_ALL,
+};
+
+static const struct rtd1625_gpio_info rtd1625_isom_gpio_info = {
+	.num_gpios		= 4,
+	.irq_type_support	= IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_LOW |
+				  IRQ_TYPE_LEVEL_HIGH,
+	.base_offset		= 0x20,
+	.gpa_offset		= 0x0,
+	.gpda_offset		= 0x4,
+	.level_offset		= 0x18,
+	.write_en_all		= RTD1625_ISOM_GPIO_WREN_ALL,
+};
+
+static const struct of_device_id rtd1625_gpio_of_matches[] = {
+	{ .compatible = "realtek,rtd1625-iso-gpio", .data = &rtd1625_iso_gpio_info },
+	{ .compatible = "realtek,rtd1625-isom-gpio", .data = &rtd1625_isom_gpio_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rtd1625_gpio_of_matches);
+
+static int rtd1625_gpio_suspend(struct device *dev)
+{
+	struct rtd1625_gpio *data = dev_get_drvdata(dev);
+	const struct rtd1625_gpio_info *info = data->info;
+	int i;
+
+	for (i = 0; i < info->num_gpios; i++)
+		regmap_read(data->regmap, data->info->base_offset + GPIO_CONTROL(i),
+			    &data->save_regs[i]);
+
+	return 0;
+}
+
+static int rtd1625_gpio_resume(struct device *dev)
+{
+	struct rtd1625_gpio *data = dev_get_drvdata(dev);
+	const struct rtd1625_gpio_info *info = data->info;
+	int i;
+
+	for (i = 0; i < info->num_gpios; i++)
+		regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(i),
+			     data->save_regs[i] | info->write_en_all);
+
+	return 0;
+}
+
+DEFINE_NOIRQ_DEV_PM_OPS(rtd1625_gpio_pm_ops, rtd1625_gpio_suspend, rtd1625_gpio_resume);
+
+static struct platform_driver rtd1625_gpio_platform_driver = {
+	.driver = {
+		.name = "gpio-rtd1625",
+		.of_match_table = rtd1625_gpio_of_matches,
+		.pm = pm_sleep_ptr(&rtd1625_gpio_pm_ops),
+	},
+	.probe = rtd1625_gpio_probe,
+};
+module_platform_driver(rtd1625_gpio_platform_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Realtek Semiconductor Corporation");
+MODULE_DESCRIPTION("Realtek DHC SoC RTD1625 gpio driver");
-- 
2.34.1



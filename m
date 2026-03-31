Return-Path: <linux-gpio+bounces-34474-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGhrAHy0y2kpKAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34474-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:48:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738A3690D5
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 147F330922D9
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9C33E1205;
	Tue, 31 Mar 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="hPuTmksP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562C3D9027;
	Tue, 31 Mar 2026 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957296; cv=none; b=YInVCanjSDYX9T2N2wBJ45i7cUy/C46ijfugvHWB1y2pnhMBg/OqeUqkWfUh1eG7EOWJwZ6q6mxGRjfDEqfvYIGN8yoOEKc1xKAOe9R8ebSimF6P6zbmpIIYBgaKrgZ8YPuJ+B/aWOugKRXNQWWiXGLBtMw6NJhM1EuhrXDGtwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957296; c=relaxed/simple;
	bh=G33wzhqL7kCwwcVllXYG5XwQw6sdRf+w3WWWqvP/sLs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+wz051uhwuymP0RzXgFzrHQ9F78gSSC5+q8SJsh6A+aKeRUhUaZ3QEhhjbCIQfDF3+CkJAdRqE31UPoWqqz2wKk/63FjRZQeZeXe/fnGkoFL5fsOQRk18Lj3+W5V0qgnzPDb8OTIYVzSKd7ade/OCAYF6b7fr9aMP9ftrujHqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=hPuTmksP; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62VBcZAM13149089, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774957115; bh=fp+gIfN0XfLllbGp+ZUFko52O+545pk/PSdxsFVOVHs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=hPuTmksPEr0J53GZ5lyG3j4ln2xIbHJp2OqpmLrenSx4pEjD2WvrPqZzi/Tq5F0W/
	 kP4wLgMTSCMpVYLvJAwJak8n40gztWgP4Rr2AMZDIVgKdTg6pGYHNzEjbe6PAcJVQE
	 JRR49ljFxlB9quDuJSNefAJ9M6FeSoQouBRdxOs6xxUwqlK9f3W/bm1ooC+7GEBpo6
	 RdMev5CdENEuB2KpiVF7X/IegAZpozvLz3UvZeE6BybsZurmoNc2eofSOYF7X0ch8o
	 lD8NlOouSUg2wXmpo0baft8+o4lfhA+UejpomNoImTkDLGpTHqyDykYv2KLQ28h8+K
	 OULstreHQE8/Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62VBcZAM13149089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2026 19:38:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:36 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:35 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 19:38:35 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH 3/3] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
Date: Tue, 31 Mar 2026 19:38:35 +0800
Message-ID: <20260331113835.3510341-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331113835.3510341-1-eleanor.lin@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34474-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[realtek.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7738A3690D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.

Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
which manages pins via shared bank registers, the RTD1625 introduces
a per-pin register architecture. Each GPIO line now has its own
dedicated 32-bit control register to manage configuration independently,
including direction, output value, input value, interrupt enable, and
debounce. Therefore, this distinct hardware design requires a separate
driver.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/Kconfig        |  12 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-rtd1625.c | 581 ++++++++++++++++++++++++++++++++++++
 3 files changed, 594 insertions(+)
 create mode 100644 drivers/gpio/gpio-rtd1625.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..6ffc95e02cb9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -639,6 +639,18 @@ config GPIO_RTD
 	  Say yes here to support GPIO functionality and GPIO interrupt on
 	  Realtek DHC SoCs.
 
+config GPIO_RTD1625
+	tristate "Realtek DHC RTD1625 GPIO support"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	default y
+	select GPIOLIB_IRQCHIP
+	help
+	  This option enables support for the GPIO controller on Realtek
+	  DHC (Digital Home Center) RTD1625 SoC.
+
+	  Say yes here to support both basic GPIO line functionality
+	  and GPIO interrupt handling capabilities for this platform.
+
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
 	depends on MFD_SYSCON
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..c95ba218d53a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
+obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
new file mode 100644
index 000000000000..10559a892c06
--- /dev/null
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Realtek DHC RTD1625 gpio driver
+ *
+ * Copyright (c) 2023 Realtek Semiconductor Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
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
+	unsigned int	num_gpios;
+	unsigned int	irq_type_support;
+	unsigned int	gpa_offset;
+	unsigned int	gpda_offset;
+	unsigned int	level_offset;
+	unsigned int	write_en_all;
+};
+
+struct rtd1625_gpio {
+	struct gpio_chip		gpio_chip;
+	const struct rtd1625_gpio_info	*info;
+	void __iomem			*base;
+	void __iomem			*irq_base;
+	unsigned int			irqs[3];
+	raw_spinlock_t			lock;
+	unsigned int			*save_regs;
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
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	writel_relaxed(val, data->base + GPIO_CONTROL(offset));
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
+static int rtd1625_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct rtd1625_gpio *data = gpiochip_get_data(chip);
+	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_OUT);
+
+	if (value)
+		val |= RTD1625_GPIO_OUT;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	writel_relaxed(val, data->base + GPIO_CONTROL(offset));
+
+	return 0;
+}
+
+static int rtd1625_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rtd1625_gpio *data = gpiochip_get_data(chip);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	val = readl_relaxed(data->base + GPIO_CONTROL(offset));
+
+	if (val & RTD1625_GPIO_DIR)
+		return !!(val & RTD1625_GPIO_OUT);
+	else
+		return !!(val & RTD1625_GPIO_IN);
+}
+
+static int rtd1625_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rtd1625_gpio *data = gpiochip_get_data(chip);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	val = readl_relaxed(data->base + GPIO_CONTROL(offset));
+
+	if (val & RTD1625_GPIO_DIR)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int rtd1625_gpio_set_direction(struct gpio_chip *chip, unsigned int offset, bool out)
+{
+	struct rtd1625_gpio *data = gpiochip_get_data(chip);
+	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_DIR);
+
+	if (out)
+		val |= RTD1625_GPIO_DIR;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	writel_relaxed(val, data->base + GPIO_CONTROL(offset));
+
+	return 0;
+}
+
+static int rtd1625_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	return rtd1625_gpio_set_direction(chip, offset, false);
+}
+
+static int rtd1625_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	rtd1625_gpio_set(chip, offset, value);
+
+	return rtd1625_gpio_set_direction(chip, offset, true);
+}
+
+static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
+{
+	unsigned int (*get_reg_offset)(struct rtd1625_gpio *gpio, unsigned int offset);
+	struct rtd1625_gpio *data = irq_desc_get_handler_data(desc);
+	struct irq_domain *domain = data->gpio_chip.irq.domain;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int irq = irq_desc_get_irq(desc);
+	unsigned long status;
+	unsigned int reg_offset, i, j;
+	unsigned int girq;
+	irq_hw_number_t hwirq;
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
+		status = readl_relaxed(data->irq_base + reg_offset);
+
+		/* Clear edge interrupts; level interrupts are cleared in ->irq_ack() */
+		if (irq != data->irqs[2])
+			writel_relaxed(status, data->irq_base + reg_offset);
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
+	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 irq_type = irqd_get_trigger_type(d);
+	u32 bit_mask = BIT(hwirq % 32);
+	int reg_offset;
+
+	if (irq_type & IRQ_TYPE_LEVEL_MASK) {
+		reg_offset = rtd1625_gpio_level_offset(data, hwirq);
+		writel_relaxed(bit_mask, data->irq_base + reg_offset);
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
+	writel_relaxed(clr_mask, data->irq_base + gpa_reg_offset);
+	writel_relaxed(clr_mask, data->irq_base + gpda_reg_offset);
+	val = RTD1625_GPIO_EDGE_INT_EN | RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_EN);
+	writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
+}
+
+static void rtd1625_gpio_disable_edge_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	val = RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_EN);
+	writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
+}
+
+static void rtd1625_gpio_enable_level_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	int level_reg_offset = rtd1625_gpio_level_offset(data, hwirq);
+	u32 clr_mask = BIT(hwirq % 32);
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	writel_relaxed(clr_mask, data->irq_base + level_reg_offset);
+	val = RTD1625_GPIO_LEVEL_INT_EN | RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_EN);
+	writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
+}
+
+static void rtd1625_gpio_disable_level_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
+{
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&data->lock);
+	val = RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_EN);
+	writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
+}
+
+static void rtd1625_gpio_enable_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 irq_type = irqd_get_trigger_type(d);
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
+	struct rtd1625_gpio *data = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 irq_type = irqd_get_trigger_type(d);
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
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_DP);
+
+	if (!(data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &data->lock) {
+		if (level)
+			val |= RTD1625_GPIO_LEVEL_INT_DP;
+		writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
+	}
+
+	irq_set_handler_locked(d, handle_level_irq);
+
+	return 0;
+}
+
+static int rtd1625_gpio_irq_set_edge_type(struct irq_data *d, bool polarity)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_DP);
+
+	if (!(data->info->irq_type_support & IRQ_TYPE_EDGE_BOTH))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &data->lock) {
+		if (polarity)
+			val |= RTD1625_GPIO_EDGE_INT_DP;
+		writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
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
+	struct gpio_irq_chip *irq_chip;
+	int num_irqs;
+	int irq;
+	int i;
+
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -ENXIO)
+		return 0;
+	if (irq < 0)
+		return irq;
+
+	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;
+	data->irqs[0] = irq;
+
+	for (i = 1; i < num_irqs; i++) {
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+		data->irqs[i] = irq;
+	}
+
+	irq_chip = &data->gpio_chip.irq;
+	irq_chip->handler = handle_bad_irq;
+	irq_chip->default_type = IRQ_TYPE_NONE;
+	irq_chip->parent_handler = rtd1625_gpio_irq_handle;
+	irq_chip->parent_handler_data = data;
+	irq_chip->num_parents = num_irqs;
+	irq_chip->parents = data->irqs;
+
+	gpio_irq_chip_set_chip(irq_chip, &rtd1625_iso_gpio_irq_chip);
+
+	return 0;
+}
+
+static int rtd1625_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtd1625_gpio *data;
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
+	raw_spin_lock_init(&data->lock);
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	data->irq_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(data->irq_base))
+		return PTR_ERR(data->irq_base);
+
+	data->save_regs = devm_kzalloc(dev, data->info->num_gpios *
+				       sizeof(*data->save_regs), GFP_KERNEL);
+	if (!data->save_regs)
+		return -ENOMEM;
+
+	data->gpio_chip.label = dev_name(dev);
+	data->gpio_chip.base = -1;
+	data->gpio_chip.ngpio = data->info->num_gpios;
+	data->gpio_chip.request = gpiochip_generic_request;
+	data->gpio_chip.free = gpiochip_generic_free;
+	data->gpio_chip.get_direction = rtd1625_gpio_get_direction;
+	data->gpio_chip.direction_input = rtd1625_gpio_direction_input;
+	data->gpio_chip.direction_output = rtd1625_gpio_direction_output;
+	data->gpio_chip.set = rtd1625_gpio_set;
+	data->gpio_chip.get = rtd1625_gpio_get;
+	data->gpio_chip.set_config = rtd1625_gpio_set_config;
+	data->gpio_chip.parent = dev;
+
+	ret = rtd1625_gpio_setup_irq(pdev, data);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, data);
+
+	return devm_gpiochip_add_data(dev, &data->gpio_chip, data);
+}
+
+static const struct rtd1625_gpio_info rtd1625_iso_gpio_info = {
+	.num_gpios		= 166,
+	.irq_type_support	= IRQ_TYPE_EDGE_BOTH,
+	.gpa_offset		= 0x0,
+	.gpda_offset		= 0x20,
+	.write_en_all		= RTD1625_ISO_GPIO_WREN_ALL,
+};
+
+static const struct rtd1625_gpio_info rtd1625_isom_gpio_info = {
+	.num_gpios		= 4,
+	.irq_type_support	= IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_LOW |
+				  IRQ_TYPE_LEVEL_HIGH,
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
+		data->save_regs[i] = readl_relaxed(data->base + GPIO_CONTROL(i));
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
+		writel_relaxed(data->save_regs[i] | info->write_en_all,
+			       data->base + GPIO_CONTROL(i));
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



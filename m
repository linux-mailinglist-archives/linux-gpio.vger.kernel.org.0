Return-Path: <linux-gpio+bounces-38781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pOGcJcQBOWpLlQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:35:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9576AE485
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:34:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=realtek.com header.s=dkim header.b=C+z7X67Q;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38781-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38781-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=realtek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0E87300A5B8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5082539EF0B;
	Mon, 22 Jun 2026 09:34:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5E539C63E;
	Mon, 22 Jun 2026 09:34:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120868; cv=none; b=pu3844Mdxs1bIS4ZMcjmWUlEEuaG4AP4OPkZvdytmLNpnDfysfMo5uhKwBuUZGftG8DeEyoKHZPZG7BwhF6iodnWTNJ7QnVMlSIarOSq5OjTYO1ZlUV9TtmavzJNE2jvli2NhBehSrW0120/WZPtRWe91I8l9/QdV9veTq21gRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120868; c=relaxed/simple;
	bh=qqNc4XHzJMAjcyBzVI5Xkb/VcWQ6WHFcHkMiEUD0LiU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fihZLN6wxgxuwDb4H3eEz8yXBfr6Hshfd8OBDlgKGbCIWdFySyHGHJtPafYCCbXi9wbXxjxsASwSG/hLDdzlU7t08DIJxlmKPtnANxD11Eh4wrp6hmfhK8XdFUUkhbAohVBr79CRLRygaixB5yzdWQ6i294aZnYOQRHqbm4bPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=C+z7X67Q; arc=none smtp.client-ip=211.75.126.72
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65M9Nb1E22430974, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782120217; bh=0DEUKRRkzWR4rF3gtxT5U39CW97NYUXOKT5zKnJ8XQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=C+z7X67QdPP2hdyH69WObIc2t8h27fwHTpOrAEdsdpu6a8+LzHNA6Ycol1yFghQCb
	 y3SfpNMuhQqEhmxvQq2ZHz5VnCjt9fzfRgdeIY7Uc+Z8isl92S96686wlK26WRWZm/
	 /NCmBy4LCg/6P4YVM2Hzbw1EYLmXd9kvAvBPfEtGG24w/2jqWbxIHry/+GMbvXiFRF
	 CvLLVh91ISQkXgk6MSZ8abArm9vSGnupqiI/QuBBvga7psCnxcn5uFTW/8zJV3LH5p
	 uQgi4MCDGlvF9qCkiULhj9rO/S2js2fqA4DFfUw7kf+Tj68eAr0fYBthu9Xia1qF39
	 S/0WTpTruF44g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65M9Nb1E22430974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jun 2026 17:23:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:38 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 17:23:37 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Jun 2026 17:23:37 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v4 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
Date: Mon, 22 Jun 2026 17:23:34 +0800
Message-ID: <20260622092335.1166876-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622092335.1166876-1-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38781-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:eleanor.lin@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF9576AE485

From: Tzuyi Chang <tychang@realtek.com>

Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.

Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
which manages pins via shared bank registers, the RTD1625 introduces
a per-pin register architecture. Each GPIO line now has its own
dedicated 32-bit control register to manage configuration independently,
including direction, output value, input value, interrupt enable, and
debounce. Therefore, this distinct hardware design requires a separate
driver.

Additionally, the RTD1625 GPIO controller has a specific hardware quirk:
it fires both 'assert' and 'de-assert' interrupts simultaneously on any
edge toggle. To handle this, we utilize the polarity register to route
the requested edge (rising/falling) to the 'assert' IRQ line. The driver
then filters out the unwanted 'de-assert' interrupt in the IRQ handler
and pre-clears edge interrupts to prevent interrupt storms caused by
unhandled dropped interrupts.

Interrupt support is optional for this device, matching the dt-bindings.
If the interrupts property is not provided, the driver simply skips IRQ
initialization and operates purely as a basic GPIO controller.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes between v2 and v4:
IRQ Handling Fix
- Added enum rtd1625_irq_index with named constants to replace magic array
indices 0/1/2.
- Documented hardware quirk.

Coding style & cleanup:
- In rtd1625_gpio_irq_set_type(), using return directly in each switch case.
- Changed int loop counters to unsigned int.
- Replaced devm_kzalloc() with devm_kcalloc() in probe.
- Moved of_device_id table closer to its user.
- Added static to DEFINE_NOIRQ_DEV_PM_OPS.
- Formatting consistency: zero-padded hex constants.

New header:
- Added #include <linux/cleanup.h> (required for the guard() / scoped_guard()
macros).

Copyright year updated:
- 2023 -> 2023-2026.
---
 drivers/gpio/Kconfig        |  12 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-rtd1625.c | 611 ++++++++++++++++++++++++++++++++++++
 3 files changed, 624 insertions(+)
 create mode 100644 drivers/gpio/gpio-rtd1625.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ed2bc3113374..f03c05288376 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -656,6 +656,18 @@ config GPIO_RTD
 	  Say yes here to support GPIO functionality and GPIO interrupt on
 	  Realtek DHC SoCs.
 
+config GPIO_RTD1625
+	tristate "Realtek DHC RTD1625 GPIO support"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	default ARCH_REALTEK
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
 	depends on OF
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 4d0e900402fc..fa14581e3995 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -160,6 +160,7 @@ obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
+obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
new file mode 100644
index 000000000000..409e540bf40b
--- /dev/null
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -0,0 +1,611 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Realtek DHC RTD1625 gpio driver
+ *
+ * Copyright (c) 2023-2026 Realtek Semiconductor Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
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
+enum rtd1625_irq_index {
+	RTD1625_IRQ_ASSERT,
+	RTD1625_IRQ_DEASSERT,
+	RTD1625_IRQ_LEVEL,
+	RTD1625_MAX_IRQS
+};
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
+	unsigned int	base_offset;
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
+	unsigned int			irqs[RTD1625_MAX_IRQS];
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
+static int rtd1625_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				     unsigned int debounce)
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
+
+	writel_relaxed(val, data->base + GPIO_CONTROL(offset));
+
+	return 0;
+}
+
+static int rtd1625_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
+{
+	u32 debounce;
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
+
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
+
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
+
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
+
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
+	if (irq == data->irqs[RTD1625_IRQ_ASSERT])
+		get_reg_offset = &rtd1625_gpio_gpa_offset;
+	else if (irq == data->irqs[RTD1625_IRQ_DEASSERT])
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
+		/*
+		 * Hardware quirk: The controller fires both "assert" and "de-assert"
+		 * interrupts simultaneously on any edge toggle.
+		 * We must pre-clear edge interrupts here. If we drop an unwanted
+		 * de-assert interrupt below, it will never reach the IRQ core
+		 * (generic_handle_domain_irq), meaning ->irq_ack() won't be called.
+		 * Failing to clear it here leads to an interrupt storm.
+		 */
+		if (irq != data->irqs[RTD1625_IRQ_LEVEL])
+			writel_relaxed(status, data->irq_base + reg_offset);
+
+		for_each_set_bit(j, &status, 32) {
+			hwirq = i + j;
+			girq = irq_find_mapping(domain, hwirq);
+			irq_type = irq_get_trigger_type(girq);
+
+			/*
+			 * Filter out the hardware-forced de-assert interrupt unless
+			 * the user explicitly requested IRQ_TYPE_EDGE_BOTH.
+			 */
+			if (irq == data->irqs[RTD1625_IRQ_DEASSERT] &&
+			    irq_type != IRQ_TYPE_EDGE_BOTH)
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
+
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
+
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
+
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
+
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
+	if (level)
+		val |= RTD1625_GPIO_LEVEL_INT_DP;
+
+	scoped_guard(raw_spinlock_irqsave, &data->lock)
+		writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
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
+	if (polarity)
+		val |= RTD1625_GPIO_EDGE_INT_DP;
+
+	scoped_guard(raw_spinlock_irqsave, &data->lock)
+		writel_relaxed(val, data->base + GPIO_CONTROL(hwirq));
+
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static int rtd1625_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		return rtd1625_gpio_irq_set_edge_type(d, 1);
+
+	case IRQ_TYPE_EDGE_FALLING:
+		return rtd1625_gpio_irq_set_edge_type(d, 0);
+
+	case IRQ_TYPE_EDGE_BOTH:
+		return rtd1625_gpio_irq_set_edge_type(d, 1);
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		return rtd1625_gpio_irq_set_level_type(d, 0);
+
+	case IRQ_TYPE_LEVEL_LOW:
+		return rtd1625_gpio_irq_set_level_type(d, 1);
+
+	default:
+		return -EINVAL;
+	}
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
+	unsigned int num_irqs;
+	int irq;
+
+	/*
+	 * Interrupt support is optional. All IRQs must be provided together.
+	 * If index 0 is missing, we assume no interrupts are configured in DT
+	 * and fall back to basic GPIO operation.
+	 */
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -ENXIO)
+		return 0;
+	if (irq < 0)
+		return irq;
+
+	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;
+	data->irqs[RTD1625_IRQ_ASSERT] = irq;
+
+	for (unsigned int i = 1; i < num_irqs; i++) {
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
+	raw_spin_lock_init(&data->lock);
+
+	irq_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(irq_base))
+		return PTR_ERR(irq_base);
+
+	data->irq_base = irq_base;
+	data->base = irq_base + data->info->base_offset;
+
+	data->save_regs = devm_kcalloc(dev, data->info->num_gpios, sizeof(*data->save_regs),
+				       GFP_KERNEL);
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
+	.num_gpios        = 166,
+	.irq_type_support = IRQ_TYPE_EDGE_BOTH,
+	.base_offset      = 0x100,
+	.gpa_offset       = 0x000,
+	.gpda_offset      = 0x020,
+	.write_en_all     = RTD1625_ISO_GPIO_WREN_ALL,
+};
+
+static const struct rtd1625_gpio_info rtd1625_isom_gpio_info = {
+	.num_gpios        = 4,
+	.irq_type_support = IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_LOW |
+			    IRQ_TYPE_LEVEL_HIGH,
+	.base_offset      = 0x20,
+	.gpa_offset       = 0x00,
+	.gpda_offset      = 0x04,
+	.level_offset     = 0x18,
+	.write_en_all     = RTD1625_ISOM_GPIO_WREN_ALL,
+};
+
+static int rtd1625_gpio_suspend(struct device *dev)
+{
+	struct rtd1625_gpio *data = dev_get_drvdata(dev);
+	const struct rtd1625_gpio_info *info = data->info;
+
+	for (unsigned int i = 0; i < info->num_gpios; i++)
+		data->save_regs[i] = readl_relaxed(data->base + GPIO_CONTROL(i));
+
+	return 0;
+}
+
+static int rtd1625_gpio_resume(struct device *dev)
+{
+	struct rtd1625_gpio *data = dev_get_drvdata(dev);
+	const struct rtd1625_gpio_info *info = data->info;
+
+	for (unsigned int i = 0; i < info->num_gpios; i++)
+		writel_relaxed(data->save_regs[i] | info->write_en_all,
+			       data->base + GPIO_CONTROL(i));
+
+	return 0;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(rtd1625_gpio_pm_ops, rtd1625_gpio_suspend, rtd1625_gpio_resume);
+
+static const struct of_device_id rtd1625_gpio_of_matches[] = {
+	{ .compatible = "realtek,rtd1625-iso-gpio", .data = &rtd1625_iso_gpio_info },
+	{ .compatible = "realtek,rtd1625-isom-gpio", .data = &rtd1625_isom_gpio_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rtd1625_gpio_of_matches);
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
2.43.0



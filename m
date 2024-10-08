Return-Path: <linux-gpio+bounces-11022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF5994263
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91A5B1C21168
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5401F9AA8;
	Tue,  8 Oct 2024 08:15:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A9D1F9A8F;
	Tue,  8 Oct 2024 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375314; cv=none; b=I66LiUDSejXGS0jkYKcM5HYw8cbgX2xws5ZiOmVgjSf9TWqzUYgjOM56E47QBNO8TcXrarrmxryF7pJIJcuAZs6D8wdEU5wYkV+cTrIBPVs+N7BjqJRo0m8aLbvyTr0rkSghmZpy4LHcEYvD0ETXVkMbTTAz9XxmSguhgxNHLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375314; c=relaxed/simple;
	bh=41oRwmS99pG464oJ+r8Fzr03nZ6qyLa56YTiaeoXtKk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeRIpgMA+OP7heVik9x7YuVtK6ay8lgkZ6MtoGnzrKsCrL81EJZntgNrOEO49HiRq7f+XsW40GkJDM0HorayWP4o/c8DtuOAEXWlTLMvOKNQejfrn5L4vFLtvWfkTQd4CoKvsL7sIa8iPKQb6pcLK6fuIQV+2awoc0h+bfmnpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 16:14:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 8 Oct 2024 16:14:51 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v7 7/7] gpio: aspeed: Support G7 Aspeed gpio controller
Date: Tue, 8 Oct 2024 16:14:50 +0800
Message-ID: <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In the 7th generation of the SoC from Aspeed, the control logic of the
GPIO controller has been updated to support per-pin control. Each pin now
has its own 32-bit register, allowing for individual control of the pin's
value, direction, interrupt type, and other settings. The permission for
coprocessor access is supported by the hardware but hasn't been
implemented in the current patch.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 147 +++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 5d583cc9cbc7..208f95fb585e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -30,6 +30,27 @@
 #include <linux/gpio/consumer.h>
 #include "gpiolib.h"
 
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
+#define GPIO_G7_IRQ_STS_BASE 0x100
+#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
+#define GPIO_G7_CTRL_REG_BASE 0x180
+#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
+#define GPIO_G7_CTRL_OUT_DATA BIT(0)
+#define GPIO_G7_CTRL_DIR BIT(1)
+#define GPIO_G7_CTRL_IRQ_EN BIT(2)
+#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)
+#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
+#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
+#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)
+#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
+#define GPIO_G7_CTRL_IRQ_STS BIT(12)
+#define GPIO_G7_CTRL_IN_DATA BIT(13)
+
 struct aspeed_bank_props {
 	unsigned int bank;
 	u32 input;
@@ -95,6 +116,22 @@ struct aspeed_gpio_bank {
  */
 
 static const int debounce_timers[4] = { 0x00, 0x50, 0x54, 0x58 };
+static const int g7_debounce_timers[4] = { 0x00, 0x00, 0x04, 0x08 };
+
+/*
+ * The debounce timers array is used to configure the debounce timer settings.Here’s how it works:
+ * Array Value: Indicates the offset for configuring the debounce timer.
+ * Array Index: Corresponds to the debounce setting register.
+ * The debounce timers array follows this pattern for configuring the debounce setting registers:
+ * Array Index 0: No debounce timer is set;
+ *		  Array Value is irrelevant (don’t care).
+ * Array Index 1: Debounce setting #2 is set to 1, and debounce setting #1 is set to 0.
+ *		  Array Value: offset for configuring debounce timer 0 (g4: 0x50, g7: 0x00)
+ * Array Index 2: Debounce setting #2 is set to 0, and debounce setting #1 is set to 1.
+ *		  Array Value: offset for configuring debounce timer 1 (g4: 0x54, g7: 0x04)
+ * Array Index 3: Debounce setting #2 is set to 1, and debounce setting #1 is set to 1.
+ *		  Array Value: offset for configuring debounce timer 2 (g4: 0x58, g7: 0x8)
+ */
 
 static const struct aspeed_gpio_copro_ops *copro_ops;
 static void *copro_data;
@@ -250,6 +287,39 @@ static void __iomem *aspeed_gpio_g4_bank_reg(struct aspeed_gpio *gpio,
 	BUG();
 }
 
+static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg reg)
+{
+	switch (reg) {
+	case reg_val:
+		return GPIO_G7_CTRL_OUT_DATA;
+	case reg_dir:
+		return GPIO_G7_CTRL_DIR;
+	case reg_irq_enable:
+		return GPIO_G7_CTRL_IRQ_EN;
+	case reg_irq_type0:
+		return GPIO_G7_CTRL_IRQ_TYPE0;
+	case reg_irq_type1:
+		return GPIO_G7_CTRL_IRQ_TYPE1;
+	case reg_irq_type2:
+		return GPIO_G7_CTRL_IRQ_TYPE2;
+	case reg_tolerance:
+		return GPIO_G7_CTRL_RST_TOLERANCE;
+	case reg_debounce_sel1:
+		return GPIO_G7_CTRL_DEBOUNCE_SEL1;
+	case reg_debounce_sel2:
+		return GPIO_G7_CTRL_DEBOUNCE_SEL2;
+	case reg_rdata:
+		return GPIO_G7_CTRL_OUT_DATA;
+	case reg_irq_status:
+		return GPIO_G7_CTRL_IRQ_STS;
+	case reg_cmdsrc0:
+	case reg_cmdsrc1:
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
 #define GPIO_BANK(x)	((x) >> 5)
 #define GPIO_OFFSET(x)	((x) & 0x1f)
 #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
@@ -1106,6 +1176,59 @@ static const struct aspeed_gpio_llops aspeed_g4_llops = {
 	.copro_request = aspeed_g4_copro_request,
 	.copro_release = aspeed_g4_copro_release,
 };
+
+static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg, bool val)
+{
+	u32 mask = aspeed_gpio_g7_reg_mask(reg);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	u32 write_val;
+
+	if (mask) {
+		write_val = (ioread32(addr) & ~(mask)) | field_prep(mask, val);
+		iowrite32(write_val, addr);
+	}
+}
+
+static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg)
+{
+	u32 mask = aspeed_gpio_g7_reg_mask(reg);
+	void __iomem *addr;
+
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	if (reg == reg_val)
+		mask = GPIO_G7_CTRL_IN_DATA;
+
+	if (mask)
+		return field_get(mask, ioread32(addr));
+	else
+		return 0;
+}
+
+static int aspeed_g7_reg_bank_get(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg)
+{
+	void __iomem *addr;
+
+	if (reg == reg_irq_status) {
+		addr = gpio->base + GPIO_G7_IRQ_STS_OFFSET(offset >> 5);
+		return ioread32(addr);
+	} else {
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct aspeed_gpio_llops aspeed_g7_llops = {
+	.reg_bit_set = aspeed_g7_reg_bit_set,
+	.reg_bit_get = aspeed_g7_reg_bit_get,
+	.reg_bank_get = aspeed_g7_reg_bank_get,
+	.privilege_ctrl = NULL,
+	.privilege_init = NULL,
+	.copro_request = NULL,
+	.copro_release = NULL,
+};
+
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -1173,10 +1296,34 @@ static const struct aspeed_gpio_config ast2600_config =
 		.require_dcache = true,
 	};
 
+static const struct aspeed_bank_props ast2700_bank_props[] = {
+	/*     input	  output   */
+	{ 1, 0x0fffffff, 0x0fffffff }, /* E/F/G/H, 4-GPIO hole */
+	{ 6, 0x00ffffff, 0x00ff0000 }, /* Y/Z/AA */
+	{},
+};
+
+static const struct aspeed_gpio_config ast2700_config =
+	/*
+	 * ast2700 has two controllers one with 212 GPIOs and one with 16 GPIOs.
+	 * 216 for simplicity, actual number is 212 (4-GPIO hole in GPIOH)
+	 * We expect ngpio being set in the device tree and this is a fallback
+	 * option.
+	 */
+	{
+		.nr_gpios = 216,
+		.props = ast2700_bank_props,
+		.llops = &aspeed_g7_llops,
+		.debounce_timers_array = g7_debounce_timers,
+		.debounce_timers_num = ARRAY_SIZE(g7_debounce_timers),
+		.require_dcache = false,
+	};
+
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
 	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
 	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
+	{ .compatible = "aspeed,ast2700-gpio", .data = &ast2700_config, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.25.1



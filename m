Return-Path: <linux-gpio+bounces-10260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4297C76F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 11:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5581F29F3E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 09:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81BF199FA2;
	Thu, 19 Sep 2024 09:44:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080741A00E7;
	Thu, 19 Sep 2024 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726739048; cv=none; b=Iq4T9YVzqaKUvJdqNV2qXiAXCCce52sUyaUgfwWIotEggR7FCrtGtdL654s+o9GOO/dcPrSYI68EHqBXHgBauQQXybtVhFIZWvqh1jDCsRhm6xRwr3jCc+ifBVem9ez7AmUZIEXyAGUtGu2D5UpPIzGaxSJY8EjujMAPC03VcUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726739048; c=relaxed/simple;
	bh=mImFJQKRz9z618vsL1cawl2wlzOllP+qF7g08vAeb2k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JkFyqL2yj9tKATQ2pVSf6BIrNWSvpTPgTCipS/tBlUOZNBVqYxGChS4qSvdlO9s9qAPd4c7MVQyZc3KeJLy5/BTupJ8+LO3zHeP+SUYp4UvCBFVbcOyRlEANt/OEfL03sFQFBlagybz2POnj0yc6btI5rAj9/neW8ZhyH/VbW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 17:43:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 19 Sep 2024 17:43:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
Subject: [PATCH v4 4/6] gpio: aspeed: Support G7 Aspeed gpio controller
Date: Thu, 19 Sep 2024 17:43:37 +0800
Message-ID: <20240919094339.2407641-5-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
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
has its own 32-bit register, allowing for individual control of the pin’s
value, direction, interrupt type, and other settings. The permission for
coprocessor access is supported by the hardware but hasn’t been
implemented in the current patch.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 112 +++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 8b334ce7b60a..060c0225cb99 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -30,6 +30,23 @@
 #include <linux/gpio/consumer.h>
 #include "gpiolib.h"
 
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
+#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(7)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(8)
+#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
+#define GPIO_G7_CTRL_IRQ_STS BIT(12)
+#define GPIO_G7_CTRL_IN_DATA BIT(13)
+
 struct aspeed_bank_props {
 	unsigned int bank;
 	u32 input;
@@ -95,6 +112,7 @@ struct aspeed_gpio_bank {
  */
 
 static const int debounce_timers[4] = { 0x00, 0x50, 0x54, 0x58 };
+static const int g7_debounce_timers[4] = { 0x00, 0x04, 0x00, 0x08 };
 
 static const struct aspeed_gpio_copro_ops *copro_ops;
 static void *copro_data;
@@ -248,6 +266,39 @@ static inline void __iomem *bank_reg(struct aspeed_gpio *gpio,
 	BUG();
 }
 
+static inline u32 reg_mask(const enum aspeed_gpio_reg reg)
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
@@ -1095,6 +1146,43 @@ static const struct aspeed_gpio_llops aspeed_g4_llops = {
 	.privilege_ctrl = aspeed_g4_privilege_ctrl,
 	.privilege_init = aspeed_g4_privilege_init,
 };
+
+static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg, bool val)
+{
+	u32 mask = reg_mask(reg);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	u32 write_val = (ioread32(addr) & ~(mask)) | (((val) << (ffs(mask) - 1)) & (mask));
+
+	iowrite32(write_val, addr);
+}
+
+static u32 aspeed_g7_reg_bits_get(struct aspeed_gpio *gpio, unsigned int offset,
+				  const enum aspeed_gpio_reg reg)
+{
+	u32 mask = reg_mask(reg);
+	void __iomem *addr;
+
+	if (reg == reg_irq_status) {
+		addr = gpio->base + GPIO_G7_IRQ_STS_OFFSET(offset >> 5);
+		return ioread32(addr);
+	}
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	if (reg == reg_val)
+		mask = GPIO_G7_CTRL_IN_DATA;
+
+	return (((ioread32(addr)) & (mask)) >> (ffs(mask) - 1));
+}
+
+static const struct aspeed_gpio_llops aspeed_g7_llops = {
+	.copro_request = NULL,
+	.copro_release = NULL,
+	.reg_bit_set = aspeed_g7_reg_bit_set,
+	.reg_bits_get = aspeed_g7_reg_bits_get,
+	.privilege_ctrl = NULL,
+	.privilege_init = NULL,
+};
+
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -1162,10 +1250,34 @@ static const struct aspeed_gpio_config ast2600_config =
 		.dcache_require = true,
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
+		.dcache_require = false,
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



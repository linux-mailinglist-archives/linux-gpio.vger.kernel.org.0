Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEB26B10E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 23:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfGPVYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 17:24:36 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:47795 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbfGPVYg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 17:24:36 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-39-5d2e409f6701
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id AA.C2.14973.F904E2D5; Tue, 16 Jul 2019 17:24:47 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 16 Jul 2019 17:24:34 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3 v3] ARM: dts: aspeed: Add SGPIO driver
Date:   Tue, 16 Jul 2019 17:24:31 -0400
Message-ID: <1563312271-17509-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWyRiBhgu58B71Yg2ePFC12Xeaw+DL3FIvF
        7/N/mS2m/FnOZLHp8TVWi+bV55gtNs//w2hxedccNgcOj6vtu9g93t9oZfe4+PEYs8eda3vY
        PDYvqfc4P2Mho8fnTXIB7FFcNimpOZllqUX6dglcGRf2bGEr+P+QseLm2RNsDYxvNzF2MXJy
        SAiYSMyd9ICpi5GLQ0hgF5PE1MufoZzDjBK/d29mAaliE1CT2Lt5DlhCRGARo8TX3zPZQRxm
        gfWMEl3Ll7OBVAkLWElcmnIObC6LgKrEky1rWUFsXgEHiSXf3zJB7JOTuHmukxkiLihxcuYT
        sA3MAhISB1+8AIsLCchK3Dr0GKpeQeJ532OWCYx8s5C0zELSsoCRaRWjUGJJTm5iZk56uaFe
        Ym6mXnJ+7iZGSOhu2sHYctH8ECMTB+MhRgkOZiURXtuv2rFCvCmJlVWpRfnxRaU5qcWHGKU5
        WJTEeVeu+RYjJJCeWJKanZpakFoEk2Xi4JRqYNTRf3ugdV5Ww4R3Mn9T38b/mCW9gCNY3b6y
        wWaRb8IiHh3O61Y8nqKGPQbvzSYleC4+GVCqwXhB9aNIdXDk1TlrdRi4lxZNSCx8vtMsfpdi
        6vOpbI9VdqRveLn8/hVHxev7v1YnXjfmLn7AZ2B1WXLLh4UqJ496Tr3Jkr368u3djD93JE08
        qK/EUpyRaKjFXFScCADX9kb5SwIAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SGPIO driver support for Aspeed AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/gpio/sgpio-aspeed.c | 487 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 487 insertions(+)
 create mode 100644 drivers/gpio/sgpio-aspeed.c

diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c
new file mode 100644
index 0000000..ade2cb7
--- /dev/null
+++ b/drivers/gpio/sgpio-aspeed.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019 American Megatrends International LLC.
+ *
+ * Author: Karthikeyan Mani <karthikeyanm@amiindia.co.in>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/gpio/aspeed.h>
+#include <linux/hashtable.h>
+#include <linux/bitfield.h>
+#include <linux/init.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/gpio.h>
+
+#define MAX_NR_SGPIO			80
+
+#define ASPEED_SGPIO_CTRL		0x54
+
+#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
+#define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
+#define ASPEED_SGPIO_ENABLE		BIT(0)
+
+// default sgpio direction is input.
+static uint32_t sgpio_dir_val[3] = {0xffffffff, 0xffffffff, 0xffffffff };
+
+struct aspeed_sgpio {
+	struct gpio_chip chip;
+	struct clk *pclk;
+	spinlock_t lock;
+	void __iomem *base;
+	int irq;
+};
+
+struct aspeed_sgpio_bank {
+	uint16_t    val_regs;
+	uint16_t    rdata_reg;
+	uint16_t    irq_regs;
+	const char  names[4][3];
+};
+
+/*
+ * Note: The "value" register returns the input value sampled on the
+ *       line even when the GPIO is configured as an output. Since
+ *       that input goes through synchronizers, writing, then reading
+ *       back may not return the written value right away.
+ *
+ *       The "rdata" register returns the content of the write latch
+ *       and thus can be used to read back what was last written
+ *       reliably.
+ */
+static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
+	{
+		.val_regs = 0x0000,
+		.rdata_reg = 0x0070,
+		.irq_regs = 0x0004,
+		.names = { "A", "B", "C", "D" },
+	},
+	{
+		.val_regs = 0x001C,
+		.rdata_reg = 0x0074,
+		.irq_regs = 0x0020,
+		.names = { "E", "F", "G", "H" },
+	},
+	{
+		.val_regs = 0x0038,
+		.rdata_reg = 0x0078,
+		.irq_regs = 0x003C,
+		.names = { "I", "J" },
+	},
+};
+
+enum aspeed_sgpio_reg {
+	reg_val,
+	reg_rdata,
+	reg_irq_enable,
+	reg_irq_type0,
+	reg_irq_type1,
+	reg_irq_type2,
+	reg_irq_status,
+};
+
+#define GPIO_VAL_VALUE      0x00
+#define GPIO_VAL_DIR        0x04
+#define GPIO_IRQ_ENABLE     0x00
+#define GPIO_IRQ_TYPE0      0x04
+#define GPIO_IRQ_TYPE1      0x08
+#define GPIO_IRQ_TYPE2      0x0C
+#define GPIO_IRQ_STATUS     0x10
+
+/* This will be resolved at compile time */
+static inline void __iomem *bank_reg(struct aspeed_sgpio *gpio,
+				     const struct aspeed_sgpio_bank *bank,
+				     const enum aspeed_sgpio_reg reg)
+{
+	switch (reg) {
+	case reg_val:
+		return gpio->base + bank->val_regs + GPIO_VAL_VALUE;
+	case reg_rdata:
+		return gpio->base + bank->rdata_reg;
+	case reg_irq_enable:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_ENABLE;
+	case reg_irq_type0:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE0;
+	case reg_irq_type1:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE1;
+	case reg_irq_type2:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
+	case reg_irq_status:
+		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
+	default:
+		/* acturally if code runs to here, it's an error case */
+		BUG_ON(1);
+	}
+}
+
+#define GPIO_BANK(x)    ((x) >> 5)
+#define GPIO_OFFSET(x)  ((x) & 0x1f)
+#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
+
+static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
+{
+	unsigned int bank = GPIO_BANK(offset);
+
+	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
+	return &aspeed_sgpio_banks[bank];
+}
+
+static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+
+	if (sgpio_dir_val[GPIO_BANK(offset)] & GPIO_BIT(offset))
+		return !!(ioread32(bank_reg(gpio, bank, reg_val)) & GPIO_BIT(offset));
+	else
+		return !!(ioread32(bank_reg(gpio, bank, reg_rdata)) & GPIO_BIT(offset));
+
+}
+
+static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 reg = 0;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	addr = bank_reg(gpio, bank, reg_val);
+
+	if (val)
+		reg |= GPIO_BIT(offset);
+	else
+		reg &= ~GPIO_BIT(offset);
+
+	iowrite32(reg, addr);
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	sgpio_dir_val[GPIO_BANK(offset)] |= GPIO_BIT(offset);
+	return 0;
+}
+
+static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	sgpio_dir_val[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
+	return 0;
+}
+
+static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return sgpio_dir_val[GPIO_BANK(offset)] & GPIO_BIT(offset);
+
+}
+
+static inline int irqd_to_aspeed_sgpio_data(struct irq_data *d,
+					    struct aspeed_sgpio **gpio,
+					    const struct aspeed_sgpio_bank **bank,
+					    u32 *bit, int *offset)
+{
+	struct aspeed_sgpio *internal;
+
+	*offset = irqd_to_hwirq(d);
+
+	internal = irq_data_get_irq_chip_data(d);
+
+	*gpio = internal;
+	*bank = to_bank(*offset);
+	*bit = GPIO_BIT(*offset);
+
+	return 0;
+}
+
+static void aspeed_sgpio_irq_ack(struct irq_data *d)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *status_addr;
+	int rc, offset;
+	u32 bit;
+
+	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return;
+
+	status_addr = bank_reg(gpio, bank, reg_irq_status);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	iowrite32(bit, status_addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	unsigned long flags;
+	u32 reg, bit;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return;
+
+	addr = bank_reg(gpio, bank, reg_irq_enable);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	reg = ioread32(addr);
+	if (set)
+		reg |= bit;
+	else
+		reg &= ~bit;
+
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_sgpio_irq_mask(struct irq_data *d)
+{
+	aspeed_sgpio_irq_set_mask(d, false);
+}
+
+static void aspeed_sgpio_irq_unmask(struct irq_data *d)
+{
+	aspeed_sgpio_irq_set_mask(d, true);
+}
+
+static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
+{
+	u32 type0 = 0;
+	u32 type1 = 0;
+	u32 type2 = 0;
+	u32 bit, reg;
+	const struct aspeed_sgpio_bank *bank;
+	irq_flow_handler_t handler;
+	struct aspeed_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	if (rc)
+		return -EINVAL;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		type2 |= bit;
+		/* fall through */
+	case IRQ_TYPE_EDGE_RISING:
+		type0 |= bit;
+		/* fall through */
+	case IRQ_TYPE_EDGE_FALLING:
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type0 |= bit;
+		/* fall through */
+	case IRQ_TYPE_LEVEL_LOW:
+		type1 |= bit;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	addr = bank_reg(gpio, bank, reg_irq_type0);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type0;
+	iowrite32(reg, addr);
+
+	addr = bank_reg(gpio, bank, reg_irq_type1);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type1;
+	iowrite32(reg, addr);
+
+	addr = bank_reg(gpio, bank, reg_irq_type2);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type2;
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	irq_set_handler_locked(d, handler);
+
+	return 0;
+}
+
+static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct aspeed_sgpio *data = gpiochip_get_data(gc);
+	unsigned int i, p, girq;
+	unsigned long reg;
+
+	chained_irq_enter(ic, desc);
+
+	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+		const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
+
+		reg = ioread32(bank_reg(data, bank, reg_irq_status));
+
+		for_each_set_bit(p, &reg, 32) {
+			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
+			generic_handle_irq(girq);
+		}
+
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static struct irq_chip aspeed_sgpio_irqchip = {
+	.name       = "aspeed-sgpio",
+	.irq_ack    = aspeed_sgpio_irq_ack,
+	.irq_mask   = aspeed_sgpio_irq_mask,
+	.irq_unmask = aspeed_sgpio_irq_unmask,
+	.irq_set_type   = aspeed_sgpio_set_type,
+};
+
+static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
+				   struct platform_device *pdev)
+{
+	int rc, i;
+	const struct aspeed_sgpio_bank *bank;
+
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
+
+	gpio->irq = rc;
+
+	/* Disable IRQ and clear Interrupt status registers for all SPGIO Pins. */
+	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+		bank =  &aspeed_sgpio_banks[i];
+		/* disable irq enable bits */
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));
+		/* clear status bits */
+		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
+	}
+
+	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
+				  0, handle_bad_irq, IRQ_TYPE_NONE);
+	if (rc) {
+		dev_info(&pdev->dev, "Could not add irqchip\n");
+		return rc;
+	}
+
+	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
+				     gpio->irq, aspeed_sgpio_irq_handler);
+
+	/* set IRQ settings and Enable Interrupt */
+	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+		bank = &aspeed_sgpio_banks[i];
+		/* set falling or level-low irq */
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
+		/* trigger type is edge */
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
+		/* dual edge trigger mode. */
+		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
+		/* enable irq */
+		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
+	}
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_sgpio_of_table[] = {
+	{ .compatible = "aspeed,ast2400-sgpio" },
+	{ .compatible = "aspeed,ast2500-sgpio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
+
+static int __init aspeed_sgpio_probe(struct platform_device *pdev)
+{
+	struct aspeed_sgpio *gpio;
+	struct resource *res;
+	u32 nr_gpios, sgpio_freq;
+	int rc;
+	u16 sgpio_clk_div;
+	unsigned long apb_freq;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
+
+	rc = of_property_read_u32(pdev->dev.of_node, "nr-gpios", &nr_gpios);
+	if ((rc < 0) || (nr_gpios > MAX_NR_SGPIO))
+		nr_gpios = MAX_NR_SGPIO;
+
+	rc = of_property_read_u32(pdev->dev.of_node, "bus-frequency", &sgpio_freq);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
+		sgpio_freq = 12000000;
+	}
+
+	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(gpio->pclk)) {
+		dev_err(&pdev->dev, "devm_clk_get failed\n");
+		return PTR_ERR(gpio->pclk);
+	}
+
+	apb_freq = clk_get_rate(gpio->pclk);
+	sgpio_clk_div = 2 * ((apb_freq % sgpio_freq == 0) ?
+			     (apb_freq / sgpio_freq) - 1 : (apb_freq / sgpio_freq));
+	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) |
+		  FIELD_PREP(ASPEED_SGPIO_PINS_MASK, (nr_gpios / 8)) |
+		  ASPEED_SGPIO_ENABLE,
+		  gpio->base + ASPEED_SGPIO_CTRL);
+
+	spin_lock_init(&gpio->lock);
+
+	gpio->chip.parent = &pdev->dev;
+	gpio->chip.ngpio = nr_gpios;
+	gpio->chip.direction_input = aspeed_sgpio_dir_in;
+	gpio->chip.direction_output = aspeed_sgpio_dir_out;
+	gpio->chip.get_direction = aspeed_sgpio_get_direction;
+	gpio->chip.request = NULL;
+	gpio->chip.free = NULL;
+	gpio->chip.get = aspeed_sgpio_get;
+	gpio->chip.set = aspeed_sgpio_set;
+	gpio->chip.set_config = NULL;
+	gpio->chip.label = dev_name(&pdev->dev);
+	gpio->chip.base =  ARCH_NR_GPIOS - MAX_NR_SGPIO;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	return aspeed_sgpio_setup_irqs(gpio, pdev);
+}
+
+static struct platform_driver aspeed_sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_sgpio_of_table,
+	},
+};
+
+module_platform_driver_probe(aspeed_sgpio_driver, aspeed_sgpio_probe);
+MODULE_DESCRIPTION("Aspeed Serial GPIO Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

>

thanks Anrew, please review v3 at above and also inline comments at below.

>
> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Wednesday, July 10, 2019 9:46 PM
> To:	Hongwei Zhang; Bartosz Golaszewski; Joel Stanley; Linus Walleij
> Cc:	linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; 
> linux-kernel@vger.kernel.org
> Subject:	Re: [PATCH 2/3 v2] ARM: dts: aspeed: Add SGPIO driver
> 
> 
> 
> On Thu, 11 Jul 2019, at 00:56, Hongwei Zhang wrote:
> > Add SGPIO driver support for Aspeed AST2500 SoC.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  drivers/gpio/sgpio-aspeed.c | 450 
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 450 insertions(+)
> >  create mode 100644 drivers/gpio/sgpio-aspeed.c
> > 
> > diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c 
> > new file mode 100644 index 0000000..0743d22
> > --- /dev/null
> > +++ b/drivers/gpio/sgpio-aspeed.c
> > @@ -0,0 +1,450 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019 American Megatrends International LLC.
> > + *
> > + * Author: Karthikeyan Mani <karthikeyanm@amiindia.co.in>  */
> > +
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/aspeed.h>
> > +#include <linux/hashtable.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/string.h>
> > +
> > +#define NR_SGPIO        80
> > +
> > +struct aspeed_sgpio {
> > +	struct gpio_chip chip;
> > +	spinlock_t lock;
> > +	void __iomem *base;
> > +	int irq;
> > +};
> > +
> > +struct aspeed_sgpio_bank {
> > +	uint16_t    val_regs;
> > +	uint16_t    rdata_reg;
> > +	uint16_t    irq_regs;
> > +	const char  names[4][3];
> > +};
> > +
> > +/*
> > + * Note: The "value" register returns the input value sampled on the
> > + *       line even when the GPIO is configured as an output. Since
> > + *       that input goes through synchronizers, writing, then reading
> > + *       back may not return the written value right away.
> > + *
> > + *       The "rdata" register returns the content of the write latch
> > + *       and thus can be used to read back what was last written
> > + *       reliably.
> > + */
> > +
> > +static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
> > +	{
> > +		.val_regs = 0x0000,
> > +		.rdata_reg = 0x0070,
> > +		.irq_regs = 0x0004,
> > +		.names = { "A", "B", "C", "D" },
> > +	},
> > +	{
> > +		.val_regs = 0x001C,
> > +		.rdata_reg = 0x0074,
> > +		.irq_regs = 0x0020,
> > +		.names = { "E", "F", "G", "H" },
> > +	},
> > +	{
> > +		.val_regs = 0x0038,
> > +		.rdata_reg = 0x0078,
> > +		.irq_regs = 0x003C,
> > +		.names = { "I", "J" },
> > +	},
> > +};
> > +
> > +enum aspeed_sgpio_reg {
> > +	reg_val,
> > +	reg_rdata,
> > +	reg_irq_enable,
> > +	reg_irq_type0,
> > +	reg_irq_type1,
> > +	reg_irq_type2,
> > +	reg_irq_status,
> > +};
> > +
> > +#define GPIO_VAL_VALUE      0x00
> > +#define GPIO_VAL_DIR        0x04
> > +#define GPIO_IRQ_ENABLE     0x00
> > +#define GPIO_IRQ_TYPE0      0x04
> > +#define GPIO_IRQ_TYPE1      0x08
> > +#define GPIO_IRQ_TYPE2      0x0C
> > +#define GPIO_IRQ_STATUS     0x10
> > +
> > +/* This will be resolved at compile time */ static inline void 
> > +__iomem *bank_reg(struct aspeed_sgpio *gpio,
> > +				     const struct aspeed_sgpio_bank *bank,
> > +				     const enum aspeed_sgpio_reg reg) {
> > +	switch (reg) {
> > +	case reg_val:
> > +		return gpio->base + bank->val_regs + GPIO_VAL_VALUE;
> > +	case reg_rdata:
> > +		return gpio->base + bank->rdata_reg;
> > +	case reg_irq_enable:
> > +		return gpio->base + bank->irq_regs + GPIO_IRQ_ENABLE;
> > +	case reg_irq_type0:
> > +		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE0;
> > +	case reg_irq_type1:
> > +		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE1;
> > +	case reg_irq_type2:
> > +		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
> > +	case reg_irq_status:
> > +		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
> > +	default:
> > +		/* acturally if code runs to here, it's an error case */
> > +		WARN_ON(reg);
> > +		return gpio->base;
> > +	}
> > +}
> > +

updated to use BUG_ON(1), please see v3.

> > +#define GPIO_BANK(x)    ((x) >> 5)
> > +#define GPIO_OFFSET(x)  ((x) & 0x1f)
> > +#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
> > +
> > +static const struct aspeed_sgpio_bank *to_bank(unsigned int offset) {
> > +	unsigned int bank = GPIO_BANK(offset);
> > +
> > +	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
> > +	return &aspeed_sgpio_banks[bank];
> > +}
> > +
> > +static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int 
> > +offset) {
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +
> > +	return !!(ioread32(bank_reg(gpio, bank, reg_val)) & 
> > +GPIO_BIT(offset)); }
> > +
> > +static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int
> > offset, int val)
> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +	unsigned long flags;
> > +	void __iomem *addr;
> > +	u32 reg = 0;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	addr = bank_reg(gpio, bank, reg_val);
> > +
> > +	if (val)
> > +		reg |= GPIO_BIT(offset);
> > +	else
> > +		reg &= ~GPIO_BIT(offset);
> > +
> > +	iowrite32(reg, addr);
> > +	spin_unlock_irqrestore(&gpio->lock, flags); }
> > +
> > +static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int
> > offset)
> > +{
> > +	/* By default all SGPIO Pins are input */
> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int
> > offset, int val)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned
> > int offset)
> > +{
> > +	/* By default all SGPIO Pins are input */
> > +	return 1;
> > +
> > +}
> 
> Please see my follow-up reply on v1 that helps clarify what we should do with the 
> dir_in()/dir_out()/get_direction() implementations. The implementation here will confuse everything in 
> the stack above it.
> 

updated, please see v3.

> > +
> > +static inline int irqd_to_aspeed_sgpio_data(struct irq_data *d,
> > +					    struct aspeed_sgpio **gpio,
> > +					    const struct aspeed_sgpio_bank **bank,
> > +					    u32 *bit, int *offset)
> > +{
> > +	struct aspeed_sgpio *internal;
> > +
> > +	*offset = irqd_to_hwirq(d);
> > +
> > +	internal = irq_data_get_irq_chip_data(d);
> > +
> > +	*gpio = internal;
> > +	*bank = to_bank(*offset);
> > +	*bit = GPIO_BIT(*offset);
> > +
> > +	return 0;
> > +}
> > +
> > +static void aspeed_sgpio_irq_ack(struct irq_data *d) {
> > +	const struct aspeed_sgpio_bank *bank;
> > +	struct aspeed_sgpio *gpio;
> > +	unsigned long flags;
> > +	void __iomem *status_addr;
> > +	int rc, offset;
> > +	u32 bit;
> > +
> > +	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> > +	if (rc)
> > +		return;
> > +
> > +	status_addr = bank_reg(gpio, bank, reg_irq_status);
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	iowrite32(bit, status_addr);
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags); }
> > +
> > +static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set) {
> > +	const struct aspeed_sgpio_bank *bank;
> > +	struct aspeed_sgpio *gpio;
> > +	unsigned long flags;
> > +	u32 reg, bit;
> > +	void __iomem *addr;
> > +	int rc, offset;
> > +
> > +	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> > +	if (rc)
> > +		return;
> > +
> > +	addr = bank_reg(gpio, bank, reg_irq_enable);
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	reg = ioread32(addr);
> > +	if (set)
> > +		reg |= bit;
> > +	else
> > +		reg &= ~bit;
> > +
> > +	iowrite32(reg, addr);
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags); }
> > +
> > +static void aspeed_sgpio_irq_mask(struct irq_data *d) {
> > +	aspeed_sgpio_irq_set_mask(d, false); }
> > +
> > +static void aspeed_sgpio_irq_unmask(struct irq_data *d) {
> > +	aspeed_sgpio_irq_set_mask(d, true);
> > +}
> > +
> > +static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int 
> > +type) {
> > +	u32 type0 = 0;
> > +	u32 type1 = 0;
> > +	u32 type2 = 0;
> > +	u32 bit, reg;
> > +	const struct aspeed_sgpio_bank *bank;
> > +	irq_flow_handler_t handler;
> > +	struct aspeed_sgpio *gpio;
> > +	unsigned long flags;
> > +	void __iomem *addr;
> > +	int rc, offset;
> > +
> > +	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> > +	if (rc)
> > +		return -EINVAL;
> > +
> > +	switch (type & IRQ_TYPE_SENSE_MASK) {
> > +	case IRQ_TYPE_EDGE_BOTH:
> > +		type2 |= bit;
> > +		/* fall through */
> > +	case IRQ_TYPE_EDGE_RISING:
> > +		type0 |= bit;
> > +		/* fall through */
> > +	case IRQ_TYPE_EDGE_FALLING:
> > +		handler = handle_edge_irq;
> > +		break;
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		type0 |= bit;
> > +		/* fall through */
> > +	case IRQ_TYPE_LEVEL_LOW:
> > +		type1 |= bit;
> > +		handler = handle_level_irq;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	addr = bank_reg(gpio, bank, reg_irq_type0);
> > +	reg = ioread32(addr);
> > +	reg = (reg & ~bit) | type0;
> > +	iowrite32(reg, addr);
> > +
> > +	addr = bank_reg(gpio, bank, reg_irq_type1);
> > +	reg = ioread32(addr);
> > +	reg = (reg & ~bit) | type1;
> > +	iowrite32(reg, addr);
> > +
> > +	addr = bank_reg(gpio, bank, reg_irq_type2);
> > +	reg = ioread32(addr);
> > +	reg = (reg & ~bit) | type2;
> > +	iowrite32(reg, addr);
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +	irq_set_handler_locked(d, handler);
> > +
> > +	return 0;
> > +}
> > +
> > +static void aspeed_sgpio_irq_handler(struct irq_desc *desc) {
> > +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> > +	struct irq_chip *ic = irq_desc_get_chip(desc);
> > +	struct aspeed_sgpio *data = gpiochip_get_data(gc);
> > +	unsigned int i, p, girq;
> > +	unsigned long reg;
> > +
> > +	chained_irq_enter(ic, desc);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> > +		const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
> > +
> > +		reg = ioread32(bank_reg(data, bank, reg_irq_status));
> > +
> > +		for_each_set_bit(p, &reg, 32) {
> > +			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
> > +			generic_handle_irq(girq);
> > +		}
> > +
> > +	}
> > +
> > +	chained_irq_exit(ic, desc);
> > +}
> > +
> > +static struct irq_chip aspeed_sgpio_irqchip = {
> > +	.name       = "aspeed-sgpio",
> > +	.irq_ack    = aspeed_sgpio_irq_ack,
> > +	.irq_mask   = aspeed_sgpio_irq_mask,
> > +	.irq_unmask = aspeed_sgpio_irq_unmask,
> > +	.irq_set_type   = aspeed_sgpio_set_type,
> > +};
> > +
> > +static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
> > +				   struct platform_device *pdev)
> > +{
> > +	int rc, i;
> > +	const struct aspeed_sgpio_bank *bank;
> > +
> > +	rc = platform_get_irq(pdev, 0);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	gpio->irq = rc;
> > +
> > +	/* Disable IRQ and clear Interrupt status registers for all SPGIO
> > Pins. */
> > +	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> > +		bank =  &aspeed_sgpio_banks[i];
> > +		/* disable irq enable bits */
> > +		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));
> > +		/* clear status bits */
> > +		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
> > +	}
> > +
> > +	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
> > +				  0, handle_bad_irq, IRQ_TYPE_NONE);
> > +	if (rc) {
> > +		dev_info(&pdev->dev, "Could not add irqchip\n");
> > +		return rc;
> > +	}
> > +
> > +	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
> > +				     gpio->irq, aspeed_sgpio_irq_handler);
> > +
> > +	/* set IRQ settings and Enable Interrupt */
> > +	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> > +		bank = &aspeed_sgpio_banks[i];
> > +		/* set falling or level-low irq */
> > +		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
> > +		/* trigger type is edge */
> > +		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
> > +		/* dual edge trigger mode. */
> > +		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
> > +		/* enable irq */
> > +		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_request(struct gpio_chip *chip, unsigned int
> > offset)
> > +{
> > +	return (offset < NR_SGPIO);
> > +}
> 
> I don't think this request() implementation is helpful, especially as it stands in the face of needing to pull 
> the number of GPIOs to serialise from the devicetree.
> 
> request() is an optional callback, lets just drop it.
> 

updated, please see v3.

> > +
> > +static const struct of_device_id aspeed_sgpio_of_table[] = {
> > +	{ .compatible = "aspeed,ast2400-sgpio" },
> > +	{ .compatible = "aspeed,ast2500-sgpio" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
> > +
> > +static int __init aspeed_sgpio_probe(struct platform_device *pdev) {
> > +	struct aspeed_sgpio *gpio;
> > +	struct resource *res;
> > +	int rc;
> > +
> > +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> > +	if (!gpio)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	gpio->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(gpio->base))
> > +		return PTR_ERR(gpio->base);
> > +
> > +	spin_lock_init(&gpio->lock);
> > +
> > +	gpio->chip.parent = &pdev->dev;
> > +	gpio->chip.ngpio = NR_SGPIO;
> > +	gpio->chip.direction_input = aspeed_sgpio_dir_in;
> > +	gpio->chip.direction_output = aspeed_sgpio_dir_out;
> > +	gpio->chip.get_direction = aspeed_sgpio_get_direction;
> > +	gpio->chip.request = aspeed_sgpio_request;
> > +	gpio->chip.free = NULL;
> > +	gpio->chip.get = aspeed_sgpio_get;
> > +	gpio->chip.set = aspeed_sgpio_set;
> > +	gpio->chip.set_config = NULL;
> > +	gpio->chip.label = dev_name(&pdev->dev);
> > +	gpio->chip.base = -1;
> > +
> > +	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	return aspeed_sgpio_setup_irqs(gpio, pdev); }
> > +
> > +static struct platform_driver aspeed_sgpio_driver = {
> > +	.driver = {
> > +		.name = KBUILD_MODNAME,
> > +		.of_match_table = aspeed_sgpio_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver_probe(aspeed_sgpio_driver, 
> > +aspeed_sgpio_probe); MODULE_DESCRIPTION("Aspeed Serial GPIO Driver"); 
> > +MODULE_LICENSE("GPL");
> > --
> > 2.7.4
> > 
> >

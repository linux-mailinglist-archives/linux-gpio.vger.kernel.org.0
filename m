Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFA06EBC3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2019 22:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbfGSUwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jul 2019 16:52:04 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:61105 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbfGSUwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jul 2019 16:52:04 -0400
X-AuditID: ac10606f-d11ff70000003324-b4-5d322d73c7e8
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 94.8D.13092.37D223D5; Fri, 19 Jul 2019 16:52:03 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Jul 2019 16:52:02 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     <hongweiz@ami.com>, Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Joel Stanley <joel@jms.id.au>, <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: gpio: aspeed: Add SGPIO driver
Date:   Fri, 19 Jul 2019 16:51:45 -0400
Message-ID: <1563569505-10646-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsWyRiBhgm6xrlGswbHJSha7LnNYfJl7isXi
        9/m/zBZT/ixnstj0+BqrRfPqc8wWm+f/YbS4vGsOmwOHx9X2Xewe72+0sntc/HiM2ePOtT1s
        HpuX1Hucn7GQ0ePzJrkA9igum5TUnMyy1CJ9uwSujPlr1jIWzJnLWPHkSxNzA2NXVRcjJ4eE
        gInE6e4HjF2MXBxCAruYJN6+mAvlHGaU2Hf8EDtIFZuAmsTezXOYQBIiAk2MEm+bPoM5zAL7
        GSX62htZQaqEBdQlfl46zwZiswioSrxvXc8EYvMKOEgcOPOHBWKfnMTNc53MEHFBiZMzn4DF
        mQUkJA6+eAEWFxKQlbh16DETRL2CxPO+xywTGPlmIWmZhaRlASPTKkahxJKc3MTMnPRyI73E
        3Ey95PzcTYyQwM3fwfjxo/khRiYOxkOMEhzMSiK8t1/qxwrxpiRWVqUW5ccXleakFh9ilOZg
        URLnXbXmW4yQQHpiSWp2ampBahFMlomDU6qBUX3q3H3iEa6c16J4nGyis7c9efK2s4Tzx82w
        H7M/v9pQtbve3PXTq/KX22duVbMt2ZxvedpputvBI6GVfXnqq54KSBV6aB44+n/S3zfLt4lE
        fGNm9zs1VSbw/s/Avr3zeUw1ZhUu897H7z+bN1x+hdeTGquyIxG1yT08CuyuhuU3l+kwVext
        UmIpzkg01GIuKk4EAD97Ba9KAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hello Andrew,

Thanks for reviewing and suggestions.

please see my inline comments. I just submitted v5 with a proper series title, 
please help review them.

In AST2500 datasheet, it says:
"Support up to 80 SGPIO input ports and 80 output ports concurrently only at
 the cost of 4 control pins".
Would you please give us some hints on how to configure the SGPIO pins so that 
we can use them as input and output 'concurrently' ?

Thanks,
--Hongwei
 
> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Wednesday, July 17, 2019 9:45 PM
> To:	Hongwei Zhang; Bartosz Golaszewski; Joel Stanley; Linus Walleij
> Cc:	linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; 
> linux-kernel@vger.kernel.org
> Subject:	Re: [PATCH 2/3 v4] ARM: dts: aspeed: Add SGPIO driver
> 
> Hello Hongwei,
> 
> The driver is shaping up! I have a few remaining nitpicks below:
> 
> The first is the patch subject:
> 
> [PATCH 2/3 v4] ARM: dts: aspeed: Add SGPIO driver
> 
> I think one of the first iterations of the patch included the devicetree changes. It doesn't any more, as 
> the devicetree updates should be done in a separate patch, however the subject is now inaccurate. 
> Disregarding the [PATCH ...] prefix, it should be:
> 
> gpio: aspeed: Add SPGIO driver
> 
> As for the [PATCH ...] prefix business, both your bindings patch and your driver patch are listed as patch 
> 2/3, and there's no third patch in the series. `git format-patch` takes care of all this for you - I encourage 
> you to get `git send-email` working so you can use it to send the patches produced from `git format-
> patch` (as they won't have these problems). Further, if you're sending multiple patches it's useful to 
> include a cover letter as the patches will be properly threaded underneath it, which helps keep related 
> patches together and provides a place to talk about your patches that isn't the commit message.
> 

the v5 is submitted with properly combined patches.

> On Thu, 18 Jul 2019, at 07:00, Hongwei Zhang wrote:
> > Add SGPIO driver support for Aspeed AST2500 SoC.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  drivers/gpio/sgpio-aspeed.c | 518 
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 518 insertions(+)
> >  create mode 100644 drivers/gpio/sgpio-aspeed.c
> > 
> > diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c 
> > new file mode 100644 index 0000000..715052c
> > --- /dev/null
> > +++ b/drivers/gpio/sgpio-aspeed.c
> > @@ -0,0 +1,518 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019 American Megatrends International LLC.
> > + *
> > + * Author: Karthikeyan Mani <karthikeyanm@amiindia.co.in>  */
> > +
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/aspeed.h>
> > +#include <linux/hashtable.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/init.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/string.h>
> > +#include <linux/gpio.h>
> 
> It would be nice if these were sorted alphabetically. Not overly fussed though.
> 

done.

> > +
> > +#define MAX_NR_SGPIO			80
> > +
> > +#define ASPEED_SGPIO_CTRL		0x54
> > +
> > +#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
> > +#define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
> > +#define ASPEED_SGPIO_ENABLE		BIT(0)
> > +
> > +struct aspeed_sgpio {
> > +	struct gpio_chip chip;
> > +	struct clk *pclk;
> > +	spinlock_t lock;
> > +	void __iomem *base;
> > +	uint32_t dir_in[3];
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
> > + * Note: The "value" register returns the input value when the GPIO is
> > + *	 configured as an input.
> > + *
> > + *	 The "rdata" register returns the output value when the GPIO is
> > + *	 configured as an output.
> > + */
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
> > +		BUG_ON(1);
> > +	}
> > +}
> > +
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
> > +	unsigned long flags;
> > +	enum aspeed_sgpio_reg reg;
> > +	bool is_input;
> > +	int rc = 0;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	is_input = gpio->dir_in[GPIO_BANK(offset)] & GPIO_BIT(offset);
> > +	reg = is_input ? reg_val : reg_rdata;
> > +	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +	return rc;
> > +}
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
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags); }
> > +
> > +static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int
> > offset)
> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +	gpio->dir_in[GPIO_BANK(offset)] |= GPIO_BIT(offset);
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int
> > offset, int val)
> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +	gpio->dir_in[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned
> > int offset)
> > +{
> > +	int dir_status;
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +	dir_status = gpio->dir_in[GPIO_BANK(offset)] & GPIO_BIT(offset);
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +	return dir_status;
> > +
> > +}
> > +
> > +static inline void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> > +					     struct aspeed_sgpio **gpio,
> > +					     const struct aspeed_sgpio_bank **bank,
> > +					     u32 *bit, int *offset)
> > +{
> > +	struct aspeed_sgpio *internal;
> > +
> > +	*offset = irqd_to_hwirq(d);
> > +	internal = irq_data_get_irq_chip_data(d);
> > +	WARN_ON(!internal);
> > +
> > +	*gpio = internal;
> > +	*bank = to_bank(*offset);
> > +	*bit = GPIO_BIT(*offset);
> > +}
> > +
> > +static void aspeed_sgpio_irq_ack(struct irq_data *d) {
> > +	const struct aspeed_sgpio_bank *bank;
> > +	struct aspeed_sgpio *gpio;
> > +	unsigned long flags;
> > +	void __iomem *status_addr;
> > +	int offset;
> > +	u32 bit;
> > +
> > +	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
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
> > +	int offset;
> > +
> > +	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
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
> > +	int offset;
> > +
> > +	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
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
> > +static const struct of_device_id aspeed_sgpio_of_table[] = {
> > +	{ .compatible = "aspeed,ast2400-sgpio" },
> > +	{ .compatible = "aspeed,ast2500-sgpio" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
> > +
> > +static int __init aspeed_sgpio_probe(struct platform_device *pdev) {
> > +	struct aspeed_sgpio *gpio;
> > +	u32 nr_gpios, sgpio_freq, sgpio_clk_div;
> > +	int rc;
> > +	unsigned long apb_freq;
> > +
> > +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> > +	if (!gpio)
> > +		return -ENOMEM;
> > +
> > +	gpio->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(gpio->base))
> > +		return PTR_ERR(gpio->base);
> > +
> > +	rc = of_property_read_u32(pdev->dev.of_node, "nr-gpios", &nr_gpios);
> 
> I just checked and the standard property is "ngpios", not "nr-gpios"[1]. Please fix this and the bindings 
> document.
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindi
> ngs/gpio/gpio.txt?h=v5.2#n141
> 

changed to ngpios

> > +	if ((rc < 0) || (nr_gpios > MAX_NR_SGPIO)) {
> > +		dev_err(&pdev->dev, "Could not read nr-gpios property\n");
> 
> Triggering this error message with the `nr_gpios > MAX_NR_SGPIO` condition is a bit confusing. I think 
> you should check that in a separate conditional block if you would like to issue a dev_err():
> 
> if (rc < 0) {
>         dev_err(&pdev->dev, "Could not read nr-gpios property\n");
>         return -EINVAL;
> } else if (nr_gpios > MAX_NR_GPIOS) {
>         dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: %d\n",
>                          MAX_NR_SGPIO, nr_gpios);
>         return -EINVAL;
> }
> 

done, it's nicer with your suggestion.

> > +		return -EINVAL;
> > +	}
> > +
> > +	rc = of_property_read_u32(pdev->dev.of_node, "bus-frequency",
> > &sgpio_freq);
> > +	if (rc < 0) {
> > +		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(gpio->pclk)) {
> > +		dev_err(&pdev->dev, "devm_clk_get failed\n");
> > +		return PTR_ERR(gpio->pclk);
> > +	}
> > +
> > +	apb_freq = clk_get_rate(gpio->pclk);
> > +
> > +	/*
> > +	 * From the datasheet,
> > +	 *	SGPIO period = 1/PCLK * 2 * (GPIO254[31:16] + 1)
> > +	 *	period = 2 * (GPIO254[31:16] + 1) / PCLK
> > +	 *	frequency = 1 / (2 * (GPIO254[31:16] + 1) / PCLK)
> > +	 *	frequency = PCLK / (2 * (GPIO254[31:16] + 1))
> > +	 *	frequency * 2 * (GPIO254[31:16] + 1) = PCLK
> > +	 *	GPIO254[31:16] = PCLK / (frequency * 2) - 1
> > +	 */
> > +	if (sgpio_freq == 0)
> > +		return -EINVAL;
> > +
> > +	sgpio_clk_div = (apb_freq / (sgpio_freq * 2)) - 1;
> > +
> > +	if (sgpio_clk_div > (1 << 16) - 1)
> > +		return -EINVAL;
> > +
> > +	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) |
> > +		  FIELD_PREP(ASPEED_SGPIO_PINS_MASK, (nr_gpios / 8)) |
> > +		  ASPEED_SGPIO_ENABLE,
> > +		  gpio->base + ASPEED_SGPIO_CTRL);
> > +
> > +	spin_lock_init(&gpio->lock);
> > +
> > +	gpio->chip.parent = &pdev->dev;
> > +	gpio->chip.ngpio = nr_gpios;
> > +	gpio->chip.direction_input = aspeed_sgpio_dir_in;
> > +	gpio->chip.direction_output = aspeed_sgpio_dir_out;
> > +	gpio->chip.get_direction = aspeed_sgpio_get_direction;
> > +	gpio->chip.request = NULL;
> > +	gpio->chip.free = NULL;
> > +	gpio->chip.get = aspeed_sgpio_get;
> > +	gpio->chip.set = aspeed_sgpio_set;
> > +	gpio->chip.set_config = NULL;
> > +	gpio->chip.label = dev_name(&pdev->dev);
> > +	gpio->chip.base =  ARCH_NR_GPIOS - MAX_NR_SGPIO;
> 
> Please set this to -1 so the base is chosen for you by the gpio subsystem.
> 

done

> > +
> > +	/* set all SGPIO pins as input. */
> > +	memset(gpio->dir_in, 0xff, sizeof(gpio->dir_in));
> 
> You've used devm_kzalloc() above, so the memory is already zeroed. You can remove the memset(), 
> maybe just shift the comment to the devm_kzalloc().
> 

here we need to initialize dir_in as its default input state, so memset with 0xff.
I changed comment a little bit to be more specific. also added a comment 
at above devm_kzalloc().

> Other than these small issues, looks good to me. Thanks for iterating on it.
> 
> Andrew
> 
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

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1824E648B0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 16:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbfGJOyd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 10 Jul 2019 10:54:33 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:51527 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfGJOyd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 10:54:33 -0400
X-AuditID: ac10606f-bbfff70000003de9-bb-5d25fc271c4c
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 62.38.15849.82CF52D5; Wed, 10 Jul 2019 10:54:32 -0400 (EDT)
Received: from ATLMS2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb]) by
 atlms1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605%12]) with mapi id
 14.03.0415.000; Wed, 10 Jul 2019 10:54:31 -0400
From:   Hongwei Zhang <Hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>
Subject: RE: [PATCH 2/3 v1] ARM: dts: aspeed: Add SGPIO driver
Thread-Topic: [PATCH 2/3 v1] ARM: dts: aspeed: Add SGPIO driver
Thread-Index: AdU3L18QRwrQLptrQ+KtIqfSSx1hWg==
Date:   Wed, 10 Jul 2019 14:54:31 +0000
Message-ID: <14D3C8298A3B0F42A1EB31EE961CFF82AA8F4335@atlms2.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42JZI5AwQVfjj2qswYuX/Ba7LnNYfJl7isXi
        9/m/zBZT/ixnstj0+BqrRfPqc8wWm+f/YbS4vGsOmwOHx9X2Xewe72+0sntc/HiM2ePOtT1s
        HpuX1Hucn7GQ0ePzJrkA9igum5TUnMyy1CJ9uwSujE3Tp7EXfJzOWHGn5T1jA+OV0i5GTg4J
        AROJQ/s7mLsYuTiEBHYxSVz8dIkdwjnMKNE3cyETSBWbgJrE0z8NYAkRgUWMEkcW3mcHSTAL
        bGOS+HPdFsQWFrCT+HH1LSuILSJgL3Gpew0LhK0ncbtvAlg9i4CqxJ/1d5lBbF4Bf4nZzVPA
        FjAKiEl8P7WGCWKmuMStJ/OZIM4TkFiy5zwzhC0q8fLxP1YIW0miYcU/qHodiQW7P7FB2NoS
        yxa+hpovKHFy5hOWCYzCs5CMnYWkZRaSlllIWhYwsqxiFEosyclNzMxJLzfSS8zN1EvOz93E
        CImv/B2MHz+aH2Jk4mA8xCjBwawkwrvPXTlWiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+qNd9i
        hATSE0tSs1NTC1KLYLJMHJxSDYzT5gfYT9go7hv8s3WRiVvJrLWLz6xIPGB6LsPzdcSRzUyv
        eF2/L3uiHeLsNl1f9XVP4m3Jc/W+X9+9uHMkeqqKNKee9O51Ms9Wsa7UcPLZf5DfIvPIu1pB
        15DXSVdmTj2XM702uuf738ct0Z5c5v+fJO+a9cVt0c3PT4Vrj3hp7915bbLyLtt2JZbijERD
        Leai4kQAky75450CAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andrew,

Thanks for your review and comments, please find our inline response at below.
I will email updated driver code separately, because Outlook breaks source code's tabs.

There is one place need your more input for clarification, which is about DATA_READ/DATA_VALUE registers, 
please see it at below.

Best Regards,
-- Hongwei

> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Wednesday, July 3, 2019 8:06 PM
> To:	Hongwei Zhang; Bartosz Golaszewski; Joel Stanley; Linus Walleij
> Cc:	linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; 
> linux-kernel@vger.kernel.org
> Subject:	Re: [PATCH 2/3 linux,dev-5.1 v1] ARM: dts: aspeed: Add SGPIO driver
> 
> Hello Hongwei,
> 
> As this is patch is sent to the upstream lists (linux-gpio@ etc) please drop the OpenBMC-specific 
> "linux,dev-5.1" from the subject.
> 

Got it but to be more specific, for the situation of mixed recipients, should I send out separate emails with 
different subject line format in the future?

> Also, it looks like you may have manually added the series revision (v1).
> For the record you can make `git format-patch` do this for you with the `-v`option (e.g. if you really want 
> it here, `-v 1`).
> 
> On Thu, 4 Jul 2019, at 07:09, Hongwei Zhang wrote:
> > Add SGPIO driver support for Aspeed AST2500 SoC.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  drivers/gpio/sgpio-aspeed.c | 470 
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 470 insertions(+)
> >  create mode 100644 drivers/gpio/sgpio-aspeed.c
> > 
> > diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c 
> > new file mode 100644 index 0000000..108ed13
> > --- /dev/null
> > +++ b/drivers/gpio/sgpio-aspeed.c
> > @@ -0,0 +1,470 @@
> > +/*
> > + * Copyright 2019 American Megatrends International LLC. 
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> 
> You should use the SPDX license identifier here rather than the GPL blurb, and it should be the first line 
> of the file. Keep your copyright line in place though:
> 
OK

> // SPDX-License-Identifier: GPL-2.0-or-later // Copyright 2019 American Megatrends International LLC.
> 
> > + */
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
> > +	}
> > +	BUG_ON(1);
> 
> This isn't appropriate - we shouldn't take down the kernel on a faulty peripheral access. Please change 
> this to WARN().
> 
              -  Cannot change it to WARN(), it throws build error, warning: control reaches end of non-void 
                 function [-Wreturn-type], so I add WARN_ON() in the switch's 'default: ' case statement, and
                 followed with a return(gpio->base) to mute the [-Wreturn-type] compiling warning.

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
> > +static inline bool have_gpio(struct aspeed_sgpio *gpio, unsigned int
> > offset)
> > +{
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +	unsigned int group = GPIO_OFFSET(offset) / 8;
> > +
> > +	return bank->names[group][0] != '\0';
> 
> Lets just drop have_gpio() altogether, it's a contiguous set of 80 GPIOs.
> At best this should just be:
> 
> static inline bool have_gpio(struct aspeed_sgpio *gpio, unsigned int offset) {
>     return offset < NR_SGPIO;
> }
> 
> But lets just assume that we've properly configured the gpio subsystem for the controller and remove it 
> completely.
> 

Karthik - [Addressed] Removed have_gpio()

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
> > +static void __aspeed_sgpio_set(struct gpio_chip *gc, unsigned int
> > offset,
> > +			       int val)
> 
> No need to split this out from aspeed_sgpio_set() below. Separating the implementation was necessary 
> in the parallel GPIO driver for reasons that aren't relevant here.
> 

Karthik - [Addressed] Merged into single API itself.

> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +	void __iomem *addr;
> > +	u32 reg;
> > +
> > +	addr = bank_reg(gpio, bank, reg_val);
> > +
> > +	if (val)
> > +		reg |= GPIO_BIT(offset);
> > +	else
> > +		reg &= ~GPIO_BIT(offset);
> > +
> > +	iowrite32(reg, addr);
> > +}
> > +
> > +static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset,
> > +			     int val)
> > +{
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +	__aspeed_sgpio_set(gc, offset, val);
> > +
> > +	spin_unlock_irqrestore(&gpio->lock, flags); }
> > +
> > +static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int
> > offset)
> > +{
> > +	/* By default all SGPIO Pins are input */
> 
> Right, but with your implementation below you can never mark them as output.
> 

Karthik - [Addressed] Just return success if user space try to set dir as input or output.

> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned
> > int offset)
> > +{
> > +	/* By default all SGPIO Pins are input */
> > +	return 1;
> 
> As above. Given my understanding of SGPIO, I think you should be implementing both dir_in() and 
> dir_out(), and capturing which state userspace "wants" the GPIO to be in, and directing reads/writes to 
> the DATA_READ/DATA_VALUE registers as appropriate. There's no state we need to modify in the 
> hardware, but that doesn't mean we shouldn't capture the intent of userspace at all.
> 

Karthik -  Just return success if user space try to set dir as input or output. 
                 But I don't understand the point directing reads/writes to the DATA_READ/DATA_VALUE Registers. 
                 If userspace configured GPIO as input, Then get_gpio() should return reg_rdata value?
                 If userspace configured GPIO as output, Then get_gpio() should return reg_val value?
                 Please clarify.

> > +
> > +}
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
> > +	if (!have_gpio(gpiochip_get_data(chip), offset))
> > +		return -ENODEV;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id aspeed_sgpio_of_table[] = {
> > +	{ .compatible = "aspeed,ast2400-sgpio", .data = NULL, },
> > +	{ .compatible = "aspeed,ast2500-sgpio", .data = NULL,},
> 
> You can drop the assignment to data.
> 

Karthik - [Addressed]  dropped data parameter

> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
> > +
> > +static int __init aspeed_sgpio_probe(struct platform_device *pdev) {
> > +	const struct of_device_id *gpio_id;
> > +	struct aspeed_sgpio *gpio;
> > +	struct resource *res;
> > +	int rc, i;
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
> > +	gpio_id = of_match_node(aspeed_sgpio_of_table, pdev->dev.of_node);
> > +	if (!gpio_id)
> > +		return -EINVAL;
> 
> gpio_id isn't used, so you can drop the of_match_node() above.
> 

Karthik - [Addressed]  dropped gpio_id

> > +
> > +	gpio->chip.parent = &pdev->dev;
> > +	gpio->chip.ngpio = NR_SGPIO;
> > +	gpio->chip.direction_input = aspeed_sgpio_dir_in;
> > +	gpio->chip.direction_output = NULL;
> 
> We can do outputs too - we shouldn't be omitting the direction_output callback, see the discussion 
> above about dir_in()/dir_out()/get_direction()
> 

Karthik - [Addressed]  Added output API also.

> Andrew
> 
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

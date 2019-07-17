Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651A56C29C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 23:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfGQVaD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 17 Jul 2019 17:30:03 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:64078 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfGQVaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 17:30:03 -0400
X-AuditID: ac1060b2-413ff70000003a7d-4d-5d2f93673523
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id 50.26.14973.7639F2D5; Wed, 17 Jul 2019 17:30:15 -0400 (EDT)
Received: from ATLMS2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb]) by
 atlms1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605%12]) with mapi id
 14.03.0415.000; Wed, 17 Jul 2019 17:30:01 -0400
From:   Hongwei Zhang <Hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 2/3 v3] dt-bindings: gpio: aspeed: Add SGPIO support
Thread-Topic: [PATCH 2/3 v3] dt-bindings: gpio: aspeed: Add SGPIO support
Thread-Index: AQHVPCA9xk4+FoHpyUSSpCgW8q92M6bOb/iAgADg2/A=
Date:   Wed, 17 Jul 2019 21:30:00 +0000
Message-ID: <14D3C8298A3B0F42A1EB31EE961CFF82AA8F4B3C@atlms2.us.megatrends.com>
References: <1563313711-17961-1-git-send-email-hongweiz@ami.com>
 <91ebb817-3cc6-4b87-8c2b-cfcd66f4c284@www.fastmail.com>
In-Reply-To: <91ebb817-3cc6-4b87-8c2b-cfcd66f4c284@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsWyRiBhgm76ZP1Yg8WnJCx2Xeaw+DL3FIvF
        /CPnWC1+n//LbDHlz3Imi02Pr7FaNK8+x2yxef4fRovLu+awWSy9fpHJonXvEXYHbo+r7bvY
        PdbMW8Po8f5GK7vHxY/HmD02repk87hzbQ+bx+Yl9R7nZyxk9Pi8SS6AM4rLJiU1J7MstUjf
        LoErY91Ul4JFCxkrZm5/z9TA+LK2i5GTQ0LAROLdh4XMXYxcHEICu5gkuq4sY4dwDjNKLH+2
        hRmkik1ATeLpnwawhIjAOkaJ6V/62UAcZoEJzBJ9S6+wglQJC3hInDg6mQ3EFhHwlNjRdxDK
        tpLo6pnMBGKzCKhKNPd1sYDYvAL+Ep+mtQBN5QBaVyUx8R9YmFPARWLJ11tgixkFxCS+n1oD
        1sosIC5x68l8JoizBSSW7DnPDGGLSrx8/I8VwlaSaFjxD6peR2LB7k9sELa2xLKFr5kh1gpK
        nJz5hGUCo+gsJGNnIWmZhaRlFpKWBYwsqxiFEktychMzc9LLDfUSczP1kvNzNzFC4nfTDsaW
        i+aHGJk4GA8xSnAwK4nw2n7VjhXiTUmsrEotyo8vKs1JLT7EKM3BoiTOu3LNtxghgfTEktTs
        1NSC1CKYLBMHp1QDY2T0masrdfuPLo+KYp37uWhHW6zmCs4Wd0fnFT8YLuw7csxoWrWNnJ3U
        +bCJ1dv/Mh/oXta0ZPXEnZW/F4XWrNS98Py3plj/Vd793WeCN01g/8VY8UzD49PUUFmBJ92/
        eQXOiewps1DsNZgcIebNeUCQu8Hxv+yO+n32Yh0HPz49t+j5ntVMZkosxRmJhlrMRcWJAG2d
        f5/NAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andrew,
Thanks for your review, please find the v4 in separate email. We merged all your suggestion in v4.

Best Regards,
--Hongwei
-----Original Message-----

> From:	Andrew Jeffery <andrew@aj.id.au>
> Sent:	Tuesday, July 16, 2019 11:26 PM
> To:	Hongwei Zhang; Bartosz Golaszewski; Joel Stanley; Linus Walleij
> Cc:	linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; 
> linux-kernel@vger.kernel.org
> Subject:	Re: [PATCH 2/3 v3] ARM: dts: aspeed: Add SGPIO driver
> 
> Hello Hongwei,
> 
> Please send patches and feedback on prior iterations separately. Please send the output of `git format-
> patch ...`directly; format-patch spits the patch out in email form ready to go and can be fed straight to 
> `git send-email`.
> 
> On Wed, 17 Jul 2019, at 06:54, Hongwei Zhang wrote:
> > Add SGPIO driver support for Aspeed AST2500 SoC.
> > 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > ---
> >  drivers/gpio/sgpio-aspeed.c | 487 
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 487 insertions(+)
> >  create mode 100644 drivers/gpio/sgpio-aspeed.c
> > 
> > diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c 
> > new file mode 100644 index 0000000..ade2cb7
> > --- /dev/null
> > +++ b/drivers/gpio/sgpio-aspeed.c
> > @@ -0,0 +1,487 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019 American Megatrends International LLC.
> > + *
> > + * Author: Karthikeyan Mani <karthikeyanm@amiindia.co.in>  */
> > +
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/aspeed.h>
> 
> linux/gpio/aspeed.h is specific to the parallel GPIO driver, please drop this include.
> 

Removed it.

> > +#include <linux/hashtable.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/init.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pinctrl/consumer.h>
> 
> This driver doesn't have any direct interaction with pinctrl, so I think we can remove this header
> 

Removed it.

> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/string.h>
> > +#include <linux/gpio.h>
> > +
> > +#define MAX_NR_SGPIO			80
> > +
> > +#define ASPEED_SGPIO_CTRL		0x54
> > +
> > +#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
> > +#define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
> > +#define ASPEED_SGPIO_ENABLE		BIT(0)
> > +
> > +// default sgpio direction is input.
> > +static uint32_t sgpio_dir_val[3] = {0xffffffff, 0xffffffff, 
> > +0xffffffff
> > };
> 
> Why not make it a member of struct aspeed_sgpio (below)? I'd prefer we encode the comment in the 
> variable name as well, e.g.
> sgpio_dir_in`- this way when reading the code that uses it we know which bit state means what (set is 
> input, clear is output).
> 

Done.

> > +
> > +struct aspeed_sgpio {
> > +	struct gpio_chip chip;
> > +	struct clk *pclk;
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
> 
> The paragraph above is somewhat specific to the parallel GPIO driver.
> It would be good to rework it for the context of the SGPIO driver.
> Documenting the split of the "value" and "rdata" register is a good thing.
> 
> > + *
> > + *       The "rdata" register returns the content of the write latch
> > + *       and thus can be used to read back what was last written
> > + *       reliably.
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
> > +
> > +	if (sgpio_dir_val[GPIO_BANK(offset)] & GPIO_BIT(offset))
> > +		return !!(ioread32(bank_reg(gpio, bank, reg_val)) &
> > GPIO_BIT(offset));
> > +	else
> > +		return !!(ioread32(bank_reg(gpio, bank, reg_rdata)) &
> > GPIO_BIT(offset));
> 
> We don't need the else because we return from the body of the true case,
> and this could be written in a less redundant fashion. Also we need to do
> the read under gpio.lock for consistency with aspeed_sgpio_set().
> 
> enum aspeed_sgpio_reg from;
> unsigned long flags;
> bool input;
> int rc;
> 
> ...
> 
> spin_lock_irqsave(&gpio->lock, flags);
> input = sgpio_dir_val[GPIO_BANK(offset)] & GPIO_BIT(offset);
> from = input ? reg_val : reg_rdata;
> rc = !!(ioread32(bank_reg(gpio, bank, from)) & GPIO_BIT(offset));
> spin_unlock_irqrestore(&gpio->lock, flags);
> 
> return rc;
> 

Updated code accordingly.

> > +
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
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +}
> > +
> > +static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int 
> > offset)
> > +{
> > +	sgpio_dir_val[GPIO_BANK(offset)] |= GPIO_BIT(offset);
> 
> Also do all manipulations of sgpio_dir_val under the spinlock.
> 

Added spinlock as you suggested.

> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int 
> > offset, int val)
> > +{
> > +	sgpio_dir_val[GPIO_BANK(offset)] &= ~GPIO_BIT(offset);
> 
> Again here.
> 
> > +	return 0;
> > +}
> > +
> > +static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned 
> > int offset)
> > +{
> > +	return sgpio_dir_val[GPIO_BANK(offset)] & GPIO_BIT(offset);
> 
> Again here.
> 
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
> 
> It looks like this function could be a void function instead, and we
> could eliminate error checking from the callsites. If you're feeling
> paranoid you could `WARN_ON(!internal);` after the call to
> `irq_data_get_irq_chip_data(d)`.
> 

Updated.

> > +}
> > +
> > +static void aspeed_sgpio_irq_ack(struct irq_data *d)
> > +{
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
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +}
> > +
> > +static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
> > +{
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
> > +	spin_unlock_irqrestore(&gpio->lock, flags);
> > +}
> > +
> > +static void aspeed_sgpio_irq_mask(struct irq_data *d)
> > +{
> > +	aspeed_sgpio_irq_set_mask(d, false);
> > +}
> > +
> > +static void aspeed_sgpio_irq_unmask(struct irq_data *d)
> > +{
> > +	aspeed_sgpio_irq_set_mask(d, true);
> > +}
> > +
> > +static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
> > +{
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
> > +static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
> > +{
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
> > +static int __init aspeed_sgpio_probe(struct platform_device *pdev)
> > +{
> > +	struct aspeed_sgpio *gpio;
> > +	struct resource *res;
> > +	u32 nr_gpios, sgpio_freq;
> > +	int rc;
> > +	u16 sgpio_clk_div;
> 
> Lets make this a u32 as it will help error detection below.
> 
> > +	unsigned long apb_freq;
> > +
> > +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> > +	if (!gpio)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	gpio->base = devm_ioremap_resource(&pdev->dev, res);
> 
> Please use devm_platform_ioremap_resource() here.
> 
> > +	if (IS_ERR(gpio->base))
> > +		return PTR_ERR(gpio->base);
> > +
> > +	rc = of_property_read_u32(pdev->dev.of_node, "nr-gpios", &nr_gpios);
> > +	if ((rc < 0) || (nr_gpios > MAX_NR_SGPIO))
> > +		nr_gpios = MAX_NR_SGPIO;
> 
> This is an error state, not something we should paper over. This should be
> `return -EINVAL;`
> 

Updated.

> > +
> > +	rc = of_property_read_u32(pdev->dev.of_node, "bus-frequency", 
> > &sgpio_freq);
> > +	if (rc < 0) {
> > +		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
> > +		sgpio_freq = 12000000;
> 
> Again, I suggested previously that this is a required property, not optional.
> As such there should not be fall-back code here. This is another case of
> `return -EINVAL;`.
> 

Updated.

> > +	}
> > +
> > +	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(gpio->pclk)) {
> > +		dev_err(&pdev->dev, "devm_clk_get failed\n");
> > +		return PTR_ERR(gpio->pclk);
> > +	}
> > +
> > +	apb_freq = clk_get_rate(gpio->pclk);
> > +	sgpio_clk_div = 2 * ((apb_freq % sgpio_freq == 0) ?
> > +			     (apb_freq / sgpio_freq) - 1 : (apb_freq / sgpio_freq));
> 
> This calculation seems overly complex and possibly incorrect (need to
> multiply the denominator or divide the result, not multiply the result)?
> 
> From the datasheet, the SGPM clock period calculation is:
> 
> period = 1/PCLK * 2 * (GPIO254[31:16] + 1)
> 
> rearranging:
> 
> period = 2 * (GPIO254[31:16] + 1) / PCLK
> 
> Converting back to bus frequency:
> 
> frequency = 1 / (2 * (GPIO254[31:16] + 1) / PCLK)
> 
> Which rearranges to:
> 
> frequency = PCLK / (2 * (GPIO254[31:16] + 1))
> 
> Extracting GPIO254[31:16] in terms of PCLK / frequency from above:
> 
> frequency * 2 * (GPIO254[31:16] + 1) = PCLK
> 
> And so:
> 
> GPIO254[31:16] = PCLK / (frequency * 2) - 1
> 
> From that, the code should look something like:
> 
> if (sgpio_freq == 0)
>         return -EINVAL;
> 
> sgpio_clk_div = apb_freq / (sgpio_freq * 2) - 1;
> 
> if (sgpio_clk_div > (1 << 16) - 1)
>         return -EINVAL;
> 
> This seems to work at the extremes (sgpio_clk_div = 0 and
> sgpio_clk_div = 65535), and we get 32766.99 on a round-trip of
> the divider value 32768, which if we truncate gives an error of 0.023Hz
> with an APB of 24.75MHz (value reported from one of our boards).
> 
> Andrew
> 

Thanks for the formula and detailed suggestion, really appreciated.

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
> > +
> > +	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	return aspeed_sgpio_setup_irqs(gpio, pdev);
> > +}
> > +
> > +static struct platform_driver aspeed_sgpio_driver = {
> > +	.driver = {
> > +		.name = KBUILD_MODNAME,
> > +		.of_match_table = aspeed_sgpio_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver_probe(aspeed_sgpio_driver, aspeed_sgpio_probe);
> > +MODULE_DESCRIPTION("Aspeed Serial GPIO Driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.7.4

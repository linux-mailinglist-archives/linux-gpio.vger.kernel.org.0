Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7373E64FF7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 03:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfGKBqA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 21:46:00 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34549 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727463AbfGKBqA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jul 2019 21:46:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id CB4F820D7C;
        Wed, 10 Jul 2019 21:45:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 10 Jul 2019 21:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=5o0Sq/MOOSCneJqjrpryySjuBkKeXns
        y2AHoQ86gdrc=; b=oLd6pl4ij9Ef7pDkIY86CMVX703MM2Cc7CoSN7o2sbARzGf
        LG7VqtEZf+gw0mkkgRArxNuoty0oAtAPAxCbSL7SumKdKeSWTsTPTt6aUitcp/hL
        j30y2ac8qHF9PCNpnof0sigXwIM85wAI9RKoTkMx4liNrFMgMcunuC5Vo3LW90so
        Si/8FoQVbGJPQFIpKJGPOGmn1y+NrnaBbSfxdxIUPsUzA6y5svYt1mGm9WO8/eGH
        +fk3Cuqw6mV6UDAxvATbWYosEabGQMDe4dJ9n7BR26mlGhYzysTr4pr6iHTuehAx
        SSKcAAwGNs0KVstbazqTnNzfq+c5uEG8v81JfMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5o0Sq/
        MOOSCneJqjrpryySjuBkKeXnsy2AHoQ86gdrc=; b=ktEgAyg31gHyvWRrU+e8HO
        M3YkI/hr97Tblt1Zhf4b+oHzhaZhTDCT3RsF0OvnhqxzSHNBzB9WJm9JjVZswuTW
        hMAE/e5TfJvcNcf0kTIMKoEJ8YeXPfxKixrQSBNxnBuFRg1I/7b6KNspKU09itGH
        vxrMpXzt2AKd9N1AGUTyMtHysuGpU6o1149UucJldIe0iqdN3j8/o/9YVoat4qZA
        O+hxmQ5IjajNQIHLEjR4YzO96WIssSKWMHh06OPnyVOrVp5cVDriXFnI+ji9mTo8
        3A/XOOEc242RZwKH59IlbLNiZ3sutW51haANBupCTPILXchg2SiGRlbzcbsGdbuQ
        ==
X-ME-Sender: <xms:1JQmXXVKtVNnzSePTTgQC50KatM4qKcPojgXftND7w32-_GrjPTc2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeejgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:1JQmXX9qNgm9wjTFt2gFiYjgvee0y1t40xV2-4YrASCNIY1aANHKng>
    <xmx:1JQmXVnKsUmsKnl99YulCgkkdMoObbYMyfznATQespMEKhBD3ASOjQ>
    <xmx:1JQmXaJP6cV1E82Uf2dg-VDIxHq-fo2PsaIpiMz6CUIjU_TkTR6BlA>
    <xmx:1ZQmXbMMawtkzufjaR_G2d7SWoUBMu1U9WXtpa_QjjLZZ4Wt_j5Ffw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6F41BE0162; Wed, 10 Jul 2019 21:45:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <0941299a-6c09-4f93-b7da-6264502a5fdf@www.fastmail.com>
In-Reply-To: <1562772382-6555-1-git-send-email-hongweiz@ami.com>
References: <1562772382-6555-1-git-send-email-hongweiz@ami.com>
Date:   Thu, 11 Jul 2019 11:16:00 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Hongwei Zhang" <hongweiz@ami.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3 v2] ARM: dts: aspeed: Add SGPIO driver
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 11 Jul 2019, at 00:56, Hongwei Zhang wrote:
> Add SGPIO driver support for Aspeed AST2500 SoC.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  drivers/gpio/sgpio-aspeed.c | 450 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 450 insertions(+)
>  create mode 100644 drivers/gpio/sgpio-aspeed.c
> 
> diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/sgpio-aspeed.c
> new file mode 100644
> index 0000000..0743d22
> --- /dev/null
> +++ b/drivers/gpio/sgpio-aspeed.c
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019 American Megatrends International LLC.
> + *
> + * Author: Karthikeyan Mani <karthikeyanm@amiindia.co.in>
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/aspeed.h>
> +#include <linux/hashtable.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +
> +#define NR_SGPIO        80
> +
> +struct aspeed_sgpio {
> +	struct gpio_chip chip;
> +	spinlock_t lock;
> +	void __iomem *base;
> +	int irq;
> +};
> +
> +struct aspeed_sgpio_bank {
> +	uint16_t    val_regs;
> +	uint16_t    rdata_reg;
> +	uint16_t    irq_regs;
> +	const char  names[4][3];
> +};
> +
> +/*
> + * Note: The "value" register returns the input value sampled on the
> + *       line even when the GPIO is configured as an output. Since
> + *       that input goes through synchronizers, writing, then reading
> + *       back may not return the written value right away.
> + *
> + *       The "rdata" register returns the content of the write latch
> + *       and thus can be used to read back what was last written
> + *       reliably.
> + */
> +
> +static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
> +	{
> +		.val_regs = 0x0000,
> +		.rdata_reg = 0x0070,
> +		.irq_regs = 0x0004,
> +		.names = { "A", "B", "C", "D" },
> +	},
> +	{
> +		.val_regs = 0x001C,
> +		.rdata_reg = 0x0074,
> +		.irq_regs = 0x0020,
> +		.names = { "E", "F", "G", "H" },
> +	},
> +	{
> +		.val_regs = 0x0038,
> +		.rdata_reg = 0x0078,
> +		.irq_regs = 0x003C,
> +		.names = { "I", "J" },
> +	},
> +};
> +
> +enum aspeed_sgpio_reg {
> +	reg_val,
> +	reg_rdata,
> +	reg_irq_enable,
> +	reg_irq_type0,
> +	reg_irq_type1,
> +	reg_irq_type2,
> +	reg_irq_status,
> +};
> +
> +#define GPIO_VAL_VALUE      0x00
> +#define GPIO_VAL_DIR        0x04
> +#define GPIO_IRQ_ENABLE     0x00
> +#define GPIO_IRQ_TYPE0      0x04
> +#define GPIO_IRQ_TYPE1      0x08
> +#define GPIO_IRQ_TYPE2      0x0C
> +#define GPIO_IRQ_STATUS     0x10
> +
> +/* This will be resolved at compile time */
> +static inline void __iomem *bank_reg(struct aspeed_sgpio *gpio,
> +				     const struct aspeed_sgpio_bank *bank,
> +				     const enum aspeed_sgpio_reg reg)
> +{
> +	switch (reg) {
> +	case reg_val:
> +		return gpio->base + bank->val_regs + GPIO_VAL_VALUE;
> +	case reg_rdata:
> +		return gpio->base + bank->rdata_reg;
> +	case reg_irq_enable:
> +		return gpio->base + bank->irq_regs + GPIO_IRQ_ENABLE;
> +	case reg_irq_type0:
> +		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE0;
> +	case reg_irq_type1:
> +		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE1;
> +	case reg_irq_type2:
> +		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
> +	case reg_irq_status:
> +		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
> +	default:
> +		/* acturally if code runs to here, it's an error case */
> +		WARN_ON(reg);
> +		return gpio->base;
> +	}
> +}
> +
> +#define GPIO_BANK(x)    ((x) >> 5)
> +#define GPIO_OFFSET(x)  ((x) & 0x1f)
> +#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
> +
> +static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
> +{
> +	unsigned int bank = GPIO_BANK(offset);
> +
> +	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
> +	return &aspeed_sgpio_banks[bank];
> +}
> +
> +static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> +
> +	return !!(ioread32(bank_reg(gpio, bank, reg_val)) & GPIO_BIT(offset));
> +}
> +
> +static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int 
> offset, int val)
> +{
> +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> +	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> +	unsigned long flags;
> +	void __iomem *addr;
> +	u32 reg = 0;
> +
> +	spin_lock_irqsave(&gpio->lock, flags);
> +
> +	addr = bank_reg(gpio, bank, reg_val);
> +
> +	if (val)
> +		reg |= GPIO_BIT(offset);
> +	else
> +		reg &= ~GPIO_BIT(offset);
> +
> +	iowrite32(reg, addr);
> +	spin_unlock_irqrestore(&gpio->lock, flags);
> +}
> +
> +static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int 
> offset)
> +{
> +	/* By default all SGPIO Pins are input */
> +	return 0;
> +}
> +
> +static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int 
> offset, int val)
> +{
> +	return 0;
> +}
> +
> +static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned 
> int offset)
> +{
> +	/* By default all SGPIO Pins are input */
> +	return 1;
> +
> +}

Please see my follow-up reply on v1 that helps clarify what we should do
with the dir_in()/dir_out()/get_direction() implementations. The
implementation here will confuse everything in the stack above it.

> +
> +static inline int irqd_to_aspeed_sgpio_data(struct irq_data *d,
> +					    struct aspeed_sgpio **gpio,
> +					    const struct aspeed_sgpio_bank **bank,
> +					    u32 *bit, int *offset)
> +{
> +	struct aspeed_sgpio *internal;
> +
> +	*offset = irqd_to_hwirq(d);
> +
> +	internal = irq_data_get_irq_chip_data(d);
> +
> +	*gpio = internal;
> +	*bank = to_bank(*offset);
> +	*bit = GPIO_BIT(*offset);
> +
> +	return 0;
> +}
> +
> +static void aspeed_sgpio_irq_ack(struct irq_data *d)
> +{
> +	const struct aspeed_sgpio_bank *bank;
> +	struct aspeed_sgpio *gpio;
> +	unsigned long flags;
> +	void __iomem *status_addr;
> +	int rc, offset;
> +	u32 bit;
> +
> +	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> +	if (rc)
> +		return;
> +
> +	status_addr = bank_reg(gpio, bank, reg_irq_status);
> +
> +	spin_lock_irqsave(&gpio->lock, flags);
> +
> +	iowrite32(bit, status_addr);
> +
> +	spin_unlock_irqrestore(&gpio->lock, flags);
> +}
> +
> +static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
> +{
> +	const struct aspeed_sgpio_bank *bank;
> +	struct aspeed_sgpio *gpio;
> +	unsigned long flags;
> +	u32 reg, bit;
> +	void __iomem *addr;
> +	int rc, offset;
> +
> +	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> +	if (rc)
> +		return;
> +
> +	addr = bank_reg(gpio, bank, reg_irq_enable);
> +
> +	spin_lock_irqsave(&gpio->lock, flags);
> +
> +	reg = ioread32(addr);
> +	if (set)
> +		reg |= bit;
> +	else
> +		reg &= ~bit;
> +
> +	iowrite32(reg, addr);
> +
> +	spin_unlock_irqrestore(&gpio->lock, flags);
> +}
> +
> +static void aspeed_sgpio_irq_mask(struct irq_data *d)
> +{
> +	aspeed_sgpio_irq_set_mask(d, false);
> +}
> +
> +static void aspeed_sgpio_irq_unmask(struct irq_data *d)
> +{
> +	aspeed_sgpio_irq_set_mask(d, true);
> +}
> +
> +static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
> +{
> +	u32 type0 = 0;
> +	u32 type1 = 0;
> +	u32 type2 = 0;
> +	u32 bit, reg;
> +	const struct aspeed_sgpio_bank *bank;
> +	irq_flow_handler_t handler;
> +	struct aspeed_sgpio *gpio;
> +	unsigned long flags;
> +	void __iomem *addr;
> +	int rc, offset;
> +
> +	rc = irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> +	if (rc)
> +		return -EINVAL;
> +
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		type2 |= bit;
> +		/* fall through */
> +	case IRQ_TYPE_EDGE_RISING:
> +		type0 |= bit;
> +		/* fall through */
> +	case IRQ_TYPE_EDGE_FALLING:
> +		handler = handle_edge_irq;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		type0 |= bit;
> +		/* fall through */
> +	case IRQ_TYPE_LEVEL_LOW:
> +		type1 |= bit;
> +		handler = handle_level_irq;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	spin_lock_irqsave(&gpio->lock, flags);
> +
> +	addr = bank_reg(gpio, bank, reg_irq_type0);
> +	reg = ioread32(addr);
> +	reg = (reg & ~bit) | type0;
> +	iowrite32(reg, addr);
> +
> +	addr = bank_reg(gpio, bank, reg_irq_type1);
> +	reg = ioread32(addr);
> +	reg = (reg & ~bit) | type1;
> +	iowrite32(reg, addr);
> +
> +	addr = bank_reg(gpio, bank, reg_irq_type2);
> +	reg = ioread32(addr);
> +	reg = (reg & ~bit) | type2;
> +	iowrite32(reg, addr);
> +
> +	spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	irq_set_handler_locked(d, handler);
> +
> +	return 0;
> +}
> +
> +static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +	struct irq_chip *ic = irq_desc_get_chip(desc);
> +	struct aspeed_sgpio *data = gpiochip_get_data(gc);
> +	unsigned int i, p, girq;
> +	unsigned long reg;
> +
> +	chained_irq_enter(ic, desc);
> +
> +	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> +		const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
> +
> +		reg = ioread32(bank_reg(data, bank, reg_irq_status));
> +
> +		for_each_set_bit(p, &reg, 32) {
> +			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
> +			generic_handle_irq(girq);
> +		}
> +
> +	}
> +
> +	chained_irq_exit(ic, desc);
> +}
> +
> +static struct irq_chip aspeed_sgpio_irqchip = {
> +	.name       = "aspeed-sgpio",
> +	.irq_ack    = aspeed_sgpio_irq_ack,
> +	.irq_mask   = aspeed_sgpio_irq_mask,
> +	.irq_unmask = aspeed_sgpio_irq_unmask,
> +	.irq_set_type   = aspeed_sgpio_set_type,
> +};
> +
> +static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
> +				   struct platform_device *pdev)
> +{
> +	int rc, i;
> +	const struct aspeed_sgpio_bank *bank;
> +
> +	rc = platform_get_irq(pdev, 0);
> +	if (rc < 0)
> +		return rc;
> +
> +	gpio->irq = rc;
> +
> +	/* Disable IRQ and clear Interrupt status registers for all SPGIO 
> Pins. */
> +	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> +		bank =  &aspeed_sgpio_banks[i];
> +		/* disable irq enable bits */
> +		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));
> +		/* clear status bits */
> +		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
> +	}
> +
> +	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
> +				  0, handle_bad_irq, IRQ_TYPE_NONE);
> +	if (rc) {
> +		dev_info(&pdev->dev, "Could not add irqchip\n");
> +		return rc;
> +	}
> +
> +	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
> +				     gpio->irq, aspeed_sgpio_irq_handler);
> +
> +	/* set IRQ settings and Enable Interrupt */
> +	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> +		bank = &aspeed_sgpio_banks[i];
> +		/* set falling or level-low irq */
> +		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
> +		/* trigger type is edge */
> +		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
> +		/* dual edge trigger mode. */
> +		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
> +		/* enable irq */
> +		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
> +	}
> +
> +	return 0;
> +}
> +
> +static int aspeed_sgpio_request(struct gpio_chip *chip, unsigned int 
> offset)
> +{
> +	return (offset < NR_SGPIO);
> +}

I don't think this request() implementation is helpful, especially as it stands
in the face of needing to pull the number of GPIOs to serialise from the
devicetree.

request() is an optional callback, lets just drop it.

> +
> +static const struct of_device_id aspeed_sgpio_of_table[] = {
> +	{ .compatible = "aspeed,ast2400-sgpio" },
> +	{ .compatible = "aspeed,ast2500-sgpio" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
> +
> +static int __init aspeed_sgpio_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_sgpio *gpio;
> +	struct resource *res;
> +	int rc;
> +
> +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> +	if (!gpio)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	gpio->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(gpio->base))
> +		return PTR_ERR(gpio->base);
> +
> +	spin_lock_init(&gpio->lock);
> +
> +	gpio->chip.parent = &pdev->dev;
> +	gpio->chip.ngpio = NR_SGPIO;
> +	gpio->chip.direction_input = aspeed_sgpio_dir_in;
> +	gpio->chip.direction_output = aspeed_sgpio_dir_out;
> +	gpio->chip.get_direction = aspeed_sgpio_get_direction;
> +	gpio->chip.request = aspeed_sgpio_request;
> +	gpio->chip.free = NULL;
> +	gpio->chip.get = aspeed_sgpio_get;
> +	gpio->chip.set = aspeed_sgpio_set;
> +	gpio->chip.set_config = NULL;
> +	gpio->chip.label = dev_name(&pdev->dev);
> +	gpio->chip.base = -1;
> +
> +	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> +	if (rc < 0)
> +		return rc;
> +
> +	return aspeed_sgpio_setup_irqs(gpio, pdev);
> +}
> +
> +static struct platform_driver aspeed_sgpio_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = aspeed_sgpio_of_table,
> +	},
> +};
> +
> +module_platform_driver_probe(aspeed_sgpio_driver, aspeed_sgpio_probe);
> +MODULE_DESCRIPTION("Aspeed Serial GPIO Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.7.4
> 
>

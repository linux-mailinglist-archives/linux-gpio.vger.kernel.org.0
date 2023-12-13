Return-Path: <linux-gpio+bounces-1379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA6811775
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F7C285AED
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C5485360;
	Wed, 13 Dec 2023 15:27:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60E12105;
	Wed, 13 Dec 2023 07:27:09 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="13676036"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="13676036"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 07:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="767249590"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="767249590"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 07:27:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDR8Y-00000005Yh1-36Wm;
	Wed, 13 Dec 2023 17:27:02 +0200
Date: Wed, 13 Dec 2023 17:27:02 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Jim Liu <jim.t90615@gmail.com>
Cc: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v9 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Message-ID: <ZXnNRoGmeibdRAwq@smile.fi.intel.com>
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
 <20231212065147.3475413-4-jim.t90615@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212065147.3475413-4-jim.t90615@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 02:51:47PM +0800, Jim Liu wrote:
> Add Nuvoton BMC NPCM7xx/NPCM8xx sgpio driver support.
> Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
> and parallel to serial IC (HC165), and use APB3 clock to control it.
> This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
> BMC can use this driver to increase 64 GPI pins and 64 GPO pins to use.

...

> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/hashtable.h>
> +#include <linux/init.h>
> +#include <linux/io.h>

> +#include <linux/kernel.h>

Is this a proxy to some other headers like array_size.h? Please use respective
headers directly.

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>

...

> +#define NPCM_CLK_MHZ	8000000

HZ_PER_MHZ from units.h?

...

> +struct npcm_sgpio {
> +	struct gpio_chip chip;
> +	struct clk *pclk;
> +	struct irq_chip intc;
> +	raw_spinlock_t lock;	/*protect event config*/

Missing spaces.

> +	void __iomem *base;
> +	int irq;
> +	u8 nin_sgpio;
> +	u8 nout_sgpio;
> +	u8 in_port;
> +	u8 out_port;
> +	u8 int_type[MAX_NR_HW_SGPIO];
> +};

...

> +	{
> +		.wdata_reg = 0x07,
> +		.rdata_reg = 0x0f,
> +		.event_config = 0x1e,
> +		.event_status = 0x27,
> +	},
> +

Redundant blank line.

...

> +static void __iomem *bank_reg(struct npcm_sgpio *gpio,
> +			      const struct npcm_sgpio_bank *bank,
> +			      const enum npcm_sgpio_reg reg)
> +{
> +	switch (reg) {
> +	case READ_DATA:
> +		return gpio->base + bank->rdata_reg;
> +	case WRITE_DATA:
> +		return gpio->base + bank->wdata_reg;
> +	case EVENT_CFG:
> +		return gpio->base + bank->event_config;
> +	case EVENT_STS:
> +		return gpio->base + bank->event_status;
> +	default:
> +		/* actually if code runs to here, it's an error case */
> +		dev_WARN(gpio->chip.parent, "Getting here is an error condition");

...then return an error here.

> +	}
> +	return 0;

See above.

> +}

> +static void irqd_to_npcm_sgpio_data(struct irq_data *d,

Respect namespace, here it's better to have npcm_sgpio_irqd_to_data().

> +				    struct npcm_sgpio **gpio,
> +				    const struct npcm_sgpio_bank **bank,
> +				    u8 *bit, unsigned int *offset)

...

> +static int npcm_sgpio_init_port(struct npcm_sgpio *gpio)
> +{
> +	u8 in_port, out_port, set_port, reg;
> +
> +	in_port = GPIO_BANK(gpio->nin_sgpio);
> +	if (GPIO_BIT(gpio->nin_sgpio) > 0)
> +		in_port += 1;

This is strange... So, you are telling that offsets start from 1 and not 0?

> +	out_port = GPIO_BANK(gpio->nout_sgpio);
> +	if (GPIO_BIT(gpio->nout_sgpio) > 0)
> +		out_port += 1;

Ditto.

...

> +	set_port = ((out_port & NPCM_IOXCFG2_PORT) << 4) | (in_port & NPCM_IOXCFG2_PORT);

Outer parentheses are redundant.

...

> +static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> +{
> +	gc->set(gc, offset, val);
> +
> +	return 0;

> +

Redundant blank line.

> +}
> +
> +static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct npcm_sgpio *gpio = gpiochip_get_data(gc);

> +	if (offset > gpio->chip.ngpio)
> +		return -EINVAL;

Why do you need this check?

> +	if (offset < gpio->nout_sgpio)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
> +}

...

> +static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
> +{
> +	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
> +	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
> +	void __iomem *addr;
> +	u8 reg = 0;
> +
> +	addr = bank_reg(gpio, bank, WRITE_DATA);
> +	reg = ioread8(addr);
> +
> +	if (val)
> +		reg |= (val << GPIO_BIT(offset));

...and if val is not 1?..

> +	else
> +		reg &= ~(1 << GPIO_BIT(offset));

In both cases use BIT().

> +	iowrite8(reg, addr);
> +}

...

> +	dir = npcm_sgpio_get_direction(gc, offset);
> +	if (dir == 0) {
> +		bank = offset_to_bank(offset);
> +
> +		addr = bank_reg(gpio, bank, WRITE_DATA);
> +		reg = ioread8(addr);
> +		reg = !!(reg & GPIO_BIT(offset));
> +	} else {
> +		offset -= gpio->nout_sgpio;
> +		bank = offset_to_bank(offset);
> +
> +		addr = bank_reg(gpio, bank, READ_DATA);
> +		reg = ioread8(addr);
> +		reg = !!(reg & GPIO_BIT(offset));
> +	}

Instead of conditional(s) use arithmetics. You can get all these directly
from the properly formed calculations.

...

> +static void npcm_sgpio_setup_enable(struct npcm_sgpio *gpio, bool enable)
> +{

> +	u8 reg = 0;
Redundant assignment.

> +	reg = ioread8(gpio->base + NPCM_IOXCTS);

> +	reg = reg & ~NPCM_IOXCTS_RD_MODE;
> +	reg = reg | NPCM_IOXCTS_RD_MODE_PERIODIC;

Combine them.

> +	if (enable) {
> +		reg |= NPCM_IOXCTS_IOXIF_EN;
> +		iowrite8(reg, gpio->base + NPCM_IOXCTS);
> +	} else {
> +		reg &= ~NPCM_IOXCTS_IOXIF_EN;
> +		iowrite8(reg, gpio->base + NPCM_IOXCTS);
> +	}
> +}

...

> +static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
> +				const struct npcm_clk_cfg *clk_cfg)
> +{
> +	unsigned long apb_freq;
> +	u32 val;
> +	u8 tmp;
> +	int i;
> +
> +	apb_freq = clk_get_rate(gpio->pclk);
> +	tmp = ioread8(gpio->base + NPCM_IOXCFG1) & ~NPCM_IOXCFG1_SFT_CLK;
> +
> +	for (i = 0; i < clk_cfg->cfg_opt; i++) {
> +		val = apb_freq / clk_cfg->sft_clk[i];
> +		if ((NPCM_CLK_MHZ < val) && (i != 0) ) {
> +			iowrite8(clk_cfg->clk_sel[i-1] | tmp, gpio->base + NPCM_IOXCFG1);
> +			return 0;
> +		} else if (i == (clk_cfg->cfg_opt-1) && (NPCM_CLK_MHZ > val)) {
> +			iowrite8(clk_cfg->clk_sel[i] | tmp, gpio->base + NPCM_IOXCFG1);
> +			return 0;
> +		}

These i == / i != checks probably due to wrong operator be chosen. Consider using
while-loop, or do-while. I believe it will make code better.

> +	}
> +
> +	return -EINVAL;
> +}

...

> +static void npcm_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> +					   unsigned long *valid_mask, unsigned int ngpios)
> +{
> +	struct npcm_sgpio *gpio = gpiochip_get_data(gc);

> +	int n = gpio->nin_sgpio;

Why do you need this variable, what for?

> +	/* input GPIOs in the high range */
> +	bitmap_set(valid_mask, gpio->nout_sgpio, n);
> +	bitmap_clear(valid_mask, 0, gpio->nout_sgpio);
> +}

...

> +	raw_spin_lock_irqsave(&gpio->lock, flags);

Don't you need to use spin lock in the other APIs? It seem whole driver works by luck.

> +	npcm_sgpio_setup_enable(gpio, false);
> +
> +	reg = ioread16(addr);
> +	if (set) {
> +		reg &= ~(NPCM_IXOEVCFG_MASK << (bit * 2));
> +	} else {
> +		type = gpio->int_type[offset];
> +		reg |= (type << (bit * 2));

At least the calculations can be done outside of the lock.

> +	}
> +
> +	iowrite16(reg, addr);
> +
> +	npcm_sgpio_setup_enable(gpio, true);
> +
> +	addr = bank_reg(gpio, bank, EVENT_STS);
> +	reg = ioread8(addr);
> +	reg |= BIT(bit);
> +	iowrite8(reg, addr);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);

...

> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		val = NPCM_IXOEVCFG_BOTH;
> +		handler = handle_edge_irq;
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		val = NPCM_IXOEVCFG_RISING;
> +		handler = handle_edge_irq;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		val = NPCM_IXOEVCFG_FALLING;
> +		handler = handle_edge_irq;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		val = NPCM_IXOEVCFG_RISING;
> +		handler = handle_level_irq;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		val = NPCM_IXOEVCFG_FALLING;
> +		handler = handle_level_irq;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

You can split the handler setup and make this function less by 5 LoCs or so.

See, for example, gpio-tangier.c.

...

> +	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
> +		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
> +
> +		reg = ioread8(bank_reg(gpio, bank, EVENT_STS));
> +		for_each_set_bit(j, &reg, 8) {
> +			girq = irq_find_mapping(gc->irq.domain, i * 8 + gpio->nout_sgpio + j);
> +			generic_handle_irq(girq);

generic_handle_domain_irq()

> +		}
> +	}

...

> +static int npcm_sgpio_setup_irqs(struct npcm_sgpio *gpio,
> +				 struct platform_device *pdev)
> +{
> +	int rc, i;
> +	struct gpio_irq_chip *irq;
> +
> +	rc = platform_get_irq(pdev, 0);
> +	if (rc < 0)
> +		return rc;
> +
> +	gpio->irq = rc;
> +
> +	npcm_sgpio_setup_enable(gpio, false);
> +
> +	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
> +	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
> +		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];

> +		iowrite16(0x0000, bank_reg(gpio, bank, EVENT_CFG));

0 is enough.

> +		iowrite8(0xff, bank_reg(gpio, bank, EVENT_STS));

GENMASK() ?

> +	}
> +
> +	irq = &gpio->chip.irq;
> +	gpio_irq_chip_set_chip(irq, &sgpio_irq_chip);
> +	irq->init_valid_mask = npcm_sgpio_irq_init_valid_mask;
> +	irq->handler = handle_bad_irq;
> +	irq->default_type = IRQ_TYPE_NONE;
> +	irq->parent_handler = npcm_sgpio_irq_handler;
> +	irq->parent_handler_data = gpio;
> +	irq->parents = &gpio->irq;
> +	irq->num_parents = 1;
> +
> +	return 0;
> +}

...

> +static struct npcm_clk_cfg npcm750_sgpio_pdata = {
> +	.sft_clk = npcm750_SFT_CLK,
> +	.clk_sel = npcm750_CLK_SEL,
> +	.cfg_opt = 6,

Define this magic and use it in the above arrays as the capacity.

> +};
> +
> +static const struct npcm_clk_cfg npcm845_sgpio_pdata = {
> +	.sft_clk = npcm845_SFT_CLK,
> +	.clk_sel = npcm845_CLK_SEL,

> +	.cfg_opt = 5,

Ditto.

> +};

...

> +static const struct of_device_id npcm_sgpio_of_table[] = {
> +	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm750_sgpio_pdata, },
> +	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);

Move this closer to its user below.

...

> +	if (gpio->nin_sgpio > MAX_NR_HW_SGPIO || gpio->nout_sgpio > MAX_NR_HW_SGPIO) {
> +		dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: input: %d output: %d\n",
> +			MAX_NR_HW_SGPIO, nin_gpios, nout_gpios);
> +		return -EINVAL;

		return dev_err_probe(...);

> +	}
> +
> +	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(gpio->pclk)) {
> +		dev_err(&pdev->dev, "Could not get pclk\n");
> +		return PTR_ERR(gpio->pclk);

Ditto.

> +	}

...

> +	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> +	if (rc < 0)

Here and in the other cases, why ' < 0'? Does it have positive value
to be returned in some cases?

> +		return rc;

-- 
With Best Regards,
Andy Shevchenko




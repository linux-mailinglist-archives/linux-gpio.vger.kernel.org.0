Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821F17DF23E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Nov 2023 13:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjKBMYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Nov 2023 08:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjKBMYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Nov 2023 08:24:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF41F112;
        Thu,  2 Nov 2023 05:24:04 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="373739750"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="373739750"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="904995201"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="904995201"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:24:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andy@kernel.org>)
        id 1qyWjt-0000000AgRR-2vm0;
        Thu, 02 Nov 2023 14:23:57 +0200
Date:   Thu, 2 Nov 2023 14:23:57 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Jim Liu <jim.t90615@gmail.com>
Cc:     JJLIU0@nuvoton.com, krzysztof.kozlowski+dt@linaro.org,
        linus.walleij@linaro.org, benjaminfair@google.com, brgl@bgdev.pl,
        robh@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Message-ID: <ZUOU3eImmWnqmO8Q@smile.fi.intel.com>
References: <20231101025110.1704543-1-jim.t90615@gmail.com>
 <20231101025110.1704543-4-jim.t90615@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101025110.1704543-4-jim.t90615@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 01, 2023 at 10:51:10AM +0800, Jim Liu wrote:
> Add Nuvoton BMC NPCM7xx/NPCM8xx sgpio driver support.
> Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
> and parallel to serial IC (HC165), and use APB3 clock to control it.
> This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
> BMC can use this driver to increase 64 gpi pins and 64 gpo pins to use.

GPI
GPO

...

> Reported-by: kernel test robot <lkp@intel.com>

Can't be true. The absence of a new code may not be "reported".

...

> +config GPIO_NPCM_SGPIO
> +	bool "Nuvoton SGPIO support"
> +	depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO

No new driver should use OF_GPIO.
And I do not see where it's being used. Care to elaborate?

> +	select GPIO_GENERIC
> +	select GPIOLIB_IRQCHIP

> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/hashtable.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>

...

> +#define  NPCM_IXOEVCFG_MASK		0x3

GENMASK()

...

> +#define  NPCM_IXOEVCFG_FALLING	0x2
> +#define  NPCM_IXOEVCFG_RISING	0x1

BIT()

> +#define  NPCM_IXOEVCFG_BOTH		0x3

#define  NPCM_IXOEVCFG_BOTH	(NPCM_IXOEVCFG_FALLING | NPCM_IXOEVCFG_RISING)

...

> +#define NPCM_CLK_TH 8000000

Hmm... What is the units here? Hz? Can you use HZ_PER_MHZ multiplier?

> +#define GPIO_BANK(x)    ((x) / 8)
> +#define GPIO_BIT(x)     ((x) % 8)

...

> +struct npcm_clk_cfg {
> +	const unsigned int *SFT_CLK;
> +	const unsigned int *CLK_SEL;

Why capital?

> +	const unsigned int cfg_opt;
> +};

How const for all of them makes any sense here? Just mark the entire struct
with const whenever you are using it.

...

> +struct npcm_sgpio {
> +	struct gpio_chip chip;
> +	struct clk *pclk;
> +	struct irq_chip intc;
> +	spinlock_t lock; /*protect event config*/

Missing spaces inside the comment.

> +	void __iomem *base;
> +	int irq;
> +	u8 nin_sgpio;
> +	u8 nout_sgpio;
> +	u8 in_port;
> +	u8 out_port;
> +	u8 int_type[MAX_NR_HW_SGPIO];
> +};

...

> +static void __iomem *bank_reg(struct npcm_sgpio *gpio,
> +			      const struct npcm_sgpio_bank *bank,
> +				const enum npcm_sgpio_reg reg)

Something wrong with indentation.

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
> +		WARN(true, "Getting here is an error condition");

You have a device pointer, why not dev_WARN()?

> +	}
> +}

...

> +static void irqd_to_npcm_sgpio_data(struct irq_data *d,
> +				    struct npcm_sgpio **gpio,
> +				    const struct npcm_sgpio_bank **bank,
> +				    u8 *bit, int *offset)

offset should be of the proper type.

> +{
> +	struct npcm_sgpio *internal;
> +
> +	*offset = irqd_to_hwirq(d);
> +	internal = irq_data_get_irq_chip_data(d);

> +	WARN_ON(!internal);

When does this make sense? I.o.w. when the internal can be NULL?

> +
> +	*gpio = internal;
> +	*offset -= internal->nout_sgpio;
> +	*bank = offset_to_bank(*offset);
> +	*bit = GPIO_BIT(*offset);
> +}

...

> +static int npcm_sgpio_init_port(struct npcm_sgpio *gpio)
> +{
> +	u8 in_port, out_port, set_port, reg;
> +
> +	in_port = gpio->nin_sgpio / 8;
> +	if (gpio->nin_sgpio % 8 > 0)
> +		in_port += 1;

You created macros and you don't use them?

> +	out_port = gpio->nout_sgpio / 8;
> +	if (gpio->nout_sgpio % 8 > 0)
> +		out_port += 1;

Ditto.

> +	gpio->in_port = in_port;
> +	gpio->out_port = out_port;

> +	set_port = ((out_port & 0xf) << 4) | (in_port & 0xf);

GENMASK() ?

> +	iowrite8(set_port, gpio->base + NPCM_IOXCFG2);
> +
> +	reg = ioread8(gpio->base + NPCM_IOXCFG2);
> +
> +	return reg == set_port ? 0 : -EINVAL;
> +
> +}

...

> +static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
> +{
> +	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
> +
> +	if (offset < gpio->nout_sgpio) {
> +		gc->set(gc, offset, val);
> +		return 0;
> +	}

> +	return -EINVAL;

When is this true? Same question to all these checks over the code.

> +}

...

> +	if (val)
> +		reg |= (val << GPIO_BIT(offset));

And if val == 3? See below as well.

> +	else
> +		reg &= ~(1 << GPIO_BIT(offset));

Why not BIT() macro?

...

> +		reg = (reg >> GPIO_BIT(offset)) & 0x01;

		reg = !!(reg & GPIO_BIT(...));

...

> +		reg = (reg >> GPIO_BIT(offset)) & 0x01;

Ditto.

...

> +	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,

Indentation issue...

Check entire code for this.

...

It's a big driver and you have a lot of different kinds of problems.
One of them is RT kernel support. You have an IRQ chip implementation
here, can it be used in RT?
If so, consider different type of lock.

Also use cleanup.h.

...

> +static const struct of_device_id npcm_sgpio_of_table[] = {
> +	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm750_sgpio_pdata, },
> +	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata, },
> +	{}
> +};

> +

Redundant blank line.

> +MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);

...

> +	rc = device_property_read_u32(&pdev->dev, "nuvoton,input-ngpios", &nin_gpios);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Could not read ngpios property\n");
> +		return -EINVAL;

		return dev_err_probe();

> +	}

...

> +	rc = device_property_read_u32(&pdev->dev, "nuvoton,output-ngpios", &nout_gpios);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Could not read ngpios property\n");
> +		return -EINVAL;

Ditto. And so on for the entire ->probe() stage.

> +	}

...

> +	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(gpio->pclk)) {
> +		dev_err(&pdev->dev, "Could not get pclk\n");
> +		return PTR_ERR(gpio->pclk);

Not using dev_err_probe() will spam the log.

> +	}

...

> +	gpio->chip.request = NULL;
> +	gpio->chip.free = NULL;
> +	gpio->chip.set_config = NULL;

Redundant assignments.

...

> +	dev_info(&pdev->dev, "NPCM: SGPIO module is ready\n");

Useless noisy message.

...

> +

Unneeded blank line.

> +module_platform_driver(npcm_sgpio_driver);

-- 
With Best Regards,
Andy Shevchenko



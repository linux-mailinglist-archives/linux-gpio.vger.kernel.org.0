Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761D42CBA0E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 11:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgLBKDr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 05:03:47 -0500
Received: from mga06.intel.com ([134.134.136.31]:1618 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728459AbgLBKDq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Dec 2020 05:03:46 -0500
IronPort-SDR: angwQw4erWzHOSU1JuRt9Ofti2/5DspywMFAB1l2YRFERl6xdTku3aGocoJOJCM7/98adi/7E5
 HzqGzooja/AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234597640"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="234597640"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 02:03:06 -0800
IronPort-SDR: eAiAzJHSnbXmVT2WuyLLmJcRQlcHNGWfNOgfRroj4SgaQ4SmowaSkzWF2Vtus1jxVInR+A95+q
 bNIghGoZ+oxA==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="335498293"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 02:03:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kkOzV-00BU0V-MK; Wed, 02 Dec 2020 12:04:05 +0200
Date:   Wed, 2 Dec 2020 12:04:05 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxarm@huawei.com
Subject: Re: [PATCH v1 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
Message-ID: <20201202100405.GY4077@smile.fi.intel.com>
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
 <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 02, 2020 at 05:32:21PM +0800, Luo Jiaxing wrote:
> This GPIO driver is for HiSilicon's ARM SoC.
> 
> HiSilicon's GPIO controller support double-edge interrupt and multi-core
> concurrent access.
> 
> ACPI table example for this GPIO controller:
> Device (GPO0)
> {
> 	Name (_HID, "HISI0184")
> 	Device (PRTA)
> 	{
> 		Name (_ADR, Zero)
> 		Name (_UID, Zero)
> 		Name (_DSD, Package (0x01)
> 		{
> 			Package (0x02)
> 			{
> 				"hisi-ngpio",

Can it be standard property?
Please, fix firmware.

> 				0x20
> 			}
> 		})
> 	}
> }

...

> +config GPIO_HISI
> +	tristate "HISILICON GPIO controller driver"

> +	depends on (ARM64 && ACPI) || COMPILE_TEST

This is wrong. (Homework to understand why. Also see below)

> +	select GPIO_GENERIC
> +	select GENERIC_IRQ_CHIP
> +	help
> +	  Say Y or M here to build support for the HiSilicon GPIO controller driver
> +	  GPIO block.
> +	  This controller support double-edge interrupt and multi-core concurrent
> +	  access.

No module name?

...

> +/*
> + * Copyright (c) 2020 HiSilicon Limited.
> + */

One line.

...

> +#include <linux/acpi.h>

Don't see user of it (but see above and below as well).
At the same time missed mod_devicetable.h.

> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>

...

> +#include "gpiolib.h"

> +#include "gpiolib-acpi.h"

Any user of this?

...

> +#define HISI_GPIO_SWPORT_DR_SET_WX	0x0
	...
> +#define HISI_GPIO_INT_DEDGE_SET		0xb0
	...
> +#define HISI_GPIO_REG_MAX	0x100

Use fixed width for register offsets, like:
	0x000
	...
	0x0b0
	...
	0x100

...

> +struct hisi_gpio {
> +	struct device		*dev;
> +	void __iomem		*reg_base;
> +	unsigned int		pin_num;

> +	struct gpio_chip	chip;

Moving this to be a first member of the struct will make corresponding
container_of() no-op.

> +	struct irq_chip		irq_chip;
> +	int			irq;
> +};

...

> +	unsigned long mask = BIT(off);

No need to have temporary variable. Use directly BIT(off) which fits into 80.

> +
> +	if (debounce)
> +		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_SET_WX, mask);
> +	else
> +		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_CLR_WX, mask);

...

> +	switch (config_para) {
> +	case PIN_CONFIG_INPUT_DEBOUNCE:
> +		config_arg = pinconf_to_config_argument(config);
> +		hisi_gpio_set_debounce(chip, offset, config_arg);

> +		break;

Move...

> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;

...this above.

...

> +	/* Return 0 if output, 1 if input */

Useless comment.

...

> +static int hisi_gpio_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +	unsigned int mask = BIT(irqd_to_hwirq(d));
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_SET, mask);
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_SET_WX, mask);
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_SET_WX, mask);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_SET_WX, mask);
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_CLR_WX, mask);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_CLR_WX, mask);
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_SET_WX, mask);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_CLR_WX, mask);
> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_CLR_WX, mask);
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * The dual-edge interrupt and other interrupt's registers do not
> +	 * take effect at the same time. The registers of the two-edge
> +	 * interrupts have higher priorities, the configuration of
> +	 * the dual-edge interrupts must be disabled before the configuration
> +	 * of other kind of interrupts.
> +	 */

This comment sounds like below should be moved before switch-case. Can you elaborate?

> +	if (type != IRQ_TYPE_EDGE_BOTH) {
> +		unsigned int both = hisi_gpio_read_reg(chip, HISI_GPIO_INT_DEDGE_ST);
> +
> +		if (both & mask)
> +			hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_CLR, mask);
> +	}
> +
> +	if (type & IRQ_TYPE_LEVEL_MASK)
> +		irq_set_handler_locked(d, handle_level_irq);
> +	else if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_handler_locked(d, handle_edge_irq);
> +
> +	return 0;
> +}

...

> +	while (irq_msk) {
> +		int hwirq = fls(irq_msk) - 1;

> +		irq_msk &= ~BIT(hwirq);
> +	}

NIH of for_each_set_bit().

...

> +	res = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, HISI_GPIO_REG_SIZE, dat, set,
> +			 clr, NULL, NULL, 0);
> +	if (res) {
> +		dev_err(dev, "failed to init\n");
> +		return res;
> +	}

Wondering if you can use regmap GPIO.

...

> +static struct platform_driver hisi_gpio_driver = {
> +	.driver		= {
> +		.name	= HISI_GPIO_DRIVER_NAME,

> +		.acpi_match_table = ACPI_PTR(hisi_gpio_acpi_match),

This is wrong. If you use COMPILE_TEST the ACPI_PTR in !ACPI case is no op.
Compiler will warn you about unused variable. Have you compile tested it in
such conditions?

Hint: remove ACPI_PTR(). In 99% this macro shouldn't be used.

> +	},
> +	.probe		= hisi_gpio_probe,
> +};

> +

Redundant blank line.

> +module_platform_driver(hisi_gpio_driver);

-- 
With Best Regards,
Andy Shevchenko



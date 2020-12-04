Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B3C2CEB1A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 10:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgLDJjp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 04:39:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9380 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729610AbgLDJjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 04:39:44 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CnSLz0Ww3z78TC;
        Fri,  4 Dec 2020 17:38:35 +0800 (CST)
Received: from [127.0.0.1] (10.57.22.126) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 17:38:55 +0800
Subject: Re: [PATCH v1 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
 <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
 <20201202100405.GY4077@smile.fi.intel.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <492f6852-48f0-891f-c017-65d3562144a6@huawei.com>
Date:   Fri, 4 Dec 2020 17:38:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20201202100405.GY4077@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.57.22.126]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

On 2020/12/2 18:04, Andy Shevchenko wrote:
> On Wed, Dec 02, 2020 at 05:32:21PM +0800, Luo Jiaxing wrote:
>> This GPIO driver is for HiSilicon's ARM SoC.
>>
>> HiSilicon's GPIO controller support double-edge interrupt and multi-core
>> concurrent access.
>>
>> ACPI table example for this GPIO controller:
>> Device (GPO0)
>> {
>> 	Name (_HID, "HISI0184")
>> 	Device (PRTA)
>> 	{
>> 		Name (_ADR, Zero)
>> 		Name (_UID, Zero)
>> 		Name (_DSD, Package (0x01)
>> 		{
>> 			Package (0x02)
>> 			{
>> 				"hisi-ngpio",
> Can it be standard property?


sure, I think you mean that "ngpios" should be used here.


> Please, fix firmware.
>
>> 				0x20
>> 			}
>> 		})
>> 	}
>> }
> ...
>
>> +config GPIO_HISI
>> +	tristate "HISILICON GPIO controller driver"
>> +	depends on (ARM64 && ACPI) || COMPILE_TEST
> This is wrong. (Homework to understand why. Also see below)]


I think it should be

depends on (ARM64 || COMPILE_TEST) && ACPI


>
>> +	select GPIO_GENERIC
>> +	select GENERIC_IRQ_CHIP
>> +	help
>> +	  Say Y or M here to build support for the HiSilicon GPIO controller driver
>> +	  GPIO block.
>> +	  This controller support double-edge interrupt and multi-core concurrent
>> +	  access.
> No module name?


sorry, I didn't get what you mean. What module name should I add here?


>
> ...
>
>> +/*
>> + * Copyright (c) 2020 HiSilicon Limited.
>> + */
> One line.


ok


>
> ...
>
>> +#include <linux/acpi.h>
> Don't see user of it (but see above and below as well).
> At the same time missed mod_devicetable.h.


sure, let me check it.


>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
> ...
>
>> +#include "gpiolib.h"
>> +#include "gpiolib-acpi.h"
> Any user of this?


This should be deleted, I used to use 
acpi_gpiochip_request_interrupts(), but delete it later.


>
> ...
>
>> +#define HISI_GPIO_SWPORT_DR_SET_WX	0x0
> 	...
>> +#define HISI_GPIO_INT_DEDGE_SET		0xb0
> 	...
>> +#define HISI_GPIO_REG_MAX	0x100
> Use fixed width for register offsets, like:
> 	0x000
> 	...
> 	0x0b0
> 	...
> 	0x100


ok


> ...
>
>> +struct hisi_gpio {
>> +	struct device		*dev;
>> +	void __iomem		*reg_base;
>> +	unsigned int		pin_num;
>> +	struct gpio_chip	chip;
> Moving this to be a first member of the struct will make corresponding
> container_of() no-op.


sure


>
>> +	struct irq_chip		irq_chip;
>> +	int			irq;
>> +};
> ...
>
>> +	unsigned long mask = BIT(off);
> No need to have temporary variable. Use directly BIT(off) which fits into 80.


sure


>> +
>> +	if (debounce)
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_SET_WX, mask);
>> +	else
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_CLR_WX, mask);
> ...
>
>> +	switch (config_para) {
>> +	case PIN_CONFIG_INPUT_DEBOUNCE:
>> +		config_arg = pinconf_to_config_argument(config);
>> +		hisi_gpio_set_debounce(chip, offset, config_arg);
>> +		break;
> Move...
>
>> +	default:
>> +		return -ENOTSUPP;
>> +	}
>> +
>> +	return 0;
> ...this above.


Sorry, what do you mean by Move ... this above?


>
> ...
>
>> +	/* Return 0 if output, 1 if input */
> Useless comment.


will be deleted


>
> ...
>
>> +static int hisi_gpio_irq_set_type(struct irq_data *d, u32 type)
>> +{
>> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>> +	unsigned int mask = BIT(irqd_to_hwirq(d));
>> +
>> +	switch (type) {
>> +	case IRQ_TYPE_EDGE_BOTH:
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_SET, mask);
>> +		break;
>> +	case IRQ_TYPE_EDGE_RISING:
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_SET_WX, mask);
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_SET_WX, mask);
>> +		break;
>> +	case IRQ_TYPE_EDGE_FALLING:
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_SET_WX, mask);
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_CLR_WX, mask);
>> +		break;
>> +	case IRQ_TYPE_LEVEL_HIGH:
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_CLR_WX, mask);
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_SET_WX, mask);
>> +		break;
>> +	case IRQ_TYPE_LEVEL_LOW:
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_CLR_WX, mask);
>> +		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_CLR_WX, mask);
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * The dual-edge interrupt and other interrupt's registers do not
>> +	 * take effect at the same time. The registers of the two-edge
>> +	 * interrupts have higher priorities, the configuration of
>> +	 * the dual-edge interrupts must be disabled before the configuration
>> +	 * of other kind of interrupts.
>> +	 */
> This comment sounds like below should be moved before switch-case. Can you elaborate?


Our GPIO controller uses two separate registers to enable/disable the 
double-edge interrupt,

and once enable double-edge, the setting of edge and polarity register() 
will be ignored by the hardware.

Therefore, each time we update trigger type, an extra check is required: 
if the interrupt is not double-edges, ensure that it is disabled.


>
>> +	if (type != IRQ_TYPE_EDGE_BOTH) {
>> +		unsigned int both = hisi_gpio_read_reg(chip, HISI_GPIO_INT_DEDGE_ST);
>> +
>> +		if (both & mask)
>> +			hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_CLR, mask);
>> +	}
>> +
>> +	if (type & IRQ_TYPE_LEVEL_MASK)
>> +		irq_set_handler_locked(d, handle_level_irq);
>> +	else if (type & IRQ_TYPE_EDGE_BOTH)
>> +		irq_set_handler_locked(d, handle_edge_irq);
>> +
>> +	return 0;
>> +}
> ...
>
>> +	while (irq_msk) {
>> +		int hwirq = fls(irq_msk) - 1;
>> +		irq_msk &= ~BIT(hwirq);
>> +	}
> NIH of for_each_set_bit().


sure,  it's better than fls


>
> ...
>
>> +	res = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, HISI_GPIO_REG_SIZE, dat, set,
>> +			 clr, NULL, NULL, 0);
>> +	if (res) {
>> +		dev_err(dev, "failed to init\n");
>> +		return res;
>> +	}
> Wondering if you can use regmap GPIO.


I looked at gpio-regmap.c, which is a newly uploaded feature. I think 
it's good, but I'd rather keep the current design.

Because it means my code needs to be modified and re-tested, this will 
take a while, but the actual business needs will not allow it.


>
> ...
>
>> +static struct platform_driver hisi_gpio_driver = {
>> +	.driver		= {
>> +		.name	= HISI_GPIO_DRIVER_NAME,
>> +		.acpi_match_table = ACPI_PTR(hisi_gpio_acpi_match),
> This is wrong. If you use COMPILE_TEST the ACPI_PTR in !ACPI case is no op.
> Compiler will warn you about unused variable. Have you compile tested it in
> such conditions?
>
> Hint: remove ACPI_PTR(). In 99% this macro shouldn't be used.


sure


>
>> +	},
>> +	.probe		= hisi_gpio_probe,
>> +};
>> +
> Redundant blank line.


sure


Thanks

Jiaxing


>
>> +module_platform_driver(hisi_gpio_driver);


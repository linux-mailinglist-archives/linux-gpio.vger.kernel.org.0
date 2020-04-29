Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D441BDFE4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 16:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgD2OCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 10:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726861AbgD2OCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 10:02:46 -0400
X-Greylist: delayed 356 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Apr 2020 07:02:45 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E37FBC03C1AD;
        Wed, 29 Apr 2020 07:02:45 -0700 (PDT)
Received: from [192.168.178.106] (pD95EF83B.dip0.t-ipconnect.de [217.94.248.59])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 28621401E5C;
        Wed, 29 Apr 2020 13:54:14 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 2/2] gpio: xilinx: Add irq support to the driver
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        git@xilinx.com
References: <1581937039-12964-1-git-send-email-srinivas.neeli@xilinx.com>
 <1581937039-12964-2-git-send-email-srinivas.neeli@xilinx.com>
Message-ID: <0a640ab8-37db-6dea-2909-3eebbb3f2519@zonque.org>
Date:   Wed, 29 Apr 2020 15:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1581937039-12964-2-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Srinivas,

Thanks for these patches. We're using them on a custom board, and I have
some remarks as they didn't work as intended. See below.


On 2/17/20 11:57 AM, Srinivas Neeli wrote:
> Allocate single chip for both channels.
> Add irq support to the driver.
> Supporting rising edge interrupts and in cascade mode supporting
> first channel for interrupts on 32bit machines.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/gpio/gpio-xilinx.c | 233 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 232 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 26753ae58295..f6dd316b2c62 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c

[...]

>  /**
> + * xgpiops_irq_mask - Write the specified signal of the GPIO device.
> + * @irq_data: per irq and chip data passed down to chip functions
> + */
> +static void xgpio_irq_mask(struct irq_data *irq_data)
> +{
> +	unsigned long flags;
> +	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
> +	u32 offset = irq_data->irq - chip->irq_base;
> +	u32 temp;
> +	s32 val;
> +	int index = xgpio_index(chip, 0);
> +
> +	pr_debug("%s: Disable %d irq, irq_enable_mask 0x%x\n",
> +		 __func__, offset, chip->irq_enable);
> +
> +	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> +
> +	chip->irq_enable &= ~BIT(offset);
> +
> +	if (!chip->irq_enable) {
> +		/* Enable per channel interrupt */
> +		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
> +		val = offset - chip->gpio_width[0] + 1;
> +		if (val > 0)
> +			temp &= 1;
> +		else
> +			temp &= 2;


This is a bit confusing. Why not write

  if (offset <= chip->gpio_width[0])
	temp &= 1;
  else
        temp &= 2;

?

> +		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
> +
> +		/* Disable global interrupt if channel interrupts are unused */
> +		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);

You know that interrupts are unused when you get here, right? Why this
extra check?

> +		if (!temp)
> +			xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET,
> +				       ~XGPIO_GIER_IE);
> +	}
> +	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +}
> +
> +/**
> + * xgpio_irq_unmask - Write the specified signal of the GPIO device.
> + * @irq_data: per irq and chip data passed down to chip functions
> + */
> +static void xgpio_irq_unmask(struct irq_data *irq_data)
> +{
> +	unsigned long flags;
> +	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
> +	u32 offset = irq_data->irq - chip->irq_base;
> +	u32 temp;
> +	s32 val;
> +	int index = xgpio_index(chip, 0);
> +
> +	pr_debug("%s: Enable %d irq, irq_enable_mask 0x%x\n",
> +		 __func__, offset, chip->irq_enable);
> +
> +	/* Setup pin as input */
> +	xgpio_dir_in(&chip->gc, offset);
> +
> +	spin_lock_irqsave(&chip->gpio_lock[index], flags);
> +
> +	chip->irq_enable |= BIT(offset);
> +
> +	if (chip->irq_enable) {

As you set a bit in the instruction above, this condition will always be
true. So I guess the check can be omitted.

> +		/* Enable per channel interrupt */
> +		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
> +		val = offset - (chip->gpio_width[0] - 1);

This is different from the the statement in the mask function, but it
can be simplified as noted above.

> +		if (val > 0)
> +			temp |= 2;
> +		else
> +			temp |= 1;
> +		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
> +
> +		/* Enable global interrupts */
> +		xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER_IE);
> +	}
> +
> +	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> +}

[...]

> +/**
> + * xgpio_irqhandler - Gpio interrupt service routine
> + * @desc: Pointer to interrupt description
> + */
> +static void xgpio_irqhandler(struct irq_desc *desc)
> +{
> +	unsigned int irq = irq_desc_get_irq(desc);
> +	struct xgpio_instance *chip = (struct xgpio_instance *)
> +		irq_get_handler_data(irq);
> +	struct irq_chip *irqchip = irq_desc_get_chip(desc);
> +	u32 offset, status, channel = 1;
> +	unsigned long val;
> +
> +	chained_irq_enter(irqchip, desc);
> +
> +	val = xgpio_readreg(chip->regs);
> +	if (!val) {
> +		channel = 2;
> +		val = xgpio_readreg(chip->regs + XGPIO_CHANNEL_OFFSET);
> +		val = val << chip->gpio_width[0];
> +	}
> +
> +	/* Only rising edge is supported */
> +	val &= chip->irq_enable;
> +	for_each_set_bit(offset, &val, chip->gc.ngpio) {
> +		generic_handle_irq(chip->irq_base + offset);

This needs to include irq_find_mapping(chip->irq_domain, gpio).

> +	}
> +
> +	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);

The value assigned here is not used. Typo?

> +	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, channel);

This function causes issues of general IRQ handling that makes the
entire system deadlock for reasons I don't fully grok. I changed the
logic to the following to make it work:

1. Read IPISR
2. Write the read value back to IPISR
3. Depending on the value of IPISR, read the state of either channel 1
   or 2
4. chained_irq_enter()
5. Iterate over bits and call generic_handle_irq()
6. chained_irq_exit()

> +
> +	chained_irq_exit(irqchip, desc);
> +}
> +
> +static struct lock_class_key gpio_lock_class;
> +static struct lock_class_key gpio_request_class;
> +
> +/**
> + * xgpio_irq_setup - Allocate irq for gpio and setup appropriate functions
> + * @np: Device node of the GPIO chip
> + * @chip: Pointer to private gpio channel structure
> + *
> + * Return:
> + * 0 if success, otherwise -1
> + */
> +static int xgpio_irq_setup(struct device_node *np, struct xgpio_instance *chip)
> +{
> +	u32 pin_num;
> +	struct resource res;
> +	int ret = of_irq_to_resource(np, 0, &res);
> +
> +	if (ret <= 0) {
> +		pr_info("GPIO IRQ not connected\n");
> +		return 0;
> +	}
> +
> +	chip->gc.to_irq = xgpio_to_irq;
> +	chip->irq_base = irq_alloc_descs(-1, 0, chip->gc.ngpio, 0);

This should use the devm_ variant to automatically free the resources.

> +	if (chip->irq_base < 0) {
> +		pr_err("Couldn't allocate IRQ numbers\n");
> +		return -1;
> +	}
> +	chip->irq_domain = irq_domain_add_legacy(np, chip->gc.ngpio,
> +						 chip->irq_base, 0,
> +						 &irq_domain_simple_ops, NULL);

This can fail, so the return value should be checked for NULL.

> +	/*
> +	 * set the irq chip, handler and irq chip data for callbacks for
> +	 * each pin
> +	 */
> +	for (pin_num = 0; pin_num < chip->gc.ngpio; pin_num++) {
> +		u32 gpio_irq = irq_find_mapping(chip->irq_domain, pin_num);
> +
> +		irq_set_lockdep_class(gpio_irq, &gpio_lock_class,
> +				      &gpio_request_class);
> +		pr_debug("IRQ Base: %d, Pin %d = IRQ %d\n",
> +			 chip->irq_base, pin_num, gpio_irq);
> +		irq_set_chip_and_handler(gpio_irq, &xgpio_irqchip,
> +					 handle_simple_irq);
> +		irq_set_chip_data(gpio_irq, (void *)chip);
> +	}
> +	irq_set_handler_data(res.start, (void *)chip);
> +	irq_set_chained_handler(res.start, xgpio_irqhandler);

I guess all this can be achieved by setting chip->gc.irq* and let the
GPIO core handle the IRQ chip allocation and setup. There are some
examples in Documentation/driver-api/gpio/driver.rst.

I'm happy to test the next iteration of these patches.


Thanks,
Daniel

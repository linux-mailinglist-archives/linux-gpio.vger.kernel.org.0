Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D4822D026
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 23:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGXVCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 17:02:46 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:40022 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgGXVCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 17:02:46 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 06OL2RfA017602
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Jul 2020 15:02:27 -0600 (CST)
Received: from [192.168.234.15] (sed198n237.sedsystems.ca [198.169.180.237])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 06OL2QDV063279
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Fri, 24 Jul 2020 15:02:26 -0600
Subject: Re: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        git@xilinx.com
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
 <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com>
 <CAHp75Vd7BU5DYqyQFGfBtKrb6jWFEQjMCu2MOa_7M8XYkt6BFA@mail.gmail.com>
From:   Robert Hancock <hancock@sedsystems.ca>
Message-ID: <8c4d01b4-ff14-9807-303e-2e2571af12e2@sedsystems.ca>
Date:   Fri, 24 Jul 2020 15:02:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd7BU5DYqyQFGfBtKrb6jWFEQjMCu2MOa_7M8XYkt6BFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-07-23 12:03 p.m., Andy Shevchenko wrote:
>> +/**
>> + * xgpio_xlate - Translate gpio_spec to the GPIO number and flags
>> + * @gc: Pointer to gpio_chip device structure.
>> + * @gpiospec:  gpio specifier as found in the device tree
>> + * @flags: A flags pointer based on binding
>> + *
>> + * Return:
>> + * irq number otherwise -EINVAL
>> + */
>> +static int xgpio_xlate(struct gpio_chip *gc,
>> +                      const struct of_phandle_args *gpiospec, u32 *flags)
>> +{
>> +       if (gc->of_gpio_n_cells < 2) {
>> +               WARN_ON(1);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
>> +               return -EINVAL;
>> +
>> +       if (gpiospec->args[0] >= gc->ngpio)
>> +               return -EINVAL;
>> +
>> +       if (flags)
>> +               *flags = gpiospec->args[1];
>> +
>> +       return gpiospec->args[0];
>> +}
> 
> This looks like a very standart xlate function for GPIO. Why do you
> need to open-code it?

Indeed, this seems the same as the of_gpio_simple_xlate callback which 
is used if no xlate callback is specified, so I'm not sure why this is 
necessary?

> 
> ...
> 
>> +/**
>> + * xgpio_irq_ack - Acknowledge a child GPIO interrupt.
> 
>> + * This currently does nothing, but irq_ack is unconditionally called by
>> + * handle_edge_irq and therefore must be defined.
> 
> This should go after parameter description(s).
> 
>> + * @irq_data: per irq and chip data passed down to chip functions
>> + */
> 
> ...
> 
>>   /**
>> + * xgpio_irq_mask - Write the specified signal of the GPIO device.
>> + * @irq_data: per irq and chip data passed down to chip functions
> 
> In all comments irq -> IRQ.
> 
>> + */
>> +static void xgpio_irq_mask(struct irq_data *irq_data)
>> +{
>> +       unsigned long flags;
>> +       struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
>> +       int irq_offset = irqd_to_hwirq(irq_data);
>> +       int index = xgpio_index(chip, irq_offset);
>> +       int offset = xgpio_offset(chip, irq_offset);
>> +
>> +       spin_lock_irqsave(&chip->gpio_lock, flags);
>> +
> 
>> +       chip->irq_enable[index] &= ~BIT(offset);
> 
> If you convert your data structure to use bitmaps (and respective API) like
> 
> #define XILINX_NGPIOS  64
> ...
>    DECLARE_BITMAP(irq_enable, XILINX_NGPIOS);
> ...
> 
> it will make code better to read and understand. For example, here it
> will be just
> __clear_bit(offset, chip->irq_enable);
> 
>> +       dev_dbg(chip->gc.parent, "Disable %d irq, irq_enable_mask 0x%x\n",
>> +               irq_offset, chip->irq_enable[index]);
> 
> Under spin lock?! Hmm...
> 
>> +       if (!chip->irq_enable[index]) {
>> +               /* Disable per channel interrupt */
>> +               u32 temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
>> +
>> +               temp &= ~BIT(index);
>> +               xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
>> +       }
>> +       spin_unlock_irqrestore(&chip->gpio_lock, flags);
>> +}
> 
> ...
> 
>> +       for (index = 0; index < num_channels; index++) {
>> +               if ((status & BIT(index))) {
> 
> If gpio_width is the same among banks, you can use for_each_set_bit()
> here as well.
> 
> ...
> 
>> +                       for_each_set_bit(bit, &all_events, 32) {
>> +                               generic_handle_irq(irq_find_mapping
>> +                                       (chip->gc.irq.domain, offset + bit));
> 
> Strange indentation. Maybe a temporary variable helps?
> 
> ...
> 
>> +       chip->irq = platform_get_irq_optional(pdev, 0);
>> +       if (chip->irq <= 0) {
>> +               dev_info(&pdev->dev, "GPIO IRQ not set\n");
> 
> Why do you need an optional variant if you print an error anyway?
> 
>> +       } else {
> 
> 
> ...
> 
>> +               chip->gc.irq.parents = (unsigned int *)&chip->irq;
>> +               chip->gc.irq.num_parents = 1;
> 
> Current pattern is to use devm_kcalloc() for it (Linus has plans to
> simplify this in the future and this will help him to find what
> patterns are being used)
> 

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock@sedsystems.ca

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5AD2D3D35
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 09:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgLIIT0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 03:19:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9561 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgLIITZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 03:19:25 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrVKj1lJ6zM10T;
        Wed,  9 Dec 2020 16:18:01 +0800 (CST)
Received: from [127.0.0.1] (10.57.22.126) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 16:18:35 +0800
Subject: Re: [PATCH v1 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
 <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
 <CACRpkdbodato7AL4xv-oEO9+-Mo9fDaH+jZh+6T=3urE0tbULw@mail.gmail.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <5955bd97-046c-8ac3-f66e-ea967e8f9128@huawei.com>
Date:   Wed, 9 Dec 2020 16:18:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdbodato7AL4xv-oEO9+-Mo9fDaH+jZh+6T=3urE0tbULw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.57.22.126]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/7 7:12, Linus Walleij wrote:
> Hi Luo!
>
> thanks for your patch! I see that Andy already provided a crowd
> of comments, here are some more!
>
> On Wed, Dec 2, 2020 at 10:32 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:
>
>> +config GPIO_HISI
>> +       tristate "HISILICON GPIO controller driver"
>> +       depends on (ARM64 && ACPI) || COMPILE_TEST
>> +       select GPIO_GENERIC
> Thanks for using the generic driver!
>
>> +#include <linux/acpi.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +
>> +#include "gpiolib.h"
>> +#include "gpiolib-acpi.h"
> No GPIO drivers should include these files. If you need
> gpiolib.h then describe in a comment right above the include
> why you have to do this.
>
> I don't know about gpiolig-acpi.h but not unless  Andy
> says it is OK it is not OK.


sure


>
>> +#define HISI_GPIO_SWPORT_DR_SET_WX     0x0
>> +#define HISI_GPIO_SWPORT_DR_CLR_WX     0x4
>> +#define HISI_GPIO_SWPORT_DDR_SET_WX    0x10
>> +#define HISI_GPIO_SWPORT_DDR_CLR_WX    0x14
>> +#define HISI_GPIO_SWPORT_DDR_ST_WX     0x18
>> +#define HISI_GPIO_INTEN_SET_WX         0x20
>> +#define HISI_GPIO_INTEN_CLR_WX         0x24
>> +#define HISI_GPIO_INTMASK_SET_WX       0x30
>> +#define HISI_GPIO_INTMASK_CLR_WX       0x34
>> +#define HISI_GPIO_INTTYPE_EDGE_SET_WX  0x40
>> +#define HISI_GPIO_INTTYPE_EDGE_CLR_WX  0x44
>> +#define HISI_GPIO_INT_POLARITY_SET_WX  0x50
>> +#define HISI_GPIO_INT_POLARITY_CLR_WX  0x54
>> +#define HISI_GPIO_DEBOUNCE_SET_WX      0x60
>> +#define HISI_GPIO_DEBOUNCE_CLR_WX      0x64
>> +#define HISI_GPIO_INTSTATUS_WX         0x70
>> +#define HISI_GPIO_PORTA_EOI_WX         0x78
>> +#define HISI_GPIO_EXT_PORT_WX          0x80
>> +#define HISI_GPIO_INTCOMB_MASK_WX      0xa0
>> +#define HISI_GPIO_INT_DEDGE_SET                0xb0
>> +#define HISI_GPIO_INT_DEDGE_CLR                0xb4
>> +#define HISI_GPIO_INT_DEDGE_ST         0xb8
> Nice idea with the double edge register! Hats off to the hardware
> engineer who created this simple yet powerful GPIO.
>
>> +#define HISI_GPIO_REG_SIZE     0x4
>> +#define HISI_GPIO_REG_MAX      0x100
>> +#define HISI_GPIO_PIN_NUM_MAX 32
> This seems like a bit surplus definitions, I prefer to just inline
> these. Some use cases will go away after you start using
> bgpio_init().


sure, will be set as inline


>
>> +struct hisi_gpio {
>> +       struct device           *dev;
>> +       void __iomem            *reg_base;
>> +       unsigned int            pin_num;
> I prefer "line_num", the reason I usually use the term "lines"
> rather than "pins" is that some GPIO lines are internal in
> chips and do not always go out to external pins.


yes, you are right.


>
>> +       struct gpio_chip        chip;
>> +       struct irq_chip         irq_chip;
>> +       int                     irq;
> Do you need to keep irq around in the state?


irq is used in several functions, such as hisi_gpio_init_irq and 
hisi_gpio_probe.

Although these functions can be combined, but the readability of the 
logic is affected.

Therefore, Irq needs to be saved.


>
>> +static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
>> +                                    unsigned int off)
>> +{
>> +       struct hisi_gpio *hisi_gpio =
>> +                       container_of(chip, struct hisi_gpio, chip);
>> +
>> +       return chip->read_reg(hisi_gpio->reg_base + off);
>> +}
>> +
>> +static inline void hisi_gpio_write_reg(struct gpio_chip *chip,
>> +                                      unsigned int off, u32 val)
>> +{
>> +       struct hisi_gpio *hisi_gpio =
>> +                       container_of(chip, struct hisi_gpio, chip);
>> +
>> +       chip->write_reg(hisi_gpio->reg_base + off, val);
>> +}
> OK it is a bit of reusing the register accessors inside the
> GPIO chip generic MMIO abstraction, but to me it is really
> better if you just address the registers directly.
> The indirections through read_reg/write_reg doesn't
> really buy you anything.


yes, you are right, I can directly use readl() and writel() here


>
>> +static void hisi_gpio_set_debounce(struct gpio_chip *chip, unsigned int off,
>> +                                  u32 debounce)
>> +{
>> +       unsigned long mask = BIT(off);
>> +
>> +       if (debounce)
>> +               hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_SET_WX, mask);
>> +       else
>> +               hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_CLR_WX, mask);
>> +}
> So debounce is just on/off? No ability to set "how much" or a timer?
> Someone must be guessing inside the block that a certain number
> of ms is perfect(TM) debouncing or is there a register for this that
> you are not showing us? Like register 0x68 or 0x6c...


Yes. In our hardware design, debounce timer are fixed as several clock 
cycles。

and cannot be modified by the driver.


The 0x68 register is a status register, which is used to query whether 
debounce is enabled.

No drivers check status of debounce, so I didn't show it.


>
>> +static int hisi_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>> +static int hisi_gpio_direction_output(struct gpio_chip *chip,
>> +                                     unsigned int gpio,
>> +                                     int val)
>> +static int hisi_gpio_direction_input(struct gpio_chip *chip,
>> +                                    unsigned int gpio)
> These get replaced by the appropriate parameters to bgpio_init().
> Read the doc in gpio-mmci.c above the function
> bgpio_init() for help. If you still can't figure it out, ask and
> describe your problem and we'll hash it out.


sure, will delete these three function.


>
>> +       /*
>> +        * The dual-edge interrupt and other interrupt's registers do not
>> +        * take effect at the same time. The registers of the two-edge
>> +        * interrupts have higher priorities, the configuration of
>> +        * the dual-edge interrupts must be disabled before the configuration
>> +        * of other kind of interrupts.
>> +        */
>> +       if (type != IRQ_TYPE_EDGE_BOTH) {
>> +               unsigned int both = hisi_gpio_read_reg(chip, HISI_GPIO_INT_DEDGE_ST);
>> +
>> +               if (both & mask)
>> +                       hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_CLR, mask);
>> +       }
> Nice with this comment and overall the IRQ code looks very
> good. Nice job!
>
>> +static void hisi_gpio_irq_enable(struct irq_data *d)
>> +{
>> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>> +
>> +       hisi_gpio_irq_clr_mask(d);
>> +       hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_SET_WX, BIT(irqd_to_hwirq(d)));
>> +}
>> +
>> +static void hisi_gpio_irq_disable(struct irq_data *d)
>> +{
>> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>> +
>> +       hisi_gpio_irq_set_mask(d);
>> +       hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_CLR_WX, BIT(irqd_to_hwirq(d)));
>> +}
> Interesting with a GPIO hardware that both as enable and mask
> bits. I can't see why, usually they just have masks but I suppose
> there is some reason.


I see gpio-dwapb.c distinguishes between enable and mask too.

In my opinion, enable indicates that the user uses the GPIO line as the 
interrupt trigger source,

and mask indicates that the user does not want to see an interrupts for 
a while.

The difference between the two types of flag is that interrupts 
generated during masking are recorded but not lost,

however, if interrupts are disabled, interrupts will lost.


>
>> +static void hisi_gpio_irq_handler(struct irq_desc *desc)
>> +{
>> +       struct hisi_gpio *hisi_gpio = irq_desc_get_handler_data(desc);
>> +       u32 irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip,
>> +                                        HISI_GPIO_INTSTATUS_WX);
>> +       struct irq_chip *irq_c = irq_desc_get_chip(desc);
>> +
>> +       chained_irq_enter(irq_c, desc);
>> +       while (irq_msk) {
>> +               int hwirq = fls(irq_msk) - 1;
>> +               int gpio_irq = irq_find_mapping(hisi_gpio->chip.irq.domain,
>> +                                               hwirq);
>> +
>> +               generic_handle_irq(gpio_irq);
>> +               irq_msk &= ~BIT(hwirq);
>> +       }
> What about just:
>
>       for_each_set_bit(hwirq, &irq_msk, gc->ngpio)
>
> generic_handle_irq(irq_find_mapping(hisi_gpio->chip.irq.domain,
>                                                              hwirq));


sure


>
>> +       device_for_each_child_node(dev, fwnode)  {
>> +               if (fwnode_property_read_u32(fwnode, "hisi-ngpio",
>> +                                            &hisi_gpio->pin_num)) {
>> +                       dev_err(dev,
>> +                               "failed to get number of gpios for port%d and use default value instead\n",
>> +                               idx);
>> +                       hisi_gpio->pin_num = HISI_GPIO_PIN_NUM_MAX;
>> +               }
> Since the registers are only 32 bits suppose this should emit a
> fat warning if line_num is > 32.


ok


>
>> +       dat = hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX;
>> +       set = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX;
>> +       clr = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX;
>> +
>> +       res = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, HISI_GPIO_REG_SIZE, dat, set,
>> +                        clr, NULL, NULL, 0);
> That's a lot of variables for my taste, I usually just pass the registers
> to the bgpio_init() call directly, split across a few lines, but it is a
> matter of taste. Make sure you get the direction setting to be handled
> by gpio-mmio as well as described above.


ok, you're recommending a more tidy way. I'll fix it.


>
>> +       hisi_gpio->chip.direction_output = hisi_gpio_direction_output;
>> +       hisi_gpio->chip.direction_input = hisi_gpio_direction_input;
>> +       hisi_gpio->chip.get_direction = hisi_gpio_get_direction;
> So these should be handled by generic GPIO.


sure


Thanks

Jiaxing


>
>> +       hisi_gpio->chip.set_config = hisi_gpio_set_config;
>> +       hisi_gpio->chip.ngpio = hisi_gpio->pin_num;
>> +       hisi_gpio->chip.base = -1;
> But these are fine.
>
> Apart from this address everything Andy commented on as well.
>
> Yours,
> Linus Walleij
>
> .
>


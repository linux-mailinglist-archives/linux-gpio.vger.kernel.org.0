Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A012F043F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jan 2021 00:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbhAIXMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 18:12:42 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:46733 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbhAIXMm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 18:12:42 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 193853F326;
        Sun, 10 Jan 2021 00:11:58 +0100 (CET)
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
Date:   Sun, 10 Jan 2021 00:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 09/01/21 23:11, Linus Walleij ha scritto:
> On Sat, Jan 9, 2021 at 3:02 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> 
>> The Awinic AW9523(B) is a multi-function I2C gpio expander in a
>> TQFN-24L package, featuring PWM (max 37mA per pin, or total max
>> power 3.2Watts) for LED driving capability.
>>
>> It has two ports with 8 pins per port (for a total of 16 pins),
>> configurable as either PWM with 1/256 stepping or GPIO input/output,
>> 1.8V logic input; each GPIO can be configured as input or output
>> independently from each other.
>>
>> This IC also has an internal interrupt controller, which is capable
>> of generating an interrupt for each GPIO, depending on the
>> configuration, and will raise an interrupt on the INTN pin to
>> advertise this to an external interrupt controller.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Okay!
> 
> Overall this driver is in good shape.
> 
> The major review comment is that it'd be nice if you look into
> using regmaps register cache instead of rolling your own,
> and also possibly using regmaps locking rather than your own
> as a result of that.
> 
Actually, I really tried to use regmap's FLAT register cache and after 
many, many tries... I had to give up. I just couldn't get it working. :(

>> +config PINCTRL_AW9523
>> +       bool "Awinic AW9523/AW9523B I2C GPIO expander pinctrl driver"
>> +       depends on OF && I2C
>> +       select PINMUX
>> +       select PINCONF
>> +       select GENERIC_PINCONF
>> +       select GPIOLIB
>> +       select GPIOLIB_IRQCHIP
>> +       select REGMAP
>> +       help
>> +         The Awinic AW9523/AW9523B is a multi-function I2C GPIO
>> +         expander with PWM functionality. This driver bundles a
>> +         pinctrl driver to select the function muxing and a GPIO
>> +         driver to handle GPIO, when the GPIO function is selected.
>> +
>> +         Say yes to enable pinctrl and GPIO support for the AW9523(B).
> 
> This:
> 
> +       DECLARE_BITMAP(old_masked[AW9523_NUM_PORTS], AW9523_PINS_PER_PORT);
> +       DECLARE_BITMAP(masked[AW9523_NUM_PORTS], AW9523_PINS_PER_PORT)
> (...)
> +       DECLARE_BITMAP(direction_in[AW9523_NUM_PORTS], AW9523_PINS_PER_PORT);
> 
> And this looks like a reimplementation of the existing register cache
> in regmap. So use regmaps regcache instead. (More notes on that
> below.)
> 
> This looks good. Right dependencies and helpers.
> 
>> +       int hw_pin = pin % AW9523_PINS_PER_PORT;
> 
> This makes me a bit wary.
> 
> Is that really the "hardware pin" as it looks? It looks more like
> the bit number 0..7 in the register for that port. I would just name these
> "regbit" or just "n" like you do in the irq code.
> 
Yes this is the bit number 0..7, you've understood that right. I guess 
renaming it to "regbit" is a good choice, makes it more understandable!

>> +/*
>> + * __aw9523_gpio_get_direction - Get pin direction
>> + * @regmap: Regmap structure
>> + * @pin: gpiolib pin number
>> + * @hwp: pin index in port register
>> + *
>> + * Return: Pin direction for success or negative number for error
>> + */
>> +static int __aw9523_gpio_get_direction(struct regmap *regmap, u8 pin, u8 hwp)
> 
> Nitpick: I kind of dislike __underscore functions because they have
> ambiguous semantics. Sometimes it is a compiler thing. Sometimes
> it is an inner function from something wrapped, i.e. it depends on
> context what these underscores
> mean. What about finding a better name that says what the function
> is doing?
> 
My initial idea was aw9523_get_pin_direction... then I changed it to 
include the word "gpio" in an attempt to make it less confusing. Let's 
go for the initial one then!

>> +static int __aw9523_get_port_state(struct regmap *regmap, u8 pin,
>> +                                  u8 hw_pin, unsigned int *state)
> 
> Same.
> 
...And here I had another function without __prefix, which was then 
merged into another one as having it separated made no sense, then I 
forgot to remove the underscores. Oops! Removed!

>> +static int aw9523_gpio_irq_type(struct irq_data *d, unsigned int type)
>> +{
>> +       switch (type) {
>> +       case IRQ_TYPE_NONE:
>> +       case IRQ_TYPE_LEVEL_MASK:
>> +       case IRQ_TYPE_LEVEL_HIGH:
>> +       case IRQ_TYPE_LEVEL_LOW:
>> +       case IRQ_TYPE_EDGE_BOTH:
>> +       case IRQ_TYPE_EDGE_RISING:
>> +       case IRQ_TYPE_EDGE_FALLING:
>> +               return 0;
> 
> Does this hardware really support all these edge types without any
> software configuration whatsoever. That looks weird.
> 
And it would indeed be weird: I've rechecked the datasheet again and 
only LEVEL interrupts are supported. As stated there: "When AW9523B 
detect port change, any input state from high-level to low-level or from

low-level to high-level will generate interrupt after 8us internal 
deglitch."
I wonder what happened with my brain, there...

>> +static irqreturn_t aw9523_irq_thread_func(int irq, void *dev_id)
>> +{
>> +       struct aw9523 *awi = (struct aw9523 *)dev_id;
>> +       unsigned long n, val = 0;
>> +       unsigned long changed_gpio;
>> +       unsigned int tmp, port_pin, i, ret;
>> +
>> +       for (i = 0; i < AW9523_NUM_PORTS; i++) {
>> +               port_pin = i * AW9523_PINS_PER_PORT;
>> +               ret = regmap_read(awi->regmap,
>> +                                 AW9523_REG_IN_STATE(port_pin),
>> +                                 &tmp);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               val |= (u8)tmp << (i * 8);
>> +       }
> 
> Can you convince me that these are not just consecutive registers
> that could be read in one go with regmap_bulk_read()?
> (I could not unwind the macros in my head, and you have the
> datasheet I suppose.)
> 
I cannot and I would never convince you of something wrong: yes, this is 
a read of two (and only two) consecutive registers. Here, I didn't go 
for regmap_bulk_read in favor of a "paranoid" performance optimization 
of this operation: in regmap_bulk_read we have 2 if branches, 1 if-else 
branch, plus another "implicit" (regmap_get_offset) if-else branch, and 
a switch. That's exactly what I'm avoiding with this for loop... for 1.5 
times.

...And that's the full story: all about keeping overhead as minimal as 
possible.
However, if it's really necessary to get that (even if very small) 
overhead, I can switch that to a regmap_bulk_read call... but from my 
perspective, having less instructions is better for many reasons.
A typical case of "less is more", I guess?

>> +/*
>> + * aw9523_irq_bus_sync_unlock - Synchronize state and unlock
>> + * @d: irq data
>> + *
>> + * Writes the interrupt mask bits (found in the bit map) to the
>> + * hardware, then unlocks the bus.
>> + */
>> +static void aw9523_irq_bus_sync_unlock(struct irq_data *d)
>> +{
>> +       struct aw9523 *awi = gpiochip_get_data(irq_data_get_irq_chip_data(d));
>> +       int i;
>> +
>> +       for (i = 0; i < AW9523_NUM_PORTS; i++) {
>> +               if (bitmap_equal(awi->irq->masked[i], awi->irq->old_masked[i],
>> +                                AW9523_PINS_PER_PORT))
>> +                       continue;
>> +               regmap_write(awi->regmap,
>> +                            AW9523_REG_INTR_DIS(AW9523_PINS_PER_PORT * i),
>> +                            *awi->irq->masked[i]);
>> +               bitmap_copy(awi->irq->old_masked[i], awi->irq->masked[i],
>> +                           AW9523_PINS_PER_PORT);
>> +       }
>> +       mutex_unlock(&awi->irq->lock);
>> +}
> 
> These copies in the state that you write out at sync unlock.
> 
> Can this not be done using the async facility in regmap?
> 
> regmap_write_async()/regcache_mark_dirty() in all the IRQ
> config etc functions, followed by a simple
> regcache_sync() here makes it unnecessary to keep your
> own register cache I believe?
> 
> At least that is how I always thought it was supposed to be
> used.
> 
As I wrote earlier, unfortunately I tried hard... but I couldn't succeed...

>> +static int aw9523_direction_input(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +       struct aw9523 *awi = gpiochip_get_data(chip);
>> +       u8 hw_pin = offset % AW9523_PINS_PER_PORT;
>> +       int port = AW9523_PIN_TO_PORT(offset);
>> +
>> +       set_bit(offset, awi->direction_in[port]);
> 
> This direction_in state seems to be another reimplementation of regmaps
> register cache.
> 
>> +static int aw9523_hw_reset(struct aw9523 *awi)
>> +{
>> +       int ret, max_retries = 2;
>> +
>> +       /* Sometimes the chip needs more than one reset cycle */
>> +       do {
>> +               ret = __aw9523_hw_reset(awi);
> 
> Please give a better name to the inner function. Like
> aw9523_drive_reset_gpio() or so.
> 
I like it. aw9523_drive_reset_gpio it is!

>> +       for (i = 0; i < AW9523_NUM_PORTS; i++) {
>> +               bitmap_fill(awi->irq->masked[i], AW9523_PINS_PER_PORT);
>> +               bitmap_fill(awi->irq->old_masked[i], AW9523_PINS_PER_PORT);
>> +       }
> 
> This is another of these complications of reimplementing regmaps
> register cache.
> 
>> +static const struct regmap_config aw9523_regmap = {
>> +       .reg_bits = 8,
>> +       .val_bits = 8,
>> +
>> +       .cache_type = REGCACHE_NONE,
> 
> By using some elaborate caching here instead of implementing
> your own, the driver can be simplified.
> 
>> +       .disable_locking = true,
> 
> Are you sure you are not just reimplementing this locking
> with your mutex?
> 
Yes, I am using more specialized locking, which results in less 
lock-unlock operations in many cases, bringing *a lot* less overhead.
Using the regmap locking, my keyboard matrix was a lot slower: I really 
had the need to optimize this driver's performance as much as possible.

>> +static struct i2c_driver aw9523_driver = {
>> +       .driver = {
>> +               .name = "aw9523-pinctrl",
>> +               .of_match_table = of_aw9523_i2c_match,
>> +       },
>> +       .probe = aw9523_probe,
> 
> A lot of people (especially on Qualcomm platforms, which is used in the
> DT binding example) are working to modularize pin controllers.
> 
> This controller on a slow bus should be able to support .remove() I
> think?
> 
> You should even be able to insmod/rmmod it at runtime for testing.
> 
Actually, yes. I will add a .remove callback.
You will get a V2 of this driver tomorrow!

-- Angelo
> Yours,
> Linus Walleij
> 


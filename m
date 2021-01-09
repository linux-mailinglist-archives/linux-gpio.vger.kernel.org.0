Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403872F0405
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 23:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbhAIWMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 17:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbhAIWMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 17:12:01 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF87C0617A3
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jan 2021 14:11:21 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o17so31804434lfg.4
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jan 2021 14:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/AluPNxu0OaUyy4lJzQ9rAkNaPgJTnmmCPCZeigOkA=;
        b=sx+TaFYccdWb+J9GprLxLgF/OxdtToL8Z+4bcv36maGH0xwjLf0ioI1ABFOyqb1HY4
         vEQeq4lztKRTvvCZX9mIfhNiyPIMjfoMzvIhTgR7bvDDG7CRhWWfMNyArWdvSHepasDJ
         erYmNzodCex8Nujg3Xy1C9iRCcaJg18rl+58WaBAs/hVS8FQJriga1dQV7VlQIM4U5EQ
         gjMDo49X5y7HuVbxEkYJlQhABDqGGc2OBKWzJZeeeWY5KJNVWj2/XJ2Ssp4wX5cBRF7Y
         w2FbeAE4XCF3E609tGBD/cZqM0XD/PqRHiZzSiAWDV0ZebBVVyYTBI+7oNnY/ZL53W4o
         UyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/AluPNxu0OaUyy4lJzQ9rAkNaPgJTnmmCPCZeigOkA=;
        b=nYOuM9GI8qVn84+rx0us3ernHMK+axt/ozyB9Fut34Tm01eQ9TSYlAJ4d5USLYZUz0
         tQuOC6veIDkWp1FopoRMFv41KcY2kE9HmQpl+8PXcLSzjexx3oUXbXC5hM4Gbb6ZvlyD
         eX48hjV9NCyF7GfOv0wO3BJbt5kS+RgnTbFks2ROsR1S8t+oSAWkz3YPvNnE6sONt7Zf
         XoXBSGBaBAN1beBQGMiYThU9LA3qsm6JFGngFuRqFn0+WpEOEsDFiZvFRaLiIm3Vbeev
         tn3kuNbT/Ah6L/jLT5Txc3rQ+putvX/XX2Wojom6wUAneyiOZNELdqmLwzfssEIj01Ax
         hK6w==
X-Gm-Message-State: AOAM530TROc7YXzC25PikK89W2ZzxBI5ThxahRLE+sJGOcgzf13m0jhZ
        SEfkEWUvqmJuhsvCUVmzsvd8M6NS/9HSnWoiN7E8/Q==
X-Google-Smtp-Source: ABdhPJxHiLCH8q+VrCtd+o/721uwSWe9N1K/suzwlG9JHZg8I+Jda+M1dyXa/GxE+ZRFs5ZY9PZwQNqQGQ/ovlsgWx4=
X-Received: by 2002:a19:495d:: with SMTP id l29mr4014703lfj.465.1610230279595;
 Sat, 09 Jan 2021 14:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org> <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 23:11:08 +0100
Message-ID: <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 9, 2021 at 3:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> The Awinic AW9523(B) is a multi-function I2C gpio expander in a
> TQFN-24L package, featuring PWM (max 37mA per pin, or total max
> power 3.2Watts) for LED driving capability.
>
> It has two ports with 8 pins per port (for a total of 16 pins),
> configurable as either PWM with 1/256 stepping or GPIO input/output,
> 1.8V logic input; each GPIO can be configured as input or output
> independently from each other.
>
> This IC also has an internal interrupt controller, which is capable
> of generating an interrupt for each GPIO, depending on the
> configuration, and will raise an interrupt on the INTN pin to
> advertise this to an external interrupt controller.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Okay!

Overall this driver is in good shape.

The major review comment is that it'd be nice if you look into
using regmaps register cache instead of rolling your own,
and also possibly using regmaps locking rather than your own
as a result of that.

> +config PINCTRL_AW9523
> +       bool "Awinic AW9523/AW9523B I2C GPIO expander pinctrl driver"
> +       depends on OF && I2C
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIOLIB_IRQCHIP
> +       select REGMAP
> +       help
> +         The Awinic AW9523/AW9523B is a multi-function I2C GPIO
> +         expander with PWM functionality. This driver bundles a
> +         pinctrl driver to select the function muxing and a GPIO
> +         driver to handle GPIO, when the GPIO function is selected.
> +
> +         Say yes to enable pinctrl and GPIO support for the AW9523(B).

This:

+       DECLARE_BITMAP(old_masked[AW9523_NUM_PORTS], AW9523_PINS_PER_PORT);
+       DECLARE_BITMAP(masked[AW9523_NUM_PORTS], AW9523_PINS_PER_PORT)
(...)
+       DECLARE_BITMAP(direction_in[AW9523_NUM_PORTS], AW9523_PINS_PER_PORT);

And this looks like a reimplementation of the existing register cache
in regmap. So use regmaps regcache instead. (More notes on that
below.)

This looks good. Right dependencies and helpers.

> +       int hw_pin = pin % AW9523_PINS_PER_PORT;

This makes me a bit wary.

Is that really the "hardware pin" as it looks? It looks more like
the bit number 0..7 in the register for that port. I would just name these
"regbit" or just "n" like you do in the irq code.

> +/*
> + * __aw9523_gpio_get_direction - Get pin direction
> + * @regmap: Regmap structure
> + * @pin: gpiolib pin number
> + * @hwp: pin index in port register
> + *
> + * Return: Pin direction for success or negative number for error
> + */
> +static int __aw9523_gpio_get_direction(struct regmap *regmap, u8 pin, u8 hwp)

Nitpick: I kind of dislike __underscore functions because they have
ambiguous semantics. Sometimes it is a compiler thing. Sometimes
it is an inner function from something wrapped, i.e. it depends on
context what these underscores
mean. What about finding a better name that says what the function
is doing?

> +static int __aw9523_get_port_state(struct regmap *regmap, u8 pin,
> +                                  u8 hw_pin, unsigned int *state)

Same.

> +static int aw9523_gpio_irq_type(struct irq_data *d, unsigned int type)
> +{
> +       switch (type) {
> +       case IRQ_TYPE_NONE:
> +       case IRQ_TYPE_LEVEL_MASK:
> +       case IRQ_TYPE_LEVEL_HIGH:
> +       case IRQ_TYPE_LEVEL_LOW:
> +       case IRQ_TYPE_EDGE_BOTH:
> +       case IRQ_TYPE_EDGE_RISING:
> +       case IRQ_TYPE_EDGE_FALLING:
> +               return 0;

Does this hardware really support all these edge types without any
software configuration whatsoever. That looks weird.

> +static irqreturn_t aw9523_irq_thread_func(int irq, void *dev_id)
> +{
> +       struct aw9523 *awi = (struct aw9523 *)dev_id;
> +       unsigned long n, val = 0;
> +       unsigned long changed_gpio;
> +       unsigned int tmp, port_pin, i, ret;
> +
> +       for (i = 0; i < AW9523_NUM_PORTS; i++) {
> +               port_pin = i * AW9523_PINS_PER_PORT;
> +               ret = regmap_read(awi->regmap,
> +                                 AW9523_REG_IN_STATE(port_pin),
> +                                 &tmp);
> +               if (ret)
> +                       return ret;
> +
> +               val |= (u8)tmp << (i * 8);
> +       }

Can you convince me that these are not just consecutive registers
that could be read in one go with regmap_bulk_read()?
(I could not unwind the macros in my head, and you have the
datasheet I suppose.)

> +/*
> + * aw9523_irq_bus_sync_unlock - Synchronize state and unlock
> + * @d: irq data
> + *
> + * Writes the interrupt mask bits (found in the bit map) to the
> + * hardware, then unlocks the bus.
> + */
> +static void aw9523_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct aw9523 *awi = gpiochip_get_data(irq_data_get_irq_chip_data(d));
> +       int i;
> +
> +       for (i = 0; i < AW9523_NUM_PORTS; i++) {
> +               if (bitmap_equal(awi->irq->masked[i], awi->irq->old_masked[i],
> +                                AW9523_PINS_PER_PORT))
> +                       continue;
> +               regmap_write(awi->regmap,
> +                            AW9523_REG_INTR_DIS(AW9523_PINS_PER_PORT * i),
> +                            *awi->irq->masked[i]);
> +               bitmap_copy(awi->irq->old_masked[i], awi->irq->masked[i],
> +                           AW9523_PINS_PER_PORT);
> +       }
> +       mutex_unlock(&awi->irq->lock);
> +}

These copies in the state that you write out at sync unlock.

Can this not be done using the async facility in regmap?

regmap_write_async()/regcache_mark_dirty() in all the IRQ
config etc functions, followed by a simple
regcache_sync() here makes it unnecessary to keep your
own register cache I believe?

At least that is how I always thought it was supposed to be
used.

> +static int aw9523_direction_input(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct aw9523 *awi = gpiochip_get_data(chip);
> +       u8 hw_pin = offset % AW9523_PINS_PER_PORT;
> +       int port = AW9523_PIN_TO_PORT(offset);
> +
> +       set_bit(offset, awi->direction_in[port]);

This direction_in state seems to be another reimplementation of regmaps
register cache.

> +static int aw9523_hw_reset(struct aw9523 *awi)
> +{
> +       int ret, max_retries = 2;
> +
> +       /* Sometimes the chip needs more than one reset cycle */
> +       do {
> +               ret = __aw9523_hw_reset(awi);

Please give a better name to the inner function. Like
aw9523_drive_reset_gpio() or so.

> +       for (i = 0; i < AW9523_NUM_PORTS; i++) {
> +               bitmap_fill(awi->irq->masked[i], AW9523_PINS_PER_PORT);
> +               bitmap_fill(awi->irq->old_masked[i], AW9523_PINS_PER_PORT);
> +       }

This is another of these complications of reimplementing regmaps
register cache.

> +static const struct regmap_config aw9523_regmap = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +
> +       .cache_type = REGCACHE_NONE,

By using some elaborate caching here instead of implementing
your own, the driver can be simplified.

> +       .disable_locking = true,

Are you sure you are not just reimplementing this locking
with your mutex?

> +static struct i2c_driver aw9523_driver = {
> +       .driver = {
> +               .name = "aw9523-pinctrl",
> +               .of_match_table = of_aw9523_i2c_match,
> +       },
> +       .probe = aw9523_probe,

A lot of people (especially on Qualcomm platforms, which is used in the
DT binding example) are working to modularize pin controllers.

This controller on a slow bus should be able to support .remove() I
think?

You should even be able to insmod/rmmod it at runtime for testing.

Yours,
Linus Walleij

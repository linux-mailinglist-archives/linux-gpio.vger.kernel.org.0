Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8AE4CDDB9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 10:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfJGIwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 04:52:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33793 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbfJGIwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 04:52:04 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iHOkK-0007nf-9h; Mon, 07 Oct 2019 10:52:00 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iHOkJ-0005Yo-EW; Mon, 07 Oct 2019 10:51:59 +0200
Date:   Mon, 7 Oct 2019 10:51:59 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] gpio: da9062: add driver support
Message-ID: <20191007085159.uo366hmos6zk2ops@pengutronix.de>
References: <20190917105902.445-1-m.felsch@pengutronix.de>
 <20190917105902.445-4-m.felsch@pengutronix.de>
 <CACRpkdbbmVo3hem1xFqtmq9-htg9+QUXQpZoSyffdTZQ5kUo5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbbmVo3hem1xFqtmq9-htg9+QUXQpZoSyffdTZQ5kUo5Q@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:17:16 up 142 days, 14:35, 94 users,  load average: 0.01, 0.03,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

thanks for you feedback.

On 19-10-04 21:27, Linus Walleij wrote:
> On Tue, Sep 17, 2019 at 12:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > be used as input, output or have a special use-case.
> >
> > The patch adds the support for the normal input/output use-case.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Nice to get this covered!
> 
> > +#define DA9062_TYPE(offset)            (4 * (offset % 2))
> > +#define DA9062_PIN_SHIFT(offset)       (4 * (offset % 2))
> > +#define DA9062_PIN_ALTERNATE           0x00 /* gpio alternate mode */
> 
> The there is pin control related to the DA9062, we should put the driver
> in drivers/pinctrl/pinctrl-da9062.c from day one.

Mh.. didn't checked the pinctrl framework and assumed that this place is
just fine due to the existing da9052/5 drivers which have an alternate
mode too.

> I am not saying you have to implement pin control from scratch, just
> have it there and look at sibling drivers to make sure we don't
> screw something up for also adding pin control later on.

I will check the pinctrl framework. Maybe I will have upcoming question.

> > +int da9062_gpio_get_hwgpio(struct gpio_desc *desc)
> > +{
> > +       return gpio_chip_hwgpio(desc);
> > +}
> > +EXPORT_SYMBOL_GPL(da9062_gpio_get_hwgpio);
> 
> I would have to look at the other patch to see why this is needed.
> Normally other drivers should just have their GPIOs assigned
> like anyone else, no shortcuts into the hardware offsets
> like this.

I saw your comments on the other patch. As you mentioned in the other
patche it is better to have a api within the gpiolib. I will add this
api within the other patch series.

> > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > +       struct regmap *regmap = gpio->da9062->regmap;
> > +       int gpio_dir, val;
> > +       int ret;
> > +
> > +       gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> 
> This includes other things than the direction of the pin so call
> the variable gpio_mode or something rather than gpio_dir.

Okay, I will change that.

> > +       if (gpio_dir < 0)
> > +               return gpio_dir;
> > +
> > +       switch (gpio_dir) {
> > +       case DA9062_PIN_ALTERNATE:
> > +               return -ENOTSUPP;
> 
> This is fine for now. Toss in a comment that we may add pin muxing
> later.
> 
> > +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> 
> Same comments as above.

Okay.

> > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > +                                      unsigned int offset)
> > +{
> > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > +       struct regmap *regmap = gpio->da9062->regmap;
> > +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> > +       unsigned int gpi_type;
> > +       int ret;
> > +
> > +       ret = da9062_gpio_set_pin_mode(regmap, offset, DA9062_PIN_GPI);
> > +       if (ret)
> > +               return ret;
> 
> Fair enough.
> 
> > +       /*
> > +        * If the gpio is active low we should set it in hw too. No worries
> > +        * about gpio_get() because we read and return the gpio-level. So the
> > +        * gpiolob active_low handling is still correct.
> 
> gpiolib?

Thanks for covering that.

> > +        *
> > +        * 0 - active low, 1 - active high
> > +        */
> > +       gpi_type = !gpiod_is_active_low(desc);
> > +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> > +                               DA9062AA_GPIO0_TYPE_MASK << DA9062_TYPE(offset),
> > +                               gpi_type << DA9062_TYPE(offset));
> > +}
> 
> So this does not affect the value out set by da9062_gpio_set()?

Please check [1] table 54, the datasheet says it is only gpi
(gpio-input). So I assume it doesn't affect out values.

[1] https://www.dialog-semiconductor.com/sites/default/files/da9062-a_datasheet_2v3.pdf

Unfortunately the other gpio-da90* drivers sets this as active low hard
within the driver. I wanted to avoid this here since it isn't always
true.

> What is the electrical effect of this then, really? To me that seems like
> something that is mostly going to be related to how interrupts
> trigger (like whether to trig on rising or falling edge) and then it
> should really be in the .set_type() callback, should it not?

Not only interrupts.. The dialog pmics has a lot of options to use this
pins e.g. you can set it as voltage-selection input. You saw the patches
I made for the regulator :)

> > +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> > +                                       unsigned int offset, int value)
> > +{
> > +       /* Push-Pull / Open-Drain options are configured during set_config */
> > +       da9062_gpio_set(gc, offset, value);
> > +
> > +       return 0;
> > +}
> 
> You probably want to make sure to clear the active low bit in this function,
> right?

Nope, as I mentioned above this is only input related. If we can trust
the datasheet.

> > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> > +                                 unsigned long config)
> > +{
> > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > +       struct regmap *regmap = gpio->da9062->regmap;
> > +       int gpio_dir;
> 
> Name this gpio_mode

okay.

> > +       switch (pinconf_to_config_param(config)) {
> > +       case PIN_CONFIG_BIAS_PULL_DOWN:
> > +               /* PD only if pin is input */
> 
> Info from datasheet? Electrical limitation? Add to comment!

Okay, I will add more comments.

> > +               gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> > +               if (gpio_dir < 0)
> > +                       return -EINVAL;
> > +               else if (gpio_dir != DA9062_PIN_GPI)
> > +                       return -ENOTSUPP;
> > +               return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +                                         BIT(offset), BIT(offset));
> > +       case PIN_CONFIG_BIAS_PULL_UP:
> > +               /* PU only if pin is output open-drain */
> 
> Dito.

Here too.

> > +               gpio_dir = da9062_gpio_get_pin_mode(regmap, offset);
> > +               if (gpio_dir < 0)
> > +                       return -EINVAL;
> > +               else if (gpio_dir != DA9062_PIN_GPO_OD)
> > +                       return -ENOTSUPP;
> > +               return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +                                         BIT(offset), BIT(offset));
> > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > +               return da9062_gpio_set_pin_mode(regmap, offset,
> > +                                               DA9062_PIN_GPO_OD);
> > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > +               return da9062_gpio_set_pin_mode(regmap, offset,
> > +                                               DA9062_PIN_GPO_PP);
> > +       default:
> > +               return -ENOTSUPP;
> > +       }
> 
> Overall very nice use of this callback.
> 
> > +static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > +       struct da9062 *da9062 = gpio->da9062;
> > +
> > +       return regmap_irq_get_virq(da9062->regmap_irq,
> > +                                  DA9062_IRQ_GPI0 + offset);
> > +}
> 
> That's interesting. I never saw that before. It's fine, I guess,
> I can't figure out whether these slow expanders could be set as
> hierarchical though, what do you think? Saw a comment on this
> from Bartosz as well. But I generally trust his comment on that
> it should be fine unless you have subnodes (i.e. hierarchy).

This v1 had a hierarchy.. but I changed that upon Bartosz comments. So
there is no hierarchy in the next version.

> > +++ b/include/linux/mfd/da9062/gpio.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > + */
> > +
> > +#ifndef __MFD_DA9062_GPIO_H__
> > +#define __MFD_DA9062_GPIO_H__
> > +
> > +struct gpio_desc;
> > +
> > +int da9062_gpio_get_hwgpio(struct gpio_desc *desc);
> > +
> > +#endif /* __MFD_DA9062_GPIO_H__ */
> 
> So I'm sceptical about this and it needs a very good motivation.

I will change it to have a common api call as you mentioned it in
the regulator-patch series.

Regards,
  Marco

> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

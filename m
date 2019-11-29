Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830CD10D2F3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 10:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2JHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 04:07:41 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43523 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfK2JHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 04:07:41 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iacFV-0002zM-HH; Fri, 29 Nov 2019 10:07:37 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iacFU-0005Yt-Hn; Fri, 29 Nov 2019 10:07:36 +0100
Date:   Fri, 29 Nov 2019 10:07:36 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] pinctrl: da9062: add driver support
Message-ID: <20191129090736.f2ozwtrhynryatlq@pengutronix.de>
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-4-m.felsch@pengutronix.de>
 <CACRpkdbd4J-FUNi=F12YQfNPajNCVaoKyqWU7qjmfFMbonzDKg@mail.gmail.com>
 <20191127150146.bbwse77eef6haita@pengutronix.de>
 <CAMpxmJVmvj_4DN85j4vu32FUZVnzmQzQfUtOVKAd0GVO3sWYmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVmvj_4DN85j4vu32FUZVnzmQzQfUtOVKAd0GVO3sWYmA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:06:19 up 14 days, 24 min, 28 users,  load average: 0.07, 0.08,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-11-28 11:47, Bartosz Golaszewski wrote:
> śr., 27 lis 2019 o 16:01 Marco Felsch <m.felsch@pengutronix.de> napisał(a):
> >
> > Hi Linus,
> >
> > On 19-11-27 14:49, Linus Walleij wrote:
> > > Hi Marco,
> > >
> > > thanks for your patch!
> >
> > thanks for your fast response.
> >
> > > On Wed, Nov 27, 2019 at 12:56 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > > > be used as input, output or have a special use-case.
> > > >
> > > > The patch adds the support for the normal input/output use-case.
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > (...)
> > >
> > > > +config PINCTRL_DA9062
> > > > +       tristate "Dialog Semiconductor DA9062 PMIC pinctrl and GPIO Support"
> > > > +       depends on MFD_DA9062
> > > > +       select GPIOLIB
> > >
> > > Hm this would be one of those that could use GENERIC_REGMAP_GPIO
> > > the day we invent it but we haven't invented it yet.
> >
> > Yes it is. Is there a plan for GENERIC_REGMAP_GPIO?
> >
> 
> Yes, it's the second item on my TODO after the LINEINFO_FD series. I
> just got a board I can use for developing this so I should have
> something shortly.

So it is okay to keep the above select and change it later?

Regards,
  Marco

> Bart
> 
> > > > +#include <../gpio/gpiolib.h>
> > >
> > > Put a comment above this telling us why you do this thing.
> >
> > Okay.
> >
> > > > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> > > > +{
> > > (...)
> > > > +       return val & BIT(offset);
> > >
> > > You should #include <linux/bits.h> since you use BIT()
> >
> > Argh.. of course I will add the include.
> >
> > > Usually I clamp it like this:
> > > return !!(val & BIT(offset));
> >
> > Okay, I can change that too.
> >
> > > > +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> > > > +{
> > > > +       struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > > > +       struct regmap *regmap = pctl->da9062->regmap;
> > > > +       int gpio_mode;
> > > > +
> > > > +       gpio_mode = da9062_pctl_get_pin_mode(regmap, offset);
> > > > +       if (gpio_mode < 0)
> > > > +               return gpio_mode;
> > > > +
> > > > +       switch (gpio_mode) {
> > > > +       case DA9062_PIN_ALTERNATE:
> > > > +               return -ENOTSUPP;
> > > > +       case DA9062_PIN_GPI:
> > > > +               return 1;
> > > > +       case DA9062_PIN_GPO_OD:
> > > > +       case DA9062_PIN_GPO_PP:
> > > > +               return 0;
> > >
> > > We recently added defines for these directions in
> > > <linux/gpio/driver.h>:
> > >
> > > #define GPIO_LINE_DIRECTION_IN  1
> > > #define GPIO_LINE_DIRECTION_OUT 0
> > >
> > > Please use these. (Soon in Torvald's tree, else
> > > in my "devel" branch.)
> >
> > I rebased it onto your devel, thanks for the hint.
> >
> > > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > > +                                      unsigned int offset)
> > > > +{
> > > > +       struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > > > +       struct regmap *regmap = pctl->da9062->regmap;
> > > > +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> > > > +       unsigned int gpi_type;
> > > > +       int ret;
> > > > +
> > > > +       ret = da9062_pctl_set_pin_mode(regmap, offset, DA9062_PIN_GPI);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       /*
> > > > +        * If the gpio is active low we should set it in hw too. No worries
> > > > +        * about gpio_get() because we read and return the gpio-level. So the
> > > > +        * gpiolib active_low handling is still correct.
> > > > +        *
> > > > +        * 0 - active low, 1 - active high
> > > > +        */
> > > > +       gpi_type = !gpiod_is_active_low(desc);
> > >
> > > That's interesting. Correct too, I guess.
> >
> > Double checked it again and the datasheet calls it gpio-level so I
> > assume that this is correct.
> >
> > > > +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> > > > +                                       unsigned int offset, int value)
> > > > +{
> > > > +       /* Push-Pull / Open-Drain options are configured during set_config */
> > > > +       da9062_gpio_set(gc, offset, value);
> > >
> > > That looks dangerous. There is no guarantee that .set_config()
> > > always gets called.
> >
> > Hm.. it seems that other drivers using this assumption too:
> >   - gpio-lp87565.c
> >   - gpio-tps65218.c
> >   - ...
> >
> > But you're right I missed the possible users of
> > gpiod_direction_output_raw().
> >
> > > Please create a local state container for the mode of each pin in
> > > struct da9062_pctl and set it to push-pull by default at probe, then
> > > set this to whatever the state is here and let the .set_config()
> > > alter it later if need be.
> > >
> > > If we don't do that you will get boot-time defaults I think and that
> > > might create bugs.
> >
> > I will add a container for each pin, thanks for covering that.
> >
> > > > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> > > > +                                 unsigned long config)
> > > > +{
> > > (...)
> > > > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > +               return da9062_pctl_set_pin_mode(regmap, offset,
> > > > +                                               DA9062_PIN_GPO_OD);
> > > > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > +               return da9062_pctl_set_pin_mode(regmap, offset,
> > > > +                                               DA9062_PIN_GPO_PP);
> > >
> > > So also store this in the per-pin state.
> >
> > Of course.
> >
> > Regards,
> >   Marco
> >
> > >
> > > Yours,
> > > Linus Walleij
> > >
> >
> > --
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

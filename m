Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7AF7D0BEE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 11:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbfJIJ4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 05:56:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47365 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbfJIJ4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 05:56:15 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iI8hZ-0006eU-Fy; Wed, 09 Oct 2019 11:56:13 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iI8hY-0000y2-Nh; Wed, 09 Oct 2019 11:56:12 +0200
Date:   Wed, 9 Oct 2019 11:56:12 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: Re: [PATCH 3/3] gpio: da9062: add driver support
Message-ID: <20191009095612.einxiswkmhvipjht@pengutronix.de>
References: <20190917105902.445-1-m.felsch@pengutronix.de>
 <20190917105902.445-4-m.felsch@pengutronix.de>
 <CACRpkdbbmVo3hem1xFqtmq9-htg9+QUXQpZoSyffdTZQ5kUo5Q@mail.gmail.com>
 <20191007085159.uo366hmos6zk2ops@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007085159.uo366hmos6zk2ops@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:49:11 up 144 days, 16:07, 97 users,  load average: 0.43, 0.48,
 0.39
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

On 19-10-07 10:51, Marco Felsch wrote:
> Hi Linus,
> 
> thanks for you feedback.
> 
> On 19-10-04 21:27, Linus Walleij wrote:
> > On Tue, Sep 17, 2019 at 12:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > 
> > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > +                                      unsigned int offset)
> > > +{
> > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);

This won't work anymore since I moved the driver to pinctrl and can't
include the drivers/gpio/gpiolib.h anymore. What is the right way to
get the same result within the pinctrl space? There are three possible
ways:
1) Revert commit 1bd6b601fe196b6fbce2c93536ce0f3f53577cec which isn't
   the best due to safeness.
2) Set the gpio as active low hard as the other da90*-gpio drivers did
3) Introduce a dt-binding (seems wrong because the information is
   already there).
4) "Re-implement" the gpiochip_get_desc() functionality driver
   internally.

Thanks for your advice.

Regards,
  Marco

> > > +       unsigned int gpi_type;
> > > +       int ret;
> > > +
> > > +       ret = da9062_gpio_set_pin_mode(regmap, offset, DA9062_PIN_GPI);
> > > +       if (ret)
> > > +               return ret;
> > 
> > Fair enough.
> > 
> > > +       /*
> > > +        * If the gpio is active low we should set it in hw too. No worries
> > > +        * about gpio_get() because we read and return the gpio-level. So the
> > > +        * gpiolob active_low handling is still correct.
> > 
> > gpiolib?
> 
> Thanks for covering that.
> 
> > > +        *
> > > +        * 0 - active low, 1 - active high
> > > +        */
> > > +       gpi_type = !gpiod_is_active_low(desc);
> > > +       return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> > > +                               DA9062AA_GPIO0_TYPE_MASK << DA9062_TYPE(offset),
> > > +                               gpi_type << DA9062_TYPE(offset));
> > > +}
> > 
> > So this does not affect the value out set by da9062_gpio_set()?
> 
> Please check [1] table 54, the datasheet says it is only gpi
> (gpio-input). So I assume it doesn't affect out values.
> 
> [1] https://www.dialog-semiconductor.com/sites/default/files/da9062-a_datasheet_2v3.pdf
> 
> Unfortunately the other gpio-da90* drivers sets this as active low hard
> within the driver. I wanted to avoid this here since it isn't always
> true.
> 
> > What is the electrical effect of this then, really? To me that seems like
> > something that is mostly going to be related to how interrupts
> > trigger (like whether to trig on rising or falling edge) and then it
> > should really be in the .set_type() callback, should it not?
> 
> Not only interrupts.. The dialog pmics has a lot of options to use this
> pins e.g. you can set it as voltage-selection input. You saw the patches
> I made for the regulator :)

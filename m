Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D038DD38
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 23:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhEWVUx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 17:20:53 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:43108 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhEWVUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 17:20:53 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa] (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id C89E52029F7;
        Sun, 23 May 2021 23:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621804765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=opv3990mDSD1lvjaG3Y+p6pla5OsohJOXQgJ2GCpUCA=;
        b=ZKp4mnX/nj5Var4/Fw7v+hTJF4PNdS3w9iamielGQ2EshBogJW26NaPEGr2M9S3ec3EJWd
        r2aTHinbgON02oaaXkAAtI0XUirD+kgYEQ9Mjke03lOgSnucc1B0B4Y5YtU+tknvxUnvTE
        tqu3LLqOtM7ADP2wZo2bu7bELO4EzCLbnKryMjiLFVo4upd2WCbzO4nbxnF1mNsx2ZOszf
        RhED7RxOmEQPJ+sRY9bZVuZANBKCqK7j0SUc2b18yh2ydVingF9G+CLWS03ft7ICcmnWSI
        kReF6OHo6SosgATIw3hIrTajNhOPtQKanXVK7mxRJ3KbKR8eqeNgRn/5iePL5Q==
Message-ID: <2ad8d401c6c76f5233ba0bec43217b311e2a2f76.camel@svanheule.net>
Subject: Re: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
From:   Sander Vanheule <sander@svanheule.net>
To:     Michael Walle <michael@walle.cc>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Date:   Sun, 23 May 2021 23:19:22 +0200
In-Reply-To: <675e36df5aaa1e1be3a1a77289a0a952@walle.cc>
References: <cover.1621279162.git.sander@svanheule.net>
         <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
         <675e36df5aaa1e1be3a1a77289a0a952@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On Tue, 2021-05-18 at 10:39 +0200, Michael Walle wrote:
> Hi,
> 
> Am 2021-05-17 21:28, schrieb Sander Vanheule:
> > GPIO chips may not support setting the output value when a pin is
> > configured as an input, although the current implementation assumes 
> > this
> > is always possible.
> > 
> > Add support for setting pin direction before value. The order defaults
> > to setting the value first, but this can be reversed by setting the
> > regmap_config.no_set_on_input flag, similar to the corresponding flag 
> > in
> > the gpio-mmio driver.
> > 
> > Signed-off-by: Sander Vanheule <sander@svanheule.net>
> > ---
> >  drivers/gpio/gpio-regmap.c  | 20 +++++++++++++++++---
> >  include/linux/gpio/regmap.h |  3 +++
> >  2 files changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> > index 134cedf151a7..1cdb20f8f8b4 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -170,14 +170,25 @@ static int gpio_regmap_direction_input(struct
> > gpio_chip *chip,
> >         return gpio_regmap_set_direction(chip, offset, false);
> >  }
> > 
> > -static int gpio_regmap_direction_output(struct gpio_chip *chip,
> > -                                       unsigned int offset, int value)
> > +static int gpio_regmap_dir_out_val_first(struct gpio_chip *chip,
> > +                                        unsigned int offset, int value)
> 
> Can we leave the name as is? TBH I find these two similar names
> super confusing. Maybe its just me, though.

Sure. This is the implementation used in gpio-mmio.c to provide the same
functionality, so I had used that for consistenty between the two drivers.

> >  {
> >         gpio_regmap_set(chip, offset, value);
> > 
> >         return gpio_regmap_set_direction(chip, offset, true);
> >  }
> > 
> > +static int gpio_regmap_dir_out_dir_first(struct gpio_chip *chip,
> > +                                        unsigned int offset, int value)
> > +{
> > +       int err;
> 
> use ret for consistency here
> 
> > +
> > +       err = gpio_regmap_set_direction(chip, offset, true);
> > +       gpio_regmap_set(chip, offset, value);
> > +
> > +       return err;
> > +}
> > +
> 
> Instead of adding a new one, we can also just check no_set_on_input
> in gpio_regmap_direction_output(), which I'd prefer.
> 
> static int gpio_regmap_direction_output(struct gpio_chip *chip,
>                                         unsigned int offset, int value)
> {
>         struct gpio_regmap *gpio = gpiochip_get_data(chip);
>         int ret;
> 
>         if (gpio->no_set_on_input) {
>                 /* some smart comment here, also mention gliches */
>                 ret = gpio_regmap_set_direction(chip, offset, true);
>                 gpio_regmap_set(chip, offset, value);
>         } else {
>                 gpio_regmap_set(chip, offset, value);
>                 ret = gpio_regmap_set_direction(chip, offset, true);
>         }
> 
>         return ret;
> }
> 

This would certainly make the code a bit easier to follow when you're not
familiar with it :-)
I also see the other functions do checks on static values too, so I'll bring
this function in line with that style.


> >  void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
> >  {
> >         gpio->driver_data = data;
> > @@ -277,7 +288,10 @@ struct gpio_regmap *gpio_regmap_register(const
> > struct gpio_regmap_config *config
> >         if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
> >                 chip->get_direction = gio_regmap_get_direction;
> >                 chip->direction_input = gpio_regmap_direction_input;
> > -               chip->direction_output = gpio_regmap_direction_output;
> > +               if (config->no_set_on_input)
> > +                       chip->direction_output =
> > gpio_regmap_dir_out_dir_first;
> > +               else
> > +                       chip->direction_output =
> > gpio_regmap_dir_out_val_first;
> >         }
> > 
> >         ret = gpiochip_add_data(chip, gpio);
> > diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> > index 334dd928042b..2a732f8f23be 100644
> > --- a/include/linux/gpio/regmap.h
> > +++ b/include/linux/gpio/regmap.h
> > @@ -30,6 +30,8 @@ struct regmap;
> >   * @reg_dir_out_base:  (Optional) out setting register base address
> >   * @reg_stride:                (Optional) May be set if the registers (of
> > the
> >   *                     same type, dat, set, etc) are not consecutive.
> > + * @no_set_on_input:   Set if output value can only be set when the 
> > direction
> > + *                     is configured as output.
> 
> set_direction_first ?

This negation can indeed be a bit confusing, I'll change this. As Andy
suggested, I just went for a 'quirks' field, with currently only one defined
flag.

Best,
Sander



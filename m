Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0A33958A6
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 12:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhEaKEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 06:04:15 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:55769 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEaKEO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 06:04:14 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8D704221E6;
        Mon, 31 May 2021 12:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622455352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yHnj8ZChpZfQ7rJMK2Ssfqvgsi+pIPIjW/sU2HAAnww=;
        b=OrhsVzs4VbvB2eQXxVYhdwyrXwP8a0gKdZgKeX4Gq9mG/cevW5xLI2dLOZ1n64MjnNIQFy
        Z2cuJ+N8iyo02+Dc9HDqYwDkuNJGlpz1XB5VFOvHMT2BatnRlBEQ9LqTcw+ibki4a8ZN68
        H+1jixWHCNPj2O+kGfHepOOzJa3/Ki8=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 31 May 2021 12:02:31 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
In-Reply-To: <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
 <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
 <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
 <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <c7239e0cbbc9748925410937a914bd8a@walle.cc>
 <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0047200eecbd7ee480258cc904d6b7ee@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-31 10:36, schrieb Sander Vanheule:
> On Sun, 2021-05-30 at 23:22 +0200, Michael Walle wrote:
>> Am 2021-05-30 20:16, schrieb Andy Shevchenko:
>> > On Sun, May 30, 2021 at 7:51 PM Hans de Goede <hdegoede@redhat.com>
>> > wrote:
>> > > On 5/30/21 6:19 PM, Sander Vanheule wrote:
>> > > > As Michael suggested, I tried raw register reads and writes, to eliminate
>> > > > any
>> > > > side effects of the intermediate code. I didn't use the ioctls (this isn't
>> > > > a
>> > > > netdev), but I found regmap's debugfs write functionality, which allowed
>> > > > me to
>> > > > do the same.
>> > > >
>> > > > I was trying to reproduce the behaviour I reported earlier, but couldn't.
>> > > > The
>> > > > output levels were always the intended ones. At some point I realised that
>> > > > the
>> > > > regmap_update_bits function does a read-modify-write, which might shadow
>> > > > the
>> > > > actual current output value.
>> > > > For example:
>> > > >  * Set output low: current out is low
>> > > >  * Change to input with pull-up: current out is still low, but DATAx reads
>> > > > high
>> > > >  * Set output high: RMW reads a high value (the input), so assumes a write
>> > > > is
>> > > >    not necessary, leaving the old output value (low).
>> > > >
>> > > > Currently, I see two options:
>> > > >  * Use regmap_update_bits_base to avoid the lazy RMW behaviour
>> > > >  * Add a cache for the output data values to the driver, and only use
>> > > > these
>> > > >    values to write to the output registers. This would allow keeping lazy
>> > > > RMW
>> > > >    behaviour, which may be a benefit on slow busses.
>> > > >
>> > > > With either of these implemented, if I set the output value before the
>> > > > direction, everything works! :-)
>> > > >
>> > > > Would you like this to be added to regmap-gpio, or should I revert back to
>> > > > a
>> > > > device-specific implementation?
>> > >
>> > > Regmap allows you to mark certain ranges as volatile, so that they
>> > > will not
>> > > be cached, these GPIO registers containing the current pin value seems
>> > > like
>> > > a good candidate for this. This is also necessary to make reading the
>> > > GPIO
>> > > work without getting back a stale, cached value.
>> >
>> > After all it seems a simple missed proper register configuration in
>> > the driver for regmap.
>> > Oh, as usual something easy-to-solve requires tons of time to find it.
>> > :-)
>> >
>> > Sander, I think you may look at gpio-pca953x.c to understand how it
>> > works (volatility of registers).
>> 
>> But as far as I see is the regmap instantiated without a cache?
> 
> That's correct, there currently is no cache, although I could add one.
> 
> The data register rather appears to be implemented as a read-only (pin 
> inputs)
> register and a write-only (pin outputs) register, aliased on the same 
> register
> address.

Ahh so this makes more sense. If the data register is really write only
regardless of the direction mode, then RMW doesn't make any sense at 
all.
Please note, that even if regmap caches values, it might be marked as 
dirty
and it will re-read the values from hardware. So I don't know if that 
will
help you.

So a possible quirk could be
  GPIO_REGMAP_WRITE_ONLY_DATA_REG (or something like that)

I'm not sure if regmap can cache the value for us or if we have to do it
ourselves.

> As I understand, marking the DATA registers as volatile wouldn't help. 
> With a
> cache this would force reads to not use the cache, which is indeed 
> required for
> the pin input values (DATA register reads). However, the output values 
> (DATA
> register writes) can in fact be cached.
> Looking at _regmap_update_bits(), marking a register as volatile would 
> only make
> a difference if regmap.reg_update_bits is implemented. On an MDIO bus, 
> this
> would also be emulated with a lazy RMW (see mdiobus_modify()), which is 
> why I
> chose not to implement it for regmap-mdio.
> 
> So, I still think the issue lies with the lazy RMW behaviour. The patch 
> below
> would force a register update when reg_set_base (the data output 
> register) and
> reg_dat_base (the data input register) are identical. Otherwise the two
> registers are assumed to have conventional RW behaviour. I'm just not 
> entirely
> sure gpio-regmap.c is the right place for this.
> 
> ---8<---
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 95553734e169..c2fccd19548a 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -81,13 +81,16 @@ static void gpio_regmap_set(struct gpio_chip *chip, 
> unsigned
> int offset,
>  {
>         struct gpio_regmap *gpio = gpiochip_get_data(chip);
>         unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
> +       bool force = gpio->reg_set_base == gpio->reg_dat_base;

Ha I've thought of the same thing, but there might be hardware which
actually mux the data in and data out register. Thus I think we have
to distiguish between:

  (1) write only data registers
  (2) muxed data in/data out according to the direction

for (1) we'd have to cache the value (ourselves (?))
for (2) we'd only need to drop a cached value if we switch directions

>         unsigned int reg, mask;
> 
>         gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
>         if (val)
> -               regmap_update_bits(gpio->regmap, reg, mask, mask);
> +               regmap_update_bits_base(gpio->regmap, reg, mask, mask, 
> NULL,
> +                                       false, force);

mh, I don't see how this will work with a write only register. I seems
that you might accidentially change the values of the other GPIOs in
this registers (that is depending on the input of them, because you
are still doing a RMW).

>         else
> -               regmap_update_bits(gpio->regmap, reg, mask, 0);
> +               regmap_update_bits_base(gpio->regmap, reg, mask, 0, 
> NULL,
> +                                       false, force);
>  }
> 
>  static void gpio_regmap_set_with_clear(struct gpio_chip *chip,

-michael

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213E9395716
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 10:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhEaIip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 04:38:45 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:38732 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhEaIio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 04:38:44 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:86ad:a53c:2e83:dd76] (unknown [IPv6:2a02:a03f:eafb:ee01:86ad:a53c:2e83:dd76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 69DDE20696F;
        Mon, 31 May 2021 10:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622450223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H7bXaXzTufSRFfxWUvO7ry3UIASmwiRtwvmBtSgo9K4=;
        b=iOBexC/fyJn6nng96QGgGYpR+llCD62GMRdMn9nNlZDgjGfhAW0kdyrge0BggBFvuTA/Yd
        6unBlodbmGInrT39H3VIzxgQK3nmEAa5jj3BGmrZi8GMMTvHF9SNJ6lf6LTAGrouOyXK1k
        ab4aIqXDI34n6vYHOXJZG7jbVxA+MmPjv8vBYgTZVPY8DnIjz6PcCFZGgL/LOw9CbkodL4
        UO/fyh+eFRY77Ru7Yt3IjesnNEb6Y0kzEjmYlYnknRv5H1xVCA5Dlxi6yUV6msQTxgfdB/
        +VFas6aeqmfwyOYTZ9V3HP/ZRZ+T+s19C/dBTYNWr5IQ/Phs43rQKz08U9hmBw==
Message-ID: <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
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
Date:   Mon, 31 May 2021 10:36:59 +0200
In-Reply-To: <c7239e0cbbc9748925410937a914bd8a@walle.cc>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
         <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
         <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
         <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
         <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
         <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
         <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
         <c7239e0cbbc9748925410937a914bd8a@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 2021-05-30 at 23:22 +0200, Michael Walle wrote:
> Am 2021-05-30 20:16, schrieb Andy Shevchenko:
> > On Sun, May 30, 2021 at 7:51 PM Hans de Goede <hdegoede@redhat.com> 
> > wrote:
> > > On 5/30/21 6:19 PM, Sander Vanheule wrote:
> > > > As Michael suggested, I tried raw register reads and writes, to eliminate
> > > > any
> > > > side effects of the intermediate code. I didn't use the ioctls (this isn't
> > > > a
> > > > netdev), but I found regmap's debugfs write functionality, which allowed
> > > > me to
> > > > do the same.
> > > > 
> > > > I was trying to reproduce the behaviour I reported earlier, but couldn't.
> > > > The
> > > > output levels were always the intended ones. At some point I realised that
> > > > the
> > > > regmap_update_bits function does a read-modify-write, which might shadow
> > > > the
> > > > actual current output value.
> > > > For example:
> > > >  * Set output low: current out is low
> > > >  * Change to input with pull-up: current out is still low, but DATAx reads
> > > > high
> > > >  * Set output high: RMW reads a high value (the input), so assumes a write
> > > > is
> > > >    not necessary, leaving the old output value (low).
> > > > 
> > > > Currently, I see two options:
> > > >  * Use regmap_update_bits_base to avoid the lazy RMW behaviour
> > > >  * Add a cache for the output data values to the driver, and only use
> > > > these
> > > >    values to write to the output registers. This would allow keeping lazy
> > > > RMW
> > > >    behaviour, which may be a benefit on slow busses.
> > > > 
> > > > With either of these implemented, if I set the output value before the
> > > > direction, everything works! :-)
> > > > 
> > > > Would you like this to be added to regmap-gpio, or should I revert back to
> > > > a
> > > > device-specific implementation?
> > > 
> > > Regmap allows you to mark certain ranges as volatile, so that they 
> > > will not
> > > be cached, these GPIO registers containing the current pin value seems 
> > > like
> > > a good candidate for this. This is also necessary to make reading the 
> > > GPIO
> > > work without getting back a stale, cached value.
> > 
> > After all it seems a simple missed proper register configuration in
> > the driver for regmap.
> > Oh, as usual something easy-to-solve requires tons of time to find it. 
> > :-)
> > 
> > Sander, I think you may look at gpio-pca953x.c to understand how it
> > works (volatility of registers).
> 
> But as far as I see is the regmap instantiated without a cache?

That's correct, there currently is no cache, although I could add one.

The data register rather appears to be implemented as a read-only (pin inputs)
register and a write-only (pin outputs) register, aliased on the same register
address.

As I understand, marking the DATA registers as volatile wouldn't help. With a
cache this would force reads to not use the cache, which is indeed required for
the pin input values (DATA register reads). However, the output values (DATA
register writes) can in fact be cached.
Looking at _regmap_update_bits(), marking a register as volatile would only make
a difference if regmap.reg_update_bits is implemented. On an MDIO bus, this
would also be emulated with a lazy RMW (see mdiobus_modify()), which is why I
chose not to implement it for regmap-mdio.

So, I still think the issue lies with the lazy RMW behaviour. The patch below
would force a register update when reg_set_base (the data output register) and
reg_dat_base (the data input register) are identical. Otherwise the two
registers are assumed to have conventional RW behaviour. I'm just not entirely
sure gpio-regmap.c is the right place for this.

---8<---

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 95553734e169..c2fccd19548a 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -81,13 +81,16 @@ static void gpio_regmap_set(struct gpio_chip *chip, unsigned
int offset,
 {
        struct gpio_regmap *gpio = gpiochip_get_data(chip);
        unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
+       bool force = gpio->reg_set_base == gpio->reg_dat_base;
        unsigned int reg, mask;
 
        gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
        if (val)
-               regmap_update_bits(gpio->regmap, reg, mask, mask);
+               regmap_update_bits_base(gpio->regmap, reg, mask, mask, NULL,
+                                       false, force);
        else
-               regmap_update_bits(gpio->regmap, reg, mask, 0);
+               regmap_update_bits_base(gpio->regmap, reg, mask, 0, NULL,
+                                       false, force);
 }
 
 static void gpio_regmap_set_with_clear(struct gpio_chip *chip,

--
Best,
Sander


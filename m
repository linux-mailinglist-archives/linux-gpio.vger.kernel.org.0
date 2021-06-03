Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F2F399FC3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 13:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFCLab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 07:30:31 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35130 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFCLaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 07:30:30 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184] (unknown [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 35D2B2080B3;
        Thu,  3 Jun 2021 13:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622719725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uy7edqnqtaAtBfOfz9dzIFfc/RSIZezcm98QJ+kd+pE=;
        b=rjue1kvPQCF8teUA4zwFe2KhhwYS58jf/JZvoxI2Z2CeeO6RERVPNNTrN+01Bi1VBdNwnC
        FrGIN2vSuHzr/rZrK4pmMPVjPvoJn9mTge44lYbJavcC+tkgeQ8nrWuz9RPhIX1bgEwc4K
        yxCpBCt2ejTJRaEPyqxf2oOsxhPAdCufUu1UWcevbDk/jRJln+tds0HvcZiEWvqTYnlFES
        E62QrB5ah+CPN35IsglmUoS76Ee9PNycwvVhVqwYKOpIBVtehDwG3ELV6KcjFbKYcGZb0F
        udI5N0Fl3biJbM8fOFPoZyPGAlLmwnfD24b9cc6Ohbl0AOKIPGTVFuMmxanD5g==
Message-ID: <acc18a3b1c02b8f89023451d816031e70bec9320.camel@svanheule.net>
Subject: Re: [PATCH v4 3/5] mfd: Add RTL8231 core device
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 03 Jun 2021 13:28:42 +0200
In-Reply-To: <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1622713678.git.sander@svanheule.net>
         <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
         <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-06-03 at 13:58 +0300, Andy Shevchenko wrote:
> On Thu, Jun 3, 2021 at 1:01 PM Sander Vanheule <sander@svanheule.net> wrote:
> > 
> > The RTL8231 is implemented as an MDIO device, and provides a regmap
> > interface for register access by the core and child devices.
> > 
> > The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
> > Since kernel support for SMI is limited, and no real-world SMI
> > implementations have been encountered for this device, this is currently
> > unimplemented. The use of the regmap interface should make any future
> > support relatively straightforward.
> > 
> > After reset, all pins are muxed to GPIO inputs before the pin drivers
> > are enabled. This is done to prevent accidental system resets, when a
> > pin is connected to the parent SoC's reset line.
> > 
> > To provide different read and write semantics for the GPIO data
> > registers, a secondary virtual register range is used to enable separate
> > cacheing properties of pin input and output values.
> 
> caching
> 
> ...
> 
> 
> > +static int rtl8231_reg_read(void *context, unsigned int reg, unsigned int
> > *val)
> > +{
> > +       struct mdio_device *mdio_dev = context;
> > +       int ret;
> > +
> > +       ret = mdiobus_read(mdio_dev->bus, mdio_dev->addr,
> > RTL8231_REAL_REG(reg));
> > +
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       *val = ret & 0xffff;
> > +
> > +       return 0;
> > +}
> > +
> > +static int rtl8231_reg_write(void *context, unsigned int reg, unsigned int
> > val)
> > +{
> > +       struct mdio_device *mdio_dev = context;
> > +
> > +       return mdiobus_write(mdio_dev->bus, mdio_dev->addr,
> > RTL8231_REAL_REG(reg), val);
> > +}
> 
> Hmm... Maybe we can amend regmap-mdio to avoid duplication of the
> above? Something like xlate in gpio-regmap or so?
> 

I wanted to make the masking explicit, but since regmap-mdio currently requires
a register address width of 5 bit, it could move there.

Actually, can we safely assume that any MDIO driver implementing clause-22
access (5-bit register address width) will just ignore higher bits? In that
case, I could just drop these functions and not even modify regmap-mdio. It
appears to work for bitbanged MDIO.


> > +       mdiodev->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > GPIOD_OUT_LOW);
> 
> Missed
> 
>   if (IS_ERR(mdiodev->reset_gpio))
>     return PTR_ERR(mdiodev->reset_gpio);
> 

Will fix.

Best,
Sander



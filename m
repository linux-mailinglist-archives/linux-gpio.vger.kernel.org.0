Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F8038E624
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 14:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhEXMGP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 08:06:15 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:59454 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhEXMGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 08:06:13 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 57492202EFA;
        Mon, 24 May 2021 14:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621857884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=odmAS1D60ViFlptv2jz2ezA2bjFPCCZEbAp89OcXbXo=;
        b=9B1BHRYHPxPKJHB2HEVkRPIPIMN1cMHTFaCQ8CzuX9YCMPjAXrfDllbTgByY6WyzPvGMUn
        dRAbCEWEu0FcGORTHSGLF4LOQVa2KIb+lKUSSFfqoGpRvO+OX4HKKrdMIbJ0vNd+p1pwF0
        iIwiing62A4UkDrys6RDUXHtDAJcBPRzWwePx7fWwoyLeDXedv8WOOZYagse4Hy99kMUgU
        jXSA3nfIJNE37gjl+vyzV+H9p/WH4R+j3V9HVCO8e01K8SLZS/hs3TekCgX7Nq6Nx9gLTW
        7zOL9fDeGEE/NYXhi5DUQFQ/QVKFdv7jupk2WThklBzJouay9TeMr3CZAw+MxA==
Message-ID: <08375439546c04d32b158c20fb59446c3bbafb46.camel@svanheule.net>
Subject: Re: [PATCH v3 6/6] leds: Add support for RTL8231 LED scan matrix
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 24 May 2021 14:04:42 +0200
In-Reply-To: <CAHp75VdoSfO3Y9Lf+fcoG2=Rb+SBJKq+B0tG+gS7TaHUmN-iYg@mail.gmail.com>
References: <cover.1621809029.git.sander@svanheule.net>
         <213ab7580a1d3229d32f7aac67bf4e828612153a.1621809029.git.sander@svanheule.net>
         <CAHp75VdoSfO3Y9Lf+fcoG2=Rb+SBJKq+B0tG+gS7TaHUmN-iYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-24 at 13:24 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:
> > 
> > Both single and bi-color scanning modes are supported. The driver will
> > verify that the addresses are valid for the current mode, before
> > registering the LEDs. LEDs can be turned on, off, or toggled at one of
> > six predefined rates from 40ms to 1280ms.
> > 
> > Implements a platform device for use as a child device with RTL8231 MFD,
> > and uses the parent regmap to access the required registers.
> 
> ...
> 
> > +         This options enables support for using the LED scanning matrix
> > output
> 
> option

Fixed.

> 
> > +         of the RTL8231 GPIO and LED expander chip.
> > +         When built as a module, this module will be named leds-rtl8231.
> 
> ...
> 
> > +               interval_ms = 500;
> 
> Does this deserve a #define?

Fine by me. Doesn't make a difference for the binary anyway, but it helps
document the code a bit.

> ...
> 
> > +       ret = fwnode_property_count_u32(fwnode, "reg");
> > +       if (ret < 0)
> > +               return ret;
> > +       if (ret != 2)
> > +               return -ENODEV;
> 
> I would say -EINVAL, but -ENODEV is similarly okay.

Any specific reason you think EINVAL is more appropriate than ENODEV?


> ...
> 
> > +       int err;
> 
> ret or err? Be consistent across a single driver.

I had first used 'err' for both fwnode_property_count_u32() and
fwnode_property_read_u32_array(). The former returns "actual count or error
code", while the latter is only "error code". And I found it weird to read the
code as "does error code equal 2", if I used 'err' as variable name.

I've split this up:
 * addr_count for fwnode_property_count_u32's result
 * err for fwnode_property_read_u32_array's result

Since addr_count is only used before err is touched, I guess the compiler will
optimize this out anyway?


Best,
Sander


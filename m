Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC6538DD48
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 23:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhEWVaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 17:30:18 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:43320 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhEWVaR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 17:30:17 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa] (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 48C21202A02;
        Sun, 23 May 2021 23:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621805329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n4ZTw0oX1Qb/PM15yNceteoKKKcaxzCq0OAqV4YPumc=;
        b=rNFczBjN2pCjDaiplutlYK2uaqFaPPedayWFP/qwU3DBKX+jBscixIDMnPTTtshdWyBU6x
        jcipXmMgfmv35DldYStUeHTo+0N6s0ZAEsgPrx166JW0as3e0ENc/fXyaciFcHCwKAOCDY
        YDhdV+zcFksTmEbge1CVM0+ByLhPutzM5dmOkuRoRdKQY8d0N/+DAcwRWRlIOI2pmmAF0Y
        9KsDYtV/x6rgZtkNGZbcUz2iDu0Pj/H3yxD62Yjv5TDN2VraOHHlOMYw+iOgvcSPgpaVSA
        29r80oxkCrX/GZwfkTTlFhBZnCE7qb3Fl6HWhpLLa+6G1th2n8tsmlzqtQfFpg==
Message-ID: <7b5235057380d5997d8f91e70bc8782137c726e1.camel@svanheule.net>
Subject: Re: [PATCH v2 5/7] mfd: Add RTL8231 core device
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Date:   Sun, 23 May 2021 23:28:48 +0200
In-Reply-To: <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com>
References: <cover.1621279162.git.sander@svanheule.net>
         <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
         <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

I've implemented the minor remarks (redundant assignments, if/else code
structure...). Some extra details below.

On Tue, 2021-05-18 at 00:18 +0300, Andy Shevchenko wrote:
> On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
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
> 
> > [missing MDIO_BUS dependency, provided via REGMAP_MDIO]
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> What is the culprit? Shouldn't this have a Fixes tag?

But it doesn't actually fix an issue created by an existing commit, just
something that was wrong in the first version of the patch.  This patch is not
dedicated to fixing that single issue though, it's just a part of it. Hence the
note above the Reported-by tag.

> > 
> > +       mdiodev->reset_gpio = gpiod_get_optional(dev, "reset",
> > GPIOD_OUT_LOW);
> > +       device_property_read_u32(dev, "reset-assert-delay", &mdiodev-
> > >reset_assert_delay);
> > +       device_property_read_u32(dev, "reset-deassert-delay", &mdiodev-
> > >reset_deassert_delay);
> > +
> > +       err = rtl8231_init(dev, map);
> > +       if (err)
> 
> Resource leakage.

Replaced gpiod_get_optional by devm_gpiod_get_optional.

> 
> > +               return err;
> > +
> > +       /* LED_START enables power to output pins, and starts the LED engine
> > */
> > +       regmap_field_write(led_start, 1);
> 
> > +       return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, rtl8231_cells,
> > +               ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);
> 
> Ditto.
> 
> > +}
> 
> ...
> 
> > +#ifdef CONFIG_PM
> 
> Replace this with __maybe_unused attribute.

Done. I've also used a few extra macros from PM header to clean this part up a
bit more.



Best,
Sander


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6EF38E23D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 10:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbhEXIZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 04:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbhEXIZH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 04:25:07 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84499C06138A
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 01:23:39 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 9DDD6202DEE;
        Mon, 24 May 2021 10:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621844617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uOEL5PVKTSUVqkse2nPy0LK4tHDeHxRnITwOHkYlUW8=;
        b=rqSTd/u4vzlzBctH2x2b+Ywq6+PBJXlKX09/61rlwGcukDMom3rzHQIF2HFoNf1RS4gzwH
        kJsdq9Cm4gvMxI3rpEloPpZjl9Sn861VEXq3qmkK20JWnzVZMnoOmehF5paEaMoS9HKpfh
        n3i/gRp+zCcIscFKFjUiZc4J1fJ5DVnUWZcNVOFBCy0aPEOGVTpUFEmoYjl4A+Yz5MXgnT
        PSTIs9wPUen+mefNSF6Y83gSHEcvMJib7B2ftSh15c9Wnyr+rKG4uWUDo7vFbPmG3buL4A
        MwEC2I5Ajz8DZWetaWNjvugtwJFh0O64eTdXKHLNH7O9O6tmOhUrt6RdbomGOQ==
Message-ID: <cb8593ab7a70528528bae3de45e33fae68a9ec1c.camel@svanheule.net>
Subject: Re: [PATCH v3 4/6] mfd: Add RTL8231 core device
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
Date:   Mon, 24 May 2021 10:23:35 +0200
In-Reply-To: <CAHp75VcbRKGYSJZK_Rg969-Uck=h+8byWt0B3MtQJDqwbdf2sw@mail.gmail.com>
References: <cover.1621809029.git.sander@svanheule.net>
         <6d14b72bc545a818675d99c8e91e99c96cc3e286.1621809029.git.sander@svanheule.net>
         <CAHp75VcbRKGYSJZK_Rg969-Uck=h+8byWt0B3MtQJDqwbdf2sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, 2021-05-24 at 11:02 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:
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
> ...
> 
> > [missing MDIO_BUS dependency, provided via REGMAP_MDIO]
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> What does this fix? Shouldn't it have a Fixes tag? (Yes, I know that
> you answered in the other email, but here is a hint: before settling
> these kinds of things do not send a new version. Instead of speeding
> up the review you are closer to the chance to have this been not
> applied for v5.14 at all)
> 

I'll drop this from the commit message, if this isn't appropriate without a
Fixes-tag (which I can't provide anyway).


> ...
> 
> > +       /* SOFT_RESET bit self-clears when done */
> > +       regmap_update_bits(map, RTL8231_REG_PIN_HI_CFG,
> > +               RTL8231_PIN_HI_CFG_SOFT_RESET,
> > RTL8231_PIN_HI_CFG_SOFT_RESET);
> 
> > +       usleep_range(1000, 10000);
> 
> It's strange to see this big range of minimum and maximum sleep.
> Usually the ratio should not be bigger than ~3-4 between the values.

I could also change this from a usleep to a polling loop that checks (with a
loop limit) if the reset bit has self-cleared already. 

The datasheet that I have doesn't mention how fast it should self-clear. So I
checked, and it appears to be done after one loop iteration already. So,
certainly faster than the current usleep.

Would a polling loop (with maybe like max. 10 iterations) be a good alternative
for you?

> 
> ...
> 
> > +       regmap_write(map, RTL8231_REG_PIN_MODE0, 0xffff);
> > +       regmap_write(map, RTL8231_REG_GPIO_DIR0, 0xffff);
> > +       regmap_write(map, RTL8231_REG_PIN_MODE1, 0xffff);
> > +       regmap_write(map, RTL8231_REG_GPIO_DIR1, 0xffff);
> 
> GENMASK() ?
> Actually it seems it deserves a special definition like
> 
> ..._ALL_PIN_MASK  GENMASK(15, 0)

Ok, I'll add the extra macro to clarify the intent of the values.


Best,
Sander



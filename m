Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5122ED214
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 15:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbhAGO0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 09:26:30 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:55122 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbhAGO0a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 09:26:30 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kxWET-00GgMj-PS; Thu, 07 Jan 2021 15:25:45 +0100
Date:   Thu, 7 Jan 2021 15:25:45 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sandor Yu <sandor.yu@nxp.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the
 'registers-default' property
Message-ID: <X/cZ6QguhQr3c2XH@lunn.ch>
References: <20201230214918.17133-1-festevam@gmail.com>
 <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
 <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5C3mSbOV_4MOUQb30SofF2tdCue+-yhSf3gJPHncXZF+A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 09:16:31AM -0300, Fabio Estevam wrote:
> Hi Linus,
> 
> On Tue, Jan 5, 2021 at 12:35 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > So should the ethernet PHY not just have some reset-gpios
> > that it obtain and de-assert as part of probing?
> >
> > For example drivers/net/phy/mdio_bus.c has this:
> >
> >         /* de-assert bus level PHY GPIO reset */
> >         gpiod = devm_gpiod_get_optional(&bus->dev, "reset", GPIOD_OUT_LOW);
> >
> > Other drivers can do the same.
> >
> > Deferred probe should ascertain that this GPIO driver gets
> > loaded before the ethernet phy driver.
> 
> Thanks for your review. I investigated this further and it seems to me
> that the issue is in drivers/net/phy/mdio_bus.c, so I am adding some
> netdev folks.
> 
> The driver drivers/net/phy/mdio_bus.c and the yaml description says
> that it only supports one bus level PHY GPIO reset via reset-gpios
> property.
> 
> On the imx6ul-evk, there are two KSZ8081 PHYs in the same mdio bus, so
> this is how I described it in dts:

There are two different GPIO supported. There is the bus GPIO you have
found, which is intended to reset all devices on the MDIO bus.

And there is a per device GPIO reset and reset controller. However, in
order to use these, you need to be able to 'discover' the PHY,
potentially when the device is held in reset. Some devices will
respond to MDIO while held in reset, some don't. If you PHYs don't you
need to add a compatible of the form
ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$ with the PHY ID. The PHY
will then be probed, independent of if it can be found on the bus or
not, and that probing will enable the GPIO.

     Andrew

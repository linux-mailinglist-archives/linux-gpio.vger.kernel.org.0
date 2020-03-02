Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB6017603D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 17:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCBQov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 11:44:51 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:49264 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgCBQou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 11:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Db4N5RoeZpBqkyfQn2cjA7DvkkRvJVrKvDaxzHmGOoQ=; b=BEMadxDuaUoFQKUjh4nNDeXTt
        fonqrpNwJvY8x3p+/lIadBjI70zp3S+eUkrYMqBSYJqZzk0REK6OBxWBjTHq1le0auuHr4maSFkLG
        sejqg/06OQthx7bHf+N93wHyEz+rhteHPt1AgTC9eRzjJAWjLQwCXTp3qVawHMfNOiwbPSvkWqwMx
        9BVeuNKNe44SAsHJjJcVOqvI/yvj9+YrQqwr5pqsr8qKGx70P5lPPeZSWs5of82p0PnhZMv8PYjTQ
        WlYWEmxvRMT+QYtCOMM/DGTehaUXist1iRwB8mGV1oJX16E+xRNvcbAfI23qMAp7ozQBO8OPD2QdJ
        Y6+EmQJng==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:47796)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j8oBR-0002XR-Fc; Mon, 02 Mar 2020 16:44:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j8oBP-000544-FV; Mon, 02 Mar 2020 16:44:43 +0000
Date:   Mon, 2 Mar 2020 16:44:43 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Romain Izard <romain.izard.pro@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
Message-ID: <20200302164443.GI25745@shell.armlinux.org.uk>
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200302083959.wju5vz3acuka2edq@pengutronix.de>
 <20200302093607.GG25745@shell.armlinux.org.uk>
 <CACRpkdbADQ5+Tp9NDgQx20Y0QTcE_go2qzi7dJL9HLu8PU1Smg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbADQ5+Tp9NDgQx20Y0QTcE_go2qzi7dJL9HLu8PU1Smg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 02, 2020 at 05:34:19PM +0100, Linus Walleij wrote:
> On Mon, Mar 2, 2020 at 10:36 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > On Mon, Mar 02, 2020 at 09:39:59AM +0100, Uwe Kleine-König wrote:
> 
> > >  - Sometimes it is useful to make use of a GPIO and a dedicated function
> > >    on the same pin in a driver (e.g. an i2c driver might need to switch
> > >    to gpio to do a bus recovery). The automatic pinmuxing then has
> > >    strange side effect because you have to remux the pins after
> > >    requesting the GPIOs even if you didn't drive the pins as GPIO and
> > >    there is a short time where the pin function isn't the dedicated
> > >    one.
> >
> > It's worse than that for the i2c driver.  The pins are muxed to the i2c
> > function when the driver binds.  When the i2c driver claims the GPIOs
> > corresponding with those pins, they get switched to GPIO mode behind
> > the back of pinctrl.  You then have to _explicitly_ switch pinctrl to
> > GPIO mode and back to I2C mode to get them back to I2C mode.
> 
> That's especially annoying. I would consider adding a specific
> consumer flag for GPIOs used this way, in additon to
> GPIOD_ASIS, something like GPIOD_ASIS_NOMUX
> (thinking of better names).

It's very annoying, and I believe something I did point out in my email
about it when I discovered it towards the end of last year.

Having a way to avoid the muxing would be a very good idea, as there
are cases where we really should not be taking the I2C pins away from
the controller during driver initialisation.  In the case of i2c-pxa,
when the pins are taken away, the controller sees the disconnected SCL
and SDA lines go low, and it can assume that the bus is busy as a
result, or worse see it as a START condition if SDA goes low while SCL
is high.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

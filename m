Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC101765F4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 22:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCBVaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 16:30:08 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60803 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgCBVaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 16:30:07 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j8sdY-0008Bh-Lg; Mon, 02 Mar 2020 22:30:04 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j8sdW-0003qt-TN; Mon, 02 Mar 2020 22:30:02 +0100
Date:   Mon, 2 Mar 2020 22:30:02 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
Message-ID: <20200302213002.ajeujnuox6ioi2ua@pengutronix.de>
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200302083959.wju5vz3acuka2edq@pengutronix.de>
 <20200302093607.GG25745@shell.armlinux.org.uk>
 <CACRpkdbADQ5+Tp9NDgQx20Y0QTcE_go2qzi7dJL9HLu8PU1Smg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbADQ5+Tp9NDgQx20Y0QTcE_go2qzi7dJL9HLu8PU1Smg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

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

This is not only relevant for GPIOD_ASIS. GPIOs for recovery are
registered (in the case of i2c-imx) with:

        rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);

so we'd need a _NOMUX variant for each gpiod_flags value.

Also if a board makes use of i2c, the corresponding pins shouldn't be
muxed to GPIO if userspace requests the GPIO via gpioctl or sysfs.
(IMHO i2c isn't special here, this should apply to all used pins,
shouldn't it?)

> Since the calling site knows about this usecase we can
> open code the semantics for this specifically.

Since the calling site doesn't know if the pin is used otherwise, it
should default to _NOMUX?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF8E175619
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 09:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgCBIkE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 03:40:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33941 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgCBIkE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 03:40:04 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j8gcM-00086M-VK; Mon, 02 Mar 2020 09:40:02 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j8gcJ-00027p-Ox; Mon, 02 Mar 2020 09:39:59 +0100
Date:   Mon, 2 Mar 2020 09:39:59 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Romain Izard <romain.izard.pro@gmail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
Message-ID: <20200302083959.wju5vz3acuka2edq@pengutronix.de>
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 11:58:21AM +0100, Romain Izard wrote:
> Hello,
> 
> While experimenting with a new chip, I connected it on the SDIO
> interface on my board based on a SAMA5D2 SoC. For a first step, I need
> to drive the pins on the SDIO bus at a given level to program this new
> chip. To do so, I tried to control the GPIO lines manually by unbinding
> the SDHCI controller, and using /sys/class/gpio/export to control the
> pins, with the following code:
> 
> echo a0000000.sdio-host > /sys/bus/platform/drivers/sdhci-at91/unbind
> echo 4 > /sys/class/gpio/export
> echo low > /sys/class/gpio/PA4/direction
> 
> Unfortunately, the state of the pin does not change and it remains
> driven to 1. I checked the configuration register with devmem2, and it
> appeared that the selected function remains the SDIO function even after
> calling export.
> 
> The issue does not appear when I use a GPIO in a driver with an explicit
> pinctrl configuration in the device tree, which explains why I did not
> see it until now.
> 
> The kernel version used is Linux 5.4.22
> 
> Is this a user error from my part, or is there something missing in the
> AT91 PIO4 pinctrl driver ?

IMHO this is all as expected. There are gpio controllers that
automatically mux the matching pin, but you must not expect that.

My personal opinion on this is, that the downside of this automatic is
worse than its benefits:

 - It's not universal, as there are SoCs that don't have a single pin
   for a given GPIO, so you cannot reliably implement it for all
   controllers.

 - Sometimes it is useful to make use of a GPIO and a dedicated function
   on the same pin in a driver (e.g. an i2c driver might need to switch
   to gpio to do a bus recovery). The automatic pinmuxing then has
   strange side effect because you have to remux the pins after
   requesting the GPIOs even if you didn't drive the pins as GPIO and
   there is a short time where the pin function isn't the dedicated
   one.

So to me this is too magic and less explicit and so bad.

Just my 0.02€
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

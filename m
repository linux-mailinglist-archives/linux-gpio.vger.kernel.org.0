Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D22974FC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 10:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfHUI1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 04:27:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41115 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfHUI1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 04:27:01 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i0LxL-0006jJ-5p; Wed, 21 Aug 2019 10:26:59 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i0LxK-0007eb-66; Wed, 21 Aug 2019 10:26:58 +0200
Date:   Wed, 21 Aug 2019 10:26:58 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stefan Roese <sr@denx.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190821082658.b52g32nclknnoe6v@pengutronix.de>
References: <20190815085341.28088-1-sr@denx.de>
 <CAMuHMdXYLB1UShMjoZi6gzyxx=uOeLdVsZmhWZO5J+=As-5gdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXYLB1UShMjoZi6gzyxx=uOeLdVsZmhWZO5J+=As-5gdw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 16, 2019 at 09:16:39AM +0200, Geert Uytterhoeven wrote:
> CC Mika, who reported the initial issue
> 
> On Thu, Aug 15, 2019 at 10:53 AM Stefan Roese <sr@denx.de> wrote:
> >
> > This patch fixes a backward compatibility issue, when boards use the
> > old style GPIO suffix "-gpio" instead of the new "-gpios". This
> > potential problem has been introduced by commit d99482673f95 ("serial:
> > mctrl_gpio: Check if GPIO property exisits before requesting it").
> >
> > This patch now fixes this issue by using gpiod_count() which iterates
> > over all supported GPIO suffixes (thanks to Linus for suggesting this).
> >
> > With this change, the local string is not needed any more. This way
> > we can remove the allocation in the loop.
> >
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Pavel Machek <pavel@denx.de>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v2
> > - Use gpiod_count() to check if the GPIO exists (Linus)
> > - Remove the now unnecessary malloc in the loop (kasprintf)
> >
> >  drivers/tty/serial/serial_mctrl_gpio.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
> > index 2b400189be91..ce73b142c66b 100644
> > --- a/drivers/tty/serial/serial_mctrl_gpio.c
> > +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> > @@ -117,18 +117,11 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
> >
> >         for (i = 0; i < UART_GPIO_MAX; i++) {
> >                 enum gpiod_flags flags;
> > -               char *gpio_str;
> > -               bool present;
> > +               int count;
> >
> >                 /* Check if GPIO property exists and continue if not */
> > -               gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
> > -                                    mctrl_gpios_desc[i].name);
> > -               if (!gpio_str)
> > -                       continue;
> > -
> > -               present = device_property_present(dev, gpio_str);
> > -               kfree(gpio_str);
> > -               if (!present)
> > +               count = gpiod_count(dev, mctrl_gpios_desc[i].name);
> > +               if (count <= 0)
> >                         continue;
> >
> >                 if (mctrl_gpios_desc[i].dir_out)
> 
> Seems like both device_property_present() and gpiod_count()
> eventually call into acpi_data_get_property().
> 
> However, given
> commit 6fe9da42f1d98fdb4be1598e230aca97e66cf35d
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Tue May 23 20:03:20 2017 +0300
> 
>     gpio: acpi: Synchronize acpi_find_gpio() and acpi_gpio_count()
> 
>     If we pass connection ID to the both functions and at the same time
>     acpi_can_fallback_to_crs() returns false we will get different results,
>     i.e. the number of GPIO resources returned by acpi_gpio_count() might be
>     not correct.
> 
>     Fix this by calling acpi_can_fallback_to_crs() in acpi_gpio_count()
>     before trying to fallback.
> 
> acpi_find_gpio() and acpi_gpio_count() are supposed to use the exact
> same logic, so this patch is not gonna work as intended?!?
> 
> Note that I still find it strange that acpi_find_gpio() falls back to
> unnamed gpios if con_id != NULL, causing the problem in the first place.
> This is gonna bite us again later...

Ah, is this the reason we need an additional check before calling
gpiod_get_index_optional?

I would prefer to fix the acpi code then and drop the additional checks
in the mctrl-gpio code.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 307B5100421
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 12:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfKRLaC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 06:30:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34905 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfKRLaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 06:30:02 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iWfEC-0000Mr-Es; Mon, 18 Nov 2019 12:29:56 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iWfEA-0005iU-7K; Mon, 18 Nov 2019 12:29:54 +0100
Date:   Mon, 18 Nov 2019 12:29:54 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        m.szyprowski@samsung.com,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: fix getting nonexclusive gpiods from DT
Message-ID: <20191118112954.cpai7ncnrg7msvnf@pengutronix.de>
References: <20190916134344.26656-1-m.felsch@pengutronix.de>
 <CAMpxmJXYPSu85UmsWO2n01+fWBdw-1UeEyi3Z2LOFjNbg+m6kQ@mail.gmail.com>
 <20191118103332.bmafrl5izirbauqw@pengutronix.de>
 <CAMRc=MeEQnoR3Y0gPPzRbf0Ya39z3ME4pgc0=_DVgVD=5X0Ecg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeEQnoR3Y0gPPzRbf0Ya39z3ME4pgc0=_DVgVD=5X0Ecg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:29:04 up 3 days,  2:47, 19 users,  load average: 0.00, 0.00, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-11-18 11:56, Bartosz Golaszewski wrote:
> pon., 18 lis 2019 o 11:33 Marco Felsch <m.felsch@pengutronix.de> napisał(a):
> >
> > Hi Bart,
> >
> > On 19-09-17 09:53, Bartosz Golaszewski wrote:
> > > pon., 16 wrz 2019 o 15:43 Marco Felsch <m.felsch@pengutronix.de> napisał(a):
> > > >
> > > > Since commit ec757001c818 ("gpio: Enable nonexclusive gpiods from DT
> > > > nodes") we are able to get GPIOD_FLAGS_BIT_NONEXCLUSIVE marked gpios.
> > > > Currently the gpiolib uses the wrong flags variable for the check. We
> > > > need to check the gpiod_flags instead of the of_gpio_flags else we
> > > > return -EBUSY for GPIOD_FLAGS_BIT_NONEXCLUSIVE marked and requested
> > > > gpiod's.
> > > >
> > > > Fixes: ec757001c818 gpio: Enable nonexclusive gpiods from DT nodes
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  drivers/gpio/gpiolib.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index d9074191edef..e4203c1eb869 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -4303,7 +4303,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
> > > >         transitory = flags & OF_GPIO_TRANSITORY;
> > > >
> > > >         ret = gpiod_request(desc, label);
> > > > -       if (ret == -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
> > > > +       if (ret == -EBUSY && (dflags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
> > > >                 return desc;
> > > >         if (ret)
> > > >                 return ERR_PTR(ret);
> > > > --
> > > > 2.20.1
> > > >
> > >
> > > Queued for fixes, thanks.
> >
> > I rebased my patch stack ontop of -rc8 and didn't saw this commit. Is
> > this intended?
> >
> 
> I'm not sure what you mean, it's been in mainline since v5.4-rc2 as
> commit be7ae45cfea9 ("gpio: fix getting nonexclusive gpiods from DT").
> 
> Bart

Arrg.. I checked the drivers/gpio/gpiolib.c file but it is within
gpiolib-of.c. Sorry for the noise.

Regards,
  Marco

> > Regards,
> >   Marco
> >
> > > Bart
> > >
> >
> > --
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

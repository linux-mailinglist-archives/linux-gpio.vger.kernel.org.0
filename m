Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBCA10F8FB
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 08:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfLCHir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 02:38:47 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38275 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLCHiq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 02:38:46 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ic2lf-0006ab-40; Tue, 03 Dec 2019 08:38:43 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ic2ld-0007Cq-KN; Tue, 03 Dec 2019 08:38:41 +0100
Date:   Tue, 3 Dec 2019 08:38:41 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "rjui@broadcom.com" <rjui@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alice Guo <alice.guo@nxp.com>
Subject: Re: [PATCH 2/2] gpio: bcm-kona: use platform_irq_count
Message-ID: <20191203073841.6j5viopvzpuckmzo@pengutronix.de>
References: <1575352925-17271-1-git-send-email-peng.fan@nxp.com>
 <1575352925-17271-2-git-send-email-peng.fan@nxp.com>
 <20191203065751.w23dypag4745qv7i@pengutronix.de>
 <AM0PR04MB4481AD45530915B0BA18C45F88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191203071534.zqxlizjkav4ul2n5@pengutronix.de>
 <AM0PR04MB4481DE4769CA2504B3EDD4C588420@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB4481DE4769CA2504B3EDD4C588420@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 03, 2019 at 07:23:14AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 2/2] gpio: bcm-kona: use platform_irq_count
> > 
> > On Tue, Dec 03, 2019 at 07:00:40AM +0000, Peng Fan wrote:
> > > > Subject: Re: [PATCH 2/2] gpio: bcm-kona: use platform_irq_count
> > > >
> > > > On Tue, Dec 03, 2019 at 06:04:27AM +0000, Peng Fan wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > Use platform_irq_count to replace of_irq_count
> > > > >
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > >
> > > > > V1:
> > > > >  Code inspection, not tested
> > > > >
> > > > >  drivers/gpio/gpio-bcm-kona.c | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpio/gpio-bcm-kona.c
> > > > > b/drivers/gpio/gpio-bcm-kona.c index 4122683eb1f9..c50721980a7c
> > > > 100644
> > > > > --- a/drivers/gpio/gpio-bcm-kona.c
> > > > > +++ b/drivers/gpio/gpio-bcm-kona.c
> > > > > @@ -19,7 +19,6 @@
> > > > >  #include <linux/io.h>
> > > > >  #include <linux/gpio/driver.h>
> > > > >  #include <linux/of_device.h>
> > > > > -#include <linux/of_irq.h>
> > > > >  #include <linux/init.h>
> > > > >  #include <linux/irqdomain.h>
> > > > >  #include <linux/irqchip/chained_irq.h> @@ -586,7 +585,7 @@ static
> > > > > int bcm_kona_gpio_probe(struct platform_device *pdev)
> > > > >
> > > > >  	kona_gpio->gpio_chip = template_chip;
> > > > >  	chip = &kona_gpio->gpio_chip;
> > > > > -	kona_gpio->num_bank = of_irq_count(dev->of_node);
> > > > > +	kona_gpio->num_bank = platform_irq_count(pdev);
> > > >
> > > > of_irq_count returns 0 or a positive int while platform_irq_count
> > > > might return a negative error code. This needs handling. Also I
> > > > wonder why
> > > > platform_irq_count() is better than of_irq_count() which would be
> > > > good to describe in the commit log.
> > >
> > > Inspired from
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml
> > > .org%2Flkml%2F2015%2F11%2F18%2F466&amp;data=02%7C01%7Cpeng.f
> > an%40nxp.c
> > >
> > om%7C46364bf12479463df7d308d777c09b39%7C686ea1d3bc2b4c6fa92cd9
> > 9c5c3016
> > >
> > 35%7C0%7C0%7C637109541440912984&amp;sdata=awTvwwmo4692Hx7IJ
> > H%2BllEVJH7
> > > ngINufoMH8UsosU%2BA%3D&amp;reserved=0
> > > From Rob:
> > > "
> > > So I started looking at why you are using of_irq_count which drivers
> > > shouldn't need to. In patch 5 you use it to allocate memory to store
> > > the irq names, then use them here...
> > > "
> > >
> > > Is this ok?
> > 
> > I would say something like:
> > 
> > 	platform_irq_count() is the more generic way (independent of
> > 	device trees) to determine the count of available interrupts. So
> > 	use this instead.
> > 
> > 	As platform_irq_count() might return an error code (which
> > 	of_irq_count doesn't) some additional handling is necessary.
> 
> Thanks, how about this change?
> @@ -586,11 +585,15 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
> 
>         kona_gpio->gpio_chip = template_chip;
>         chip = &kona_gpio->gpio_chip;
> -       kona_gpio->num_bank = of_irq_count(dev->of_node);
> -       if (kona_gpio->num_bank == 0) {
> +       ret = platform_irq_count(pdev);
> +       if (!ret) {
>                 dev_err(dev, "Couldn't determine # GPIO banks\n");
>                 return -ENOENT;
> +       } else if (ret < 0) {
> +               return ret;

This is inconsitent. In the ret==0 case you emit an error message, in
the ret < 0 case you don't. I think the sensible approach would be to
do:

	if (ret == 0) {
		dev_err(dev, "Couldn't determine # GPIO banks\n");
		return -ENOENT;
	} else if (ret < 0) {
		if (ret != -EPROBE_DEFER)
			dev_err(dev, "Failed to determine count of GPIO banks (%pe)\n", ERR_PTR(ret));
		return ret;
	}

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

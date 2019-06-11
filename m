Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1B53D062
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 17:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404323AbfFKPJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 11:09:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48151 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404180AbfFKPJe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 11:09:34 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1haiOs-0007yV-NC; Tue, 11 Jun 2019 17:09:26 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1haiOn-0003yx-Dr; Tue, 11 Jun 2019 17:09:21 +0200
Date:   Tue, 11 Jun 2019 17:09:21 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Phil Reid <preid@electromag.com.au>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
        Lars Poeschel <poeschel@lemonage.de>,
        Jason Kridner <jkridner@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: pinctrl: mcp23s08: detected irqchip that is shared with multiple
 gpiochips - real of false?
Message-ID: <20190611150921.o7pr5zujp7lg5tqq@pengutronix.de>
References: <ba89e0fd-c9a9-4326-1fb3-a8b9dcb24601@electromag.com.au>
 <CACRpkdZ-2TUrNOZyiJxXfO8iJUyaJRrnQicQirR8+G3M=+an0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ-2TUrNOZyiJxXfO8iJUyaJRrnQicQirR8+G3M=+an0g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:30:33 up 24 days, 18:48, 47 users,  load average: 0.27, 0.08,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 19-06-09 12:58, Linus Walleij wrote:
> Added Marco and a few other MCP23s08 people who may be more familiar
> with this code. (The driver is a bit complex.)
> 
> On Thu, Jun 6, 2019 at 10:59 AM Phil Reid <preid@electromag.com.au> wrote:
> 
> > Using kernel 5.1 I'm getting the following message:
> > "detected irqchip that is shared with multiple gpiochips: please fix the driver"
> >
> > Which I believe should be fixed by:
> > 19ab5ca "pinctrl: mcp23s08: Allocate irq_chip dynamic"
> >
> > However mcp23s08_probe_one() ends up calling gpiochip_set_irq_hooks() twice.
> 
> It looks strange when I look at the mcp23s08_probe_one() function
> because it goes like:
> 
> if (mcp->irq && mcp->irq_controller) {
>     ret = mcp23s08_irqchip_setup(mcp);
>     if (ret)
>         goto fail;
> }
> (...)
> if (mcp->irq)
>     ret = mcp23s08_irq_setup(mcp);
> 
> That seems wrong... but overall the code in this probe_one is pretty hard to
> follow and probably needs some refactoring.

I don't think that this is wrong since I splitted only the irqchip setup
and the hw irq line setup.

> This comes from f259f896f234 ("pinctrl: mcp23s08: fix irq and irqchip
> setup order")
> by Marco, Marco can you look into this and help us figure out why this happens?

I greped the code and found the possible failure:


static int mcp23s08_probe_one()
{
	...

	if (mcp->irq && mcp->irq_controller) {
		ret = mcp23s08_irqchip_setup(mcp);
		if (ret)
			goto fail;
	}

	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
	if (ret < 0)
		goto fail;

	...
}

The mcp23s08_irqchip_setup() call hierarchy:
mcp23s08_irqchip_setup()
  gpiochip_irqchip_add_nested()
    gpiochip_irqchip_add_key()
      gpiochip_set_irq_hooks()

The devm_gpiochip_add_data() call hierarchy:

devm_gpiochip_add_data()
  gpiochip_add_data_with_key()
    gpiochip_add_irqchip()
      gpiochip_set_irq_hooks()

The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
but we added a irqchip due to the previous mcp23s08_irqchip_setup()
call. So it calls gpiochip_set_irq_hooks() a second time. If I got this
right the proper fix is:

static int mcp23s08_probe_one()
{
	...

	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
	if (ret < 0)
		goto fail;

	if (mcp->irq && mcp->irq_controller) {
		ret = mcp23s08_irqchip_setup(mcp);
		if (ret)
			goto fail;
	}

	...
}

I checked other users of gpiochip_irqchip_add_nested() and they call
(devm_)gpiochip_add_data always infront of the
gpiochip_irqchip_add_nested() call.

I hope this helps you.

Regards,
  Marco

> 
> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

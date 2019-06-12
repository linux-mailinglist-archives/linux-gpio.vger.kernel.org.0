Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82FF4420C5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 11:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731532AbfFLJ3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 05:29:38 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35195 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731492AbfFLJ3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 05:29:38 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hazZU-00041T-FD; Wed, 12 Jun 2019 11:29:32 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hazZT-00089F-CE; Wed, 12 Jun 2019 11:29:31 +0200
Date:   Wed, 12 Jun 2019 11:29:31 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Phil Reid <preid@electromag.com.au>
Cc:     linus.walleij@linaro.org, jkridner@gmail.com, poeschel@lemonage.de,
        gustavo@embeddedor.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/1] pinctlr: mcp23s08: Fix add_data and
 irqchip_add_nested call order
Message-ID: <20190612092931.ntf77hhwyprmqvyo@pengutronix.de>
References: <1560306258-54654-1-git-send-email-preid@electromag.com.au>
 <20190612083228.jbs7ygn62q6twedp@pengutronix.de>
 <8b8275d1-e0ba-a577-a48e-4a4b90dbd108@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b8275d1-e0ba-a577-a48e-4a4b90dbd108@electromag.com.au>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:21:46 up 25 days, 15:39, 48 users,  load average: 0.14, 0.37,
 0.26
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-06-12 17:16, Phil Reid wrote:
> On 12/06/2019 16:32, Marco Felsch wrote:
> > Hi Phil,
> > 
> > thanks for the patch. Can you check that the error which should be fixed
> > by commit 02e389e6 ("pinctrl: mcp23s08: fix irq setup order") do not
> > appear. If so we should also add a Fixes line.
> > 
> G'day Marco,
> 
> I remember that one know.
> I'm also using the mcp with gpio-keys driver.
> I don't think I saw the same behaviour with my setup then.
> 
> I'm using the (spi) mcp23s16 (with gpio-keys), and Dmitry was using mcp23008 (i2c).
> 
> I noted at the time the difference in when
> i2c_set_clientdata & spi_set_drvdata are called in the spi / i2c probe paths.
> 
> It seems wrong to call i2c_set_clientdata after devm_pinctrl_register is called.
> But I'm by no means an expert.
> 
> I do have a system with an i2c variant now, but it doesn't use the gpio-keys driver.
> 
> Anyways I'm still not seeing any adverse behaviour with the patch so far.

Thanks for testing that, can you add a fixes line?

Regards,
  Marco

> 
> > Regards,
> >    Marco
> > 
> > On 19-06-12 10:24, Phil Reid wrote:
> > > Currently probing of the mcp23s08 results in an error message
> > > "detected irqchip that is shared with multiple gpiochips:
> > > please fix the driver"
> > > 
> > > This is due to the following:
> > > 
> > > Call to mcp23s08_irqchip_setup() with call hierarchy:
> > > mcp23s08_irqchip_setup()
> > >    gpiochip_irqchip_add_nested()
> > >      gpiochip_irqchip_add_key()
> > >        gpiochip_set_irq_hooks()
> > > 
> > > Call to devm_gpiochip_add_data() with call hierarchy:
> > > devm_gpiochip_add_data()
> > >    gpiochip_add_data_with_key()
> > >      gpiochip_add_irqchip()
> > >        gpiochip_set_irq_hooks()
> > > 
> > > The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
> > > but we added a irqchip due to the previous mcp23s08_irqchip_setup()
> > > call. So it calls gpiochip_set_irq_hooks() a second time.
> > > 
> > > Fix this by moving the call to devm_gpiochip_add_data before
> > > the call to mcp23s08_irqchip_setup
> > > 
> > > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Signed-off-by: Phil Reid <preid@electromag.com.au>
> > > ---
> > > 
> > > Notes:
> > >      v2:
> > >      - remove unrelated whitespace changes
> > > 
> > >   drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
> > > index 5d7a851..b727de56 100644
> > > --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> > > +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> > > @@ -881,6 +881,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
> > >   	if (ret < 0)
> > >   		goto fail;
> > > +	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> > > +	if (ret < 0)
> > > +		goto fail;
> > > +
> > >   	mcp->irq_controller =
> > >   		device_property_read_bool(dev, "interrupt-controller");
> > >   	if (mcp->irq && mcp->irq_controller) {
> > > @@ -922,10 +926,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
> > >   			goto fail;
> > >   	}
> > > -	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> > > -	if (ret < 0)
> > > -		goto fail;
> > > -
> > >   	if (one_regmap_config) {
> > >   		mcp->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
> > >   				"mcp23xxx-pinctrl.%d", raw_chip_address);
> > > -- 
> > > 1.8.3.1
> > > 
> > > 
> > 
> 
> 
> -- 
> Regards
> Phil Reid
> 
> ElectroMagnetic Imaging Technology Pty Ltd
> Development of Geophysical Instrumentation & Software
> www.electromag.com.au
> 
> 3 The Avenue, Midland WA 6056, AUSTRALIA
> Ph: +61 8 9250 8100
> Fax: +61 8 9250 7100
> Email: preid@electromag.com.au
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47AB5122B86
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 13:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfLQMb3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 07:31:29 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45109 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfLQMb3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 07:31:29 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ihC0V-0005OG-Hy; Tue, 17 Dec 2019 13:31:19 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ihC0S-0006OI-I9; Tue, 17 Dec 2019 13:31:16 +0100
Date:   Tue, 17 Dec 2019 13:31:16 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Mark Brown <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191217123116.GB29666@pengutronix.de>
References: <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <AM5PR1001MB09941005A47B603805D3C53280510@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191217090034.GD31182@pengutronix.de>
 <AM5PR1001MB099460B2D291644F088707BA80500@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB099460B2D291644F088707BA80500@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:21:27 up 110 days, 35 min, 93 users,  load average: 0.98, 1.01,
 1.03
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-12-17 09:53, Adam Thomson wrote:
> On 17 December 2019 09:01, Marco Felsch wrote:
> 
> > > > The enabel control signal is always available, please check [1] table
> > > > 63. There is a mux in front of the enable pin so:
> > > >
> > > >              +-------------
> > > >  Seq. |\     |   Regulator
> > > >  GPI1 | \    |
> > > >  GPI2 | | -- > Enable
> > > >  GPI3 | /    |
> > > >       |/     .
> > > >              .
> > > >              .
> > > >
> > > > Adam please correct me if this is wrong.
> > >
> > > Yes the register can always be configured regardless of the associated pin
> > > configuration, but if say GPIO1 was configured as a GPO but a regulator was
> > > configured to use GPIO1 as its GPI control mechanism, the output signal from
> > > GPIO1 would be ignored, the sequencer control would not have any effect and
> > > you're simply left with manual I2C control. Really we shouldn't be getting into
> > > that situation though. If a GPIO is to be used as a regulator control signal
> > > then it should be marked as such and I don't think we should be able to use that
> > > pin for anything other than regulator control.
> > 
> > I see, so we have to guarantee that the requested gpio is configured as
> > input. This can be done by:
> 
> This is one of the reasons I thought this was better suited to being done in the
> pinctrl/pinmux side. If you configure the GPIO as for regulator control then
> the code can automatically configure the GPIO for input. That doesn't then need
> to be in the regulator driver.

I still don't prefer that way.. pls check my arguments I already made
and I don't wanna repeat it again.

> But yes we wouldn't really want to configure a regulator to be controlled via a
> GPI when it's configured as a GPO as it makes no sense.

Okay, so the check is all we need to hardening the driver against wrong
usage :)

Regards,
  Marco

> 
> > 
> >   if (gpi->flags & FLAG_IS_OUT)
> >   	return -EINVAL;
> > 
> > Regards,
> >   Marco
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

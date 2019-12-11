Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB80A11B9AA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 18:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730830AbfLKRJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 12:09:35 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36571 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730812AbfLKRJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 12:09:33 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1if5UG-0005Y6-BL; Wed, 11 Dec 2019 18:09:20 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1if5UE-0002i5-93; Wed, 11 Dec 2019 18:09:18 +0100
Date:   Wed, 11 Dec 2019 18:09:18 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:23:39 up 26 days,  7:42, 33 users,  load average: 0.00, 0.00,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Adam,

On 19-12-11 16:14, Adam Thomson wrote:
> On 10 December 2019 09:42, Marco Felsch wrote:
> 
> > Hi Mark,
> > 
> > On 19-12-04 13:46, Mark Brown wrote:
> > > On Fri, Nov 29, 2019 at 06:25:34PM +0100, Marco Felsch wrote:
> > >
> > > > +  Optional regulator device-specific properties:
> > > > +  - dlg,vsel-sense-gpios : A GPIO reference to a local general purpose input,
> > > > +    the datasheet calls it GPI. The regulator sense the input signal and select
> > > > +    the active or suspend voltage settings. If the signal is active the
> > > > +    active-settings are applied else the suspend-settings are applied.
> > > > +    Attention: Sharing the same GPI for other purposes or across multiple
> > > > +    regulators is possible but the polarity setting must equal.
> > >
> > > I'm really confused by this.  As far as I understand it it seems
> > > to be doing pinmuxing on the chip using the GPIO bindings which
> > > is itself a bit odd and I don't see anything here that configures
> > > whatever sets the state of the pins.  Don't we need another GPIO
> > > to set the vsel-sense inputs on the PMIC?
> > 
> > Yes the PMIC is very configurable and it took a while till I understand
> > it.. @Adam please correct me if I'm wrong.
> > 
> > The PMIC regulators regardless of the type: ldo or buck can be
> > simplified drawn as:
> > 
> > 
> > 
> > da9062-gpio               da9062-regulator
> > 
> >   +-------------------------------------------------------
> >   |                  PMIC
> >   |
> >   > GPIO0            +--------------------------+
> >   |                  |         REGULATOR-0      |
> >   > GPIO1 -------+   |                          |
> >   |              +-- > vsel-in    voltage-a-out <
> >   > GPIO2        |   |                          |
> >   |              |   > enable-in  voltage-b-out <
> >   |              |   |                          |
> >   |              |   +--------------------------+
> >   |              |
> >   |              |   +--------------------------+
> >   |              |   |         REGULATOR-1      |
> >   |              |   |                          |
> >   |              +-- > vsel-in    voltage-a-out <
> >   |                  |                          |
> >   |                  > enable-in  voltage-b-out <
> >   |                  |                          |
> >   |                  +--------------------------+
> >   |
> > 
> > The 'vsel-in' and 'enable-in' regulator inputs must be routed to the
> > PMIC GPIOs which must be configured as input. If this is a pinmux in
> > your opinion, then yes we need to do that. IMHO it isn't a pinmux
> > because from the regulator point of view it is just a GPIO which comes
> > from our own gpio-dev (da9062-gpio). So the abstraction is vald. Anyway
> > I'm with you that this isn't the typical use-case.
> 
> We've had this discussion before and to me it felt more like pinmux than GPIO
> although I understand we're configuring the GPIO pin as input before then
> configuring a regulator to take that specific internal GPIO as the control
> signal. We're defining a specific role to this pin in HW rather than it being a
> general software handled GPI so it feels like this would be neater under pinmux.
> There does still need to be a mapping between that pin and the regulator which I
> guess would be served by passing the pin to the regulator through generic pinmux
> bindings and then in the regulator code you're simply just enabling the
> regulator to be controlled from that pin. The HW lets you control multiple
> regulators from the same input pin so there's a flexibility there to be
> captured, as you mention.

I know that we already had this discussion but the result was to wait
for the maintainers input. Since Linus is the pinctrl/gpio maintainer
and Mark the regulator maintainer we now have some input so we can move
forward. Linus made some comments on the dt-bindings and on the code but
he didn't pointed out that this usage is wrong. So I guessed it would be
fine for him. Mark did his first comments now and I explained the
current state..

I discussed it with a colleague again and he mentioned that pinctrl
should be named pinctrl instead it should be named padctrl. We don't
reconfigure the pad to a other function it is still a device general
purpose input pad. The hw-signal flow goes always trough the gpio block
so one argument more for my solution. Also we don't configure the "pad"
to be a vsel/ena-pin. The hw-pad can only be a gpio or has an alternate
function (WDKICK for GPIO0, Seq. SYS_EN for GPIO2, Seq. PWR_EN for GPIO4).
Instead we tell the regulator to use _this_ GPIO e.g. for voltage
selection so we go the other way around. My last argument why pinctrl
isn't the correct place is that the GPIO1 can be used for
regulator-0:vsel-in and for regulator-1:enable-in. So this pad would
have different states which is invalid IMHO.

Regards,
  Marco

> > Regards,
> >   Marco
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

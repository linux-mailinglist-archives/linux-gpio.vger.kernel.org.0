Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF5E11D18E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfLLPzZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:55:25 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42185 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729540AbfLLPzY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:55:24 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQo8-0002KX-2S; Thu, 12 Dec 2019 16:55:16 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQo5-000678-TI; Thu, 12 Dec 2019 16:55:13 +0100
Date:   Thu, 12 Dec 2019 16:55:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
Message-ID: <20191212155513.fevajupxi6omphzf@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <CACRpkda4PFA=99u33xsXzQND1FaP=8GXGRQULngcd5a=zFepXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda4PFA=99u33xsXzQND1FaP=8GXGRQULngcd5a=zFepXg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:51:05 up 27 days,  7:09, 36 users,  load average: 0.12, 0.17,
 0.13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 19-12-12 16:08, Linus Walleij wrote:
> On Wed, Dec 11, 2019 at 6:09 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > I discussed it with a colleague again and he mentioned that pinctrl
> > should be named pinctrl instead it should be named padctrl.
> 
> Quoting Documentation/driver-api/pinctl.rst:
> 
> (...)
> Definition of PIN:
> 
> - PINS are equal to pads, fingers, balls or whatever packaging input or
>   output line you want to control and these are denoted by unsigned integers
>   in the range 0..maxpin.
> (...)

Okay there is the definition.

> > We don't
> > reconfigure the pad to a other function it is still a device general
> > purpose input pad. The hw-signal flow goes always trough the gpio block
> > so one argument more for my solution. Also we don't configure the "pad"
> > to be a vsel/ena-pin. The hw-pad can only be a gpio or has an alternate
> > function (WDKICK for GPIO0, Seq. SYS_EN for GPIO2, Seq. PWR_EN for GPIO4).
> > Instead we tell the regulator to use _this_ GPIO e.g. for voltage
> > selection so we go the other way around. My last argument why pinctrl
> > isn't the correct place is that the GPIO1 can be used for
> > regulator-0:vsel-in and for regulator-1:enable-in. So this pad would
> > have different states which is invalid IMHO.
> 
> Yeah it is just one of these cases where the silicon designer pulled
> a line of polysilicone over to the regulator enable signal and put a
> switch on it and say "so you can also enable the regulator
> with a signal from here", it can be used in parallel with anything
> else, which is especially messy.

I didn't say that the design isn't messy ;) I just wanna make the right
abstraction and IMHO this is the correct abstraction.

Regards,
  Marco

> Special cases require special handling, since the electronic design
> of this thing is a bit Rube Goldberg.
> 
> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

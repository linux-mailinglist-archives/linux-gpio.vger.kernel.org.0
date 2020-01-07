Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392AB132183
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgAGIhF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:37:05 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43217 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgAGIhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:37:04 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iokMC-0007de-GN; Tue, 07 Jan 2020 09:36:56 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iokMA-0004B9-C9; Tue, 07 Jan 2020 09:36:54 +0100
Date:   Tue, 7 Jan 2020 09:36:54 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20200107083654.atgbjhrnhyax2gqq@pengutronix.de>
References: <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
 <20191217073533.GC31182@pengutronix.de>
 <20191217125832.GF4755@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217125832.GF4755@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:14:30 up 52 days, 23:33, 43 users,  load average: 0.00, 0.04,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mark,

On 19-12-17 12:58, Mark Brown wrote:
> On Tue, Dec 17, 2019 at 08:35:33AM +0100, Marco Felsch wrote:
> > On 19-12-16 11:44, Mark Brown wrote:
> 
> > > What I'm saying is that I think the binding needs to explicitly talk
> > > about that since at the minute it's really confusing reading it as it
> > > is, it sounds very much like it's trying to override that in a chip
> > > specific fashion as using gpiolib and the GPIO bindings for pinmuxing is
> > > really quite unusual.
> 
> > Hm.. I still think that we don't mux the pin to some special function.
> > It is still a gpio input pin and if we don't request the pin we could
> > read the input from user-space too and get a 'valid' value. Muxing would
> > happen if we change the pad to so called _alternate_ function. Anyway,
> > lets find a binding description:
> 
> I don't think any of this makes much difference from a user point of
> view.
> 
> > IMHO this is very descriptive and needs no update.
> 
> > description:
> >  - A GPIO reference to a local general purpose input, [1] calls it GPI.
> >    The DA9062 regulators can select between voltage-a/-b settings.
> >    Each regulator has a VBUCK*_GPI or VLDO*_GPI input to determine the
> >    active setting. In front of the VBUCK*_GPI/VLDO*_GPI input is a mux
> >    to select between different signal sources, valid sources are: the
> >    internal sequencer, GPI1, GPI2 and GPI3. See [1] table 63 for more
> >    information. Most the time the internal sequencer is fine but
> >    sometimes it is necessary to use the signal from the DA9062 GPI
> >    pads. This binding covers the second use case.
> >    Attention: Sharing the same GPI for other purposes or across multiple
> >    regulators is possible but the polarity setting must equal.
> 
> This doesn't say anything about how the GPIO input is expected to be
> controlled, for voltage setting any runtime control would need to be
> done by the driver and it sounds like that's all that can be controlled.
> The way this reads I'd expect one use of this to be for fast voltage
> setting for example (you could even combine that with suspend sequencing
> using the internal sequencer if you mux back to the sequencer during
> suspend).

The input signal is routed trough the da9062 gpio block to the
regualtors. You can't set any voltage value using a gpio instead you
decide which voltage setting is applied. The voltage values for
runtime/suspend comes from the dt-data. No it's not just a fast
switching option imagine the system suspend case where the cpu and soc
voltage can be reduced to a very low value. Older soc's like the imx6
signaling this state by a hard wired gpio line because the soc and
cpu cores don't work properly on such low voltage values. This is
my use case and I can't use the sequencer.

Regards,
  Marco


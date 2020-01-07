Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5CB1327DC
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgAGNid (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:38:33 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58519 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgAGNic (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:38:32 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iop3l-0007Jd-RU; Tue, 07 Jan 2020 14:38:13 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iop3j-0005N2-6B; Tue, 07 Jan 2020 14:38:11 +0100
Date:   Tue, 7 Jan 2020 14:38:11 +0100
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
Message-ID: <20200107133811.rua5i6lflzyzlh24@pengutronix.de>
References: <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
 <20191217073533.GC31182@pengutronix.de>
 <20191217125832.GF4755@sirena.org.uk>
 <20200107083654.atgbjhrnhyax2gqq@pengutronix.de>
 <20200107130911.GD4877@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107130911.GD4877@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:32:28 up 53 days,  4:51, 47 users,  load average: 0.02, 0.03,
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

On 20-01-07 13:09, Mark Brown wrote:
> On Tue, Jan 07, 2020 at 09:36:54AM +0100, Marco Felsch wrote:
> > On 19-12-17 12:58, Mark Brown wrote:
> 
> > > This doesn't say anything about how the GPIO input is expected to be
> > > controlled, for voltage setting any runtime control would need to be
> > > done by the driver and it sounds like that's all that can be controlled.
> > > The way this reads I'd expect one use of this to be for fast voltage
> > > setting for example (you could even combine that with suspend sequencing
> > > using the internal sequencer if you mux back to the sequencer during
> > > suspend).
> 
> > The input signal is routed trough the da9062 gpio block to the
> > regualtors. You can't set any voltage value using a gpio instead you
> > decide which voltage setting is applied. The voltage values for
> > runtime/suspend comes from the dt-data. No it's not just a fast
> > switching option imagine the system suspend case where the cpu and soc
> > voltage can be reduced to a very low value. Older soc's like the imx6
> > signaling this state by a hard wired gpio line because the soc and
> > cpu cores don't work properly on such low voltage values. This is
> > my use case and I can't use the sequencer.
> 
> My point is that I can't tell any of this from the description.

Therefore I want to discuss the dt-binding documentation with you and
the others to get this done. Is the above description better to
understand the dt-binding?

Regards,
  Marco

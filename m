Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0D61183D3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 10:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfLJJmC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 04:42:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56497 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfLJJmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 04:42:00 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iec1b-0006gj-AJ; Tue, 10 Dec 2019 10:41:47 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iec1Y-0003yz-IK; Tue, 10 Dec 2019 10:41:44 +0100
Date:   Tue, 10 Dec 2019 10:41:44 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, joel@jms.id.au, andrew@aj.id.au,
        lgirdwood@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191210094144.mxximpuouchy3fqu@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204134631.GT1998@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:09:56 up 25 days, 28 min, 32 users,  load average: 0.08, 0.04,
 0.01
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

On 19-12-04 13:46, Mark Brown wrote:
> On Fri, Nov 29, 2019 at 06:25:34PM +0100, Marco Felsch wrote:
> 
> > +  Optional regulator device-specific properties:
> > +  - dlg,vsel-sense-gpios : A GPIO reference to a local general purpose input,
> > +    the datasheet calls it GPI. The regulator sense the input signal and select
> > +    the active or suspend voltage settings. If the signal is active the
> > +    active-settings are applied else the suspend-settings are applied.
> > +    Attention: Sharing the same GPI for other purposes or across multiple
> > +    regulators is possible but the polarity setting must equal.
> 
> I'm really confused by this.  As far as I understand it it seems
> to be doing pinmuxing on the chip using the GPIO bindings which
> is itself a bit odd and I don't see anything here that configures
> whatever sets the state of the pins.  Don't we need another GPIO
> to set the vsel-sense inputs on the PMIC?

Yes the PMIC is very configurable and it took a while till I understand
it.. @Adam please correct me if I'm wrong.

The PMIC regulators regardless of the type: ldo or buck can be
simplified drawn as:



da9062-gpio               da9062-regulator
    
  +-------------------------------------------------------
  |                  PMIC
  |    
  > GPIO0            +--------------------------+
  |                  |         REGULATOR-0      |
  > GPIO1 -------+   |                          |
  |              +-- > vsel-in    voltage-a-out <
  > GPIO2        |   |                          |
  |              |   > enable-in  voltage-b-out <
  |              |   |                          |
  |              |   +--------------------------+
  |              |                              
  |              |   +--------------------------+                          
  |              |   |         REGULATOR-1      |                          
  |              |   |                          |                          
  |              +-- > vsel-in    voltage-a-out <                          
  |                  |                          |                          
  |                  > enable-in  voltage-b-out <
  |                  |                          |
  |                  +--------------------------+
  |

The 'vsel-in' and 'enable-in' regulator inputs must be routed to the
PMIC GPIOs which must be configured as input. If this is a pinmux in
your opinion, then yes we need to do that. IMHO it isn't a pinmux
because from the regulator point of view it is just a GPIO which comes
from our own gpio-dev (da9062-gpio). So the abstraction is vald. Anyway
I'm with you that this isn't the typical use-case.

Regards,
  Marco 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

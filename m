Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B34D10B0D0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 15:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfK0OEB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 09:04:01 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49935 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfK0OEB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 09:04:01 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxv9-0006Fb-Hn; Wed, 27 Nov 2019 15:03:55 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxv8-00023l-Ng; Wed, 27 Nov 2019 15:03:54 +0100
Date:   Wed, 27 Nov 2019 15:03:54 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <marc.zyngier@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
Message-ID: <20191127140354.3cmtrh53npbqmrkj@pengutronix.de>
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-3-m.felsch@pengutronix.de>
 <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:59:53 up 12 days,  5:18, 24 users,  load average: 0.01, 0.02,
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

Hi Linus,

thanks for your feedback.

On 19-11-27 14:35, Linus Walleij wrote:
> On Wed, Nov 27, 2019 at 12:56 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > Currently the da9062 GPIO's aren't available. The patch adds the support
> > to make these available by adding a gpio device with the corresponding
> > irq resources. Furthermore the patch fixes a minor style issue for the
> > onkey device.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> This is a regmap irqchip so I guess not much to say about it.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> HOWEVER: this looks very much hierarchical does it not?

Yes it that's right and I converted it upon Bartosz comments.

> I can clearly see that regmap's irqchip does not support
> hierarchical interrupt domains, so we should just make a
> mental note somewhere that "oh yeah and then one day
> we should make regmap irqchips play well with hierarchical
> interrupts".

That's right, should I add this somewhere and if the answer is yes then
where?

Regards,
  Marco

> 
> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

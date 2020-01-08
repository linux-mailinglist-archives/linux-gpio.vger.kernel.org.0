Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1823D133C76
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 08:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgAHHw5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 02:52:57 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57589 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgAHHw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 02:52:57 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ip696-0006TA-I9; Wed, 08 Jan 2020 08:52:52 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ip691-0007Fs-TD; Wed, 08 Jan 2020 08:52:47 +0100
Date:   Wed, 8 Jan 2020 08:52:47 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Peng Fan <peng.fan@nxp.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Message-ID: <20200108075247.y5ex44flp6lvqeoc@pengutronix.de>
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
 <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
 <AM0PR04MB4481B3EAB2DDC42A137E8AAB88530@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CAOMZO5BK0Pa6Aw6n7Tf+C6+Fg15WNbEUOzKCQTaWqTUu6yoPjA@mail.gmail.com>
 <20191218145955.GE26938@lunn.ch>
 <CAOMZO5BibF5A9sw=fLr3DXLf9LXYdxWy=aK7KCE3L0bt5eX+9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BibF5A9sw=fLr3DXLf9LXYdxWy=aK7KCE3L0bt5eX+9Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Fabio,

On Wed, Dec 18, 2019 at 12:09:42PM -0300, Fabio Estevam wrote:
> On Wed, Dec 18, 2019 at 12:00 PM Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > Hi Fabio
> >
> > Look closer. This is not about returning an error, it is about
> > printing an error.
> >
> > I think the API could better. A %ie formatter would make a lot of
> > sense, so avoiding the ERR_PTR().
> 
> Yes, I think that returning the error like:
> 
> dev_err(dev, "Couldn't determine irq count: %d\n", nr_irq_parent);
> 
> would make the code cleaner.

Are you aware of the semantic difference between

	dev_err(..., "Couldn't determine irq count: %d\n", nr_irq_parent);

and

	dev_err(..., "Couldn't determine irq count: %pe\n", ERR_PTR(nr_irq_parent));

? The first yields:

	Couldn't determine irq count: -5

while the latter yields

	Couldn't determine irq count: -EIO

which is more expressive.

I agree that having a format for printing an integer error code would be
useful. I have this on my todo-list but having some %pe with ERR_PTR
conversion would help me arguing my case.

So I would like the patch to go in with ERR_PTR even though v2 was sent
using %d today.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

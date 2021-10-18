Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC8D431703
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 13:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhJRLQ4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 18 Oct 2021 07:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhJRLQ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 07:16:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D90C06161C
        for <linux-gpio@vger.kernel.org>; Mon, 18 Oct 2021 04:14:45 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcQbE-0006vn-QW; Mon, 18 Oct 2021 13:14:36 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcQbD-00082c-IT; Mon, 18 Oct 2021 13:14:35 +0200
Message-ID: <14aa7bde4028007496dfbf041ab5000eb437941e.camel@pengutronix.de>
Subject: Re: [PATCH v6 2/2] pinctrl: microchip sgpio: use reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 18 Oct 2021 13:14:35 +0200
In-Reply-To: <20211018111231.bawmvre4dqow65dy@soft-dev3-1.localhost>
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
         <20211018085754.1066056-3-horatiu.vultur@microchip.com>
         <6f46c5ab7458e1368abfeb8dee6e24271f39d236.camel@pengutronix.de>
         <20211018111231.bawmvre4dqow65dy@soft-dev3-1.localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-10-18 at 13:12 +0200, Horatiu Vultur wrote:
> The 10/18/2021 12:37, Philipp Zabel wrote:
> 
> Hi Philipp,
> > Hi Horatiu,
> > 
> > On Mon, 2021-10-18 at 10:57 +0200, Horatiu Vultur wrote:
> > > On lan966x platform when the switch gets reseted then also the sgpio
> > > gets reseted. The fix for this is to extend also the sgpio driver to
> > > call the reset driver which will be reseted only once by the first
> > > driver that is probed.
> > > 
> > > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > > ---
> > >  drivers/pinctrl/pinctrl-microchip-sgpio.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > > index 072bccdea2a5..78765faa245a 100644
> > > --- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > > +++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/pinctrl/pinmux.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/property.h>
> > > +#include <linux/reset.h>
> > > 
> > >  #include "core.h"
> > >  #include "pinconf.h"
> > > @@ -803,6 +804,7 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
> > >       int div_clock = 0, ret, port, i, nbanks;
> > >       struct device *dev = &pdev->dev;
> > >       struct fwnode_handle *fwnode;
> > > +     struct reset_control *reset;
> > >       struct sgpio_priv *priv;
> > >       struct clk *clk;
> > >       u32 val;
> > > @@ -813,6 +815,11 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
> > > 
> > >       priv->dev = dev;
> > > 
> > > +     reset = devm_reset_control_get_optional_shared(&pdev->dev, "switch");
> > 
> > This is the first GPIO driver that I am aware of that requests a named
> > reset control, so I'm still not sure if this should be called "switch"
> > instead of "gpio" or just "reset", just in case there is a future model
> > where the GPIO controller reset is not shared with the switch reset.
> 
> I agree, it is not the best name. But the name "switch" was already used
> in DT by sparx5[1], so I just went with this name.

Oh, ok, in that case the decision already has been made.

regards
Philipp

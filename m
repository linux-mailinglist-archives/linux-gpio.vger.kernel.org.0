Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F9E42A77D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 16:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235355AbhJLOng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 10:43:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:32061 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbhJLOng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 10:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634049694; x=1665585694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uaKFVdc8S/VvWiZuXCUCkebK43ut9xuhbG5d0/Im4a4=;
  b=kbI6+nHosBQ9OCvaxLaD++uvkYC3ktxC8VDLSF4ZYIFGCWc/2ia8uQhw
   0Zw1AV/8FXYzEarwe6msRVXljxZ95dK02KpT17O9qWoLCl7BwBN+jnM59
   WGzjOVAK+TmuaX1IKDjOYXw8ReaJJ2nubEnplyiej0ku2vLfqFHvYPP0l
   mRas97c9O5rXc8yB0NUwbtlGtAd/F8qS4XEEKvUn1IxrCCQGW7fnC+L5w
   7mWWOJI7D51syfWkegDLVuh8oFwfvZ8qpMUeF6Cgud++WmAkoYDcWgINg
   OrlURSJmjSXUe9Ue05Q9olrN41AvKxVCM93ASjKrgyDToQohPlLyRiNjR
   A==;
IronPort-SDR: G5/0/w2zkA1J/kUitsL+TTmBuTT6zOQBYeRhnhdJ1xc+U88DRMABe9O5d/81kVSnERBHzCd2OA
 j8zVGqYj16GEvBA4cnAI/ethiQWXoh9KJ4Y8iQp1HPVPFQMYCceyuBO/KnJgXmx4hinrU9D7s3
 h8wXxHdNWs7RfDwoRj9Ta6dJxGcVDy+0uynZhqJtGnFHj3FM5+BnVGDMVlF0B79k9T7s4XANfG
 IFxSKUYcQrmk58k87mAUHYVOyduXGMvW2TDUkJtAP9q4PDbplxLvgGuZdZUWBoRV062jl+zD8/
 x5GK9Wb2BhJ62/SgcXMCGxhX
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="132723629"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 07:41:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 07:41:33 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 12 Oct 2021 07:41:33 -0700
Date:   Tue, 12 Oct 2021 16:43:05 +0200
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: microchip sgpio: use reset driver
Message-ID: <20211012144305.cfvvtqlscnrhsvx2@soft-dev3-1.localhost>
References: <20211012122435.2081930-1-horatiu.vultur@microchip.com>
 <ea3b5be735f51dd7c9ac7e77a19596b0e4ced740.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ea3b5be735f51dd7c9ac7e77a19596b0e4ced740.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Philipp,

The 10/12/2021 15:40, Philipp Zabel wrote:
> 
> On Tue, 2021-10-12 at 14:24 +0200, Horatiu Vultur wrote:
> > On lan966x platform when the switch gets reseted then also the sgpio
> > gets reseted. The fix for this is to extend also the sgpio driver to
> > call the reset driver which will be reseted only once by the first
> > driver that is probed.
> >
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > index 072bccdea2a5..e8a91d0824cb 100644
> > --- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > +++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/pinctrl/pinmux.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > +#include <linux/reset.h>
> >
> >  #include "core.h"
> >  #include "pinconf.h"
> > @@ -803,6 +804,7 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
> >       int div_clock = 0, ret, port, i, nbanks;
> >       struct device *dev = &pdev->dev;
> >       struct fwnode_handle *fwnode;
> > +     struct reset_control *reset;
> >       struct sgpio_priv *priv;
> >       struct clk *clk;
> >       u32 val;
> > @@ -813,6 +815,10 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
> >
> >       priv->dev = dev;
> >
> > +     reset = devm_reset_control_get_shared(&pdev->dev, "switch");
> 
> This seems to be missing an update to the devicetree binding.

Yes, I will fix this in the next version.

> 
> Just to make sure we aren't introducing a circular dependency here, are
> the PHY reset GPIOs that are toggled by the "switch" reset controller in
> [1] provided by one of the sgpio controllers?
> 
> [1] https://lore.kernel.org/all/20211012114238.2060101-3-horatiu.vultur@microchip.com/

Nope, the GPIOs are provided by a differnet gpio controller.

> 
> regards
> Philipp

-- 
/Horatiu

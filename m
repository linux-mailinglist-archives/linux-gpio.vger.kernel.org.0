Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD364316F9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 13:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhJRLNO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 07:13:14 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:3023 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhJRLNN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 07:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634555462; x=1666091462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3rFzn6wwbDESQYh8EcGd4Ye4cyLLN80I47DChxu6Dvw=;
  b=PyxWMobrVy9ST8BehSeu0Yfre+augSAUSNVS1ZfC2wZA+VB3KokV0pT2
   pE3b20O2ewL3v0vY1VgFHYocz7FxOpX/uqRegi20EwPluaUAjEAlvH6EQ
   MH+DAmk2AnR+2aq25SnA1DypLEcPaZ1qMm4WyzqYJ/FxSayTlVrxvVQP4
   VHJipnTdMpZfRiXpqhRXQWHu/tq59hFwp5RNlZYgoRBBhl6z6m4QfjPvD
   GPa2ypFP38+KDqRcjoMDWA0+Y6KVuA/tSM/uAw2CLX2wp9m4/Txqvlj2G
   hi4CPFzjQZIv4Yb1f6qS0MzijBOkdRci0SyEYdkuKPhKZ4HxddaT7wncc
   g==;
IronPort-SDR: PyJL5AbtUlCTotobBHoqHBwaQXjXvxJq5wU35nEfjUK+457nerOYyfrH5c6kfTR6t+Z3nx0KvW
 l3tMHE1YVakrGUxRPpb9LJG0hrlJ/Cc/JoWviEutxD3dQiJX23G9HAoLW0XSD3tP6hQzjRsBMs
 ApgfL7oEShMlyDhvkimCOKqx5KMWmXCE6NkNluebbqkUx5SsMjyrpVI1NZzwKX+dJbuEs0mc2e
 vD9tHEXPxzbQlBp4KiyAxKfxAmcYjYWWbYQMLk8nCZFjU5LjcqsvaxZ2yHDGSoEuYVDtW2NVRv
 GnKxxrHI4Rv+peN2hr5usj/0
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="148534364"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Oct 2021 04:11:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 18 Oct 2021 04:11:00 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 18 Oct 2021 04:11:00 -0700
Date:   Mon, 18 Oct 2021 13:12:31 +0200
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] pinctrl: microchip sgpio: use reset driver
Message-ID: <20211018111231.bawmvre4dqow65dy@soft-dev3-1.localhost>
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
 <20211018085754.1066056-3-horatiu.vultur@microchip.com>
 <6f46c5ab7458e1368abfeb8dee6e24271f39d236.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6f46c5ab7458e1368abfeb8dee6e24271f39d236.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 10/18/2021 12:37, Philipp Zabel wrote:

Hi Philipp,
> 
> Hi Horatiu,
> 
> On Mon, 2021-10-18 at 10:57 +0200, Horatiu Vultur wrote:
> > On lan966x platform when the switch gets reseted then also the sgpio
> > gets reseted. The fix for this is to extend also the sgpio driver to
> > call the reset driver which will be reseted only once by the first
> > driver that is probed.
> >
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  drivers/pinctrl/pinctrl-microchip-sgpio.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> > index 072bccdea2a5..78765faa245a 100644
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
> > @@ -813,6 +815,11 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
> >
> >       priv->dev = dev;
> >
> > +     reset = devm_reset_control_get_optional_shared(&pdev->dev, "switch");
> 
> This is the first GPIO driver that I am aware of that requests a named
> reset control, so I'm still not sure if this should be called "switch"
> instead of "gpio" or just "reset", just in case there is a future model
> where the GPIO controller reset is not shared with the switch reset.

I agree, it is not the best name. But the name "switch" was already used
in DT by sparx5[1], so I just went with this name.

> 
> > +     if (IS_ERR(reset))
> > +             return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");
> > +     reset_control_reset(reset);
> > +
> >       clk = devm_clk_get(dev, NULL);
> >       if (IS_ERR(clk))
> >               return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
> 
> But whichever name you choose, the code is
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp

[1] https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/arm64/boot/dts/microchip/sparx5.dtsi#L307

-- 
/Horatiu

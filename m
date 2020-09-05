Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EA725EB62
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 00:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgIEWXN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sat, 5 Sep 2020 18:23:13 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33906 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIEWXL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Sep 2020 18:23:11 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kEgaT-0005tc-Kq; Sun, 06 Sep 2020 00:23:09 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 1/6] pinctrl: rockchip: make driver be tristate module
Date:   Sun, 06 Sep 2020 00:23:09 +0200
Message-ID: <2623687.OKfBHSCOjT@diego>
In-Reply-To: <2671833.MsR7uBhjTv@diego>
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200831084753.7115-2-jay.xu@rock-chips.com> <2671833.MsR7uBhjTv@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Sonntag, 6. September 2020, 00:01:55 CEST schrieb Heiko Stübner:
> Am Montag, 31. August 2020, 10:47:48 CEST schrieb Jianqun Xu:
> > Make pinctrl-rockchip driver to be tristate module, support to build as
> > a module, this is useful for GKI.
> > 
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I take this back.


What happens when you actually unload the module now?
I checked and all the pinctrl stuff itself is using devm-functions
so should be safe, but you're missing the 

platform_driver_unregister part that should happen as well.


Heiko

> > ---
> >  drivers/pinctrl/Kconfig            | 2 +-
> >  drivers/pinctrl/pinctrl-rockchip.c | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 8828613c4e0e..dd4874e2ac67 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -207,7 +207,7 @@ config PINCTRL_OXNAS
> >  	select MFD_SYSCON
> >  
> >  config PINCTRL_ROCKCHIP
> > -	bool
> > +	tristate "Rockchip gpio and pinctrl driver"
> >  	select PINMUX
> >  	select GENERIC_PINCONF
> >  	select GENERIC_IRQ_CHIP
> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> > index c07324d1f265..24dfc814dee1 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -16,10 +16,12 @@
> >   */
> >  
> >  #include <linux/init.h>
> > +#include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/io.h>
> >  #include <linux/bitops.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/of_device.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/pinctrl/machine.h>
> > @@ -4256,3 +4258,8 @@ static int __init rockchip_pinctrl_drv_register(void)
> >  	return platform_driver_register(&rockchip_pinctrl_driver);
> >  }
> >  postcore_initcall(rockchip_pinctrl_drv_register);
> > +
> > +MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:pinctrl-rockchip");
> > +MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
> > 
> 
> 





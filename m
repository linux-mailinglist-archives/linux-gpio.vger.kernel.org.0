Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74147271869
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 00:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgITWjx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sun, 20 Sep 2020 18:39:53 -0400
Received: from gloria.sntech.de ([185.11.138.130]:55402 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITWjv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Sep 2020 18:39:51 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kK7fS-0005mW-C4; Mon, 21 Sep 2020 00:18:46 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: make driver be tristate module
Date:   Mon, 21 Sep 2020 00:18:45 +0200
Message-ID: <7244527.mGzxE9Z0Hj@diego>
In-Reply-To: <5373086.oXRXx9yCqB@diego>
References: <20200907025927.9713-3-jay.xu@rock-chips.com> <20200914003847.10341-1-jay.xu@rock-chips.com> <5373086.oXRXx9yCqB@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jay,

Am Montag, 21. September 2020, 00:14:11 CEST schrieb Heiko Stübner:
> Am Montag, 14. September 2020, 02:38:47 CEST schrieb Jianqun Xu:
> > Make pinctrl-rockchip driver to be tristate module, support to build as
> > a module, this is useful for GKI.
> > 
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

It seems I've reviewed all patches of this series now, but I think
you might want to resend the series a final time as v3 in a cleaned up
state (drop patch1 and just post patches 2-5 in a full series) so that
we don't confuse Linus too much with the reposted patches we currently
have.

Thanks
Heiko




> 
> > ---
> >  drivers/pinctrl/Kconfig            |  2 +-
> >  drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 4284f39a5c61..743eb2bb8709 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -207,7 +207,7 @@ config PINCTRL_OXNAS
> >  	select MFD_SYSCON
> >  
> >  config PINCTRL_ROCKCHIP
> > -	bool
> > +	tristate "Rockchip gpio and pinctrl driver"
> >  	depends on OF
> >  	select PINMUX
> >  	select GENERIC_PINCONF
> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> > index 0401c1da79dd..927d132d6716 100644
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
> > @@ -4258,3 +4260,14 @@ static int __init rockchip_pinctrl_drv_register(void)
> >  	return platform_driver_register(&rockchip_pinctrl_driver);
> >  }
> >  postcore_initcall(rockchip_pinctrl_drv_register);
> > +
> > +static void __exit rockchip_pinctrl_drv_unregister(void)
> > +{
> > +	platform_driver_unregister(&rockchip_pinctrl_driver);
> > +}
> > +module_exit(rockchip_pinctrl_drv_unregister);
> > +
> > +MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:pinctrl-rockchip");
> > +MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
> > 
> 
> 





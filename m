Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D52267A05
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 13:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgILLlZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 07:41:25 -0400
Received: from gloria.sntech.de ([185.11.138.130]:41706 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgILLlY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Sep 2020 07:41:24 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kH3uA-00005p-Db; Sat, 12 Sep 2020 13:41:18 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 2/5] pinctrl: rockchip: make driver be tristate module
Date:   Sat, 12 Sep 2020 13:41:17 +0200
Message-ID: <1714777.5MuWvkDkrY@diego>
In-Reply-To: <20200907025927.9713-3-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200907025927.9713-1-jay.xu@rock-chips.com> <20200907025927.9713-3-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am Montag, 7. September 2020, 04:59:24 CEST schrieb Jianqun Xu:
> Make pinctrl-rockchip driver to be tristate module, support to build as
> a module, this is useful for GKI.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/pinctrl/Kconfig            |  2 +-
>  drivers/pinctrl/pinctrl-rockchip.c | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 4284f39a5c61..743eb2bb8709 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -207,7 +207,7 @@ config PINCTRL_OXNAS
>  	select MFD_SYSCON
>  
>  config PINCTRL_ROCKCHIP
> -	bool
> +	tristate "Rockchip gpio and pinctrl driver"
>  	depends on OF
>  	select PINMUX
>  	select GENERIC_PINCONF
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 0401c1da79dd..cc7512acfc5f 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -16,10 +16,12 @@
>   */
>  
>  #include <linux/init.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/bitops.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/of_device.h>

of_device.h below of_address.h please


>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/machine.h>
> @@ -4257,4 +4259,20 @@ static int __init rockchip_pinctrl_drv_register(void)
>  {
>  	return platform_driver_register(&rockchip_pinctrl_driver);
>  }
> +
> +static void __exit rockchip_pinctrl_drv_unregister(void)
> +{
> +	platform_driver_unregister(&rockchip_pinctrl_driver);
> +}
> +
> +#ifdef CONFIG_PINCTRL_ROCKCHIP_MODULE
> +module_init(rockchip_pinctrl_drv_register);
> +#else
>  postcore_initcall(rockchip_pinctrl_drv_register);
> +#endif

You definitly don't need this hack. For modules postcore_initcall
already points to module_init ... see

https://elixir.bootlin.com/linux/latest/source/include/linux/module.h#L114


Heiko



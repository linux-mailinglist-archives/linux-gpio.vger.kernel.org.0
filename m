Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11FE215FE16
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2020 12:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgBOLLf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Feb 2020 06:11:35 -0500
Received: from gloria.sntech.de ([185.11.138.130]:36402 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgBOLLe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 15 Feb 2020 06:11:34 -0500
Received: from p508fda41.dip0.t-ipconnect.de ([80.143.218.65] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j2vM0-0006YX-5X; Sat, 15 Feb 2020 12:11:20 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linus.walleij@linaro.org, david.wu@rock-chips.com,
        kever.yang@rock-chips.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 2/2] pinctrl: rockchip: split rockchip pinctrl driver by SoC type
Date:   Sat, 15 Feb 2020 12:11:19 +0100
Message-ID: <6201612.znBgJCgWHB@phil>
In-Reply-To: <20200117081358.5772-3-jay.xu@rock-chips.com>
References: <c4ec95a7-aaf1-2331-352f-2def319a1c7d@rock-chips.com> <20200117081358.5772-1-jay.xu@rock-chips.com> <20200117081358.5772-3-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jay,

Am Freitag, 17. Januar 2020, 09:13:58 CET schrieb Jianqun Xu:
> The pinctrl-rockchip driver grows larger by adding support for
> each new SoC, that make the kernel Image size too large since
> it only under one config named PINCTRL_ROCKCHIP.
> 
> This patch split driver in the form of core driver + soc driver,
> - pinctrl-rockchip.c defined an platform probe register function
> - pinctrl-rkxxxx.c init module by matching compatible name
> 
> For rockchip_defconfig, it needs to select all PINCTRL_RKxxxx to
> keep same with old driver.
> 
> For some special defconfig, it can only select one PINCTRL_RKxxxx.
> 
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> changes since v3:
> - add base patch with directory change only, suggested by Robin
> - rebase patch
> 
> changes since v2:
> - remove rockchip_pinctrl_remove
> - rename rockchip_pinctrl_* to rockchip_pctrl_*
> - redule arguments for get_soc_data
> - add module author for each new driver files
> - add copyright for new driver files
> 
> changes since v1:
> - add rockchip_pinctrl_remove
> - remove unused head files in pinctrl-rockchip.h
> 
>  drivers/pinctrl/rockchip/Kconfig            |  114 +
>  drivers/pinctrl/rockchip/Makefile           |   14 +
>  drivers/pinctrl/rockchip/pinctrl-px30.c     |  224 ++
>  drivers/pinctrl/rockchip/pinctrl-rk2928.c   |   70 +
>  drivers/pinctrl/rockchip/pinctrl-rk3036.c   |   69 +
>  drivers/pinctrl/rockchip/pinctrl-rk3066a.c  |   72 +
>  drivers/pinctrl/rockchip/pinctrl-rk3066b.c  |   51 +
>  drivers/pinctrl/rockchip/pinctrl-rk3128.c   |  161 ++
>  drivers/pinctrl/rockchip/pinctrl-rk3188.c   |  147 ++
>  drivers/pinctrl/rockchip/pinctrl-rk3228.c   |  225 ++
>  drivers/pinctrl/rockchip/pinctrl-rk3288.c   |  210 ++
>  drivers/pinctrl/rockchip/pinctrl-rk3308.c   |  420 +++
>  drivers/pinctrl/rockchip/pinctrl-rk3328.c   |  272 ++
>  drivers/pinctrl/rockchip/pinctrl-rk3368.c   |  125 +
>  drivers/pinctrl/rockchip/pinctrl-rk3399.c   |  195 ++
>  drivers/pinctrl/rockchip/pinctrl-rockchip.c | 2547 ++-----------------
>  drivers/pinctrl/rockchip/pinctrl-rockchip.h |  388 +++
>  drivers/pinctrl/rockchip/pinctrl-rv1108.c   |  214 ++
>  18 files changed, 3149 insertions(+), 2369 deletions(-)

What Robin suggested, was doing this incrementally. So keep your patch1
but then do
- patch2: split out px30-pinctrl
- patch3: split out rk3288 pinctrl
- etc

Because even my mail client chokes on this massive 6000 line patch, so a
real review is actually very difficult.


> diff --git a/drivers/pinctrl/rockchip/Kconfig b/drivers/pinctrl/rockchip/Kconfig
> index 7a0077ca32dd..4873a05108f8 100644
> --- a/drivers/pinctrl/rockchip/Kconfig
> +++ b/drivers/pinctrl/rockchip/Kconfig
> @@ -5,8 +5,122 @@ if (ARCH_ROCKCHIP || COMPILE_TEST)
>  config PINCTRL_ROCKCHIP
>  	bool
>  	select PINMUX
> +	select PINCONF
>  	select GENERIC_PINCONF
> +	select GPIOLIB_IRQCHIP
>  	select GENERIC_IRQ_CHIP
>  	select MFD_SYSCON
>  
> +config PINCTRL_PX30
> +	tristate "PX30 pin controller driver"
> +	depends on GPIOLIB && OF
> +	select PINCTRL_ROCKCHIP

you might want to add a
	default y if ARM64
here
(similar default y if ARM for arm32 pinctrl drivers)

Because otherwise you're breaking peoples kernel configs and also
the default is to build a somewhat unified kernel in the default defconfigs,
so we want all matching pinctrl drivers by default and people then can
disable drivers if they really want to build a slimmed down kernel.

With the "if ARM" / "if ARM64" parts you even save some space by
default as well, as you build only the relevant drivers.


Heiko




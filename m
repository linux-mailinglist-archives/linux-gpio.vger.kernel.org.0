Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD4821E11A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 22:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGMUCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 16:02:48 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33109 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGMUCr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 16:02:47 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7E044240006;
        Mon, 13 Jul 2020 20:02:44 +0000 (UTC)
Date:   Mon, 13 Jul 2020 22:02:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20200713200244.GA23553@piout.net>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713144930.1034632-17-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 13/07/2020 15:49:21+0100, Lee Jones wrote:
> Both the caller and the supplier's source file should have access to
> the include file containing the prototypes.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/pinctrl/pinctrl-at91.c:1637:6: warning: no previous prototype for ‘at91_pinctrl_gpio_suspend’ [-Wmissing-prototypes]
>  1637 | void at91_pinctrl_gpio_suspend(void)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/pinctrl-at91.c:1661:6: warning: no previous prototype for ‘at91_pinctrl_gpio_resume’ [-Wmissing-prototypes]
>  1661 | void at91_pinctrl_gpio_resume(void)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/arm/mach-at91/pm.c             | 17 ++++++-----------
>  drivers/pinctrl/pinctrl-at91.c      |  1 +
>  include/linux/platform_data/atmel.h |  5 +++++
>  3 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 074bde64064e4..59f2a2d6fbbb8 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -25,17 +25,6 @@
>  #include "generic.h"
>  #include "pm.h"
>  
> -/*
> - * FIXME: this is needed to communicate between the pinctrl driver and
> - * the PM implementation in the machine. Possibly part of the PM
> - * implementation should be moved down into the pinctrl driver and get
> - * called as part of the generic suspend/resume path.
> - */
> -#ifdef CONFIG_PINCTRL_AT91
> -extern void at91_pinctrl_gpio_suspend(void);
> -extern void at91_pinctrl_gpio_resume(void);
> -#endif
> -
>  struct at91_soc_pm {
>  	int (*config_shdwc_ws)(void __iomem *shdwc, u32 *mode, u32 *polarity);
>  	int (*config_pmc_ws)(void __iomem *pmc, u32 mode, u32 polarity);
> @@ -325,6 +314,12 @@ static void at91_pm_suspend(suspend_state_t state)
>  static int at91_pm_enter(suspend_state_t state)
>  {
>  #ifdef CONFIG_PINCTRL_AT91
> +	/*
> +	 * FIXME: this is needed to communicate between the pinctrl driver and
> +	 * the PM implementation in the machine. Possibly part of the PM
> +	 * implementation should be moved down into the pinctrl driver and get
> +	 * called as part of the generic suspend/resume path.
> +	 */
>  	at91_pinctrl_gpio_suspend();
>  #endif
>  
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 9c52130876597..37997e5ab0538 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -22,6 +22,7 @@
>  #include <linux/pinctrl/pinmux.h>
>  /* Since we request GPIOs from ourself */
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/platform_data/atmel.h>
>  
>  #include "pinctrl-at91.h"
>  #include "core.h"
> diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
> index 99e6069c5fd89..666ef482ea8c0 100644
> --- a/include/linux/platform_data/atmel.h
> +++ b/include/linux/platform_data/atmel.h

The plan is to get rid of that file so you should probably find a better
location.

> @@ -28,4 +28,9 @@ static inline int at91_suspend_entering_slow_clock(void)
>  }
>  #endif
>  
> +#ifdef CONFIG_PINCTRL_AT91
> +void at91_pinctrl_gpio_suspend(void);
> +void at91_pinctrl_gpio_resume(void);
> +#endif
> +
>  #endif /* __ATMEL_H__ */
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

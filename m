Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2772B0283
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 11:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgKLKKI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 05:10:08 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:50788 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgKLKKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 05:10:07 -0500
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id A13463ADCF7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 10:08:32 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8480B240015;
        Thu, 12 Nov 2020 10:07:32 +0000 (UTC)
Date:   Thu, 12 Nov 2020 11:07:31 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v2 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20201112100731.GC4556@piout.net>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20201112093918.GV2063125@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112093918.GV2063125@dell>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/11/2020 09:39:18+0000, Lee Jones wrote:
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
> 
> v2: Moved shared header to: include/soc/at91/pm.h
> 
>  arch/arm/mach-at91/pm.c        | 19 ++++++++-----------
>  drivers/pinctrl/pinctrl-at91.c |  2 ++
>  include/soc/at91/pm.h          |  9 +++++++++
>  3 files changed, 19 insertions(+), 11 deletions(-)
>  create mode 100644 include/soc/at91/pm.h
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 120f9aa6fff32..90dcdfe3b3d0d 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -17,6 +17,8 @@
>  #include <linux/clk/at91_pmc.h>
>  #include <linux/platform_data/atmel.h>
>  
> +#include <soc/at91/pm.h>
> +
>  #include <asm/cacheflush.h>
>  #include <asm/fncpy.h>
>  #include <asm/system_misc.h>
> @@ -25,17 +27,6 @@
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
> @@ -326,6 +317,12 @@ static void at91_pm_suspend(suspend_state_t state)
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
> index 72edc675431ce..0a7e10d39505c 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -23,6 +23,8 @@
>  /* Since we request GPIOs from ourself */
>  #include <linux/pinctrl/consumer.h>
>  
> +#include <soc/at91/pm.h>
> +
>  #include "pinctrl-at91.h"
>  #include "core.h"
>  
> diff --git a/include/soc/at91/pm.h b/include/soc/at91/pm.h
> new file mode 100644
> index 0000000000000..0fd5093f7f73a
> --- /dev/null
> +++ b/include/soc/at91/pm.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * atmel platform data
> + */
> +
> +#ifdef CONFIG_PINCTRL_AT91

Shouldn't that be a header guard instead of depending on PINCTRL_AT91 ?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

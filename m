Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF1585622D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 08:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfFZGOX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 02:14:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33025 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfFZGOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 02:14:22 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hg1C5-0005zD-Ll; Wed, 26 Jun 2019 08:14:09 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hg1C1-0003D1-Jo; Wed, 26 Jun 2019 08:14:05 +0200
Date:   Wed, 26 Jun 2019 08:14:05 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, grygorii.strashko@ti.com,
        mcoquelin.stm32@gmail.com, thloh@altera.com, festevam@gmail.com,
        linus.walleij@linaro.org, khilman@kernel.org,
        patches@opensource.cirrus.com, bgolaszewski@baylibre.com,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, ssantosh@kernel.org,
        linux-tegra@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        alexandre.torgue@st.com
Subject: Re: [PATCH 01/30] include: linux: platform_device: more helpers for
 declaring platform drivers
Message-ID: <20190626061405.qsqq5na4oactuo6f@pengutronix.de>
References: <1560796871-18560-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Mon, Jun 17, 2019 at 08:40:42PM +0200, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> Add more helper macros for trivial driver init cases, similar to the
> already existing module_platform_driver()+friends - now for those which
> are initialized at other stages. Lots of drivers couldn't use the existing
> macros, as they need to be called at different init stages, eg. subsys,
> postcore, arch.
> 
> This helps to further reduce driver init boilerplate.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  include/linux/platform_device.h | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index beb25f2..5f3a967 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -259,6 +259,57 @@ static inline void platform_set_drvdata(struct platform_device *pdev,
>  } \
>  module_exit(__platform_driver##_exit);
>  
> +/* postcore_platform_driver() - Helper macro for drivers that don't do
> + * anything special in module init/exit.  This eliminates a lot of
> + * boilerplate.  Each module may only use this macro once, and
> + * calling it replaces postcore_initcall() and module_exit()
> + */
> +#define postcore_platform_driver(__platform_driver) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +	return platform_driver_register(&(__platform_driver)); \
> +} \
> +postcore_initcall(__platform_driver##_init); \
> +static void __exit __platform_driver##_exit(void) \
> +{ \
> +	platform_driver_unregister(&(__platform_driver)); \
> +} \
> +module_exit(__platform_driver##_exit);
> +
> +/* subsys_platform_driver() - Helper macro for drivers that don't do
> + * anything special in module init/exit.  This eliminates a lot of
> + * boilerplate.  Each module may only use this macro once, and
> + * calling it replaces subsys_initcall() and module_exit()
> + */
> +#define subsys_platform_driver(__platform_driver) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +	return platform_driver_register(&(__platform_driver)); \
> +} \
> +subsys_initcall(__platform_driver##_init); \
> +static void __exit __platform_driver##_exit(void) \
> +{ \
> +	platform_driver_unregister(&(__platform_driver)); \
> +} \
> +module_exit(__platform_driver##_exit);

Would it make sense to do something like:

	#define __module_platform_driver(__platform_driver, __initlvl) \
	static int __init __platform_driver##_init(void) \
	{ \
		return platform_driver_register(&(__platform_driver)); \
	} \
	__initlvl ## _initcall(__platform_driver##_init); \
	static void __exit __platform_driver##_exit(void) \
	{ \
		platform_driver_unregister(&(__platform_driver)); \
	} \
	module_exit(__platform_driver##_exit);

	#define postcore_platform_driver(__platform_driver) __module_platform_driver(__platform_driver, postcore)
	#define subsys_platform_driver(__platform_driver) __module_platform_driver(__platform_driver, subsys)
	...

Which would be more compact and makes the difference between these
macros a bit more obvious.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

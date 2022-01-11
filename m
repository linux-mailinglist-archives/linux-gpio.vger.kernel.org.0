Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E196648AD52
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 13:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbiAKMH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 07:07:28 -0500
Received: from mga11.intel.com ([192.55.52.93]:53720 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239449AbiAKMH2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 07:07:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="241023376"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="241023376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:07:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="515072076"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:07:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1n7Fum-009DJ6-Fo;
        Tue, 11 Jan 2022 14:06:12 +0200
Date:   Tue, 11 Jan 2022 14:06:12 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Message-ID: <Yd1ytDROGGbk2TNi@smile.fi.intel.com>
References: <20220111105632.219581-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111105632.219581-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:
> The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
> itself gets instantiated by a special MFD driver from
> drivers/platform/x86/intel/int3472/tps68470.c
> 
> This MFD driver itself can be built as a module, so it makes no sense to
> force the gpio-tps68470 driver to always be built-in.

Pushed (along with patch 2/2 from v1) to my review and testing queue, thanks!

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Fix some spelling errors in the commit msg
> - Remove blank line between tps68470_gpio_driver decleration and
>   module_platform_driver(tps68470_gpio_driver)
> ---
>  drivers/gpio/Kconfig         | 6 +-----
>  drivers/gpio/gpio-tps68470.c | 5 ++++-
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 60d9374c72c0..3ac5860e0aeb 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1393,7 +1393,7 @@ config GPIO_TPS65912
>  	  This driver supports TPS65912 GPIO chip.
>  
>  config GPIO_TPS68470
> -	bool "TPS68470 GPIO"
> +	tristate "TPS68470 GPIO"
>  	depends on INTEL_SKL_INT3472
>  	help
>  	  Select this option to enable GPIO driver for the TPS68470
> @@ -1403,10 +1403,6 @@ config GPIO_TPS68470
>  	  input or output as appropriate, the sensor related GPIOs
>  	  are "output only" GPIOs.
>  
> -	  This driver config is bool, as the GPIO functionality
> -	  of the TPS68470 must be available before dependent
> -	  drivers are loaded.
> -
>  config GPIO_TQMX86
>  	tristate "TQ-Systems QTMX86 GPIO"
>  	depends on MFD_TQMX86 || COMPILE_TEST
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index 423b7bc30ae8..aaddcabe9b35 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -154,5 +154,8 @@ static struct platform_driver tps68470_gpio_driver = {
>  	},
>  	.probe = tps68470_gpio_probe,
>  };
> +module_platform_driver(tps68470_gpio_driver);
>  
> -builtin_platform_driver(tps68470_gpio_driver)
> +MODULE_ALIAS("platform:tps68470-gpio");
> +MODULE_DESCRIPTION("GPIO driver for TPS68470 PMIC");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.1
> 

-- 
With Best Regards,
Andy Shevchenko



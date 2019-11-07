Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB42F3060
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 14:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfKGNss (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 08:48:48 -0500
Received: from mga07.intel.com ([134.134.136.100]:40630 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728687AbfKGNsr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Nov 2019 08:48:47 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Nov 2019 05:48:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
   d="scan'208";a="213025392"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 07 Nov 2019 05:48:43 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 07 Nov 2019 15:48:42 +0200
Date:   Thu, 7 Nov 2019 15:48:42 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/8] pinctrl: lynxpoint: Move GPIO driver to pin
 controller folder
Message-ID: <20191107134842.GM2552@lahna.fi.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
 <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106144829.32275-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 06, 2019 at 04:48:22PM +0200, Andy Shevchenko wrote:
> Move Lynxpoint GPIO driver under Intel pin control umbrella
> for further transformation to a real pin control driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS                                            |  1 -
>  drivers/gpio/Kconfig                                   |  8 --------
>  drivers/gpio/Makefile                                  |  1 -
>  drivers/pinctrl/intel/Kconfig                          | 10 ++++++++++
>  drivers/pinctrl/intel/Makefile                         |  1 +
>  .../intel/pinctrl-lynxpoint.c}                         |  0
>  6 files changed, 11 insertions(+), 10 deletions(-)
>  rename drivers/{gpio/gpio-lynxpoint.c => pinctrl/intel/pinctrl-lynxpoint.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1378491c223c..9b71250e3014 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8325,7 +8325,6 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
>  F:	drivers/gpio/gpio-ich.c
>  F:	drivers/gpio/gpio-intel-mid.c
> -F:	drivers/gpio/gpio-lynxpoint.c
>  F:	drivers/gpio/gpio-merrifield.c
>  F:	drivers/gpio/gpio-ml-ioh.c
>  F:	drivers/gpio/gpio-pch.c
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8adffd42f8cb..6923142fd874 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -335,14 +335,6 @@ config GPIO_LPC32XX
>  	  Select this option to enable GPIO driver for
>  	  NXP LPC32XX devices.
>  
> -config GPIO_LYNXPOINT
> -	tristate "Intel Lynxpoint GPIO support"
> -	depends on ACPI && X86
> -	select GPIOLIB_IRQCHIP
> -	help
> -	  driver for GPIO functionality on Intel Lynxpoint PCH chipset
> -	  Requires ACPI device enumeration code to set up a platform device.
> -
>  config GPIO_MB86S7X
>  	tristate "GPIO support for Fujitsu MB86S7x Platforms"
>  	help
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 34eb8b2b12dd..55b2b645391e 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -76,7 +76,6 @@ obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
>  obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
>  obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
>  obj-$(CONFIG_GPIO_LPC32XX)		+= gpio-lpc32xx.o
> -obj-$(CONFIG_GPIO_LYNXPOINT)		+= gpio-lynxpoint.o
>  obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
>  obj-$(CONFIG_GPIO_MAX3191X)		+= gpio-max3191x.o
>  obj-$(CONFIG_GPIO_MAX7300)		+= gpio-max7300.o
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index c091eb2f0aeb..260193c453b0 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -42,6 +42,16 @@ config PINCTRL_MERRIFIELD
>  	  interface that allows configuring of SoC pins and using them as
>  	  GPIOs.
>  
> +config PINCTRL_LYNXPOINT
> +	tristate "Intel Lynxpoint pinctrl and GPIO driver"
> +	depends on ACPI
> +	select GPIOLIB
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Lynxpoint is the PCH of Intel Haswell. This pinctrl driver
> +	  provides an interface that allows configuring of PCH pins and
> +	  using them as GPIOs.

In order to keep the above (non pinctrl-intel.c based drivers) sorted
alphabetically, can you move this before PINCTRL_MERRIFIELD?

> +
>  config PINCTRL_INTEL
>  	tristate
>  	select PINMUX
> diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
> index 5e92aba018ac..541b94cfe398 100644
> --- a/drivers/pinctrl/intel/Makefile
> +++ b/drivers/pinctrl/intel/Makefile
> @@ -13,5 +13,6 @@ obj-$(CONFIG_PINCTRL_ELKHARTLAKE)	+= pinctrl-elkhartlake.o
>  obj-$(CONFIG_PINCTRL_GEMINILAKE)	+= pinctrl-geminilake.o
>  obj-$(CONFIG_PINCTRL_ICELAKE)		+= pinctrl-icelake.o
>  obj-$(CONFIG_PINCTRL_LEWISBURG)		+= pinctrl-lewisburg.o
> +obj-$(CONFIG_PINCTRL_LYNXPOINT)		+= pinctrl-lynxpoint.o

Here too.

>  obj-$(CONFIG_PINCTRL_SUNRISEPOINT)	+= pinctrl-sunrisepoint.o
>  obj-$(CONFIG_PINCTRL_TIGERLAKE)		+= pinctrl-tigerlake.o
> diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
> similarity index 100%
> rename from drivers/gpio/gpio-lynxpoint.c
> rename to drivers/pinctrl/intel/pinctrl-lynxpoint.c
> -- 
> 2.24.0.rc1

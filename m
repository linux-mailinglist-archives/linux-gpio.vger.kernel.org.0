Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B46352F1A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 20:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbhDBSUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 14:20:13 -0400
Received: from mga06.intel.com ([134.134.136.31]:63297 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhDBSUN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Apr 2021 14:20:13 -0400
IronPort-SDR: rp6poXzdKdeW69IRCdyiyg0GViQleoul7yLfw6IeeZlKSgTsaYwPPN3yCxfH0TmdCP8SKn2nzf
 n3eoV96/mskA==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="253847936"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="253847936"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 11:20:11 -0700
IronPort-SDR: kNyac3IZwE13F67nKDUCh/lIZyZyiNMwHz6+USiKzWiM1gAHqPCrkJhe8iksoJcy1Rs1ee1Qzv
 8jnmeq3f6UHQ==
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="528687096"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 11:20:10 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lSOOs-000cNi-ST; Fri, 02 Apr 2021 21:20:06 +0300
Date:   Fri, 2 Apr 2021 21:20:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Denis Turischev <denis@compulab.co.il>
Subject: Re: [PATCH -next v2] gpio: GPIO_SCH: depends on LPC_SCH
Message-ID: <YGdgVqf0QnWdjAjk@smile.fi.intel.com>
References: <20210402161751.7683-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210402161751.7683-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 02, 2021 at 09:17:51AM -0700, Randy Dunlap wrote:
> Since LPC_SCH provides GPIO functionality, GPIO_SCH should depend on
> LPC_SCH to prevent kconfig warning and build errors:
> 
> WARNING: unmet direct dependencies detected for LPC_SCH
>   Depends on [n]: HAS_IOMEM [=y] && PCI [=n]
>   Selected by [y]:
>   - GPIO_SCH [=y] && GPIOLIB [=y] && X86 [=y] && (X86 [=y] || COMPILE_TEST [=n]) && ACPI [=y]
> 
> and
> 
> ../drivers/mfd/lpc_sch.c:204:1: warning: data definition has no type or storage class
>  module_pci_driver(lpc_sch_driver);
>  ^~~~~~~~~~~~~~~~~
> ../drivers/mfd/lpc_sch.c:204:1: error: type defaults to ‘int’ in declaration of ‘module_pci_driver’ [-Werror=implicit-int]
> ../drivers/mfd/lpc_sch.c:204:1: warning: parameter names (without types) in function declaration
> ../drivers/mfd/lpc_sch.c:197:26: warning: ‘lpc_sch_driver’ defined but not used [-Wunused-variable]
>  static struct pci_driver lpc_sch_driver = {
>                           ^~~~~~~~~~~~~~

Pushed to my review and testing queue, thanks!

> Fixes: 6c46215d6b62 ("gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>

I have dropped these two since my SoB will be there. But also I think it's
better to narrow down this kind of Cc list as much as possible (for example, we
know that Bart and Linus are maintainers of GPIO, no need to include them
explicitly here, just use --cc parameter when sending).

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Denis Turischev <denis@compulab.co.il>
> ---
> v2: change to "depends on LPC_SCH" as suggested by Andy
> 
>  drivers/gpio/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210401.orig/drivers/gpio/Kconfig
> +++ linux-next-20210401/drivers/gpio/Kconfig
> @@ -861,9 +861,9 @@ config GPIO_IT87
>  config GPIO_SCH
>  	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
>  	depends on (X86 || COMPILE_TEST) && ACPI
> +	depends on LPC_SCH
>  	select GPIOLIB_IRQCHIP
>  	select MFD_CORE
> -	select LPC_SCH
>  	help
>  	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
>  	  Intel Tunnel Creek processor, Intel Centerton processor or

-- 
With Best Regards,
Andy Shevchenko



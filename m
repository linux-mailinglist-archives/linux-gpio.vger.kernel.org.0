Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A10423345A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 16:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgG3O1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 10:27:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:59224 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbgG3O1S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Jul 2020 10:27:18 -0400
IronPort-SDR: u0M6kPzd39KINCv6fciPcf7OYktEolj6HMxsdUuAxRtNK+i2wltXNA3nviUencEkXmV9Nm/cwE
 f5D+CTTUJnkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="151581255"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="151581255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 07:27:18 -0700
IronPort-SDR: RYZHOM7Xi+pvhaVpsbRv6o5o+REBM8+hnpx23fQ4ZpNZ1vN3i+IApaP6UhgfXs1cN00WBpEQnC
 ng5g7uZevrPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="272937640"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2020 07:27:15 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1k19Wd-004xyr-3t; Thu, 30 Jul 2020 17:27:15 +0300
Date:   Thu, 30 Jul 2020 17:27:15 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/10] gpio: dwapb: Discard ACPI GPIO-chip IRQs request
Message-ID: <20200730142715.GO3703480@smile.fi.intel.com>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
 <20200730135536.19747-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730135536.19747-8-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 04:55:33PM +0300, Serge Semin wrote:
> Since GPIOlib-based IRQ-chip interface is now utilized there is no need
> in calling the methods acpi_gpiochip_{request,free}_interrupts() here.
> They will be called from gpiochip_add_irqchip()/gpiochip_irqchip_remove()
> anyway.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> ---
> 
> Changelog v2:
> - This is a new patch detached from commit
>   "gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip".
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index f7acc5abbf5c..226d9c2d9493 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -512,9 +512,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  		return err;
>  	}
>  
> -	/* Add GPIO-signaled ACPI event support */
> -	acpi_gpiochip_request_interrupts(&port->gc);
> -
>  	port->is_registered = true;
>  
>  	return 0;
> @@ -530,7 +527,6 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
>  		if (!port->is_registered)
>  			continue;
>  
> -		acpi_gpiochip_free_interrupts(&port->gc);
>  		gpiochip_remove(&port->gc);
>  	}
>  }
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDAC2335BD
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 17:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgG3PmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 11:42:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:58103 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgG3PmW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Jul 2020 11:42:22 -0400
IronPort-SDR: ei34C2A5y7d1exDVltL57AgBe+7euMXfCfwEYWOxXc9MeR5fc7f6olftJqUXhjCa6Kss1pwpWH
 jdZkMUoN5Jbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="152845271"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="152845271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 08:42:22 -0700
IronPort-SDR: pYFaeeLcAzZxuB3wsRF1p9piO49pM0d0SQc6xtkttyfru1JKtDnZfDFPUceGi0P33TrYamCqla
 XCBsZdFx7ExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="490697704"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jul 2020 08:42:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1k1AhH-004ypR-1w; Thu, 30 Jul 2020 18:42:19 +0300
Date:   Thu, 30 Jul 2020 18:42:19 +0300
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
Subject: Re: [PATCH v3 04/10] gpio: dwapb: Add max GPIOs macro
Message-ID: <20200730154219.GS3703480@smile.fi.intel.com>
References: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
 <20200730152808.2955-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730152808.2955-5-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 06:28:01PM +0300, Serge Semin wrote:
> Add a new macro DWAPB_MAX_GPIOS which defines the maximum possible number
> of GPIO lines corresponding to the maximum DW APB GPIO controller port
> width. Use the new macro instead of number literal 32 where it's
> applicable.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/gpio/gpio-dwapb.c                | 8 ++++----
>  include/linux/platform_data/gpio-dwapb.h | 4 +++-
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 3081213247d8..f34001152850 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -162,7 +162,7 @@ static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsig
>  
>  	for (i = 0; i < gpio->nr_ports; i++) {
>  		port = &gpio->ports[i];
> -		if (port->idx == offs / 32)
> +		if (port->idx == offs / DWAPB_MAX_GPIOS)
>  			return port;
>  	}
>  
> @@ -182,7 +182,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
>  
>  	pol = dwapb_read(gpio, GPIO_INT_POLARITY);
>  	/* Just read the current value right out of the data register */
> -	val = gc->get(gc, offs % 32);
> +	val = gc->get(gc, offs % DWAPB_MAX_GPIOS);
>  	if (val)
>  		pol &= ~BIT(offs);
>  	else
> @@ -197,7 +197,7 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
>  	irq_hw_number_t hwirq;
>  
>  	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
> -	for_each_set_bit(hwirq, &irq_status, 32) {
> +	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
>  		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
>  		u32 irq_type = irq_get_trigger_type(gpio_irq);
>  
> @@ -599,7 +599,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  			dev_info(dev,
>  				 "failed to get number of gpios for port%d\n",
>  				 i);
> -			pp->ngpio = 32;
> +			pp->ngpio = DWAPB_MAX_GPIOS;
>  		}
>  
>  		pp->irq_shared	= false;
> diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
> index ff1be737bad6..0aa5c6720259 100644
> --- a/include/linux/platform_data/gpio-dwapb.h
> +++ b/include/linux/platform_data/gpio-dwapb.h
> @@ -6,12 +6,14 @@
>  #ifndef GPIO_DW_APB_H
>  #define GPIO_DW_APB_H
>  
> +#define DWAPB_MAX_GPIOS		32
> +
>  struct dwapb_port_property {
>  	struct fwnode_handle *fwnode;
>  	unsigned int	idx;
>  	unsigned int	ngpio;
>  	unsigned int	gpio_base;
> -	int		irq[32];
> +	int		irq[DWAPB_MAX_GPIOS];
>  	bool		irq_shared;
>  };
>  
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko



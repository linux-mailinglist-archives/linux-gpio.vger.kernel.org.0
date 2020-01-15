Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6217E13D04A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 23:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgAOWpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 17:45:05 -0500
Received: from mga07.intel.com ([134.134.136.100]:2183 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729548AbgAOWpF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Jan 2020 17:45:05 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 14:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; 
   d="scan'208";a="225749138"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 15 Jan 2020 14:45:03 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1irrPM-0002b7-N0; Thu, 16 Jan 2020 00:45:04 +0200
Date:   Thu, 16 Jan 2020 00:45:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: Drop the chained IRQ handler assign function
Message-ID: <20200115224504.GJ32742@smile.fi.intel.com>
References: <20200113220800.77817-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113220800.77817-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 13, 2020 at 11:08:00PM +0100, Linus Walleij wrote:
> gpiochip_set_chained_irqchip() would assign a chained handler
> to a GPIO chip. We now populate struct gpio_irq_chip for all
> chained GPIO irqchips so drop this function.
> 

Good for me!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This requires me to pull in the Intel pinctrl changes that
> are pending first, but once there we can do this.

We are going to send them next Monday / Tuesday I suppose.

> ---
>  Documentation/driver-api/gpio/driver.rst |  5 -----
>  drivers/gpio/gpio-mt7621.c               |  3 +--
>  drivers/gpio/gpio-xgs-iproc.c            |  3 +--
>  drivers/gpio/gpiolib.c                   | 25 +-----------------------
>  include/linux/gpio/driver.h              |  5 -----
>  5 files changed, 3 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> index 2ff743105927..871922529332 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -507,11 +507,6 @@ available but we try to move away from this:
>    cascaded irq has to be handled by a threaded interrupt handler.
>    Apart from that it works exactly like the chained irqchip.
>  
> -- DEPRECATED: gpiochip_set_chained_irqchip(): sets up a chained cascaded irq
> -  handler for a gpio_chip from a parent IRQ and passes the struct gpio_chip*
> -  as handler data. Notice that we pass is as the handler data, since the
> -  irqchip data is likely used by the parent irqchip.
> -
>  - gpiochip_set_nested_irqchip(): sets up a nested cascaded irq handler for a
>    gpio_chip from a parent IRQ. As the parent IRQ has usually been
>    explicitly requested by the driver, this does very little more than
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index d1d785f983a7..b992321bb852 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -253,8 +253,7 @@ mediatek_gpio_bank_probe(struct device *dev,
>  
>  		/*
>  		 * Directly request the irq here instead of passing
> -		 * a flow-handler to gpiochip_set_chained_irqchip,
> -		 * because the irq is shared.
> +		 * a flow-handler because the irq is shared.
>  		 */
>  		ret = devm_request_irq(dev, mtk->gpio_irq,
>  				       mediatek_gpio_irq_handler, IRQF_SHARED,
> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
> index b21c2e436b61..ad5489a65d54 100644
> --- a/drivers/gpio/gpio-xgs-iproc.c
> +++ b/drivers/gpio/gpio-xgs-iproc.c
> @@ -251,8 +251,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>  
>  		/*
>  		 * Directly request the irq here instead of passing
> -		 * a flow-handler to gpiochip_set_chained_irqchip,
> -		 * because the irq is shared.
> +		 * a flow-handler because the irq is shared.
>  		 */
>  		ret = devm_request_irq(dev, irq, iproc_gpio_irq_handler,
>  				       IRQF_SHARED, chip->gc.label, &chip->gc);
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 967371377a9d..ce9724d341f5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1800,7 +1800,7 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
>   * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
>   * @gc: the gpiochip to set the irqchip chain to
>   * @parent_irq: the irq number corresponding to the parent IRQ for this
> - * chained irqchip
> + * cascaded irqchip
>   * @parent_handler: the parent interrupt handler for the accumulated IRQ
>   * coming out of the gpiochip. If the interrupt is nested rather than
>   * cascaded, pass NULL in this handler argument
> @@ -1842,29 +1842,6 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gc,
>  	}
>  }
>  
> -/**
> - * gpiochip_set_chained_irqchip() - connects a chained irqchip to a gpiochip
> - * @gpiochip: the gpiochip to set the irqchip chain to
> - * @irqchip: the irqchip to chain to the gpiochip
> - * @parent_irq: the irq number corresponding to the parent IRQ for this
> - * chained irqchip
> - * @parent_handler: the parent interrupt handler for the accumulated IRQ
> - * coming out of the gpiochip.
> - */
> -void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
> -				  struct irq_chip *irqchip,
> -				  unsigned int parent_irq,
> -				  irq_flow_handler_t parent_handler)
> -{
> -	if (gpiochip->irq.threaded) {
> -		chip_err(gpiochip, "tried to chain a threaded gpiochip\n");
> -		return;
> -	}
> -
> -	gpiochip_set_cascaded_irqchip(gpiochip, parent_irq, parent_handler);
> -}
> -EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
> -
>  /**
>   * gpiochip_set_nested_irqchip() - connects a nested irqchip to a gpiochip
>   * @gpiochip: the gpiochip to set the irqchip nested handler to
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 4f032de10bae..e829ad788987 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -585,11 +585,6 @@ int gpiochip_irq_domain_activate(struct irq_domain *domain,
>  void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
>  				    struct irq_data *data);
>  
> -void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
> -		struct irq_chip *irqchip,
> -		unsigned int parent_irq,
> -		irq_flow_handler_t parent_handler);
> -
>  void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
>  		struct irq_chip *irqchip,
>  		unsigned int parent_irq);
> -- 
> 2.23.0
> 

-- 
With Best Regards,
Andy Shevchenko



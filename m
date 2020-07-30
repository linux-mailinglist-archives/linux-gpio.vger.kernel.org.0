Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED78233456
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 16:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbgG3O1E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 10:27:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:11972 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728352AbgG3O1D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Jul 2020 10:27:03 -0400
IronPort-SDR: iXM0FYElfnAw18AWBRPm9Hr5sdWmUOR9DlTVA7qvRjfwx7BeRDOZHgKZlWM6i9y17tLsyRlZ8T
 C1z/vQHCq1Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="149440107"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="149440107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 07:26:58 -0700
IronPort-SDR: q9MglyrsUWaQTzd8FifOrjmx7rtvLUnXYPPwtkF0nwgUy9PQWq2AqHWGqp/3O0IJOzOjTVerf0
 855ciEc6HpYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="435057339"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2020 07:26:55 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1k19WJ-004xye-CE; Thu, 30 Jul 2020 17:26:55 +0300
Date:   Thu, 30 Jul 2020 17:26:55 +0300
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
Subject: Re: [PATCH v2 06/10] gpio: dwapb: Discard GPIO-to-IRQ mapping
 function
Message-ID: <20200730142655.GN3703480@smile.fi.intel.com>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
 <20200730135536.19747-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730135536.19747-7-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 04:55:32PM +0300, Serge Semin wrote:
> Since GPIOlib-based IRQ-chip interface is now utilized there is no need in
> setting up a custom GPIO-to-IRQ mapping method. GPIO-lib defines the
> standard mapping method - gpiochip_to_irq(), which will be used anyway no
> matter whether the custom to_irq callback is specified or not.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> ---
> 
> Changelog v2:
> - This is a new patch detached from commit
>   "gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip".
> ---
>  drivers/gpio/gpio-dwapb.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 327333fbc750..f7acc5abbf5c 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -150,14 +150,6 @@ static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
>  	gc->write_reg(reg_base + gpio_reg_convert(gpio, offset), val);
>  }
>  
> -static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> -{
> -	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
> -	struct dwapb_gpio *gpio = port->gpio;
> -
> -	return irq_find_mapping(gpio->domain, offset);
> -}
> -
>  static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsigned int offs)
>  {
>  	struct dwapb_gpio_port *port;
> @@ -466,8 +458,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	}
>  
>  	girq->chip = &port->irqchip;
> -
> -	port->gc.to_irq = dwapb_gpio_to_irq;
>  }
>  
>  static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko



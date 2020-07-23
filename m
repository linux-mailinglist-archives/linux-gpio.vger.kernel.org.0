Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93ADA22B102
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 16:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgGWOIT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 10:08:19 -0400
Received: from mga11.intel.com ([192.55.52.93]:8749 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727111AbgGWOIT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 10:08:19 -0400
IronPort-SDR: M/aslXAApwUpwgdoHKc9vyij7axE+SLa664p5OxOcCMdsdGI5Gk0Wvzxi9Y8tG2sCABZnTpxR5
 FIVddEo2V/DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="148461355"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="148461355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:08:18 -0700
IronPort-SDR: FYrQsWQR3SEQbICT+WzUfTzZAhpWuLC2eRTff33nOFUtBjNFdFYyA4RBWvh8v9Aw7VZ4cnSBMI
 v7nFmJuF6LCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="302318604"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 23 Jul 2020 07:08:15 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jybtP-003eVU-JI; Thu, 23 Jul 2020 17:08:15 +0300
Date:   Thu, 23 Jul 2020 17:08:15 +0300
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
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200723140815.GL3703480@smile.fi.intel.com>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 04:38:55AM +0300, Serge Semin wrote:
> GPIO-lib provides a ready-to-use interface to initialize an IRQ-chip on
> top of a GPIO chip. It's better from maintainability and readability
> point of view to use one instead of supporting a hand-written Generic
> IRQ-chip-based implementation. Moreover the new implementation won't
> cause much functional overhead but will provide a cleaner driver code.
> All of that makes the DW APB GPIO driver conversion pretty much justified
> especially seeing a tendency of the other GPIO drivers getting converted
> too.
> 
> Here is what we do in the framework of this commit to convert the driver
> to using the GPIO-lib-based IRQ-chip interface:
> 1) IRQ ack, mask and unmask callbacks are locally defined instead of
> using the Generic IRQ-chip ones.
> 2) An irq_chip structure instance is embedded into the dwapb_gpio
> private data. Note we can't have a static instance of that structure since
> GPIO-lib will add some hooks into it by calling gpiochip_set_irq_hooks().
> A warning about that would have been printed by the GPIO-lib code if we
> used a single irq_chip structure instance for multiple DW APB GPIO
> controllers.
> 3) Initialize the gpio_irq_chip structure embedded into the gpio_chip
> descriptor. By default there is no IRQ enabled so any event raised will be
> handled by the handle_bad_irq() IRQ flow handler. If DW APB GPIO IP-core
> is synthesized to have non-shared reference IRQ-lines, then as before the
> hierarchical and cascaded cases are distinguished by checking how many
> parental IRQs are defined. (Note irq_set_chained_handler_and_data() won't
> initialize IRQs, which descriptors couldn't be found.) If DW APB GPIO IP
> is used on a platform with shared IRQ line, then we simply won't let the
> GPIO-lib to initialize the parental IRQs, but will handle them locally in
> the driver.
> 4) Discard linear IRQ-domain and Generic IRQ-chip initialization, since
> GPIO-lib IRQ-chip interface will create a new domain and accept a standard
> IRQ-chip structure pointer based on the setting we provided in the
> gpio_irq_chip structure.
> 5) Manually select a proper IRQ flow handler directly in the
> irq_set_type() callback by calling irq_set_handler_locked() method, since
> an ordinary (not Generic) irq_chip descriptor is now utilized.
> 6) Discard the custom GPIO-to-IRQ mapping function since GPIO-lib defines
> the standard method gpiochip_to_irq(), which will be used anyway no matter
> whether the custom to_irq callback is specified or not.
> 7) Discard the acpi_gpiochip_{request,free}_interrupts()
> invocations, since they will be called from
> gpiochip_add_irqchip()/gpiochip_irqchip_remove() anyway.
> 8) Alter CONFIG_GPIO_DWAPB kernel config to select
> CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.


...

One more thing...

>  static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
>  {
> +	struct gpio_chip *gc = &gpio->ports[0].gc;
>  	unsigned long irq_status;
>  	irq_hw_number_t hwirq;
>  
>  	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
>  	for_each_set_bit(hwirq, &irq_status, 32) {
> -		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
> +		int gpio_irq = gc->to_irq(gc, hwirq);

Very, very few do this.
Can we stick with the original one?
(See plenty of other examples in the GPIO / pin control subsystems.

>  		u32 irq_type = irq_get_trigger_type(gpio_irq);
>  
>  		generic_handle_irq(gpio_irq);


>  }

-- 
With Best Regards,
Andy Shevchenko



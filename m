Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF3E233451
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 16:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgG3O0X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 10:26:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:51832 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbgG3O0W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Jul 2020 10:26:22 -0400
IronPort-SDR: EKA6l8smH00tcJxWoJMeY6BB+2UcrC4Ay7w/RlWsA4vQ1kdR+KZC4KXhsrAPAaEQIEPZhhRC5J
 lZNE6Os2eogA==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="139602083"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="139602083"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 07:26:21 -0700
IronPort-SDR: 0z/f9C0aKmcaJuv9JfTI6EX2hMEDI6ArHeITPd+Iv9SFJPbVsBFb4MeSzXy9cZZu0hJrosKyMm
 gyS4PA/BHLsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="322912485"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2020 07:26:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1k19Vi-004xxx-Hb; Thu, 30 Jul 2020 17:26:18 +0300
Date:   Thu, 30 Jul 2020 17:26:18 +0300
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
Subject: Re: [PATCH v2 05/10] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
Message-ID: <20200730142618.GM3703480@smile.fi.intel.com>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
 <20200730135536.19747-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730135536.19747-6-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2020 at 04:55:31PM +0300, Serge Semin wrote:
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

Easy to read if you put blank lines in between of items.

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
> an ordinary (not Generic) irq_chip descriptor is now utilized. Note this
> shalln't give any regression
> 6) Alter CONFIG_GPIO_DWAPB kernel config to select
> CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.
> 
> Note neither 4) nor 5) shall cause a regression of commit 6a2f4b7dadd5
> ("gpio: dwapb: use a second irq chip"), since the later isn't properly
> used here anyway.

...

>  struct dwapb_gpio_port {
>  	struct gpio_chip	gc;
> +	unsigned int		nr_irqs;
> +	unsigned int		irq[DWAPB_MAX_GPIOS];
> +	struct irq_chip		irqchip;
>  	bool			is_registered;
>  	struct dwapb_gpio	*gpio;

Isn't it too much wasted memory (imagine 4 port controller)?

What if we have it in another structure and allocate dynamically?

struct dwapb_gpio_port_irqchip {
	struct irq_chip		irqchip;
	unsigned int		nr_irqs;
	unsigned int		irq[DWAPB_MAX_GPIOS];
};

	...
	struct dwapb_gpio_port_irqchip *pirq;
	...

(I agree that IRQ chip is rather property of a port than controller)

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F7A228BB9
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 23:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgGUVyN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 17:54:13 -0400
Received: from mga18.intel.com ([134.134.136.126]:64109 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbgGUVyN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 17:54:13 -0400
IronPort-SDR: G6KZb92EsOTc7muzlA5KX9Xq/BRbCjJ/6+twJRnO7JjluaQhT1cg+GJzGz1ihj39qpj9RNw+3I
 Xp0RyfyasR2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="137740052"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; 
   d="scan'208";a="137740052"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 14:54:12 -0700
IronPort-SDR: xEZfhZGVD2Anw46ZnHQlkViTWITUiihNZOpF2aP+0GSLhAd8mTJtsaEIhXWX02C5M6M0kNq1aB
 5lqtPVCccVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; 
   d="scan'208";a="284007170"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 21 Jul 2020 14:54:11 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jy0DD-0038ug-EA; Wed, 22 Jul 2020 00:54:11 +0300
Date:   Wed, 22 Jul 2020 00:54:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
Message-ID: <20200721215411.GR3703480@smile.fi.intel.com>
References: <20200721140153.369171-1-linus.walleij@linaro.org>
 <50c79c0d-3942-c248-fef0-27fa3592b89c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50c79c0d-3942-c248-fef0-27fa3592b89c@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 10:08:57AM -0700, Kuppuswamy, Sathyanarayanan wrote:
> Hi,
> 
> On 7/21/20 7:01 AM, Linus Walleij wrote:
> > This makes the driver use the irqchip template to assign
> > properties to the gpio_irq_chip instead of using the
> > explicit calls to gpiochip_irqchip_add_nested() and
> > gpiochip_set_nested_irqchip(). The irqchip is instead
> > added while adding the gpiochip.
> Looks good to me.

Thanks!

>     Reviewed-by: Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com>

It's not first time your tag goes like this. Please, fix your tools to be it like
Reviewed-by: Name <address@com>
(no leading spaces, no split -- one line)

> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->V2:
> > - Fixed a variable name ch->cg
> > ---
> >   drivers/gpio/gpio-crystalcove.c | 24 +++++++++++++++---------
> >   1 file changed, 15 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
> > index 14d1f4c933b6..39349b0e6923 100644
> > --- a/drivers/gpio/gpio-crystalcove.c
> > +++ b/drivers/gpio/gpio-crystalcove.c
> > @@ -330,6 +330,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
> >   	int retval;
> >   	struct device *dev = pdev->dev.parent;
> >   	struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
> > +	struct gpio_irq_chip *girq;
> >   	if (irq < 0)
> >   		return irq;
> > @@ -353,14 +354,15 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
> >   	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
> >   	cg->regmap = pmic->regmap;
> > -	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> > -	if (retval) {
> > -		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> > -		return retval;
> > -	}
> > -
> > -	gpiochip_irqchip_add_nested(&cg->chip, &crystalcove_irqchip, 0,
> > -				    handle_simple_irq, IRQ_TYPE_NONE);
> > +	girq = &cg->chip.irq;
> > +	girq->chip = &crystalcove_irqchip;
> > +	/* This will let us handle the parent IRQ in the driver */
> > +	girq->parent_handler = NULL;
> > +	girq->num_parents = 0;
> > +	girq->parents = NULL;
> > +	girq->default_type = IRQ_TYPE_NONE;
> > +	girq->handler = handle_simple_irq;
> > +	girq->threaded = true;
> >   	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
> >   				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
> > @@ -370,7 +372,11 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
> >   		return retval;
> >   	}
> > -	gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
> > +	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> > +	if (retval) {
> > +		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> > +		return retval;
> > +	}
> >   	return 0;
> >   }
> > 
> 
> -- 
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer

-- 
With Best Regards,
Andy Shevchenko



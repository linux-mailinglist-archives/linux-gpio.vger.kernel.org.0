Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B06948A4D2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 19:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfHLRro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 13:47:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:55075 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfHLRro (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 13:47:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 10:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; 
   d="scan'208";a="187512101"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga002.jf.intel.com with ESMTP; 12 Aug 2019 10:38:38 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxEHE-0001PW-4H; Mon, 12 Aug 2019 20:38:36 +0300
Date:   Mon, 12 Aug 2019 20:38:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: merrifield: Pass irqchip when adding gpiochip
Message-ID: <20190812173836.GQ30120@smile.fi.intel.com>
References: <20190812082331.22674-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812082331.22674-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 10:23:31AM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.

All three Intel GPIO changes with kcalloc() fix I was commenting about
pushed to my review and testing queue. Thanks!

> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Andy: when you're happy with this you can either supply an
> ACK and I will merge it or you can merge it into your tree
> for a later pull request, just tell me what you prefer.
> ---
>  drivers/gpio/gpio-merrifield.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index 3302125e5265..299277951791 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -397,6 +397,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>  {
>  	const struct mrfld_gpio_pinrange *range;
>  	const char *pinctrl_dev_name;
> +	struct gpio_irq_chip *girq;
>  	struct mrfld_gpio *priv;
>  	u32 gpio_base, irq_base;
>  	void __iomem *base;
> @@ -444,6 +445,21 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>  
>  	raw_spin_lock_init(&priv->lock);
>  
> +	girq = &priv->chip.irq;
> +	girq->chip = &mrfld_irqchip;
> +	girq->parent_handler = mrfld_irq_handler;
> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(&pdev->dev, 1,
> +				     sizeof(*girq->parents),
> +				     GFP_KERNEL);
> +	if (!girq->parents)
> +		return -ENOMEM;
> +	girq->parents[0] = pdev->irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_bad_irq;
> +
> +	mrfld_irq_init_hw(priv);
> +
>  	pci_set_drvdata(pdev, priv);
>  	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
>  	if (retval) {
> @@ -465,18 +481,6 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>  		}
>  	}
>  
> -	retval = gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip, irq_base,
> -				      handle_bad_irq, IRQ_TYPE_NONE);
> -	if (retval) {
> -		dev_err(&pdev->dev, "could not connect irqchip to gpiochip\n");
> -		return retval;
> -	}
> -
> -	mrfld_irq_init_hw(priv);
> -
> -	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip, pdev->irq,
> -				     mrfld_irq_handler);
> -
>  	return 0;
>  }
>  
> -- 
> 2.21.0
> 

-- 
With Best Regards,
Andy Shevchenko



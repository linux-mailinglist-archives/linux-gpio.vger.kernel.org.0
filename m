Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2FCFE9E89
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 16:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfJ3PLu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 11:11:50 -0400
Received: from mga03.intel.com ([134.134.136.65]:42043 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfJ3PLu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 11:11:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 08:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="230477840"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 30 Oct 2019 08:11:47 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iPpdS-0007cd-Fm; Wed, 30 Oct 2019 17:11:46 +0200
Date:   Wed, 30 Oct 2019 17:11:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
Message-ID: <20191030151146.GA32742@smile.fi.intel.com>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030144940.21133-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 03:49:40PM +0100, Linus Walleij wrote:
> This fixes a semantic ordering issue as we need to add
> pin ranges before adding gpiochips when gpiochips use
> pin control as a backend: as it needs to talk to the
> pin control backend during initialization, the backend
> needs to be there already.
> 
> Other drivers in the tree using pincontrol as backend do
> not necessarily have this problem, as they might not need
> to access the pincontrol portions during initialization.

Thanks for the fix!
One nit below.

> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hans: would be great if you could test this. I can't
> even compiletest right now because of a slow machine
> as workhorse...
> ---
>  drivers/gpio/gpio-merrifield.c             | 18 +++++++++++-------
>  drivers/pinctrl/intel/pinctrl-baytrail.c   | 14 +++++++++-----
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++++------
>  drivers/pinctrl/intel/pinctrl-intel.c      | 16 ++++++++++------
>  drivers/pinctrl/pinctrl-amd.c              | 14 +++++++++-----
>  5 files changed, 49 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index 2f1e9da81c1e..195e253cb561 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -463,13 +463,10 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_bad_irq;
>  
> -	pci_set_drvdata(pdev, priv);
> -	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
> -	if (retval) {
> -		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
> -		return retval;
> -	}
> -
> +	/*
> +	 * Needs to happen first since the gpiochip is using pin
> +	 * control as back-end.
> +	 */
>  	pinctrl_dev_name = mrfld_gpio_get_pinctrl_dev_name(priv);
>  	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
>  		range = &mrfld_gpio_ranges[i];
> @@ -484,6 +481,13 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>  		}
>  	}

> +	pci_set_drvdata(pdev, priv);

I think we may move it after the call before last return.

> +	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
> +	if (retval) {
> +		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
> +		return retval;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index beb26550c25f..b308567c5153 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1549,16 +1549,20 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>  		girq->handler = handle_bad_irq;
>  	}
>  
> -	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
> +	/*
> +	 * Needs to happen first since the gpiochip is using pin
> +	 * control as back-end.
> +	 */
> +	ret = gpiochip_add_pin_range(gc, dev_name(&vg->pdev->dev),
> +				     0, 0, vg->soc_data->npins);
>  	if (ret) {
> -		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
> +		dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
>  		return ret;
>  	}
>  
> -	ret = gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev),
> -				     0, 0, vg->soc_data->npins);
> +	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
>  	if (ret) {
> -		dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
> +		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
>  		return ret;
>  	}
>  
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index dff2a81250b6..13144e192c1f 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1572,12 +1572,10 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>  	if (need_valid_mask)
>  		chip->irq.init_valid_mask = chv_init_irq_valid_mask;
>  
> -	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
> -	if (ret) {
> -		dev_err(pctrl->dev, "Failed to register gpiochip\n");
> -		return ret;
> -	}
> -
> +	/*
> +	 * Needs to happen first since the gpiochip is using pin
> +	 * control as back-end.
> +	 */
>  	for (i = 0; i < community->ngpio_ranges; i++) {
>  		range = &community->gpio_ranges[i];
>  		ret = gpiochip_add_pin_range(chip, dev_name(pctrl->dev),
> @@ -1589,6 +1587,12 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>  		}
>  	}
>  
> +	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
> +	if (ret) {
> +		dev_err(pctrl->dev, "Failed to register gpiochip\n");
> +		return ret;
> +	}
> +
>  	/*
>  	 * The same set of machines in chv_no_valid_mask[] have incorrectly
>  	 * configured GPIOs that generate spurious interrupts so we use
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index b54b27228ad9..78afcf13c444 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1225,12 +1225,10 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  	pctrl->irqchip.irq_set_wake = intel_gpio_irq_wake;
>  	pctrl->irqchip.flags = IRQCHIP_MASK_ON_SUSPEND;
>  
> -	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> -	if (ret) {
> -		dev_err(pctrl->dev, "failed to register gpiochip\n");
> -		return ret;
> -	}
> -
> +	/*
> +	 * Needs to happen first since the gpiochip is using pin
> +	 * control as back-end.
> +	 */
>  	for (i = 0; i < pctrl->ncommunities; i++) {
>  		struct intel_community *community = &pctrl->communities[i];
>  
> @@ -1241,6 +1239,12 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  		}
>  	}
>  
> +	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> +	if (ret) {
> +		dev_err(pctrl->dev, "failed to register gpiochip\n");
> +		return ret;
> +	}
> +
>  	/*
>  	 * We need to request the interrupt here (instead of providing chip
>  	 * to the irq directly) because on some platforms several GPIO
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 2c61141519f8..3637059083ff 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -912,17 +912,21 @@ static int amd_gpio_probe(struct platform_device *pdev)
>  		return PTR_ERR(gpio_dev->pctrl);
>  	}
>  
> -	ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
> -	if (ret)
> -		return ret;
> -
> +	/*
> +	 * Needs to happen first since the gpiochip is using pin
> +	 * control as back-end.
> +	 */
>  	ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
>  				0, 0, gpio_dev->gc.ngpio);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to add pin range\n");
> -		goto out2;
> +		return ret;
>  	}
>  
> +	ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = gpiochip_irqchip_add(&gpio_dev->gc,
>  				&amd_gpio_irqchip,
>  				0,
> -- 
> 2.21.0
> 

-- 
With Best Regards,
Andy Shevchenko



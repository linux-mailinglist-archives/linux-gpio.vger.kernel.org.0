Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E626A3DD76F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 15:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbhHBNkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 09:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbhHBNkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 09:40:35 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87243C06175F;
        Mon,  2 Aug 2021 06:40:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id m9so23946976ljp.7;
        Mon, 02 Aug 2021 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jv8pADUt4yLh8Zvkj2Wwg6PjtKLLuSJnq1IBfyqLTPQ=;
        b=fHbHSk+ly2b1uuApY9A3faV6nTgSnmMnZJbaz5Dj7ZByMy45dqUSUkHo2otbrCKk2x
         +81RCNfKeZr/LOVvcwCxoBMrBooaJAT8C4RNVqNcLju3A22ut7ehW7s/0MEzQTt77Dn8
         9SVsBPVGqzt88Obk92BaO5QFpkTM/ljHSH+nOLk+9LRhoP+qwgAC/3vd1zZ6iXczIPwP
         0Tf6RFlNJCTls7LUi8P6XhX1s1VPSl0kf5lR2hi0aGHPaazzBLpgXHRTUUPYDtbi3/aQ
         g2NkkzfwTiayX6AtbLHtUPrTw/gtRBG3VtApXTtOUs8gvqR8qpgWUKr3JC0QDBG+GqRF
         FfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jv8pADUt4yLh8Zvkj2Wwg6PjtKLLuSJnq1IBfyqLTPQ=;
        b=Gdczc7SenZ689x7ULcxht9SkCz88nNrEzNFYGXpbaV4maHBu2sfuK9JfYhRNdLFafa
         V9dda8fI99jX+sSxbxurwdr0vzlOHR4LXGaVvrabY31X9se0GWr4dgpmMarexmu8Ph57
         QHgGPjVODxKh9jnuOkAYTSoVmnJJFrBrDECYWXvHaXnKd7CnZHk/zNcaIVVnzuoaSDL+
         G/jMRTKiMihSEvY5VpeZhBjrAEp5b9/8m+/fpdXd0gW64uHcKnYzeXbpfYnA/NU16Nzd
         mi7Der6UTQQWUls5d1ynVsZl4UPAjfGcy5Cxypb8iAl27VwFEP4K3bhQqqzBj+5TacOX
         VZ2A==
X-Gm-Message-State: AOAM533dCYHC/1LbVzfdqmkuZXpMscr21Dsig7VwzjPR7Dmz7c7YeChx
        LBWeF0+By6pP5e8wZDzxg8A=
X-Google-Smtp-Source: ABdhPJxrR08Mepotg5t2qwFcX1z1f1faX8x6Vf0zkF6B/lDjqWbtZmiBqiRyXu+zZdvtKgAsx9cOJA==
X-Received: by 2002:a2e:bf27:: with SMTP id c39mr11284669ljr.59.1627911623896;
        Mon, 02 Aug 2021 06:40:23 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id o10sm962492lfl.129.2021.08.02.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 06:40:23 -0700 (PDT)
Date:   Mon, 2 Aug 2021 16:40:21 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/4] gpio: dwapb: Unify ACPI enumeration checks in
 get_irq() and configure_irqs()
Message-ID: <20210802134021.flrkpmlrcjfxdrdr@mobilestation>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy
Thanks for the cleanup series. A tiny note is below.

On Mon, Jul 26, 2021 at 03:54:33PM +0300, Andy Shevchenko wrote:
> Shared IRQ is only enabled for ACPI enumeration, there is no need
> to have a special flag for that, since we simple can test if device
> has been enumerated by ACPI. This unifies the checks in dwapb_get_irq()
> and dwapb_configure_irqs().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c                | 13 ++++++-------
>  drivers/mfd/intel_quark_i2c_gpio.c       |  1 -
>  include/linux/platform_data/gpio-dwapb.h |  1 -
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 3eb13d6d31ef..f6ae69d5d644 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -436,12 +436,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
>  #endif
>  

> -	if (!pp->irq_shared) {
> -		girq->num_parents = pirq->nr_irqs;
> -		girq->parents = pirq->irq;
> -		girq->parent_handler_data = gpio;
> -		girq->parent_handler = dwapb_irq_handler;
> -	} else {
> +	if (has_acpi_companion(gpio->dev)) {

Before this patch the platform flag irq_shared has been as kind of a
hint regarding the shared IRQ case being covered here. But now it
doesn't seem obvious why we've got the ACPI and ACPI-less cases
differently handled. What about adding a small comment about that?
E.g. like this: "Intel ACPI-based platforms mostly have the DW APB
GPIO IRQ lane shared between several devices. In that case the
parental IRQ has to be handled in the shared way so to be properly
delivered to all the connected devices." or something more detailed
for your preference. After that the rest of the comments in the
if-clause could be discarded.

Other than that, feel free to add:
>  drivers/gpio/gpio-dwapb.c                | 13 ++++++-------
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

>  		/* This will let us handle the parent IRQ in the driver */
>  		girq->num_parents = 0;
>  		girq->parents = NULL;
> @@ -458,6 +453,11 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  			dev_err(gpio->dev, "error requesting IRQ\n");
>  			goto err_kfree_pirq;
>  		}
> +	} else {
> +		girq->num_parents = pirq->nr_irqs;
> +		girq->parents = pirq->irq;
> +		girq->parent_handler_data = gpio;
> +		girq->parent_handler = dwapb_irq_handler;
>  	}
>  
>  	girq->chip = &pirq->irqchip;
> @@ -581,7 +581,6 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  			pp->ngpio = DWAPB_MAX_GPIOS;
>  		}
>  
> -		pp->irq_shared	= false;
>  		pp->gpio_base	= -1;
>  
>  		/*
> diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
> index 01935ae4e9e1..a43993e38b6e 100644
> --- a/drivers/mfd/intel_quark_i2c_gpio.c
> +++ b/drivers/mfd/intel_quark_i2c_gpio.c
> @@ -227,7 +227,6 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev)
>  	pdata->properties->ngpio	= INTEL_QUARK_MFD_NGPIO;
>  	pdata->properties->gpio_base	= INTEL_QUARK_MFD_GPIO_BASE;
>  	pdata->properties->irq[0]	= pci_irq_vector(pdev, 0);
> -	pdata->properties->irq_shared	= true;
>  
>  	cell->platform_data = pdata;
>  	cell->pdata_size = sizeof(*pdata);
> diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
> index 0aa5c6720259..535e5ed549d9 100644
> --- a/include/linux/platform_data/gpio-dwapb.h
> +++ b/include/linux/platform_data/gpio-dwapb.h
> @@ -14,7 +14,6 @@ struct dwapb_port_property {
>  	unsigned int	ngpio;
>  	unsigned int	gpio_base;
>  	int		irq[DWAPB_MAX_GPIOS];
> -	bool		irq_shared;
>  };
>  
>  struct dwapb_platform_data {
> -- 
> 2.30.2
> 

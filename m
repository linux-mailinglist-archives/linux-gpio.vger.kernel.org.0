Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207971D686C
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2020 16:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgEQO0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 May 2020 10:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQO0f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 May 2020 10:26:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D84C061A0C
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 07:26:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d22so5712216lfm.11
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TK2mBgWz0RGQ59y6fg8zkomojtOgRfWrzozwomJflK0=;
        b=EmZPXTWZVsB/mm0yNpuUzbHPN58PAwcygMdGUoz9CfZ59IwDGGiUf9yu2ki/2HX0C0
         u3CvyiVhvtWVDffspXenJcsw1BabnUmyq+erqZgEFDYzM+3gFGjxyTg8WTRuOz0kB6t+
         VAsLh/tjdnWcxSLs/dK2cEQuDvZv1a7C3pkREuOxqqiOwNacdMfMF7r8KcWhIUsICWVa
         270idwE4ia7X0C/TXAGx7h+Lnh028GHsUysDaZFmQVy0PVfeShvnWROZ7YgKryKuZXSf
         hqGO4MbGmsX7YdBr53HE+QosYI0jfTbUxxrZmyz4pXuRUq1GetIlfOKXLsDnNPmYN5CE
         5tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TK2mBgWz0RGQ59y6fg8zkomojtOgRfWrzozwomJflK0=;
        b=UvlDZMxu6U0WpwjyHXW9zr7swTt1tsBtnmm0Z47tYXupU5zpq19FxGKNKw/Zyru2VK
         W+Hdl3YmKsoUe2eOJsueEj79XAhJDcM0Bid4hmb1BdrpoyP9L8h7LLcrHdB+M01rgDd2
         ZbFOF/Q2Rn/MbVBZnD45mWL2G/4D4mYbyJHaKL+PQPRVD0arvyksym5YB0JuLoTD5ljs
         fiW7TJgts06HCCfb7QVna98ZH6QO4Rkvu9XEbOOipf0REZuTOtsVOX+t07FqQ+lbdrF2
         O2K6rev65dmhOBc16aovvfnCbspo38T+Ab/qNLlaHdLZ37DgVZCKBNzeCla8xjPVOXPl
         dAIg==
X-Gm-Message-State: AOAM532s3U3QVcRoVLFY4XqyEmSLqGKUPHxVTgWF98YW5eBFy7+3up4+
        PFD9lOatH4fl6g5g6oMSFOk=
X-Google-Smtp-Source: ABdhPJw7QpJ5nvln48inuNlBaUOIjQmul//rxwpjXEnCceWDWzegry4U9H7/C64Gijnm38r49AQEWw==
X-Received: by 2002:a05:6512:110d:: with SMTP id l13mr8544211lfg.93.1589725593047;
        Sun, 17 May 2020 07:26:33 -0700 (PDT)
Received: from mobilestation ([95.79.192.151])
        by smtp.gmail.com with ESMTPSA id j29sm5860020lfp.90.2020.05.17.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 07:26:32 -0700 (PDT)
Date:   Sun, 17 May 2020 17:26:30 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 4/4] gpio: dwapb: Remove unneeded has_irq member in
 struct dwapb_port_property
Message-ID: <20200517142630.wqgzspmcnfmi6lzm@mobilestation>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512184513.86883-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 09:45:13PM +0300, Andy Shevchenko wrote:
> has_irq member of struct dwapb_port_property is used only in one place,
> so, make it local test instead and remove from the structure.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c                | 12 +++++++-----
>  include/linux/platform_data/gpio-dwapb.h |  1 -
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2975f2d369874a..87834adccc4534 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -366,6 +366,11 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	irq_hw_number_t hwirq;
>  	int err, i;
>  

> +	if (memchr_inv(pp->irq, 0, sizeof(pp->irq)) == NULL) {
> +		dev_warn(gpio->dev, "no IRQ for port%d\n", pp->idx);
> +		return;
> +	}
> +

Ah, that's why you added the memchr_inv() method in patch 2. So to move it
to dwapb_configure_irqs() at this point. Anyway I still think, that it would be
better to leave the has_irq initialization in the loop there, but here you could
just remove that assignment. For this patch:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

I'll test the whole series up when you send v2. Our hardware is equipped with
two DW APB GPIO IPs with Port A enabled for each. One of them is connected to an
interrupt controller by a single line.

-Sergey

>  	gpio->domain = irq_domain_create_linear(fwnode, ngpio,
>  						 &irq_generic_chip_ops, gpio);
>  	if (!gpio->domain)
> @@ -501,7 +506,8 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  	if (pp->idx == 0)
>  		port->gc.set_config = dwapb_gpio_set_config;
>  
> -	if (pp->has_irq)
> +	/* Only port A can provide interrupts in all configurations of the IP */
> +	if (pp->idx == 0)
>  		dwapb_configure_irqs(gpio, port, pp);
>  
>  	err = gpiochip_add_data(&port->gc, port);
> @@ -553,10 +559,6 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
>  
>  		pp->irq[j] = err;
>  	}
> -
> -	pp->has_irq = memchr_inv(pp->irq, 0, sizeof(pp->irq)) != NULL;
> -	if (!pp->has_irq)
> -		dev_warn(dev, "no irq for port%d\n", pp->idx);
>  }
>  
>  static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
> diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
> index 3c606c450d0596..ff1be737bad6aa 100644
> --- a/include/linux/platform_data/gpio-dwapb.h
> +++ b/include/linux/platform_data/gpio-dwapb.h
> @@ -12,7 +12,6 @@ struct dwapb_port_property {
>  	unsigned int	ngpio;
>  	unsigned int	gpio_base;
>  	int		irq[32];
> -	bool		has_irq;
>  	bool		irq_shared;
>  };
>  
> -- 
> 2.26.2
> 

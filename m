Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CDB1A9EF4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409765AbgDOME6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409762AbgDOMEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 08:04:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A93DC061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:04:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so1766294ljl.6
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ObiXuKAh5UtW+CVUtUOibxhdWiN86JVwDk1EQcR/TxY=;
        b=OAW+Om4h0Cy4UIWag1Ki1QWT+fwR2cJClW9CMVGU+xi4ikOZTWDl60HfwKIurVGQ9G
         XfPRFjG2h996ZzxGsGqp0xt+Y+eDNx+Z6EBcXS85RTPYcuQlOsyF7i5ODcVngKUxK03e
         fKiAvrcETL21f8gcm1PyS025O2vpOJ1x7C9CvNiapWvSCat4De5KXh8Ig27sBib6XS4N
         wRR/SeHHoqgcrocWN+MOTPFNWDd7ooaWOvsgLZotLuy0WxyxEkOkaRxV2GeNsIVOzPjn
         7UAVaTJx8nAlU54iOAEDxm2zSmT/T92cu0QGDs7m9eCh3YhThx+TyTnHyXqzIlZR15D/
         LI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ObiXuKAh5UtW+CVUtUOibxhdWiN86JVwDk1EQcR/TxY=;
        b=eLPeHw6sHKMlSwVOSsCmVYGBg7OXTlL3a4je9yITRp+RqDcGTRcdv8sUI+3Q+MrSB0
         r+JUvbdDqK9Os9UYWAnst5EbuYlAaO8RH1gClgxQ4UqbuI80ILoqAEzbbmmRBVASH50N
         sbvGpf6aLzVKD64e7fhkq4HE38HWqUZmUa/uwMPypULP6Zwr3YRBU/JlpWo0faRANhHJ
         raSyMAxlHzL5qvZblshCkgf1SQ6YV9S4sa1rUk+g+780LE+qKXBB/hngCC7RNk04gYD9
         g5pKRkzFKjxvfAFTYCQDkKoHOI55Pr5/TeqL8KD+MfEDvbRyzGP/6SVjb9VPhPGag7Lk
         Hv+w==
X-Gm-Message-State: AGi0PubsSfuyb9m7tAq/Em7l7Kn/sue5aenowAOdYi6X+M14luStVzHM
        z25rblkWPOqrsRTaZldYSpM9D5ju
X-Google-Smtp-Source: APiQypJQqInYLYMoDbLB2492FjLroy6HBQcAduxAwnJshLDVJPBQ0cUtTJq0knyC+rBMEDsHt2nXOQ==
X-Received: by 2002:a2e:6e15:: with SMTP id j21mr3127544ljc.42.1586952291479;
        Wed, 15 Apr 2020 05:04:51 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id e15sm1025139ljb.25.2020.04.15.05.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:04:50 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:04:49 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 02/13] gpio: dwapb: Refactor IRQ handler
Message-ID: <20200415120449.lzf47ju6s4bpfcvs@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:17PM +0300, Andy Shevchenko wrote:
> Refactor IRQ handler in order to:
> - enter and exit chained IRQ
> - use for_each_set_bit() helper

Please split these two changes into the dedicated patches.

After this
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index c1b6d4f7307e..f61139f787d9 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -193,22 +193,21 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
>  
>  static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
>  {
> -	u32 irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
> -	u32 ret = irq_status;
> +	unsigned long irq_status;
> +	int hwirq;
>  
> -	while (irq_status) {
> -		int hwirq = fls(irq_status) - 1;
> +	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
> +	for_each_set_bit(hwirq, &irq_status, 32) {
>  		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
> +		u32 irq_type = irq_get_trigger_type(gpio_irq);
>  
>  		generic_handle_irq(gpio_irq);
> -		irq_status &= ~BIT(hwirq);
>  
> -		if ((irq_get_trigger_type(gpio_irq) & IRQ_TYPE_SENSE_MASK)
> -			== IRQ_TYPE_EDGE_BOTH)
> +		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
>  			dwapb_toggle_trigger(gpio, hwirq);
>  	}
>  
> -	return ret;
> +	return irq_status;
>  }
>  
>  static void dwapb_irq_handler(struct irq_desc *desc)
> @@ -216,10 +215,9 @@ static void dwapb_irq_handler(struct irq_desc *desc)
>  	struct dwapb_gpio *gpio = irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
>  
> +	chained_irq_enter(chip, desc);
>  	dwapb_do_irq(gpio);
> -
> -	if (chip->irq_eoi)
> -		chip->irq_eoi(irq_desc_get_irq_data(desc));
> +	chained_irq_exit(chip, desc);
>  }
>  
>  static void dwapb_irq_enable(struct irq_data *d)
> -- 
> 2.25.1
> 

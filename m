Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8781B4A91
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 18:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDVQdA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 12:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgDVQc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 12:32:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7428BC03C1A9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 09:32:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so2245958lfq.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=makdhjM6rKQgg91yAwZPzBKMSqARiNs/d1VhyWY1Eqg=;
        b=d7yN6ghOqRUIELVzFYhZouGyupdpgVtbXQT88gLdKNraDoh4W9MBxrIakpXYjxoXm+
         OzqybhwOrjwgkA4oBIKMPTfTxTlncKpkll0m6CjM0qmTfccHRjZ4J73d9en56PSI+ChK
         E7wLIE0xWl++zWV08dqCTmg+1jo2LymrRo+mX3HWI0BmZtmnwQSP/pNl0qni97uhfY+M
         IK/qEzKkJQiTUHmQ2APb79jE5BNQN5/NfRilgt6Ge2Bi6NNbuH2iSpUeqEb5dSh4P74q
         BxiJCz+6G8cEV7FjG7o4cFyr5h+fKb6qvbhTd53xDwatndfLVjqlelfMsroQ99onVYHJ
         cnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=makdhjM6rKQgg91yAwZPzBKMSqARiNs/d1VhyWY1Eqg=;
        b=UCqkf8EddrwqJwvGFelojj/DzpXD+M6iX29LqvroeFXsEc5lLWkSY1RBN5EfWGYfvJ
         UC8O/9LoKDz2O34CYZS8bqPOTqqyPscjwZLlQDe6rlzMLiyWRMI9EklxsNCuWlWN9zju
         fw1OhHLA/cmUmEpRAYm2Gnv30FWiVCsfN8sEHhiob7iIMMZFghWyEl/R8ouZXQzrSXN+
         VW1GqmwK4c2x9UDBk01KUmlQC2Bmd4HDeC7SolLYtySPS5lNk26HqxC3k/MQekTiKa6F
         6qSdfjI72UStoJnznOSX6HZx/tUO6uNpR3eaWlOpopF806kMWm5fLTS0Nso8jdadYZWC
         LBfw==
X-Gm-Message-State: AGi0PuY58PlypH3bZ0mA0F0ssMQU0xmwwTZ+FH3aZSaS5qyCXiIFtSn/
        zVLd3adRdPZbw6A0WbHZSnU=
X-Google-Smtp-Source: APiQypLEW6FF9OUTkT8zSYl+yJykzUiBW9puB2zNRCgvbJPVQ7zrGGg0iiX4T9kSu6J7qPbDaFZiGg==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr18186512lfc.29.1587573177887;
        Wed, 22 Apr 2020 09:32:57 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id 18sm2156331ljo.17.2020.04.22.09.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 09:32:57 -0700 (PDT)
Date:   Wed, 22 Apr 2020 19:32:55 +0300
From:   Sergey Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/2] gpio: dwapb: Amend indentation in some cases
Message-ID: <20200422163255.23ch3kbhn6gx2kpg@mobilestation>
References: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
 <20200422110654.23442-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422110654.23442-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 02:06:54PM +0300, Andy Shevchenko wrote:
> In some cases indentation makes code harder to read. Amend indentation
> in those cases despite of lines go a bit over 80 character limit.

Acked-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 9d8476afaba3d..8639c4a7f4697 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -437,7 +437,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		}
>  	}
>  
> -	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
> +	for (hwirq = 0; hwirq < ngpio; hwirq++)
>  		irq_create_mapping(gpio->domain, hwirq);
>  
>  	port->gc.to_irq = dwapb_gpio_to_irq;
> @@ -453,7 +453,7 @@ static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
>  	if (!gpio->domain)
>  		return;
>  
> -	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
> +	for (hwirq = 0; hwirq < ngpio; hwirq++)
>  		irq_dispose_mapping(irq_find_mapping(gpio->domain, hwirq));
>  
>  	irq_domain_remove(gpio->domain);
> @@ -478,10 +478,9 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  		return -ENOMEM;
>  #endif
>  
> -	dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_STRIDE);
> -	set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_STRIDE);
> -	dirout = gpio->regs + GPIO_SWPORTA_DDR +
> -		(pp->idx * GPIO_SWPORT_DDR_STRIDE);
> +	dat = gpio->regs + GPIO_EXT_PORTA + pp->idx * GPIO_EXT_PORT_STRIDE;
> +	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
> +	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
>  
>  	/* This registers 32 GPIO lines per port */
>  	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
> @@ -588,8 +587,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios",
> -					 &pp->ngpio)) {
> +		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
>  			dev_info(dev,
>  				 "failed to get number of gpios for port%d\n",
>  				 i);
> -- 
> 2.26.1
> 

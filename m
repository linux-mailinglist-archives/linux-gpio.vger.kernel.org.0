Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A8F1D684B
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2020 15:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgEQNz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 May 2020 09:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQNz0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 May 2020 09:55:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18A6C061A0C
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 06:55:25 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e25so7010534ljg.5
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DOB4CfvdIztfB6EGkD/GK0vQAz1kdsu/nOHpX/66IIc=;
        b=mJwH2xfNeX0eGXGw5j8gV9llsWQ69i7W76wOnVmniZDsqpa4OJjF3D7zEqQxEda7EX
         3ubT1eliJvUe9sqYeTlUTH8n2quFBZRvTWg1r5Lu9T2x6FUuHWttJ1s8BHanbTf5dKjq
         lBGhxFMU8rPCp9EKF0H+9ywf10YpdVxEM6Zeop/eUqvbkkNf23dUkdrj8WKMrdNZXzfG
         Oi+NGLRvwNuFdYg3RKRmfgoxptoBzFEFjySTzGtl//MjfSNOaFsuCMIQ8FP8YiHaSws+
         Wk3PkGJK1/Z0zZYHqrh1VNzgkF0OkjXaGr8hkbJidohi13CCH7w1xG126EbNOLVMn/L5
         p2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DOB4CfvdIztfB6EGkD/GK0vQAz1kdsu/nOHpX/66IIc=;
        b=n5fBFRhLIuKMEDDDlymXwyrd7hCAW4DCrrnt8RS+jj2QeXqHnU2ed6bmN7wbJCAMuA
         EiEB0c29Tq2bVGMIMqYLHDrJMtBdAg9SNIOZaATDyLB/229DTrU54ZvGFWfdBpJTE/G+
         WHju4scnrnRtZlrF2yR6gciWiNVSRAAO0BAT1XPOCLYsQdAKDVZjFOYacat0zVYn0a5H
         xPQH18YNdrVvP511sEtD3R/QseFTafU7kxG9ZizvkBlJnwUfOrT7cElEJWWodGeHGPp4
         S75rT4WtqMwu8RtvU5Wc1E+ogoLAVX0kOC2VI2+iFdiuOKnQ7rdLuFfEhOjidMZSbrer
         Wxkg==
X-Gm-Message-State: AOAM5305d/VL5RHCRIj2swsHDxoNygtX2LhMhZ2SUnl/R0YmZV9wAPka
        AoAmHvAtqRACdGByct6NrAc=
X-Google-Smtp-Source: ABdhPJz0rr3vLrdBcVbOSpc0s+k90hMgDQQijtNMHN6wxYRaEYlSF4X2o1C8XWxMh56ubJ/R7DKDNA==
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr7373502ljc.48.1589723724284;
        Sun, 17 May 2020 06:55:24 -0700 (PDT)
Received: from mobilestation ([95.79.192.151])
        by smtp.gmail.com with ESMTPSA id o27sm5766588lfi.27.2020.05.17.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 06:55:23 -0700 (PDT)
Date:   Sun, 17 May 2020 16:55:21 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 3/4] gpio: dwapb: Drop extra check to call
 acpi_gpiochip_request_interrupts()
Message-ID: <20200517135521.tnz6uegenoh77bfl@mobilestation>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512184513.86883-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 09:45:12PM +0300, Andy Shevchenko wrote:
> There is no need to have an additional check to call
> acpi_gpiochip_request_interrupts(). Even without any interrupts available
> the registered ACPI Event handlers can be useful for debugging purposes.
> 
> While at it, add missed acpi_gpiochip_free_interrupts() call when
> unregistering ports.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 78662d6d73634e..2975f2d369874a 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -505,26 +505,33 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  		dwapb_configure_irqs(gpio, port, pp);
>  
>  	err = gpiochip_add_data(&port->gc, port);
> -	if (err)
> +	if (err) {
>  		dev_err(gpio->dev, "failed to register gpiochip for port%d\n",
>  			port->idx);
> -	else
> -		port->is_registered = true;
> +		return err;
> +	}
>  
>  	/* Add GPIO-signaled ACPI event support */

> -	if (pp->has_irq)
> -		acpi_gpiochip_request_interrupts(&port->gc);
> +	acpi_gpiochip_request_interrupts(&port->gc);

Hm, perhaps replacing it with:
+	if (pp->idx == 0)
+		acpi_gpiochip_request_interrupts(&port->gc);
could be more appropriate seeing Port A only supports IRQs, which we'd point
out by the (idx == 0) conditional statement. So we don't have to call
the method at most four times for each available port. Though judging by the
acpi_gpiochip_request_interrupts() function internals it will just ignore
GPIO chips with no IRQ support. Andy, It's up to you to decide. I'm not against
the change the way it is, but if you agree that signifying the IRQs affiliation
would be better, then please fill free to add the conditional statement I
suggested.

>  
> -	return err;
> +	port->is_registered = true;
> +
> +	return 0;
>  }
>  

>  static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
>  {
>  	unsigned int m;
>  
> -	for (m = 0; m < gpio->nr_ports; ++m)
> -		if (gpio->ports[m].is_registered)
> -			gpiochip_remove(&gpio->ports[m].gc);
> +	for (m = 0; m < gpio->nr_ports; ++m) {
> +		struct dwapb_gpio_port *port = &gpio->ports[m];
> +
> +		if (!port->is_registered)
> +			continue;
> +
> +		acpi_gpiochip_free_interrupts(&port->gc);
> +		gpiochip_remove(&port->gc);
> +	}
>  }

Could you please move this change to a dedicated patch? It seems to me this
alteration might be appropriate to be ported to the stable kernels seeing it
fixes e6cb3486f5a1 ("gpio: dwapb: add gpio-signaled acpi event support").
Linus, what do you think?

-Sergey

>  
>  static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
> -- 
> 2.26.2
> 

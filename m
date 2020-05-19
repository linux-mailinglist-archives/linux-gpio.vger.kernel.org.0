Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFBE1D9595
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 13:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgESLtI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 07:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbgESLtI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 07:49:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F833C08C5C0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 04:49:07 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b6so13389468ljj.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XwVkR0Tz6RXGyt5tC3Ym5HX2V4Vh9AvbroTdcGGfRTY=;
        b=gxwWpkQFOgkDquD8s4gbvzv82lHz/n/JnLx/rtrG56aQURxfjULMdxJ8NglROZWbqp
         mEBOgvjxFDGFNZBRClJ8eI41NvjS3ocfZaDSCDq6KnnPHSA+9hSfuphIHknIIAA9mwr9
         VB3Ss/iQkZLEQFcnKSoqMKNuGwgDUXKh4qtzsKJUnNeUTWKdb2bGxFqdYGFCsfL4j0Ca
         zWjDv3mvBBPPPgAqdLhmKnx0J78oenjPi6V2VJ5EqPl3Es5IbSLbOkmfn7gS0BhhjR0B
         IwiwA3V3bGQinIxRHcZNUTEJb0Ta9qREZ5NviEF9EoDDXYMXyNdH5iuSIaUgSIRt7tbm
         1arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XwVkR0Tz6RXGyt5tC3Ym5HX2V4Vh9AvbroTdcGGfRTY=;
        b=um3m/cSfXFrKBl+W0lj/Bj3V/+EjuWLDMNslPXGHrM+YsOxVrx3fpifZ8s5nPcj4Lx
         +nGLQTR/C2Hvi1fmpWzct12VDr41vEOQBQEqJjXvjGJTgtD7UhLnJFDonpSXb2HEhun+
         vjpcZQTfm520RBfvcjSn3SQmBOfuuBHnNsjeD0nHLaDyN0ClvbPXeTnbxRCVOd9BWufv
         ykEYXKemtY2sDuUaj2kojWoOgaagBHnBGJlRh0vgzMiZO3of8HtWTpZJZVYdW1eacLMl
         HYz3hh0u15fROBpjvMRRV9rqHCkf7HwcZYtc9KGrBh49HNitAv6jpnxydNFMPl8nsDyF
         988Q==
X-Gm-Message-State: AOAM531F2EgELLIluciEjXyXGyTeJ9+r5p/XF8uPK59kTJjjoq3RKGNi
        cD/C9kGlZ6HMUSNWf1i3bQU=
X-Google-Smtp-Source: ABdhPJzHLdiJsDWPz4qhj8hMAX3/vCgu5mT20bSsZFk4MFPZTZ5GqXItW/Y27KKjExMTMqVLXCtuRQ==
X-Received: by 2002:a05:651c:14d:: with SMTP id c13mr13264082ljd.94.1589888945943;
        Tue, 19 May 2020 04:49:05 -0700 (PDT)
Received: from mobilestation ([95.79.192.151])
        by smtp.gmail.com with ESMTPSA id k24sm7328608ljg.92.2020.05.19.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 04:49:05 -0700 (PDT)
Date:   Tue, 19 May 2020 14:49:03 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] gpio: dwapb: Call acpi_gpiochip_free_interrupts()
 on GPIO chip de-registration
Message-ID: <20200519114903.muzjqu6wuc36m7fl@mobilestation>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 18, 2020 at 08:41:35PM +0300, Andy Shevchenko wrote:
> Add missed acpi_gpiochip_free_interrupts() call when unregistering ports.
> 
> While at it, drop extra check to call acpi_gpiochip_request_interrupts().
> There is no need to have an additional check to call
> acpi_gpiochip_request_interrupts(). Even without any interrupts available
> the registered ACPI Event handlers can be useful for debugging purposes.
> 
> Fixes: e6cb3486f5a1 ("gpio: dwapb: add gpio-signaled acpi event support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>

Andy, thanks for the series. After fixing patch 3, supposedly you were going to
to do it like this:
-               if (irq > 0)
-                       pp->irq[j] = irq;
-
-               if (pp->irq[j] >= 0)
-                       pp->has_irq = true;
+               if (irq > 0) {
+                       pp->irq[j] = irq;
+                       pp->has_irq = true;
+               }
or similar as you prefer, feel free to add my tag to the whole series:
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> ---
> v2: made it 1st in the series, add Fixes (Serge)
>  drivers/gpio/gpio-dwapb.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 8639c4a7f469..e5d844304f8d 100644
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
>  
>  static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
> -- 
> 2.26.2
> 

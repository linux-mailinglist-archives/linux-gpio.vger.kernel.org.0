Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6EB398BCD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 16:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhFBOKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 10:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhFBOIS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 10:08:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE839C06138D;
        Wed,  2 Jun 2021 07:05:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r5so3602628lfr.5;
        Wed, 02 Jun 2021 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KdxBgrkTHaGnbv5FNkwfi4kgcv5bVNJ5V1Q55kmGe4Q=;
        b=RxtAA5bAgEPWgRrGj90AWvc3hVZJZBfazmw0mYh+4CYDNHqsAHDFZnKjPfRildod9V
         c0JOBwQLTWXeBGciuc43DqJaVutNFGVhvek8BdG1yOS3eaB2mYt8xpsTa/QJeXTvCfhG
         ynMufMVsmh0G5jXkKAgaXxu4sTrooYPi9e/0ZnBMhAI+mDPOR114O+tjlUJrCiEzl6z2
         RfaRxL5DD4sGNYhNY5rPXfgwMFPzwfSTzrsOsP4ITVwjv8m2rHgsfiSofke3xHHkNbSm
         EcRJK/ouh1JwWRm8dbit/nwMuIqM+H3RfDPTh2+b6cBJq/q5Krl6nHn675g1Mr7iP5lz
         5jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KdxBgrkTHaGnbv5FNkwfi4kgcv5bVNJ5V1Q55kmGe4Q=;
        b=TILQ9qEFW018cyoLW1LW5T8GDtmw5PKOZjpSxWaZ38mm744vyeER7YZg9spFXmcq+W
         UddvtuBoVZBDEVR21CX8Wh7lWMzU8Ojxxip0Km1ccFN9Hd8vamJ2SITbzMgZ8zu7kiiG
         vntk87vssQIptaCXNP+2i8DJ7Pcm4UIK7sB1R/XUBFBMg13BDLgrGzY4LL8CjZjoDErZ
         r823H+QHsvkWiUklf7kEnlZAQnUzajAoJZZ/Xrpmk8vHKNvVNHctvKobUSOGM4Yd8p7V
         QxP6ey0BdWpDVph6QQK9Zxd5qm6f4O2+vm/v/S3yyYOWyIVUWHB8KJlAwX4/uEaokGxv
         PyTQ==
X-Gm-Message-State: AOAM532uVMa3ehANP0dycNp02d/BZs2BEY44eltNMKAghfiOoJZLoxTE
        ANnMFo0CLaOykVWYSqC/YzU=
X-Google-Smtp-Source: ABdhPJwShhs82fyPbuz9jSYeKoTckYjiihPv36j3Br4PoF2uF1OFtS5mxRy7kL/YOLy8SG/Ji5QwDw==
X-Received: by 2002:ac2:5a5c:: with SMTP id r28mr23530287lfn.126.1622642749058;
        Wed, 02 Jun 2021 07:05:49 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id h28sm2010944lfv.187.2021.06.02.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:05:48 -0700 (PDT)
Date:   Wed, 2 Jun 2021 17:05:46 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 2/2] gpio: dwapb: Switch to use fwnode_irq_get()
Message-ID: <20210602140546.b7o43jnrvdmtdam4@mobilestation>
References: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
 <20210601162128.35663-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601162128.35663-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy

On Tue, Jun 01, 2021 at 07:21:28PM +0300, Andy Shevchenko wrote:
> We have open coded variant of fwnode_irq_get() in dwapb_get_irq().
> Replace it with a simple call.

Sometime ago I was trying to figure out a way to simplify this part of
the driver by using the platform_get_irq_optional() method for both
ACPI and OF cases. As you must have already found out by yourself it
didn't work out because of DW APB GPIO DT-nodes are supposed to have
sub-nodes with ports description. The OF-descriptors of these
sub-nodes aren't touched by the platform_get_irq_optional() method, it
just fails to detect IRQ-controller because it only works with the
device OF-node. So I gave up and decided to leave the code as is. I
can't remember now why I haven't used fwnode_irq_get() here. Most
likely I just preferred a direct of_irq_get() invocation here just for
clarity, since the only way we'd be calling fwnode_irq_get() here is
to actually get IRQ number from the OF-node anyway, while the
acpi_irq_get() method call made from the method fwnode_irq_get() will
hardly ever be required here. If you think otherwise or I missing
something please tell me.

Anyway by applying your patch at least we'll save a few lines of the
code and may in future have swnode-base IRQs support in the
fwnode_irq_get() method. So it still worths merging in. Thanks for
suggesting this change.

Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 939701c1465e..7d61f5821e32 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -528,17 +528,13 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
>  			  struct dwapb_port_property *pp)
>  {
> -	struct device_node *np = NULL;
> -	int irq = -ENXIO, j;
> -
> -	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
> -		np = to_of_node(fwnode);
> +	int irq, j;
>  
>  	for (j = 0; j < pp->ngpio; j++) {
> -		if (np)
> -			irq = of_irq_get(np, j);
> -		else if (has_acpi_companion(dev))
> +		if (has_acpi_companion(dev))
>  			irq = platform_get_irq_optional(to_platform_device(dev), j);
> +		else
> +			irq = fwnode_irq_get(fwnode, j);
>  		if (irq > 0)
>  			pp->irq[j] = irq;
>  	}
> -- 
> 2.30.2
> 

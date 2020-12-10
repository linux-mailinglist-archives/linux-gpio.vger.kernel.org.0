Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355F92D5583
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 09:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387534AbgLJIeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 03:34:07 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33711 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbgLJIeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 03:34:07 -0500
Received: by mail-lf1-f65.google.com with SMTP id l11so7045236lfg.0;
        Thu, 10 Dec 2020 00:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jAON2kq3zokNG8Def9vd/T7luvfb8gVQ6Uv3JRflpcw=;
        b=kxfTgsmWNDtivt33CEl+cYbZ2ZBp1+zfFwuimpe3S73nOS0Rswa+Zl7Y98GVAFWdIK
         Tfhj06QFq5wm6BVRFQ/O/8edhcVO7Cb9lUwiR34gAZDLij78+k10Bw4UQGCjhiIldk4V
         Ftwa22sQ5ygUYQkKVqjBGn3PqbxAvDkmVyEPJK9mRu69ZxQTiXYXpyT4q2W6g3eqfnEV
         9r9dHcovTTLHlifbPf5b9LMRWTUAbeRWnfkuALEufAmYbC3lWfEohJDDxsKiXYFsZlxf
         9GISeJ8RXbEbiFMLfWIJeYpSHoveNtt/xxlxrbm5kaZoeJEwlpck5mtY+BijxzCWglh/
         3keA==
X-Gm-Message-State: AOAM530ApqSFIfBjqwtj6mYmfPPQZiFKacwIOlze80HLtM31t+ugCFMc
        T3tdUe4nsR56NXiCE97kYXE=
X-Google-Smtp-Source: ABdhPJwgYeAzn97Wh/VFIJ+wzZO9vzzpT0a9nbhd5x08Oee4wHa/jYaWst+KWsWEKTNDBBURoQp7Eg==
X-Received: by 2002:a19:5512:: with SMTP id n18mr215152lfe.270.1607589205114;
        Thu, 10 Dec 2020 00:33:25 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y25sm436475lfl.108.2020.12.10.00.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 00:33:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1knHOm-0007y8-WB; Thu, 10 Dec 2020 09:34:05 +0100
Date:   Thu, 10 Dec 2020 09:34:04 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: Try numbered exports if symbolic names fail
Message-ID: <X9HdfKxuUD3CZGNP@localhost>
References: <20201209161821.92931-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209161821.92931-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 09, 2020 at 05:18:21PM +0100, Linus Walleij wrote:
> If a GPIO line cannot be exported using a symbolic name from
> the .names array in the gpiochip, fall back to using the
> "gpioN" naming system instead of just failing.
> 
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 728f6c687182..a5a0e9238217 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -627,10 +627,24 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
>  	if (chip->names && chip->names[offset])
>  		ioname = chip->names[offset];
>  
> -	dev = device_create_with_groups(&gpio_class, &gdev->dev,
> -					MKDEV(0, 0), data, gpio_groups,
> -					ioname ? ioname : "gpio%u",
> -					desc_to_gpio(desc));
> +	/*
> +	 * If we have a symbolic name for the GPIO we try to use that
> +	 * for the exported sysfs device/file, as legacy scripts depend
> +	 * on it. If we don't have a symbolic name or if there is a
> +	 * namespace collision, we stick with the "gpioN" name.
> +	 */
> +	dev = NULL;
> +	if (ioname)
> +		dev = device_create_with_groups(&gpio_class, &gdev->dev,
> +						MKDEV(0, 0), data, gpio_groups,
> +						ioname,
> +						desc_to_gpio(desc));
> +	if (IS_ERR_OR_NULL(dev))
> +		dev = device_create_with_groups(&gpio_class, &gdev->dev,
> +						MKDEV(0, 0), data, gpio_groups,
> +						"gpio%u",
> +						desc_to_gpio(desc));

I suggested having the driver set a flag which determines whether to use
the line names in sysfs or not.

The above will trigger a bunch of nasty warnings and backtraces in the
sysfs code (for every gpio line!), which is not something we want for
normal operation. Having the sysfs interface for the same USB device
depend on probe order is not very nice either.

Since the USB GPIO controller do not register any names today (as
gpiolib currently require a flat name space), there's no need to worry
about legacy scripts depending on those either (or rather, the argument
goes the other way since adding names now could break a functioning
script).

Just add a flag to suppress the renaming and we can safely start adding
names to hotpluggable controllers (if the rest of gpiolib can handle
non-unique names).

Johan

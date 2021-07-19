Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5093CCEF4
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 09:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbhGSIBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 04:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbhGSIBL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 04:01:11 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B18C061574;
        Mon, 19 Jul 2021 00:57:28 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso17400820ota.6;
        Mon, 19 Jul 2021 00:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jNYrX4wdtnjcXzObsb+/874SVbPwMkIuBhQLIlI4CZM=;
        b=Kenk1UhvU07pUCh5V1VMA4sBAghCbNmZt1xyQG0wIZnmpAncOV5UMfb3wcono4vNIQ
         Uza9JAIjuQZD6IivLN1Tu7CpZEErNxflsU1l1bteJraJfjuZe+zyzy/O+sQjbDkYpSTZ
         reTARsmQVFaujLPag9ILLv7A+x0Uvm0zmJ+Vmhw/sOlA/ZNJ4lxlgPIEz9JIXozytx37
         VZZBiPRO2s5hq36LBfCmQTwD+v++YMHoldUtBEa8TU3VWbh/6zD3sxqyGxScTJJGPhsD
         7tDTDEZSL1h9voOfQ4dMjAypJ8xpemATnmpm1Ko1seprT7oHHwhv3PU/fk5wzxhDsub7
         FSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jNYrX4wdtnjcXzObsb+/874SVbPwMkIuBhQLIlI4CZM=;
        b=gYl6CKX21FMiNIqeD3kbMdcJ174wZUo1YcoBzAbDxwaDVu2M2RwPYLDuhxRPk4/s/5
         JmBmuojdVsJ8MmKsMeyoUpdLtLVDi+vRvN2X3SLVdEakJJDUtoz4NbvvLT/Kjsn4X//t
         fD2DPZVP82s7LqU00VW3f+a1Lm2TxLSIIU9HByrEwFef8T0FoYalcp51Ck7C7rJDx1hJ
         eFbrYLgoHZyIAi1lFdU6EjN/Xk8lfOMLbKMM343euYlodAkzaKdNTGCx7ZxbyEap+pEa
         x39vxlLkUqjJfUwi6xt4wmmudgwV8UcF4ktXFNJZ9QL6uB3RjAjamS74FaM5jCds0fHG
         Q9AQ==
X-Gm-Message-State: AOAM5326xgXCTCQcgqlers61tnPmGFB9lZlepRuvGeAnOUkSeFmtuGq0
        mYLEhSwGFIb/v68S8hYCHmk=
X-Google-Smtp-Source: ABdhPJzOq8W6oJ7zbNNa9MtZYlaSXjqpt3zJt4cheftVIQmtnRlBg69d7Ldz6V44iDsqa3H3HqV9uQ==
X-Received: by 2002:a9d:3a5:: with SMTP id f34mr18020274otf.348.1626681447242;
        Mon, 19 Jul 2021 00:57:27 -0700 (PDT)
Received: from kessel ([12.23.111.199])
        by smtp.gmail.com with ESMTPSA id s7sm1303820ool.14.2021.07.19.00.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 00:57:26 -0700 (PDT)
Date:   Mon, 19 Jul 2021 00:57:23 -0700
From:   Gregory Fong <gregory.0xf0@gmail.com>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip baks per device
Message-ID: <20210719075723.GA8818@kessel>
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
 <20210708070429.31871-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708070429.31871-2-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergio,

On Thu, Jul 08, 2021 at 09:04:27AM +0200, Sergio Paracuellos wrote:
> The default gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used for example by the gpio-mt7621
> and gpio-brcmstb drivers. To fix these kind of situations driver code
> is forced to fill the names to avoid the gpiolib code to set names
> repeated along the banks. Instead of continue with that antipattern
> fix the gpiolib core function to get expected behaviour for every
> single situation adding a field 'offset' in the gpiochip structure.
> Doing in this way, we can assume this offset will be zero for normal
> driver code where only one gpiochip bank per device is used but
> can be set explicitly in those drivers that really need more than
> one gpiochip.

This is a nice improvement, thanks for putting this together!  A few
remarks below:

> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/gpio/gpiolib.c      | 34 ++++++++++++++++++++++++++++------
>  include/linux/gpio/driver.h |  4 ++++
>  2 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 27c07108496d..f3f45b804542 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -382,11 +382,16 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>  	if (count < 0)
>  		return 0;
>  
> -	if (count > gdev->ngpio) {
> -		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
> -			 count, gdev->ngpio);
> -		count = gdev->ngpio;
> -	}
> +	/*
> +	 * When offset is set in the driver side we assume the driver internally
> +	 * is using more than one gpiochip per the same device. We have to stop
> +	 * setting friendly names if the specified ones with 'gpio-line-names'
> +	 * are less than the offset in the device itself. This means all the
> +	 * lines are not present for every single pin within all the internal
> +	 * gpiochips.
> +	 */
> +	if (count <= chip->offset)
> +		return 0;

This case needs a descriptive warning message.  Silent failure to assign
names here will leave someone confused about what they're doing wrong.

>  
>  	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
>  	if (!names)
> @@ -400,8 +405,25 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>  		return ret;
>  	}
>  
> +	/*
> +	 * When more that one gpiochip per device is used, 'count' can
> +	 * contain at most number gpiochips x chip->ngpio. We have to
> +	 * correctly distribute all defined lines taking into account
> +	 * chip->offset as starting point from where we will assign
> +	 * the names to pins from the 'names' array. Since property
> +	 * 'gpio-line-names' cannot contains gaps, we have to be sure
> +	 * we only assign those pins that really exists since chip->ngpio
> +	 * can be different of the chip->offset.
> +	 */
> +	count = (count > chip->offset) ? count - chip->offset : count;
> +	if (count > chip->ngpio) {

In the multiple gpiochip case, if there are 3+ gpiochips this seems like
it will yield an invalid warning. For example, if there are 3 gpiochips
(banks 0, 1, and 2), and all gpios are given names in gpio-line-names,
isn't this condition going to always evaluate to true for bank 1,
resulting in an invalid warning?  In that case I would think setting
count to chip->ngpio is the *expected* behavior.

Since that's a "normal" behavior in the multiple gpiochip case, I'm not
sure there's a simple way to detect an over-long gpio-line-names here
in this function anymore.

> +		dev_warn(&gdev->dev, "gpio-line-names is length %d but
> should be at most length %d", +			 count,
> chip->ngpio);
> +		count = chip->ngpio; +	} + for (i = 0; i < count; i++)
> -		gdev->descs[i].name = names[i]; +
> gdev->descs[i].name = names[chip->offset + i];
>  
>  	kfree(names);
>  
> [snip]

Best regards,
Gregory

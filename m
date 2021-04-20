Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9FC365345
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 09:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhDTHcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Apr 2021 03:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhDTHcy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Apr 2021 03:32:54 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3520C061763
        for <linux-gpio@vger.kernel.org>; Tue, 20 Apr 2021 00:32:21 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id lt13so10513497pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Apr 2021 00:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9fA6adm8+bFasH/0H8b/umtS1mE0mVwigWJ/SjgUEnk=;
        b=QsN5+k/3XRGHarhUmBodvtkQcPjcAM3RvOXJaHa3LoWQjRajWmPvtioJ0d1Vr0/0sf
         Fq0lGwbVOZErTPi7Fd5S91lwAt7eJTCXVJEGXRdK2FnyXVsxdOZlY8Q/6Kc+Kk3E+4/M
         nVNWSkvI7bbhxDXJ1gD3FohELLdblpK+emf4PfuI6qAaPE7+pBwJWhMm7is7AwZqMU2C
         5KuLem91XB8+hJKVjlYb5h89ubwMWVRC43Jji5+c7UOEdcDhdqnOLURiwlUzSvUU4ice
         uZmMeU6/nhXosEk7wQFcJKpa07DzvnJaX2fXhj4lH3pTWK6fBOy4GPFaDVlov5zU0sDv
         m96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9fA6adm8+bFasH/0H8b/umtS1mE0mVwigWJ/SjgUEnk=;
        b=PF4DwrDhRd4BJRjtFekok+csG5y110GUG4xLYtS5Aa9rJCjp7/luaCcutbCWyo4IXD
         x5AUQEw6xrBT1AiLsiOWKMWGLz9uN8sRl2/14+ON42y6z38uBoCPFtPnC3C7CzQg1nex
         z3Hbz85eFJGgJK6E+FnWzxgLH8u1CAzyyGJZ6LVCNvjBzc1McL7x78OO+J4A8KgvMmQi
         pWsI//i2P+akyFuFYaKwe6KGtjv8KtAFYjT8HTJSmUiNeDJX+Y8VI+45Ycqb3ul5EAFY
         CAcwEwzRu7IP9KbZMfCFkng1es5tLDwPdvxOGIynfXuwimlWRxkcPmn7Wb6S3ggM9Geb
         CJQw==
X-Gm-Message-State: AOAM532A3TfnBehKa00GdaCAlccEPdWFSfPviCXRwXVeGAy6VccUEtuR
        xqoU1gqFNl0JVLV4e6hHXKu99g==
X-Google-Smtp-Source: ABdhPJyVvk+DZ9rmbhNEI1bXJ+gc6lLQ6muGpcxMZ8MIGyGPC+swQFMuDQ0lxpwA73jaRxw2etbDTw==
X-Received: by 2002:a17:902:8d83:b029:e6:508a:7b8d with SMTP id v3-20020a1709028d83b02900e6508a7b8dmr28092149plo.18.1618903941522;
        Tue, 20 Apr 2021 00:32:21 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:7c30:3145:6ef:b173])
        by smtp.gmail.com with ESMTPSA id oa9sm1468435pjb.44.2021.04.20.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 00:32:20 -0700 (PDT)
Date:   Tue, 20 Apr 2021 00:32:18 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: core: Show pin numbers for the
 controllers with base = 0
Message-ID: <20210420073218.GA2538877@x1>
References: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 15, 2021 at 04:03:56PM +0300, Andy Shevchenko wrote:
> The commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> enabled GPIO pin number and label in debugfs for pin controller. However,
> it limited that feature to the chips where base is positive number. This,
> in particular, excluded chips where base is 0 for the historical or backward
> compatibility reasons. Refactor the code to include the latter as well.
> 
> Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> Cc: Drew Fustini <drew@beagleboard.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/core.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index df7f5f049139..8ef24af88b75 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1604,8 +1604,8 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  	unsigned i, pin;
>  #ifdef CONFIG_GPIOLIB
>  	struct pinctrl_gpio_range *range;
> -	unsigned int gpio_num;
>  	struct gpio_chip *chip;
> +	int gpio_num;
>  #endif
>  
>  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
> @@ -1625,7 +1625,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  		seq_printf(s, "pin %d (%s) ", pin, desc->name);
>  
>  #ifdef CONFIG_GPIOLIB
> -		gpio_num = 0;
> +		gpio_num = -1;
>  		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
>  			if ((pin >= range->pin_base) &&
>  			    (pin < (range->pin_base + range->npins))) {
> @@ -1633,10 +1633,12 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  				break;
>  			}
>  		}
> -		chip = gpio_to_chip(gpio_num);
> -		if (chip && chip->gpiodev && chip->gpiodev->base)
> -			seq_printf(s, "%u:%s ", gpio_num -
> -				chip->gpiodev->base, chip->label);
> +		if (gpio_num >= 0)
> +			chip = gpio_to_chip(gpio_num);
> +		else
> +			chip = NULL;
> +		if (chip)
> +			seq_printf(s, "%u:%s ", gpio_num - chip->gpiodev->base, chip->label);
>  		else
>  			seq_puts(s, "0:? ");
>  #endif
> -- 
> 2.30.2

Thank you, this makes sense to me. I had failed to consider what would
happen when chip->gpiodev->base == 0. I have tested on the BeagleBone
(AM3358) and the output works as expected. 

/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# more pins
registered pins: 142
pin 0 (PIN0) 0:gpio-0-31 44e10800 00000027 pinctrl-single
pin 1 (PIN1) 1:gpio-0-31 44e10804 00000027 pinctrl-single
pin 2 (PIN2) 2:gpio-0-31 44e10808 00000027 pinctrl-single
pin 3 (PIN3) 3:gpio-0-31 44e1080c 00000027 pinctrl-single
pin 4 (PIN4) 4:gpio-0-31 44e10810 00000027 pinctrl-single
pin 5 (PIN5) 5:gpio-0-31 44e10814 00000027 pinctrl-single
pin 6 (PIN6) 6:gpio-0-31 44e10818 00000027 pinctrl-single
pin 7 (PIN7) 7:gpio-0-31 44e1081c 00000027 pinctrl-single
pin 8 (PIN8) 22:gpio-96-127 44e10820 00000027 pinctrl-single
pin 9 (PIN9) 23:gpio-96-127 44e10824 00000037 pinctrl-single
pin 10 (PIN10) 26:gpio-96-127 44e10828 00000037 pinctrl-single
pin 11 (PIN11) 27:gpio-96-127 44e1082c 00000037 pinctrl-single
pin 12 (PIN12) 12:gpio-0-31 44e10830 00000037 pinctrl-single
pin 13 (PIN13) 13:gpio-0-31 44e10834 00000037 pinctrl-single
pin 14 (PIN14) 14:gpio-0-31 44e10838 00000037 pinctrl-single
pin 15 (PIN15) 15:gpio-0-31 44e1083c 00000037 pinctrl-single
pin 16 (PIN16) 16:gpio-0-31 44e10840 00000027 pinctrl-single
<snip>

Tested-by: Drew Fustini <drew@beagleboard.org>
Reviewed-by: Drew Fustini <drew@beagleboard.org>

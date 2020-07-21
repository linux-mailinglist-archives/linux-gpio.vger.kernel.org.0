Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBF82281AF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbgGUOKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOKl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:10:41 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105D0C0619DB
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:10:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a14so6504320wra.5
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PrqNjY5C8lZXrufMgkVQOPFxI5PME47hT2UHcARcwyM=;
        b=IZlQhe3FVtbZBKfLaWY13Pm+Wtvn3P6IeKtOWwcsuG0kbaxN6yuczoLsK5YHhmyhge
         ODGy/6FA/ZBhxjBmiXQiP7bP1cK0qdjOn3x62ZvAqOLMqGxfBuOwa94B855ZLYMWuggM
         aSswi3jPdPFhzvl1UiXQ7dmA1rOUeGC8LLnxQrgGYnY77pCMKr66amEBKEuErqUBP6HS
         +EbzRnbyUbR6U1KjMqd/z96l0ajqZ6DnqpYNlF/uD0NVSJk1DGJZZwAC+m1/nhnsAeEE
         x47FA1dnpXwykwl3b2CTfT5D8HLT3Nu2wfrSQv1MPgeNHNZA4oARtbFWxCtHLhcc58a3
         7Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PrqNjY5C8lZXrufMgkVQOPFxI5PME47hT2UHcARcwyM=;
        b=QtGks0mtsyEiMAFsJ+9WxwKci05amLDGDi5URewkwAPB/WFVlGSnzO6Sq5p7LHSVGE
         VY5GgO7Kojdnov8xlLVV79QuSUEELvTydKBVck3Vo14Ek+qec6PmpEuWzSnX3Y75pLX6
         sC8g28PM/dGQLZB+uMDyiv1g07Ri+Bug8jNDbIn4Pphbqe2hVi28Nd32x3zVwHPLwAMK
         JZ9B0YqpqRHTQy3A1dvRGvGfagr4k8NVj4Ph+mBYT4N+LCgshSVdNALVRIC9X8rzJ09K
         tg5XwespA31ofTiQaMfVS8iEhDQrJCb7qgplAEF2dPQ8K8yGIpkQe88sAztnGgLc0HJQ
         r8CQ==
X-Gm-Message-State: AOAM533HCZSJge0g7MhObNi3fE3r7qGJ2olF70Q5VOQJW6Ou/SkEUL+9
        dZw1QEf19x6Yn6yfBfZl/FqPCw==
X-Google-Smtp-Source: ABdhPJxXULR+4pZj/VNU4eMwvCiFLjvcZy6EL2ajjvloyuhpb3jyVYjDjnloBEbWJf9Z9r3UIDePKw==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr2018160wrr.269.1595340639655;
        Tue, 21 Jul 2020 07:10:39 -0700 (PDT)
Received: from x1 (103.red-88-29-77.staticip.rima-tde.net. [88.29.77.103])
        by smtp.gmail.com with ESMTPSA id u65sm3777394wmg.5.2020.07.21.07.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:10:38 -0700 (PDT)
Date:   Tue, 21 Jul 2020 16:10:34 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v3] pinctrl: core: print gpio in pins debugfs file
Message-ID: <20200721141034.GA2064533@x1>
References: <20200721140233.2063475-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721140233.2063475-1-drew@beagleboard.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 04:02:34PM +0200, Drew Fustini wrote:
> If there is a gpio range mapping for the pin, then print out the gpio
> chip and line index for the pin in the debugfs 'pins' file with the
> format: "[gpiochip-label]:line-[index] "
> 
> For example, here is a section of 'pins' the PocketBeagle (AM3358):
> /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
> 
> pin 25 (PIN25) gpio-32-63:line-25 44e10864 00000037 pinctrl-single 
> pin 26 (PIN26) gpio-32-63:line-26 44e10868 00000037 pinctrl-single 
> pin 27 (PIN27) gpio-32-63:line-27 44e1086c 00000037 pinctrl-single 
> pin 28 (PIN28) NA 44e10870 00000036 pinctrl-single 
> pin 29 (PIN29) NA 44e10874 00000006 pinctrl-single 
> pin 30 (PIN30) gpio-32-63:line-28 44e10878 00000027 pinctrl-single 
> pin 31 (PIN31) gpio-32-63:line-29 44e1087c 00000037 pinctrl-single 
> pin 32 (PIN32) gpio-32-63:line-30 44e10880 00000037 pinctrl-single 
> pin 33 (PIN33) gpio-32-63:line-31 44e10884 00000037 pinctrl-single 
> pin 34 (PIN34) gpio-64-95:line-0 44e10888 00000037 pinctrl-single 
> pin 35 (PIN35) gpio-64-95:line-1 44e1088c 00000037 pinctrl-single 
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> v3 changes:
> - gpio column is now gpiochip label and line index
> 
> v2 changes:
> - print 'NA' if pin does not have a GPIO number
> - change gpio_num from unsigned to unsigned int per checkpatch
> ---
>  drivers/pinctrl/core.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 821242bb4b16..a23dc264cae7 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/pinctrl/machine.h>
>  
>  #ifdef CONFIG_GPIOLIB
> +#include "../gpio/gpiolib.h"
>  #include <asm-generic/gpio.h>
>  #endif
>  
> @@ -1601,6 +1602,9 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  	struct pinctrl_dev *pctldev = s->private;
>  	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
>  	unsigned i, pin;
> +	struct pinctrl_gpio_range *range;
> +	unsigned int gpio_num;
> +	struct gpio_chip *chip;
>  
>  	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
>  
> @@ -1618,6 +1622,23 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  
>  		seq_printf(s, "pin %d (%s) ", pin, desc->name);
>  
> +#ifdef CONFIG_GPIOLIB
> +		gpio_num = 0;
> +		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
> +			if ((pin >= range->pin_base) &&
> +			    (pin < (range->pin_base + range->npins))) {
> +				gpio_num = range->base + (pin - range->pin_base);
> +				break;
> +			}
> +		}
> +		chip = gpio_to_chip(gpio_num);
> +		if (chip && chip->gpiodev && chip->gpiodev->base)
> +			seq_printf(s, "%s:line-%u ", chip->label,
> +				gpio_num - chip->gpiodev->base);
> +		else
> +			seq_puts(s, "NA ");
> +#endif
> +
>  		/* Driver-specific info per pin */
>  		if (ops->pin_dbg_show)
>  			ops->pin_dbg_show(pctldev, s, pin);
> -- 
> 2.25.1
> 

Apologies - I should not have put the change log in the commit message.
Please let me know if I should resubmit.

thanks,
drew

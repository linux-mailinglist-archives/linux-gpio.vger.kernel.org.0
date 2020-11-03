Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3DB2A419A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 11:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgKCKWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 05:22:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23780 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727385AbgKCKWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 05:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604398925;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+XR6506nPn8sKTI4vzdlsW0fAk2RS9aQxw0FRMAFP/I=;
        b=TyHsX+ikFKn2lob/5t7W+VZAOvNpYhO9r7MLV7hmu0cefUFB/GsTy2n2i7PDNs0Z1xSVhw
        MHkXXYjU58axVberHp63MC6gkmHfzRDMQEj6bsxsvOFfJ8TVWKYMyC6Diwu20lmlRXya/F
        ZoWZVZgcC073NeVf5NkbMy6yy8uVuI4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-5_f2_UYiNSiVJxP7zQMh8A-1; Tue, 03 Nov 2020 05:22:03 -0500
X-MC-Unique: 5_f2_UYiNSiVJxP7zQMh8A-1
Received: by mail-ej1-f71.google.com with SMTP id t1so5216952ejb.21
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 02:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+XR6506nPn8sKTI4vzdlsW0fAk2RS9aQxw0FRMAFP/I=;
        b=nmz3WnK90sUjWYLk3R77QMuji34YMSlA3wXlW3Z8mJ8GX2nbHfSItM0Oo42SzvITHr
         NhQibKPJNV3KLr5IO4W182Qi48oyqjqAaQpR+Yp+r13UdX+Q2LvIKpYpfFDeMVn8vOPR
         SJOboywSdZR3auoZvTn/QhpOGlwT0Lg2aYg4kiz4vYjSptb3hVP/wGMxnelZa7LW/2m9
         oFpP33HXiOASpDa+wneN1jMfO2LJ8FsqBhRSrwBtsFz/fPnvxnulI0e8lhecz3eMWUn+
         iOu4p9Gvqw2oC0PMAnI40mAGQ9bnhXouQR8chVtV4UIERSFTbTzxdRgPMZVdNJtaxKnG
         lhdQ==
X-Gm-Message-State: AOAM531D2JbtCXlNXl7DirJG4+W4UBMsM70FwihkTxS8fRuEYbFSpslQ
        LA2rqXT8gV3+wwXHqAmnUfizfYHpSWWDB2wdGG72amSkZJbRdit7LoFLv9K9hK7stf+xi3ypEGq
        OQkqHHghNUDke411g+o2A3w==
X-Received: by 2002:a17:906:b0d6:: with SMTP id bk22mr19153011ejb.153.1604398922400;
        Tue, 03 Nov 2020 02:22:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfqgkAhBn5aF4g1kP8qOxfrO2hgg83HJ7gVq+LDUDIAF84HmbWErFGEF7Qd7Wh3MJwI+hG3A==
X-Received: by 2002:a17:906:b0d6:: with SMTP id bk22mr19153001ejb.153.1604398922225;
        Tue, 03 Nov 2020 02:22:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id pk25sm7526401ejb.16.2020.11.03.02.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 02:22:01 -0800 (PST)
Subject: Re: [PATCH 1/3 v3] x86/platform/geode: Convert net5501 LED to GPIO
 machine descriptor
To:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201103000439.325448-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <967ce9e6-0197-c488-2a7d-c7f491d9b361@redhat.com>
Date:   Tue, 3 Nov 2020 11:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103000439.325448-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/3/20 1:04 AM, Linus Walleij wrote:
> This makes the machine look up the LED from a GPIO machine
> descriptor table. The Geode LEDs should be on the CS5535
> companion chip.
> 
> Cc: linux-gpio@vger.kernel.org
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: linux-geode@lists.infradead.org
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Linus, in case you did not know yet, I have take over
drivers/platform/x86 maintainership from Andy.

Andy, the MAINTAINERS entry for arch/x86/platform says:

X86 PLATFORM DRIVERS - ARCH
R:      Darren Hart <dvhart@infradead.org>
R:      Andy Shevchenko <andy@infradead.org>
L:      platform-driver-x86@vger.kernel.org
L:      x86@kernel.org
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
F:      arch/x86/platform

Andy, so I guess that with your Reviewed-by added, these are expected to
get picked up by the tip tree people ?

Linus, it seems that you did not "Cc: x86@kernel.org" which is
listed in MAINTAINERS for these, and is probably necessary to
get these merged through the tip tree.

Note I'm happy to pick these up through:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/

I actually had them in my local review-hans branch before noticing that
that they went to arch/x86/platform. But I've dropped them now as I'm
not sure if merging them through the pdx86 tree is the right thing to do,
the MAINTAINERS file at least suggests things should be done differently.

Linus, if a v4 with "Cc: x86@kernel.org" is necessary you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

Regards,

Hans





> ---
> ChangeLog v2->v3:
> - Rebase on v5.10-rc1
> - Resend
> ChangeLog v1->v2:
> - Drop excess comma after terminator { }
> - Collect Andy's Reviewed-by
> ---
>  arch/x86/platform/geode/net5501.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
> index 163e1b545517..558384acd777 100644
> --- a/arch/x86/platform/geode/net5501.c
> +++ b/arch/x86/platform/geode/net5501.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/input.h>
>  #include <linux/gpio_keys.h>
> +#include <linux/gpio/machine.h>
>  
>  #include <asm/geode.h>
>  
> @@ -55,9 +56,7 @@ static struct platform_device net5501_buttons_dev = {
>  static struct gpio_led net5501_leds[] = {
>  	{
>  		.name = "net5501:1",
> -		.gpio = 6,
>  		.default_trigger = "default-on",
> -		.active_low = 0,
>  	},
>  };
>  
> @@ -66,6 +65,15 @@ static struct gpio_led_platform_data net5501_leds_data = {
>  	.leds = net5501_leds,
>  };
>  
> +static struct gpiod_lookup_table net5501_leds_gpio_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		/* The Geode GPIOs should be on the CS5535 companion chip */
> +		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +
>  static struct platform_device net5501_leds_dev = {
>  	.name = "leds-gpio",
>  	.id = -1,
> @@ -80,6 +88,7 @@ static struct platform_device *net5501_devs[] __initdata = {
>  static void __init register_net5501(void)
>  {
>  	/* Setup LED control through leds-gpio driver */
> +	gpiod_add_lookup_table(&net5501_leds_gpio_table);
>  	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
>  }
>  
> 


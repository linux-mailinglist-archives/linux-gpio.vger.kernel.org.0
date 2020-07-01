Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD88210263
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 05:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgGADOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 23:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGADOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 23:14:42 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC71EC061755;
        Tue, 30 Jun 2020 20:14:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w2so10171880pgg.10;
        Tue, 30 Jun 2020 20:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/nMbIk+ePFh7vyfgizEqp6K7uZpZA2mzkQk6EAEuZaI=;
        b=vTYPFSTTvPrb4deuaHX6cik4b1R4mAlIngmiYe11zonBtZGGeqEQ09h7vGkGBRhgWa
         gO+xG5I8+BNNAau4bRi/SVXHr0f8BC4ydDsYI8guL2zod+yYy5lFTVbMa7ugVE33d55l
         PqikZV7nilgqYH+ZSVlRZRdMgAaErfTbJTnrF+fiycakW8niQ5M/udEuqnaRNyyVCccp
         01KAulgQeBz8dyBZ02VTmwfjrUmsPYu7X58z8AHZaRULfgrUfedbjLW02iVc+3gecZXi
         P4lBX7ab186tlBMQ+2uYPRPbPeSwAwlOWU9ca2hu9H3MCfRIlIeR/m4eJPy70wZQzBP9
         fXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/nMbIk+ePFh7vyfgizEqp6K7uZpZA2mzkQk6EAEuZaI=;
        b=WPMq1F6iFh6x3GMpXM08Vagj4lXt5JCt9/mLcb34qy/uWnQqdzFK0ZEwMbqjP/wxnP
         JvUJJ5PYmMl87Vd+oLGS+lp+3Qa2tu3y6ddQlzlppXVDLG6msBun88H45U0ovLiCQ9zq
         kVUKDuqog//8myrIGWx+q/OhWc3wZm+3s0LatmzXpn+FDUY7GjElqJPO8v548tn3H3Sr
         q6JisnogwqofXfjdmYFR8yc7UXV43PH5MyS8W4CcKcX0C7APnca+XKyNeyUpO/sduboF
         s31X/0n+ZVdNJbw1h9UTaCfNovBEkYtjpy5jPorgtvpJiMMPdmgAAdVOu9oHn29yVVDh
         ZFgg==
X-Gm-Message-State: AOAM5310+2djAuIFkZiHetTfqAUL8KZ8X6cJzss9JgsO/pNBhi1BwpIL
        vTJCmjCJVkn8j8lozpemQFxFGyNZ
X-Google-Smtp-Source: ABdhPJz7n8nCI5lXN7YZkyGgGGVqvA252adpCGY8lCGBZYufnoBamJMTaDJHF4BAGzKQwB11Mrtk2A==
X-Received: by 2002:a63:f814:: with SMTP id n20mr17242552pgh.92.1593573280661;
        Tue, 30 Jun 2020 20:14:40 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id x8sm3768410pfn.61.2020.06.30.20.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 20:14:39 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
To:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
 <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
 <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <86c009a8-05c4-40a3-daef-6d9e848642a3@gmail.com>
Date:   Tue, 30 Jun 2020 20:14:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/30/2020 7:23 PM, Mark Tomlinson wrote:
> On Tue, 2020-06-30 at 15:08 -0700, Ray Jui wrote:
>> May I know which GPIO driver you are referring to on NSP? Both the iProc
>> GPIO driver and the NSP GPIO driver are initialized at the level of
>> 'arch_initcall_sync', which is supposed to be after 'arch_initcall' used
>> here in the pinmux driver
> 
> Sorry, it looks like I made a mistake in my testing (or I was lucky),
> and this patch doesn't fix the issue. What is happening is:
> 1) nsp-pinmux driver is registered (arch_initcall).
> 2) nsp-gpio-a driver is registered (arch_initcall_sync).
> 3) of_platform_default_populate_init() is called (also at level
> arch_initcall_sync), which scans the device tree, adds the nsp-gpio-a
> device, runs its probe, and this returns -EPROBE_DEFER with the error
> message.
> 4) Only now nsp-pinmux device is probed.
> 
> Changing the 'arch_initcall_sync' to 'device_initcall' in nsp-gpio-a
> ensures that the pinmux is probed first since
> of_platform_default_populate_init() will be called between the two
> register calls, and the error goes away. Is this change acceptable as a
> solution?

If probe deferral did not work, certainly but it sounds like this is
being done just for the sake of eliminating a round of probe deferral,
is there a functional problem this is fixing?

> 
>>> though the probe will succeed when the driver is re-initialised, the
>>> error can be scary to end users. To fix this, change the time the
>>
>> Scary to end users? I don't know about that. -EPROBE_DEFER was
>> introduced exactly for this purpose. Perhaps users need to learn what
>> -EPROBE_DEFER errno means?
> 
> The actual error message in syslog is:
> 
> kern.err kernel: gpiochip_add_data_with_key: GPIOs 480..511
> (18000020.gpio) failed to register, -517
> 
> So an end user sees "err" and "failed", and doesn't know what "-517"
> means.

How about this instead:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4fa075d49fbc..10d9d0c17c9e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1818,9 +1818,10 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
        ida_simple_remove(&gpio_ida, gdev->id);
 err_free_gdev:
        /* failures here can mean systems won't boot... */
-       pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
-              gdev->base, gdev->base + gdev->ngpio - 1,
-              gc->label ? : "generic", ret);
+       if (ret != -EPROBE_DEFER)
+               pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n",
+                       __func__, gdev->base, gdev->base + gdev->ngpio - 1,
+                       gc->label ? : "generic", ret);
        kfree(gdev);
        return ret;
 }

-- 
Florian

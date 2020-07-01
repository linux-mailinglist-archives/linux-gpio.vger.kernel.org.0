Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2229C210311
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 06:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgGAEok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 00:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGAEoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 00:44:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E11FC061755;
        Tue, 30 Jun 2020 21:44:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m9so180575pfh.0;
        Tue, 30 Jun 2020 21:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PsSXK0LueMTros0guq6lr1zFXnW4biIZ10cMu87ynbA=;
        b=psgzIRkWHmWgUZzY2nLaIePhjDX/FDGj5ex4nRtGGpJlIYHTXnLfv86Wypu10UOA36
         cWeE/tFVTwr/GzmZihTFUOXNs2QaKE2CkSkDWl2vkNNrc7aqE+n46Io0E2dclvCcyvyx
         9/AKsr5dX2TlHCdARmvscsX6bNCx5MroCZQN4Y8RZ0SflrpMlntwGNWf7szVoUF4P8zh
         ofWqCUsB2K71NlNuS32I2p4qpNPbkhCgs+5bqmN+YYJLhfj9QavncmopJ+nw6EuAtxpF
         zQX5LrZDHgpA76Zck12UD+/m0Tt69h2Zxn4TH7jj4maw5j3a5LJ9D86pMQoryqCPdIy2
         s7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PsSXK0LueMTros0guq6lr1zFXnW4biIZ10cMu87ynbA=;
        b=nhgv2o8hBMgx8c6kpXo0b0WrXjCUc6HNVJ0bGNbuPoHkmXzMHIHgCUA5KbNcIuHpRx
         4kTZP3GxXkM08P39sZFVequq2Lj6ZXi8AwCd0gQa+dy/3PssQ207uuFjEjgWFiR3FgGr
         q+1kr1usTqKc7xVhk/Q0AlmYTIjSRQbknDRQgQGODjGmiBbWmDW1IuhDxG9hU21VeVY8
         Ifjv4aN7rgZJJ84GqgP9Qn+ccjCO1ZuPDYRgdVLHz77j3SAlvyLXrqhJvPAt4MG9OR7E
         Pxd1iftYDh3X+4CH3k0DYYGZlaxOk4HJKhDoEZlGEzIYe/Rmts+R9u0FXBpqMUCdYHZS
         Aghg==
X-Gm-Message-State: AOAM531FrGwpJ+ikrSHx4nu8pi28BCx3+zXyZyDmb19PiHtmkurhbqMy
        h3tHq0Pc1FEMVA1eSJW1i9YPRPLW
X-Google-Smtp-Source: ABdhPJxgd25zxITtTsJDfQ68vGFu+qwm3jcGOLY1V7iUsJsM1SwU4xIiF/JswppLB4mPwy/euDv0TQ==
X-Received: by 2002:a63:b90a:: with SMTP id z10mr17348129pge.277.1593578678376;
        Tue, 30 Jun 2020 21:44:38 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u23sm4388224pgn.26.2020.06.30.21.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 21:44:37 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
To:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
 <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
 <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
 <86c009a8-05c4-40a3-daef-6d9e848642a3@gmail.com>
 <db96187e25342cd36133cde64ef742e03325c8c3.camel@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <cd40f919-f8d9-cde4-6cc5-f523e4973c3b@gmail.com>
Date:   Tue, 30 Jun 2020 21:44:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <db96187e25342cd36133cde64ef742e03325c8c3.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/30/2020 9:37 PM, Mark Tomlinson wrote:
> On Tue, 2020-06-30 at 20:14 -0700, Florian Fainelli wrote:
>> Sorry, it looks like I made a mistake in my testing (or I was lucky),
>>> and this patch doesn't fix the issue. What is happening is:
>>> 1) nsp-pinmux driver is registered (arch_initcall).
>>> 2) nsp-gpio-a driver is registered (arch_initcall_sync).
>>> 3) of_platform_default_populate_init() is called (also at level
>>> arch_initcall_sync), which scans the device tree, adds the nsp-gpio-a
>>> device, runs its probe, and this returns -EPROBE_DEFER with the error
>>> message.
>>> 4) Only now nsp-pinmux device is probed.
>>>
>>> Changing the 'arch_initcall_sync' to 'device_initcall' in nsp-gpio-a
>>> ensures that the pinmux is probed first since
>>> of_platform_default_populate_init() will be called between the two
>>> register calls, and the error goes away. Is this change acceptable as a
>>> solution?
>>
>> If probe deferral did not work, certainly but it sounds like this is
>> being done just for the sake of eliminating a round of probe deferral,
>> is there a functional problem this is fixing?
> 
> No, I'm just trying to prevent an "error" message appearing in syslog.
> 
>>> The actual error message in syslog is:
>>>
>>> kern.err kernel: gpiochip_add_data_with_key: GPIOs 480..511
>>> (18000020.gpio) failed to register, -517
>>>
>>> So an end user sees "err" and "failed", and doesn't know what "-517"
>>> means.
>>
>> How about this instead:
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 4fa075d49fbc..10d9d0c17c9e 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1818,9 +1818,10 @@ int gpiochip_add_data_with_key(struct gpio_chip
>> *gc, void *data,
>>         ida_simple_remove(&gpio_ida, gdev->id);
>>  err_free_gdev:
>>         /* failures here can mean systems won't boot... */
>> -       pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
>> -              gdev->base, gdev->base + gdev->ngpio - 1,
>> -              gc->label ? : "generic", ret);
>> +       if (ret != -EPROBE_DEFER)
>> +               pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n",
>> +                       __func__, gdev->base, gdev->base + gdev->ngpio - 1,
>> +                       gc->label ? : "generic", ret);
>>         kfree(gdev);
>>         return ret;
>>  }
>>
> That was one of my thoughts too. I found someone had tried that
> earlier, but it was rejected:
> 
> 
> https://patchwork.ozlabs.org/project/linux-gpio/patch/1516566774-1786-1-git-send-email-david@lechnology.com/

clk or reset APIs do not complain loudly on EPROBE_DEFER, it seems to me
that GPIO should follow here. Also, it does look like Linus was in
agreement in the end, not sure why it was not applied though.
-- 
Florian

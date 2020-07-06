Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F30215DE5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 20:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgGFSDw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 14:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbgGFSDv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 14:03:51 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B46CC061755
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 11:03:51 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 22so40269144wmg.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 11:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1r9nQdWAuC8N3L1BUVcnwpS3LGqvBj+wWQMPJCqLtvo=;
        b=ZQQk4dLtYx4rXkZhrV/UnqXCtRf6fQ6sUIDr2YabKGUhR3TxA0ZyoT+fKfNxfCeS5y
         7aOUhd8r/us9cpKZjarVN6ikyylNM1kju32WZAhE3M1azxKGbrY3FVWjpzhoRKVXkH+n
         UMUo4V/JgYe4Za1zs45PoQnm0h8bH6oHoi49Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1r9nQdWAuC8N3L1BUVcnwpS3LGqvBj+wWQMPJCqLtvo=;
        b=KdyAfe+QKOwqfiBRuT4LAj56TbFdV3Ljf53SytMmFMOfQ2EwoSiZqmjqVL1z8wPqIh
         +mZKN+DvURjwtdxokL0Frr7UljdFiSZ6/tu12IpVSdtB2/4Xl+tY6MYl8m5jspUFpA/Q
         3t7W5RLZPf/LqBJqazKsIGoUOO7fEQQN8Nnt9A9VMmxmF2XRBzOL4gqVRL8OVhrjqMwo
         6gzn3KBelAOT72ejmOEQCHLWznlFJ96hVvOznmqZVj45H5MKkpSCTH+TWLVIzggKBNOg
         8pj1/nlWgV5h3w+qH91gInkO1yf9XAft+gT8m18Ade41pnL0WJHtnTCyogFF/yyW+9kh
         N+Qg==
X-Gm-Message-State: AOAM530p64EKZK1D9Scv4Nqu/TH4U6ZDwbaf6e22qfEbNxI6DA3PdgUO
        BjUnVQ0G2WXA1vvFicpqe2u4ag==
X-Google-Smtp-Source: ABdhPJxIvXroKVjZ+FrZo4o+fwxqV9fn7/P/NvJsQUHYWvoNqS6xwkV4tFfScORJId5peKPFn3S9WQ==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr382139wmy.79.1594058629837;
        Mon, 06 Jul 2020 11:03:49 -0700 (PDT)
Received: from [192.168.1.201] (d162-156-48-252.bchsia.telus.net. [162.156.48.252])
        by smtp.gmail.com with ESMTPSA id x5sm314958wmg.2.2020.07.06.11.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 11:03:49 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
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
 <cd40f919-f8d9-cde4-6cc5-f523e4973c3b@gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <b0f14acc-fcb1-9e29-e95a-902640d3dff9@broadcom.com>
Date:   Mon, 6 Jul 2020 11:03:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cd40f919-f8d9-cde4-6cc5-f523e4973c3b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/30/2020 9:44 PM, Florian Fainelli wrote:
> 
> 
> On 6/30/2020 9:37 PM, Mark Tomlinson wrote:
>> On Tue, 2020-06-30 at 20:14 -0700, Florian Fainelli wrote:
>>> Sorry, it looks like I made a mistake in my testing (or I was lucky),
>>>> and this patch doesn't fix the issue. What is happening is:
>>>> 1) nsp-pinmux driver is registered (arch_initcall).
>>>> 2) nsp-gpio-a driver is registered (arch_initcall_sync).
>>>> 3) of_platform_default_populate_init() is called (also at level
>>>> arch_initcall_sync), which scans the device tree, adds the nsp-gpio-a
>>>> device, runs its probe, and this returns -EPROBE_DEFER with the error
>>>> message.
>>>> 4) Only now nsp-pinmux device is probed.
>>>>
>>>> Changing the 'arch_initcall_sync' to 'device_initcall' in nsp-gpio-a
>>>> ensures that the pinmux is probed first since
>>>> of_platform_default_populate_init() will be called between the two
>>>> register calls, and the error goes away. Is this change acceptable as a
>>>> solution?
>>>
>>> If probe deferral did not work, certainly but it sounds like this is
>>> being done just for the sake of eliminating a round of probe deferral,
>>> is there a functional problem this is fixing?
>>
>> No, I'm just trying to prevent an "error" message appearing in syslog.
>>
>>>> The actual error message in syslog is:
>>>>
>>>> kern.err kernel: gpiochip_add_data_with_key: GPIOs 480..511
>>>> (18000020.gpio) failed to register, -517
>>>>
>>>> So an end user sees "err" and "failed", and doesn't know what "-517"
>>>> means.
>>>
>>> How about this instead:
>>>
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index 4fa075d49fbc..10d9d0c17c9e 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -1818,9 +1818,10 @@ int gpiochip_add_data_with_key(struct gpio_chip
>>> *gc, void *data,
>>>         ida_simple_remove(&gpio_ida, gdev->id);
>>>  err_free_gdev:
>>>         /* failures here can mean systems won't boot... */
>>> -       pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
>>> -              gdev->base, gdev->base + gdev->ngpio - 1,
>>> -              gc->label ? : "generic", ret);
>>> +       if (ret != -EPROBE_DEFER)
>>> +               pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n",
>>> +                       __func__, gdev->base, gdev->base + gdev->ngpio - 1,
>>> +                       gc->label ? : "generic", ret);
>>>         kfree(gdev);
>>>         return ret;
>>>  }
>>>
>> That was one of my thoughts too. I found someone had tried that
>> earlier, but it was rejected:
>>
>>
>> https://patchwork.ozlabs.org/project/linux-gpio/patch/1516566774-1786-1-git-send-email-david@lechnology.com/
> 
> clk or reset APIs do not complain loudly on EPROBE_DEFER, it seems to me
> that GPIO should follow here. Also, it does look like Linus was in
> agreement in the end, not sure why it was not applied though.
> 

I think either we silently drop this or we explicitly make it obvious
that it failed due to EPROBE_DEFER. Both seem acceptable to me.

Thanks!

Ray

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8205A332C6F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 17:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCIQmm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 11:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhCIQmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 11:42:38 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58343C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 08:42:38 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id 7so16982910wrz.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 08:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bSanhV2eM0+q0PMc4Bed4YDc78eCofTbV84wbIBdvTQ=;
        b=MdaSfK7UqIcJZx3XtaPeOnw6bNRyNjjsARG28v0bZgYTpkq753rOtazP9z0+YBQYDW
         1gkcH/YnjhS9s2Q8smfa1hmhr5eCk6QLzxr0dnDAaBKgU+lWavthSYVk/nZG4ONbaud3
         vZgXwUykJLQhXjp6E3CHaLiiiprb1iNOWgVCfSBcg1ZxgFzctdu39qe7l7Js+V3/X5nW
         evw/QjPEVSk+VnGw45D9dy4vqRcwEWdLpbgQfjbZtXCKQYqCIOYjmg8AuQoqnI6TNiod
         eO2qSjCCM5/XLsbd0waXlg46faq34YbeJlPBYXs0aFAS4yG48qxoBq7gUSxDVetL7Lzn
         QcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bSanhV2eM0+q0PMc4Bed4YDc78eCofTbV84wbIBdvTQ=;
        b=UBYflUUBUnGXxx9Dva08L5U+Ebw/beCO1F9SNBvaWH4iOtX7ai5ykkUDUehrJyz7WZ
         xii07NnkiGHMugBuP6jsdtfqciSL97s8NGaX2Nq6TNQIl49GEErXZ9T0LXvHHJFxdMq9
         UCSBWsCjBItfogHy+TGme8ipRXLpGFhXXAkUZJehAIf4WkBTgvinYf8saZWAxA2AKtQh
         DG2A+vPCzROC3Djneek3ENVOaGZm4YHekGIL60Flu7oRUUgEN3/ag1ZOrxsV2uGghUj5
         KgEl3noVOZj8OaSHOxTRCaErBepCRpIuVK+sl4mUvWdvvl8vlB8PPrqj0QBJYdP+/ZIs
         bHBQ==
X-Gm-Message-State: AOAM531k9txv1oQJF59THPZ47QGPsIE1FLWK5DOh4eVQs8IeaiNScuTw
        pFILqCZ+JdJV2gVLT3iDtX6LwQ==
X-Google-Smtp-Source: ABdhPJx/jZh5dOJrB2L22G5L2Hpp8bMWxe58wtT1PvpdZhpnqxpZvBm1xeUz6KiiTjwyWKbdbtsxTg==
X-Received: by 2002:a5d:6342:: with SMTP id b2mr29169833wrw.421.1615308157151;
        Tue, 09 Mar 2021 08:42:37 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u3sm24770935wrt.82.2021.03.09.08.42.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 08:42:36 -0800 (PST)
Subject: Re: [PATCH] gpio: wcd934x: Fix shift-out-of-bounds error
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>, amit.pundir@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210309101908.27688-1-srinivas.kandagatla@linaro.org>
 <CAHp75VcBc_pYVPw6A4tH0fqzWKtCT61a45tfN9ZrhuLee1VBUg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <aa21e433-b1ee-44ee-8c1b-bfb2e9a04bb5@linaro.org>
Date:   Tue, 9 Mar 2021 16:42:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcBc_pYVPw6A4tH0fqzWKtCT61a45tfN9ZrhuLee1VBUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/03/2021 16:31, Andy Shevchenko wrote:
> On Tue, Mar 9, 2021 at 12:21 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
>> which is not right, and this was caught by below usban check
> 
> It would be nice to reduce below to ~2-3 (significant) lines.

I agree! Will do that in next version!

--srini
> 
>> UBSAN: shift-out-of-bounds in /workspace/dev/linux/drivers/gpio/gpio-wcd934x.c:34:14
>> qcom-q6v5-mss 4080000.remoteproc: failed to acquire pdc reset
>> remoteproc remoteproc2: releasing 4080000.remoteproc
>> shift exponent 4294967295 is too large for 64-bit type 'long unsigned int'
>> CPU: 6 PID: 155 Comm: kworker/6:2 Not tainted 5.12.0-rc1-00045-g508b7280ec3d-dirty #1396
>> Hardware name: Thundercomm Dragonboard 845c (DT)
>>
>> Call trace:
>>   dump_backtrace+0x0/0x1c0
>>   show_stack+0x18/0x68
>>   dump_stack+0xd8/0x134
>>   ubsan_epilogue+0x10/0x58
>>   __ubsan_handle_shift_out_of_bounds+0xf8/0x168
>>   wcd_gpio_get_direction+0xc8/0xd8
>>   gpiochip_add_data_with_key+0x4ac/0xe78
>>   devm_gpiochip_add_data_with_key+0x30/0x90
>>   wcd_gpio_probe+0xc8/0x118
>>   platform_probe+0x6c/0x118
>>   really_probe+0x24c/0x418
>>   driver_probe_device+0x68/0xf0
>>   __device_attach_driver+0xb4/0x110
> 
> After addressing above, FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/gpio/gpio-wcd934x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
>> index 1cbce5990855..97e6caedf1f3 100644
>> --- a/drivers/gpio/gpio-wcd934x.c
>> +++ b/drivers/gpio/gpio-wcd934x.c
>> @@ -7,7 +7,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/of_device.h>
>>
>> -#define WCD_PIN_MASK(p) BIT(p - 1)
>> +#define WCD_PIN_MASK(p) BIT(p)
>>   #define WCD_REG_DIR_CTL_OFFSET 0x42
>>   #define WCD_REG_VAL_CTL_OFFSET 0x43
>>   #define WCD934X_NPINS          5
>> --
>> 2.21.0
>>
> 
> 

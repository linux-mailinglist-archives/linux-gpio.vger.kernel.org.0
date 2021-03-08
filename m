Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0DF3313B8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhCHQrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhCHQrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 11:47:22 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B471FC06174A;
        Mon,  8 Mar 2021 08:47:21 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v13so15691658edw.9;
        Mon, 08 Mar 2021 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s/4y/N4tiSOfRSLnm93GupMk7xB65LEXVHEzUXVbch8=;
        b=jycUwjn/rNVqdo+F+mFlHiH3/Two2UJRg/ngexFQS+Gb5MITs4TfLxsAae8KmEEMzF
         gXg4X5pdwHpN9oOiqJQjdDfBBed+gWi3ksJ1SWf6x1oy2gP1zNfYWO1Hfy1G9QVPEeX8
         MES7AZNYV8jwJjBWPDt63eCelzW5EVSP/orDGn1Ngh2ShLXaxzl07jrSrkT16M778yk+
         VMo+wJkpoNkXalmucTuq97BM7ujnbL58742KimqkMgry7pgo1z4zNhYlZawVBlw0pz0N
         /TLIhV5uiRUKq1Hns8/lVoPC8ew3Ou64/1qL01jVtSTRr4KodtVNSQZedxA3RuO9YvqH
         8XWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s/4y/N4tiSOfRSLnm93GupMk7xB65LEXVHEzUXVbch8=;
        b=j2FDpdUhwwNxej3Hcqjf1XJLw4tt28JkARVqABKFbtWX/jZkoxLFiA4kuzr3lwYCa/
         3LRabprU0wqTr+k3BN6LQQ0YMAjt787lVIQGKnyoaQMwFfSl6t9diU4ng4tXPFgiHqAB
         JEgcHmSmnz6A1cfNr8qP3UQs/RL0F5tpsh9RjmmFzVgvfjdhztn8cn4PnxzMbn8f34PK
         xtYT0BFRVBd6AXSI8xnzplGzVG7BZO844Ed7s7n26Nedl3BrWv+7mlCBc/H1BvyulwGH
         S+fHiQQ9DGFZSOkzGLh7EDAvXf5RWsv9wk11iwTyfo95OcVmw+QczE1crLpUQd9x8/SZ
         8vzQ==
X-Gm-Message-State: AOAM533uAsy+/+JFJ1Tsk0KkDaQcn6AoGkzg14t0fp2fjjFe7+qqfp/v
        y+J0vKXM1J+B02cDtn2ABSIDsE+cOKuXPw==
X-Google-Smtp-Source: ABdhPJwUEGmLoEBQwXq1hp0wC6MQjpEYNcsoK0nrrBVWk5WqleJzVGbNopUGKQR2562Tqj086c5bBA==
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr9790140edv.44.1615222040232;
        Mon, 08 Mar 2021 08:47:20 -0800 (PST)
Received: from [10.17.0.16] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id v9sm6810333ejd.92.2021.03.08.08.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 08:47:19 -0800 (PST)
Subject: Re: [PATCH] Revert "pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance"
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com> <YEZRbO3uJQmsCZO9@smile.fi.intel.com>
 <241a8d75-c0d7-0045-49ee-22072e8588b8@gmail.com>
 <CAHp75Veg5LjQdx5VQBUWWkKRSGGQsxW-2sm7Y5aH8-g9cHDfJA@mail.gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <3109f0b1-a47d-47e8-cd9c-ac47d8364761@gmail.com>
Date:   Mon, 8 Mar 2021 17:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Veg5LjQdx5VQBUWWkKRSGGQsxW-2sm7Y5aH8-g9cHDfJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/8/21 5:46 PM, Andy Shevchenko wrote:
> On Mon, Mar 8, 2021 at 6:44 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>> On 3/8/21 5:31 PM, Andy Shevchenko wrote:
>>> On Mon, Mar 08, 2021 at 05:35:59PM +0200, Andy Shevchenko wrote:
>>>> On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
>>>>> Following commit 036e126c72eb ("pinctrl: intel: Split
>>>>> intel_pinctrl_add_padgroups() for better maintenance"),
>>>>> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
>>>>> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
>>>>> should be there (they are defined in ACPI and have been accessible
>>>>> previously). Due to this, gpiod_get() fails with -ENOENT.
>>>>>
>>>>> Reverting this commit fixes that issue and the GPIOs in question are
>>>>> accessible again.
>>>>
>>>> I would like to have more information.
>>>> Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
>>>> output (when kernel command line has 'ignore_loglevel' option) for both working
>>>> and non-working cases?
>>>>
>>>> Also if it's possible to have DSDT.dsl of the device in question along with
>>>> output of `grep -H 15 /sys/bus/acpi/devices/*/status`.
>>>>
>>>>> There is probably a better option than straight up reverting this, so
>>>>> consider this more of a bug-report.
>>>>
>>>> Indeed.
>>>
>>>
>>> Can you test if the below helps (probably you have to apply it by editing
>>> the file manually):
>>>
>>> --- a/drivers/pinctrl/intel/pinctrl-intel.c
>>> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
>>> @@ -1392,6 +1392,7 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
>>>        gpps[i].size = min(gpp_size, npins);
>>>        npins -= gpps[i].size;
>>>
>>> +     gpps[i].gpio_base = gpps[i].base;
>>>        gpps[i].padown_num = padown_num;
>>>
>>>
>>
>> That does fix the issue! Thanks for the fast response and fix!
> 
> I'm about to send the formal patch. I will add the
> Reported-and-tested-by tag if you are okay with it.
> 

Sure thing.

Thanks,
Max

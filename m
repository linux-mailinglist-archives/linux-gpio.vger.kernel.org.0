Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0073313A7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCHQn7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhCHQne (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 11:43:34 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41ACC06174A;
        Mon,  8 Mar 2021 08:43:33 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v13so15674127edw.9;
        Mon, 08 Mar 2021 08:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iGxmjsIAakhmO1Hbo5Yb6Y5dOSTb27I2CbUQX1758Ts=;
        b=Ry1e2Rf3a8g1vzMPXYIQOL1BU6bl/06FtiosR2eBVJYYK5QQY6rQ7fvlCXq0TXLvUR
         7//Oo2Myji89onUWloaBWZN94O+lgV0bZdybia5Y+dO9BKQQxbgQ+1sBWjFuZqU4xkKe
         LOzsJqtee1cDZg/k2Df4IfIJkpa6Nwo0/aeZvxpFAGhk2z9jXEt3gi8DAmgoq2BZDWc+
         L8Ch1vH90jo+ewcYvFKQ6OHqH1zXI1guRj8aGbzCABKYJzwsGNhNxZ5lmK1cmboKTYZD
         ynIHrDLvmFaV24lAa+tHswN+8plMdXr0x6o4qZp0j7MQeI4/v6TQnKL5X5RQASHMnz2K
         7odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iGxmjsIAakhmO1Hbo5Yb6Y5dOSTb27I2CbUQX1758Ts=;
        b=Sr4xjs2pq2cHhLQsozqgQgU39gvBBd0hsJ3JEtos++yxq8OvdbPBDeIcLmolyapsa4
         yJA8d8b4ToWEgIYAHlFhEY0zXdRMGjfrWCUyMUUWQIqsMr5StpF1NhcT9XlZv4LZ6ISI
         xfKCH57a/1tf3jJo5aTwyCdRV8NPR4od15gyeU9lvNd6qRz4xLtTU3TbQJbgvChXDwQ+
         fs7tgZVe/pBhVrjXDadW5qxqPwTi3ScINol7dLY8SSm2W0n25/u9yFvew3OWUJGjP8ge
         l9cC3S2YRU4c5KBpUfFBMkCUy1BGFzCZjEMuAhRG+1HuavY4d5YwHDhOIvUboD6/DcST
         ykOw==
X-Gm-Message-State: AOAM532Cu0Ezhla4p3z27nVT7P1eg444kZOcYtj+TRqNzepGuDl3xX/0
        8Gxn7OlCEPQhbp281Rz/KgXIF1UtXKBKvQ==
X-Google-Smtp-Source: ABdhPJzPXJNaNJrGVmw3pcedTWs6uWQzyEN3nl/3xaol7FjsSWFQOaSjKwpQ0np/X7lCMVBY/Nk5+w==
X-Received: by 2002:a50:fc94:: with SMTP id f20mr23166663edq.370.1615221812090;
        Mon, 08 Mar 2021 08:43:32 -0800 (PST)
Received: from [10.17.0.16] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id l1sm6764823eje.12.2021.03.08.08.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 08:43:31 -0800 (PST)
Subject: Re: [PATCH] Revert "pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance"
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com> <YEZRbO3uJQmsCZO9@smile.fi.intel.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <241a8d75-c0d7-0045-49ee-22072e8588b8@gmail.com>
Date:   Mon, 8 Mar 2021 17:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEZRbO3uJQmsCZO9@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/8/21 5:31 PM, Andy Shevchenko wrote:
> On Mon, Mar 08, 2021 at 05:35:59PM +0200, Andy Shevchenko wrote:
>> On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
>>> Following commit 036e126c72eb ("pinctrl: intel: Split
>>> intel_pinctrl_add_padgroups() for better maintenance"),
>>> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
>>> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
>>> should be there (they are defined in ACPI and have been accessible
>>> previously). Due to this, gpiod_get() fails with -ENOENT.
>>>
>>> Reverting this commit fixes that issue and the GPIOs in question are
>>> accessible again.
>>
>> I would like to have more information.
>> Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
>> output (when kernel command line has 'ignore_loglevel' option) for both working
>> and non-working cases?
>>
>> Also if it's possible to have DSDT.dsl of the device in question along with
>> output of `grep -H 15 /sys/bus/acpi/devices/*/status`.
>>
>>> There is probably a better option than straight up reverting this, so
>>> consider this more of a bug-report.
>>
>> Indeed.
> 
> 
> Can you test if the below helps (probably you have to apply it by editing
> the file manually):
> 
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1392,6 +1392,7 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
>   	gpps[i].size = min(gpp_size, npins);
>   	npins -= gpps[i].size;
>   
> +	gpps[i].gpio_base = gpps[i].base;
>   	gpps[i].padown_num = padown_num;
>   
> 

That does fix the issue! Thanks for the fast response and fix!

Regards,
Max

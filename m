Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4367748D6FA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jan 2022 12:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiAML4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jan 2022 06:56:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57987 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232122AbiAML43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jan 2022 06:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642074988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OC1HACjftdg/evWjfJNQ5Yq6rtql5aC8h4UsIQ6Lq1Y=;
        b=i1HO1sfAAGABKuruK1DJggNTmVarb03BNoyt8Zll67z9khkXd+LXbP1HwSq4hKNhIK9Fi6
        qw9/R6FULBsIiTS4Fm3v0J3AE3+4F4YHxkD9gMpNHOrTj3wcjq5YWgOrc2cfO+hzEG5xA7
        pcSN01wNWTdxv1im6h7MZqYPxYME0lw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-uFzvd5taONujPXIjEk6-Hw-1; Thu, 13 Jan 2022 06:56:27 -0500
X-MC-Unique: uFzvd5taONujPXIjEk6-Hw-1
Received: by mail-ed1-f72.google.com with SMTP id h1-20020aa7cdc1000000b0040042dd2fe4so3860584edw.17
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jan 2022 03:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OC1HACjftdg/evWjfJNQ5Yq6rtql5aC8h4UsIQ6Lq1Y=;
        b=EUKETcARudmrbBW9n/Ej9Xjn3/Jf2ywMzQyjQi3Yz66y4lrKi/TCv4y5Og9XBKQIbD
         3XK/8D2E4OKD2fM+OxUUxTR13RJUkIzzWWrYbrRA20dEbbVcAfwfVAsn96dVm9S6RFne
         5hklBL5+iwOru4mG/OxoFlw4ND9HTbjqyuGfywwn4L3mozMk7OOwfYkPAGDCkXwLvIdV
         zoqaX0dXpguEFFELbN1/7e9wEuKDev+dhoCjwurjXYmXCzNOK8dDQz0sSt9dfJGdWAss
         wj7jEscc/3A4BYtYVqXCSpwRh7IQf/N2qbaj17yykmePlh8JfrEljN/0olqrG1GveTxf
         /05Q==
X-Gm-Message-State: AOAM531+LW9Yvm3NlwyxKzc3iEurHHDZqZL2Bp1LJzJqkqgEZdMmiNu8
        LoIBHIktB3r+eRU9a1LIUiH3+28UGnHvnH6F3MqFbXNhe3lrggb+1tea13PBD36SCNh69jwoVCz
        tmmAtBHCqTeo6HbxWm+XUvQ==
X-Received: by 2002:a05:6402:440a:: with SMTP id y10mr3745974eda.371.1642074986311;
        Thu, 13 Jan 2022 03:56:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuHqafx+A9t0Dg6yI9cXl9iO/x9c6yLuwaLVnBrFRd1AyLNTFmPS42jyl3eHkLGPON6qMwGQ==
X-Received: by 2002:a05:6402:440a:: with SMTP id y10mr3745959eda.371.1642074986079;
        Thu, 13 Jan 2022 03:56:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id v16sm1085088edc.4.2022.01.13.03.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 03:56:25 -0800 (PST)
Message-ID: <82f6ccb3-7b15-8a5f-d142-8b4087fe4582@redhat.com>
Date:   Thu, 13 Jan 2022 12:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: baytrail: Pick first supported debounce value
 larger then the requested value
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20210819203952.785132-1-hdegoede@redhat.com>
 <YR+qHHVgALcpQ6k+@smile.fi.intel.com>
 <ee7274c0-15f1-3ca0-cca3-bcdc37350334@redhat.com>
 <YeANkfsFivOpulog@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YeANkfsFivOpulog@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/13/22 12:31, Andy Shevchenko wrote:
> On Mon, Aug 23, 2021 at 12:32:18PM +0200, Hans de Goede wrote:
>> On 8/20/21 3:11 PM, Andy Shevchenko wrote:
>>> On Thu, Aug 19, 2021 at 10:39:52PM +0200, Hans de Goede wrote:
>>>> Bay Trail pin control only supports a couple of discrete debounce timeout
>>>> values. Instead of returning -EINVAL for other values, pick the first
>>>> supported debounce timeout value larger then the requested timeout.
>>>>
>>>> E.g. on a HP ElitePad 1000 G2, where the ACPI tables specify a timeout of
>>>> 20 ms for various _AIE ACPI event sources, this will result in a timeout
>>>> of 24 ms instead of returning -EINVAL to the caller.
> 
> Old thread which I forgot to answer to...

No problem I did happen to accidentally do some work on this over
the Christmas Holidays and made some notes.

Spoiler: I believe the best thing we can do here is to just
never touch the debounce settings at all, see below.

>>> I would prefer to see case 1...375: case 376...750: It makes it more explicit
>>> what we choose. Also it will be in align with debounce getter switch-case.
>>
>> Ok, that works for me.
>>
>>> Nevertheless, there is the bigger problem here, which is that the debounce
>>> setting is global per community and neither current nor new code addresses.
>>>
>>> What we need is to have a bitmap of size 3-bit * N_pins (per community) to save
>>> settings and each time we try to adjust them, we have to go through that bitmap
>>> and check actual users and see if we have conflicting requests.
>>>
>>> You may ask why we have to keep the actual debounce value and not the biggest
>>> one. The reason why is simple, if the following flow of requests comes we will
>>> have better setting at the end:
>>>
>>> 1) A asks for debounce of 1ms (we set to 1.5ms)
>>> 2) B asks for 10ms (we set likely to 12ms *)
>>> 3) B gone (we should return to 1.5ms)
>>> 4) C asks for 400us (*)
>>>
>>> *) TBH I have no idea what to do with these cases, i.e. when better to satisfy
>>>    the bigger, when issue warning, when just print a debug message. I admit
>>>    that debounce on BYT has been not thought through on HW level.
>>
>> I believe that most DSDTs only use 1 value, so the whole bitmap thing seems
>> over-complicated.
> 
> Since you are in possession of plenty of them, can you confirm?

I could go look at this, yes, but I would need to make some time
for that. And since last time I'm not so sure this is the case
anymore, from the top of my head most DSDTs don't use this at all
and those that do use nice round numbers, not the very specific
supported values which suggests that the DSDT authors are not
aware that all the pins in a single community need to have the
same debounce setting.

>> I did noticed the dev_dbg which I added triggering by a requested value of 50 ms.
>> I've tracked that down to  drivers/input/misc/soc_button_array.c setting
>> debounce_interval to 50, which then gets passed to gpiod_set_debounce() by
>> drivers/input/keyboard/gpio_keys.c. gpio_keys.c will fallback to sw debouncing using
>> mod_delayed_work() if gpiod_set_debounce() fails, so I think we should deny
>> big debounce values to keep that fallback working.
> 
> I'm not sure I got this. If DSDT asks for big debounce timeout how can we be
> sure it's incorrect request?

This is not coming from the DSDT, the DSDT is merely listing GPIOs to
use for the volume and power-buttons. The 50 ms debounce value is hardcoded in
drivers/input/misc/soc_button_array.c

That code creates platform-devs + pdata for drivers/input/keyboard/gpio_keys.c
and that latter code tries to use hw debouncing before falling back to sw
debouncing. I still had the patch from this thread in my personal WIP tree
and the version in my tree simply picked 24 ms for this as yuo suggest
below (continued below).

> 
> At least I see the way out (yes, over complicated) in keeping bitmap and / or
> (not sure about bitmap) the mean / average debounce timeout. In such case if
> 5x users wants 10ms and one wants 50ms, we will set something like 12ms.
> 
>> I suggest we do the following:
>>
>> 1. Reject value < 0 || value > 24 ms values (avoiding the gpio_keys case)
> 
> Why not to set 24ms? Perhaps we need some heuristics here. If there ask for
> 30ms, 24ms sounds good enough, no?

True, there is a bigger problem though as said my the code in my WIP tree
was selecting 24ms for the 50ms debounce of the volume buttons and
I noticed that the volume buttons where not properly debounced resulting
in multiple evdev keypress events and those were grouped much closer together
in time then 24ms, it was more like 1ms or less even in between the bounces.

So it seems that the 24ms debounce setting does not work. IIRC (not sure)
I did check that there was not another later call changing the shared
debounce time to a lower value.

Looking back at my notes my intermediate conclusion was that (24ms)
debouncing seems to just not work; and that this needs more investigation.

>> 2. Determine rounded-up value using modified switch-case as you suggest 
> 
> Ack.
> 
>> 3. Check vs last set rounded-debounce value (if set) and warn + fail
>>    the set_debounce if it is different
> 
> Ack.
> 
>> 4. Remember the last set debounce value
> 
> Ack with the above comment that perhaps better to keep mean / average.
> 
>> If the warnings turn out to trigger, we can then look at the DSDT of
>> that specific device and figure out a way forward from there, with the
>> knowledge of how a troublesome device actually uses this (I know a sample
>> of 1 troublesome device is not necessarily representative, but it is
>> better then no samples and I expect / hope there to simply be no samples).
> 
> Ack.
> 
>> (we can then also skip the debounce-time programming when it is unchanged)
> 
> Or close enough, sounds like we need margin in percentage of the asked value,
> like ±20% is okay.

I'm fine with adding a margin, but:

1. Given what a mess this is with the shared debounce register
2. That the current code expects the exact values from the datasheet,
   and otherwise returns -EINVAL.
3. AFAICT no DSDTs actually use the exact datasheet values.
4. 2 + 3 mean that in essence setting the debounce time currently is
   a no-op since it always returns -EINVAL.

I wonder if it is not better to preserve the current behavior of
setting the debounce-time being a no-op by just ripping out support
for setting it all together?

This seems like a nice KISS solution to all potential problems here,
just rely on whatever the BIOS has setup, which is in essence what
we have been doing so far.

Note I suggest to just keep the "get" path, it is is fine and I guess
it might be useful for some cases, or at least for debugging?

Regards,

Hans


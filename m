Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF84C28495C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 11:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJFJ3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 05:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41677 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgJFJ3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 05:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601976585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iXv1cpmfS7DidtwvWPelMZqKFOEn27KsnWAhr9V/IuU=;
        b=WKlIAjIdcG7WN9a8LkzPXXjavKvjFph3Aa5+B+shrwPj85dK9DvqhgZoezYWrGX4aHkk0K
        dbEcO6NA/9jkV3lMZ/IOTPhuYG0IqPUmJtS9P5oWKB16TQQS/WoafF7jugEmo3VsL+vr/G
        3qBEaXNIYsS2+8KTDikTQGRw4TLGJEY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-zcN8fXj8NmOJB0vnmfcwYw-1; Tue, 06 Oct 2020 05:29:43 -0400
X-MC-Unique: zcN8fXj8NmOJB0vnmfcwYw-1
Received: by mail-ej1-f71.google.com with SMTP id d13so5581444ejz.6
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2020 02:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iXv1cpmfS7DidtwvWPelMZqKFOEn27KsnWAhr9V/IuU=;
        b=LvEjvdvLCNZwkDCrPAATD+ZPG5ElQaz+ssW0GZ2PetxDbs8SDSxhgPjUWqZtP/XNOP
         /wkaG3+2TkYedO9hotGRBaZkNO5aUThjnXgV1lMLdVgAgftLKXlMP8EeklY05Zq+yLJ7
         qYemvakihQW3oNHtmLUzwUOJ0JFcjG7QPzGorw/o7NeLmCIFNgLcm/trU1+YoOo9KN44
         ZJeO5TyMaBLXMPUNFbPv9d/itubN6Wd090DPKQUp5ytxHOKvkPuqQAjF1jhE6K1oe420
         E+YTl3D33QSzeucUX9WG79+F6XIzDfbGsyJvu49he3mG4VF4jmUIUkelrlM/IE8wpgSX
         ucAA==
X-Gm-Message-State: AOAM530MLZqzR+G/bn3zxvmBwEzMwhUyY9u8xHvpflLfMRoRtDJWfERm
        +oEuxtFvRQwVJzofJzneh69anm5WSBXc0cPsOw7OV8bLI+oxYVfdH6AfODydPChG8watClwj72F
        KUKv6ExMVffT9PbPjXNf4kQ==
X-Received: by 2002:a17:906:fcae:: with SMTP id qw14mr4303495ejb.537.1601976581578;
        Tue, 06 Oct 2020 02:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt3THOjCxOsAr0dwdzICXXl+xDFBFxJoKr1UzMh8Edlhy5XBTPQUSNVxG4P2YFCqzLuhCb9g==
X-Received: by 2002:a17:906:fcae:: with SMTP id qw14mr4303471ejb.537.1601976581311;
        Tue, 06 Oct 2020 02:29:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id j9sm1714609ejt.49.2020.10.06.02.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 02:29:40 -0700 (PDT)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
From:   Hans de Goede <hdegoede@redhat.com>
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
Message-ID: <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
Date:   Tue, 6 Oct 2020 11:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/6/20 11:28 AM, Hans de Goede wrote:
> Hi,
> 
> On 10/6/20 10:55 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 10/6/20 10:31 AM, Coiby Xu wrote:
>>> On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 10/6/20 6:49 AM, Coiby Xu wrote:
>>>>> Hi Hans and Linus,
>>>>>
>>>>> I've found the direct evidence proving the GPIO interrupt controller is
>>>>> malfunctioning.
>>>>>
>>>>> I've found a way to let the GPIO chip trigger an interrupt by accident
>>>>> when playing with the GPIO sysfs interface,
>>>>>
>>>>>  - export pin130 which is used by the touchad
>>>>>  - set the direction to be "out"
>>>>>  - `echo 0 > value` will trigger the GPIO controller's parent irq and
>>>>>    "echo 1 > value" will make it stop firing
>>>>>
>>>>> (I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
>>>>> manually trigger an interrupt now.)
>>>>>
>>>>> I wrote a C program is to let GPIO controller quickly generate some
>>>>> interrupts then disable the firing of interrupts by toggling pin#130's
>>>>> value with an specified time interval, i.e., set the value to 0 first
>>>>> and then after some time, re-set the value to 1. There is no interrupt
>>>>> firing unless time internal > 120ms (~7Hz). This explains why we can
>>>>> only see 7 interrupts for the GPIO controller's parent irq.
>>>>
>>>> That is a great find, well done.
>>>>
>>>>> My hypothesis is the GPIO doesn't have proper power setting so it stays
>>>>> in an idle state or its clock frequency is too low by default thus not
>>>>> quick enough to read interrupt input. Then pinctrl-amd must miss some
>>>>> code to configure the chip and I need a hardware reference manual of this
>>>>> GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>>>> since I couldn't find a copy of reference manual online? What would you
>>>>> suggest?
>>>>
>>>> This sounds like it might have something to do with the glitch filter.
>>>> The code in pinctrl-amd.c to setup the trigger-type also configures
>>>> the glitch filter, you could try changing that code to disable the
>>>> glitch-filter. The defines for setting the glitch-filter bits to
>>>> disabled are already there.
>>>>
>>>
>>> Disabling the glitch filter works like a charm! Other enthusiastic
>>> Linux users who have been troubled by this issue for months would
>>> also feel great to know this small tweaking could bring their
>>> touchpad back to life:) Thank you!
>>
>> That is good to hear, I'm glad that we have finally found a solution.
>>
>>> $ git diff
>>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>>> index 9a760f5cd7ed..e786d779d6c8 100644
>>> --- a/drivers/pinctrl/pinctrl-amd.c
>>> +++ b/drivers/pinctrl/pinctrl-amd.c
>>> @@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>                  pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>                  pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>>                  pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>> -               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>>> +               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>>                  irq_set_handler_locked(d, handle_level_irq);
>>>                  break;
>>>
>>> I will learn more about the glitch filter and the implementation of
>>> pinctrl and see if I can disable glitch filter only for this touchpad.
>>
>> The glitch filter likely also has settings for how long a glitch
>> lasts, which apparently goes all the way up to 120ms. If it would
>> only delay reporting by say 0.1ms and consider any pulse longer
>> then 0.1s not a glitch, then having it enabled would be fine.
>>
>> I don't think we want some sort of quirk here to only disable the
>> glitch filter for some touchpads. One approach might be to simply
>> disable it completely for level type irqs.
>>
>> What we really need here is some input from AMD engineers with how
>> this is all supposed to work.
>>
>> E.g. maybe the glitch-filter is setup by the BIOS and we should not
>> touch it all ?
>>
>> Or maybe instead of DB_TYPE_PRESERVE_HIGH_GLITCH low level interrupts
>> should use DB_TYPE_PRESERVE_LOW_GLITCH ?   Some docs for the hw
>> would really help here ...
> 
> So I've been digging through the history of the pinctrl-amd.c driver
> and once upon a time it used to set a default debounce time of
> 2.75 ms.
> 
> See the patch generated by doing:
> 
> git format-patch 8cf4345575a416e6856a6856ac6eaa31ad883126~..8cf4345575a416e6856a6856ac6eaa31ad883126
> 
> In a linux kernel checkout.
> 
> So it would be interesting to add a debugging printk to see
> what the value of pin_reg & DB_TMR_OUT_MASK is for the troublesome
> GPIO.
> 
> I guess that it might be all 1s (0xfffffffff) or some such which
> might be a way to check that we should disable the glitch-filter
> for this pin?

p.s.

Or maybe we should simply stop touching all the glitch-filter
related bits, in the same way as that old commit has already
removed the code setting the timing of the filter ?

At least is seems that forcing the filter to be on without
sanitizing the de-bounce time is not a good idea.

Regards,

Hans


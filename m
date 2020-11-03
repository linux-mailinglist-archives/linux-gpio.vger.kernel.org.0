Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEB82A415A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 11:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgKCKMT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 05:12:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54482 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727470AbgKCKMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 05:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604398333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0MUFWE6mOnbnRG+Ni8WIQ3yfgCYil12Q6u/TIezmtsg=;
        b=KyQ+vPCPXiaxQjpE2dtj2sUus4MiIFptxlkW/FHZ5D0gzOvnjc1lL0RM7wz/tNuKo1GCFV
        V1FyTHCWAUijHDCpHBWaygmThB1WGRHRFo32TLn3+uoJbMvWcDRAQ+dn5UpK2bj869cXR+
        +1AkiuEmVlI0IY9C6Bnt2O0VtQaph5w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-8lH_Ba9vN1mGDEiQHCtcSA-1; Tue, 03 Nov 2020 05:12:12 -0500
X-MC-Unique: 8lH_Ba9vN1mGDEiQHCtcSA-1
Received: by mail-ej1-f70.google.com with SMTP id nt22so2223605ejb.17
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 02:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0MUFWE6mOnbnRG+Ni8WIQ3yfgCYil12Q6u/TIezmtsg=;
        b=b1Li5Ppg99bX1qjaSpZixtdu+X4NgT868kMmQKHvVg3tII/YO3fJVOzRderGxf7ewN
         QZHuR7b4VcIk4ayob1q70oDMes43+JQ0QL9GZ5ozoNRXKmv5s+RoSht2lCaeGGp3UVaZ
         Pn4tZvVcqEmCGD+YGacVmmY7rN7f5pXYa01SKNouNPuxaVHNT3DsPK/fyPXCEUQCr5ye
         h7SOV0v29f2vxCxC1+mh9/XqLKnT7BZU+k+3fQibxUKq3SICd9IbF4LXmDLDPC30OOom
         Qr4G3+NC+VpZK3+MM/+Slt6JVNJJQcFEHikzEeZb2yltHQkxsQhgxTNcc7GWciB6wyoM
         SHvQ==
X-Gm-Message-State: AOAM532FRTpJ3RKuQ+VrnB96a/3oguSVgYhqLZdpeTQrPuikWsodxzOE
        j17qV2Jihh4I2bD0LB9pPeWEkf7o/cLhdCD8Mhuinvta3Y4J0NljxYieizBoji+5Q92lQ+uMg0G
        ymRnDpRUg4VBG4mWQgCXW7g==
X-Received: by 2002:aa7:d709:: with SMTP id t9mr6130965edq.305.1604398330648;
        Tue, 03 Nov 2020 02:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypkhXwlBVdPP8Nwx/U9egOi9INTITIlOwLSF0+H3rc3ojEQIsQTVaupr2QiIMSubSp0nl6kw==
X-Received: by 2002:aa7:d709:: with SMTP id t9mr6130944edq.305.1604398330401;
        Tue, 03 Nov 2020 02:12:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id hj13sm698941ejb.125.2020.11.03.02.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 02:12:09 -0800 (PST)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <20201103000507.ufzukd2vkb5h2e3b@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
Date:   Tue, 3 Nov 2020 11:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103000507.ufzukd2vkb5h2e3b@Rk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/3/20 1:05 AM, Coiby Xu wrote:
> On Tue, Oct 27, 2020 at 11:09:11AM +0100, Hans de Goede wrote:
>> Hi,
>>
> ...
>>
>> So I see 2 ways to move forward with his:
>>
>> 1. Just disable the debounce filter for level type IRQs; or
>> 2. Add a helper to sanitize the debounce pulse-duration setting and
>>   call that when setting the IRQ type.
>>   This helper would read the setting check it is not crazy long for
>>   an IRQ-line (lets say anything above 1 ms is crazy long) and if it
>>   is crazy long then overwrite it with a saner value.
>>
>> 2. is a bit tricky, because if the IRQ line comes from a chip then
>> obviously max 1ms debouncing to catch eletrical interference should be
>> fine. But sometimes cheap buttons for things like volume up/down on tablets
>> are directly connected to GPIOs and then we may want longer debouncing...
>>
>> So if we do 2. we may want to limit it to only level type IRQs too.
>>
>> Note I have contacted AMD about this and asked them for some input on this,
>> ideally they can tell us how exactly we should program the debounce filter
>> and based on which data we should do that.
> 
> Is there any update from AMD?

I'm afraid not.

> Based on the discussion, I'm going to
> submit a patch to disable debounce filter for both level and edge
> type IRQs, i.e. to remove relevant code in amd_gpio_irq_set_type of
> drivers/pinctrl/pinctrl-amd.c since setting debounce filter is
> orthogonal to setting irq type and Andy has submitted the patch to
> support setting debounce setting supplied by ACPI in gpiolib-acpi.c

Ok.

> Btw, did you contact AMD through a representative?

Yes I'm using Red Hat's contacts in to AMD's server department,
which are putting me in contact with AMD'se client department.

> Obviously CC them
> didn't get their attention. There is an inconsistency for configuring
> debounce timeout in pinctrl-amd as was spotted by Andy [1]. I also need
> their feedback for this matter.
> 
> [1] https://lore.kernel.org/patchwork/comment/1522675/

This is a case where Andy is obviously right and you should just use the
higher precision "unit = 15625" value (except probably that is wrong too,
see below).

We have had similar issues with the docs for getting the TSC frequency
on some Intel chips, where the docs said 16.6 MHz for a certain register
value, where what they meant was 100/6 MHz which really is significantly
different. This was leading to a time drift of 5 minutes / day on non
networked (so no NTP) Linux systems.

I think this is what Andy was referring to when he wrote:
"What the heck with HW companies! (Just an emotion based on the experience)"

So the lesson learned there is when you can be reasonable certain that
the value really is a/b and the resulting digits of the value in the
hw doc match that taking the lousy precision into account then you
should probably assume the value really is a/b and not the lousy
precision value given in the docs (or the code comment in this case).

I mean 15.6 msec has 3 significant numbers, that gives an imprecision /
error of approx. 1000 ppm where as a decent clock crystal is in the order
of 50 ppm, so the hardware has a drift / error of approx. 50 ppm which
makes using a value with an error of 1000 ppm in the code really really
bad.

Actually all the values look somewhat suspect. The comment:

>                 Debounce        Debounce        Timer   Max
>                 TmrLarge        TmrOutUnit      Unit    Debounce
>                                                         Time
>                 0       0       61 usec (2 RtcClk)      976 usec
>                 0       1       244 usec (8 RtcClk)     3.9 msec
>                 1       0       15.6 msec (512 RtcClk)  250 msec
>                 1       1       62.5 msec (2048 RtcClk) 1 sec

Helpfully gives the values in RtcClks. A typical RTC clock crystal
is 32 KHz which gives us 31.25 usec per tick, so I would expect the
values to be:

                 0       0       62.500 usec (2 RtcClk)      
                 0       1       250.00 usec (8 RtcClk)    
                 1       0       16.000 msec (512 RtcClk) 
                 1       1       64.000 msec (2048 RtcClk)

And the max multiplier seems to be 15, not 16 as is used for the
Max Debounce Time's in the comment, so those are wrong too. I have
a feeling the table was build the wrong way around (minus the
RtcClk parts). They started with a Max Debounce Time of 1 sec, then
divided that by 16 given them 62.5 msec, where as in reality
we have 2048 ticks of a 32 KHz clock giving us 64 millisec, etc.

I also wonder if the 0-15 divider really is a 0-15 divider or a
1-16 divider... This suggests:

                if (debounce < 61) {
                        pin_reg |= 1;

It really is a 0-15 divider, so without docs we should just assume
that it is 0-15 for now, which makes the divide 1 second by 16 thing
which got them 62.5 msec (or so I believe) a bit suspect. Either the
divide by 16 is wrong, or the divider really is a 1-16 divider...

Regards,

Hans


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F76F2AB78D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 12:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729520AbgKILxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 06:53:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45298 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729516AbgKILxL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 06:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604922789;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mbKDkCuccCrumBV4w2BPCfV7pFv6KfXWJnom/B00yIs=;
        b=e+TwMS/M+AhOgwOpVDfQpxXds5ji5TkdLIP3UM48ui+Zv9nYcEktDTt00S5rLtXBRErA+i
        DnBosSRHt6CP0qCvGak+uwt/AXn09ioTSaatM1pLTHIem9vyAvTEUX2g6C3ftzk/NHg3J5
        k/bv6RXtAndJUKPnMLyV3og4gMCMhlU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-vvqTq7j0N7-RAnYXNdY5IQ-1; Mon, 09 Nov 2020 06:53:08 -0500
X-MC-Unique: vvqTq7j0N7-RAnYXNdY5IQ-1
Received: by mail-ed1-f72.google.com with SMTP id x15so2615535edr.10
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 03:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mbKDkCuccCrumBV4w2BPCfV7pFv6KfXWJnom/B00yIs=;
        b=NaZQi48MGWrTZ8XkV+V4VbqQHkqwduKDs9mkM574SgpCV7DEbv+xyM8BERC+8LNaWB
         XWg4vVJttBwO9RYUzfyRins/ha3dtblJn5XM82ZCG9EZo6gpT9EQGT8MSfigDed1QYzF
         SKZsukJ7hzAbZGNRxykezYdxWQwQq2b+iVoFdvyyfxCRWws4iuq86Ynhr1QWHhhBPjGH
         bC6SvxiB0u8ZS+8qdnjmx9d62+8PpxgTi0HpWVIfwpF3n74wlK7Og4iXl9O2udZCJyK/
         CQQT0/xd0emeNOmrXAr+ng2JHKQqY2B8OYklfAbG5J5PSYici9c3J/QRsF+e56p78ilD
         /a+A==
X-Gm-Message-State: AOAM5306aotA+hEDES52HnwwNuMAwXz4BPJSTqI9fkuWeuqJ8dG5Islh
        +UbJjodJqX5rJ1KnauF6O5HkDZKzRMAexZEtB2we/jBOd79DDmOZmU+X3N0X2W8pqTyS8ssvdJJ
        /e2nq4EL6QjE/XaKmhr3qUw==
X-Received: by 2002:a17:906:c08f:: with SMTP id f15mr14158332ejz.97.1604922786931;
        Mon, 09 Nov 2020 03:53:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNLZO8CDFmB3FlzeKR53hSObUdyUNohxklHFQAijQR31ZI+GSdcrEZqXaFOYU+JpZ0F0uAkw==
X-Received: by 2002:a17:906:c08f:: with SMTP id f15mr14158318ejz.97.1604922786745;
        Mon, 09 Nov 2020 03:53:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id h22sm4181760ejt.21.2020.11.09.03.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:53:06 -0800 (PST)
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
 <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
 <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
 <35581c32-8022-87e6-259d-84ea6aaebbae@redhat.com>
 <20201109114511.GZ4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3658b0a1-f6e4-b904-cd7d-2b173403fb8b@redhat.com>
Date:   Mon, 9 Nov 2020 12:53:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109114511.GZ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/9/20 12:45 PM, Andy Shevchenko wrote:
> On Sun, Nov 08, 2020 at 10:31:32AM +0100, Hans de Goede wrote:
>> On 11/7/20 4:26 PM, Andy Shevchenko wrote:
>>> On Sat, Nov 7, 2020 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 11/6/20 8:22 PM, Andy Shevchenko wrote:
> 
> ...
> 
>>> Thank you very much for the testing! I remember that I fixed debounce
>>> for BayTrail, but it seems I have yet to fix Cherry Trail pin control
>>> as a prerequisite to this patch.
>>>
>>> And like I said this series is definitely not for backporting.
>>
>> Independent of fixing the CherryTrail pinctrl driver to support this,
>> I strongly believe that -ENOTSUPP should be ignored (treated as success)
>> by this patch. Remember ACPI is not only used on x86 but also on ARM
>> now a days. We simply cannot guarantee that all pinctrls will support
>> (let alone implement) debounce settings. E.g. I'm pretty sure that
>> the pinctrl on the popular Allwinner A64 does not support debouncing
>> and there are builts using a combination of uboot + EDK2 to boot!
>>
>> The documentation for gpiod_set_debounce even explicitly mentioned that
>> -ENOTSUPP is an error which one may expect (and thus treat specially).
>>
>> The same goes for the bias stuff too.
> 
> While for debounce I absolutely agree with you I don't think it applies to
> bias. ACPI table is coupled with a platform and setting bias == !PullNone
> implies that bias is supported.

What about PullDefault ? I can easily see DSDT writers using PullDefault
on platforms where bias setting is not supported.

> If we break something with this it means:
> - ACPI table is broken and we need a quirk

Broken ACPI tables are as common as rain in the Netherlands, where ever
possible we want to deal with these / workaround the brokenness
without requiring per device quirks. Requiring a per device quirk for
every broken ACPI table out there does not scale.

> - GPIO library is broken on architectural level and needs not to return
>   ENOTSUPP for the flags configuration.

Usually we handle features not being implemented gracefully. E.g chances
are good that whatever bias is required was already setup by the firmware
(or bootloader in the uboot + EDK2 case). Making bias set failures a
critical error will likely regress working platforms in various cases.

Keep in mind we have an existing userbase where things is working fine
without taking the bias settings into account now. So if we hit the
-ENOTSUPP case on any platform out there, then that is a regression
plain and simple and as you know regressions are a big red flag.

Since it is really easy to avoid the regression here we really
should avoid it IMHO. What about just printing a warning on ENOTSUPP
when setting the bias instead ?

Regards,

Hans


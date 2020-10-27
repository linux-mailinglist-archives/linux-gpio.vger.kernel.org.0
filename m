Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE9929BB8D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 17:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1790734AbgJ0QSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 12:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38169 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1805652AbgJ0QBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Oct 2020 12:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603814463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cHc5FAeh+073yepAD+LL4ORq6sSueZ+RhB/WrI1rhbo=;
        b=V7InHLIr+bzXvrfd+DwU1uo6PrsVWbTIAflyFA35NCRht9OuWkEL82+VcM27KwMbBL1WQB
        jCR06EVtAk4eWjUFilCJxjfeTxY/1Cj57VkKk3aVA+NdWJ0zQ1h9/T3Tbmb3vdKlLJT3mN
        nVHK9ckQMf0vpSOh5MTYT4pcRZht/fQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-_QIgh8VMNi2YsV-jc57gcA-1; Tue, 27 Oct 2020 12:01:01 -0400
X-MC-Unique: _QIgh8VMNi2YsV-jc57gcA-1
Received: by mail-ej1-f72.google.com with SMTP id d13so1069079ejz.6
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 09:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cHc5FAeh+073yepAD+LL4ORq6sSueZ+RhB/WrI1rhbo=;
        b=lJeAzzX/NqWyLH/NjxdeAHMWJ2UjE+zZpl0G8MLj93xBEKfg6gD5zovOUE3KXtKcks
         eXFC+l6nu0IkVRi+3w7rXSr0wMcfMI1/tG/WtXFxTf5ocKo9faL8KOeSgtK6batNnauT
         nbCuNvNX3Fy8U/P8WOf/MsnOOiUlzYnHdEeydEnpuDHWszqFgsdHBXLWSCy6LK3+EBV6
         F//T7low2KnR5dEd1odT8fFDUZFQH6M6gkPlB6xL2K4txkZWiDa/lxA0tC7weFu7LYYM
         NFpgc+ddgZn4AxJaD+MO4ngKZ5jveMxJhUev14Xq4mfWaMYMawKTv02hfR6xnRMI51mf
         TtQA==
X-Gm-Message-State: AOAM530rUj+0ZgH0Taw8AyUjq68JrlGhDtFaxXIsFwe5wIhHYUgkFOlQ
        TLodEQXm80XFiLZpKoEf2DqyrNyohFlYYbulQYH1Ga+Y2zFIXJgl7sJo68lAToyjT0n+IYypZt4
        VMe5L6ookBbMM6pe9qFSiFA==
X-Received: by 2002:a17:906:5d9:: with SMTP id t25mr3028402ejt.443.1603814459639;
        Tue, 27 Oct 2020 09:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHZmd8jgZO6VIdKFwH/LXUa/TBSu5jcuLYbtrIBjoIESESqorzDNJEwz2XyTnTLLKNSTauiw==
X-Received: by 2002:a17:906:5d9:: with SMTP id t25mr3028382ejt.443.1603814459294;
        Tue, 27 Oct 2020 09:00:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id b8sm1204977edv.20.2020.10.27.09.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 09:00:58 -0700 (PDT)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk> <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
Date:   Tue, 27 Oct 2020 17:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/27/20 4:13 PM, Andy Shevchenko wrote:
> On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/26/20 11:54 PM, Coiby Xu wrote:
>>> Hi Hans and Linus,
>>>
>>> Will you interpret the 0x0000 value for debounce timeout in GPIO
>>> Interrupt Connection Resource Descriptor as disabling debouncing
>>> filter?
>>>
>>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
>>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
>>>
>>> I'm not sure if Windows' implementation is the de facto standard like
>>> i2c-hid. But if we are going to conform to the ACPI specs and we would
>>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
>>> can fix this touchpad issue and potentially some related issues by
>>> implementing the feature of supporting configuring debounce timeout in
>>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
>>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
>>> What do you think?
>>>
>>> A favorable evidence is I've collected five DSDT tables when
>>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
>>> an non-zero debounce timeout value for the edge type irq and for all
>>> the level type irq, the debounce timeout is set to 0x0000.
>>
>> That is a very interesting observation and this matches with my
>> instincts which say that we should just disable the debounce filter
>> for level triggered interrupts in pinctrl-amd.c
>>
>> Yes that is a bit of a shortcut vs reading the valie from the ACPI
>> table, but I'm not sure that 0 always means disabled.
>>
>> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
>> and the docs on "PinConfig()"  say:
>>
>> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
>> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
>> property is specified by multiple descriptors for the same pins, the order in which these properties
>> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
>> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
>> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
>> timeout, 0 should be used for GpioIo/GpioInt.*
>>
>> So that suggests that a value of 0 does not necessarily mean "disabled" but
>> it means use a default, or possibly get the value from somewhere else such
>> as from a ACPI PinConfig description (if present).
> 
> Nope, it was added to get rid of disambiguation when both Gpio*() and
> PinConfig() are given.
> So, 0 means default *if and only if* PinConfig() is present.
> 
> I.o.w. the OS layers should do this:
> 
>  - if Gpio*() provides Debounce != 0, we use it, otherwise
>  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
>  - debounce is disabled.
> 
> Now we missed a midentry implementation in the Linux kernel, hence go
> to last, i.e. disable debounce.
> But it should be rather done in gpiolib-acpi.c.
> 
> Hope this helps.
> 
> I Cc'ed this to Mika as co-author of that part of specification, he
> may correct me if I'm wrong.

I see, so then the right thing to do for the bug which we are seeing
on some AMD platforms would be to honor the debounce setting I guess ?

Can you and/or Mika write a patch(set) for this ?

> P.S. Does RedHat have a representative in ASWG?

I think so yes, but mainly focussed on server related things I guess...

Regards,

Hans


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E05929FCD8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 05:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJ3Eys (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 00:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3Eyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 00:54:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EB7C0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 21:54:47 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k9so2497556pgt.9
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 21:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AYm6LBgb7gkjxk146JV0bBOgWeS48lTJuMc/ZNaPwxA=;
        b=lzRcM5tDOhiYgjnssxP4imcYKpiRtYMTGv0mrynZWFQzuaGyPo7utcsf7rb6m6gfcq
         3uDNfDpvxFy9OJMYOeK5j/OM5kCU5pP/KwxXxuO57IIOBzORb47HRTUuYDJxy1SLxuvp
         Ege5KOLV2+z8Lt/7Suw91NZkXShAVQRh2Oj+lwi1G+zPXbIdKpckk9UFt3dp0b9Jn94I
         bFbRP0JjzeW4JROoVRycLASBPxjnFgTq5hMe5aSffJKf9ULgc5kT4aBt3DhrYiKSeKMy
         p/v+49NrpC8rrW11YedNwYc5nYtP+BF4MVdmTMS9kulYYAxk0WvDklsnDG4Y8ZqeZB39
         FZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AYm6LBgb7gkjxk146JV0bBOgWeS48lTJuMc/ZNaPwxA=;
        b=qpX5FN235pIB+Z+x6UIwcMPOkFtaIB5eAoRhQol8Jn5ZGcSihii9Ci2WExVvf8VDOq
         hE3P9TiYU2dFYlBs90yRQVTTGMeCydiJ4PnMA2Ecfta8A5jT2B7IAvTFrwdY4ZnCpIUD
         diFOBcCpbvTx+1lAPVV9wJFdPrfoGVsbvG348v7qfZrwO1tuk2u1XBXlrlanxke59hj9
         22Hew1EIQApwRo4NKgWVfyT0l6S9rBj2kFCb7Fy4k5wHpKTh4FAwuH3zvNETfVdDvOy6
         W6UGebbVUBBqL+gbGU3RJacksgKI2LxuPwYy8U+ac3MXmAYpMAns0IOIt3iCQ0dkU5BS
         +1QA==
X-Gm-Message-State: AOAM533CcSi0GmShBL78YASuTMJXCNOqZFeRDLauoBM4Fnj2S+zsJS7x
        HlOgTwK5BcgrP38knG+ih2M=
X-Google-Smtp-Source: ABdhPJxPjf3j4NOTZTKN7+m2Ge5Q8PyhAP4ehXG3+bqo+/mKFXK3tgSNTAu2St975lUDEbsL4a403w==
X-Received: by 2002:a05:6a00:225c:b029:163:916f:bbf0 with SMTP id i28-20020a056a00225cb0290163916fbbf0mr7482694pfu.46.1604033687218;
        Thu, 29 Oct 2020 21:54:47 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id d10sm4193004pgk.74.2020.10.29.21.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 21:54:46 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 30 Oct 2020 12:54:21 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201030045421.si3r5zsbeeyhkwns@Rk>
References: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
 <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
>On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/27/20 4:13 PM, Andy Shevchenko wrote:
>> > On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> >> On 10/26/20 11:54 PM, Coiby Xu wrote:
>> >>> Hi Hans and Linus,
>> >>>
>> >>> Will you interpret the 0x0000 value for debounce timeout in GPIO
>> >>> Interrupt Connection Resource Descriptor as disabling debouncing
>> >>> filter?
>> >>>
>> >>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
>> >>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
>> >>>
>> >>> I'm not sure if Windows' implementation is the de facto standard like
>> >>> i2c-hid. But if we are going to conform to the ACPI specs and we would
>> >>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
>> >>> can fix this touchpad issue and potentially some related issues by
>> >>> implementing the feature of supporting configuring debounce timeout in
>> >>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
>> >>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
>> >>> What do you think?
>> >>>
>> >>> A favorable evidence is I've collected five DSDT tables when
>> >>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
>> >>> an non-zero debounce timeout value for the edge type irq and for all
>> >>> the level type irq, the debounce timeout is set to 0x0000.
>> >>
>> >> That is a very interesting observation and this matches with my
>> >> instincts which say that we should just disable the debounce filter
>> >> for level triggered interrupts in pinctrl-amd.c
>> >>
>> >> Yes that is a bit of a shortcut vs reading the valie from the ACPI
>> >> table, but I'm not sure that 0 always means disabled.
>> >>
>> >> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
>> >> and the docs on "PinConfig()"  say:
>> >>
>> >> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
>> >> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
>> >> property is specified by multiple descriptors for the same pins, the order in which these properties
>> >> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
>> >> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
>> >> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
>> >> timeout, 0 should be used for GpioIo/GpioInt.*
>> >>
>> >> So that suggests that a value of 0 does not necessarily mean "disabled" but
>> >> it means use a default, or possibly get the value from somewhere else such
>> >> as from a ACPI PinConfig description (if present).
>> >
>> > Nope, it was added to get rid of disambiguation when both Gpio*() and
>> > PinConfig() are given.
>> > So, 0 means default *if and only if* PinConfig() is present.
>> >
>> > I.o.w. the OS layers should do this:
>> >
>> >  - if Gpio*() provides Debounce != 0, we use it, otherwise
>> >  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
>> >  - debounce is disabled.
>> >
>> > Now we missed a midentry implementation in the Linux kernel, hence go
>> > to last, i.e. disable debounce.
>> > But it should be rather done in gpiolib-acpi.c.
>> >
>> > Hope this helps.
>> >
>> > I Cc'ed this to Mika as co-author of that part of specification, he
>> > may correct me if I'm wrong.
>>
>> I see, so then the right thing to do for the bug which we are seeing
>> on some AMD platforms would be to honor the debounce setting I guess ?
>>
>> Can you and/or Mika write a patch(set) for this ?
>
>I will look at it, but meanwhile I would postpone until having a
>Mika's Ack on the action that my understanding and course of actions
>is correct.
>
If you don't mind, let me write this patch(set) instead:) I feel itchy
to fix this touchpad issue by myself after spending about a month of
my internship at Linux Foundation investigating this touchpad issue.
There are many enthusiastic Linux users waiting to get their touchpads
fixed and I could prioritize this task since I don't have other
obligations. I have provided a fallback solution [1] to save their
touchpads but it seems patches on gpiolib-acpi.c and pinctrl-amd could
reach mainline kernel much earlier.

[1] https://lore.kernel.org/patchwork/patch/1323245/
>> > P.S. Does RedHat have a representative in ASWG?
>>
>> I think so yes, but mainly focussed on server related things I guess...
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby

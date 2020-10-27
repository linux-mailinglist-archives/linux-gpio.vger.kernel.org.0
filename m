Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF7E29BEAA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 17:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1813723AbgJ0QyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 12:54:00 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:32818 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1794515AbgJ0PMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 11:12:13 -0400
Received: by mail-pl1-f169.google.com with SMTP id b19so920134pld.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fYhKRNsaOy3JuzY6NhRsKUEpvHRxtWk36nnZxTv5ieA=;
        b=AZek2jkJ/KZFif825xn+A21+EJA9urYrYd1myv9zoRuCI24F2kXMCK88hU73y6EcTH
         kInZWUk4wpO6pr7th6UhldD7zTStkwpHqkIJ0foJqtZNQOcdQ64mjRaLNELCdnDLoER7
         O2sTI4kGq9fVvn2/Chx7nuYpFa9bdNlFspRE11sSt2fYOfduUgWvFrW3ViBkx3NkDJcu
         8zTVKU007+RFXual6FS53iXC7WbhXc5Sxe7AwZ75UQxk9IloK4rbWs61sAe8/7A/SUqE
         THvwJzjGpSPQZA5hfMesP6q+vYtxdoDT+GSsb9bwAnNFZTJ9XPz0hMh+7ctTGhLmpYZ6
         kFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYhKRNsaOy3JuzY6NhRsKUEpvHRxtWk36nnZxTv5ieA=;
        b=kW99UWOJG+3bpmK4qOEdlsB/6gawqjCkGV37QwbZwSvG+CB93GFLyQpWZ21OFJdFYy
         xCO1sVPSxiN4VKEo7BtePeUUQWogUGjkDIEcPA2zF/UBfyfgOg2lVFdcBeoc3r94G9A2
         S6+Ab1wA8eimcWwlEDj1X3369QqgEBfS+kDf2V83nBY/YcFIAB0CBktcUgLjJF+TkTdB
         6WK+ZwyHVvMViRPoM4fCg+jqytheP9/IeXKSSy2jbiuKZnrqyk9a9xFQHlOuYnDhZy6W
         +Z7nZcCIYU0ROg9wgso98MytcDWJPCsgS72NTr+Yc+tSY155RC1uKVZmOKI2py1t/7or
         Ov9A==
X-Gm-Message-State: AOAM532NGNWf4sylBFhJZv6Uw4aTrc68OV2DEUSgFoJrwMcB1GC1pDWm
        FT/OEWn9nbfqdy/0MeRaxreAVgOMObsXeYW8W9k=
X-Google-Smtp-Source: ABdhPJw5SRTL/8aywZLHxAqxg1wfqEDOV0gbmbztTKWxkLkyFNeeUAPqE1tMr9vb4y7PHSW2eVHwMwzRrYClAgR7Bqs=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr2359857pjs.181.1603811531781;
 Tue, 27 Oct 2020 08:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk> <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk> <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com> <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk> <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk> <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
In-Reply-To: <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 17:13:00 +0200
Message-ID: <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/26/20 11:54 PM, Coiby Xu wrote:
> > Hi Hans and Linus,
> >
> > Will you interpret the 0x0000 value for debounce timeout in GPIO
> > Interrupt Connection Resource Descriptor as disabling debouncing
> > filter?
> >
> > GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> > ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> >
> > I'm not sure if Windows' implementation is the de facto standard like
> > i2c-hid. But if we are going to conform to the ACPI specs and we would
> > regard 0x0000 debounce timeout as disabling debouncing filter, then we
> > can fix this touchpad issue and potentially some related issues by
> > implementing the feature of supporting configuring debounce timeout in
> > drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> > configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> > What do you think?
> >
> > A favorable evidence is I've collected five DSDT tables when
> > investigating this issue. All 5 DSDT tables have an GpioInt specifying
> > an non-zero debounce timeout value for the edge type irq and for all
> > the level type irq, the debounce timeout is set to 0x0000.
>
> That is a very interesting observation and this matches with my
> instincts which say that we should just disable the debounce filter
> for level triggered interrupts in pinctrl-amd.c
>
> Yes that is a bit of a shortcut vs reading the valie from the ACPI
> table, but I'm not sure that 0 always means disabled.
>
> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
> and the docs on "PinConfig()"  say:
>
> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
> property is specified by multiple descriptors for the same pins, the order in which these properties
> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
> timeout, 0 should be used for GpioIo/GpioInt.*
>
> So that suggests that a value of 0 does not necessarily mean "disabled" but
> it means use a default, or possibly get the value from somewhere else such
> as from a ACPI PinConfig description (if present).

Nope, it was added to get rid of disambiguation when both Gpio*() and
PinConfig() are given.
So, 0 means default *if and only if* PinConfig() is present.

I.o.w. the OS layers should do this:

 - if Gpio*() provides Debounce != 0, we use it, otherwise
 - if PinConfig() is present for this pin with a debounce set, use it, otherwise
 - debounce is disabled.

Now we missed a midentry implementation in the Linux kernel, hence go
to last, i.e. disable debounce.
But it should be rather done in gpiolib-acpi.c.

Hope this helps.

I Cc'ed this to Mika as co-author of that part of specification, he
may correct me if I'm wrong.

P.S. Does RedHat have a representative in ASWG? If any ambiguity is
still present, feel free to propose ECR (IIRC abbreviation correctly)
to ASWG.

> So I see 2 ways to move forward with his:
>
> 1. Just disable the debounce filter for level type IRQs; or
> 2. Add a helper to sanitize the debounce pulse-duration setting and
>    call that when setting the IRQ type.
>    This helper would read the setting check it is not crazy long for
>    an IRQ-line (lets say anything above 1 ms is crazy long) and if it
>    is crazy long then overwrite it with a saner value.
>
> 2. is a bit tricky, because if the IRQ line comes from a chip then
> obviously max 1ms debouncing to catch eletrical interference should be
> fine. But sometimes cheap buttons for things like volume up/down on tablets
> are directly connected to GPIOs and then we may want longer debouncing...
>
> So if we do 2. we may want to limit it to only level type IRQs too.
>
> Note I have contacted AMD about this and asked them for some input on this,
> ideally they can tell us how exactly we should program the debounce filter
> and based on which data we should do that.


-- 
With Best Regards,
Andy Shevchenko

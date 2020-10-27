Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C13D29BAA0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 17:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754966AbgJ0QJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 12:09:13 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44329 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1806860AbgJ0QJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 12:09:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id t6so473402plq.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y8z713XlayESH339Gp0VA0pxVEZrHHHC1564eAGVGao=;
        b=NumASSN5jUGYa6e5z22XehydqEuDytI4MnptHFy12+L7djPz4ENXxNeSTt8AUpwpbB
         e0o2xgt4N2sAtEC3XKrqQ1QMWH6Xeh0zbkKofMJkByOwtn6kFUEgdeYAdPEUy5mbmxeL
         iQApgLUgSL3DsxMER2bJ2GVtl1wxyhPppNCCw2B95tepbbefUytZHVC/RdMMBWb6m0/S
         +GOF9lGzFzvAZ6Tte7HivoAELh4vRVCjhZRLHX6nlPwmlM2gHLv+UhR8c5ONoeBOXoe+
         CKnDnmURtNcns/625CYiXS+Tp11k71VLmQizLT4J3uZ692I3y3dXiTHzWntBzkxt3kEq
         ji2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8z713XlayESH339Gp0VA0pxVEZrHHHC1564eAGVGao=;
        b=b3QFtSz8CP7k8ZCban+4uJ9Ucr3wi1OhDcFjCjwjbKqwio7JJB3TTRYQXskD1ATZjr
         ZuwuFM2ZadixIGmgcSZUcFNLObsZ6ssSxJK9JXXaVPIqe+1xW7O7Zhioa4dLqtOXs2ub
         VRJEoylYkK6o3OE8ABKY3Ylj9rBwRYh/2eVnPzapyFn6cgREHmVlb2ydhm5uRQagrFqc
         Aor6Py8qjTRzC+4G+N+py7QN7BX7t9bIr8tIi0Kr6aaNFoTpA6RvWbBaeSavemXvevgg
         Am2C41Fxslrwm4GI4+JtMK5fz6iq1STm3opDvJrEbAY5l2TXzo2u4xkRdnMBAQNLJ/oP
         SuRA==
X-Gm-Message-State: AOAM530S4YtoWykI67e7UtdKV2g5S8qyQARGs1CpFYOsGH5wiMY9LaYi
        hqdqj9OFvANv+FJz/KH3VUeaHbiFXa92cok0Fz0=
X-Google-Smtp-Source: ABdhPJwnRuw6kfpLU6usrKj8k9y5UpG9W4uTmoM226PnUmWKyb6+ZHmI86szqWRZzz77ikQ9UMC5mgmvMFEAAnXWNfk=
X-Received: by 2002:a17:902:7442:b029:d6:4773:7cdc with SMTP id
 e2-20020a1709027442b02900d647737cdcmr3310063plt.21.1603814941169; Tue, 27 Oct
 2020 09:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk> <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk> <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com> <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk> <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk> <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com> <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
In-Reply-To: <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 18:09:49 +0200
Message-ID: <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>,
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

On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/27/20 4:13 PM, Andy Shevchenko wrote:
> > On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 10/26/20 11:54 PM, Coiby Xu wrote:
> >>> Hi Hans and Linus,
> >>>
> >>> Will you interpret the 0x0000 value for debounce timeout in GPIO
> >>> Interrupt Connection Resource Descriptor as disabling debouncing
> >>> filter?
> >>>
> >>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> >>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> >>>
> >>> I'm not sure if Windows' implementation is the de facto standard like
> >>> i2c-hid. But if we are going to conform to the ACPI specs and we would
> >>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> >>> can fix this touchpad issue and potentially some related issues by
> >>> implementing the feature of supporting configuring debounce timeout in
> >>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> >>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> >>> What do you think?
> >>>
> >>> A favorable evidence is I've collected five DSDT tables when
> >>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> >>> an non-zero debounce timeout value for the edge type irq and for all
> >>> the level type irq, the debounce timeout is set to 0x0000.
> >>
> >> That is a very interesting observation and this matches with my
> >> instincts which say that we should just disable the debounce filter
> >> for level triggered interrupts in pinctrl-amd.c
> >>
> >> Yes that is a bit of a shortcut vs reading the valie from the ACPI
> >> table, but I'm not sure that 0 always means disabled.
> >>
> >> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
> >> and the docs on "PinConfig()"  say:
> >>
> >> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
> >> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
> >> property is specified by multiple descriptors for the same pins, the order in which these properties
> >> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
> >> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
> >> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
> >> timeout, 0 should be used for GpioIo/GpioInt.*
> >>
> >> So that suggests that a value of 0 does not necessarily mean "disabled" but
> >> it means use a default, or possibly get the value from somewhere else such
> >> as from a ACPI PinConfig description (if present).
> >
> > Nope, it was added to get rid of disambiguation when both Gpio*() and
> > PinConfig() are given.
> > So, 0 means default *if and only if* PinConfig() is present.
> >
> > I.o.w. the OS layers should do this:
> >
> >  - if Gpio*() provides Debounce != 0, we use it, otherwise
> >  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
> >  - debounce is disabled.
> >
> > Now we missed a midentry implementation in the Linux kernel, hence go
> > to last, i.e. disable debounce.
> > But it should be rather done in gpiolib-acpi.c.
> >
> > Hope this helps.
> >
> > I Cc'ed this to Mika as co-author of that part of specification, he
> > may correct me if I'm wrong.
>
> I see, so then the right thing to do for the bug which we are seeing
> on some AMD platforms would be to honor the debounce setting I guess ?
>
> Can you and/or Mika write a patch(set) for this ?

I will look at it, but meanwhile I would postpone until having a
Mika's Ack on the action that my understanding and course of actions
is correct.

> > P.S. Does RedHat have a representative in ASWG?
>
> I think so yes, but mainly focussed on server related things I guess...


-- 
With Best Regards,
Andy Shevchenko

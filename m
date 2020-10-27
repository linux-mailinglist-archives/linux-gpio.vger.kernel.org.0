Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE42929A86B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 10:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409649AbgJ0Jwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 05:52:32 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37014 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409320AbgJ0Jwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 05:52:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id 126so605296pfu.4
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wh2Hw8EQyBD0Ddx8+aLTmA94GJKfHflrTQAtGiNwqjA=;
        b=k7S+sBnOSCWLi9gS94OK1suhL54C/xa8qk9PbC2/Ct/ad7G5m7J95qIOWJH1g3fQ32
         fEDDJgNe5Y0II0MgJogToX8CB9MCU0JyuItlUzVy7j9AMDMhssKRF5oIHu7QQ0HhIJvP
         AqCk86+NVzY8NfgsUNq6CFPGnCWwRhKPArXfdNQGqu9lR7YydzWxKdgQ4iH4rK8j+hT2
         qAe92PSiDmVPwrmr1TkyaEROrbh9tzoq1T6fx/UgtP4ujAVacDlmA7TG1c7b1DBtzZe4
         VFpKY3eubAqb+FJau8xRuMbjMpiHrdsFnEsZ2qHh+5euSdreoPGoU+oJmveVzxWtYar8
         VHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wh2Hw8EQyBD0Ddx8+aLTmA94GJKfHflrTQAtGiNwqjA=;
        b=D1FN05Eb0nxXqDWh6KGwTqkOs/6GtavykQaYx5/2JM6euXdsR8W9fb5ghqVnOn0hKY
         GcbrP3ycAOUfPRwfLEoeblHUIF5Egds2aLeNGzP0l+zaopVEtR+O0ycOyz79CIw+oUrx
         zB7kJuqVlUXlFMIjXOu5vUYuH8PNnicTOnGsZmtm5cSCUCQomYdAF9c0/e5LctLO+7SM
         3uk/gxsXxnc8iyKdiqsm9yNJR6nS9Lp28h1+4pBsFb2qse/E45qlxntPJPixzdyMoRWQ
         ZFY4UDPF24/Vp1nQ+SSY8yzD1ZIJQVZcUUMyrx68OtIPjssV4B3sz2Hfov8cdpMUVUGe
         7+ug==
X-Gm-Message-State: AOAM531u9nW//m9rCGo13aeoNWM62LXEImXnTmjUb2Ys4uATQRp55K0n
        KMiAG6yBmFWlnLfE/2lJ5wIZwunW2s0ByXMY+kU=
X-Google-Smtp-Source: ABdhPJzkEGgGZewNw2BKSvNe4Bk+gwQcxoZALl2cLT2PGihJey9WvkfVQ7IeOXbSMrNRHG8AAjNGmkQ6k5q3zbonpEA=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr746550pfd.7.1603792350629; Tue, 27 Oct
 2020 02:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk> <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk> <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com> <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk> <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
In-Reply-To: <20201026225400.37almqey2wxyazkn@Rk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 11:52:14 +0200
Message-ID: <CAHp75VeGs6v7EKfQ30YPf8gUE+fftUP3V8HRif7P9xs1wkXcKg@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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

On Tue, Oct 27, 2020 at 2:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi Hans and Linus,
>
> Will you interpret the 0x0000 value for debounce timeout in GPIO
> Interrupt Connection Resource Descriptor as disabling debouncing
> filter?
>
> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}

According to the spec

DebounceTimeout is an optional argument specifying the debounce wait
time, in hundredths of
milliseconds. The bit field name _DBT is automatically created to
refer to this portion of the resource
descriptor.

I interpret this as 0 == no debounce (or a minimum that hardware has
if there is no possibility to disable).

> I'm not sure if Windows' implementation is the de facto standard like
> i2c-hid. But if we are going to conform to the ACPI specs and we would
> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> can fix this touchpad issue and potentially some related issues by
> implementing the feature of supporting configuring debounce timeout in
> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> What do you think?
>
> A favorable evidence is I've collected five DSDT tables when
> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> an non-zero debounce timeout value for the edge type irq and for all
> the level type irq, the debounce timeout is set to 0x0000.

To the future mails: please, do not top-post.
And please remove a huge amount of unrelated lines in the reply.

-- 
With Best Regards,
Andy Shevchenko

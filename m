Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFC3289162
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 20:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbgJISsM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 14:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731698AbgJISsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 14:48:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9534CC0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2020 11:48:10 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t18so4884256plo.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2020 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8qd+54DX5qNy3x1OhOygmzlIWuwYA+oIN0nfIoRWLY=;
        b=JAMOjRply2fZVvSQ1pqk37WyyUryNZuASmTjOF+r85x8i00YapmWKTmZlKGKCVZRlc
         i+gffNK9vJW/pRbrLHk8Smjk5TX23rE0Lprjtf5IYTU4t2/4O+G0CwbhK55YRvtgEvc9
         PhfDmWDyyRMVukWfWZPb/Cldg9KXm6ZlkYEz++bbuRTc9Tfo1zTLw6mXyTVYnlbX7S7e
         9by7Hxfc4iGZoCl+Z9slN7mGFXO8syrJx/uCgWxSQ3qN89QI/M7ijdOmySGO7Ps+DF8e
         qXAEAy7h27NS/X5F5XTk5iTN4X5gl4t+dhKsRFgkOXxB34gE3M9G3zlCjZVlKu6cEXYU
         NFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8qd+54DX5qNy3x1OhOygmzlIWuwYA+oIN0nfIoRWLY=;
        b=piBIiVcShLJEVKDN6/7wLGFoUZQTaS8sVdpAkhHkuwbRrXKLYknX3VMwkPcTBdU4Y6
         hKp/e5yXABb6/iSu7ERzO24NIrCu0BeVsND6grfnaZM67oYuI9eKuiqeKuL3ksfeWY6g
         Zlx1Kbys0mJbu+w0TKnCVp0L+Ta1cD0xchehW+3mv3QS/Crpv5GIXVQFNQO3XPyFXNMt
         /lpPYYihO0LDorchcSG10GjqBEodopyzpTZjH+MlyWVjqWhWic6WVsuJ3YWl/1xwt18N
         rPAqsuAV4Pbc+qYvrKo0Pd8PN28LqCzhDmxfsCoDwzdW0lgNqlPlPMCr2q86r48cDzOU
         MqIA==
X-Gm-Message-State: AOAM530tVLLYm0aUgKYOOKSSO94hJ9GRP3j6fse3FfRPnLIS3dCCurDB
        umH/mHvPbGfaIvrr2WBdx5Ryc1ezjlLbLZ6LXfdWuN1DJSiTZu6G
X-Google-Smtp-Source: ABdhPJwK3QnOV99bflTdK1x5oTIhblasvxwoMLWFTaXZPLD7IlIHURCWQFLZFM4tusPzelp8hTcgfRJJKEBW/Tkh8vU=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr13606041plr.0.1602269290011; Fri, 09
 Oct 2020 11:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <7102c0df-8d8b-4ef8-babf-a920ff11bcf8@www.fastmail.com>
In-Reply-To: <7102c0df-8d8b-4ef8-babf-a920ff11bcf8@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 21:48:59 +0300
Message-ID: <CAHp75Vd-P56=4PibajRcdnniy2pN6ZXoUP=FiJ1enrFzxKkojg@mail.gmail.com>
Subject: Re: Specifying a valid pullup value for pinctrl_intel from an ACPI table
To:     Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: relevant people (Hans just in case mostly for his information)


On Thu, Oct 8, 2020 at 8:58 AM Jamie McClymont <jamie@kwiius.com> wrote:
>
> Background
> ==========
>
> Hi all
>
> I am looking to write a driver for a fingerprint sensor found in my laptop.

Can we know more about it? Model? Vendor? Ah, I see below.

>  The
> device has an SPI plus interrupt and reset lines, specified like so:

Cool!

>    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
>    {
>        Name (RBUF, ResourceTemplate ()
>        {
>            // SPI
>            SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
>                ControllerInitiated, 0x00989680, ClockPolarityLow,
>                ClockPhaseFirst, "\\_SB.PCI0.SPI1",
>                0x00, ResourceConsumer, , Exclusive,
>                )
>
>            // Interrupt
>            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
>                )
>                {   // Pin list
>                    0x0000
>                }
>
>            // Reset
>            GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
>                )
>                {   // Pin list
>                    0x0008
>                }
>        })
>        CreateWordField (RBUF, 0x3B, GPIN)
>        CreateWordField (RBUF, 0x63, SPIN)
>        GPIN = GNUM (0x02000017)
>        SPIN = GNUM (0x0202000A)
>        Return (RBUF) /* \_SB_.SPBA._CRS.RBUF */
>    }

Yes, looks pretty much standard. I guess I have to insist our firmware
engineers to tell me a bit more about GNUM() macro so we can extend
documentation (in short, it takes 4 parameters, like bytes in 32-bit
value to define pin, group of pins, community in GPIO controller and
converts that to a GPIO number related to the controller).

> The issue
> =========
>
> Currently, I call devm_acpi_dev_add_driver_gpios (index 1 for the reset line),

(Also possible to use index 0 with GPIOIO_ONLY quirk, but it's not recommended)

> then try to access it with devm_gpoid_get, which fails with -EINVAL.
>
> From some kprobe use, I see that the EINVAL appears to stem from
> intel_config_set, which gpiod_direction_output calls (indirectly) with the
> config 0x205 -- I understand this to mean PIN_CONFIG_BIAS_PULL_UP with the
> argument 1,

Hmm... Should be 0x105, otherwise 2 is an argument.
Can you confirm it's for real 0x205?

> whereas the function expects a specific resistance value; one of {20000,
> 5000, 2000, 1000}.

Nice catch! I need to check this.
Yes, it seems it misses the fact that arg=1 when bias is set via GPIO subsystem.

> The problematic call stack, as ftrace sees it (the leaf function is in fact
> intel_config_set_pull):
>
>     devm_gpiod_get
>     devm_gpiod_get_index
>     gpiod_get_index
>     gpiod_configure_flags
>     gpiod_direction_output
>     gpio_set_bias
>     gpiochip_generic_config
>     pinctrl_gpio_set_config
>     pinconf_set_config
>     intel_config_set
>
> The question
> ============
>
> Any suggestions as to how this invalid configuration gets produced from the
> DSDT, and what the best workaround would be?

Fixing the driver would be the best.
Thanks for the report, I'm on it!

> I'm assuming that pullups sometimes get correctly configured purely from ACPI,
> and this is hitting some edge-case?
>
> I'm running 5.8.13 -- if anyone has an inkling that this is a bug that has since
> been fixed, I'm happy to try and use a more recent kernel.

It's always recommended to test at least last vanilla (as of today
v5.9-rc8) and latest linux-next [1]

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/

> Hardware
> ========
>
> Laptop is a Huawei Matebook X Pro
> CPU is an Intel i5-8250U (the specific pinctrl is pinctrl_sunrisepoint)
> Peripheral is a Goodix GXFP5187
> The pin number is 58, seemingly named UART0_RTSB
>
> Disclaimer
> ==========
>
> This is my first foray into kernel development and I've been guessing at a lot of things -- please excuse any silly mistakes :)

It's fine, thanks for the detailed report!

--
With Best Regards,
Andy Shevchenko

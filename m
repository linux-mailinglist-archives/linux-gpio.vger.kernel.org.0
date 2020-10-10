Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6CA28A257
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 00:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731310AbgJJW5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 18:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388035AbgJJUqm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Oct 2020 16:46:42 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E15FC0613D0
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 13:46:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r21so6946227pgj.5
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 13:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rE0dIynQwG6q4BairXo2itoxLJxN0IanlzP9BJTruT8=;
        b=oHetx7Mqeqp7LEnWbTGOhD0LpJYZdj90r/hOX+JlxGataPliWkrUL0mCmN+BYL5wzV
         wWlnr6G+IC6zj2N/w68VLBRFruYhIqt28+xciZGNIlJe3/6FlXVSxGcLTsJjg0EwljXw
         eIkrDpZJ/DwgBOrJmY6yJVzN/BHD2/9kW93c2Cg3zrgjvfP675WwSJjLuWjUyUYAiMyN
         r7s8tje0QbZTRoE1Vnc3isFFl8b06pDfNclE7Cu0eimHelLXKr1JqFL+xOO6B0OCfW5Y
         Ul+7WelE7LPrq+IVeoyz8DKu9mgIR7U1mhcdTno4cMihRKlVPgAXQLuReUTGXWE9OS5O
         8mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rE0dIynQwG6q4BairXo2itoxLJxN0IanlzP9BJTruT8=;
        b=WsOoKAmRDdXsk9SRK1TEyqWnNz5RHak0beGRbGY4sZNaun36Sm3nd5b3i3sy54iOfM
         /onVRjTqkwLmXDdQ1IqYcX4myOEZyzW+ZLAlR4qbq/GJxEu+gz3Dq4rWJwB2C3rZVaYZ
         D29TwVz74F7HiSvs/p0NY8IlDE7oFLTEiN7oLnGzujr5EZdK1EJ4Rpwvk3mwSHEMjiCK
         NdlbIC3R+egzvIujjeCyZvYh+KR6jsYS/Oyl1x/xLpjmpukNPPTApggu+ntMtJOWKKFW
         4Txm8y5vD9b14fgZ77ahxPld9tmgFjcel3VDZ5KjixzoEd7hBpUdTvDUdhw7oHf3vWM5
         6w4w==
X-Gm-Message-State: AOAM532hQPeH6IQw2CLL0clX71vKQ7+wh5/SRviQZ1b5qCJCOfbSZvaf
        TQ4smtBMYZQTJjNpEPs8XmuUD9vYAy/Y+x9dzttKxv8vunz56A==
X-Google-Smtp-Source: ABdhPJxcUtXxZb/uSx4VpzQqgiClJD+14t4ReNuOwhGQGNZWveGlYoVqlP9kcaZm/jlGtZHoiB4HuzrlgC/JITfHzFk=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr12053061pjb.228.1602362794509;
 Sat, 10 Oct 2020 13:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <778e96d4-1695-43ee-90d6-86cc34b20418@www.fastmail.com>
In-Reply-To: <778e96d4-1695-43ee-90d6-86cc34b20418@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 10 Oct 2020 23:46:18 +0300
Message-ID: <CAHp75Vf2-4zX0rh5VtBze=so8nYDav3yOMuYTwodBNhvGmvQ4A@mail.gmail.com>
Subject: Re: Configuring bias on an APCI GpioInt
To:     Jamie McClymont <jamie@kwiius.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 10, 2020 at 11:58 AM Jamie McClymont <jamie@kwiius.com> wrote:
>
> Hi again,
>
> I have run into a second GPIO issue while writing a driver for the fingerprint sensor in my laptop*, configured in the ACPI table like so:
>
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
>
> I call devm_request_threaded_irq with the number provided in the irq field of the `struct spi_device` during the spi_probe.
>
> This configures the right IRQ number, and it triggers when it should, but it stays asserted for 140ms-600ms after it should have been cleared.

I was wondering how it works since it should have the same issue as
with a regular GPIO. Now I understand that we simply ignore bias for
GpioInt() resources. If you enable it, we come to the same issue. So,
first we have to fix set bias followed by enabling it for GpioInt()
resources.

I will look closer at this next week.


> Given it's an active-low level-triggered interrupt with a pull-up requested by the acpi table, my theory is:
>
> * The interrupt line is driven open-drain by the peripheral
> * The pullup is not being correctly configured
> * It is slooooowly pulled up by leakage current of the GPIO input, hence the interrupt being cleared after 140-600ms
>
> Looking at traces and confirming by source code**, it seems that no code ever attempts to configure the pin's bias during the irq setup.
>
> Is this a bug, or should I be manually setting up the GPIO some other way before requesting the IRQ?
>
> Thanks
> - Jamie McClymont
>
>
> *Hardware details
> ==============
>
> Laptop is a Huawei Matebook X Pro
> CPU is an Intel i5-8250U (the specific pinctrl is pinctrl_sunrisepoint)
> Fingerprint Sensor is a Goodix GXFP5187 (not well-documented anywhere, I'm working through reverse-engineering)
>
> ** Tested on 5.9-rc8, but I've been reading the source of linux-next and haven't picked up on any relevant differences



-- 
With Best Regards,
Andy Shevchenko

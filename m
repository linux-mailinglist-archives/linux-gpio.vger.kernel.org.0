Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310FD28E0DF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 14:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgJNM5v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 08:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgJNM5v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 08:57:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C60C061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 05:57:51 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o3so1887213pgr.11
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 05:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7aTMOa1mBsnSXeqQqysRrKQvwfwiXsy7/P8C1uwptHw=;
        b=WVB2qRBslTPyqDSJkjyGNqeYRi34o8rzg9V6sLIQU8iwV1Asaj6DFV8PiITka+aZP6
         +TSrJ5lXgfYBf0h04HB/emueUpXWTOvdqNMJ8g5jg8RnMi4R0ruPf38cKtAs03qGQxBn
         3XFun+QVV9coXOuW0pC6nxDpFGQoGe85B79l1fZgGmDPYLgUToWQ0KoYrtlku4urjaCq
         ZE04Xcyv7Jcj3OTv5AFDZtG1FMDa0MwpLOb+Wm6WTNj7iTr2wN2kUW9SxSYqGqOuxop1
         rh/5RXzXvJBm6RZVyb/KrKkTxP6NqaNev2pDpt9hMuGYdSygzjy1pHKbGtFU6jsA0u+v
         YQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7aTMOa1mBsnSXeqQqysRrKQvwfwiXsy7/P8C1uwptHw=;
        b=YruMqfFDXk81JBmlbet6V0cob+9lFopL8er5RZqPtm1RuPmDzoZx+CINUCv8TbrAC6
         4Mww2sk2bsIzbTjsKkczkKadYldsqnqqacVg0r6xFoFqTWlFnxfgoypkZb7CoTdc2gnG
         mmUHMjveI3LHiUnn4jlIxTLfpmQc8KTaxQLctX859b15HEzAgDhNszoxSE/hO4Cv+1vq
         W0ybRyB7YdYOeY96otyLn5sfqdV4YaIKtu6gWcBr0YzlxrSE5b3P0nWKaIdOUEW1wdSm
         JE+nENgA2ayiF39yDaQvp1viDHOH6xGYZohVo8QjZGCAp5rvYuEBVI3pYDDzeQ4x0MD7
         eW1w==
X-Gm-Message-State: AOAM531ouy/o32A7aDXNIJjn7RC2S8OGCBH4dgu5qCvYID6wHj9AMCan
        S+Q6AWE5RVK57gsH9wsfMNkqwPw6y2lND7wmfyXA5hE9RbhRV4Sd
X-Google-Smtp-Source: ABdhPJyrA19NyT64GbKB5+Zmoz99IAPJ4x3KmmEv/sqAeDJelk2+NuzTD/3oEN4dmIIVDQoYt1ZKPfF1U7Q4dKCzrGc=
X-Received: by 2002:a62:5e81:0:b029:152:2f99:d9e3 with SMTP id
 s123-20020a625e810000b02901522f99d9e3mr4144116pfb.7.1602680270544; Wed, 14
 Oct 2020 05:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <778e96d4-1695-43ee-90d6-86cc34b20418@www.fastmail.com> <CAHp75Vf2-4zX0rh5VtBze=so8nYDav3yOMuYTwodBNhvGmvQ4A@mail.gmail.com>
In-Reply-To: <CAHp75Vf2-4zX0rh5VtBze=so8nYDav3yOMuYTwodBNhvGmvQ4A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Oct 2020 15:58:39 +0300
Message-ID: <CAHp75VcBs-dYDCxch6zdFrdeiqO3U+hFhx4YRwriRFOyOsiCYw@mail.gmail.com>
Subject: Re: Configuring bias on an APCI GpioInt
To:     Jamie McClymont <jamie@kwiius.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 10, 2020 at 11:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Oct 10, 2020 at 11:58 AM Jamie McClymont <jamie@kwiius.com> wrote:

> > I have run into a second GPIO issue while writing a driver for the fingerprint sensor in my laptop*, configured in the ACPI table like so:
> >
> >    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> >    {
> >        Name (RBUF, ResourceTemplate ()
> >        {
> >            // SPI
> >            SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
> >                ControllerInitiated, 0x00989680, ClockPolarityLow,
> >                ClockPhaseFirst, "\\_SB.PCI0.SPI1",
> >                0x00, ResourceConsumer, , Exclusive,
> >                )
> >
> >            // Interrupt
> >            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
> >                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
> >                )
> >                {   // Pin list
> >                    0x0000
> >                }
> >
> >            // Reset
> >            GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
> >                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
> >                )
> >                {   // Pin list
> >                    0x0008
> >                }
> >        })
> >        CreateWordField (RBUF, 0x3B, GPIN)
> >        CreateWordField (RBUF, 0x63, SPIN)
> >        GPIN = GNUM (0x02000017)
> >        SPIN = GNUM (0x0202000A)
> >        Return (RBUF) /* \_SB_.SPBA._CRS.RBUF */
> >    }
> >
> > I call devm_request_threaded_irq with the number provided in the irq field of the `struct spi_device` during the spi_probe.
> >
> > This configures the right IRQ number, and it triggers when it should, but it stays asserted for 140ms-600ms after it should have been cleared.
>
> I was wondering how it works since it should have the same issue as
> with a regular GPIO. Now I understand that we simply ignore bias for
> GpioInt() resources. If you enable it, we come to the same issue. So,
> first we have to fix set bias followed by enabling it for GpioInt()
> resources.
>
> I will look closer at this next week.
>
>
> > Given it's an active-low level-triggered interrupt with a pull-up requested by the acpi table, my theory is:
> >
> > * The interrupt line is driven open-drain by the peripheral
> > * The pullup is not being correctly configured
> > * It is slooooowly pulled up by leakage current of the GPIO input, hence the interrupt being cleared after 140-600ms
> >
> > Looking at traces and confirming by source code**, it seems that no code ever attempts to configure the pin's bias during the irq setup.
> >
> > Is this a bug, or should I be manually setting up the GPIO some other way before requesting the IRQ?
> >
> > Thanks
> > - Jamie McClymont
> >
> >
> > *Hardware details
> > ==============
> >
> > Laptop is a Huawei Matebook X Pro
> > CPU is an Intel i5-8250U (the specific pinctrl is pinctrl_sunrisepoint)
> > Fingerprint Sensor is a Goodix GXFP5187 (not well-documented anywhere, I'm working through reverse-engineering)
> >
> > ** Tested on 5.9-rc8, but I've been reading the source of linux-next and haven't picked up on any relevant differences

I'm about to send the possible fix which has to be applied on top of
the [1]. As per previous thread it would be nice to have [2] applied
as well. Please, test it all together.

[1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/#u
[2]: https://lore.kernel.org/linux-gpio/20201009184359.16427-1-andriy.shevchenko@linux.intel.com/



--
With Best Regards,
Andy Shevchenko

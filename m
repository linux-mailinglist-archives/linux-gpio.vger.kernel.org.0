Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E5C28E169
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 15:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731271AbgJNNgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 09:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbgJNNgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 09:36:00 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A09C061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 06:35:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gm14so1587403pjb.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=leLlB44vh2cXiqlW7Jq+Crt2QdWS7DydbSDNkWazfsc=;
        b=eK2zQsTnpa1tx3I72VyfxeSoe/XIwECyXqVEOeiAZ9G/DBNZJCvYbZcH9dKTwHHBsT
         L8K67OKUH8uuNihmoEInQ3j/AMaPsdmG3bWFk+WkrX8pgDlk1WBE9BrxEAV9aA4vsezr
         0DTBziM2UQEtjuHVvimz/Qbz+bwbKN9i70ciehG9WWi4BdXwg2SQM7hYE7bSAE/XGLON
         QFnuvDZY0Ca9VkxxAbWOhYYM9cP1BBrqLr6nsd6h6PQaI3dlDUqi1pfT6BAwnxlq2R87
         zKIoBtDFxjXLmGNTKcaCDKM6ywvln3AK8I4jytUHgC10NOrGsf9cF9z4L69KtxOF9e/v
         Kfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=leLlB44vh2cXiqlW7Jq+Crt2QdWS7DydbSDNkWazfsc=;
        b=GvmA4lehKzbxjGeQs5Zrf/cgAN6WGNOkLtqHo6yiYE5wzV4uJf+qycfyzfoueUvyFY
         3npLBJOw5QRT+cqZdvl0vEghYJ0OuUJ1EKjyg4FEcl1OFwWhuw2iZ26V6MTfqth0SGAZ
         t/k+QczKdtqZpnpJW9TBukoPiG+RfGr4x9wN44P2/BTvf2j3BsmfWKgy4iyOOMZpedS0
         0ZggqMWRcCGnF/iR4Pl5Xo3LbWAEFJVx32cukOWRwZcNollQVV0k9VJkykiLppnUWbbY
         95UMycuPjE53+HhPkO5as0/44heWpIksnZyut55WXF1Eu2mpxRXBpeCxo6tl54GZWVlc
         QtfA==
X-Gm-Message-State: AOAM530MDDcotCn6Dgs6xjsIa6Rrum7WWXibkHZWIgx+xZ5eXMSzG+jK
        we1z8oRbE7wPg3X7vLHe285L1PFQKpRsve8UfRCE9bE0b/jojRDp
X-Google-Smtp-Source: ABdhPJz7fc30dtKKXWSfXWhoqD2F0DrsmCHZD5KvMZzZohXR5N0lpvULA8Wq+L8AB1cH3nCX3jGoGYOTo73cStsGk2g=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr3464898pjs.181.1602682558478;
 Wed, 14 Oct 2020 06:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <778e96d4-1695-43ee-90d6-86cc34b20418@www.fastmail.com>
 <CAHp75Vf2-4zX0rh5VtBze=so8nYDav3yOMuYTwodBNhvGmvQ4A@mail.gmail.com> <CAHp75VcBs-dYDCxch6zdFrdeiqO3U+hFhx4YRwriRFOyOsiCYw@mail.gmail.com>
In-Reply-To: <CAHp75VcBs-dYDCxch6zdFrdeiqO3U+hFhx4YRwriRFOyOsiCYw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Oct 2020 16:36:46 +0300
Message-ID: <CAHp75Vdqq-8VAyeUjfh6B9vjk7zbFvMwOmk3hRoq68dwP8KX4A@mail.gmail.com>
Subject: Re: Configuring bias on an APCI GpioInt
To:     Jamie McClymont <jamie@kwiius.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 3:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Oct 10, 2020 at 11:46 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Oct 10, 2020 at 11:58 AM Jamie McClymont <jamie@kwiius.com> wrote:
>
> > > I have run into a second GPIO issue while writing a driver for the fingerprint sensor in my laptop*, configured in the ACPI table like so:
> > >
> > >    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> > >    {
> > >        Name (RBUF, ResourceTemplate ()
> > >        {
> > >            // SPI
> > >            SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
> > >                ControllerInitiated, 0x00989680, ClockPolarityLow,
> > >                ClockPhaseFirst, "\\_SB.PCI0.SPI1",
> > >                0x00, ResourceConsumer, , Exclusive,
> > >                )
> > >
> > >            // Interrupt
> > >            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
> > >                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
> > >                )
> > >                {   // Pin list
> > >                    0x0000
> > >                }
> > >
> > >            // Reset
> > >            GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
> > >                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
> > >                )
> > >                {   // Pin list
> > >                    0x0008
> > >                }
> > >        })
> > >        CreateWordField (RBUF, 0x3B, GPIN)
> > >        CreateWordField (RBUF, 0x63, SPIN)
> > >        GPIN = GNUM (0x02000017)
> > >        SPIN = GNUM (0x0202000A)
> > >        Return (RBUF) /* \_SB_.SPBA._CRS.RBUF */
> > >    }
> > >
> > > I call devm_request_threaded_irq with the number provided in the irq field of the `struct spi_device` during the spi_probe.
> > >
> > > This configures the right IRQ number, and it triggers when it should, but it stays asserted for 140ms-600ms after it should have been cleared.
> >
> > I was wondering how it works since it should have the same issue as
> > with a regular GPIO. Now I understand that we simply ignore bias for
> > GpioInt() resources. If you enable it, we come to the same issue. So,
> > first we have to fix set bias followed by enabling it for GpioInt()
> > resources.
> >
> > I will look closer at this next week.
> >
> >
> > > Given it's an active-low level-triggered interrupt with a pull-up requested by the acpi table, my theory is:
> > >
> > > * The interrupt line is driven open-drain by the peripheral
> > > * The pullup is not being correctly configured
> > > * It is slooooowly pulled up by leakage current of the GPIO input, hence the interrupt being cleared after 140-600ms
> > >
> > > Looking at traces and confirming by source code**, it seems that no code ever attempts to configure the pin's bias during the irq setup.
> > >
> > > Is this a bug, or should I be manually setting up the GPIO some other way before requesting the IRQ?
> > >
> > > Thanks
> > > - Jamie McClymont
> > >
> > >
> > > *Hardware details
> > > ==============
> > >
> > > Laptop is a Huawei Matebook X Pro
> > > CPU is an Intel i5-8250U (the specific pinctrl is pinctrl_sunrisepoint)
> > > Fingerprint Sensor is a Goodix GXFP5187 (not well-documented anywhere, I'm working through reverse-engineering)
> > >
> > > ** Tested on 5.9-rc8, but I've been reading the source of linux-next and haven't picked up on any relevant differences
>
> I'm about to send the possible fix which has to be applied on top of
> the [1]. As per previous thread it would be nice to have [2] applied
> as well. Please, test it all together.
>
> [1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/#u
> [2]: https://lore.kernel.org/linux-gpio/20201009184359.16427-1-andriy.shevchenko@linux.intel.com/

Done. See [3] (first patch in the series).

[3]: https://lore.kernel.org/linux-gpio/20201014133154.30610-2-andriy.shevchenko@linux.intel.com/T/#u


-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE2329F45E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 19:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgJ2S6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 14:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgJ2S6w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 14:58:52 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C76DC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 11:58:51 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id k65so4106734oih.8
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JlhkSGuBWBk3b5VXZHQm5n3PCMxc5avXYrwwV4XYqxo=;
        b=Q9RvZEWchJ4V/SCF/gH0VqrSOQmUyE5XZbaFxny6uw+DWN0YgtJYqHufMFQXtDt4sI
         niDfL74ErtLKBRZCiZQwGckUEhGbpcFUSEv3R+O36peyYAYxcqyUsxVBMeL0l4VW18Pu
         nfJrgG7/akmXXS+NbN8hEf4cKh3sZjgDTAR5UJ/Mk+dF+y+0rLOTe+lFBC7PMcsachyy
         fTyrUyRobtI0b+KGZEJ7xfHG/g/PZEHHiSO/XtJzJfl+QjFuDTcgjm3B4c/EDeKny6Rb
         x+nY6j6BH+8Qbeh+OLhDqSWssinNO5Y9a9qQt77WFnUsNYbZaODe5tHHQc3GjNXx8rKQ
         Owog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JlhkSGuBWBk3b5VXZHQm5n3PCMxc5avXYrwwV4XYqxo=;
        b=N5BWm3C58sxljOM8orvUWcTcsP/YoXEI8QaMQBYeYDFJddHXrpxAfQICGCqrdO/RUW
         EN1PrtXFuKeL2fFFlpd1kcelNejE8ZguJwpBkGvGKJjdP4ZcMyqyReoOe4CdIL9GjC4u
         cyt03+gW/16NVZTvxy581FZ4HmAz4BvH5prXrzNa52MeE+riAzNP5ulWXQLP7s+Xdds7
         ObbJ4L9BbJbFd4SLUHXJRPUJqWNj6AHTc6D7YZUnXMxM9BcH5GU8gkfSKRauuxnnalDC
         FPpuFx0YJzPQGNBONmoMMg4VXoiAhsqMacjzaPolaWoiDPcLJLSBoeAUfQjQ4x5ZIVyd
         H3Yg==
X-Gm-Message-State: AOAM532XIRRbzqipn/59/HYa2p5RJAsoO3TVjv4zvpSeEgVH7fcGoY5Q
        JbZXu5jylIE3ms4lypBKBAzbJ6X3+vL9+y2lKdK0Wg==
X-Google-Smtp-Source: ABdhPJwuP9QDxEKGIv5BVO3LjZkI3xjQs9QAikuw3t7j+WFXY1KUbBCdY4P8UBY5KVmXsA8phLOGzWYpB9/AzQMWTuc=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr789970oig.128.1603997930701;
 Thu, 29 Oct 2020 11:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201028205101.47583-1-andriy.shevchenko@linux.intel.com>
 <20201028205101.47583-2-andriy.shevchenko@linux.intel.com>
 <CANiDSCtRDwfFo9HE84iujjFe6h9aS6b3B8wkz5Rt0aO8=XMsNg@mail.gmail.com>
 <20201029144656.GD4077@smile.fi.intel.com> <CANiDSCuNVT=jr8rLyfWhGKNSOy5OnH7YBZaWSguBDVg219OGvQ@mail.gmail.com>
 <CAHp75VfuZPpBZsyUEyD_R+ZEjPms6Z9L1tDdBKYfusWnbhtyww@mail.gmail.com>
 <CAHp75Vf-KXSC5x+07rH+wFgv_9xx_+DoMd9ZxTAqr_a5uxc7jA@mail.gmail.com>
 <CAHp75Vd+doPgSZQEOSAW4oRoAqPUdJyoivtNvbO5d1q-e280Eg@mail.gmail.com>
 <CANiDSCtNCn+vj=8kgx8oPUbCJS6mLmOckiWpJtobT_FtUCR3YQ@mail.gmail.com>
 <CANiDSCuJv258cXYgxcWBUVpvQm8tYy0Lrd426e63PHQJAnLYwQ@mail.gmail.com> <CAHp75Vc8FLoi=4Z78mNkDJk_qM_V0EA9s3aGb3qXU-i0vg8wxA@mail.gmail.com>
In-Reply-To: <CAHp75Vc8FLoi=4Z78mNkDJk_qM_V0EA9s3aGb3qXU-i0vg8wxA@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@google.com>
Date:   Thu, 29 Oct 2020 19:58:39 +0100
Message-ID: <CANiDSCvD3JqT8pZy7MtuCtGGSP8bUrkndCf6CK866MeH7Hk3sA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: firmware-guide: gpio-properties:
 active_low only for GpioIo()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Tomasz Figa <tfiga@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 7:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 29, 2020 at 8:10 PM Ricardo Ribalda <ribalda@google.com> wrote:
> > On Thu, Oct 29, 2020 at 6:32 PM Ricardo Ribalda <ribalda@google.com> wrote:
> > > On Thu, Oct 29, 2020 at 6:26 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Oct 29, 2020 at 7:20 PM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Thu, Oct 29, 2020 at 7:17 PM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > On Thu, Oct 29, 2020 at 4:55 PM Ricardo Ribalda <ribalda@google.com> wrote:
> > > > > > > On Thu, Oct 29, 2020 at 3:45 PM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Wed, Oct 28, 2020 at 10:10:42PM +0100, Ricardo Ribalda wrote:
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > > ActiveLevel field is described in 19.6.55 GpioInt (GPIO Interrupt Connection
> > > > > > > > Resource Descriptor Macro).
> > > > > > > >
> > > > > > > > > Without using the active_low, how can we describe  a pin that is
> > > > > > > > > active low and has to trigger an irq on both edges?
> > > > > > > >
> > > > > > > > This is nonsense.
> > > > > > > > What does it mean?
> > > > > > >
> > > > > > > Let me try to explain myself again:
> > > > > > >
> > > > > > > I have a gpio pin that produces IRQs on both edges. so ActiveLevel is Both
> > > > > > >
> > > > > > > The problem is that the value of that pin is inverted: Low means 1 and
> > > > > > > high means 0.
> > > > > > >
> > > > > > > How can I describe that the pin "is inverted" without using the _DSD field?
> > > > > >
> > > > > > "Both edges" and "inverted" or "polarity low" in one sentence make no sense.
> > > > >
> > > > > To be on the constructive side, I can *imagine* so badly designed
> > > > > hardware that uses level and edge at the same time, but before I go to
> > > > > conclusions, can you share relevant (pieces of) datasheet?
> > > >
> > > > The [1] is a real example of how GPIO is being used to detect changing
> > > > of current level of the signal.
> > > > Note, ACPI tables for that device have problems [2], but I guess you
> > > > may get the idea.
> > >
> > >
> > > This is exactly what I need to do. Get an IRQ whenever the value
> > > changes. But the pin is "inverted"
> > >
> > > This is the "schematic" :  https://ibb.co/f8GMBbP . I want to pass to
> > > userspace a "1" when the switch is closed and "0"  when it is open.
> > >
> > And there are also other devices where the swith works the other way
> > around, so the acpi should be verbose enough to describe both
> > situations.
> >
> > With my proposal (use the same active_low field as with GpioIO) we
> > cover both usecases.
>
> Even without your proposal it's feasible.
> You see, the problem here is that if you describe GPIO as Interrupt,
> the edge and level together make complete nonsense.
>
> Solution: do *not* describe it as Interrupt.

Now I get my mistake:

I thought that gpiod_to_irq will not work unless it was a GpioInt()
but it works fine. So in this case I will just convert it to that.

Could we say that doing gpiod_get_value() from a GpioInt() is always
wrong? Can we modify the code to avoid it?

Sorry for the confusion and thanks for your help.


>
> > > > [1]: https://elixir.bootlin.com/linux/latest/source/drivers/extcon/extcon-intel-int3496.c#L138
> > > > [2]: https://elixir.bootlin.com/linux/latest/source/drivers/extcon/extcon-intel-int3496.c#L45
>
>
> --
> With Best Regards,
> Andy Shevchenko



--
Ricardo Ribalda

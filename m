Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EB729F34F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 18:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgJ2Rc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 13:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgJ2Rc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 13:32:59 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CED7C0613D5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 10:32:59 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id c72so3820947oig.9
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 10:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xpr5dmWGsbXVj8V8QwWAbYKKg0zqAXKIOGfjNJfVfCw=;
        b=Rbz+OdJuRecB1wYW89zpWZvTWYlAfvLlS1pLXAMuLvWvv8ZxozuT6yH0IvosHDnFfs
         6bTQW5TJWr/7N4ZDkcgBDfUB0qq1TpgqgJbyHJO+Lsmw4nxYF4JMpFNeyV7or3UmIK1r
         VRd2S9xaMmgudyYpR1MmwJje5Fu3zJSZA8E8je5dYOiyoH/yOITvHRc9sRyyID3Aay/z
         kqu4gSRP7BZKZLAlti9Zw4CsgH2+W2SgoYBEIo/IIipwvSlD5VWFY23fFosj9+K8Tr02
         uodBi5wpnUVye2zm0ACBETzTPbojBK+imDHNfPYG4naFslkmylDdMhL6VxvCXlCBtfJF
         6htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xpr5dmWGsbXVj8V8QwWAbYKKg0zqAXKIOGfjNJfVfCw=;
        b=uYDYGwxRetk4V2UBRLLA/5nWHEXV6CqRaUCPqL1sRRRAQzYco0NaHKZCQN0q/hdyUy
         UCNsmz6ZMdrsDc0oidV/qaJPND327Yw+Ck4TGGWUiTIBU4/mKypByhXFAUkp6EmgGDtM
         QxjNPmeYYyMNlEM9XC2osJhhoQwxuBaWzWz+KvVwbPBkjUt6T5GyOkKa80BtyR7i0cmR
         Tj8zBtXawQ6qCl5uk6mBB4pxQEuaRIdC0bK/yIqN0QJ7CbByj06M5S9FZZRX6GNBOGJ/
         EcGji6nkndjVTGltxjvnzxvfiMXhM+89rOA5U8MiCc+x9C1Bh1omNIew/tSMAL0CWNXK
         Pazw==
X-Gm-Message-State: AOAM531Yet/bsBOOr5oSiIQZibA7eg2562lpSeIURluwA4tX+Poi7rrd
        CoQVMlUDnsGx3jdYNQMPeI+F6T5TJ7oUQFalp3HBZg==
X-Google-Smtp-Source: ABdhPJzS6eBqIeoZQgbrNPKsAwBuUlfoDEZ1zeFYCK+mIFTY99a/hMHi/w1Qyk1MwBfpBZsCiWyXpb2Va6xvZpmr4Es=
X-Received: by 2002:a05:6808:602:: with SMTP id y2mr536585oih.11.1603992778474;
 Thu, 29 Oct 2020 10:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201028205101.47583-1-andriy.shevchenko@linux.intel.com>
 <20201028205101.47583-2-andriy.shevchenko@linux.intel.com>
 <CANiDSCtRDwfFo9HE84iujjFe6h9aS6b3B8wkz5Rt0aO8=XMsNg@mail.gmail.com>
 <20201029144656.GD4077@smile.fi.intel.com> <CANiDSCuNVT=jr8rLyfWhGKNSOy5OnH7YBZaWSguBDVg219OGvQ@mail.gmail.com>
 <CAHp75VfuZPpBZsyUEyD_R+ZEjPms6Z9L1tDdBKYfusWnbhtyww@mail.gmail.com>
 <CAHp75Vf-KXSC5x+07rH+wFgv_9xx_+DoMd9ZxTAqr_a5uxc7jA@mail.gmail.com> <CAHp75Vd+doPgSZQEOSAW4oRoAqPUdJyoivtNvbO5d1q-e280Eg@mail.gmail.com>
In-Reply-To: <CAHp75Vd+doPgSZQEOSAW4oRoAqPUdJyoivtNvbO5d1q-e280Eg@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@google.com>
Date:   Thu, 29 Oct 2020 18:32:46 +0100
Message-ID: <CANiDSCtNCn+vj=8kgx8oPUbCJS6mLmOckiWpJtobT_FtUCR3YQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: firmware-guide: gpio-properties:
 active_low only for GpioIo()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy

On Thu, Oct 29, 2020 at 6:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 29, 2020 at 7:20 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Oct 29, 2020 at 7:17 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Oct 29, 2020 at 4:55 PM Ricardo Ribalda <ribalda@google.com> wrote:
> > > > On Thu, Oct 29, 2020 at 3:45 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Wed, Oct 28, 2020 at 10:10:42PM +0100, Ricardo Ribalda wrote:
> > >
> > > ...
> > >
> > > > > ActiveLevel field is described in 19.6.55 GpioInt (GPIO Interrupt Connection
> > > > > Resource Descriptor Macro).
> > > > >
> > > > > > Without using the active_low, how can we describe  a pin that is
> > > > > > active low and has to trigger an irq on both edges?
> > > > >
> > > > > This is nonsense.
> > > > > What does it mean?
> > > >
> > > > Let me try to explain myself again:
> > > >
> > > > I have a gpio pin that produces IRQs on both edges. so ActiveLevel is Both
> > > >
> > > > The problem is that the value of that pin is inverted: Low means 1 and
> > > > high means 0.
> > > >
> > > > How can I describe that the pin "is inverted" without using the _DSD field?
> > >
> > > "Both edges" and "inverted" or "polarity low" in one sentence make no sense.
> >
> > To be on the constructive side, I can *imagine* so badly designed
> > hardware that uses level and edge at the same time, but before I go to
> > conclusions, can you share relevant (pieces of) datasheet?
>
> The [1] is a real example of how GPIO is being used to detect changing
> of current level of the signal.
> Note, ACPI tables for that device have problems [2], but I guess you
> may get the idea.


This is exactly what I need to do. Get an IRQ whenever the value
changes. But the pin is "inverted"

This is the "schematic" :  https://ibb.co/f8GMBbP . I want to pass to
userspace a "1" when the switch is closed and "0"  when it is open.



>
>
> [1]: https://elixir.bootlin.com/linux/latest/source/drivers/extcon/extcon-intel-int3496.c#L138
> [2]: https://elixir.bootlin.com/linux/latest/source/drivers/extcon/extcon-intel-int3496.c#L45
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Ricardo Ribalda

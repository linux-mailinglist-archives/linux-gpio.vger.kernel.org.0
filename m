Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BBA3423DC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 18:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhCSR6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 13:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhCSR5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 13:57:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A02DC06174A;
        Fri, 19 Mar 2021 10:57:45 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q5so6431466pfh.10;
        Fri, 19 Mar 2021 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2mOuHKD0JWNPyTnS6xCqcxhUtEeEE1ODpShZbCe3d/U=;
        b=nfpZ0TcD94lEBjcu726Cfru/DoQOzFy7PylCdjgur1T/Hfl+p7xP4vxYGlunzXHoRe
         IpkPlcmeVP225Ss7tLkdzQIor3rk1OvPbTXiTumQCuCXh1Z0fS3IBYEWQzzEn1sj3Ih4
         XVZBs3HSoP1Un6Px4ODwyFVJGtmpla463XvC3/wQCd/oe8RKBlJUzbcPq43rcBO3exxf
         06ycQS23jgAkpU4y+zENZWY8PEqlhZC+enfEHBWIcIaoYtnbZj4TX4hyy5DtFms1mFbX
         jWuRADZxMPeTYuVyjkZ1sbq78SyPUI3A/nq6L+uPCs9FOHPSHh/spVXHA6RbTl9+oiP4
         7c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2mOuHKD0JWNPyTnS6xCqcxhUtEeEE1ODpShZbCe3d/U=;
        b=J+D8E6lPKVQUetNdEG07T/8y6RbEuOmSUJ9Oci1WOyhjyXcb/VBJ8oGkurIt+k1/zV
         rXhABoxhcgzg0AEPoLOZK+laC4Nev4cT+vMdJf4l3ZmLxqHb72DLV+CKvXb7kohGq1/k
         M3bTJ2X1RU0NCXtKKWEKC2fdsHY3GobAaYpMxXnJLrQLKlX9RMITEmkHgR/KkhGmenyE
         WA0C2gz8FI0uME7YEpW1aN4g2jc51W/m/9DCA5rcl8l2/wyZaVkxwCPTBCnEdUVmS8YC
         GotSkNnVMlfXi/gsRN4fVXXt+fvTuFMEtSpQQz9BM4o5G0FzVGJPowlioVbBPb6Cwt+d
         F79g==
X-Gm-Message-State: AOAM532y6kNbSvdt82MzS8+2nnP2salE+jh/1P6HH3cIaKQoQLN5kbcA
        Vri8npdXJIkq4jjj0/HIC+Hhucqdmo04pGb5YPI=
X-Google-Smtp-Source: ABdhPJxHw/1t8tXyIfGGvo/j9gXzEeKGwGR2258hjHISoO/K+/IK8SZCvQFGurRuO9IuvoSnnBVfcruTROTMSK30cro=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr12520886pgf.4.1616176664463;
 Fri, 19 Mar 2021 10:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210315082339.9787-1-sander@svanheule.net> <20210315190806.66762-1-sander@svanheule.net>
 <20210315190806.66762-3-sander@svanheule.net> <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
 <a7d410216d35ed2b3015bfdd8e21dafd9c42d9d4.camel@svanheule.net>
In-Reply-To: <a7d410216d35ed2b3015bfdd8e21dafd9c42d9d4.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 19:57:28 +0200
Message-ID: <CAHp75VdrqE0kBwzK9Jk7pZGjyfFnhatfa8UY0z-3T1w1PrbAbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 5:51 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Wed, 2021-03-17 at 15:08 +0200, Andy Shevchenko wrote:
> > On Mon, Mar 15, 2021 at 11:11 PM Sander Vanheule <
> > sander@svanheule.net> wrote:

...

> > > +#include <linux/swab.h>
> >
> > Not sure why you need this? See below.

> > > +       return swab32(readl(ctrl->base + REALTEK_GPIO_REG_ISR));
> >
> > Why swab?! How is this supposed to work on BE CPUs?
> > Ditto for all swabXX() usage.
>
> My use of swab32/swahw32 has little to do with the CPU being BE or LE,
> but more with the register packing in the GPIO peripheral.
>
> The supported SoCs have port layout A-B-C-D in the registers, where
> firmware built with Realtek's SDK always denotes A0 as the first GPIO
> line. So bit 24 in a register has the value for A0 (with the exception
> of the IMR register).
>
> I wrote these wrapper functions to be able to use the BIT() macro with
> the GPIO line number, similar to how gpio-mmio uses ioread32be() when
> the BGPIOF_BIG_ENDIAN_BYTE_ORDER flag is used.
>
> For the IMR register, port A again comes first, but is now 16 bits wide
> instead of 8, with A0 at bits 16:17. That's why swahw32 is used for
> this register.
>
> On the currently unsupported RTL9300-series, the port layout is
> reversed: D-C-B-A. GPIO line A0 is then at bit 0, so the swapping
> functions won't be required. When support for this alternate port
> layout is added, some code will need to be added to differentiate
> between the two cases.

Yes, you have different endianess on the hardware level, why not to
use the proper accessors (with or without utilization of the above
mentioned BGPIOF_BIG_ENDIAN_BYTE_ORDER)?

...

> > > +       case IRQ_TYPE_NONE:
> > > +               type = 0;
> > > +               handler = handle_bad_irq;
> > > +               break;
> >
> > Why is it here? Make it default like many other GPIO drivers do.

> > > +       irq_set_handler_locked(data, handler);
> >
> > handler is always the same. Use it directly here.
>
> I'll drop the IRQ_TYPE_NONE case. Do I understand it correctly, that
> IRQ_TYPE_NONE should never be used as the new value, but only as the
> default initial value?

Initially you initialize the default handler to be "bad" (in order to
easily catch up issues with IRQ configurations).
When ->irq_set_type() is called, if everything is okay it will lock
the handler to the proper one.

-- 
With Best Regards,
Andy Shevchenko

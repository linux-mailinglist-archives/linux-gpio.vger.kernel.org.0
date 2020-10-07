Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B1F28625F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 17:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgJGPmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 11:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgJGPmn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 11:42:43 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CA7C061755;
        Wed,  7 Oct 2020 08:42:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x22so1519086pfo.12;
        Wed, 07 Oct 2020 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGFQepT5dAielyQOcZZKF78Vk6XPpWVnwJvjhh+Nths=;
        b=EZ1RN/YiciSHmmi6KmaZ4yd1HwEjk6cFBdDoxz0e/cBJLO/gMoW3UBhjRRKtjlOvWH
         LN/3RTHIZ/SLy1+igAdhORfr/+RJrMZzny+csOHfFB3yU89BuTZYhjiJjQ5OcfpladKU
         CBiyDDBrUxpLvPzv8uKuI90P2GNM/LnxBFlTU0AxKIgjNPmzljIcQwT98pw6ScHswsxJ
         RZ9qOgSRgBHv0Ty7rIjlepNHT//TNKlDu+WFe9xWqi46oHACRG01o9SkbsiWEpAK0qzv
         nAa/48uCBxj0K1XsVuQhhs7p1BLya074XMB2ZAkcFL2kCpOk4oNJlQQC4r3PCB51g5CP
         qlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGFQepT5dAielyQOcZZKF78Vk6XPpWVnwJvjhh+Nths=;
        b=aWfTgXiu96pY9HyuYfBd3UJBioI1JcANjqZHn2jcvblN4vjDEBoy489UPJ6q3a0E0s
         we/HiikNYmIeLVFXQt4Wd3Rbr2+2GY/piZ5hnqWm0Wf+jt5TeXzcQmPrCkgGWyafqlwR
         AtisYFqfPVzQPwtPhsfkUcUhXHYjnt77id/M3mQWrsAqvVdkk7SIYFnx/N8QP635FZgZ
         ZaFNBXMvzKsupk6BfVHpX0QGBUwenc79TJ+SU+x15IAZ33j92nIDx56EMmPvGMco2Wwy
         MD989+7uqACXmN97+Xm/e/dBmIyLizRPjyzko6HoxCEXlBUJTd4u+jaN4yTFtaqSHEqS
         4DEA==
X-Gm-Message-State: AOAM530wX7c3lkYiRnsyRRKdbvDMs8TZ0tM6gtOEMmke284avshoEZAG
        thMZ1uozwROABraovjQv/ACtdvJTLSc3fYqQBOQ=
X-Google-Smtp-Source: ABdhPJzz1+XMwvpBzj19pLceQVBur+ueQvp6VyjuWDJnETHhvRf5xN483kY8Z+8/5Xt+06Bo2B2EMJPDb7eeL8wDjeg=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr3518995pfn.73.1602085362812; Wed, 07
 Oct 2020 08:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201005140217.1390851-1-maz@kernel.org> <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
 <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com>
 <0175d3ce84ea0aa938a3ce9b3731762e@kernel.org> <CAHp75VdQixJStuVj_aMZ9PhkWXk4RoUa13wAMDj4KGwm2t9nFQ@mail.gmail.com>
 <bab5b8d99b57710030955c3924c9fca5@kernel.org> <CAHp75VdZxU67P9RPAmw=hnToR2H-8bfHvzeU4UCwKCpV5xEKNg@mail.gmail.com>
 <15ef48ca189e6535ea1549f7329bc20e@kernel.org>
In-Reply-To: <15ef48ca189e6535ea1549f7329bc20e@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Oct 2020 18:43:32 +0300
Message-ID: <CAHp75VevBH6MBHy9MTW-qFDHPeaXzPu3=EyW19JoAsFU-sBViw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Survive spurious interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 6:00 PM Marc Zyngier <maz@kernel.org> wrote:
> On 2020-10-07 15:03, Andy Shevchenko wrote:
> > On Wed, Oct 7, 2020 at 4:20 PM Marc Zyngier <maz@kernel.org> wrote:
> >> On 2020-10-07 14:10, Andy Shevchenko wrote:
> >> > On Wed, Oct 7, 2020 at 3:09 PM Marc Zyngier <maz@kernel.org> wrote:
> >> >> On 2020-10-07 13:02, Andy Shevchenko wrote:
> >> >> > On Wed, Oct 7, 2020 at 12:49 PM Linus Walleij
> >> >> > <linus.walleij@linaro.org> wrote:
> >> >> >> On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:
> >> >> >>
> >> >> >> > The pca953x driver never checks the result of irq_find_mapping(),
> >> >> >> > which returns 0 when no mapping is found. When a spurious interrupt
> >> >> >> > is delivered (which can happen under obscure circumstances), the
> >> >> >> > kernel explodes as it still tries to handle the error code as
> >> >> >> > a real interrupt.
> >> >> >> >
> >> >> >> > Handle this particular case and warn on spurious interrupts.
> >> >> >> >
> >> >> >> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> >> >> >
> >> >> > Wait, doesn't actually [1]  fix the reported issue?
> >> >>
> >> >> Not at all.
> >> >>
> >> >> > Marc, can you confirm this?
> >> >> >
> >> >> > [1]: e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")
> >> >>
> >> >> Different bug, really. If an interrupt is *really* pending, and no
> >> >> mapping established yet, feeding the result of irq_find_mapping() to
> >> >> handle_nested_irq() will lead to a panic.
> >> >
> >> > I don't understand. We have plenty of drivers doing exactly the way
> >> > without checking this returned code.
> >>
> >> I'm sure we do. Most driver code is buggy as hell, but I don't see
> >> that
> >> as a reason to cargo-cult the crap. The API is crystal clear that it
> >> can
> >> return 0 for no mapping, and 0 isn't a valid interrupt.
> >
> > Yes, and the problem here is that we got this response from IRQ core,
> > which we shouldn't.
>
> What do you mean? There is no mapping at all. and all the core code
> can tell you is exactly that. If you think that using an error code
> as a valid input to another function is OK, we have a much bigger
> problem.

Of course it's not okay. And that's what puzzles me. We shouldn't get
bit set in pending if there is no requested IRQ (handler assigned).
I think there is a bug indeed, but I'm not sure it is in the code you
are patching. Rather in the code when we are preparing a pending
bitmap.
Shouldn't we have unused (unassigned interrupts) being masked in the
first place?

I can imagine that we have the chip preconfigured by firmware and when
->probe() happens the enabled IRQs should be left untouched, but is it
the case?
I guess you are using a non-latched version of the GPIO expander (I
don't have such for a test).

I need to look at this closer...
Since Linus already applied this we will live with it now, but it
would be really helpful if you may dump the traces of non-working case
before this patch to analyze (I would like to see all regmap IO for
this chip).

> >> > What circumstances makes the mapping be absent?
> >>
> >> Other bugs in the system ([1]), spurious interrupts (which can
> >> *always*
> >> happen).
> >>
> >> > Shouldn't we rather change this:
> >> >
> >> >         girq->handler = handle_simple_irq;
> >> > to this:
> >> >         girq->handler = handle_bad_irq;
> >> > ?
> >>
> >> I don't understand what you are trying to achieve with that, apart
> >> from
> >> maybe breaking the driver. The right way to handle spurious interrupts
> >> is by telling the core code that the interrupt wasn't handled, and to
> >> let
> >> the spurious interrupt code do its magic.
> >
> > handle_bad_irq() is exactly for handling spurious IRQs as far as we
> > believe documentation. So, by default the driver assigns (should
> > assign) handle_bad_irq() to all IRQs as a default handler. If, by any
> > chance, we got it, we already have a proper handler in place. The read
> > handler is assigned whenever the IRQ core is called to register it (by
> > means of ->irq_set_type() callback). My understanding that GPIO IRQ
> > drivers are designed (should be designed) in this way.  The approach
> > will make us sure that we don't have spurious interrupts with assigned
> > handlers.
>
> I can't see how setting this to anything else can work, given that
> handle_nested_irq() knows nothing about this flow (it doesn't use
> any).



-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8E42860D5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 16:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgJGODK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 10:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgJGODJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 10:03:09 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA435C061755;
        Wed,  7 Oct 2020 07:03:09 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n14so1385781pff.6;
        Wed, 07 Oct 2020 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kcre7S3hG+2gwKHv0fg1VaZeGAhDiM7oeN3iSNcC4bE=;
        b=o9oILw3r8M24NA5FfiRfZxc3sHsBi32p80nejeXcja6UUYIgNXqN3zU/rC3AZrdS7g
         RZjYQgY+njMATnutNNoTHVjCJBe9xjjucsrSjS7WtOHYxfAPGdKo7TY4W7B5/sWd5EkF
         ZMVDbmHIq18rUaXJgUb4JDn6NXvzSn+jNUmNM9nrk+NNugD5X/5+uWK+mY1y2BNSICJe
         XbRfUFWD4YbE265/tIuvYFMS7C7BIAEzRwfBEPe8J2F/UbeHfVI25V9T8W7OM3gYLstf
         i0UGL1CNyKpEWa9ILoxK40ILPhIEoaJ8N2mKSeSw2I3JK68qrAyMykj+stPoIF/e1byW
         us6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kcre7S3hG+2gwKHv0fg1VaZeGAhDiM7oeN3iSNcC4bE=;
        b=mmgac4UlJM6MiJckyspBLLP6SrJ+aMIMKOrt8Y33rBeekjSaETR826M9xNl1QVTQ3U
         Dux2f1jySReFwwO2XFbv1024oMCuCCo0JfpsOqd/LiGTfD2NRmOnr5qV1Seoh/C7+7dW
         DsxgIrqCbo6OjVFw92kqjprHjMFEQEOY6qFQayugfZLVQPhkAlGqPuk+g10mp+byXu5F
         oPLvh/JO/eRhnp2PNH/7ftwEw12wCG1emqc0SZAxGGl/1pIQfPF4vOvw+VznBaI+7H7S
         Vr6IL+Rhoil7KCoA1yxtKbNZwQQ2GnXFeIRcAeAIqH8X6iAJxxTGAEL9vPEQ4Ptj7KsH
         KkHQ==
X-Gm-Message-State: AOAM533GqCuv8uH8Kln+F34Ix4WKT/ywGPpCJK1bxpfzfLfVC9qaHgey
        HfMRk2sHlauzr0dx3IY/B8NoP9kP9qn97e2BOJPswh9ceWmmQA==
X-Google-Smtp-Source: ABdhPJyUs7vkbnKA03on8TlPzRFApNgoAZ5pHdsgH7cpauF8O/Ew0E/ch5gSWSCVHYbAJ0TRKjrkHjJYZrIJJKsQgR8=
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr3220846pga.203.1602079389356;
 Wed, 07 Oct 2020 07:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201005140217.1390851-1-maz@kernel.org> <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
 <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com>
 <0175d3ce84ea0aa938a3ce9b3731762e@kernel.org> <CAHp75VdQixJStuVj_aMZ9PhkWXk4RoUa13wAMDj4KGwm2t9nFQ@mail.gmail.com>
 <bab5b8d99b57710030955c3924c9fca5@kernel.org>
In-Reply-To: <bab5b8d99b57710030955c3924c9fca5@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Oct 2020 17:03:58 +0300
Message-ID: <CAHp75VdZxU67P9RPAmw=hnToR2H-8bfHvzeU4UCwKCpV5xEKNg@mail.gmail.com>
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

On Wed, Oct 7, 2020 at 4:20 PM Marc Zyngier <maz@kernel.org> wrote:
> On 2020-10-07 14:10, Andy Shevchenko wrote:
> > On Wed, Oct 7, 2020 at 3:09 PM Marc Zyngier <maz@kernel.org> wrote:
> >> On 2020-10-07 13:02, Andy Shevchenko wrote:
> >> > On Wed, Oct 7, 2020 at 12:49 PM Linus Walleij
> >> > <linus.walleij@linaro.org> wrote:
> >> >> On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:
> >> >>
> >> >> > The pca953x driver never checks the result of irq_find_mapping(),
> >> >> > which returns 0 when no mapping is found. When a spurious interrupt
> >> >> > is delivered (which can happen under obscure circumstances), the
> >> >> > kernel explodes as it still tries to handle the error code as
> >> >> > a real interrupt.
> >> >> >
> >> >> > Handle this particular case and warn on spurious interrupts.
> >> >> >
> >> >> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> >> >
> >> > Wait, doesn't actually [1]  fix the reported issue?
> >>
> >> Not at all.
> >>
> >> > Marc, can you confirm this?
> >> >
> >> > [1]: e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")
> >>
> >> Different bug, really. If an interrupt is *really* pending, and no
> >> mapping established yet, feeding the result of irq_find_mapping() to
> >> handle_nested_irq() will lead to a panic.
> >
> > I don't understand. We have plenty of drivers doing exactly the way
> > without checking this returned code.
>
> I'm sure we do. Most driver code is buggy as hell, but I don't see that
> as a reason to cargo-cult the crap. The API is crystal clear that it can
> return 0 for no mapping, and 0 isn't a valid interrupt.

Yes, and the problem here is that we got this response from IRQ core,
which we shouldn't.

> > What circumstances makes the mapping be absent?
>
> Other bugs in the system ([1]), spurious interrupts (which can *always*
> happen).
>
> > Shouldn't we rather change this:
> >
> >         girq->handler = handle_simple_irq;
> > to this:
> >         girq->handler = handle_bad_irq;
> > ?
>
> I don't understand what you are trying to achieve with that, apart from
> maybe breaking the driver. The right way to handle spurious interrupts
> is by telling the core code that the interrupt wasn't handled, and to
> let
> the spurious interrupt code do its magic.

handle_bad_irq() is exactly for handling spurious IRQs as far as we
believe documentation. So, by default the driver assigns (should
assign) handle_bad_irq() to all IRQs as a default handler. If, by any
chance, we got it, we already have a proper handler in place. The read
handler is assigned whenever the IRQ core is called to register it (by
means of ->irq_set_type() callback). My understanding that GPIO IRQ
drivers are designed (should be designed) in this way.  The approach
will make us sure that we don't have spurious interrupts with assigned
handlers.

> [1] https://lore.kernel.org/r/20201005111443.1390096-1-maz@kernel.org


-- 
With Best Regards,
Andy Shevchenko

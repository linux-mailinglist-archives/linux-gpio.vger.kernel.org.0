Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4D631645E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhBJKxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhBJKva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:51:30 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D9FC06174A;
        Wed, 10 Feb 2021 02:50:50 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id t2so920222pjq.2;
        Wed, 10 Feb 2021 02:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFiaF4Ow13INgvRB0n4kQnrMJ0TDxvcYL+6QdTwwsck=;
        b=qhn/tIa/gkaYwXMBSuyGiwK4KnNBflfhr1c3WuVVOWWMsPFNp7wwl35s8Q6vJc+16T
         47PrmpmP0vxlhCzkPbbpWIwdqrPLZ2rQd1Rt87qLIgHYfvQRM1DQ6//fOT43svizTiHr
         SePBCDDCoJhUTAyANdagjkd+6o5m777XxaEwunMhlPgSHlew4BM0KSDdWisDdkwRNzpo
         wBxG6ccTdppswt8g/YstiRso7W26tr1Qj4R5KF0eHjis9ofKRVKn3NzMVZ4TVVTMey5v
         MDuAnrCF9Zy0jtVTdPSRnjFlH6AfQNxawKVS+IrYtMc/aPK6ltiCUS2O/Tpa/p/UFu4G
         cCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFiaF4Ow13INgvRB0n4kQnrMJ0TDxvcYL+6QdTwwsck=;
        b=LjoH1kDwHT6DeO3AcOqRmcyaiMl7Gttgd9ZwMCnsqF9gRGXyKfzQHjOrOjSfM0GAIc
         hfx4ki1AEGt5/e3zd5dpB0LZnWDngnBziaH8V+N9ir/7p8t4rXB5JUSysRATp8eP+efx
         7Fh+IbqANekeZyFEgrm0fLwEijmYoxrU1LGgQDjFda11zz79ZMk1/FxMbrDs7veUPrSZ
         534pQpomKgIgAIEaKd49xdfDRBbpzYY6U3QkUikGA3J0VHabsxglxmLjRdVenYbezQOs
         4S8LSz/xa9wcq42DVri77u30rFWsFOB4u0oW91UtOOH7SIgYhFR3kgG2dmnac4ZImMYP
         ibfA==
X-Gm-Message-State: AOAM530AVC3iecohuUkh+X09NU2oCYF1UslU7IAixJbR/Xpokn3kjxnI
        1Nc3odApmOkunpO6Ez/6nmR6nmCOeRZmQcMbUMg=
X-Google-Smtp-Source: ABdhPJxErhLI2HKYcAk0xQ0Xi9kPZQ5PMlKz+QfZ22F7NARo1EgLGEbhcT7ZultnaDzP7pxKCB31v3gkxyEY46aqZdk=
X-Received: by 2002:a17:90a:1b23:: with SMTP id q32mr2583983pjq.181.1612954249966;
 Wed, 10 Feb 2021 02:50:49 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com> <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com> <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
 <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com>
In-Reply-To: <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:50:34 +0200
Message-ID: <CAHp75VdrskuNkvFr4MPbbg8c8=VSug0GT+vs=cMRMOqLr+-f5A@mail.gmail.com>
Subject: Re: [Linuxarm] [PATCH for next v1 0/2] gpio: few clean up patches to
 replace spin_lock_irqsave with spin_lock
To:     luojiaxing <luojiaxing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxarm@openeuler.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 5:43 AM luojiaxing <luojiaxing@huawei.com> wrote:
> On 2021/2/9 17:42, Andy Shevchenko wrote:
> > On Tue, Feb 9, 2021 at 11:24 AM luojiaxing <luojiaxing@huawei.com> wrote:
> >> On 2021/2/8 21:28, Andy Shevchenko wrote:
> >>> On Mon, Feb 8, 2021 at 11:11 AM luojiaxing <luojiaxing@huawei.com> wrote:
> >>>> On 2021/2/8 16:56, Luo Jiaxing wrote:
> >>>>> There is no need to use API with _irqsave in hard IRQ handler, So replace
> >>>>> those with spin_lock.
> >>> How do you know that another CPU in the system can't serve the
> > The keyword here is: *another*.
>
> ooh, sorry, now I got your point.
>
> As to me, I don't think another CPU can serve the IRQ when one CPU
> runing hard IRQ handler,

Why is it so?
Each CPU can serve IRQs separately.

> except it's a per CPU interrupts.

I didn't get how it is related.

> The following is a simple call logic when IRQ come.
>
> elx_irq -> handle_arch_irq -> __handle_domain_irq -> desc->handle_irq ->
> handle_irq_event

What is `elx_irq()`? I haven't found any mention of this in the kernel
source tree.
But okay, it shouldn't prevent our discussion.

> Assume that two CPUs receive the same IRQ and enter the preceding
> process. Both of them will go to desc->handle_irq().

Ah, I'm talking about the same IRQ by number (like Linux IRQ number,
means from the same source), but with different sequence number (means
two consequent events).

> In handle_irq(), raw_spin_lock(&desc->lock) always be called first.
> Therefore, even if two CPUs are running handle_irq(),
>
> only one can get the spin lock. Assume that CPU A obtains the spin lock.
> Then CPU A will sets the status of irq_data to
>
> IRQD_IRQ_INPROGRESS in handle_irq_event() and releases the spin lock.
> Even though CPU B gets the spin lock later and
>
> continue to run handle_irq(), but the check of irq_may_run(desc) causes
> it to exit.
>
>
> so, I think we don't own the situation that two CPU server the hard IRQ
> handler at the same time.

Okay. Assuming your analysis is correct, have you considered the case
when all IRQ handlers are threaded? (There is a kernel command line
option to force this)

> >>> following interrupt from the hardware at the same time?
> >> Yes, I have some question before.
> >>
> >> There are some similar discussion here,  please take a look, Song baohua
> >> explained it more professionally.
> >>
> >> https://lore.kernel.org/lkml/e949a474a9284ac6951813bfc8b34945@hisilicon.com/
> >>
> >> Here are some excerpts from the discussion:
> >>
> >> I think the code disabling irq in hardIRQ is simply wrong.
> > Why?
>
>
> I mention the following call before.
>
> elx_irq -> handle_arch_irq -> __handle_domain_irq -> desc->handle_irq ->
> handle_irq_event
>
>
> __handle_domain_irq() will call irq_enter(), it ensures that the IRQ
> processing of the current CPU can not be preempted.
>
> So I think this is the reason why Song baohua said it's not need to
> disable IRQ in hardIRQ handler.
>
> >> Since this commit
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e58aa3d2d0cc
> >> genirq: Run irq handlers with interrupts disabled
> >>
> >> interrupt handlers are definitely running in a irq-disabled context
> >> unless irq handlers enable them explicitly in the handler to permit
> >> other interrupts.
> > This doesn't explain any changes in the behaviour on SMP.
> > IRQ line can be disabled on a few stages:
> >   a) on the source (IP that generates an event)
> >   b) on IRQ router / controller
> >   c) on CPU side
>
> yes, you are right.
>
> > The commit above is discussing (rightfully!) the problem when all
> > interrupts are being served by a *single* core. Nobody prevents them
> > from being served by *different* cores simultaneously. Also, see [1].
> >
> > [1]: https://www.kernel.org/doc/htmldocs/kernel-locking/cheatsheet.html
>
> I check [1], quite useful description about locking, thanks. But you can
> see Table of locking Requirements
>
> Between IRQ handler A and IRQ handle A, it's no need for a SLIS.

Right, but it's not the case in the patches you provided.

--
With Best Regards,
Andy Shevchenko

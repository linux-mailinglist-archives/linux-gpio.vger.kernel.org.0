Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B312487E8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 16:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgHROkw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 10:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbgHROkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 10:40:51 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACD6C061389;
        Tue, 18 Aug 2020 07:40:50 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1597761647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0c8j2FthIkH4rrs8WcTM9vpYXGsDLHIU2UqecOW6mFE=;
        b=knmA7lev6zSXT2tMoQLvwdMcQzHtr7/8Cbb+IpJ1jW9bmVEmKHD3zJOWrmyCLXxzhfG4Tf
        /bT/nJbCJ2g0vK2PCHxd9akVZRCf4/MZfrSLoFK451miG5SvH4BhJOuvCswIKul+tv+vKJ
        JlZRCs7h0QKSz4Yz/g6ERdmpO3wlyiOd5XgXq45OokjavULsLFusOATLqfELp4FDRV4EHd
        nyo78KeLSKq6TEfzDC0/PgLLxgTOqJ3CGKjYBKJk34xPFYtG1RU7DuLZdzBG3PP6cXSeAL
        Q/ii9hEtu+kb6MmPks3D+imw018GftXrPHHLtbot6l51faGyZG5wytXm1YBklQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1597761647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0c8j2FthIkH4rrs8WcTM9vpYXGsDLHIU2UqecOW6mFE=;
        b=hZC+iwiwb00r/MLzg2/nELa7fQVMZbtNy51g4o+TzG2x4Nx1/t4Fi4hJ04GfIMIUbdrup2
        w1yTAUNrmLRDX+CA==
To:     Maulik Shah <mkshah@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
In-Reply-To: <74998fe6-761e-7375-c9ab-5c76d3044adf@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org> <87pn7ulwr5.fsf@nanos.tec.linutronix.de> <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com> <878sei42ql.fsf@nanos.tec.linutronix.de> <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com> <74998fe6-761e-7375-c9ab-5c76d3044adf@codeaurora.org>
Date:   Tue, 18 Aug 2020 16:40:46 +0200
Message-ID: <87r1s4hv9t.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Maulik,

On Tue, Aug 18 2020 at 10:05, Maulik Shah wrote:
> On 8/14/2020 4:28 AM, Doug Anderson wrote:
>> On Thu, Aug 13, 2020 at 3:09 PM Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> +               if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
> +                       unmask_irq(desc);
>
> I tried this patch and it didnot work as is.
>
> Calling unmask_irq() only invoke's chip's .irq_unmask callback but the=20
> underlying irq_chip have .irq_enable also present.
>
> Replacing the call with irq_enable() internally takes care of either=20
> invoking chip's .irq_enable (if its present) else it invokes unmask_irq().
>
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_enable(des=
c);
>
> probably IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND should also be renamed to=20
> IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND.

Makes sense and also works when the interrupt is already enabled.

Thanks,

        tglx




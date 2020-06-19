Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7242F2004FB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 11:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725290AbgFSJ0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 05:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgFSJ0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 05:26:11 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1559C0613EE
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 02:26:09 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n9so3724104plk.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Vf4ohuWrMr6Ie8GDWlHSJlKxCEowfJaXNdmYfwVJvPc=;
        b=jOZbgyplTYdCwtTeEcFO8ao/1IeWpEdkro9XqPz5EJ39CEsiECBlBL5OofeK8Lwhdj
         2gLiKCqlqC1tnJxGddrWrfF/XWxxnqyLOhx1yoUm0s9ovbZjUeJP9p0tkXVS9ucNU5vH
         FHcRbu9FGV/GhFMDTiPxiYqtpNNHr7NaOOqM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Vf4ohuWrMr6Ie8GDWlHSJlKxCEowfJaXNdmYfwVJvPc=;
        b=trw0x2dWEIerrE9MYPwsOU9oBHwsh/hWArkJZKgmqA1zqnOkEVi3iHlgiD6Anu2ZNQ
         JatR+EzqueMU8l6hRrBPqfxrrVx56UATv3sLZWAtxkfUAtwmshfGK92oIilnQFEQsaTm
         z/Cl17Gjgqg7jfLbj8INEYMz6DvMWkq30Yu7IWAXR6Q3caSHdd5pTBYdTovXhmwACtu2
         fMuYx7mwfTIrrTP0dwir/ftZ865xgtOzbfFPtNs1xjMOPHHSKUAzU4y3fco/9jzQktUG
         pBS5F9yoP/WLoSnmE5AjE7aSdY/nHBWw1O/o9Bz6V6hRxxc13+Uo8Ikf46NCAwjrXACm
         pgnw==
X-Gm-Message-State: AOAM531G2beqNFbHx7QULcfu02rIvoDqt6a195JICaZatR8La7ozCitb
        EKJNKOSUmLAuZnywm4OR1FvKOA==
X-Google-Smtp-Source: ABdhPJxjHsNZeQt5FvCcMCd8wr+B8WtJxmN74WGei/ANeOiFzi/Yi8987MSgZQkKyyETYu7yUepo5g==
X-Received: by 2002:a17:902:b58f:: with SMTP id a15mr7621006pls.106.1592558769148;
        Fri, 19 Jun 2020 02:26:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y136sm5440917pfg.55.2020.06.19.02.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 02:26:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4e318931-cff0-0d8b-d0a0-9d139533c551@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-5-git-send-email-mkshah@codeaurora.org> <159057454795.88029.5963412495484312088@swboyd.mtv.corp.google.com> <e565f798-e62b-7b03-6cd5-6daf9b516262@codeaurora.org> <159086679215.69627.4444511187342075544@swboyd.mtv.corp.google.com> <c93695d4-a03e-7f62-747a-90d892c48694@codeaurora.org> <159230866475.62212.10807813558467898966@swboyd.mtv.corp.google.com> <4e318931-cff0-0d8b-d0a0-9d139533c551@codeaurora.org>
Subject: Re: [PATCH v2 4/4] irqchip: qcom-pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Fri, 19 Jun 2020 02:26:07 -0700
Message-ID: <159255876756.62212.4221488367063412094@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-06-18 03:03:03)
> On 6/16/2020 5:27 PM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-06-01 04:38:25)
> >> On 5/31/2020 12:56 AM, Stephen Boyd wrote:
> >>> Quoting Maulik Shah (2020-05-29 02:20:32)
> >>>> On 5/27/2020 3:45 PM, Stephen Boyd wrote:
> >>>>> Quoting Maulik Shah (2020-05-23 10:11:13)
> >>>>>> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_dat=
a *d)
> >>>>>>            if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >>>>>>                    return;
> >>>>>>    =20
> >>>>>> +       pdc_enable_intr(d, true);
> >>>>>>            irq_chip_unmask_parent(d);
> >>>>>>     }
> >>>>>>    =20
> >>>>> I find these two hunks deeply confusing. I'm not sure what the
> >>>>> maintainers think though. I hope it would be simpler to always enab=
le
> >>>>> the hwirqs in the pdc when an irq is requested and only disable it =
in
> >>>>> the pdc when the system goes to suspend and the pdc pin isn't for a=
n irq
> >>>>> that's marked for wakeup. Does that break somehow?
> >>>> PDC monitors interrupts during CPUidle as well, in cases where deepe=
st
> >>>> low power mode happened from cpuidle where GIC is not active.
> >>>> If we keep PDC IRQ always enabled/unmasked during idle and then
> >>>> disable/mask when entering to suspend, it will break cpuidle.
> >>> How does it break cpuidle? The irqs that would be enabled/unmasked in
> >>> pdc would only be the irqs that the kernel has setup irq handlers for
> >>> (from request_irq() and friends).  We want those irqs to keep working
> >>> during cpuidle and wake the CPU from the deepest idle states.
> >>>> I hope it would be simpler to always enable
> >>>> the hwirqs in the pdc when an irq is requested and only disable it in
> >>>> the pdc when the system goes to suspend and the pdc pin isn't for an=
 irq
> >>>> that's marked for wakeup
> >>>> How does it break cpuidle?
> >> Consider a scenario..
> >> 1. All PDC irqs enabled/unmasked in HW when request_irq() happened/all=
oc happens
> >> 2. Client driver disable's irq. (lazy disable is there, so in HW its s=
till unmasked) but disabled in SW.
> >> 3. Device enters deep CPUidle low power modes where only PDC monitors =
IRQ.
> >> 4. This IRQ can still wakeup from CPUidle since it was monitored by PD=
C.
> >> 5. From handler, it comes to know that IRQ is disabled in SW, so it re=
ally invokes irq_mask callback now to disable in HW.
> >> 6. This mask callback doesn't operate on PDC (since in PDC, IRQs gets =
masked only during suspend, all other times its enabled)
> >> 7. step 3 to 6 repeats, if this IRQ keeps on coming and waking up from=
 deep cpuidle states.
> > Ok so in summary, irq is left unmasked in pdc during deep cpu idle and
> > it keeps waking up the CPU because it isn't masked at the PDC after the
> > first time it interrupts? Is this a power problem?
> yes it can be a power problem.
> >   Because from a
> > correctness standpoint we don't really care. It woke up the CPU because
> > it happened, and the GIC can decide to ignore it or not by masking it at
> > the GIC. I thought that the PDC wouldn't wake up the CPU if we masked
> > the irq at the GIC level. Is that not true?
>=20
> once PDC detects IRQ, it directly doesn't wake up CPU. it replays IRQ to =

> GIC.
>=20
> since at GIC its masked, GIC doesn't forward to cpu to immediatly wake=20
> it up.
>=20
> however after PDC detecting IRQ, it exits low power mode and=20
> watchdog/timer can wakeup upon expiry.

Ok. So the only problem is some screaming irq that really wants to be
handled but the driver that requested it has disabled it at runtime. The
IRQ keeps kicking the CPUs out of deep idle and then eventually the
timer tick happens and we've run the CPUs in a shallower idle state for
this time? Presumably we'd like to have these irqs be lazily masked at
the PDC so that they can become pending when they first arrive but not
block deep idle states if they're interrupting often while being
handled.

On the other hand, we want irq wake state to be the only factor in irqs
being unmasked at the PDC on the entry to suspend. Purely
masking/unmasking at the PDC when the irq is masked in software doesn't
work because suspend/resume will break for disabled but wake enabled
irqs. But doing that makes idle work easily because we can assume during
idle that leaving it unmasked until it fires and then masking it in the
PDC until it is handled gives us good deep idle states in the face of
screaming irqs.

What are the actual requirements? Here is my attempt to boil this
discussion down into a few bullet points:

 1. During system suspend, wake enabled irqs should be enabled in PDC
 and all other irqs should be disabled in PDC.

 2. During idle, enabled irqs must be enabled in PDC, unless they're
 pending in which case they should be masked in the PDC so as to not
 wake up the CPU from deep idle states

 3. During non-idle, non-suspend, enabled irqs must be enabled in PDC.

Or is #3 actually false and PDC has no bearing on this?

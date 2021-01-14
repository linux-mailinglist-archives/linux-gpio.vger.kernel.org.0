Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49682F689D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 19:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbhANR7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 12:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbhANR7K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 12:59:10 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0F0C061575
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:58:30 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id a31so2023129uae.11
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YdOaaHjca0rYPpPUAffL10YdPt1OqFdTLx234rktqs=;
        b=HiNnszXGd3KvwHl5TsEFq5Iqm36WlMI50MI7Np7EAgpZRcUf17UC4jUR+eUhbShJdO
         dvkDlSOAAi2Jzj4BwMRuQIjUPbJ/e9UAiTbPH3KexikDlisiTj4cPGD7fA72o8DFWugT
         X+/i7a3Ofta23WFwn8TlbR1PdrQmNUkpbodS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YdOaaHjca0rYPpPUAffL10YdPt1OqFdTLx234rktqs=;
        b=rgvp+j+4uRjjMctz2qhPybfJtYroBrYzEJYshN8JIunnCkPCNbD++utmtqQAQyxPT9
         IBFDGXN6epBWNzF5vauuvi9cSctZpJB9jLZ5dFZycyxR3DUWcPVGOGQpRTgFQFMigip0
         L93mP0f5P+RdzOzU3lBMvvW5Y4eqtASMhPbkjT89llSa5GANGUaQGirGxhNvIB5q81Xu
         zaJbtOC0tzO9gwQ9ZCHoEpfNt8O1QRsB7HPsQNBl4bVJVw/sI50m4El6W7HToJ+5GtGd
         w7jvXYkI80BiLXeSGObTOTk7RB6KlVE/CrxzdCHhcw2+8+KCiJBUcBvjpbpPsy4bmqnJ
         kNWg==
X-Gm-Message-State: AOAM532fwn9RmA7GD5EwJ1Q7PHGllguCag7fk87V/BHqnfkd6KNvwnXR
        IqDQ4R6z0l/zM6oQmLZhWK03YbjEBRqTbA==
X-Google-Smtp-Source: ABdhPJxlFYVNOw5ZCi6w144wG7CS/aD4w30GUuPz/4tDL6C2lL2ERDgLGx/cuLfQG/VVbANqtZmaIQ==
X-Received: by 2002:ab0:3894:: with SMTP id z20mr6860908uav.82.1610647109116;
        Thu, 14 Jan 2021 09:58:29 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id u66sm866402vke.8.2021.01.14.09.58.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 09:58:28 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id l187so1550751vki.6
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 09:58:28 -0800 (PST)
X-Received: by 2002:a1f:c305:: with SMTP id t5mr7529788vkf.7.1610647107578;
 Thu, 14 Jan 2021 09:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
 <161060848425.3661239.17417977666663714149@swboyd.mtv.corp.google.com> <YAB8G137wfisfOqt@builder.lan>
In-Reply-To: <YAB8G137wfisfOqt@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Jan 2021 09:58:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6O_16vdyU+d0gFeKUuS=sfGd1EKDZJt=NdAgp5osQjQ@mail.gmail.com>
Message-ID: <CAD=FV=V6O_16vdyU+d0gFeKUuS=sfGd1EKDZJt=NdAgp5osQjQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Jan 14, 2021 at 9:15 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > > @@ -195,6 +201,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> > >         if (WARN_ON(i == g->nfuncs))
> > >                 return -EINVAL;
> > >
> > > +       /*
> > > +        * If an GPIO interrupt is setup on this pin then we need special
> > > +        * handling.  Specifically interrupt detection logic will still see
> > > +        * the pin twiddle even when we're muxed away.
> > > +        *
> > > +        * When we see a pin with an interrupt setup on it then we'll disable
> > > +        * (mask) interrupts on it when we mux away until we mux back.  Note
> > > +        * that disable_irq() refcounts and interrupts are disabled as long as
> > > +        * at least one disable_irq() has been called.
> > > +        */
> > > +       if (d && i != gpio_func &&
> > > +           !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> > > +               disable_irq(irq);
> >
> > Does it need to be forced non-lazy so that it is actually disabled at
> > the GIC? I'm trying to understand how the lazy irq disabling plays into
> > this. I think it's a don't care situation because if the line twiddles
> > and triggers an irq then we'll actually disable it at the GIC in the
> > genirq core and mark it pending for resend. I wonder if we wouldn't have
> > to undo the pending state if we actually ignored it at the GIC
> > forcefully. And I also worry that it may cause a random wakeup if the
> > line twiddles, becomes pending at GIC and thus blocks the CPU from
> > running a WFI but it isn't an irq that Linux cares about because it's
> > muxed to UART, and then lazy handling runs and shuts it down. Is that
> > possible?
> >
>
> I was about to write a question about why we should disable the IRQ
> through the irqchip framework, rather than just do it in the hardware
> directly.
>
> Which I think means that I came to the same conclusion as you, that if
> we have a pin masked to non-gpio, it will still wake the system up, just
> to actually disable the IRQ lazily.
>
> Is there a problem with leaving the irq framework to believe the IRQ is
> enabled while we disable the delivery in hardware?

Earlier I had it disabling in hardware, but doing it through the IRQ
framework has the advantage of doing refcounting for us and that saves
us complexity.  If we tweaked the hardware directly we'd have to worry
about this case:

a) Client muxes away the pin: we disable in hardware
b) Client tries to disable/mask the interrupt themselves.
c) Client tries to enable/unmask the interrupt themselves

...when we got the call for c) we'd have to realize that we're still
muxed away and we'd have to ignore their request.  Also, if the mux
back happened in step b) we'd have to know _not_ to unmask the
interrupt.  Trying to solve those corner cases adds complexity.  If we
just rely on the refcounting the complexity goes away.


-Doug

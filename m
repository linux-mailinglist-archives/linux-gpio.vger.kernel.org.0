Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E233A2C2DB2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389976AbgKXRCA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 12:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKXRCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 12:02:00 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34169C0617A6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:02:00 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id m16so11458907vsl.8
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2wb1JgcU2epWYb7iN5+zCGTz6bLzovtrxzJoMWboNp4=;
        b=JJsfMe7GQA2lWJ0cihNe47ChOBzthFMJbdQ/5Jdt/2W2oowgdw3noFz6OOeW7f9PBA
         4lfBZxE6+7Ac9/BlN0h/LGcgBBV0nq9NHDAifj01wsEZJM3OZlHKkg01el7x1d6bf1ut
         NzyX8qSUtdgM0DsGslTetF7Lwf//NH68JDbE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2wb1JgcU2epWYb7iN5+zCGTz6bLzovtrxzJoMWboNp4=;
        b=dNzIdSsmcsjN7mkAHYh4QT/+Wu32HEVlvLo27BmdGBPwxUgYlaAbsSuZoZTN1iXPkH
         g7a9c6X1ndetZ2TyuY7ZNFhLvsAQRB3qW+82BpTLuXEx9o3c9a4VsmCbwlvgpURBHEul
         F9UYe4hir7cWfp5wqXrgimXkASeSdO2mHmikuZguNHJoTS4/DKd3UdFWHME8m93tqxQo
         MALYRHi7fWaR2zrn9shiMa3YmN/RWD3XenbR3USF7wwEfXPTbHTUsLTHiwhQaVNlpy2K
         PuLUKZB8CSZFw/uSZKJvCxw9aIuuQo7NgGaxM8uKvFecAeO7m0Ch3UB5Wh7cJj/m9ASz
         mtwA==
X-Gm-Message-State: AOAM5310X7A8SEVN5U27dQJijdsNjtxM+QlSicXlFmbCWT5baCiFx1Io
        DoUwf2U7cFRMBSlE9oe4E/gwj8L9PZLynA==
X-Google-Smtp-Source: ABdhPJyZwjcQ89vi7VR81pSUWtQNtKsUqvWBFr9X1xNHsZMDXKRR0I4w5i39dghbyPCuwzWf2JX1iA==
X-Received: by 2002:a67:ed99:: with SMTP id d25mr4882107vsp.48.1606237319156;
        Tue, 24 Nov 2020 09:01:59 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 99sm1537772uan.18.2020.11.24.09.01.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:01:58 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id n189so4921989vkb.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:01:57 -0800 (PST)
X-Received: by 2002:a1f:1b92:: with SMTP id b140mr4748486vkb.7.1606237316598;
 Tue, 24 Nov 2020 09:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <d65e2be33a218751e7be3342e490e076@kernel.org>
In-Reply-To: <d65e2be33a218751e7be3342e490e076@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:01:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wg-gdry1a-LjJhuKgHRr=DXq4Hu0P8nJGAzf5viEcthA@mail.gmail.com>
Message-ID: <CAD=FV=Wg-gdry1a-LjJhuKgHRr=DXq4Hu0P8nJGAzf5viEcthA@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 1:00 AM Marc Zyngier <maz@kernel.org> wrote:
>
> > @@ -187,9 +189,24 @@ static int qcom_pdc_gic_set_type(struct irq_data
> > *d, unsigned int type)
> >               return -EINVAL;
> >       }
> >
> > +     old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
> >       pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
> >
> > -     return irq_chip_set_type_parent(d, type);
> > +     ret = irq_chip_set_type_parent(d, type);
> > +
> > +     /*
> > +      * When we change types the PDC can give a phantom interrupt.
> > +      * Clear it.  Specifically the phantom shows up if a line is already
> > +      * high and we change to rising or if a line is already low and we
> > +      * change to falling but let's be consistent and clear it always.
> > +      *
> > +      * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
> > +      * interrupt will be cleared before the rest of the system sees it.
> > +      */
> > +     if (old_pdc_type != pdc_type)
> > +             irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
>
> nit: s/0/false/.

I'll fix this.


> You could also make it conditional on the parent side having been
> successful.

Good idea.


> And while we're looking at this: do you need to rollback the PDC state
> if the GIC side has failed? It's all very hypothetical, but just in
> case...

I'm going to go ahead and say "no", but I'll make this change if you
insist.  Specifically:

* We're still leaving things in a self-consistent state if we fail to
clear the parent, we'll just get a spurious interrupt.  It won't cause
any crashes / hangs / whatever.

* Since it seems very unlikely we'd ever trip this and if we ever do
it's not the end of the world, I'd rather not add extra code.

Hopefully that's OK.

-Doug

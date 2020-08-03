Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B95E23AFDE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 23:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgHCV6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 17:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgHCV6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 17:58:02 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1921FC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2020 14:58:02 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id n25so6392004vsq.6
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cHgUICdi9xK+5WmgsC8O+1KkScVXRPzwwp8CUGby/X0=;
        b=ml+4cPKmiKL+peX9skOC2i9Q69Hus93rCzCmmb7P/4Dl8nUjNtTy+US4rB+PzvHc91
         9MYptvwCJdifuqbfAddJLN62QZvtY/0gcB3JMDimUQccc2zpT2C0+EbDYVABI58h//ea
         quqkVFAxyHvUn6xjm2GhcyTFbSsMYjbIYt4Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cHgUICdi9xK+5WmgsC8O+1KkScVXRPzwwp8CUGby/X0=;
        b=jG3guJjd+Pwz0aJphkcBx/zLlJq3LY8XVs3B9oGll/YohrCaaDHCbOgJg70SYnkImi
         yL9UNU+9/vL2UK7Es6ok5YIwAAuOOeNMbZoQSlLV4swICN5l1S0n2c+q4uOYEig1CiPu
         aU1mTm3vwnKlJYN1LJuyX2FGXila7BFzUGoNA5U1XzFSw0Rn3xRj2eX3aPKYK7/UQVO1
         bKyUTEiCGx4DDKg+SseMEcf1MCq/ZruME0xCWNrOWAfXqSlIlwn2G4GI6NjFydMT6Tqi
         2+ZLHC0xblfndOu8sCVKTXgmna+WPIQJKozF/z1ni6MfxP0L4qy6KUiMtEJ9aX9i9sXQ
         0CGA==
X-Gm-Message-State: AOAM532tKiZsI/6dBenLdegNO1lmC5JtZh75xJJnVkV1Lxprgq7s9xkM
        seBuhbb2pMxxmwZQyhSNIS5fRKW0Aow=
X-Google-Smtp-Source: ABdhPJwB66tP9UXy/FLMXQ7jIF8ci7giirxR81Q7j9oRRTjgkQwnUXtt0mrWD/RnKXA8k4jYTp/Jlg==
X-Received: by 2002:a67:ed45:: with SMTP id m5mr13333573vsp.197.1596491880847;
        Mon, 03 Aug 2020 14:58:00 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id x10sm2856021vkd.56.2020.08.03.14.57.59
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 14:58:00 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id z26so6138791uaa.4
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 14:57:59 -0700 (PDT)
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr12794962uan.121.1596491878639;
 Mon, 03 Aug 2020 14:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200714080254.v3.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
 <CANcMJZC-kAc1kqqNhfd9wvFS4ans8t7cpAfNVZbybA4W6x5-KQ@mail.gmail.com>
In-Reply-To: <CANcMJZC-kAc1kqqNhfd9wvFS4ans8t7cpAfNVZbybA4W6x5-KQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Aug 2020 14:57:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNY8vR4ip2w47rf7rnBmtenEXtjXstj8PWNaXjCN3ZXQ@mail.gmail.com>
Message-ID: <CAD=FV=WNY8vR4ip2w47rf7rnBmtenEXtjXstj8PWNaXjCN3ZXQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Handle broken/missing PDC dual edge
 IRQs on sc7180
To:     John Stultz <john.stultz@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Aug 3, 2020 at 2:06 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Tue, Jul 14, 2020 at 8:08 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Depending on how you look at it, you can either say that:
> > a) There is a PDC hardware issue (with the specific IP rev that exists
> >    on sc7180) that causes the PDC not to work properly when configured
> >    to handle dual edges.
> > b) The dual edge feature of the PDC hardware was only added in later
> >    HW revisions and thus isn't in all hardware.
> >
> > Regardless of how you look at it, let's work around the lack of dual
> > edge support by only ever letting our parent see requests for single
> > edge interrupts on affected hardware.
> >
> > NOTE: it's possible that a driver requesting a dual edge interrupt
> > might get several edges coalesced into a single IRQ.  For instance if
> > a line starts low and then goes high and low again, the driver that
> > requested the IRQ is not guaranteed to be called twice.  However, it
> > is guaranteed that once the driver's interrupt handler starts running
> > its first instruction that any new edges coming in will cause the
> > interrupt to fire again.  This is relatively commonplace for dual-edge
> > gpio interrupts (many gpio controllers require software to emulate
> > dual edge with single edge) so client drivers should be setup to
> > handle it.
> >
> > Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Just as a heads up. I started seeing boot failures (crashes really
> early before we get serial output) with db845c when testing with the
> android-mainline tree that pulled v5.8 in.

Even before earlycon?  Ick.  For me earlycon comes up way before
pinctrl and I thought that, by design, earlycon came up so dang early
that you could debug almost anything with it.

To confirm, I could even drop into earlycon_kgdb (which starts later
than earlycon), then set a breakpoint on msm_pinctrl_probe() and I'd
hit my breakpoint.  Enabling earlycon should be super easy these
days--just add the "earlycon" command line parameter and the kernel
seems to do the rest of the magic based on the "stdout-path".  I guess
if your bootloader doesn't cooperate and leave the system in an OK
state then you'll be in bad shape, but otherwise it should be nice...

NOTE: if you have earlycon and this is still causing crashes before
earlycon starts, the only things I can think of are side effects of
this patch.  Could it have made your kernel just a little too big and
now you're overflowing some hard limit of the bootloader?  Maybe
you're hitting a ccache bug and using some stale garbage (don't laugh,
this happened to me the other year)?  Maybe there's a pointer bug and
this moves addresses just enough to make it cause havoc?


> I did some quick bisection and came down to this patch, and sure
> enough things boot again with this patch reverted.
>
> In my testing earlier today with v5.8 (+ just a few patches for db845c
> support), I didn't see this failure, but the configs in use are
> different there.
>
> I'll try to spend a bit of time to understand exactly what is failing,
> but if you have any initial suggestions for things to try, I'd
> appreciate it.

So on SDM845 we aren't setting "wakeirq_dual_edge_errata", right?
It's possible that you also need it, but I didn't have an SDM845
device in front of me to test with--I only have remote access to one.
...but in any case, the fact that SDM845 doesn't have
"wakeirq_dual_edge_errata" set should eliminate a bunch of code.

Once you eliminate that there's almost nothing left of this patch.
You could try commenting out:

irq_set_handler_locked(d, handle_fasteoi_irq);

...and see if that helps?

NOTE: I just tried putting kernel 5.8 on my sdm845-cheza device.  It
booted up without crashing...  I'm probably not using the same config
you are, but at least it appears that sdm845 isn't totally broken or
anything...

-Doug

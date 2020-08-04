Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1699823B1D3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 02:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgHDAsu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 20:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgHDAsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 20:48:50 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6CBC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2020 17:48:49 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id h16so9283315oti.7
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 17:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2vuZwapNF5SY96ImcvQKBxAdYTUIocJnP2+tFQw1Cs=;
        b=cO691Y4BMf4ps3AJh/Y/fA337JoELDzwQJZnF1XDKwLjD32hTFOYbYZ9CQBbVItKll
         EppsWEsMpVQ3lFu5Q41Furs4iceDP1gdbmLNgQDiUgrII72FXLUGGUel1U6Gl8scYeeb
         p+faUAZS1ku28ZXI2Cmuqo9tOhpJXdYBUH2jlRZYtWmPOnq//e3a2pLtZXL9FYrIMw+H
         pV4Y93xjjhgRSH7NerHJRHMWgkPJhIkr38ul1j99PyaADQAAUs/NC5LCJo4RbbYfCvri
         n2Rye4Mzd6ycNPnjC7Jq0+1sHKXow9Q8o+YqxGhD03snC9E4A1l+4/uqo66QQqpBhXB9
         tDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2vuZwapNF5SY96ImcvQKBxAdYTUIocJnP2+tFQw1Cs=;
        b=BJvETSA/HyB/ty4ZIr3IOCEYmOUMQ2pOpiJTmKCbdU7BBxBjmdGGRQziVekdCpcJF3
         gfXLlgwrXjL6kvC7xGqd9ZkqLwtkMZTWOsnh95cFj3FjR0GO7xGcarG5EmA7kYB82LZx
         nFpY6yv9fYvl0gNuJSS2GrnOvdQtYYVhuFPCUCqIVUmudjuvJtaDfYwe5oFYUUPYZUZK
         HwHeH6EOD1FZh4WdpM02yg8L9u+CDj9TSCg4dhpxAG6XxOP3Xy26bs3KSW/cbH4EBska
         fnVFXdbr2ZAz33XsrAUVQR9vfpCyCTsQEWwxlb3IaIMUpmTJXE00C89zlsov81fFeDqF
         QCeg==
X-Gm-Message-State: AOAM531K+4b6fOesE1MW6i2MHeE1WqDhcjXyKkvqKmbt/+iLlfk98wTq
        5S6DIgbKMEZa5ni0EqTCUf1oOC6sXNap+3DQNRg6/A==
X-Google-Smtp-Source: ABdhPJyn7E460ohTdt8DCEf76ua+Wb3lwAXOyx60eoAK03RiF2uxbAJwRo47dnCpYne0nL6Ya4O5Td1e9XaI/t7Xz2M=
X-Received: by 2002:a05:6830:3196:: with SMTP id p22mr16791603ots.102.1596502129252;
 Mon, 03 Aug 2020 17:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200714080254.v3.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
 <CANcMJZC-kAc1kqqNhfd9wvFS4ans8t7cpAfNVZbybA4W6x5-KQ@mail.gmail.com> <CAD=FV=WNY8vR4ip2w47rf7rnBmtenEXtjXstj8PWNaXjCN3ZXQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WNY8vR4ip2w47rf7rnBmtenEXtjXstj8PWNaXjCN3ZXQ@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 3 Aug 2020 17:48:38 -0700
Message-ID: <CALAqxLUJDGeQ1+k0Cz4rLujW_A=UAFLEuhMWrE8im1NF6XwjtQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Handle broken/missing PDC dual edge
 IRQs on sc7180
To:     Doug Anderson <dianders@chromium.org>
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

On Mon, Aug 3, 2020 at 2:58 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 3, 2020 at 2:06 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Tue, Jul 14, 2020 at 8:08 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > Depending on how you look at it, you can either say that:
> > > a) There is a PDC hardware issue (with the specific IP rev that exists
> > >    on sc7180) that causes the PDC not to work properly when configured
> > >    to handle dual edges.
> > > b) The dual edge feature of the PDC hardware was only added in later
> > >    HW revisions and thus isn't in all hardware.
> > >
> > > Regardless of how you look at it, let's work around the lack of dual
> > > edge support by only ever letting our parent see requests for single
> > > edge interrupts on affected hardware.
> > >
> > > NOTE: it's possible that a driver requesting a dual edge interrupt
> > > might get several edges coalesced into a single IRQ.  For instance if
> > > a line starts low and then goes high and low again, the driver that
> > > requested the IRQ is not guaranteed to be called twice.  However, it
> > > is guaranteed that once the driver's interrupt handler starts running
> > > its first instruction that any new edges coming in will cause the
> > > interrupt to fire again.  This is relatively commonplace for dual-edge
> > > gpio interrupts (many gpio controllers require software to emulate
> > > dual edge with single edge) so client drivers should be setup to
> > > handle it.
> > >
> > > Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Just as a heads up. I started seeing boot failures (crashes really
> > early before we get serial output) with db845c when testing with the
> > android-mainline tree that pulled v5.8 in.
>
> Even before earlycon?  Ick.  For me earlycon comes up way before
> pinctrl and I thought that, by design, earlycon came up so dang early
> that you could debug almost anything with it.
>
> To confirm, I could even drop into earlycon_kgdb (which starts later
> than earlycon), then set a breakpoint on msm_pinctrl_probe() and I'd
> hit my breakpoint.  Enabling earlycon should be super easy these
> days--just add the "earlycon" command line parameter and the kernel
> seems to do the rest of the magic based on the "stdout-path".  I guess
> if your bootloader doesn't cooperate and leave the system in an OK
> state then you'll be in bad shape, but otherwise it should be nice...
>
> NOTE: if you have earlycon and this is still causing crashes before
> earlycon starts, the only things I can think of are side effects of
> this patch.  Could it have made your kernel just a little too big and
> now you're overflowing some hard limit of the bootloader?  Maybe
> you're hitting a ccache bug and using some stale garbage (don't laugh,
> this happened to me the other year)?  Maybe there's a pointer bug and
> this moves addresses just enough to make it cause havoc?
>

Sorry! False positive on this one. The android-mainline tree has
serial drivers as modules, so earlycon doesn't help right off.
I reworked the config so I could use earlycon and realized the trouble
was with the new selected configs in this patch which need to also be
selected in the GKI kernel.

Apologies for the noise.

thanks
-john

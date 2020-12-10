Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719702D4FD2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 01:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbgLJAoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 19:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730442AbgLJAoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 19:44:07 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26FFC061793
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 16:43:19 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id t16so816155vkl.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 16:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQorzTW27QOsMWD3KHq+FAGOyijZWBp7eao6c1glD1g=;
        b=L2LlsWZYF4pVW8WTWhpUR0IO6rkyLZZ+EBTHXkv0Gmk9+l/0n30L23wN5nChAj5tQQ
         ZVZxE9/QTq9fGZYLoDk5uWOofg/7bC+O0ACiA1Zgp1k4vENkUvV8yk/kZq/1OpaCgCC1
         W4ODAzrUJ/zkEXgLVeyc2BUBA9vh+hEriVW6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQorzTW27QOsMWD3KHq+FAGOyijZWBp7eao6c1glD1g=;
        b=pEUDhcr7bKw0sknA+WqVXO6Hd0KmbMWolDhmfS6dapGduF6RtdUDARUn7ifHDOlU+R
         8Ur6qHqHDW/rjvYRmie3MnqmXWK3J6nlgui7EdBo/aRy4mX+HNVWezhVHEFqpxOCqhka
         NOMXAwXaseyai7Qf7vZ+KJJPbwK9k7EYTZYyYt4+HMkeQYH3vmaaxNwcZnlCATbK+zXA
         iJ86JLcGZEMywMZI1nB4YhqdP8Ep0kQUPGpcb3XKGURUwoLLyTuPARcR0kOe/jeAv1w6
         TJtKyzWo+vUFIojSVWDPuHse6seaxyW8tW9JbQgTe5tHHwmV0jFr+DtlwhetI+56IeDD
         LlEA==
X-Gm-Message-State: AOAM530CxfDLRUBZMaPVF+AkGcr7j+nu9/zDd+7hScv/QV3ZZYsYPnwi
        wVo7WIShvZlkhXJq9kTISstkpMtb6tRrOg==
X-Google-Smtp-Source: ABdhPJzVBAj5yNhworslwP7BJkVZVZYiovSDo59BjhnFhttG2Qp5spD2/wiTyAcTu81MGoWjBFmQ3g==
X-Received: by 2002:a1f:3f51:: with SMTP id m78mr5582495vka.3.1607560998611;
        Wed, 09 Dec 2020 16:43:18 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 127sm359336vse.8.2020.12.09.16.43.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 16:43:17 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id w66so816325vka.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 16:43:17 -0800 (PST)
X-Received: by 2002:a1f:3fc9:: with SMTP id m192mr5293407vka.17.1607560996597;
 Wed, 09 Dec 2020 16:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org> <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
 <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org> <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
 <5f24ec87-6d91-dfd9-0f4f-6687f37c60ac@codeaurora.org>
In-Reply-To: <5f24ec87-6d91-dfd9-0f4f-6687f37c60ac@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 9 Dec 2020 16:43:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wm_q60w34LmbtC88BkfS0aKp_a=AjnuYFL=g-DX_-=yQ@mail.gmail.com>
Message-ID: <CAD=FV=Wm_q60w34LmbtC88BkfS0aKp_a=AjnuYFL=g-DX_-=yQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Dec 8, 2020 at 9:54 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> >> but as long as its IRQ is in disabled/masked state it
> >> doesn't matter.
> > ...but there's no requirement that someone would need to disable/mask
> > an interrupt while switching the muxing, is there?  So it does matter.
> >
> >
> >> its only when the GPIO is again set to IRQ mode with set_mux callback,
> >> the phantom IRQ needs clear to start as clean.
> >>
> >> So we should check only for if (i == pctrl->soc->gpio_func) then clear
> >> phantom IRQ.
> >>
> >> The same is case with .direction_output callback, when GPIO is used as
> >> output say as clock, need not clear any phantom IRQ,
> >>
> >> The reason is with every pulse of clock it can latch as pending IRQ in
> >> GIC_ISPEND as long as it stay as output mode/clock.
> >>
> >> its only when switching back GPIO from output direction to input & IRQ
> >> function, need to clear the phantom IRQ.
> >>
> >> so we do not require clear phantom irq in .direction_output callback.
> > I think all the above explanation is with the model that the interrupt
> > detection logic is still happening even when muxed away.  I don't
> > believe that's true.
> Its not the interrupt detection logic that is still happening when muxed
> away, but the GPIO line is routed to GIC from PDC.
> The GPIO line get forwarded when the system is active/out of system
> level low power mode to GIC irrespective of whether GPIO is used as
> interrupt or not.
> Due to this it can still latch the IRQ at GIC after switching to lets
> say Rx mode, whenever the line has any data recive, the line state
> toggles can be latched as error interrupt at GIC.

From my tests, though, I strongly believe that the pin is only visible
to the PDC if it's muxed as GPIO.  Specifically, in my tests I did
this (with all my patches applied so there were no phantom interrupts
when remuxing):

a) Muxed the pin away from GPIO to special function, but _didn't_ mask
the interrupt.

b) Toggled the line a whole bunch.  These caused no interrupts at all.

c) Muxed back to GPIO.

To me this is quite strong evidence that the muxing is "earlier" in
the path than the connection to the PDC.  In other words, if you
change the mux away from GPIO then the PDC stops seeing it and thus
the GIC also stops seeing it.  The GIC can't latch what it can't see.
This means while you're in "Rx mode" it can't be latched.


OK, so just in case this somehow only happens in S3, I also tried this
(with my patch from https://crrev.com/c/2556012):

a) Muxed away from GPIO ("bogus" pinmux)

b) Enter S3.

c) Toggle the GPIO a whole bunch ("wp enable / wp disable" on Cr50).

d) Wake from S3.

e) Check to see if the interrupt fired a bunch.  It didn't fire at all


In my test code the interrupt is not masked, only muxed away.  That
means that if, somehow, the PDC was still observing it then we'd see
the interrupt fire.  We don't.


Unless I messed up in my tests (always possible, though by this point
I've run them a number of times) then it still feels like your mental
model is wrong, or it's always possible I'm still misunderstanding
your model.  Regardless, rather than trying to re-explain your model
can you please confirm that you've written test code to confirm your
mental model?  If so, can you please provide this test code?  I've
provided several test patches proving out my mental model.

> As the interrupt is in disabled state it won't be sent to CPU.
> Its only when the driver chooses to switch back to interrupt mode we
> want to clear the error interrupt latched to start as clean. same is the
> case when used as output direction.
>
> Hope above is clear.

Unfortunately, it's still not.  :(  Can I convince you to provide a
test patch and a set of steps that will demonstrate the problem you're
worried about?  Specifically:

a) Maybe you're talking about the initial switch from a plain GPIO
input to making it an interrupt for the first time?  Are you worried
about a phantom interrupt in this case?  After patch #1 I think we're
safe because pdc_gic_set_type() will always clear the interrupt,
right?


b) You say "switch back to interrupt mode".  Are you imagining that a
driver does something like this:

request_irq();
...
free_irq();
...
request_irq();

If you're worried about that then we can implement irq_shutdown() for
PDC and then make sure we clear on the first enable after a shutdown,
I guess?


c) Maybe when you say "switch back to interrupt mode" you mean
something else?  If you are talking about muxing away and then muxing
back then I think we already have this covered.  If you are talking
about masking/unmasking then the whole point is that we _do_ want
interrupts latched while masked, right?


OK, I'm going to send out a v3 just to get the already-identified
problems fixed and also to allow landing of patch #1 in the series,
which I think is all agreed upon.  My request to you is that if you
think my code misses a specific case to provide some test patches to
demonstrate that case.


-Doug

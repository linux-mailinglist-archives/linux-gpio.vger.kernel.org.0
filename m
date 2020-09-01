Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A132C258C17
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 11:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgIAJvo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Sep 2020 05:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgIAJvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Sep 2020 05:51:44 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4765DC061244;
        Tue,  1 Sep 2020 02:51:44 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1598953902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=48rUkxjWix//BTZHIilZmp+tSBPVqvbxLdM3hkLdhdY=;
        b=iZ0wBdNv2fBTQ5zety+Nmwt5egV8jLK6q64HUIBQJsUxl/Mja/Hxnt1RYSTiI+mkJg3u/m
        Jc9l62x0u+cLaYb2wJUFuYSqWKfYj5g48rSkiB0zT9Izgxss2S1TaXv7/nS0VIekbYeMC+
        6oyXei1vPQKAejMf3ne1EIAciKv254OAdyA+142Fd15kAPTzoKf53ffXEwCF9Z/sFpc/HK
        6rSaPKEH+vekaTwMPtzbOtguI3dDUIC5mVlWdAaCeGWbIHta+qVs51X2/ZaZAa7g1pMv5h
        EU2TV1APGyL5ymsMj/C26b1o/K/sJsols6tf9ZbV46zKrPeaYSZU+XOHLhCmyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1598953902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=48rUkxjWix//BTZHIilZmp+tSBPVqvbxLdM3hkLdhdY=;
        b=NPq5yOVrC9fNkeNzJIQTdtD2aY2lceGpwAP5BVzACVnLvouko33WjhXoAlFKuk0/izQH8B
        D6YHvY81AJU8bGBw==
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LinusW <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
In-Reply-To: <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com> <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org> <87y2m1vhkm.fsf@nanos.tec.linutronix.de> <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com>
Date:   Tue, 01 Sep 2020 11:51:41 +0200
Message-ID: <877dtdj042.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31 2020 at 08:12, Doug Anderson wrote:
> On Wed, Aug 26, 2020 at 3:15 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>> There are two reasonable choices here:
>>
>> 1) Do the symmetric thing
>>
>> 2) Let the drivers call a new function disable_wakeup_irq_for_suspend()
>>    which marks the interrupt to be enabled from the core on suspend and
>>    remove the enable call on the resume callback of the driver.
>>
>>    Then you don't need the resume part in the core and state still is
>>    consistent.
>>
>> I'm leaning towards #2 because that makes a lot of sense.
>
> IIUC, #2 requires that we change existing drivers that are currently
> using disable_irq() + enable_irq_wake(), right?  Presumably, if we're
> going to do #2, we should declare that what drivers used to do is now
> considered illegal, right?  Perhaps we could detect that and throw a
> warning so that they know that they need to change to use the new
> disable_wakeup_irq_for_suspend() API.  Otherwise these drivers will
> work fine on some systems (like they always have) but will fail in
> weird corner cases for systems that are relying on drivers to call
> disable_wakeup_irq_for_suspend().  That doesn't sound super great to
> me...

Hmm. With disable_irq() + enable_irq_wake() in the driver suspend path
the driver already makes an implicit assumption about the underlying irq
chip functionality, i.e. it expects that even with the interrupt
disabled the irq chip can wake up the system.

Now with the new flag magic and #1 we are just working around the driver
assumptions at the interrupt chip level.

That's inconsistent at best.

How many drivers are doing that sequence?  And the more important
question is why are they calling disable_irq() in the first place if
they want to be woken up by that interrupt.

The point is that the core suspend code disables all interrupts which
are not marked as wakeup enabled automatically and reenables them after
resume. So why would any driver invoke disable_irq() in the suspend
function at all? Historical raisins?

Thanks,

        tglx

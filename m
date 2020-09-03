Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A644A25C174
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 15:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbgICM5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 08:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbgICM5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 08:57:39 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794DEC061244;
        Thu,  3 Sep 2020 05:57:34 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1599137845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vuPo2hCQv8SYu4U0pyiBsvIC6jH3hb6WpU0DtzVJ3ak=;
        b=XLwOX34MqXvN9SABiyVxcmMFknw7a5CVieo73V8pHM8SvlMKKDW1n3MX+SJRdt3It29oMP
        BpAi8mH8pWLpe09siGZn6Wg9s7xECjKpDW1silpF8bbvwc8S8F8HmdVJf/PTMWjrr1M+ey
        2gm6CjMJrBX3he0EyfE1o8zKHdl0WhC3DZ36nArG2JFgRv/4jwZVx1dVi+dfXLSq9pO6nJ
        1Ah/llGOmjKaGAfsn5sqGTfG7wvZ9DGb4QQ+mvwgWMBCT0PRILm3Y6iE1z6mMtoeA5lcqS
        mdP4Gcz0uTdD3PIJPXWcuy49In3PKaDLRsSTon1YtCTNeuIJhj6XJMRNnlHLxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1599137845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vuPo2hCQv8SYu4U0pyiBsvIC6jH3hb6WpU0DtzVJ3ak=;
        b=Jc7Q/jSXOOgAkG6PNMWi0mBFGibHsSx3dFMLGuGjPFT8XDC4nOu3ZiNXHdw2L/ao1y3YnZ
        uegmYbq2bMhTXKBg==
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
        Srinivas Rao L <lsrao@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
In-Reply-To: <CAD=FV=Ua7fLGw6JiG1rnCKpAdO1nXX4A4x1Why-LE9L_FBFe8Q@mail.gmail.com>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com> <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org> <87y2m1vhkm.fsf@nanos.tec.linutronix.de> <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com> <877dtdj042.fsf@nanos.tec.linutronix.de> <CAD=FV=Ua7fLGw6JiG1rnCKpAdO1nXX4A4x1Why-LE9L_FBFe8Q@mail.gmail.com>
Date:   Thu, 03 Sep 2020 14:57:25 +0200
Message-ID: <87zh67uife.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 02 2020 at 13:26, Doug Anderson wrote:
> Specifically I think it gets back to the idea that, from a device
> driver's point of view, there isn't a separate concept of disabling an
> IRQ (turn it off and stop tracking it) and masking an IRQ (keep track
> of it but don't call my handler until I unmask).  As I understand it
> drivers expect that the disable_irq() call is actually a mask and that
> an IRQ is never fully disabled unless released by the driver.  It is a
> little unfortunate (IMO) that the function is called disable_irq() but
> as far as I understand that's historical.

Yes, the naming is historical but it always meant:

Don't invoke an interrupt handler. Whether that's achieved by actually
masking it at the interrupt chip level in hardware or by software state
in the core does not matter from the driver perspective.

>> The point is that the core suspend code disables all interrupts which
>> are not marked as wakeup enabled automatically and reenables them after
>> resume. So why would any driver invoke disable_irq() in the suspend
>> function at all? Historical raisins?
>
> One case I can imagine: pretend that there are two power rails
> controlling a device.  One power rail controls the communication
> channel between the CPU and the peripheral and the other power rail
> controls whether the peripheral is on.  At suspend time we want to
> keep the peripheral on but we can shut down the power to the
> communication channel.
>
> One way you could do this is at suspend time:
>   disable_irq()
>   turn_off_comm_power()
>   enable_irq_wake()
>
> You'd do the disable_irq() (AKA mask your interrupt) because you'd
> really want to make sure that your handler isn't called after you
> turned off the communication power.  You want to leave the interrupt
> pending/masked until you are able to turn the communications channel
> back on and then you can query why the wakeup happened.

Ok.

> Now, admittedly, you could redesign the above driver to work any
> number of different ways.  Maybe you could use the "noirq" suspend to
> turn off your comm power or maybe you could come up with another
> solution.  However, since the above has always worked and is quite
> simple I guess that's what drivers use?

That comm power case is a reasonable argument for having that
sequence. So we need to make sure that the underlying interrupt chips do
the right thing.

We have the following two cases:

1) irq chip does not have a irq_disable() callback and does not
   have IRQ_DISABLE_UNLAZY set

   In that case the interrupt is not masked at the hardware level. It's
   just software state. If the interrupt fires while disabled it is
   marked pending and actually masked at the hardware level.

   Actually there is a race condition which is not handled:

   disable_irq()
   ...
   
   interrupt fires
      mask and mark pending

   ....
   suspend_device_irq()
      if (wakeup source) {
         set_state(WAKEUP ARMED);
         return;
      }

   That pending interrupt will not prevent the machine from going into
   suspend and if it's an edge interrupt then an unmask in
   suspend_device_irq() won't help. Edge interrupts are not resent in
   hardware. They are fire and forget from the POV of the device
   hardware.

2) irq chip has a irq_disable() callback or has IRQ_DISABLE_UNLAZY set

   In that case disable_irq() will mask it at the hardware level and it
   stays that way until enable_irq() is invoked.

#1 kinda works and the gap is reasonably trivial to fix in
   suspend_device_irq() by checking the pending state and telling the PM
   core that there is a wakeup pending.

#2 Needs an indication from the chip flags that an interrupt which is
   masked has to be unmasked when it is a enabled wakeup source.

I assume your problem is #2, right? If it's #1 then UNMASK_IF_WAKEUP is
the wrong answer.

Thanks,

        tglx

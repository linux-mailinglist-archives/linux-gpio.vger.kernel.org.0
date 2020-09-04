Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9EC25D574
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 11:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgIDJyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 05:54:05 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:60128 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729872AbgIDJyE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 05:54:04 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1599213242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cugrXnkRn11sd/5TRoS+8LjjADM+0MaDEb+HS6mrI+I=;
        b=LYzceDkwg25qb0yFidvTH4u2aIFPIFwLqUIU/w3JPWk+/a5mYvTtpDlYloaW93VILAv8VX
        UImKaw94S8mfPuknMYgJGK7ZPvlEcYLoSoaFTtn8rYyQe+OHnTi7H8vs78bAhGjqfLEitD
        fKnxTovCaL+7c1ZC+IoWE97T3esDDGqeP2tP2nyi0DT5f35rxe+/Bvivj81np5DK/XmQ2E
        ZHZg3OOo2Qk7XsQwWw4i/8gPWdbSDWsgIRBPMQv23tcdeDrQ+N47Y2H+6qK2PcLVxZtuPw
        /QCY/vy5SHUkkSx/A4ljItfBhRpf7lYwoAv4GQVAVCb7v7ZPuS3UP2gacKVO1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1599213242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cugrXnkRn11sd/5TRoS+8LjjADM+0MaDEb+HS6mrI+I=;
        b=g2abxvX+AFz1a4IoY+hJICUCaj09wZglql9RyaAaFCkdj6GJSbq/GCKqkHLG2CVkQYCiaq
        CblhKn0oNXhtXXCg==
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
In-Reply-To: <CAD=FV=U8vchyRXOjozYYroq3Mit_gt=XXADLfn0W4N4TyQzyjQ@mail.gmail.com>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com> <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org> <87y2m1vhkm.fsf@nanos.tec.linutronix.de> <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com> <877dtdj042.fsf@nanos.tec.linutronix.de> <CAD=FV=Ua7fLGw6JiG1rnCKpAdO1nXX4A4x1Why-LE9L_FBFe8Q@mail.gmail.com> <87zh67uife.fsf@nanos.tec.linutronix.de> <CAD=FV=U8vchyRXOjozYYroq3Mit_gt=XXADLfn0W4N4TyQzyjQ@mail.gmail.com>
Date:   Fri, 04 Sep 2020 11:54:01 +0200
Message-ID: <87pn7150li.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Doug,

On Thu, Sep 03 2020 at 16:19, Doug Anderson wrote:
> On Thu, Sep 3, 2020 at 5:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>    That pending interrupt will not prevent the machine from going into
>>    suspend and if it's an edge interrupt then an unmask in
>>    suspend_device_irq() won't help. Edge interrupts are not resent in
>>    hardware. They are fire and forget from the POV of the device
>>    hardware.
>
> Ah, interesting.  I didn't think about this case exactly.  I might
> have a fix for it anyway.  At some point in time I was thinking that
> the world could be solved by relying on lazily-disabled interrupts and
> I wrote up a patch to make sure that they woke things up.  If you're
> willing to check out our gerrit you can look at:
>
> https://crrev.com/c/2314693
>
> ...if not I can post it as a RFC for you.

I actually tried despite my usual aversion against web
interfaces. Aversion confirmed :)

You could have included the 5 lines of patch into your reply to spare me
the experience. :)

> I'm sure I've solved the problem in a completely incorrect and broken
> way, but hopefully the idea makes sense.  In discussion we decided not
> to go this way because it looked like IRQ clients could request an IRQ
> with IRQ_DISABLE_UNLAZY and then that'd break us.  :( ...but even so I
> think the patch is roughly right and would address your point #1.

Kinda :) But that's still incomplete because it does not handle the case
where the interrupt arrives between disable_irq() and enable_irq_wake().
See below.

>> 2) irq chip has a irq_disable() callback or has IRQ_DISABLE_UNLAZY set
>>
>>    In that case disable_irq() will mask it at the hardware level and it
>>    stays that way until enable_irq() is invoked.
>>
>> #1 kinda works and the gap is reasonably trivial to fix in
>>    suspend_device_irq() by checking the pending state and telling the PM
>>    core that there is a wakeup pending.
>>
>> #2 Needs an indication from the chip flags that an interrupt which is
>>    masked has to be unmasked when it is a enabled wakeup source.
>>
>> I assume your problem is #2, right? If it's #1 then UNMASK_IF_WAKEUP is
>> the wrong answer.
>
> Right, the problem is #2.  We're not in the lazy mode.

Right and that's where we want the new chip flag with the unmask if
armed.

Thanks,

        tglx

8<------

 kernel/irq/pm.c |   27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -13,14 +13,19 @@
 
 #include "internals.h"
 
+static void irq_pm_do_wakeup(struct irq_desc *desc)
+{
+	irqd_clear(&desc->irq_data, IRQD_WAKEUP_ARMED);
+	desc->istate |= IRQS_SUSPENDED | IRQS_PENDING;
+	pm_system_irq_wakeup(irq_desc_get_irq(desc));
+}
+
 bool irq_pm_check_wakeup(struct irq_desc *desc)
 {
 	if (irqd_is_wakeup_armed(&desc->irq_data)) {
-		irqd_clear(&desc->irq_data, IRQD_WAKEUP_ARMED);
-		desc->istate |= IRQS_SUSPENDED | IRQS_PENDING;
 		desc->depth++;
 		irq_disable(desc);
-		pm_system_irq_wakeup(irq_desc_get_irq(desc));
+		irq_pm_do_wakeup(desc);
 		return true;
 	}
 	return false;
@@ -69,12 +74,24 @@ void irq_pm_remove_action(struct irq_des
 
 static bool suspend_device_irq(struct irq_desc *desc)
 {
+	struct irq_data *irqd = &desc->irq_data;
+
 	if (!desc->action || irq_desc_is_chained(desc) ||
 	    desc->no_suspend_depth)
 		return false;
 
-	if (irqd_is_wakeup_set(&desc->irq_data)) {
-		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
+	if (irqd_is_wakeup_set(irqd)) {
+		irqd_set(irqd, IRQD_WAKEUP_ARMED);
+		/*
+		 * Interrupt might have been disabled in the suspend
+		 * sequence before the wakeup was enabled. If the interrupt
+		 * is lazy masked then it might have fired and the pending
+		 * bit is set. Ignoring this would miss the wakeup.
+		 */
+		if (irqd_irq_disabled(irqd) && desc->istate & IRQS_PENDING) {
+			irq_pm_do_wakeup(desc);
+			return false;
+		}
 		/*
 		 * We return true here to force the caller to issue
 		 * synchronize_irq(). We need to make sure that the

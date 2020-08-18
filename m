Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E52247D97
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 06:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgHREgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 00:36:24 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26592 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726099AbgHREgX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 00:36:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597725382; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=a4MsEd7w9Xaw/EnHnPCC+IhjN1gT/2LlsZ1b1KKxLhg=; b=Qn9Ld8Tddo0tkJNwRqhFu1S7nSlkx61EpJeRS8ATAOlB0h4FiauTVKiOttvnHPatIlgXZhAJ
 uN9KohBvs+UGJGpdtmRLdCzxrRFsb0tKGM7d7nZgvfcn0zP0q6cDj+bint+a61lVHTcWU3ex
 f3tPDnz6Zq+SPsjt8eznmkKym98=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f3b5ab68567201751b03181 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 04:36:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27250C433CA; Tue, 18 Aug 2020 04:36:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.0.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3A17C433C6;
        Tue, 18 Aug 2020 04:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3A17C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and
 irq_resume_one() callbacks
To:     Doug Anderson <dianders@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
 <87pn7ulwr5.fsf@nanos.tec.linutronix.de>
 <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com>
 <878sei42ql.fsf@nanos.tec.linutronix.de>
 <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <74998fe6-761e-7375-c9ab-5c76d3044adf@codeaurora.org>
Date:   Tue, 18 Aug 2020 10:05:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/14/2020 4:28 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Aug 13, 2020 at 3:09 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>> Specifically the problem we're trying to address is when an IRQ is
>>> marked as "disabled" (driver called disable_irq()) but also marked as
>>> "wakeup" (driver called enable_irq_wake()).  As per my understanding,
>>> this means:
>>>
>>> * Don't call the interrupt handler for this interrupt until I call
>>> enable_irq() but keep tracking it (either in hardware or in software).
>>> Specifically it's a requirement that if the interrupt fires one or
>>> more times while masked the interrupt handler should be called as soon
>>> as enable_irq() is called.
>> irq_disable() has two operating modes:
>>
>>      1) Immediately mask the interrupt at the irq chip level
>>
>>      2) Software disable it. If an interrupt is raised while disabled
>>         then the flow handler observes disabled state, masks it, marks it
>>         pending and returns without invoking any device handler.
>>
>> On a subsequent irq_enable() the interrupt is unmasked if it was masked
>> and if the interrupt is marked pending and the interrupt is not level
>> type then it's attempted to retrigger it. Either in hardware or by a
>> software replay mechanism.
>>
>>> * If this interrupt fires while the system is suspended then please
>>> wake the system up.
>> Well, that's kinda contradicting itself. If the interrupt is masked then
>> what is the point? I'm surely missing something subtle here.
> This is how I've always been told that the API works and there are at
> least a handful of drivers in the kernel whose suspend routines both
> enable wakeup and call disable_irq().  Isn't this also documented as
> of commit f9f21cea3113 ("genirq: Clarify that irq wake state is
> orthogonal to enable/disable")?
>
>
>>> On some (many?) interrupt controllers a masked interrupt won't wake
>>> the system up.  Thus we need some point in time where the interrupt
>>> controller can unmask interrupts in hardware so that they can act as
>>> wakeups.
>> So far nobody told me about this until now, but why exactly do we need
>> yet another unspecified callback instead of simply telling the core via
>> an irq chip flag that it should always unmask the interrupt if it is a
>> wakeup source?
>>
>>> Also: if an interrupt was masked lazily this could be a good
>>> time to ensure that these interrupts _won't_ wake the system up.
>> Setting IRQCHIP_MASK_ON_SUSPEND does exactly that. No need for a chip
>> driver to do any magic. You just have to use it.
>>
>> So the really obvious counterpart for this is to have:
>>
>>         IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND
>>
>> and then do:
>>
>> @@ -81,6 +81,8 @@ static bool suspend_device_irq(struct ir
>>                   * IRQD_WAKEUP_ARMED is visible before we return from
>>                   * suspend_device_irqs().
>>                   */
>> +               if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
>> +                       unmask_irq(desc);
>>                  return true;
>>          }
>>
>> plus the counterpart in the resume path. This also ensures that state is
>> consistent.
> This sounds wonderful to me.  Maulik: I think you could replace quite
> a few of the patches in the series and just use that.

Sure.

+               if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
+                       unmask_irq(desc);

I tried this patch and it didnot work as is.

Calling unmask_irq() only invoke's chip's .irq_unmask callback but the 
underlying irq_chip have .irq_enable also present.

Replacing the call with irq_enable() internally takes care of either 
invoking chip's .irq_enable (if its present) else it invokes unmask_irq().

+
+               if (chip->flags & IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND)
+                       irq_enable(desc);

probably IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND should also be renamed to 
IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND.

Thanks,
Maulik

>
>
>> The magic behind the back of the core code unmask brings core state and
>> hardware state out of sync. So if for whatever reason the interrupt is
>> raised in the CPU before the resume path can mask it again, then the
>> flow handler will see disabled state, invoke mask_irq() which does
>> nothing because core state is masked and if that's a level irq it will
>> come back forever.
>>
>>> Thus the point of these callbacks is to provide a hook for IRQ chips
>>> to do this.  Now that you understand the motivation perhaps you can
>>> suggest a better way to accomplish this if the approach in this patch
>>> is not OK.
>> See above.
>>
>>> I will note that a quick audit of existing users of the gernic-chip's
>>> irq_suspend() show that they are doing exactly this.  So the point of
>>> my patch is to actually allow other IRQ chips (ones that aren't using
>>> generic-chip) to do this type of thing.  At the same time my patch
>>> provides a way for current users of generic-chip to adapt their
>>> routines so they work without syscore (which, I guess, isn't
>>> compatible with s2idle).
>> If that's the main problem which is solved in these callbacks, then I
>> really have to ask why this has not been raised years ago. Why can't
>> people talk?
> Not all of us have the big picture that you do to know how things
> ought to work, I guess.  If nothing else someone looking at this
> problem would think: "this must be a common problem, let's go see how
> all the other places do it" and then they find how everyone else is
> doing it and do it that way.  It requires the grander picture that a
> maintainer has in order to say: whoa, everyone's copying the same
> hack--let's come up with a better solution.
>
>
>> IIRC back then when the callbacks for GC were added the reason was that
>> the affected chips needed a way to save and restore the full chip state
>> because the hardware lost it during suspend. S2idle did not exist back
>> then at least not in it's current form. Oh well...
>>
>> But gust replacing them by something which is yet another sinkhole for
>> horrible hacks behind the core code is not making it any better.
>>
>> I fear another sweep through the unpleasantries of chip drivers is due
>> sooner than later. Aside of finding time, I need to find my eyecancer
>> protection glasses and check my schnaps stock.
>>
>>>> So what happens in this case:
>>>>
>>>>     CPU0                         CPU1
>>>>     interrupt                    suspend_device_irq()
>>>>       handle()                     chip->suspend_one()
>>>>         action()                 ...
>>>>         chip->fiddle();
>>>>
>>>> ????
>>> Ah, so I guess we need to move the call to suspend_one_irq() till
>>> after the (potential) call to synchronize_irq() in in
>>> suspend_device_irqs()?
>> For what you are trying to achieve, no. IRQCHIP_MASK_ON_SUSPEND is
>> already safe.
>>
>> If we add IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND then there is no sync
>> problem either.
>>
>>> Hopefully with the above explanation this makes more sense?
>> At least the explanation helped to understand the problem, while the
>> changelog was pretty useless in that regard:
>>
>>    "These two callbacks are interesting because sometimes an irq chip
>>     needs to know about suspend/resume."
>>
>> Really valuable and precise technical information.
> Funny to get yelled at for not providing a detailed enough changelog.
> Usually people complain that my changelogs are too detailed.  Sigh.
>
>
>> But aside of the confusion, even with your explanation of what you are
>> trying to solve, I really want a coherent explanation why this should be
>> done for any of those:
>>
>>    1) an interrupt which has no action, i.e. an interrupt which has no
>>       active users and is in the worst case completely deactivated or was
>>       never activated to begin with.
>>
>>       In the inactive case it might be in a state where unmask issues an
>>       invalid vector, causes hardware malfunction or hits undefined
>>       software state in the chip drivers in the hierarchy.
>>
>>       If you want to be woken up by irq X, then request irq X which
>>       ensures that irq X is in a usable state at all levels of the
>>       stack. If you call disable_irq() or mark the interrupt with
>>       IRQ_NOAUTOEN, fine, it's still consistent state.
>>
>>    2) interrupts which have no_suspend_depth > 0 which means that
>>       there is an action requested which explicitely says: don't touch me
>>       on suspend.
>>
>>       If that driver invokes disable_irq() then it can keep the pieces.
>>
>>    3) chained interrupts
>>
>>       They are never disabled and never masked. So why would anything
>>       need to be done here?
>>
>>       Side note: they should not exist at all, but that's a different
>>       story.
>>
>> If you don't have coherent explanations, then please just don't touch
>> that condition at all.
>>
>> Hint: "Sometimes a chip needs to know" does not qualify :)
> Clearly I am not coherent.  ;-)  My only goal was to help enable
> interrupts that were disabled / marked as wakeup (as per above,
> documented to be OK) to work on Qualcomm chips.  This specifically
> affects me because a driver that I need to work (cros_ec) does this.
> If IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND is good to add then it sounds like
> a great plan to me.
>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


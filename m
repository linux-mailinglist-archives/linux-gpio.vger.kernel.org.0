Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A21820332E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 11:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgFVJTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 05:19:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50448 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbgFVJTc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jun 2020 05:19:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592817570; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YezUPzNjvQxanzC++G4NuTRjYWGDG9cd7oj8499vmB8=; b=ax92dtmhPU9rE1yc20FwoE9SgK0fRVVQNb1CSpFd3sT10q9rK6y1wjWtxPyMukQenFa7RKlG
 pdWjsFBqZ2+JR+m1ZXp+KuH2cI/25T7Havyzok3NpXAf5SfIQt/uNabaj/xFRmbtZovCj92U
 u3krq0lI0SUuc+1kIsK7sL3VgQY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ef0779a4c9690533a4f38e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 09:19:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 50DA1C43391; Mon, 22 Jun 2020 09:19:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.71.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11DD2C433C8;
        Mon, 22 Jun 2020 09:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11DD2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 4/4] irqchip: qcom-pdc: Introduce irq_set_wake call
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-5-git-send-email-mkshah@codeaurora.org>
 <159057454795.88029.5963412495484312088@swboyd.mtv.corp.google.com>
 <e565f798-e62b-7b03-6cd5-6daf9b516262@codeaurora.org>
 <159086679215.69627.4444511187342075544@swboyd.mtv.corp.google.com>
 <c93695d4-a03e-7f62-747a-90d892c48694@codeaurora.org>
 <159230866475.62212.10807813558467898966@swboyd.mtv.corp.google.com>
 <4e318931-cff0-0d8b-d0a0-9d139533c551@codeaurora.org>
 <159255876756.62212.4221488367063412094@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <65457ad5-174f-cdf5-bee8-40a12ad1115f@codeaurora.org>
Date:   Mon, 22 Jun 2020 14:49:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159255876756.62212.4221488367063412094@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 6/19/2020 2:56 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-06-18 03:03:03)
>> On 6/16/2020 5:27 PM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-06-01 04:38:25)
>>>> On 5/31/2020 12:56 AM, Stephen Boyd wrote:
>>>>> Quoting Maulik Shah (2020-05-29 02:20:32)
>>>>>> On 5/27/2020 3:45 PM, Stephen Boyd wrote:
>>>>>>> Quoting Maulik Shah (2020-05-23 10:11:13)
>>>>>>>> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>>>>>>>>             if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>>>>>>>                     return;
>>>>>>>>      
>>>>>>>> +       pdc_enable_intr(d, true);
>>>>>>>>             irq_chip_unmask_parent(d);
>>>>>>>>      }
>>>>>>>>      
>>>>>>> I find these two hunks deeply confusing. I'm not sure what the
>>>>>>> maintainers think though. I hope it would be simpler to always enable
>>>>>>> the hwirqs in the pdc when an irq is requested and only disable it in
>>>>>>> the pdc when the system goes to suspend and the pdc pin isn't for an irq
>>>>>>> that's marked for wakeup. Does that break somehow?
>>>>>> PDC monitors interrupts during CPUidle as well, in cases where deepest
>>>>>> low power mode happened from cpuidle where GIC is not active.
>>>>>> If we keep PDC IRQ always enabled/unmasked during idle and then
>>>>>> disable/mask when entering to suspend, it will break cpuidle.
>>>>> How does it break cpuidle? The irqs that would be enabled/unmasked in
>>>>> pdc would only be the irqs that the kernel has setup irq handlers for
>>>>> (from request_irq() and friends).  We want those irqs to keep working
>>>>> during cpuidle and wake the CPU from the deepest idle states.
>>>>>> I hope it would be simpler to always enable
>>>>>> the hwirqs in the pdc when an irq is requested and only disable it in
>>>>>> the pdc when the system goes to suspend and the pdc pin isn't for an irq
>>>>>> that's marked for wakeup
>>>>>> How does it break cpuidle?
>>>> Consider a scenario..
>>>> 1. All PDC irqs enabled/unmasked in HW when request_irq() happened/alloc happens
>>>> 2. Client driver disable's irq. (lazy disable is there, so in HW its still unmasked) but disabled in SW.
>>>> 3. Device enters deep CPUidle low power modes where only PDC monitors IRQ.
>>>> 4. This IRQ can still wakeup from CPUidle since it was monitored by PDC.
>>>> 5. From handler, it comes to know that IRQ is disabled in SW, so it really invokes irq_mask callback now to disable in HW.
>>>> 6. This mask callback doesn't operate on PDC (since in PDC, IRQs gets masked only during suspend, all other times its enabled)
>>>> 7. step 3 to 6 repeats, if this IRQ keeps on coming and waking up from deep cpuidle states.
>>> Ok so in summary, irq is left unmasked in pdc during deep cpu idle and
>>> it keeps waking up the CPU because it isn't masked at the PDC after the
>>> first time it interrupts? Is this a power problem?
>> yes it can be a power problem.
>>>    Because from a
>>> correctness standpoint we don't really care. It woke up the CPU because
>>> it happened, and the GIC can decide to ignore it or not by masking it at
>>> the GIC. I thought that the PDC wouldn't wake up the CPU if we masked
>>> the irq at the GIC level. Is that not true?
>> once PDC detects IRQ, it directly doesn't wake up CPU. it replays IRQ to
>> GIC.
>>
>> since at GIC its masked, GIC doesn't forward to cpu to immediatly wake
>> it up.
>>
>> however after PDC detecting IRQ, it exits low power mode and
>> watchdog/timer can wakeup upon expiry.
> Ok. So the only problem is some screaming irq that really wants to be
> handled but the driver that requested it has disabled it at runtime. The
> IRQ keeps kicking the CPUs out of deep idle and then eventually the
> timer tick happens and we've run the CPUs in a shallower idle state for
> this time?
No it may still enter deeper state next time.
> Presumably we'd like to have these irqs be lazily masked at
> the PDC so that they can become pending when they first arrive but not
> block deep idle states if they're interrupting often while being
> handled.

We do lazily disable IRQ.  but didnot understand why lazily disable when 
they are being handled?

The edge type irqs gets masked immediatly if one irq is being handled 
and another comes in.

but that's not a problem.

>
> On the other hand, we want irq wake state to be the only factor in irqs
> being unmasked at the PDC on the entry to suspend. Purely
> masking/unmasking at the PDC when the irq is masked in software doesn't
> work because suspend/resume will break for disabled but wake enabled
> irqs. But doing that makes idle work easily because we can assume during
> idle that leaving it unmasked until it fires and then masking it in the
> PDC until it is handled gives us good deep idle states in the face of
> screaming irqs.
>
> What are the actual requirements? Here is my attempt to boil this
> discussion down into a few bullet points:
>
>   1. During system suspend, wake enabled irqs should be enabled in PDC
>   and all other irqs should be disabled in PDC.
yes, IRQs should be enabled in both PDC and GIC before platform (PSCI 
suspend) happens if they are marked for wakeup (enable_irq_wake())
>
>   2. During idle, enabled irqs must be enabled in PDC, unless they're
>   pending in which case they should be masked in the PDC so as to not
>   wake up the CPU from deep idle states

i didn't get this point.

During idle, if the driver choosen to keep IRQ enabled, it should be 
enabled in both PDC and GIC

if the driver choosen to keep IRQ disabled, with this series...

a. do a lay disable when driver's call disable_irq(), meaning set the SW 
state as disabled but leave in PDC and GIC HW as unmasked/enabled.

b. if the IRQ comes inbetween and its of edge type, the generic 
handle_edge_irq will really mask in HW.

>
>   3. During non-idle, non-suspend, enabled irqs must be enabled in PDC.
>
> Or is #3 actually false and PDC has no bearing on this?

Correct, During this time (non-idle, non-suspend) PDC will be in 
something called "by pass mode" where it plays role of type conversion.

(a level low to level high / edge falling to edge rising) since GIC 
doesn't detect level low/falling edge IRQs.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


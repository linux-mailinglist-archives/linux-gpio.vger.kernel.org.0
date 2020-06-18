Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE991FEF2C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 12:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgFRKDg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 06:03:36 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54935 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727121AbgFRKDe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jun 2020 06:03:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592474612; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CwMAQGp5QqqMs436TWKlp4Y2VmDjG4KEwhlH53uGM7c=; b=ncOQfRfEgebpa/uXWGlJydMaV6i4ZRaF0+jUKU+GUWm2tVKkwrnJjmvRWi3emIqgs19R95qY
 NBg7eeVipPileIQBVFYIPa+BiZO5Kaf+C1x36T0sghENj07T3N0VpqXLM+Ml6/paxyNw9TAT
 Kj26FwJ+sxUHI4zjpLRsxsSsMzs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5eeb3be1fe1db4db89a09659 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 10:03:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9254C433C8; Thu, 18 Jun 2020 10:03:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.1.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D519C433C9;
        Thu, 18 Jun 2020 10:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D519C433C9
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
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <4e318931-cff0-0d8b-d0a0-9d139533c551@codeaurora.org>
Date:   Thu, 18 Jun 2020 15:33:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159230866475.62212.10807813558467898966@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 6/16/2020 5:27 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-06-01 04:38:25)
>> On 5/31/2020 12:56 AM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-05-29 02:20:32)
>>>> On 5/27/2020 3:45 PM, Stephen Boyd wrote:
>>>>> Quoting Maulik Shah (2020-05-23 10:11:13)
>>>>>> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>>>>>>            if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>>>>>                    return;
>>>>>>     
>>>>>> +       pdc_enable_intr(d, true);
>>>>>>            irq_chip_unmask_parent(d);
>>>>>>     }
>>>>>>     
>>>>> I find these two hunks deeply confusing. I'm not sure what the
>>>>> maintainers think though. I hope it would be simpler to always enable
>>>>> the hwirqs in the pdc when an irq is requested and only disable it in
>>>>> the pdc when the system goes to suspend and the pdc pin isn't for an irq
>>>>> that's marked for wakeup. Does that break somehow?
>>>> PDC monitors interrupts during CPUidle as well, in cases where deepest
>>>> low power mode happened from cpuidle where GIC is not active.
>>>> If we keep PDC IRQ always enabled/unmasked during idle and then
>>>> disable/mask when entering to suspend, it will break cpuidle.
>>> How does it break cpuidle? The irqs that would be enabled/unmasked in
>>> pdc would only be the irqs that the kernel has setup irq handlers for
>>> (from request_irq() and friends).  We want those irqs to keep working
>>> during cpuidle and wake the CPU from the deepest idle states.
>>>> I hope it would be simpler to always enable
>>>> the hwirqs in the pdc when an irq is requested and only disable it in
>>>> the pdc when the system goes to suspend and the pdc pin isn't for an irq
>>>> that's marked for wakeup
>>>> How does it break cpuidle?
>> Consider a scenario..
>> 1. All PDC irqs enabled/unmasked in HW when request_irq() happened/alloc happens
>> 2. Client driver disable's irq. (lazy disable is there, so in HW its still unmasked) but disabled in SW.
>> 3. Device enters deep CPUidle low power modes where only PDC monitors IRQ.
>> 4. This IRQ can still wakeup from CPUidle since it was monitored by PDC.
>> 5. From handler, it comes to know that IRQ is disabled in SW, so it really invokes irq_mask callback now to disable in HW.
>> 6. This mask callback doesn't operate on PDC (since in PDC, IRQs gets masked only during suspend, all other times its enabled)
>> 7. step 3 to 6 repeats, if this IRQ keeps on coming and waking up from deep cpuidle states.
> Ok so in summary, irq is left unmasked in pdc during deep cpu idle and
> it keeps waking up the CPU because it isn't masked at the PDC after the
> first time it interrupts? Is this a power problem?
yes it can be a power problem.
>   Because from a
> correctness standpoint we don't really care. It woke up the CPU because
> it happened, and the GIC can decide to ignore it or not by masking it at
> the GIC. I thought that the PDC wouldn't wake up the CPU if we masked
> the irq at the GIC level. Is that not true?

once PDC detects IRQ, it directly doesn't wake up CPU. it replays IRQ to 
GIC.

since at GIC its masked, GIC doesn't forward to cpu to immediatly wake 
it up.

however after PDC detecting IRQ, it exits low power mode and 
watchdog/timer can wakeup upon expiry.


>
>>>>> My understanding of the hardware is that the GPIO controller has lines
>>>>> directly connected to various SPI lines on the GIC and PDC has a way to
>>>>> monitor those direct connections and wakeup the CPUs when they trigger
>>>>> the detection logic in the PDC. The enable/disable bit in PDC gates that
>>>>> logic for each wire between the GPIO controller and the GIC.
>>>>>
>>>>> So isn't it simpler to leave the PDC monitoring pins that we care about
>>>>> all the time and only stop monitoring when we enter and leave suspend?
>>>> it can affect idle path as explained above.
>>>>
>>>>> And shouldn't the driver set something sane in qcom_pdc_init() to
>>>>> disable all the pdc pins so that we don't rely on boot state to
>>>>> configure pins for wakeup?
>>>> We don't rely on boot state, by default all interrupt will be disabled.
>>> Does 'default' mean the hardware register reset state?
>> correct.
>>> I'm worried that
>>> we will kexec and then various pdc pins will be enabled because the
>>> previous kernel had them enabled but then the new kernel doesn't care
>>> about those pins and we'll never be able to suspend or go idle. I don't
>>> know what happens in the GIC case but I think gic_dist_config() and
>>> things set a sane state at kernel boot.
>> Right however when switching kernel, i suppose client drivers will do a
>> free_irq(), then this will
>>
>> clear the PDC interrupt in HW by invoking mask_irq() from within free_irq().
> We can't rely on drivers to do that.
>
>>>> This is same to GIC driver having GICD_ISENABLER register, where all
>>>> bits (one bit per interrupt) set to 0 (masked irqs) during boot up.
>>>>
>>>> Similarly PDC also have all bits set to 0 in PDC's IRQ_ENABLE_BANK.
>>>>
>>> What code sets the IRQ_ENABLE_BANK to all zero when this driver probes?
>> Enable bank will be zero as part of HW reset status when booting up
>> first time.
>>
> It's not a concern about the hardware reset state of these registers at
> boot. I'm worried that the bootloaders or previous OS will configure pdc
> pins to wake us up. It's better to just force it to something sane, i.e.
> everything disabled in the PDC, at driver probe time so that nothing can
> be wrong.

okay, i will include a patch to disable all IRQs in PDC hw during init 
time in next revision.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


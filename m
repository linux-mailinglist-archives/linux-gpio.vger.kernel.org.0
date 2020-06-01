Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02D31EA2EF
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 13:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFALii (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 07:38:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57577 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgFALii (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 07:38:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591011517; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=j31EG1PcTeGF2ely+xciEZ6ZvBhwRaOGmAHTE97LE9Q=; b=gyak7SRdOCOPrB/B3TEbAT+WhYEZSo/+gAAkl9fJ21GIRdjMNdCecPRmxNYnIBKM5ZSsUeuJ
 WPHar9SAKRdSurM4vpvga6s3MUsaOWn3c/21HVLcmEfA/q6QSQYp9gYnZJCU4mMCSZZpOTgW
 2/ikoaa1iiJAd1QU5HZKnkvPYnU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ed4e8bc2c54998475a8a348 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Jun 2020 11:38:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 80559C433AF; Mon,  1 Jun 2020 11:38:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.13.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA53CC433C9;
        Mon,  1 Jun 2020 11:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA53CC433C9
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
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <c93695d4-a03e-7f62-747a-90d892c48694@codeaurora.org>
Date:   Mon, 1 Jun 2020 17:08:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <159086679215.69627.4444511187342075544@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/31/2020 12:56 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-05-29 02:20:32)
>> Hi,
>>
>> On 5/27/2020 3:45 PM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-05-23 10:11:13)
>>>> @@ -87,22 +88,20 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>>>           raw_spin_unlock(&pdc_lock);
>>>>    }
>>>>    
>>>> -static void qcom_pdc_gic_disable(struct irq_data *d)
>>>> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
>>>>    {
>>>>           if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>>> -               return;
>>>> -
>>>> -       pdc_enable_intr(d, false);
>>>> -       irq_chip_disable_parent(d);
>>>> -}
>>>> +               return 0;
>>> Shouldn't this fail if we can't set for wake?
>> we return success/failure from parent chip with below call at end of
>> set_wake.
>>
>> return irq_chip_set_wake_parent(d, on);
> It's not a question about the parent irqchip. I'm wondering why we would
> return success for a gpio irq that can't be marked for wakeup when a
> client driver tries to enable wake on it. My understanding is that all
> gpios irqs call here and PDC can't monitor all of them so some are
> GPIO_NO_WAKE_IRQ and thus trying to mark those for wakeup should fail.
> Of course msm_gpio_irq_set_wake() should also fail if it can't mark the
> gpio for wakeup, but that's another problem.
i can change this to return error code.

PDC's caller msmgpio chip, currently don't check for return value for 
irq_set_wake callback.
i will udpate that as well in next revision.
>
>>>> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>>>>           if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>>>                   return;
>>>>    
>>>> +       pdc_enable_intr(d, true);
>>>>           irq_chip_unmask_parent(d);
>>>>    }
>>>>    
>>> I find these two hunks deeply confusing. I'm not sure what the
>>> maintainers think though. I hope it would be simpler to always enable
>>> the hwirqs in the pdc when an irq is requested and only disable it in
>>> the pdc when the system goes to suspend and the pdc pin isn't for an irq
>>> that's marked for wakeup. Does that break somehow?
>> PDC monitors interrupts during CPUidle as well, in cases where deepest
>> low power mode happened from cpuidle where GIC is not active.
>> If we keep PDC IRQ always enabled/unmasked during idle and then
>> disable/mask when entering to suspend, it will break cpuidle.
> How does it break cpuidle? The irqs that would be enabled/unmasked in
> pdc would only be the irqs that the kernel has setup irq handlers for
> (from request_irq() and friends).  We want those irqs to keep working
> during cpuidle and wake the CPU from the deepest idle states.

>>I hope it would be simpler to always enable
>>the hwirqs in the pdc when an irq is requested and only disable it in
>>the pdc when the system goes to suspend and the pdc pin isn't for an irq
>>that's marked for wakeup

>>How does it break cpuidle?

Consider a scenario..
1. All PDC irqs enabled/unmasked in HW when request_irq() happened/alloc happens
2. Client driver disable's irq. (lazy disable is there, so in HW its still unmasked) but disabled in SW.
3. Device enters deep CPUidle low power modes where only PDC monitors IRQ.
4. This IRQ can still wakeup from CPUidle since it was monitored by PDC.
5. From handler, it comes to know that IRQ is disabled in SW, so it really invokes irq_mask callback now to disable in HW.
6. This mask callback doesn't operate on PDC (since in PDC, IRQs gets masked only during suspend, all other times its enabled)
7. step 3 to 6 repeats, if this IRQ keeps on coming and waking up from deep cpuidle states.

>
>>> My understanding of the hardware is that the GPIO controller has lines
>>> directly connected to various SPI lines on the GIC and PDC has a way to
>>> monitor those direct connections and wakeup the CPUs when they trigger
>>> the detection logic in the PDC. The enable/disable bit in PDC gates that
>>> logic for each wire between the GPIO controller and the GIC.
>>>
>>> So isn't it simpler to leave the PDC monitoring pins that we care about
>>> all the time and only stop monitoring when we enter and leave suspend?
>> it can affect idle path as explained above.
>>
>>> And shouldn't the driver set something sane in qcom_pdc_init() to
>>> disable all the pdc pins so that we don't rely on boot state to
>>> configure pins for wakeup?
>> We don't rely on boot state, by default all interrupt will be disabled.
> Does 'default' mean the hardware register reset state?
correct.
> I'm worried that
> we will kexec and then various pdc pins will be enabled because the
> previous kernel had them enabled but then the new kernel doesn't care
> about those pins and we'll never be able to suspend or go idle. I don't
> know what happens in the GIC case but I think gic_dist_config() and
> things set a sane state at kernel boot.

Right however when switching kernel, i suppose client drivers will do a 
free_irq(), then this will

clear the PDC interrupt in HW by invoking mask_irq() from within free_irq().

>
>> This is same to GIC driver having GICD_ISENABLER register, where all
>> bits (one bit per interrupt) set to 0 (masked irqs) during boot up.
>>
>> Similarly PDC also have all bits set to 0 in PDC's IRQ_ENABLE_BANK.
>>
> What code sets the IRQ_ENABLE_BANK to all zero when this driver probes?

Enable bank will be zero as part of HW reset status when booting up 
first time.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


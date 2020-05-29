Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30D81E7931
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 11:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgE2JUs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 05:20:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21975 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgE2JUr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 May 2020 05:20:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590744046; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gtTL96xroM0cMRUy1kb2dBW2tNzxqYj7hRbU9Vw34yY=; b=Rdx+L950bMKg1i/1y0mD+Mm1zxJoDmAo3+lmHsREAcSaqNyz//baYcX81AM43vv+9plVWpLL
 82fgdKe5GWxh3EUGu5MgotOOA+5zLb1e1lG/Uu4vI0R/kRljzQ2VKR0qYVC3tNBWjVFGoJ49
 n43DjemBCVFRsCt2wKjMJI+oa/0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ed0d3eb44a25e005206a629 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 09:20:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59565C43391; Fri, 29 May 2020 09:20:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.19.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F2202C433C9;
        Fri, 29 May 2020 09:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2202C433C9
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
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e565f798-e62b-7b03-6cd5-6daf9b516262@codeaurora.org>
Date:   Fri, 29 May 2020 14:50:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <159057454795.88029.5963412495484312088@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/27/2020 3:45 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-05-23 10:11:13)
>> Remove irq_disable callback to allow lazy disable for pdc interrupts.
>>
>> Add irq_set_wake callback that unmask interrupt in HW when drivers
>> mark interrupt for wakeup. Interrupt will be cleared in HW during
>> lazy disable if its not marked for wakeup.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/irqchip/qcom-pdc.c | 33 +++++++++++++++++----------------
>>   1 file changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 6ae9e1f..f7c0662 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -36,6 +36,7 @@ struct pdc_pin_region {
>>          u32 cnt;
>>   };
>>   
>> +DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
> static?
Thanks i will declare as static in v3.
>
>>   static DEFINE_RAW_SPINLOCK(pdc_lock);
>>   static void __iomem *pdc_base;
>>   static struct pdc_pin_region *pdc_region;
>> @@ -87,22 +88,20 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>          raw_spin_unlock(&pdc_lock);
>>   }
>>   
>> -static void qcom_pdc_gic_disable(struct irq_data *d)
>> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
>>   {
>>          if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -               return;
>> -
>> -       pdc_enable_intr(d, false);
>> -       irq_chip_disable_parent(d);
>> -}
>> +               return 0;
> Shouldn't this fail if we can't set for wake?

we return success/failure from parent chip with below call at end of 
set_wake.

return irq_chip_set_wake_parent(d, on);

>
>>   
>> -static void qcom_pdc_gic_enable(struct irq_data *d)
>> -{
>> -       if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -               return;
>> +       if (on) {
>> +               pdc_enable_intr(d, true);
>> +               irq_chip_enable_parent(d);
>> +               set_bit(d->hwirq, pdc_wake_irqs);
>> +       } else {
>> +               clear_bit(d->hwirq, pdc_wake_irqs);
>> +       }
>>   
>> -       pdc_enable_intr(d, true);
>> -       irq_chip_enable_parent(d);
>> +       return irq_chip_set_wake_parent(d, on);
>>   }
>>   
>>   static void qcom_pdc_gic_mask(struct irq_data *d)
> The diff is really hard to read too. Maybe set_wake can be added first
> and then the enable/disable functions removed?
i think should be ok in same patch, if you insist i can split this 
change in to two.
>
>> @@ -110,6 +109,9 @@ static void qcom_pdc_gic_mask(struct irq_data *d)
>>          if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                  return;
>>   
>> +       if (!test_bit(d->hwirq, pdc_wake_irqs))
>> +               pdc_enable_intr(d, false);
>> +
>>          irq_chip_mask_parent(d);
>>   }
>>   
>> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>>          if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                  return;
>>   
>> +       pdc_enable_intr(d, true);
>>          irq_chip_unmask_parent(d);
>>   }
>>   
> I find these two hunks deeply confusing. I'm not sure what the
> maintainers think though. I hope it would be simpler to always enable
> the hwirqs in the pdc when an irq is requested and only disable it in
> the pdc when the system goes to suspend and the pdc pin isn't for an irq
> that's marked for wakeup. Does that break somehow?
PDC monitors interrupts during CPUidle as well, in cases where deepest 
low power mode happened from cpuidle where GIC is not active.
If we keep PDC IRQ always enabled/unmasked during idle and then 
disable/mask when entering to suspend, it will break cpuidle.

>
> My understanding of the hardware is that the GPIO controller has lines
> directly connected to various SPI lines on the GIC and PDC has a way to
> monitor those direct connections and wakeup the CPUs when they trigger
> the detection logic in the PDC. The enable/disable bit in PDC gates that
> logic for each wire between the GPIO controller and the GIC.
>
> So isn't it simpler to leave the PDC monitoring pins that we care about
> all the time and only stop monitoring when we enter and leave suspend?

it can affect idle path as explained above.

> And shouldn't the driver set something sane in qcom_pdc_init() to
> disable all the pdc pins so that we don't rely on boot state to
> configure pins for wakeup?

We don't rely on boot state, by default all interrupt will be disabled.

This is same to GIC driver having GICD_ISENABLER register, where all 
bits (one bit per interrupt) set to 0 (masked irqs) during boot up.

Similarly PDC also have all bits set to 0 in PDC's IRQ_ENABLE_BANK.

Thanks,
Maulik
>
>> @@ -197,15 +200,13 @@ static struct irq_chip qcom_pdc_gic_chip = {
>>          .irq_eoi                = irq_chip_eoi_parent,
>>          .irq_mask               = qcom_pdc_gic_mask,
>>          .irq_unmask             = qcom_pdc_gic_unmask,
>> -       .irq_disable            = qcom_pdc_gic_disable,
>> -       .irq_enable             = qcom_pdc_gic_enable,
>>          .irq_get_irqchip_state  = qcom_pdc_gic_get_irqchip_state,
>>          .irq_set_irqchip_state  = qcom_pdc_gic_set_irqchip_state,
>>          .irq_retrigger          = irq_chip_retrigger_hierarchy,
>>          .irq_set_type           = qcom_pdc_gic_set_type,
>> +       .irq_set_wake           = qcom_pdc_gic_set_wake,
>>          .flags                  = IRQCHIP_MASK_ON_SUSPEND |
>> -                                 IRQCHIP_SET_TYPE_MASKED |
>> -                                 IRQCHIP_SKIP_SET_WAKE,
>> +                                 IRQCHIP_SET_TYPE_MASKED,
>>          .irq_set_vcpu_affinity  = irq_chip_set_vcpu_affinity_parent,
>>          .irq_set_affinity       = irq_chip_set_affinity_parent,

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


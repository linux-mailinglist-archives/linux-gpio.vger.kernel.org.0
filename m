Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E5821EE66
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 12:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgGNKy7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 06:54:59 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:24042 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726766AbgGNKy6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 06:54:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594724097; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=l+PMrsBEotyAY188agVyUbHI6J4WW3/QMEFx1brNrwA=; b=I5e5vjORPogFqllHY7IaSyzu8dL3WdfyqVhI6LPg+xv1roMb/L2IwVwH54sY2n66yVSM5E6m
 4ZFAO88DXBNpk3w85iE8yj8GMytC1SBT5YvrDhYNyJl96u/7xoGsN3JmWqk5I0cM7sYPNhOk
 U9X4CVXZcfI+eAoza3e4NsHEACw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f0d8ee11e603dbb44c5e488 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 10:54:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1420C43395; Tue, 14 Jul 2020 10:54:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.75.62])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80BEBC433C8;
        Tue, 14 Jul 2020 10:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80BEBC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 4/5] irqchip: qcom-pdc: Introduce irq_set_wake call
To:     Doug Anderson <dianders@chromium.org>
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
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
 <1592818308-23001-5-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=Wa6mUAM_bMN7E-D1Wi9qbFNJWWjfVsgcAVUBmwGqBhSg@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <339f24ce-8114-2008-87d4-0e3772487f10@codeaurora.org>
Date:   Tue, 14 Jul 2020 16:24:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wa6mUAM_bMN7E-D1Wi9qbFNJWWjfVsgcAVUBmwGqBhSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/14/2020 3:46 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Jun 22, 2020 at 2:33 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Remove irq_disable callback to allow lazy disable for pdc interrupts.
>>
>> Add irq_set_wake callback that unmask interrupt in HW when drivers
>> mark interrupt for wakeup. Interrupt will be cleared in HW during
>> lazy disable if its not marked for wakeup.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/irqchip/qcom-pdc.c | 34 ++++++++++++++++------------------
>>   1 file changed, 16 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 6ae9e1f..8beb6f7 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -36,6 +36,7 @@ struct pdc_pin_region {
>>          u32 cnt;
>>   };
>>
>> +static DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
>>   static DEFINE_RAW_SPINLOCK(pdc_lock);
>>   static void __iomem *pdc_base;
>>   static struct pdc_pin_region *pdc_region;
>> @@ -87,22 +88,17 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>          raw_spin_unlock(&pdc_lock);
>>   }
>>
>> -static void qcom_pdc_gic_disable(struct irq_data *d)
>> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
>>   {
>> -       if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -               return;
>> -
>> -       pdc_enable_intr(d, false);
>> -       irq_chip_disable_parent(d);
>> -}
>> -
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
>> @@ -111,6 +107,9 @@ static void qcom_pdc_gic_mask(struct irq_data *d)
>>                  return;
>>
>>          irq_chip_mask_parent(d);
>> +
>> +       if (!test_bit(d->hwirq, pdc_wake_irqs))
>> +               pdc_enable_intr(d, false);
> I _think_ this will break masking, right?  In other words, consider
> the following (having nothing to do with suspend/resume):
>
> 1. Driver requests an interrupt.
> 2. Driver masks interrupt (calls disable_irq())
> 3. Interrupt fires while it is masked.
> 4. Driver unmasks interrupt (calls enable_irq().
>
> After step #4 the interrupt should fire since it was only masked, not
> disabled (yes, it's super confusing that the driver calls
> disable_irq() but it expecting it to be masked--as I understand it
> that's just how it is).  I haven't tested, but I suspect that's broken
> for you now (assuming you're working on a pin that wasn't a wakeup
> pin) because you won't track edges when you're "disabled".
No its not broken, it works as expected. after step #4, interrupt will fire.
>
> I suspect that the right thing to do here is to:
>
> a) Make qcom_pdc_gic_set_wake() just keep "pdc_wake_irqs" up to date
> and then call parent.
>
> b) Implement irq_suspend and irq_resume.  In irq_suspend() you disable
> all interrupts that aren't in "pdc_wake_irqs".  In irq_resume() you
> just re-enable all of them (masking will be handled by the parent).
>
> Would that work?
>
> ...oh, drat!  The .irq_suspend() callback is only there if you're
> using "irq/generic-chip.c".  OK, well unless we want to move over to
> using generic-chip we can just register for syscore ourselves.  OK, I
> tested and <https://crrev.com/c/2296160> works.

I too thought of using syscore ops earlier, but syscore ops won't work 
if device chooses to enter "s2idle" suspend state since they are not 
invoked in s2idle entry path.

even if you register for "irq/generic-chip.c" , this driver too 
registers for syscore ops only, it won't work if you enter s2idle 
suspend state.

Current patch works fine with both s2idle and deep suspend states.

Thanks,
Maulik
>
>
>
>>   }
>>
>>   static void qcom_pdc_gic_unmask(struct irq_data *d)
>> @@ -118,6 +117,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
>>          if (d->hwirq == GPIO_NO_WAKE_IRQ)
>>                  return;
>>
>> +       pdc_enable_intr(d, true);
>>          irq_chip_unmask_parent(d);
>>   }
>>
>> @@ -197,15 +197,13 @@ static struct irq_chip qcom_pdc_gic_chip = {
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
>>   };
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


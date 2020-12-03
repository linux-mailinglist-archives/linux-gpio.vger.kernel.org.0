Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765282CD495
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 12:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgLCL3T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 06:29:19 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:26514 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgLCL3T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 06:29:19 -0500
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Dec 2020 06:29:17 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606994937; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rB0mmHfWOBy9rR1CNJtBsCMHzAPJs2tJ1Xg5HDZ2iSA=; b=jopdnV7RiOr0AgzEBKqJL/ffwwb/ZTCQClY3EDsvbeL2RHvPryY29W57t2mPiy5s/K0sOc3V
 ysJ5psNQGbaqrdVT3bCzb+o/xqINeWtQxtqCr9ENBFcNbqOOEtWMtFWrvAdiZhLdOmfsjV4i
 Rd82ikr+v7ASf2VMS6/Pyi7itZk=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fc8ca830ad88326311d4549 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 11:22:43
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C8F8C43462; Thu,  3 Dec 2020 11:22:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.79.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B43FC43461;
        Thu,  3 Dec 2020 11:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B43FC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Marc Zyngier <maz@kernel.org>,
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
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org>
 <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org>
Date:   Thu, 3 Dec 2020 16:52:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On 12/1/2020 3:14 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Nov 30, 2020 at 2:33 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>> [1] https://lore.kernel.org/r/603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org
>> Please wait to land [1] before i confirm with HW team if this is indeed
>> valid case.
> Oh, oops.  Somehow I thought your reply was in response to patch #3 in
> the series, not #1.  I responded to patch #1 in the series now to make
> it clear to wait for you.
>
>
>>> @@ -187,15 +217,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>>        if (WARN_ON(i == g->nfuncs))
>>>                return -EINVAL;
>>>
>>> -     raw_spin_lock_irqsave(&pctrl->lock, flags);
>>> +     disable_irq(irq);
>>>
>>> -     val = msm_readl_ctl(pctrl, g);
>>> +     raw_spin_lock_irqsave(&pctrl->lock, flags);
>>> +     oldval = val = msm_readl_ctl(pctrl, g);
>>>        val &= ~mask;
>>>        val |= i << g->mux_bit;
>>>        msm_writel_ctl(val, pctrl, g);
>>> -
>>>        raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>
>>> +     /*
>>> +      * Clear IRQs if switching to/from GPIO mode since muxing to/from
>>> +      * the GPIO path can cause phantom edges.
>>> +      */
>>> +     old_i = (oldval & mask) >> g->mux_bit;
>>> +     if (old_i != i &&
>>> +         (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
>>> +             msm_pinctrl_clear_pending_irq(pctrl, group, irq);
>>> +
>> The phantom irq can come when switching to GPIO irq mode. so may be only
>> check if (i == pctrl->soc->gpio_func) {
> Have you tested this experimentally?
Yes
>
> I have experimentally tested this and I can actually see an interrupt
> generated when I _leave_ GPIO as well as when I enter GPIO mode.  If
> you can't see this I can re-setup my test, but this was one of those
> things that convinced me that the _transition_ is what was causing the
> fake interrupt.
>
> I think my test CL <https://crrev.com/c/2556012/> can help you with
> testing if you wish.
>
>
>> even better if you can clear this unconditionally.
> Why?  It should only matter if we're going to/from GPIO mode.

Probably i was not clear, the phantom irq should be cleared when 
switching gpio to gpio IRQ mode.

When GPIO was used as Rx line in example QUP/UART use case, it can latch 
the phantom IRQ but as long as its IRQ is in disabled/masked state it 
doesn't matter.

its only when the GPIO is again set to IRQ mode with set_mux callback, 
the phantom IRQ needs clear to start as clean.

So we should check only for if (i == pctrl->soc->gpio_func) then clear 
phantom IRQ.

The same is case with .direction_output callback, when GPIO is used as 
output say as clock, need not clear any phantom IRQ,

The reason is with every pulse of clock it can latch as pending IRQ in 
GIC_ISPEND as long as it stay as output mode/clock.

its only when switching back GPIO from output direction to input & IRQ 
function, need to clear the phantom IRQ.

so we do not require clear phantom irq in .direction_output callback.

>
>
>>> @@ -456,32 +497,49 @@ static const struct pinconf_ops msm_pinconf_ops = {
>>>    static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>>>    {
>>>        const struct msm_pingroup *g;
>>> +     unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>>>        struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>>>        unsigned long flags;
>>> +     u32 oldval;
>>>        u32 val;
>>>
>>>        g = &pctrl->soc->groups[offset];
>>>
>>> +     disable_irq(irq);
>>> +
>>>        raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>
>>> -     val = msm_readl_ctl(pctrl, g);
>>> +     oldval = val = msm_readl_ctl(pctrl, g);
>>>        val &= ~BIT(g->oe_bit);
>>>        msm_writel_ctl(val, pctrl, g);
>>>
>>>        raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>
>>> +     /*
>>> +      * Clear IRQs if switching to/from input mode since that can use
>>> +      * a phantom edge.
>>> +      */
>>> +     if (oldval != val)
>>> +             msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
>> same as above, can you clear this unconditionally.
> Any reason why?  If we didn't change anything then there's no reason
> to go through all this extra code?
>
>
>>>    static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, int value)
>>>    {
>>>        const struct msm_pingroup *g;
>>> +     unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>>>        struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>>>        unsigned long flags;
>>> +     u32 oldval;
>>>        u32 val;
>>>
>>>        g = &pctrl->soc->groups[offset];
>>>
>>> +     disable_irq(irq);
>>> +
>>>        raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>
>>>        val = msm_readl_io(pctrl, g);
>>> @@ -491,12 +549,21 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
>>>                val &= ~BIT(g->out_bit);
>>>        msm_writel_io(val, pctrl, g);
>>>
>>> -     val = msm_readl_ctl(pctrl, g);
>>> +     oldval = msm_readl_ctl(pctrl, g);
>> should be, oldval = val = msm_readl_ctl(pctrl, g);
>>
>> otherwise val will carry invalid value.
> Whoa!  Good catch.  How did I miss that and how did it not fail?  I
> will fix in a v3 but will wait until other questions are resolved
> before sending.
>
>
>>>        val |= BIT(g->oe_bit);
>>>        msm_writel_ctl(val, pctrl, g);
>>>
>>>        raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>
>>> +     /*
>>> +      * Clear IRQs if switching to/from input mode since that can use
>>> +      * a phantom edge.
>>> +      */
>>> +     if (oldval != val)
>>> +             msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
>> i don't see a reason to clear the edges when switching to output mode.
>>
>> can you remove the changes from .direction_output callback?
> I haven't confirmed that this can glitch, however I did confirm that I
> could glitch when muxing _away_ from GPIO mode.  This makes me believe
> that I could also glitch when muxing to an output.
>
> I can try to concoct a test for this if necessary.
>
>
>>> @@ -792,17 +859,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>>>
>>>        raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>
>>> -     if (status_clear) {
>>> -             /*
>>> -              * clear the interrupt status bit before unmask to avoid
>>> -              * any erroneous interrupts that would have got latched
>>> -              * when the interrupt is not in use.
>>> -              */
>>> -             val = msm_readl_intr_status(pctrl, g);
>>> -             val &= ~BIT(g->intr_status_bit);
>>> -             msm_writel_intr_status(val, pctrl, g);
>>> -     }
>>> -
>> Above change was clearing irq in .irq_enable callback which will do
>> clear + unmask from irq_startup() at the very end.
>> With your change, The problem is we have cleared the phantom irq much
>> earlier in __setup_irq() phase and in below case its still latched as
>> pending.
>>
>> 1. The client driver calls request_irq() => __setup_irq()
>> 2. __setup_irq() then first invokes irq_request_resources() =>
>> msm_gpio_irq_reqres() => msm_pinmux_set_mux() =>
>> msm_pinctrl_clear_pending_irq()
>> 3. __setup_irq() goes ahead and invokes __irq_set_trigger() =>
>> msm_gpio_irq_set_type()
>> 4. __setup_irq() then invokes irq_startup() => gpiochip_irq_enable() =>
>> msm_gpio_irq_enable()
>>
>> The phantom irq gets cleared in step (2) here, but with step (3) it gets
>> latched again and at the end of step (4) still get phantom irq.
>> This seems because as per below comment in driver, pasting the part
>> which has info,
>> /*
>>    * The edge detection logic seems to have a problem where toggling the
>> RAW_STATUS_EN bit may
>>    * cause the status bit to latch spuriously when there isn't any edge
>>    */
>> In step (3) msm_gpio_irq_set_type() touches the RAW_STATUS_EN making the
>> phantom irq pending again.
>> To resolve this, you will need to invoke msm_pinctrl_clear_pending_irq()
>> at the end of the msm_gpio_irq_set_type().
>>
>> I would like Rajendra's (already in cc) review as well on above part.
> Ugh, so we need a clear in yet another place.  Joy.  OK, I will wait
> for Rajendra's comment but I can add similar code in
> msm_gpio_irq_enable().

As the clearing phantom irq code in msm_gpio_irq_enable() is moved to 
separate function msm_pinctrl_clear_pending_irq(), it needs invoke from 
at the end of msm_gpio_irq_set_type() too.

Thanks,
Maulik
>
>
>>>        val = msm_readl_intr_cfg(pctrl, g);
>>>        val |= BIT(g->intr_raw_status_bit);
>>>        val |= BIT(g->intr_enable_bit);
>>> @@ -815,14 +871,10 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>>>
>>>    static void msm_gpio_irq_enable(struct irq_data *d)
>>>    {
>>> -     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> -     struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>>> -
>>>        if (d->parent_data)
>>>                irq_chip_enable_parent(d);
>>>
>>> -     if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
>>> -             msm_gpio_irq_clear_unmask(d, true);
>>> +     msm_gpio_irq_unmask(d);
>> Still need the above if condition, the previous call
>> irq_chip_enable_parent() already enabled the IRQ at PDC and GIC, so only
>> go ahead to enable it at TLMM if there wasn't any parent.
>>
>> if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
>>           msm_gpio_irq_unmask(d);
> Right.  I'll fix it when I send the v3.  Thanks!
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


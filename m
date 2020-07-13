Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C95B21D85C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgGMOZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:25:35 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:48198 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729863AbgGMOZf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Jul 2020 10:25:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594650333; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AQuZlc3Pf01pJh7p2nQbdckojHbN+4Aci0RCHz5v5Bo=; b=eWIz8cnhcqAxy8UTGlp7D2G5XpGw+21wwrbZsr/sKBzXmtwvNDb/jSH/DPvh0LbdQWvdVI13
 xjb3nnyQexNsYTPsI0GU8642venq6LEWYBnBEMH0aENsdlr+qJai0LvBWlWTPSdubS9gemhO
 lVnJK6RJyAtFrGnMx0a0vHfG5BE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f0c6ec8ee86618575ed5d34 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 14:25:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 01171C43391; Mon, 13 Jul 2020 14:25:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.75.62])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 753B2C433C8;
        Mon, 13 Jul 2020 14:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 753B2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
To:     Doug Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
 <87lfjreo7m.wl-maz@kernel.org>
 <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <83922c83-a8ae-1b2a-29c8-cb5ccb1d72d8@codeaurora.org>
Date:   Mon, 13 Jul 2020 19:55:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VzhdL67ocBPmAngxbZJsq-dSjhV2QjA8=7Ry+9oYxXHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/10/2020 9:40 PM, Doug Anderson wrote:
> Hi,
>
> On Fri, Jul 10, 2020 at 2:03 AM Marc Zyngier <maz@kernel.org> wrote:
>> Hi Doug,
>>
>> On Wed, 08 Jul 2020 22:16:25 +0100,
>> Douglas Anderson <dianders@chromium.org> wrote:
>>> As per Qualcomm, there is a PDC hardware issue (with the specific IP
>>> rev that exists on sc7180) that causes the PDC not to work properly
>>> when configured to handle dual edges.
>>>
>>> Let's work around this by emulating only ever letting our parent see
>>> requests for single edge interrupts on affected hardware.
>>>
>>> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>> As far as I can tell everything here should work and the limited
>>> testing I'm able to give it shows that, in fact, I can detect both
>>> edges.
>>>
>>> Please give this an extra thorough review since it's trying to find
>>> the exact right place to insert this code and I'm not massively
>>> familiar with all the frameworks.
>>>
>>> If someone has hardware where it's easy to stress test this that'd be
>>> wonderful too.  The board I happen to have in front of me doesn't have
>>> any easy-to-toggle GPIOs where I can just poke a button or a switch to
>>> generate edges.  My testing was done by hacking the "write protect"
>>> GPIO on my board into gpio-keys as a dual-edge interrupt and then
>>> sending commands to our security chip to toggle it--not exactly great
>>> for testing to make sure there are no race conditions if the interrupt
>>> bounces a lot.
>> This looks positively awful (the erratum, not the patch). Is there an
>> actual description of the problem, outlining the circumstances that
>> triggers this issue? The PDC really never fails to disappoint...
> Hopefully someone from Qualcomm can chime in here.  My entire
> knowledge of the errata comes from:
>
> https://lore.kernel.org/r/c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org
>
> ...and I tried to copy the exact phrasing that Rajendra gave.
PDC irqchip not detecting dual edge interrupts is not really a bug. PDC 
closely works in hierarchy with
GIC and GIC also doesn't support dual edge IRQs.  Dual edge feature is 
added in later HW revisions to support
similar usecases.

Regardless of dual edge feature,  as i mentioned in below link
if the drivers requests the intended edge of the interrupt then it works 
as expected.
(Drivers never need/use both the edges at a same time).
but if we are not intending to change/update each driver which use dual 
edge, this patch takes care of
same by requesting only one edge at a time, albeit its done from irqchip 
driver as opposed to client driver.

https://lore.kernel.org/linux-arm-msm/56fb02df-372d-935a-cc39-c13289d65c0d@codeaurora.org/

Thanks,
Maulik
>
>>>   drivers/pinctrl/qcom/pinctrl-msm.c    | 80 +++++++++++++++++++++++++++
>>>   drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
>>>   drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
>>>   3 files changed, 85 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>>> index 83b7d64bc4c1..45ca09ebb7b3 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>>> @@ -860,6 +860,79 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>>>        raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>   }
>>>
>>> +/**
>>> + * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
>>> + * @d: The irq dta.
>>> + *
>>> + * This is much like msm_gpio_update_dual_edge_pos() but for IRQs that are
>>> + * normally handled by the parent irqchip.  The logic here is slightly
>>> + * different due to what's easy to do with our parent, but in principle it's
>>> + * the same.
>>> + */
>>> +static void msm_gpio_update_dual_edge_parent(struct irq_data *d)
>>> +{
>>> +     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> +     struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>>> +     const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
>>> +     unsigned long flags;
>>> +     int loop_limit = 100;
>> I guess this is a "finger up in the air" type of limit?
> Yes, the same "finger up in the air" as
> msm_gpio_update_dual_edge_pos() in the same file.  My function comment
> refers to the other function to try to tie them together at least a
> little.
>
>
>>> +     unsigned int val;
>>> +     unsigned int type;
>>> +
>>> +     /* Read the value and make a guess about what edge we need to catch */
>>> +     val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
>> What does this value represent? The input line value?
> Yes.  Coped from msm_gpio_update_dual_edge_pos().
>
>
>>> +     type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
>>> +
>>> +     raw_spin_lock_irqsave(&pctrl->lock, flags);
>> What is this lock protecting you against? In both cases, you are
>> already under the irq_desc lock, with interrupts disabled.
> We are?  I put a breakpoint when the IRQ hits and did a bt.  I see
> this (I happen to be on 5.4 at the moment, so hopefully the same as
> mainline):
>
>   kgdb_breakpoint+0x3c/0x74
>   msm_gpio_update_dual_edge_parent+0x58/0x17c
>   msm_gpio_handle_dual_edge_parent_irq+0x1c/0x30
>   __handle_domain_irq+0x84/0xc4
>   gic_handle_irq+0x170/0x220
>   el1_irq+0xd0/0x180
>
> I think the stack is missing a few things due to aggressive inlining
> from my compiler, so the true backtrace would be:
>
> msm_gpio_handle_dual_edge_parent_irq()
> generic_handle_irq_desc()
> generic_handle_irq()
> __handle_domain_irq()
> handle_domain_irq()
> gic_handle_irq()
>
> The first place that got the "desc" was generic_handle_irq() and it
> got it via irq_to_desc().  That doesn't seem to do any locking.  Then
> generic_handle_irq_desc() just calls a function pointer so no locking
> there either.
>
> ...ah, but maybe what you're saying is that
> msm_gpio_handle_dual_edge_parent_irq() should be holding "desc->lock"
> around the call to msm_gpio_update_dual_edge_parent()?  I can do that.
>
>
>>> +     do {
>>> +             /* Set the parent to catch the next edge */
>>> +             irq_chip_set_type_parent(d, type);
>>> +
>>> +             /*
>>> +              * Possibly the line changed between when we last read "val"
>>> +              * (and decided what edge we needed) and when set the edge.
>>> +              * If the value didn't change (or changed and then changed
>>> +              * back) then we're done.
>>> +              */
>> If the line changed, shouldn't you actually inject a new interrupt
>> altogether? By changing the polarity more than once, you are
>> effectively loosing edges that should have triggered an interrupt.
> Are you sure this is needed?  My understanding of edge triggered
> interrupts is that until the interrupt handler is called that all
> edges can be coalesced into a single interrupt.  It's only after the
> interrupt handler is called that it's important to capture new edges.
> So if you have this:
>
> a) Be busy processing another unrelated interrupt
> b) 5 edges happen on the line
> c) Other interrupt finishes
> d) Edge interrupt is acked and handler is called
>
> You'll only get one call to the interrupt handler even though there
> were 5 edges, right?  It's only important that you queue another
> interrupt if that interrupt happens after the true interrupt handler
> (the one acting on the edge) has started.
>
> ...actually, in theory you'll get _either_ one or two calls to the
> interrupt handler depending on timing, since the above could also
> happen as:
>
> a) Be busy processing another unrelated interrupt
> b) 4 edges happen on the line
> c) Other interrupt finishes
> d) Edge interrupt is acked and ...
> e) 1 more edge happens on the line
> f) ...handler is called
> g) Edge interrupt is acked and handler is called
>
>
> As long as msm_gpio_update_dual_edge_parent() is called _before_ the
> true interrupt handler is called then what I have should be fine,
> right?
>
>
>>> +             val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
>>> +             if (type == IRQ_TYPE_EDGE_RISING) {
>>> +                     if (!val)
>>> +                             break;
>>> +                     type = IRQ_TYPE_EDGE_FALLING;
>>> +             } else if (type == IRQ_TYPE_EDGE_FALLING) {
>>> +                     if (val)
>>> +                             break;
>>> +                     type = IRQ_TYPE_EDGE_RISING;
>>> +             }
>>> +     } while (loop_limit-- > 0);
>>> +     raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>> +
>>> +     if (!loop_limit)
>>> +             dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
>>> +}
>>> +
>>> +void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
>>> +{
>>> +     struct irq_data *d = &desc->irq_data;
>>> +
>>> +     /* Make sure we're primed for the next edge */
>>> +     msm_gpio_update_dual_edge_parent(d);
>> I would have expected this to happen on EOI or ACK, rather than before
>> the flow is actually handled, once you have told the interrupt
>> controller that you were dealing with this interrupt.
> Having it on Ack would be ideal, but it appears that the Ack function
> isn't called in this case.  That's only called if our handler is
> handle_edge_irq() or handle_level_irq().  See more below.
>
> ...I'm pretty sure I don't want it on EOI.  Specifically, if I did it
> on EOI then I think I _would_ need to re-queue another interrupt if an
> edge came in msm_gpio_update_dual_edge_parent().  Doing all the edge
> adjustment before calling the true interrupt handler avoids all that.
>
>
>>> +
>>> +     /* Pass on to the normal interrupt handler */
>>> +     handle_fasteoi_irq(desc);
>> Is that the right flow? It seems that the current code is using
>> handle_edge_irq. I guess it has been broken so far, and that this
>> patch actually fixes it by forcing a fasteoi flow...
> The code today only uses handle_level_irq() / handle_edge_irq() if
> "skip_wake_irqs" wasn't set for this IRQ.  In the case that
> "skip_wake_irqs" wasn't set then it leaves the handler alone.  I
> definitely had a hard time following all the flow and interactions
> between the pinctrl, PDC, and the GICv3 but I definitely did confirm
> that handle_fasteoi_irq() was the handler that was running when
> "skip_wake_irqs" was set before I stuck mine in the middle.
>
> I believe how things work today with the "skip_wake_irqs" case is
> that, for the most part, the pinctrl driver stays out of the way for
> setting up and handling IRQs and just passes some calls onto its
> parent (the PDC).  The PDC driver is actually quite minimal.  There's
> no "Ack" in there and no calls to set an IRQ handler--it seems to just
> rely on the GICv3 doing all that.  It looks there is an implicit Ack
> as part of gic_handle_irq() since reading the IAR counts as an Ack.
>
>
> So to try to sum up my understanding:
>
> 1. In the case of "skip_wake_irqs" today there is no acking / handling
> code that is part of pinctrl-msm or the PDC.  They just configure
> things to direct to the GICv3.
>
> 2. For my workaround I just need to make sure to intercept myself and
> prime the next edge _before_ the end-user interrupt handler gets
> called.  If edges are coalesced before the end-user interrupt handler
> is called then that's OK.
>
>
> I'll await your reply before sending out the next version.  Thanks
> much for all your time looking at this!
>
>
>>> +}
>>> +
>>> +static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
>>> +                                                    unsigned int type)
>>> +{
>>> +     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> +     struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>>> +
>>> +     return type == IRQ_TYPE_EDGE_BOTH &&
>>> +            pctrl->soc->wakeirq_dual_edge_errata && d->parent_data &&
>>> +            test_bit(d->hwirq, pctrl->skip_wake_irqs);
>>> +}
>>> +
>>>   static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>   {
>>>        struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> @@ -868,6 +941,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>        unsigned long flags;
>>>        u32 val;
>>>
>>> +     if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
>>> +             irq_set_handler_locked(d, msm_gpio_handle_dual_edge_parent_irq);
>>> +             msm_gpio_update_dual_edge_parent(d);
>>> +
>>> +             return 0;
>>> +     }
>>> +
>>>        if (d->parent_data)
>>>                irq_chip_set_type_parent(d, type);
>>>
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
>>> index 9452da18a78b..7486fe08eb9b 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
>>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
>>> @@ -113,6 +113,9 @@ struct msm_gpio_wakeirq_map {
>>>    * @pull_no_keeper: The SoC does not support keeper bias.
>>>    * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
>>>    * @nwakeirq_map:   The number of entries in @wakeirq_map
>>> + * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
>>> + *                            to be aware that their parent can't handle dual
>>> + *                            edge interrupts.
>>>    */
>>>   struct msm_pinctrl_soc_data {
>>>        const struct pinctrl_pin_desc *pins;
>>> @@ -128,6 +131,7 @@ struct msm_pinctrl_soc_data {
>>>        const int *reserved_gpios;
>>>        const struct msm_gpio_wakeirq_map *wakeirq_map;
>>>        unsigned int nwakeirq_map;
>>> +     bool wakeirq_dual_edge_errata;
>>>   };
>>>
>>>   extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
>>> index 1b6465a882f2..1d9acad3c1ce 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
>>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
>>> @@ -1147,6 +1147,7 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>>>        .ntiles = ARRAY_SIZE(sc7180_tiles),
>>>        .wakeirq_map = sc7180_pdc_map,
>>>        .nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
>>> +     .wakeirq_dual_edge_errata = true,
>>>   };
>>>
>>>   static int sc7180_pinctrl_probe(struct platform_device *pdev)
>>> --
>>> 2.27.0.383.g050319c2ae-goog
>>>
>>>
>> Thanks,
>>
>>          M.
>>
>> --
>> Without deviation from the norm, progress is not possible.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


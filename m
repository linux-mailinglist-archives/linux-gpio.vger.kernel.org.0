Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D04E5FB7B3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 19:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfKMSfK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 13:35:10 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:54436 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfKMSfJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 13:35:09 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CC3D760DBB; Wed, 13 Nov 2019 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573670108;
        bh=ZnObaWots9cAPwfS6rL5OVJ53exeep9lKReRdSSgWnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RORb36fKrdAEzq75EQUisPQ+PGe1p0pjbhhqdzLwrTSttlBUKHX0MFXXis+WouoeT
         EfjwkTV0CoTSG2E12VWFl90HZ+p17Evykh+vab5VC7dsCIWXT9INjWXI4qpQ61ElBB
         xO3y1vyn8qW1ftf/J1BSelm522AQkcwr/UrEtVF8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E7A760D84;
        Wed, 13 Nov 2019 18:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573670107;
        bh=ZnObaWots9cAPwfS6rL5OVJ53exeep9lKReRdSSgWnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vr6cPxvBl2zoRGtKe6w/T8WpgumehIzIREYMP9pXSrIdFsZAcKv1FOwH2p/3uiug0
         Qk5N6uOzLHGGTV9G8VTxdYLuHniTQwppAc08b04liTt8E3utHc9D08+SDClMw+SqDc
         wx+fTDx8F0pHyXP5acU180xWDq3b+e+2alCNc3mY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E7A760D84
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 13 Nov 2019 11:35:06 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RFC v2 10/14] drivers: pinctrl: msm: setup GPIO chip in
 hierarchy
Message-ID: <20191113183506.GA18786@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-11-git-send-email-ilina@codeaurora.org>
 <CACRpkdav_BFubQ4-RWAN+uxBoExi7qfgdFhDVKfgtbXEOB5uvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdav_BFubQ4-RWAN+uxBoExi7qfgdFhDVKfgtbXEOB5uvA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 03 2019 at 06:17 -0600, Linus Walleij wrote:
>On Fri, Sep 13, 2019 at 11:59 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
>> Some GPIOs are marked as wakeup capable and are routed to another
>> interrupt controller that is an always-domain and can detect interrupts
>> even most of the SoC is powered off. The wakeup interrupt controller
>> wakes up the GIC and replays the interrupt at the GIC.
>>
>> Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
>> and ensure the wakeup GPIOs are handled correctly.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ----
>> Changes in RFC v2:
>>         - Define irq_domain_qcom_handle_wakeup()
>>         - Rebase on top of GPIO hierarchy support in linux-next
>>         - Set the chained irq handler for summary line
>
>This is looking better every time I look at it, it's really complex
>but alas the problem is hard to solve so it requires complex solutions.
>
>> @@ -1006,6 +1091,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>         struct gpio_irq_chip *girq;
>>         int ret;
>>         unsigned ngpio = pctrl->soc->ngpios;
>> +       struct device_node *dn;
>
>I usually call the variable "np"
>
Will change.

>> @@ -1021,17 +1107,40 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>
>>         pctrl->irq_chip.name = "msmgpio";
>>         pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
>> +       pctrl->irq_chip.irq_disable = msm_gpio_irq_disable;
>>         pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
>>         pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
>>         pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
>> +       pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
>
>This part and the functions called seem fine!
>
>> +       dn = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>> +       if (dn) {
>> +               int i;
>> +               bool skip;
>> +               unsigned int gpio;
>> +
>> +               chip->irq.parent_domain = irq_find_matching_host(dn,
>> +                                                DOMAIN_BUS_WAKEUP);
>> +               of_node_put(dn);
>> +               if (!chip->irq.parent_domain)
>> +                       return -EPROBE_DEFER;
>> +               chip->irq.child_to_parent_hwirq = msm_gpio_wakeirq;
>> +
>> +               skip = irq_domain_qcom_handle_wakeup(chip->irq.parent_domain);
>> +               for (i = 0; skip && i < pctrl->soc->nwakeirq_map; i++) {
>> +                       gpio = pctrl->soc->wakeirq_map[i].gpio;
>> +                       set_bit(gpio, pctrl->skip_wake_irqs);
>> +               }
>> +       }
>
>OK I guess this is how we should do it, maybe add a comment to clarify
>that we are checking the parent irqdomain of the chained IRQ to see
>if we need to avoid disabling the irq as it is used for wakeup. (IIUC
>what the code does!)
>
Okay.

>> +       /*
>> +        * Since we are chained to the GIC using the TLMM summary line
>> +        * and in hierarchy with the wakeup parent interrupt controller,
>> +        * explicitly set the chained summary line. We need to do this because
>> +        * the summary line is not routed to the wakeup parent but directly
>> +        * to the GIC.
>> +        */
>> +       gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
>> +                                    msm_gpio_irq_handler);
>
>I don't think this part is needed, we already have:
>
>girq->parent_handler = msm_gpio_irq_handler;
>girq->num_parents = 1;
>girq->parents = devm_kcalloc(pctrl->dev, 1, sizeof(*girq->parents),
>     GFP_KERNEL);
>if (!girq->parents)
>     return -ENOMEM;
>girq->default_type = IRQ_TYPE_NONE;
>girq->handler = handle_bad_irq;
>girq->parents[0] = pctrl->irq;
>
>This will make the irq chain when calling gpiochip_add_data(), so
>just delete this and see if everything works as before.
>
I thought it didn't work without this change and I am not sure why it
started working after I did. May be it was a bad set of patches that I
pulled in.

>Other than that it looks fine!
Thanks for your review.

--Lina

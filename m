Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC952D3B14
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgLIFy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:54:58 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:37036 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbgLIFyu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:54:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607493268; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oQk/lzwcM3pRAIM5924qkBOXxspnBjbCObn0V+kLGAw=; b=A+MmyEXZRBKHsnzZg0YBFo2G1YBhc/1JDdRllMATYQ/YzqQsTUPOE244O2PMgwzagQqaZhtG
 CPM4Vcs9shtWF1rnD8ydFNK64RrPtXHEYOe9hULxBwyBUu5KNbjMBOJI6Mm5Jk7MBtwmKucu
 O/pz2D7Jaw+kFUPphQA0MrrPWZQ=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fd066716d5c2f1d2099d743 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Dec 2020 05:53:53
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66CE3C43461; Wed,  9 Dec 2020 05:53:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BC17C433C6;
        Wed,  9 Dec 2020 05:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2BC17C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
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
 <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org>
 <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <5f24ec87-6d91-dfd9-0f4f-6687f37c60ac@codeaurora.org>
Date:   Wed, 9 Dec 2020 11:23:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On 12/4/2020 2:34 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Dec 3, 2020 at 3:22 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>>>> +     /*
>>>>> +      * Clear IRQs if switching to/from GPIO mode since muxing to/from
>>>>> +      * the GPIO path can cause phantom edges.
>>>>> +      */
>>>>> +     old_i = (oldval & mask) >> g->mux_bit;
>>>>> +     if (old_i != i &&
>>>>> +         (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
>>>>> +             msm_pinctrl_clear_pending_irq(pctrl, group, irq);
>>>>> +
>>>> The phantom irq can come when switching to GPIO irq mode. so may be only
>>>> check if (i == pctrl->soc->gpio_func) {
>>> Have you tested this experimentally?
>> Yes
> Yes means that you tried switching away from GPIO mode and you
> couldn't get a phantom interrupt?  OK, I'll re-test then.
>
> I'll test on the Chrome OS kernel tree since that's easiest for me,
> but I can test on mainline if you think it would make a difference...
>
> 1. Pick <https://crrev.com/c/2556012> and put that kernel on the device.
>
> 2. In Cr50 console, make the WP line low with:
>    wp enable
>
> 3. In AP console do:
>    echo bogus > /sys/module/gpio_keys/parameters/doug_test
>
> 4. See bogus interrupt:
>
> localhost ~ # echo bogus > /sys/module/gpio_keys/parameters/doug_test
> [   62.006346] DOUG: selecting state bogus
> [   62.011813] DOUG: ret 0
> [   62.011875] DOUG: in dual edge parent: hwirq=66, type=1
> [   62.020300] DOUG: gpio_keys_gpio_isr
>
> Can you try replicating again?
>
>
>>> I have experimentally tested this and I can actually see an interrupt
>>> generated when I _leave_ GPIO as well as when I enter GPIO mode.  If
>>> you can't see this I can re-setup my test, but this was one of those
>>> things that convinced me that the _transition_ is what was causing the
>>> fake interrupt.
>>>
>>> I think my test CL <https://crrev.com/c/2556012/> can help you with
>>> testing if you wish.
>>>
>>>
>>>> even better if you can clear this unconditionally.
>>> Why?  It should only matter if we're going to/from GPIO mode.
>> Probably i was not clear, the phantom irq should be cleared when
>> switching gpio to gpio IRQ mode.
>>
>> When GPIO was used as Rx line in example QUP/UART use case, it can latch
>> the phantom IRQ
> This is where I disagree with you.  I don't think the interrupt is
> latching while it's used as an Rx line.  I think it's the pinmux
> change that introduces an phantom interrupt.
>
> Specifically, with the same test patch above, AKA
> <https://crrev.com/c/2556012>, I can do this:
>
> 1. On AP:
>    echo bogus > /sys/module/gpio_keys/parameters/doug_test
>
> 2. On Cr50 console:
>    wp disable
>    wp enable
>    wp disable
>    wp enable
>    wp disable
>    wp enable
>
> 3. Go back and check the AP and see that no interrupts fired.
>
> Said another way: when we're muxed away the interrupts aren't getting
> latched.  It's the act of changing the mux that causes the phantom
> interrupts.
>
>
>> but as long as its IRQ is in disabled/masked state it
>> doesn't matter.
> ...but there's no requirement that someone would need to disable/mask
> an interrupt while switching the muxing, is there?  So it does matter.
>
>
>> its only when the GPIO is again set to IRQ mode with set_mux callback,
>> the phantom IRQ needs clear to start as clean.
>>
>> So we should check only for if (i == pctrl->soc->gpio_func) then clear
>> phantom IRQ.
>>
>> The same is case with .direction_output callback, when GPIO is used as
>> output say as clock, need not clear any phantom IRQ,
>>
>> The reason is with every pulse of clock it can latch as pending IRQ in
>> GIC_ISPEND as long as it stay as output mode/clock.
>>
>> its only when switching back GPIO from output direction to input & IRQ
>> function, need to clear the phantom IRQ.
>>
>> so we do not require clear phantom irq in .direction_output callback.
> I think all the above explanation is with the model that the interrupt
> detection logic is still happening even when muxed away.  I don't
> believe that's true.
Its not the interrupt detection logic that is still happening when muxed 
away, but the GPIO line is routed to GIC from PDC.
The GPIO line get forwarded when the system is active/out of system 
level low power mode to GIC irrespective of whether GPIO is used as 
interrupt or not.
Due to this it can still latch the IRQ at GIC after switching to lets 
say Rx mode, whenever the line has any data recive, the line state 
toggles can be latched as error interrupt at GIC.

As the interrupt is in disabled state it won't be sent to CPU.
Its only when the driver chooses to switch back to interrupt mode we 
want to clear the error interrupt latched to start as clean. same is the 
case when used as output direction.

Hope above is clear.

Thanks,
Maulik
> Please run my test patch or code up something
> similar yourself.
>
>
>>>> In step (3) msm_gpio_irq_set_type() touches the RAW_STATUS_EN making the
>>>> phantom irq pending again.
>>>> To resolve this, you will need to invoke msm_pinctrl_clear_pending_irq()
>>>> at the end of the msm_gpio_irq_set_type().
>>>>
>>>> I would like Rajendra's (already in cc) review as well on above part.
>>> Ugh, so we need a clear in yet another place.  Joy.  OK, I will wait
>>> for Rajendra's comment but I can add similar code in
>>> msm_gpio_irq_enable().
>> As the clearing phantom irq code in msm_gpio_irq_enable() is moved to
>> separate function msm_pinctrl_clear_pending_irq(), it needs invoke from
>> at the end of msm_gpio_irq_set_type() too.
> Seems reasonable to me.  I'll include this in my next spin.  Still
> waiting for us to agree on some of the points above before spinning,
> though.
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


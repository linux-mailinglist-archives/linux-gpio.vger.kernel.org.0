Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449542C25E1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 13:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbgKXMng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 07:43:36 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:44664 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730663AbgKXMng (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 07:43:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606221815; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KPH+uh7Q002+AMdNTwne1i7ICbqTjCHDwyjsOxu6Krw=; b=v4bTs3kresKIL1QenuHOGs08rBTEsE0lW6PYpEB12Anj92PE7zDuBwTlxSBokxWzK+5FkdiU
 Y53hwrxCm5FhO6bpD9y1WzDWPc//TrHytYFtrwfJSg+P2h6KvwnYxp2t/jtACrF1xrB6Ix8a
 CVHiF5b/nWwD6RKLCPykm0Swr9I=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbcfff3fa67d9becf1a6ba6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 12:43:31
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66711C43462; Tue, 24 Nov 2020 12:43:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7EBFC433C6;
        Tue, 24 Nov 2020 12:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7EBFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Marc Zyngier <maz@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201123160139.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <502b39f5-a2b3-5893-da18-47b034f4895d@codeaurora.org>
 <853f7419653122d2fd46e8d70202d25c@kernel.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <bc0337f1-4b8e-7a3a-22fd-ff6f8cbaffca@codeaurora.org>
Date:   Tue, 24 Nov 2020 18:13:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <853f7419653122d2fd46e8d70202d25c@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

On 11/24/2020 4:45 PM, Marc Zyngier wrote:
> On 2020-11-24 10:37, Maulik Shah wrote:
>
> [...]
>
>>>   static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>>                     unsigned function,
>>>                     unsigned group)
>>>   {
>>>       struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>>> +    struct gpio_chip *gc = &pctrl->chip;
>>> +    unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>>>       const struct msm_pingroup *g;
>>>       unsigned long flags;
>>>       u32 val, mask;
>>> +    u32 oldval;
>>> +    u32 old_i;
>>>       int i;
>>>         g = &pctrl->soc->groups[group];
>>> @@ -187,15 +215,26 @@ static int msm_pinmux_set_mux(struct 
>>> pinctrl_dev *pctldev,
>>>       if (WARN_ON(i == g->nfuncs))
>>>           return -EINVAL;
>>>   -    raw_spin_lock_irqsave(&pctrl->lock, flags);
>>> +    disable_irq(irq);
>>>   -    val = msm_readl_ctl(pctrl, g);
>>> +    raw_spin_lock_irqsave(&pctrl->lock, flags);
>>> +    oldval = val = msm_readl_ctl(pctrl, g);
>>>       val &= ~mask;
>>>       val |= i << g->mux_bit;
>>>       msm_writel_ctl(val, pctrl, g);
>>> -
>>>       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>   +    /*
>>> +     * Clear IRQs if switching to/from GPIO mode since muxing to/from
>>> +     * the GPIO path can cause phantom edges.
>>> +     */
>>> +    old_i = (oldval & mask) >> g->mux_bit;
>>> +    if (old_i != i &&
>>> +        (i == pctrl->soc->gpio_func || old_i == 
>>> pctrl->soc->gpio_func))
>>> +        msm_pinctrl_clear_pending_irq(pctrl, group, irq);
>>
>> disable_irq() and enable_irq() should be moved inside this if loop. as
>> only use for this is to mask the IRQ when switching back to gpio IRQ
>> mode?
>>
>> i also don't think we should leave IRQ enabled at the end of this
>> function by default, probably need to check if IRQ was already
>> unmasked before disabling it, then only call enable_irq().
>
> Why? It looks to me that this reproduces the behaviour of 
> IRQCHIP_SET_TYPE_MASKED, which is highly desirable. What
> problem are you trying to address with this?

Correct, here trying to reproduce the behaviour of 
IRQCHIP_SET_TYPE_MASKED which i guess is ok once its moved inside if 
loop as this is the place its switching to IRQ mode.

but there is a problem to leave it enabled at the end of set_direction 
callbacks, see below.

>
>>
>>> +
>>> +    enable_irq(irq);
>>> +
>>>       return 0;
>>>   }
>>>   @@ -456,32 +495,45 @@ static const struct pinconf_ops 
>>> msm_pinconf_ops = {
>>>   static int msm_gpio_direction_input(struct gpio_chip *chip, 
>>> unsigned offset)
>>>   {
>>>       const struct msm_pingroup *g;
>>> +    unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>>>       struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>>>       unsigned long flags;
>>> +    u32 oldval;
>>>       u32 val;
>>>         g = &pctrl->soc->groups[offset];
>>>   +    disable_irq(irq);
>>> +
>>>       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>   -    val = msm_readl_ctl(pctrl, g);
>>> +    oldval = val = msm_readl_ctl(pctrl, g);
>>>       val &= ~BIT(g->oe_bit);
>>>       msm_writel_ctl(val, pctrl, g);
>>>         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>   +    if (oldval != val)
>>> +        msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
>>> +
>>> +    enable_irq(irq);
>>
>> i do not think we need disable_irq() and enable_irq() here, changing
>> direction to input does not mean its being used for interrupt only, it
>> may be set to use something like Rx mode in UART.
>>
>> the client driver should enable IRQ when needed.
>
> And the kernel doesn't expect random interrupts to fire. Again, what
> are you trying to fix by removing these?

I see leaving IRQ enabled here can cause problems. For example in 
qcom_geni_serial.c driver before requesting IRQ, it sets the 
IRQ_NOAUTOEN flag to not keep it enabled.

see the below snippet
         irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
         ret = devm_request_irq(uport->dev, uport->irq, 
qcom_geni_serial_isr,
                         IRQF_TRIGGER_HIGH, port->name, uport);

later when this devm_request_irq() invokes .irq_request_resources 
callback it will reach msm_gpio_irq_reqres() from
where msm_gpio_direction_input() is called which leaves the irq enabled 
at the end with enable_irq() which was not expected by driver.

It will cause is IRQ storm since the UART geni driver uses GPIO in Rx 
mode when out of suspend. The IRQ mode in GPIO is enabled
with suspend entry only. During resume the IRQ will again be disabled 
and GPIO will be switched to Rx mode.

Thanks,
Maulik
>
>         M.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


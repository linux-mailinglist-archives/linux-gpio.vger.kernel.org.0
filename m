Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C14E2C26C8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 14:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387842AbgKXNGP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 08:06:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:60342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387739AbgKXNGP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 08:06:15 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCCF220782;
        Tue, 24 Nov 2020 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606223174;
        bh=4uyAwNGYRq1c8nU0Ieb1KCXDCCdV4xWaL1ntzg6be5k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u571IxytMGlmCVrdjRTGojqTNLB+iRuBqBFgAKNoDN3g/meB1WssV5OtbnX/tDmN9
         +HOJa9BoURlforX4dNBjzpNWVRE5fJDuiOKZlWn1BiR9VDvIF0X9V6M4hw5zQT1qn5
         D1RGo76Oj0ooUMB9naurskqIC/Hr6JGmsJZxKtrs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1khY1L-00DFiR-LE; Tue, 24 Nov 2020 13:06:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 24 Nov 2020 13:06:11 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
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
Subject: Re: [PATCH 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
In-Reply-To: <bc0337f1-4b8e-7a3a-22fd-ff6f8cbaffca@codeaurora.org>
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201123160139.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <502b39f5-a2b3-5893-da18-47b034f4895d@codeaurora.org>
 <853f7419653122d2fd46e8d70202d25c@kernel.org>
 <bc0337f1-4b8e-7a3a-22fd-ff6f8cbaffca@codeaurora.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <a15efffeb81fc491bbb53a43ae3f8400@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mkshah@codeaurora.org, dianders@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, sramana@codeaurora.org, neeraju@codeaurora.org, rnayak@codeaurora.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, swboyd@chromium.org, agross@kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-24 12:43, Maulik Shah wrote:
> Hi Marc,
> 
> On 11/24/2020 4:45 PM, Marc Zyngier wrote:
>> On 2020-11-24 10:37, Maulik Shah wrote:
>> 
>> [...]
>> 
>>>>   static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>>>                     unsigned function,
>>>>                     unsigned group)
>>>>   {
>>>>       struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>>>> +    struct gpio_chip *gc = &pctrl->chip;
>>>> +    unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>>>>       const struct msm_pingroup *g;
>>>>       unsigned long flags;
>>>>       u32 val, mask;
>>>> +    u32 oldval;
>>>> +    u32 old_i;
>>>>       int i;
>>>>         g = &pctrl->soc->groups[group];
>>>> @@ -187,15 +215,26 @@ static int msm_pinmux_set_mux(struct 
>>>> pinctrl_dev *pctldev,
>>>>       if (WARN_ON(i == g->nfuncs))
>>>>           return -EINVAL;
>>>>   -    raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>> +    disable_irq(irq);
>>>>   -    val = msm_readl_ctl(pctrl, g);
>>>> +    raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>> +    oldval = val = msm_readl_ctl(pctrl, g);
>>>>       val &= ~mask;
>>>>       val |= i << g->mux_bit;
>>>>       msm_writel_ctl(val, pctrl, g);
>>>> -
>>>>       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>>   +    /*
>>>> +     * Clear IRQs if switching to/from GPIO mode since muxing 
>>>> to/from
>>>> +     * the GPIO path can cause phantom edges.
>>>> +     */
>>>> +    old_i = (oldval & mask) >> g->mux_bit;
>>>> +    if (old_i != i &&
>>>> +        (i == pctrl->soc->gpio_func || old_i == 
>>>> pctrl->soc->gpio_func))
>>>> +        msm_pinctrl_clear_pending_irq(pctrl, group, irq);
>>> 
>>> disable_irq() and enable_irq() should be moved inside this if loop. 
>>> as
>>> only use for this is to mask the IRQ when switching back to gpio IRQ
>>> mode?
>>> 
>>> i also don't think we should leave IRQ enabled at the end of this
>>> function by default, probably need to check if IRQ was already
>>> unmasked before disabling it, then only call enable_irq().
>> 
>> Why? It looks to me that this reproduces the behaviour of 
>> IRQCHIP_SET_TYPE_MASKED, which is highly desirable. What
>> problem are you trying to address with this?
> 
> Correct, here trying to reproduce the behaviour of
> IRQCHIP_SET_TYPE_MASKED which i guess is ok once its moved inside if
> loop as this is the place its switching to IRQ mode.
> 
> but there is a problem to leave it enabled at the end of set_direction
> callbacks, see below.
> 
>> 
>>> 
>>>> +
>>>> +    enable_irq(irq);
>>>> +
>>>>       return 0;
>>>>   }
>>>>   @@ -456,32 +495,45 @@ static const struct pinconf_ops 
>>>> msm_pinconf_ops = {
>>>>   static int msm_gpio_direction_input(struct gpio_chip *chip, 
>>>> unsigned offset)
>>>>   {
>>>>       const struct msm_pingroup *g;
>>>> +    unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>>>>       struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>>>>       unsigned long flags;
>>>> +    u32 oldval;
>>>>       u32 val;
>>>>         g = &pctrl->soc->groups[offset];
>>>>   +    disable_irq(irq);
>>>> +
>>>>       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>>   -    val = msm_readl_ctl(pctrl, g);
>>>> +    oldval = val = msm_readl_ctl(pctrl, g);
>>>>       val &= ~BIT(g->oe_bit);
>>>>       msm_writel_ctl(val, pctrl, g);
>>>>         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>>   +    if (oldval != val)
>>>> +        msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
>>>> +
>>>> +    enable_irq(irq);
>>> 
>>> i do not think we need disable_irq() and enable_irq() here, changing
>>> direction to input does not mean its being used for interrupt only, 
>>> it
>>> may be set to use something like Rx mode in UART.
>>> 
>>> the client driver should enable IRQ when needed.
>> 
>> And the kernel doesn't expect random interrupts to fire. Again, what
>> are you trying to fix by removing these?
> 
> I see leaving IRQ enabled here can cause problems. For example in
> qcom_geni_serial.c driver before requesting IRQ, it sets the
> IRQ_NOAUTOEN flag to not keep it enabled.
> 
> see the below snippet
>         irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
>         ret = devm_request_irq(uport->dev, uport->irq, 
> qcom_geni_serial_isr,
>                         IRQF_TRIGGER_HIGH, port->name, uport);
> 
> later when this devm_request_irq() invokes .irq_request_resources
> callback it will reach msm_gpio_irq_reqres() from
> where msm_gpio_direction_input() is called which leaves the irq
> enabled at the end with enable_irq() which was not expected by driver.

No it doesn't. disable_irq()/enable_irq() are designed to nest.
If the interrupt line was disabled before the disable/enable
sequence, it will still be disabled after.

> It will cause is IRQ storm since the UART geni driver uses GPIO in Rx
> mode when out of suspend. The IRQ mode in GPIO is enabled
> with suspend entry only. During resume the IRQ will again be disabled
> and GPIO will be switched to Rx mode.

I don't see how this contradicts what is above. If the interrupt was
disabled before hitting this sequence, it will still be disabled after.
Am I missing something? Have you actually seen the problem on HW?

         M.
-- 
Jazz is not dead. It just smells funny...

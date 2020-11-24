Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698422C23F6
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 12:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732521AbgKXLPT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 06:15:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:36468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732485AbgKXLPS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 06:15:18 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAFDD2073C;
        Tue, 24 Nov 2020 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606216517;
        bh=ht4YbbardGshSUpnL4Dh1pktl4Ih4xfh/e9s5T268xU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d8WhWYHAj+QFHTBbt3uDR2tbxvk66wgiwQGCiXgQiR1QPDsvfcCG1h2NHzsZvpcOv
         4k8z6o8p2kSFmiLNHaskxLRUD3O6Mpnyp0PwGU3K75TsRcgSN+0CGBqCrB5+A/dWRi
         4v5FQPl4EI3PlKn3Opy0aOehkbyWi050+IkuicWQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1khWHu-00DEMA-K1; Tue, 24 Nov 2020 11:15:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Nov 2020 11:15:10 +0000
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
In-Reply-To: <502b39f5-a2b3-5893-da18-47b034f4895d@codeaurora.org>
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201123160139.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <502b39f5-a2b3-5893-da18-47b034f4895d@codeaurora.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <853f7419653122d2fd46e8d70202d25c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mkshah@codeaurora.org, dianders@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, sramana@codeaurora.org, neeraju@codeaurora.org, rnayak@codeaurora.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, swboyd@chromium.org, agross@kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-24 10:37, Maulik Shah wrote:

[...]

>>   static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>   			      unsigned function,
>>   			      unsigned group)
>>   {
>>   	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> +	struct gpio_chip *gc = &pctrl->chip;
>> +	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>>   	const struct msm_pingroup *g;
>>   	unsigned long flags;
>>   	u32 val, mask;
>> +	u32 oldval;
>> +	u32 old_i;
>>   	int i;
>>     	g = &pctrl->soc->groups[group];
>> @@ -187,15 +215,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev 
>> *pctldev,
>>   	if (WARN_ON(i == g->nfuncs))
>>   		return -EINVAL;
>>   -	raw_spin_lock_irqsave(&pctrl->lock, flags);
>> +	disable_irq(irq);
>>   -	val = msm_readl_ctl(pctrl, g);
>> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
>> +	oldval = val = msm_readl_ctl(pctrl, g);
>>   	val &= ~mask;
>>   	val |= i << g->mux_bit;
>>   	msm_writel_ctl(val, pctrl, g);
>> -
>>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>   +	/*
>> +	 * Clear IRQs if switching to/from GPIO mode since muxing to/from
>> +	 * the GPIO path can cause phantom edges.
>> +	 */
>> +	old_i = (oldval & mask) >> g->mux_bit;
>> +	if (old_i != i &&
>> +	    (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
>> +		msm_pinctrl_clear_pending_irq(pctrl, group, irq);
> 
> disable_irq() and enable_irq() should be moved inside this if loop. as
> only use for this is to mask the IRQ when switching back to gpio IRQ
> mode?
> 
> i also don't think we should leave IRQ enabled at the end of this
> function by default, probably need to check if IRQ was already
> unmasked before disabling it, then only call enable_irq().

Why? It looks to me that this reproduces the behaviour of 
IRQCHIP_SET_TYPE_MASKED, which is highly desirable. What
problem are you trying to address with this?

> 
>> +
>> +	enable_irq(irq);
>> +
>>   	return 0;
>>   }
>>   @@ -456,32 +495,45 @@ static const struct pinconf_ops 
>> msm_pinconf_ops = {
>>   static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned 
>> offset)
>>   {
>>   	const struct msm_pingroup *g;
>> +	unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>>   	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>>   	unsigned long flags;
>> +	u32 oldval;
>>   	u32 val;
>>     	g = &pctrl->soc->groups[offset];
>>   +	disable_irq(irq);
>> +
>>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>>   -	val = msm_readl_ctl(pctrl, g);
>> +	oldval = val = msm_readl_ctl(pctrl, g);
>>   	val &= ~BIT(g->oe_bit);
>>   	msm_writel_ctl(val, pctrl, g);
>>     	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>   +	if (oldval != val)
>> +		msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
>> +
>> +	enable_irq(irq);
> 
> i do not think we need disable_irq() and enable_irq() here, changing
> direction to input does not mean its being used for interrupt only, it
> may be set to use something like Rx mode in UART.
> 
> the client driver should enable IRQ when needed.

And the kernel doesn't expect random interrupts to fire. Again, what
are you trying to fix by removing these?

         M.
-- 
Jazz is not dead. It just smells funny...

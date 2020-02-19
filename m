Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C9F164516
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 14:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgBSNN2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 08:13:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:60096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgBSNN2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 08:13:28 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF99821D56;
        Wed, 19 Feb 2020 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582118006;
        bh=bL/TOiagPfoRLR3fOAnI6m8tFS6WjfGcMBXv31ltqR8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aSaExjJsYv/OEylvZg1BUY1DHJNR4GC+StKizipm622JuXBAEpuY5e4M5bFvBW+kr
         /5eeJbTthSFR6dVZXnm6GWXeSD6WI3ytC6WNiP0m98FhAJICJm1tJ7a8Vihixg2n/a
         8/ecKfw8wSa5uyM45tAJMlhscO1IP7EMZK0QBXV8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j4PAL-006VkK-2a; Wed, 19 Feb 2020 13:13:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 19 Feb 2020 13:13:25 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>, marex@denx.de,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] irqchip/stm32: Add irq retrigger support
In-Reply-To: <ae69e38a-78f9-ca68-c48c-86275e41b3bb@st.com>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-2-alexandre.torgue@st.com>
 <16d27f75-8157-7a92-ae61-b5b3ab05bdd9@st.com>
 <608d9c84813323ee3839f6ac21aa8f4e@kernel.org>
 <ae69e38a-78f9-ca68-c48c-86275e41b3bb@st.com>
Message-ID: <10cabf9edf901fb148a1a2a5e2448845@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, marex@denx.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-02-19 13:07, Alexandre Torgue wrote:
> On 2/19/20 12:43 PM, Marc Zyngier wrote:
>> On 2020-02-19 11:33, Alexandre Torgue wrote:
>>> Fix Marc email address
>>> 
>>> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>>>> This commit introduces retrigger support for stm32_ext_h chip.
>>>> It consists to rise the GIC interrupt mapped to an EXTI line.
>>>> 
>>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>> 
>>>> diff --git a/drivers/irqchip/irq-stm32-exti.c 
>>>> b/drivers/irqchip/irq-stm32-exti.c
>>>> index e00f2fa27f00..c971d115edb4 100644
>>>> --- a/drivers/irqchip/irq-stm32-exti.c
>>>> +++ b/drivers/irqchip/irq-stm32-exti.c
>>>> @@ -604,12 +604,24 @@ static void stm32_exti_h_syscore_deinit(void)
>>>>       unregister_syscore_ops(&stm32_exti_h_syscore_ops);
>>>>   }
>>>>   +static int stm32_exti_h_retrigger(struct irq_data *d)
>>>> +{
>>>> +    struct stm32_exti_chip_data *chip_data = 
>>>> irq_data_get_irq_chip_data(d);
>>>> +    const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
>>>> +    void __iomem *base = chip_data->host_data->base;
>>>> +    u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
>>>> +
>>>> +    writel_relaxed(mask, base + stm32_bank->swier_ofst);
>>>> +
>>>> +    return irq_chip_retrigger_hierarchy(d);
>> 
>> Calling irq_chip_retrigger_hierarchy here is really odd. If the write
>> above has the effect of making the interrupt pending again, why do you
>> need to force the retrigger any further?
> 
> To be honest, as we use hierarchical irq_chip, I thought it was the
> way to follow (to retrigger parent irq_chip). It makes maybe no sens
> here.

Indeed, it looks perfectly pointless. What 
irq_chip_retrigger_hierarchy()
does is to look for the first parent irqchip that is able to retrigger
the interrupt. Guess what, you've just done that already. And once 
you've
generated the interrupt, you don't need to ask the other irqchips in the
chain to do the same thing.

> The most important to regenerate gic interrupt (associate to the exti
> line) is to write in SWIER register.

Quite. Hence my question.

         M.
-- 
Jazz is not dead. It just smells funny...

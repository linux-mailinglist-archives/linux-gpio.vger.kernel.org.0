Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F12164396
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSLnO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:43:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:37206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgBSLnO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:43:14 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7542524654;
        Wed, 19 Feb 2020 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582112593;
        bh=cMEgzzVGtoiAaBQbg6W/JzWI5xmZ34oYwgybQc4cGV0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LuTL44v0bbP2jnnoPOJQmUAw3xcYT0FnwLbsv5i51y1ywelaSOqjYVIO0+g5jbV5j
         RBhT2CdyTMiKsv7W3SkiN+r11Swuqm4M4RK4VXgTUj3C3YGOOIJ0QXkcpFTjjjQVwy
         dGNYJduxvrw9bNiMwNJEWLQXDfUIQnKiVLA5AAxw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j4Nl1-006Ugr-Nw; Wed, 19 Feb 2020 11:43:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 Feb 2020 11:43:11 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>, marex@denx.de,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] irqchip/stm32: Add irq retrigger support
In-Reply-To: <16d27f75-8157-7a92-ae61-b5b3ab05bdd9@st.com>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-2-alexandre.torgue@st.com>
 <16d27f75-8157-7a92-ae61-b5b3ab05bdd9@st.com>
Message-ID: <608d9c84813323ee3839f6ac21aa8f4e@kernel.org>
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

On 2020-02-19 11:33, Alexandre Torgue wrote:
> Fix Marc email address
> 
> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>> This commit introduces retrigger support for stm32_ext_h chip.
>> It consists to rise the GIC interrupt mapped to an EXTI line.
>> 
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>> 
>> diff --git a/drivers/irqchip/irq-stm32-exti.c 
>> b/drivers/irqchip/irq-stm32-exti.c
>> index e00f2fa27f00..c971d115edb4 100644
>> --- a/drivers/irqchip/irq-stm32-exti.c
>> +++ b/drivers/irqchip/irq-stm32-exti.c
>> @@ -604,12 +604,24 @@ static void stm32_exti_h_syscore_deinit(void)
>>   	unregister_syscore_ops(&stm32_exti_h_syscore_ops);
>>   }
>>   +static int stm32_exti_h_retrigger(struct irq_data *d)
>> +{
>> +	struct stm32_exti_chip_data *chip_data = 
>> irq_data_get_irq_chip_data(d);
>> +	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
>> +	void __iomem *base = chip_data->host_data->base;
>> +	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
>> +
>> +	writel_relaxed(mask, base + stm32_bank->swier_ofst);
>> +
>> +	return irq_chip_retrigger_hierarchy(d);

Calling irq_chip_retrigger_hierarchy here is really odd. If the write
above has the effect of making the interrupt pending again, why do you
need to force the retrigger any further?

             M.
-- 
Jazz is not dead. It just smells funny...

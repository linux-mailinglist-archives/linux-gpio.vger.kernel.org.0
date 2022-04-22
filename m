Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B199A50B3EF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbiDVJYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 05:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445792AbiDVJYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 05:24:10 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B73245A1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 02:21:17 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M96RAT004664;
        Fri, 22 Apr 2022 11:20:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=J8qVrIPOY95i1a03vU5JIp+/D57iP6RoE2zEy4FREEw=;
 b=eiDE6CEe0c0WPzLNpExT9nMglu4jruwYn7sa2GhZ8e4IBOGXF1DQ0+zcko7JnpxB1gI6
 ahSyPVgDw2sZpuoe8dDcp5mq4Mf7POAO9wpghXGmtI4F11Nyzbqu9BA8KDR8GevQkaEq
 adoYWLxzhWZMz2FAdr01ObbUvxWBp9Ws9ZYx3DM2svjNpgmNpjYOJsrWrzLnkKyqm7p6
 PUgQzdTyBJ4BUaaV3vfl53li+CbCtiE/PF0juRpCi0S8rao6snnd5DG2ImJnMmynETb0
 WBL7iti1BE2xEmqxtVwsjWIa6f0E025guq0zlrqDewgsCJcIv1abPoc8c0of6dd+3F5m xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe83rv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Apr 2022 11:20:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77F2110002A;
        Fri, 22 Apr 2022 11:20:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67DF921A23C;
        Fri, 22 Apr 2022 11:20:57 +0200 (CEST)
Received: from [10.211.7.146] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 22 Apr
 2022 11:20:56 +0200
Message-ID: <5f3aa91e-0ca3-a13a-1ea3-daae982b3d8f@foss.st.com>
Date:   Fri, 22 Apr 2022 11:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] irqchip/stm32: Keep pinctrl block clock enabled when
 LEVEL IRQ requested
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-gpio@vger.kernel.org>
CC:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220421140827.214088-1-marex@denx.de>
From:   Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <20220421140827.214088-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek,

I agree there is something wrong with the clock management in IRQ 
context here and your patch goes in the right way.
There are also some other problems regarding performance (enabling / 
disabling clock each time we want to change the IO value, ...).
For these both issues I have a patch, which basically keeps the GPIO 
clocks enabled from probe.
I did not have time to submit it, but, considering your concerns, I will 
do it in the coming days.
For the time being I suggest that we do not apply your patch.

BR
Fabien

On 21/04/2022 16:08, Marek Vasut wrote:
> The current EOI handler for LEVEL triggered interrupts calls clk_enable(),
> register IO, clk_disable(). The clock manipulation requires locking which
> happens with IRQs disabled in clk_enable_lock(). Instead of turning the
> clock on and off all the time, enable the clock in case LEVEL interrupt is
> requested and keep the clock enabled until all LEVEL interrupts are freed.
> The LEVEL interrupts are an exception on this platform and seldom used, so
> this does not affect the common case.
> 
> This simplifies the LEVEL interrupt handling considerably and also fixes
> the following splat found when using preempt-rt:
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 0 at kernel/locking/rtmutex.c:2040 __rt_mutex_trylock+0x37/0x62
>   Modules linked in:
>   CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.109-rt65-stable-standard-00068-g6a5afc4b1217 #85
>   Hardware name: STM32 (Device Tree Support)
>   [<c010a45d>] (unwind_backtrace) from [<c010766f>] (show_stack+0xb/0xc)
>   [<c010766f>] (show_stack) from [<c06353ab>] (dump_stack+0x6f/0x84)
>   [<c06353ab>] (dump_stack) from [<c01145e3>] (__warn+0x7f/0xa4)
>   [<c01145e3>] (__warn) from [<c063386f>] (warn_slowpath_fmt+0x3b/0x74)
>   [<c063386f>] (warn_slowpath_fmt) from [<c063b43d>] (__rt_mutex_trylock+0x37/0x62)
>   [<c063b43d>] (__rt_mutex_trylock) from [<c063c053>] (rt_spin_trylock+0x7/0x16)
>   [<c063c053>] (rt_spin_trylock) from [<c036a2f3>] (clk_enable_lock+0xb/0x80)
>   [<c036a2f3>] (clk_enable_lock) from [<c036ba69>] (clk_core_enable_lock+0x9/0x18)
>   [<c036ba69>] (clk_core_enable_lock) from [<c034e9f3>] (stm32_gpio_get+0x11/0x24)
>   [<c034e9f3>] (stm32_gpio_get) from [<c034ef43>] (stm32_gpio_irq_trigger+0x1f/0x48)
>   [<c034ef43>] (stm32_gpio_irq_trigger) from [<c014aa53>] (handle_fasteoi_irq+0x71/0xa8)
>   [<c014aa53>] (handle_fasteoi_irq) from [<c0147111>] (generic_handle_irq+0x19/0x22)
>   [<c0147111>] (generic_handle_irq) from [<c014752d>] (__handle_domain_irq+0x55/0x64)
>   [<c014752d>] (__handle_domain_irq) from [<c0346f13>] (gic_handle_irq+0x53/0x64)
>   [<c0346f13>] (gic_handle_irq) from [<c0100ba5>] (__irq_svc+0x65/0xc0)
>   Exception stack(0xc0e01f18 to 0xc0e01f60)
>   1f00:                                                       0000300c 00000000
>   1f20: 0000300c c010ff01 00000000 00000000 c0e00000 c0e07714 00000001 c0e01f78
>   1f40: c0e07758 00000000 ef7cd0ff c0e01f68 c010554b c0105542 40000033 ffffffff
>   [<c0100ba5>] (__irq_svc) from [<c0105542>] (arch_cpu_idle+0xc/0x1e)
>   [<c0105542>] (arch_cpu_idle) from [<c063be95>] (default_idle_call+0x21/0x3c)
>   [<c063be95>] (default_idle_call) from [<c01324f7>] (do_idle+0xe3/0x1e4)
>   [<c01324f7>] (do_idle) from [<c01327b3>] (cpu_startup_entry+0x13/0x14)
>   [<c01327b3>] (cpu_startup_entry) from [<c0a00c13>] (start_kernel+0x397/0x3d4)
>   [<c0a00c13>] (start_kernel) from [<00000000>] (0x0)
>   ---[ end trace 0000000000000002 ]---
> 
> Power consumption measured on STM32MP157C DHCOM SoM is not increased or
> is below noise threshold.
> 
> Fixes: 47beed513a85b ("pinctrl: stm32: Add level interrupt support to gpio irq chip")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-gpio@vger.kernel.org
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 242d1c37c6e4..7aecd0efde07 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -226,6 +226,13 @@ static void stm32_gpio_free(struct gpio_chip *chip, unsigned offset)
>   	pinctrl_gpio_free(chip->base + offset);
>   }
>   
> +static int stm32_gpio_get_noclk(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
> +
> +	return !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
> +}
> +
>   static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
>   {
>   	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
> @@ -233,7 +240,7 @@ static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
>   
>   	clk_enable(bank->clk);
>   
> -	ret = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
> +	ret = stm32_gpio_get_noclk(chip, offset);
>   
>   	clk_disable(bank->clk);
>   
> @@ -317,7 +324,7 @@ static void stm32_gpio_irq_trigger(struct irq_data *d)
>   		return;
>   
>   	/* If level interrupt type then retrig */
> -	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
> +	level = stm32_gpio_get_noclk(&bank->gpio_chip, d->hwirq);
>   	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
>   	    (level == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
>   		irq_chip_retrigger_hierarchy(d);
> @@ -359,6 +366,7 @@ static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
>   {
>   	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
>   	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
> +	unsigned long flags;
>   	int ret;
>   
>   	ret = stm32_gpio_direction_input(&bank->gpio_chip, irq_data->hwirq);
> @@ -372,6 +380,10 @@ static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
>   		return ret;
>   	}
>   
> +	flags = irqd_get_trigger_type(irq_data);
> +	if (flags & IRQ_TYPE_LEVEL_MASK)
> +		clk_enable(bank->clk);
> +
>   	return 0;
>   }
>   
> @@ -379,6 +391,9 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
>   {
>   	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
>   
> +	if (bank->irq_type[irq_data->hwirq] & IRQ_TYPE_LEVEL_MASK)
> +		clk_disable(bank->clk);
> +
>   	gpiochip_unlock_as_irq(&bank->gpio_chip, irq_data->hwirq);
>   }
>   

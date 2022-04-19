Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD369506C96
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 14:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346265AbiDSMkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 08:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245732AbiDSMkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 08:40:02 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54ED1573B
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 05:37:18 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23J94c6C011392;
        Tue, 19 Apr 2022 14:36:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NfBteY8OBaElO6y4VePd4S6y0BDjpnAtG+IBajaDGrw=;
 b=fh8KGt3tQex9C9tSv9HhXX+X6zSCoM2QDDLFJPzFjULHzQa/pXtig7YUl8NXBmIBIDIS
 omjkmFmsyGsH/fh/8n0U6z3perVUasFSFCVwx2r4bCjSqBWjkgwCSzQf+YYjTgNrV3rG
 SrnJxpdPDPy7bedgqLCFbJTst9cRUaB8Xn7668MzFVl9ZS0eVt8KbaIhhMdAaWs5oIK2
 8jkhXI7Sod7IJs0djYoqPobdnqpmFO2zhVEEPreE6LwpKuOLxJIDITRFldJe5T2/zni9
 lrPX1qbi9lMQ5uOL5bbte6vXAeL50+/xOETXURJ0o//lMK78ZA5BKBcei6yKmNk+tLZH aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqdp60b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 19 Apr 2022 14:36:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5902E10002A;
        Tue, 19 Apr 2022 14:36:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 842CF20FCB9;
        Tue, 19 Apr 2022 14:36:47 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 14:36:47 +0200
Message-ID: <316ce7c7-2a8b-7854-8ea1-3cbe588eb605@foss.st.com>
Date:   Tue, 19 Apr 2022 14:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH] irqchip/stm32: Retrigger hierarchy for LEVEL
 triggered IRQs in tasklet
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-gpio@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220415215550.498381-1-marex@denx.de>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220415215550.498381-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek

On 4/15/22 23:55, Marek Vasut wrote:
> The current EOI handler for LEVEL triggered interrupts calls clk_enable(),
> register IO, clk_disable(). The clock manipulation requires locking which
> happens with IRQs disabled in clk_enable_lock(). Move the LEVEL IRQ test
> and retrigger into dedicated tasklet and schedule the tasklet every time
> a LEVEL IRQ triggers. This makes EOI fast for majority of IRQs on this
> platform again, since those are edge triggered IRQs, and LEVEL triggered
> IRQs are the exception.
> 
> This also fixes the following splat found when using preempt-rt:
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

Internally we are changing things about clocking in stm32 pinctrl 
driver. Fabien will give more details than me, but the idea is to clock 
one times all banks during probe. It is done mainily to improve 
performances during GPIO toggling and it will fix also the issue you report.

Alex

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-gpio@vger.kernel.org
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 55 +++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 242d1c37c6e4b..f4287fc18cf9a 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -10,6 +10,7 @@
>   #include <linux/gpio/driver.h>
>   #include <linux/hwspinlock.h>
>   #include <linux/io.h>
> +#include <linux/interrupt.h>
>   #include <linux/irq.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
> @@ -95,6 +96,7 @@ struct stm32_gpio_bank {
>   	u32 bank_ioport_nr;
>   	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
>   	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
> +	struct tasklet_struct tasklet;
>   };
>   
>   struct stm32_pinctrl {
> @@ -307,20 +309,43 @@ static const struct gpio_chip stm32_gpio_template = {
>   	.set_config		= gpiochip_generic_config,
>   };
>   
> +static void stm32_gpio_irq_tasklet(struct tasklet_struct *t)
> +{
> +	struct stm32_gpio_bank *bank = from_tasklet(bank, t, tasklet);
> +	struct irq_desc *desc;
> +	struct irq_data *data;
> +	int irq, pin, level;
> +
> +	/* Retrigger all LEVEL triggered pins which are still asserted. */
> +	for (pin = 0; pin < STM32_GPIO_PINS_PER_BANK; pin++) {
> +		if (!(bank->irq_type[pin] & IRQ_TYPE_LEVEL_MASK))
> +			continue;
> +
> +		level = stm32_gpio_get(&bank->gpio_chip, pin);
> +		if ((level == 0 && bank->irq_type[pin] == IRQ_TYPE_LEVEL_LOW) ||
> +		    (level == 1 && bank->irq_type[pin] == IRQ_TYPE_LEVEL_HIGH)) {
> +			irq = irq_find_mapping(bank->domain, pin);
> +
> +			desc = irq_to_desc(irq);
> +			if (!desc)
> +				continue;
> +
> +			data = irq_desc_get_irq_data(desc);
> +			if (!data)
> +				continue;
> +
> +			irq_chip_retrigger_hierarchy(data);
> +		}
> +	}
> +}
> +
>   static void stm32_gpio_irq_trigger(struct irq_data *d)
>   {
>   	struct stm32_gpio_bank *bank = d->domain->host_data;
> -	int level;
> -
> -	/* Do not access the GPIO if this is not LEVEL triggered IRQ. */
> -	if (!(bank->irq_type[d->hwirq] & IRQ_TYPE_LEVEL_MASK))
> -		return;
>   
> -	/* If level interrupt type then retrig */
> -	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
> -	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
> -	    (level == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
> -		irq_chip_retrigger_hierarchy(d);
> +	/* If this is LEVEL triggered interrupt, retrigger in tasklet. */
> +	if (bank->irq_type[d->hwirq] & IRQ_TYPE_LEVEL_MASK)
> +		tasklet_schedule(&bank->tasklet);
>   }
>   
>   static void stm32_gpio_irq_eoi(struct irq_data *d)
> @@ -450,6 +475,8 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
>   	unsigned long flags;
>   	int ret = 0;
>   
> +	tasklet_setup(&bank->tasklet, stm32_gpio_irq_tasklet);
> +
>   	/*
>   	 * Check first that the IRQ MUX of that line is free.
>   	 * gpio irq mux is shared between several banks, protect with a lock
> @@ -475,7 +502,11 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
>   	irq_domain_set_hwirq_and_chip(d, virq, hwirq, &stm32_gpio_irq_chip,
>   				      bank);
>   
> -	return irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
> +	ret = irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
> +	if (ret)
> +		tasklet_kill(&bank->tasklet);
> +
> +	return ret;
>   }
>   
>   static void stm32_gpio_domain_free(struct irq_domain *d, unsigned int virq,
> @@ -486,6 +517,8 @@ static void stm32_gpio_domain_free(struct irq_domain *d, unsigned int virq,
>   	struct irq_data *irq_data = irq_domain_get_irq_data(d, virq);
>   	unsigned long flags, hwirq = irq_data->hwirq;
>   
> +	tasklet_kill(&bank->tasklet);
> +
>   	irq_domain_free_irqs_common(d, virq, nr_irqs);
>   
>   	spin_lock_irqsave(&pctl->irqmux_lock, flags);


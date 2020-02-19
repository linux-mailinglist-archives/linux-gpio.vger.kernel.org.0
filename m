Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4AD16436F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgBSLeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:34:01 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23656 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726270AbgBSLeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:34:01 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01JBO4UN023951;
        Wed, 19 Feb 2020 12:33:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=7rGcCAIJ1owBgJnQqs9fghPribnH6MLQt7KvBtj4rlU=;
 b=beCCWjxbEgVdPTO/oTEiGoMJE2z1U7oqaAWze4ZQJ3BM6EXShjbWtD8h1a6ACcpNmJl9
 8hBbCDobb3eS8gKl2gD254uN1rDjiWOy7ZBh8V9vyzEXPlptxniqr1V3vAhJ6OP96y7B
 Yh3/trpblCtyDZiwcyxoo73F8pUv6YWIRPv7rN+hQYekkGgGJV7XYPxf8SpcQlr9C3Iy
 yHRue8YPJR1mS4nE2C7F+1htjGZhL4g6oJWVU5LcZhQAJSWYGCpLsoNi/T8mZqGPmavQ
 LaabaXCIyf+LJj+Othr1isoNkOiJxoG1grSgZ7qJGDvnoqyarPL1Yn4DZ8usjLAoOIAz PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub5jrch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 12:33:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B0E4100034;
        Wed, 19 Feb 2020 12:33:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88A4D2B2DE2;
        Wed, 19 Feb 2020 12:33:32 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 12:33:31 +0100
Subject: Re: [PATCH v2 1/2] irqchip/stm32: Add irq retrigger support
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <marex@denx.de>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-2-alexandre.torgue@st.com>
Message-ID: <16d27f75-8157-7a92-ae61-b5b3ab05bdd9@st.com>
Date:   Wed, 19 Feb 2020 12:33:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218131218.10789-2-alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_03:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix Marc email address

On 2/18/20 2:12 PM, Alexandre Torgue wrote:
> This commit introduces retrigger support for stm32_ext_h chip.
> It consists to rise the GIC interrupt mapped to an EXTI line.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> index e00f2fa27f00..c971d115edb4 100644
> --- a/drivers/irqchip/irq-stm32-exti.c
> +++ b/drivers/irqchip/irq-stm32-exti.c
> @@ -604,12 +604,24 @@ static void stm32_exti_h_syscore_deinit(void)
>   	unregister_syscore_ops(&stm32_exti_h_syscore_ops);
>   }
>   
> +static int stm32_exti_h_retrigger(struct irq_data *d)
> +{
> +	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
> +	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
> +	void __iomem *base = chip_data->host_data->base;
> +	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
> +
> +	writel_relaxed(mask, base + stm32_bank->swier_ofst);
> +
> +	return irq_chip_retrigger_hierarchy(d);
> +}
> +
>   static struct irq_chip stm32_exti_h_chip = {
>   	.name			= "stm32-exti-h",
>   	.irq_eoi		= stm32_exti_h_eoi,
>   	.irq_mask		= stm32_exti_h_mask,
>   	.irq_unmask		= stm32_exti_h_unmask,
> -	.irq_retrigger		= irq_chip_retrigger_hierarchy,
> +	.irq_retrigger		= stm32_exti_h_retrigger,
>   	.irq_set_type		= stm32_exti_h_set_type,
>   	.irq_set_wake		= stm32_exti_h_set_wake,
>   	.flags			= IRQCHIP_MASK_ON_SUSPEND,
> 

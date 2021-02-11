Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E3C319214
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 19:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBKSSK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 13:18:10 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40696 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbhBKSQO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 13:16:14 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BIEuQg089910;
        Thu, 11 Feb 2021 12:14:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1613067296;
        bh=Xz229qIcE38srOs1TPZ0TAU7LwMq0Gf4DOp8pxqP/0M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BOpP4XF72GE4yZiJpYV/JQGjJuNl3HBP1prXgoOjY/5WiMNxC4h8vFrL98DPv7Jsk
         tGJ3y1GB5j/KIdRSt8SsGWvd71f81VCuJiD5VmlwYlADEXBZiM1one+I1goBOXSIWa
         honeEeoGr5qkBsyqOQ8O7jB+ldxwO1pv2Y+oyPKE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BIEuPH029974
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 11 Feb 2021 12:14:56 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 12:14:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 12:14:55 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BIEqVu098270;
        Thu, 11 Feb 2021 12:14:53 -0600
Subject: Re: [PATCH for next v1 1/2] gpio: omap: Replace raw_spin_lock_irqsave
 with raw_spin_lock in omap_gpio_irq_handler()
To:     Luo Jiaxing <luojiaxing@huawei.com>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <ssantosh@kernel.org>, <khilman@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
Date:   Thu, 11 Feb 2021 20:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 08/02/2021 10:56, Luo Jiaxing wrote:
> There is no need to use API with _irqsave in omap_gpio_irq_handler(),
> because it already be in a irq-disabled context.
> 
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
> ---
>   drivers/gpio/gpio-omap.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 41952bb..dc8bbf4 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -560,8 +560,6 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
>   	u32 enabled, isr, edge;
>   	unsigned int bit;
>   	struct gpio_bank *bank = gpiobank;
> -	unsigned long wa_lock_flags;
> -	unsigned long lock_flags;
>   
>   	isr_reg = bank->base + bank->regs->irqstatus;
>   	if (WARN_ON(!isr_reg))
> @@ -572,7 +570,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
>   		return IRQ_NONE;
>   
>   	while (1) {
> -		raw_spin_lock_irqsave(&bank->lock, lock_flags);
> +		raw_spin_lock(&bank->lock);
>   
>   		enabled = omap_get_gpio_irqbank_mask(bank);
>   		isr = readl_relaxed(isr_reg) & enabled;
> @@ -586,7 +584,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
>   		if (edge)
>   			omap_clear_gpio_irqbank(bank, edge);
>   
> -		raw_spin_unlock_irqrestore(&bank->lock, lock_flags);
> +		raw_spin_unlock(&bank->lock);
>   
>   		if (!isr)
>   			break;
> @@ -595,7 +593,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
>   			bit = __ffs(isr);
>   			isr &= ~(BIT(bit));
>   
> -			raw_spin_lock_irqsave(&bank->lock, lock_flags);
> +			raw_spin_lock(&bank->lock);
>   			/*
>   			 * Some chips can't respond to both rising and falling
>   			 * at the same time.  If this irq was requested with
> @@ -606,15 +604,14 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
>   			if (bank->toggle_mask & (BIT(bit)))
>   				omap_toggle_gpio_edge_triggering(bank, bit);
>   
> -			raw_spin_unlock_irqrestore(&bank->lock, lock_flags);
> +			raw_spin_unlock(&bank->lock);
>   
> -			raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
> +			raw_spin_lock(&bank->wa_lock);
>   
>   			generic_handle_irq(irq_find_mapping(bank->chip.irq.domain,
>   							    bit));
>   
> -			raw_spin_unlock_irqrestore(&bank->wa_lock,
> -						   wa_lock_flags);
> +			raw_spin_unlock(&bank->wa_lock);
>   		}
>   	}
>   exit:
> 

NACK.
Who said that this is always hard IRQ handler?
What about RT-kernel or boot with "threadirqs"?

-- 
Best regards,
grygorii

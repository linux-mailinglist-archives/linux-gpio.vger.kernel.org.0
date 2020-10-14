Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AA928D780
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 02:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389697AbgJNAcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 20:32:04 -0400
Received: from regular1.263xmail.com ([211.150.70.203]:56806 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389588AbgJNAcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 20:32:04 -0400
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 69FCE7EA;
        Wed, 14 Oct 2020 08:24:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2981T139638740072192S1602635057545293_;
        Wed, 14 Oct 2020 08:24:18 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <271a6af95fa33b0f5f2f69fd55157ebe>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-rockchip@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v3_3/3=5d_pinctrl=3a_rockchip=3a_create_ir?=
 =?UTF-8?B?cSBtYXBwaW5nIGluIGdwaW9fdG9faXJx44CQ6K+35rOo5oSP77yM6YKu5Lu255Sx?=
 =?UTF-8?Q?linux-rockchip-bounces+kever=2eyang=3drock-chips=2ecom=40lists=2e?=
 =?UTF-8?B?aW5mcmFkZWFkLm9yZ+S7o+WPkeOAkQ==?=
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
 <20201013063731.3618-4-jay.xu@rock-chips.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <bf5880ec-8222-74e8-2d15-d9998e0149df@rock-chips.com>
Date:   Wed, 14 Oct 2020 08:24:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013063731.3618-4-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/10/13 下午2:37, Jianqun Xu wrote:
> Remove totally irq mappings create in probe, the gpio irq mapping will
> be created when do
>      gpio_to_irq ->
>          rockchip_gpio_to_irq ->
>              irq_create_mapping
>
> This patch can speed up system boot on, also abandon many unused irq
> mappings' create.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>   drivers/pinctrl/pinctrl-rockchip.c | 28 ++++++++++++----------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index a2f361aa6d05..70dc03af5699 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3198,7 +3198,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
>   
>   		irq = __ffs(pend);
>   		pend &= ~BIT(irq);
> -		virq = irq_linear_revmap(bank->domain, irq);
> +		virq = irq_find_mapping(bank->domain, irq);
>   
>   		if (!virq) {
>   			dev_err(bank->drvdata->dev, "unmapped irq %d\n", irq);
> @@ -3377,7 +3377,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>   	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
>   	struct irq_chip_generic *gc;
>   	int ret;
> -	int i, j;
> +	int i;
>   
>   	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
>   		if (!bank->valid) {
> @@ -3404,7 +3404,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>   
>   		ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
>   					 "rockchip_gpio_irq", handle_level_irq,
> -					 clr, 0, IRQ_GC_INIT_MASK_CACHE);
> +					 clr, 0, 0);
>   		if (ret) {
>   			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
>   				bank->name);
> @@ -3413,14 +3413,6 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>   			continue;
>   		}
>   
> -		/*
> -		 * Linux assumes that all interrupts start out disabled/masked.
> -		 * Our driver only uses the concept of masked and always keeps
> -		 * things enabled, so for us that's all masked and all enabled.
> -		 */
> -		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
> -		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
> -
>   		gc = irq_get_domain_generic_chip(bank->domain, 0);
>   		gc->reg_base = bank->reg_base;
>   		gc->private = bank;
> @@ -3437,13 +3429,17 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>   		gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
>   		gc->wake_enabled = IRQ_MSK(bank->nr_pins);
>   
> +		/*
> +		 * Linux assumes that all interrupts start out disabled/masked.
> +		 * Our driver only uses the concept of masked and always keeps
> +		 * things enabled, so for us that's all masked and all enabled.
> +		 */
> +		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
> +		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
> +		gc->mask_cache = 0xffffffff;
> +
>   		irq_set_chained_handler_and_data(bank->irq,
>   						 rockchip_irq_demux, bank);
> -
> -		/* map the gpio irqs here, when the clock is still running */
> -		for (j = 0 ; j < 32 ; j++)
> -			irq_create_mapping(bank->domain, j);
> -
>   		clk_disable(bank->clk);
>   	}
>   

Looks good to me,

Reviewed-by: Kever Yang<kever.yang@rock-chips.com>

Thanks,
- Kever




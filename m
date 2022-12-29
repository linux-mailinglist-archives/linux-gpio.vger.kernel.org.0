Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD86588C3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 03:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiL2C5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 21:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiL2C5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 21:57:15 -0500
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98C1AE46;
        Wed, 28 Dec 2022 18:57:13 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VYJa5Wa_1672282629;
Received: from 30.236.46.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VYJa5Wa_1672282629)
          by smtp.aliyun-inc.com;
          Thu, 29 Dec 2022 10:57:10 +0800
Message-ID: <2f67f507-806b-d7d0-ed69-077f5c59f0ff@linux.alibaba.com>
Date:   Thu, 29 Dec 2022 10:57:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V3 2/3] gpio: gpio-pmic-eic-sprd: Make the irqchip
 immutable
To:     Cixi Geng <cixi.geng@linux.dev>, linus.walleij@linaro.org,
        brgl@bgdev.pl, orsonzhai@gmail.com, zhang.lyra@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        cixi.geng1@unisoc.com
References: <20221228122442.392504-1-cixi.geng@linux.dev>
 <20221228122442.392504-3-cixi.geng@linux.dev>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20221228122442.392504-3-cixi.geng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-11.0 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12/28/2022 8:24 PM, Cixi Geng wrote:
> From: Cixi Geng <cixi.geng1@unisoc.com>
> 
> Remove the irq_chip from pmic_eic structure,
> use the various calls by defining the statically
> irq_chip structure.
> 
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> ---
>   drivers/gpio/gpio-pmic-eic-sprd.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
> index e518490c4b68..add15416f7a6 100644
> --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> @@ -47,7 +47,6 @@ enum {
>   /**
>    * struct sprd_pmic_eic - PMIC EIC controller
>    * @chip: the gpio_chip structure.
> - * @intc: the irq_chip structure.
>    * @map:  the regmap from the parent device.
>    * @offset: the EIC controller's offset address of the PMIC.
>    * @reg: the array to cache the EIC registers.
> @@ -56,7 +55,6 @@ enum {
>    */
>   struct sprd_pmic_eic {
>   	struct gpio_chip chip;
> -	struct irq_chip intc;
>   	struct regmap *map;
>   	u32 offset;
>   	u8 reg[CACHE_NR_REGS];
> @@ -151,15 +149,21 @@ static void sprd_pmic_eic_irq_mask(struct irq_data *data)
>   {
>   	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
>   	struct sprd_pmic_eic *pmic_eic = gpiochip_get_data(chip);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(data);

Please keep the same coding style in this driver:
u32 offset = irqd_to_hwirq(data);

>   
>   	pmic_eic->reg[REG_IE] = 0;
>   	pmic_eic->reg[REG_TRIG] = 0;
> +
> +	gpiochip_disable_irq(chip, hwirq);
>   }
>   
>   static void sprd_pmic_eic_irq_unmask(struct irq_data *data)
>   {
>   	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
>   	struct sprd_pmic_eic *pmic_eic = gpiochip_get_data(chip);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(data);

Ditto

> +
> +	gpiochip_enable_irq(chip, hwirq);
>   
>   	pmic_eic->reg[REG_IE] = 1;
>   	pmic_eic->reg[REG_TRIG] = 1;
> @@ -292,6 +296,17 @@ static irqreturn_t sprd_pmic_eic_irq_handler(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
>   
> +static const struct irq_chip pmic_eic_irq_chip = {
> +	.name			= "sprd-pmic-eic-gpio",

Should be 'sprd-pmic-eic'.

With above fixes, you can add
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> +	.irq_mask		= sprd_pmic_eic_irq_mask,
> +	.irq_unmask		= sprd_pmic_eic_irq_unmask,
> +	.irq_set_type		= sprd_pmic_eic_irq_set_type,
> +	.irq_bus_lock		= sprd_pmic_eic_bus_lock,
> +	.irq_bus_sync_unlock	= sprd_pmic_eic_bus_sync_unlock,
> +	.flags			= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>   static int sprd_pmic_eic_probe(struct platform_device *pdev)
>   {
>   	struct gpio_irq_chip *irq;
> @@ -338,16 +353,8 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
>   	pmic_eic->chip.set = sprd_pmic_eic_set;
>   	pmic_eic->chip.get = sprd_pmic_eic_get;
>   
> -	pmic_eic->intc.name = dev_name(&pdev->dev);
> -	pmic_eic->intc.irq_mask = sprd_pmic_eic_irq_mask;
> -	pmic_eic->intc.irq_unmask = sprd_pmic_eic_irq_unmask;
> -	pmic_eic->intc.irq_set_type = sprd_pmic_eic_irq_set_type;
> -	pmic_eic->intc.irq_bus_lock = sprd_pmic_eic_bus_lock;
> -	pmic_eic->intc.irq_bus_sync_unlock = sprd_pmic_eic_bus_sync_unlock;
> -	pmic_eic->intc.flags = IRQCHIP_SKIP_SET_WAKE;
> -
>   	irq = &pmic_eic->chip.irq;
> -	irq->chip = &pmic_eic->intc;
> +	gpio_irq_chip_set_chip(irq, &pmic_eic_irq_chip);
>   	irq->threaded = true;
>   
>   	ret = devm_gpiochip_add_data(&pdev->dev, &pmic_eic->chip, pmic_eic);

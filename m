Return-Path: <linux-gpio+bounces-14017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6DF9F7B93
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 13:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390C2166F60
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 12:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4D0224AE6;
	Thu, 19 Dec 2024 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lhOXkBE/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D5224AE2;
	Thu, 19 Dec 2024 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611914; cv=none; b=I9fd6/mjB9MAJd3ub4pm3gc2pLem11yBRevWcsDhva7LuJxcQGQENKRJdFipEbJHxLH7C+EU97qQHcIjvLlRhLlWaplgfJquB6gnOFubKTCW0A4QF+TMFJR8lamLjvzGVOJguMbB1BKQzkTiMJ36FVE3P2/PaQ5dJlX8IBnTTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611914; c=relaxed/simple;
	bh=JcTvzwqzO8ifnuyTNranwmH9nnJnbF13/yWqfn5eIks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHMkDUNYMq12waLz4orZa2Fx7ZSPNu0McI2C2M+hKCR2aP5H1kc4y1Vv2yYSXZFS/s0CizVOJKvvu5pV1dYZIOTzS2ed9D6Z62BZUh8a3rf3pWMMq+7Zmlw4XhfBilH5IWAKRAcYoP86N4TC6y805XsHy248QzkewD7vjtpKKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lhOXkBE/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734611909;
	bh=JcTvzwqzO8ifnuyTNranwmH9nnJnbF13/yWqfn5eIks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lhOXkBE/NASnpRLhmN68ej06vA+3DcnFT6ar3qXCmreq5VsR0UXbBY6YYAMuFI0SJ
	 gSZePuAb03WGQXsCBC9dDywhYeP+OtetDRWAHxElzE/Ea8OYbShtxd3UtZlTqgEDOg
	 xsEJP9XJYdq3UYihu/OFvTUkNaPc91IjUwfBjqkMQT7M8ZsIm0MGkKcqCU5u/eq1Th
	 2N1J9WCm3/sFGfmmg2Zdb2dMiHkPVADj3+J0WmN9fn9s9ienEl6IHxwckoqxw0gPHs
	 elb9ITI2DyN+xRGEy19ZC57+YEc1XiB8MEusE6SbxdTkgiiBbshrFhqVqzyKyMRApw
	 L5h5MF19YS9cw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 115A317E36AD;
	Thu, 19 Dec 2024 13:38:29 +0100 (CET)
Message-ID: <6695e77d-da46-45ed-9304-020f6da24582@collabora.com>
Date: Thu, 19 Dec 2024 13:38:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/12/24 14:12, chang hao ha scritto:
> From: Chhao Chang <ot_chhao.chang@mediatek.com>
> 
> Change 1: change EINT from 1 address to 5 addresses,
> Eint number is stored on each base.
> Change 2: Compatible with 1 address design
> 
> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>

Have you tested this change on other MediaTek SoCs?

Which ones?

I know that you didn't, because you're breaking them. Next time, please do.

> ---
>   drivers/pinctrl/mediatek/mtk-eint.c           | 943 ++++++++++++++----
>   drivers/pinctrl/mediatek/mtk-eint.h           |  87 +-
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  50 +-
>   3 files changed, 843 insertions(+), 237 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 27f0a54e12bf..f7788166c335 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -1,21 +1,24 @@
>   // SPDX-License-Identifier: GPL-2.0
> -// Copyright (c) 2014-2018 MediaTek Inc.
> -
> +// Copyright (c) 2014-2024 MediaTek Inc.
>   /*
>    * Library for MediaTek External Interrupt Support
>    *
>    * Author: Maoguang Meng <maoguang.meng@mediatek.com>
> - *	   Sean Wang <sean.wang@mediatek.com>
> - *
> + * Sean Wang <sean.wang@mediatek.com>
> + * Chhao Chang <ot_chhao.chang@mediatek.com>
>    */
>   
> +#include <linux/atomic.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/io.h>
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/irqdomain.h>
> +#include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
>   

..snip..

> @@ -423,24 +599,42 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>   	int virq, eint_offset;
>   	unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
>   		     dbnc;
> +	static const unsigned int debounce_time[] = { 156, 313, 625, 1250,
> +		20000, 40000, 80000, 160000, 320000, 640000 };

I told you already in an older review.

Every SoC has its own debounce time, and this will break all currently
supported MediaTek SoCs.

>   	struct irq_data *d;
> +	unsigned int instance, index;
> +	void __iomem *reg;
> +
> +	/*
> +	 * Due to different number of bit field, we only decode
> +	 * the coordinate here, instead of get the VA.
> +	 */
> +	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
> +				  &instance, &index);
>   
> -	if (!eint->hw->db_time)
> -		return -EOPNOTSUPP;
> +	if (!reg) {
> +		dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +			__func__, eint_num);
> +		return 0;
> +	}
>   
>   	virq = irq_find_mapping(eint->domain, eint_num);
> -	eint_offset = (eint_num % 4) * 8;
> +	eint_offset = (index % 4) * 8;
>   	d = irq_get_irq_data(virq);
>   
> -	set_offset = (eint_num / 4) * 4 + eint->regs->dbnc_set;
> -	clr_offset = (eint_num / 4) * 4 + eint->regs->dbnc_clr;
> +	reg = eint->instances[instance].base;
> +	set_offset = (index / 4) * 4 + eint->comp->regs->dbnc_set;
> +	clr_offset = (index / 4) * 4 + eint->comp->regs->dbnc_clr;
>   
>   	if (!mtk_eint_can_en_debounce(eint, eint_num))
>   		return -EINVAL;
>   
> -	dbnc = eint->num_db_time;
> -	for (i = 0; i < eint->num_db_time; i++) {
> -		if (debounce <= eint->hw->db_time[i]) {
> +	/*
> +	 * Check eint number to avoid access out-of-range
> +	 */
> +	dbnc = ARRAY_SIZE(debounce_time) - 1;
> +	for (i = 0; i < ARRAY_SIZE(debounce_time); i++) {
> +		if (debounce <= debounce_time[i]) {
>   			dbnc = i;
>   			break;
>   		}
> @@ -454,18 +648,16 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>   	}
>   
>   	clr_bit = 0xff << eint_offset;
> -	writel(clr_bit, eint->base + clr_offset);
> +	writel(clr_bit, reg + clr_offset);
>   
> -	bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS) | MTK_EINT_DBNC_SET_EN) <<
> -		eint_offset;
> +	bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS)
> +		| MTK_EINT_DBNC_SET_EN) << eint_offset;
>   	rst = MTK_EINT_DBNC_RST_BIT << eint_offset;
> -	writel(rst | bit, eint->base + set_offset);
> +	writel(rst | bit, reg + set_offset);
> +
> +	/* Delay should be (8T @ 32k) from dbc rst to work correctly. */
> +	udelay(250);
>   
> -	/*
> -	 * Delay a while (more than 2T) to wait for hw debounce counter reset
> -	 * work correctly.
> -	 */
> -	udelay(1);
>   	if (unmask == 1)
>   		mtk_eint_unmask(d);
>   
> @@ -473,6 +665,53 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
>   
> +static unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
> +				      unsigned int eint_num)
> +{
> +	unsigned int instance, index, bit;
> +	void __iomem *reg;
> +
> +	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
> +				  &instance, &index);
> +
> +	if (!reg) {
> +		dev_err(eint->dev, "%s invalid eint_num %d\n",
> +			__func__, eint_num);
> +		return 0;
> +	}
> +
> +	reg = eint->instances[instance].base +
> +		(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
> +
> +	bit = MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
> +
> +	return (readl(reg) & bit) ? 1 : 0;
> +}
> +
> +static unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
> +					 unsigned int eint_num)
> +{
> +	unsigned int instance, index, mask, offset;
> +	void __iomem *reg;
> +
> +	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
> +				  &instance, &index);
> +
> +	if (!reg) {
> +		dev_err(eint->dev, "%s invalid eint_num %d\n",
> +			__func__, eint_num);
> +		return 0;
> +	}
> +
> +	reg = eint->instances[instance].base +
> +		(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
> +
> +	offset = MTK_EINT_DBNC_SET_DBNC_BITS + ((index % 4) * 8);
> +	mask = 0xf << offset;
> +
> +	return ((readl(reg) & mask) >> offset);
> +}
> +
>   int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   {
>   	int irq;
> @@ -485,44 +724,349 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   
> +/*
> + * Dump the properties/states of the specific EINT pin.
> + * @eint_num: the global EINT number.
> + * @buf: the pointer of a string buffer.
> + * @buf_size: the size of the buffer.
> + *
> + * If the return value < 0, it means that the @eint_num is invalid;
> + * Otherwise, return 0;
> + */
> +int dump_eint_pin_status(unsigned int eint_num, char *buf, unsigned int buf_size)
> +{
> +	unsigned int len = 0, enabled, stat, raw_stat, soft, mask, sens, pol,
> +		     deb_en, deb_val;
> +
> +	if (eint_num < 0 || eint_num >= global_eintc->total_pin_number)
> +		return -ENODEV;
> +
> +	enabled = global_eintc->pins[eint_num].enabled;
> +	stat = mtk_eint_get_stat(global_eintc, eint_num);
> +	raw_stat = mtk_eint_get_raw_stat(global_eintc, eint_num);
> +	soft = mtk_eint_get_soft(global_eintc, eint_num);
> +	mask = mtk_eint_get_mask(global_eintc, eint_num);
> +	sens = mtk_eint_get_sens(global_eintc, eint_num);
> +	pol = mtk_eint_get_pol(global_eintc, eint_num);
> +
> +	len += snprintf(buf + len, buf_size - len,
> +			"%s=%u(%s)\n%s=%s_%s\n%s=%u\n%s=%u\n%s=%u\n%s=%u\n",
> +			"Pin", eint_num, enabled ? "enabled" : "disabled",
> +			"Type", (sens == 1) ? "level" : "edge",
> +			(pol == 1) ? "high" : "low",
> +			"Pending", stat,
> +			"Raw", raw_stat,
> +			"Soft", soft,
> +			"Mask", mask);
> +
> +	if (mtk_eint_can_en_debounce(global_eintc, eint_num)) {
> +		deb_en	= mtk_eint_get_debounce_en(global_eintc, eint_num);
> +		deb_val = mtk_eint_get_debounce_value(global_eintc, eint_num);
> +
> +		len += snprintf(buf + len, buf_size - len,
> +				"Support debounce, %s=%u, %s=%u\n",
> +				"enable", deb_en,
> +				"setting", deb_val);
> +	} else {
> +		len += snprintf(buf + len, buf_size - len,
> +				"Not support debounce\n");
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dump_eint_pin_status);

Why do you need to export this function?

> +
> +static ssize_t eintc_status_show(struct device_driver *driver, char *buf)
> +{
> +	struct mtk_eint *eint = global_eintc;
> +	unsigned int i, j, len = 0,
> +		     instance_num = eint->instance_number;
> +
> +	len += snprintf(buf + len, PAGE_SIZE - len, "=====EINTC Dump=====\n");
> +
> +	for (i = 0; i < instance_num; i++) {
> +		struct mtk_eint_instance inst = eint->instances[i];
> +
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"Instance %d name=%s with %u pins\n",
> +				i, inst.name, inst.number);
> +
> +		for (j = 0; j < inst.number; j++)
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"%d ", inst.pin_list[j]);
> +
> +		len += snprintf(buf + len, PAGE_SIZE - len, "\n");
> +	}
> +
> +	return strlen(buf);
> +}
> +
> +static DRIVER_ATTR_RO(eintc_status);
> +
> +static ssize_t eint_pin_status_show(struct device_driver *driver, char *buf)
> +{
> +	struct mtk_eint *eint = global_eintc;
> +	unsigned int len = 0;
> +
> +	len += snprintf(buf + len, PAGE_SIZE - len,
> +			"=====EINT Pin Dump=====\n");
> +
> +	dump_eint_pin_status(eint->dump_target_eint,
> +			     buf + len, PAGE_SIZE - len);
> +
> +	return strlen(buf);
> +}
> +
> +static ssize_t eint_pin_status_store(struct device_driver *driver,
> +				     const char *buf, size_t count)
> +{
> +	int eint_num, ret;
> +
> +	ret = kstrtouint(buf, 10, &eint_num);
> +

Controlling pinctrl from userspace? Isn't there a generic facility to do this?

> +	if (ret || eint_num >= global_eintc->total_pin_number) {
> +		dev_err(global_eintc->dev,
> +			"%s invalid input: %s.\n", __func__, buf);
> +		goto err_out;
> +	}
> +
> +	global_eintc->dump_target_eint = (unsigned int)eint_num;
> +
> +err_out:
> +	return count;
> +}
> +
> +static DRIVER_ATTR_RW(eint_pin_status);
> +
> +static const struct mtk_eint_compatible default_compat = {
> +	.regs = &mtk_generic_eint_regs,
> +};
> +
>   int mtk_eint_do_init(struct mtk_eint *eint)
>   {
> -	int i;
> +	int i, virq;
> +	unsigned int ret, size, inst = 0;
>   
> -	/* If clients don't assign a specific regs, let's use generic one */
> -	if (!eint->regs)
> -		eint->regs = &mtk_generic_eint_regs;
> +	eint->instance_number = 1;
> +	eint->total_pin_number = eint->hw->ap_num;
>   
> -	eint->wake_mask = devm_kcalloc(eint->dev, eint->hw->ports,
> -				       sizeof(*eint->wake_mask), GFP_KERNEL);
> -	if (!eint->wake_mask)
> -		return -ENOMEM;
> +	dev_info(eint->dev, "%s read ap_num: %u\n", __func__, eint->hw->ap_num);
>   
> -	eint->cur_mask = devm_kcalloc(eint->dev, eint->hw->ports,
> -				      sizeof(*eint->cur_mask), GFP_KERNEL);
> -	if (!eint->cur_mask)
> +	size = eint->instance_number * sizeof(struct mtk_eint_instance);
> +	eint->instances = devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +	if (!eint->instances)
>   		return -ENOMEM;
>   
> -	eint->dual_edge = devm_kcalloc(eint->dev, eint->hw->ap_num,
> -				       sizeof(int), GFP_KERNEL);
> -	if (!eint->dual_edge)
> +	size = eint->total_pin_number * sizeof(struct mtk_eint_pin);
> +	eint->pins = devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +	if (!eint->pins)
>   		return -ENOMEM;
>   
> +	for (i = 0; i < eint->total_pin_number; i++) {
> +		eint->pins[i].enabled = true;
> +		eint->pins[i].instance = inst;
> +		eint->pins[i].index = i;
> +		eint->pins[i].debounce =  (i < eint->hw->db_cnt) ? 1 : 0;
> +
> +		eint->instances[inst].pin_list[i] = i;
> +		eint->instances[inst].number++;
> +	}
> +
> +	for (i = 0; i < eint->instance_number; i++) {
> +		size = (eint->instances[i].number / 32 + 1) * sizeof(unsigned int);
> +		eint->instances[i].wake_mask =
> +			devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +		eint->instances[i].cur_mask =
> +			devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +
> +		if (!eint->instances[i].wake_mask ||
> +		    !eint->instances[i].cur_mask)
> +			return -ENOMEM;
> +	}
> +
> +	eint->comp = &default_compat;
> +
>   	eint->domain = irq_domain_add_linear(eint->dev->of_node,
> -					     eint->hw->ap_num,
> +					     eint->total_pin_number,
>   					     &irq_domain_simple_ops, NULL);
>   	if (!eint->domain)
>   		return -ENOMEM;
>   
> -	if (eint->hw->db_time) {
> -		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
> -			if (eint->hw->db_time[i] == 0)
> -				break;
> -		eint->num_db_time = i;
> +	eint->instances[inst].base = eint->base;
> +
> +	mtk_eint_hw_init(eint);
> +
> +	for (i = 0; i < eint->total_pin_number; i++) {
> +		virq = irq_create_mapping(eint->domain, i);
> +
> +		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
> +					 handle_level_irq);
> +		irq_set_chip_data(virq, eint);
> +	}
> +
> +	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
> +					 eint);
> +
> +	ret = driver_create_file(eint->dev->driver,
> +				 &driver_attr_eintc_status);
> +
> +	ret |= driver_create_file(eint->dev->driver,
> +				  &driver_attr_eint_pin_status);
> +
> +	if (ret)
> +		dev_err(eint->dev, "%s create sysfs files failed.\n", __func__);
> +
> +	global_eintc = eint;

No global variables please. Makes no sense.

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_eint_do_init);
> +
> +int mtk_eint_do_init_v2(struct mtk_eint *eint)
> +{
> +	int i, matrix_number = 0;
> +	struct device_node *node;
> +	unsigned int ret, size, offset;
> +	unsigned int id, inst, idx, support_deb;
> +
> +	const phandle *ph;
> +
> +#if defined(MTK_EINT_DEBUG)
> +	struct mtk_eint_pin pin;
> +#endif
> +
> +	ph = of_get_property(eint->dev->of_node, "mediatek,eint", NULL);

I'm not really sure that you really need this property, as the eint was declared
inside of the main pinctrl node for the SoC, and I'm mostly sure that you can keep
doing the same with eintv2.

> +	if (!ph) {
> +		dev_err(eint->dev, "Cannot find EINT phandle in PIO node.\n");
> +		return -ENODEV;
> +	}
> +
> +	node = of_find_node_by_phandle(be32_to_cpup(ph));
> +	if (!node) {
> +		dev_err(eint->dev, "Cannot find EINT node by phandle.\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = of_property_read_u32(node, "mediatek,total-pin-number",
> +				   &eint->total_pin_number);

This is not for devicetree.
This is a SoC property and must be specified per-SoC as platform data.

> +	if (ret) {
> +		dev_err(eint->dev, "%s Get total pin Fail.\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(eint->dev, "%s eint total pins:%u.\n",
> +		 __func__, eint->total_pin_number);
> +
> +	ret = of_property_read_u32(node, "mediatek,instance-num",
> +				   &eint->instance_number);
> +	if (ret)
> +		eint->instance_number = 1;

Can one SoC have variable instance numbers? I don't think so.

That goes to platform data.

> +
> +	size = eint->instance_number * sizeof(struct mtk_eint_instance);
> +	eint->instances = devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +	if (!eint->instances)
> +		return -ENOMEM;
> +
> +	size = eint->total_pin_number * sizeof(struct mtk_eint_pin);
> +	eint->pins = devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +	if (!eint->pins)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < eint->instance_number; i++) {
> +		ret = of_property_read_string_index(node, "reg-name", i,
> +						    &(eint->instances[i].name));

That reg-name is not a standard property; besides, you don't need to parse names,
as you can restrict the order in bindings you can just parse by knowing the
number of declared register spaces.

> +		if (ret) {
> +			dev_info(eint->dev,
> +				 "%s cannot read the name of instance %d.\n",
> +				 __func__, i);
> +		}
> +
> +		eint->instances[i].base = of_iomap(node, i);
> +		if (!eint->instances[i].base)
> +			return -ENOMEM;
>   	}
>   
> +	matrix_number = of_property_count_u32_elems(node, "mediatek,pins") / 4;

That's another thing for platform data instead.

> +	if (matrix_number < 0) {
> +		matrix_number = eint->total_pin_number;
> +		dev_info(eint->dev, "%s eint in legacy mode, matrix number is %u.\n",
> +			 __func__, matrix_number);
> +	} else {
> +		dev_info(eint->dev, "%s eint in new mode, matrix number is %u.\n",
> +			 __func__, matrix_number);
> +	}
> +
> +	for (i = 0; i < matrix_number ; i++) {
> +		offset = i * 4;
> +
> +		ret = of_property_read_u32_index(node, "mediatek,pins",
> +						 offset, &id);

Same, that's platform data!

> +		ret |= of_property_read_u32_index(node, "mediatek,pins",
> +						  offset + 1, &inst);
> +		ret |= of_property_read_u32_index(node, "mediatek,pins",
> +						  offset + 2, &idx);
> +		ret |= of_property_read_u32_index(node, "mediatek,pins",
> +						  offset + 3, &support_deb);
> +
> +		/* Legacy chip which no need to give coordinate list */
> +		if (ret) {
> +			id = i;
> +			inst = 0;
> +			idx = i;
> +			support_deb = (i < MTK_EINT_DBNC_MAX) ? 1 : 0;
> +		}
> +
> +		eint->pins[id].enabled = true;
> +		eint->pins[id].instance = inst;
> +		eint->pins[id].index = idx;
> +		eint->pins[id].debounce = support_deb;
> +
> +		eint->instances[inst].pin_list[idx] = id;
> +		eint->instances[inst].number++;
> +
> +#if defined(MTK_EINT_DEBUG)

No. You either use a dev_dbg() or you just avoid this print.

Please remove the MTK_EINT_DEBUG definition entirely.

> +		pin = eint->pins[id];
> +		dev_info(eint->dev,
> +			 "EINT%u in (%u-%u, %u), deb = %u. %u",
> +			 id,
> +			 pin.instance,
> +			 eint->instances[inst].number,
> +			 pin.index,
> +			 pin.debounce,
> +			 eint->instances[pin.instance].pin_list[pin.index]);
> +#endif
> +		BUG_ON(idx >= MAX_PIN);
> +	}
> +
> +	for (i = 0; i < eint->instance_number; i++) {
> +		size = (eint->instances[i].number / 32 + 1) * sizeof(unsigned int);
> +		eint->instances[i].wake_mask =
> +			devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +		eint->instances[i].cur_mask =
> +			devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +
> +		if (!eint->instances[i].wake_mask ||
> +		    !eint->instances[i].cur_mask)
> +			return -ENOMEM;
> +	}
> +
> +	eint->comp = &default_compat;
> +
> +	eint->irq = irq_of_parse_and_map(node, 0);
> +	if (!eint->irq) {
> +		dev_err(eint->dev,
> +			"%s IRQ parse fail.\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	eint->domain = irq_domain_add_linear(eint->dev->of_node,
> +					     eint->total_pin_number,
> +					     &irq_domain_simple_ops, NULL);
> +	if (!eint->domain)
> +		return -ENOMEM;
> +
>   	mtk_eint_hw_init(eint);
> -	for (i = 0; i < eint->hw->ap_num; i++) {
> +	for (i = 0; i < eint->total_pin_number; i++) {
>   		int virq = irq_create_mapping(eint->domain, i);
>   
>   		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
> @@ -533,9 +1077,20 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
>   					 eint);
>   
> +	ret = driver_create_file(eint->dev->driver,
> +				 &driver_attr_eintc_status);
> +
> +	ret |= driver_create_file(eint->dev->driver,
> +				  &driver_attr_eint_pin_status);

ret = driver_create_file...
if (ret)
	return ret;

ret = driver_create_file...
if (ret)
	return ret;

OR'ing return values is never a good idea.

> +
> +	if (ret)
> +		dev_err(eint->dev, "%s create sysfs files failed.\n", __func__);
> +
> +	global_eintc = eint;
> +
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(mtk_eint_do_init);
> +EXPORT_SYMBOL_GPL(mtk_eint_do_init_v2);
>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("MediaTek EINT Driver");
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> index 6139b16cd225..30be50308b44 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -1,16 +1,19 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (C) 2014-2018 MediaTek Inc.
> + * Copyright (C) 2014-2024 MediaTek Inc.
>    *
>    * Author: Maoguang Meng <maoguang.meng@mediatek.com>
> - *	   Sean Wang <sean.wang@mediatek.com>
> - *
> + * Sean Wang <sean.wang@mediatek.com>
> + * Chhao Chang <ot_chhao.chang@mediatek.com>
>    */
>   #ifndef __MTK_EINT_H
>   #define __MTK_EINT_H
>   
>   #include <linux/irqdomain.h>
>   
> +#define MAX_PIN 256
> +//#define MTK_EINT_DEBUG
> +
>   struct mtk_eint_regs {
>   	unsigned int	stat;
>   	unsigned int	ack;
> @@ -30,19 +33,37 @@ struct mtk_eint_regs {
>   	unsigned int	dbnc_ctrl;
>   	unsigned int	dbnc_set;
>   	unsigned int	dbnc_clr;
> +	unsigned int	event;
> +	unsigned int	event_set;
> +	unsigned int	event_clr;
> +	unsigned int	raw_stat;
>   };
>   
> -struct mtk_eint_hw {
> -	u8		port_mask;
> -	u8		ports;
> -	unsigned int	ap_num;
> -	unsigned int	db_cnt;
> -	const unsigned int *db_time;
> +struct mtk_eint_ops {
> +	void (*ack)(struct irq_data *d);
>   };
>   
> -extern const unsigned int debounce_time_mt2701[];
> -extern const unsigned int debounce_time_mt6765[];
> -extern const unsigned int debounce_time_mt6795[];
> +struct mtk_eint_compatible {
> +	struct mtk_eint_ops ops;
> +	const struct mtk_eint_regs *regs;
> +};
> +
> +struct mtk_eint_pin {
> +	bool enabled;
> +	u8 instance;
> +	u8 index;
> +	bool debounce;
> +	bool dual_edge;
> +};
> +
> +struct mtk_eint_instance {
> +	const char *name;
> +	void __iomem *base;
> +	unsigned int number;
> +	u16 pin_list[MAX_PIN];
> +	unsigned int *wake_mask;
> +	unsigned int *cur_mask;
> +};
>   
>   struct mtk_eint;
>   
> @@ -54,33 +75,49 @@ struct mtk_eint_xt {
>   	int (*set_gpio_as_eint)(void *data, unsigned long eint_n);
>   };
>   
> +struct mtk_eint_hw {
> +	u8              port_mask;
> +	u8              ports;
> +	unsigned int    ap_num;
> +	unsigned int    db_cnt;
> +	const unsigned int *db_time;
> +};
> +
> +extern const unsigned int debounce_time_mt2701[];
> +extern const unsigned int debounce_time_mt6765[];
> +extern const unsigned int debounce_time_mt6795[];
> +
>   struct mtk_eint {
>   	struct device *dev;
>   	void __iomem *base;
>   	struct irq_domain *domain;
>   	int irq;
>   
> -	int *dual_edge;
> -	u32 *wake_mask;
> -	u32 *cur_mask;
> -
> -	/* Used to fit into various EINT device */
> +	/* An array to record the coordinate, index by global EINT ID */
> +	struct mtk_eint_pin *pins;
> +	/* An array to record the global EINT ID, index by coordinate */
> +	struct mtk_eint_instance *instances;
> +	unsigned int total_pin_number;
> +	unsigned int instance_number;
> +	unsigned int dump_target_eint;
> +	const struct mtk_eint_compatible *comp;
>   	const struct mtk_eint_hw *hw;
>   	const struct mtk_eint_regs *regs;
> -	u16 num_db_time;
>   
>   	/* Used to fit into various pinctrl device */
>   	void *pctl;
>   	const struct mtk_eint_xt *gpio_xlate;
>   };
>   
> -#if IS_ENABLED(CONFIG_EINT_MTK)
> +#if (IS_ENABLED(CONFIG_EINT_MTK) || IS_ENABLED(CONFIG_DEVICE_MODULES_EINT_MTK))
>   int mtk_eint_do_init(struct mtk_eint *eint);
> +int mtk_eint_do_init_v2(struct mtk_eint *eint);
>   int mtk_eint_do_suspend(struct mtk_eint *eint);
>   int mtk_eint_do_resume(struct mtk_eint *eint);
>   int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
>   			  unsigned int debounce);
>   int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n);
> +int dump_eint_pin_status(unsigned int eint_num, char *buf, unsigned int buf_size);
>   
>   #else
>   static inline int mtk_eint_do_init(struct mtk_eint *eint)
> @@ -88,6 +125,11 @@ static inline int mtk_eint_do_init(struct mtk_eint *eint)
>   	return -EOPNOTSUPP;
>   }
>   
> +static inline int mtk_eint_do_init_v2(struct mtk_eint *eint)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>   static inline int mtk_eint_do_suspend(struct mtk_eint *eint)
>   {
>   	return -EOPNOTSUPP;
> @@ -108,5 +150,10 @@ static inline int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   {
>   	return -EOPNOTSUPP;
>   }
> +
> +static inline int dump_eint_pin_status(unsigned int eint_num)
> +{
> +	return -EOPNOTSUPP;
> +}
>   #endif
>   #endif /* __MTK_EINT_H */
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 54301fbba524..59d5ca2405f3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -375,33 +375,37 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>   	if (!of_property_read_bool(np, "interrupt-controller"))
>   		return -ENODEV;
>   
> -	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
> -	if (!hw->eint)
> -		return -ENOMEM;
> -
> -	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
> -	if (IS_ERR(hw->eint->base)) {
> -		ret = PTR_ERR(hw->eint->base);
> -		goto err_free_eint;
> -	}
> +	if (hw->soc->eint_hw) {
> +		hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
> +		if (!hw->eint)
> +			return -ENOMEM;
> +
> +		hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
> +		if (IS_ERR(hw->eint->base)) {
> +			ret = PTR_ERR(hw->eint->base);
> +			goto err_free_eint;
> +		}
>   
> -	hw->eint->irq = irq_of_parse_and_map(np, 0);
> -	if (!hw->eint->irq) {
> -		ret = -EINVAL;
> -		goto err_free_eint;
> -	}
> +		hw->eint->irq = irq_of_parse_and_map(np, 0);
> +		if (!hw->eint->irq) {
> +			ret = -EINVAL;
> +			goto err_free_eint;
> +		}
>   
> -	if (!hw->soc->eint_hw) {
> -		ret = -ENODEV;
> -		goto err_free_eint;
> -	}
> +		hw->eint->dev = &pdev->dev;
> +		hw->eint->hw = hw->soc->eint_hw;
> +		hw->eint->pctl = hw;
> +		hw->eint->gpio_xlate = &mtk_eint_xt;
> +
> +		return mtk_eint_do_init(hw->eint);
>   
> -	hw->eint->dev = &pdev->dev;
> -	hw->eint->hw = hw->soc->eint_hw;
> -	hw->eint->pctl = hw;
> -	hw->eint->gpio_xlate = &mtk_eint_xt;
> +	} else {
> +		hw->eint->dev = &pdev->dev;
> +		hw->eint->pctl = hw;
> +		hw->eint->gpio_xlate = &mtk_eint_xt;
>   
> -	return mtk_eint_do_init(hw->eint);
> +		return mtk_eint_do_init_v2(hw->eint);
> +	}
>   
>   err_free_eint:
>   	devm_kfree(hw->dev, hw->eint);




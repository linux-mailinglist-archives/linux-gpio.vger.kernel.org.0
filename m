Return-Path: <linux-gpio+bounces-11976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E140C9AEB22
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 17:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE401C23F41
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251B11F5824;
	Thu, 24 Oct 2024 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TH2U124w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1501E0B6F;
	Thu, 24 Oct 2024 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729785307; cv=none; b=OJ574BNAN9ZNyJbDfwjZtiqHjnBVFngj1oSUn2GB1yvvcTOmw7oS5H+ZtC80Orm2h0GFfDoG/tJYq39vMHxQNBSZYUW5VLK16wN5tVq+c2gEwlVdEHlU6Gw83P8MeRHOaPDK4geO1N+OnXVB5qj4sHuC9fQvOCawVUovtnD3esA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729785307; c=relaxed/simple;
	bh=4T2a4+mRhV9NvQBidUmk4rDen6/Uz+l5BXbpJTPNH2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFFCgnO2ZQVK5UrnpgBGMRl3fVcVTjexY17FQQ2t7Lxd6UZ8zNVbq52H+tmqa24CNS6fHB+Kzzcq8Dp7Wn1OIPBG6LThsBW9R9C3nMWfWqvB3ocaGQkOcqfGXJT/KioGPlLIfUW9P5UB8PCU0KdMAJaBuwfJiO9Uu4b7O8JP2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TH2U124w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729785302;
	bh=4T2a4+mRhV9NvQBidUmk4rDen6/Uz+l5BXbpJTPNH2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TH2U124whINBH6S9OU8xY1sdbLbiqpBIQ2run8jUDi4yuikZmiwErQwh2rxeCk6Aa
	 gxTaGdP+Kj5ouHFLXWwZ0A7pf1qcilLze+aH9IksWitLcmThTEG+lKZlEYzFApK6yF
	 cOZfEtzQ15Mx+0Rrx9C3OW1kb5skWgVakJ2QGs4fURkKZItmfYvNmBvZpNIRLo/obQ
	 tSBJ8/K2zXVBqDfAZTM9LQTuCcMYF9QEbc0Ju3RSisS4x8lrJ94e2LljpNJ8fwkW+B
	 G4zbwdhiXR8qRKgA1PHTdyuv1hgquiS1olUT5FSfQggCNV4Gak7wRQtzzIQBhFUuiS
	 kmfgKjeBXQ2/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5413817E3676;
	Thu, 24 Oct 2024 17:55:02 +0200 (CEST)
Message-ID: <127675b8-51c5-4c32-8bd1-ecbed96cdaa0@collabora.com>
Date: Thu, 24 Oct 2024 17:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241024141517.10312-1-ot_chhao.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241024141517.10312-1-ot_chhao.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/10/24 16:15, chang hao ha scritto:
> From: Chhao Chang <ot_chhao.chang@mediatek.com>
> 
> eint is divided from the original base address into base addresses
> in five directions: east, south, west, north, and center.
> Stores a limited number of eint numbers in each direction.
> 
> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c           | 830 +++++++++++++-----
>   drivers/pinctrl/mediatek/mtk-eint.h           |  75 +-
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  50 +-
>   3 files changed, 722 insertions(+), 233 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 27f0a54e12bf..0bb017eb1893 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -17,16 +17,13 @@
>   #include <linux/irqdomain.h>
>   #include <linux/module.h>
>   #include <linux/of_irq.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   
>   #include "mtk-eint.h"
>   
> -#define MTK_EINT_EDGE_SENSITIVE           0
> -#define MTK_EINT_LEVEL_SENSITIVE          1
> -#define MTK_EINT_DBNC_SET_DBNC_BITS	  4
> -#define MTK_EINT_DBNC_MAX		  16
> -#define MTK_EINT_DBNC_RST_BIT		  (0x1 << 1)
> -#define MTK_EINT_DBNC_SET_EN		  (0x1 << 0)
> +static struct mtk_eint *global_eintc;
> +struct mtk_eint_pin pin;

Noupe, don't introduce these globals.

>   
>   static const struct mtk_eint_regs mtk_generic_eint_regs = {
>   	.stat      = 0x000,
> @@ -47,6 +44,10 @@ static const struct mtk_eint_regs mtk_generic_eint_regs = {
>   	.dbnc_ctrl = 0x500,
>   	.dbnc_set  = 0x600,
>   	.dbnc_clr  = 0x700,
> +	.event     = 0x800,
> +	.event_set = 0x840,
> +	.event_clr = 0x880,
> +	.raw_stat  = 0xa00,
>   };
>   
>   const unsigned int debounce_time_mt2701[] = {
> @@ -64,60 +65,145 @@ const unsigned int debounce_time_mt6795[] = {
>   };
>   EXPORT_SYMBOL_GPL(debounce_time_mt6795);
>   
> -static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
> +/*
> + * Return the iomem of specific register ofset and decode the coordinate
> + * (instance, index) from global eint number.
> + * If return NULL, then it must be either out-of-range or do-not-support.
> + */
> +static void __iomem *mtk_eint_get_ofset(struct mtk_eint *eint,

You're replacing this with a typo....

>   					 unsigned int eint_num,
> -					 unsigned int offset)
> +					 unsigned int ofset,

and you're typoing offset on purpose again?! :-\

> +					 unsigned int *instance,
> +					 unsigned int *index)
>   {
> -	unsigned int eint_base = 0;
>   	void __iomem *reg;
>   
> -	if (eint_num >= eint->hw->ap_num)
> -		eint_base = eint->hw->ap_num;
> +	if (eint_num >= eint->total_pin_number ||
> +	    !eint->pins[eint_num].enabled) {
> +		WARN_ON(1);
> +		return NULL;
> +	}
>   
> -	reg = eint->base + offset + ((eint_num - eint_base) / 32) * 4;
> +	*instance = eint->pins[eint_num].instance;
> +	*index = eint->pins[eint_num].index;
> +	reg = eint->instances[*instance].base + ofset + (*index / MAX_BIT * REG_OFSET);
>   
>   	return reg;
>   }
>   
> +/*
> + * Generate helper function to access property register of a dedicate pin.
> + */

...and you don't need this (sorry, ugly!) macro either, as this is only
helping you to create a mass-duplication situation here.

If you need a helper, write *one* function that retrieves the data for you
from a chosen register.

> +#define DEFINE_EINT_GET_FUNCTION(_NAME, _OFSET) \
> +static unsigned int mtk_eint_get_##_NAME(struct mtk_eint *eint, \
> +				   unsigned int eint_num) \
> +{ \
> +	unsigned int instance, index; \
> +	void __iomem *reg = mtk_eint_get_ofset(eint, eint_num, \
> +						_OFSET, \
> +						&instance, &index); \
> +	unsigned int bit = BIT(index & 0x1f);\
> +\
> +	if (!reg) { \
> +		dev_err(eint->dev, "%s invalid eint_num %d\n", \
> +			__func__, eint_num); \
> +		return 0;\
> +	} \
> +\
> +	return !!(readl(reg) & bit); \
> +}
> +
> +DEFINE_EINT_GET_FUNCTION(stat, eint->comp->regs->stat);
> +DEFINE_EINT_GET_FUNCTION(mask, eint->comp->regs->mask);
> +DEFINE_EINT_GET_FUNCTION(sens, eint->comp->regs->sens);
> +DEFINE_EINT_GET_FUNCTION(pol, eint->comp->regs->pol);
> +DEFINE_EINT_GET_FUNCTION(dom_en, eint->comp->regs->dom_en);
> +DEFINE_EINT_GET_FUNCTION(event, eint->comp->regs->event);
> +DEFINE_EINT_GET_FUNCTION(raw_stat, eint->comp->regs->raw_stat);
> +
> +int dump_eint_pin_status(unsigned int eint_num)

I don't think that this is necessary... also because, there's already irq/debugfs.c
for debugging. If you really need debug, hook it to the right APIs.

> +{
> +       unsigned int stat, raw_stat, mask, sens, pol, dom_en, event;
> +
> +       if (eint_num < 0 || eint_num > global_eintc->total_pin_number)
> +               return ENODEV;
> +
> +       stat = mtk_eint_get_stat(global_eintc, eint_num);
> +       raw_stat = mtk_eint_get_raw_stat(global_eintc, eint_num);
> +       mask = mtk_eint_get_mask(global_eintc, eint_num);
> +       sens = mtk_eint_get_sens(global_eintc, eint_num);
> +       pol = mtk_eint_get_pol(global_eintc, eint_num);
> +       dom_en = mtk_eint_get_dom_en(global_eintc, eint_num);
> +       event = mtk_eint_get_event(global_eintc, eint_num);
> +       dev_info(global_eintc->dev, "%s eint_num:%u=stat:%u,raw:%u, \
> +		       mask:%u, sens:%u,pol:%u,dom_en:%u,event:%u\n",
> +		       __func__, eint_num, stat, raw_stat, mask, sens,
> +		       pol, dom_en, event);
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(dump_eint_pin_status);
> +
>   static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
>   					     unsigned int eint_num)
>   {
>   	unsigned int sens;
> -	unsigned int bit = BIT(eint_num % 32);
> -	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
> -						eint->regs->sens);
> +	unsigned int instance, index;
> +	void __iomem *reg = mtk_eint_get_ofset(eint, eint_num,
> +						eint->comp->regs->sens,
> +						&instance, &index);
> +	unsigned int bit = BIT(index & 0x1f);

I'm not sure why you can't use BIT(eint_num % 32) anymore.

Even though your EINT is split in 5, that should be still aligned the same as
the "old" EINT.

> +
> +	if (!reg) {

That won't ever happen, because you're already checking that in callers of
this function, hence this check is redundant, or looks like it is anyway.

> +		dev_err(eint->dev, "%s invalid eint_num %d\n",
> +			__func__, eint_num);
> +		return 0;
> +	}
>   
>   	if (readl(reg) & bit)
>   		sens = MTK_EINT_LEVEL_SENSITIVE;
>   	else
>   		sens = MTK_EINT_EDGE_SENSITIVE;
>   
> -	if (eint_num < eint->hw->db_cnt && sens != MTK_EINT_EDGE_SENSITIVE)
> +	if (eint->pins[eint_num].debounce &&
> +	    sens != MTK_EINT_EDGE_SENSITIVE)
>   		return 1;
>   	else
>   		return 0;
>   }
>   
> -static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
> +static int mtk_eint_flip_edge(struct mtk_eint *eint, int eint_num)

Why are you changing the parameter name from hwirq to eint_num?!

>   {
>   	int start_level, curr_level;
> -	unsigned int reg_offset;
> -	u32 mask = BIT(hwirq & 0x1f);
> -	u32 port = (hwirq >> 5) & eint->hw->port_mask;
> -	void __iomem *reg = eint->base + (port << 2);
> +	unsigned int reg_ofset;
> +	unsigned int instance, index, mask, port;
> +	void __iomem *reg;
>   
> -	curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl, hwirq);
> +	reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +				  &instance, &index);
> +
> +	if (!reg) {
> +		dev_err(eint->dev, "%s invalid eint_num %d\n",
> +			__func__, eint_num);
> +		return 0;
> +	}
> +
> +	mask = BIT(index & 0x1f);
> +	port = index >> REG_GROUP;
> +	reg = eint->instances[instance].base + port * REG_OFSET;
> +


..snip..

> @@ -403,7 +572,20 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
>   
>   int mtk_eint_do_suspend(struct mtk_eint *eint)
>   {
> -	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
> +	unsigned int i, j, port;
> +
> +	for (i = 0; i < eint->instance_number; i++) {
> +		struct mtk_eint_instance inst = eint->instances[i];

Just register five different instances if they really have to be separated,
which I don't believe they do, anyway.

You should really read what mtk_eint_hw is for.

> +
> +		for (j = 0; j < inst.number; j += MAX_BIT) {
> +			port = j >> REG_GROUP;
> +			writel_relaxed(~inst.wake_mask[port],
> +				       inst.base + port*REG_OFSET + eint->comp->regs->mask_set);
> +			writel_relaxed(inst.wake_mask[port],
> +				       inst.base + port*REG_OFSET + eint->comp->regs->mask_clr);
> +		}
> +	}
> +	dsb(sy);
>   
>   	return 0;
>   }

..snip..

> @@ -420,27 +615,45 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
>   int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>   			  unsigned int debounce)
>   {
> -	int virq, eint_offset;
> -	unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
> +	int virq, eint_ofset;
> +	unsigned int set_ofset, bit, clr_bit, clr_ofset, rst, i, unmask,
>   		     dbnc;
> +	static const unsigned int debounce_time[] = { 156, 313, 625, 1250,
> +		20000, 40000, 80000, 160000, 320000, 640000 };

This is another mtk_eint_hw array that you're carelessly hardcoding inside of the
eint driver.

>   	struct irq_data *d;
> +	unsigned int instance, index;
> +	void __iomem *reg;
>   
> -	if (!eint->hw->db_time)
> -		return -EOPNOTSUPP;
> +	/*
> +	 * Due to different number of bit field, we only decode
> +	 * the coordinate here, instead of get the VA.
> +	 */
> +	reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +				  &instance, &index);
> +
> +	if (!reg) {
> +		dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +			__func__, eint_num);
> +		return 0;
> +	}
>   
>   	virq = irq_find_mapping(eint->domain, eint_num);
> -	eint_offset = (eint_num % 4) * 8;
> +	eint_ofset = (index % REG_OFSET) * DB_GROUP;
>   	d = irq_get_irq_data(virq);
>   
> -	set_offset = (eint_num / 4) * 4 + eint->regs->dbnc_set;
> -	clr_offset = (eint_num / 4) * 4 + eint->regs->dbnc_clr;
> +	reg = eint->instances[instance].base;
> +	set_ofset = (index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_set;
> +	clr_ofset = (index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_clr;
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

And here, you carelessly break every other supported MediaTek SoC.

> +	for (i = 0; i < ARRAY_SIZE(debounce_time); i++) {
> +		if (debounce <= debounce_time[i]) {
>   			dbnc = i;
>   			break;
>   		}

..snip..

> +
> +int mtk_eint_do_init_v2(struct mtk_eint *eint)
> +{
> +	int i, virq, matrix_number = 0;
> +	struct device_node *node;
> +	unsigned int ret, size, ofset;
> +	unsigned int id, inst, idx, support_deb;
> +
> +	const phandle *ph;
> +
> +	ph = of_get_property(eint->dev->of_node, "mediatek,eint", NULL);

No, a SoC always has the same eint controller(s), always mapped to the same pins.

This is not something for devicetree - but rather something that was already
resolved in the past, when `struct mtk_eint_hw` was introduced.

You should just look at how this driver works upstream and implement support for
the new EINT in there.... not by copy-pasting something from downstream to upstream
and expecting it to be accepted.

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

eint_hw->ap_num is the same thing as this.

> +	if (ret) {
> +		dev_err(eint->dev,
> +		       "%s cannot read total-pin-number from device node.\n",
> +		       __func__);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(eint->dev, "%s eint total %u pins.\n", __func__,
> +		eint->total_pin_number);
> +
> +	ret = of_property_read_u32(node, "mediatek,instance-num",
> +				   &eint->instance_number);
> +	if (ret)
> +		eint->instance_number = 1; // only 1 instance in legacy chip
> +
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
> +	for (i = 0; i < eint->instance_number; i++) {
> +		ret = of_property_read_string_index(node, "reg-name", i,
> +						    &(eint->instances[i].name));
> +		if (ret) {
> +			dev_info(eint->dev,
> +				 "%s cannot read the name of instance %d.\n",
> +				 __func__, i);
> +		}
> +
> +		eint->instances[i].base = of_iomap(node, i);
> +		if (!eint->instances[i].base)
> +			return -ENOMEM;
> +	}
> +
> +	matrix_number = of_property_count_u32_elems(node, "mediatek,pins") / ARRAY_0;
> +	if (matrix_number < 0) {
> +		matrix_number = eint->total_pin_number;
> +		dev_info(eint->dev, "%s eint in legacy mode, assign the matrix number to %u.\n",
> +			 __func__, matrix_number);
> +	} else
> +		dev_info(eint->dev, "%s eint in new mode, assign the matrix number to %u.\n",
> +			 __func__, matrix_number);
> +
> +	for (i = 0; i < matrix_number; i++) {
> +		ofset = i * REG_OFSET;
> +
> +		ret = of_property_read_u32_index(node, "mediatek,pins",
> +					   ofset, &id);

So basically this means that if a SoC has 200 EINT pins, you'll have 200 values
in devicetree?!

> +		ret |= of_property_read_u32_index(node, "mediatek,pins",
> +					   ofset+FIRST, &inst);
> +		ret |= of_property_read_u32_index(node, "mediatek,pins",
> +					   ofset+SECOND, &idx);
> +		ret |= of_property_read_u32_index(node, "mediatek,pins",
> +					   ofset+THIRD, &support_deb);
> +
> +		/* Legacy chip which no need to give coordinate list */
> +		if (ret) {
> +			id = i;
> +			inst = 0;
> +			idx = i;
> +			support_deb = (i < MAX_BIT) ? 1 : 0;
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

..snip..

> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> index 6139b16cd225..aa17a6073029 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -11,6 +11,25 @@
>   
>   #include <linux/irqdomain.h>
>   
> +#define MAX_PIN 999
> +#define MTK_EINT_EDGE_SENSITIVE           0
> +#define MTK_EINT_LEVEL_SENSITIVE          1
> +#define MTK_EINT_DBNC_SET_DBNC_BITS       4
> +#define MTK_EINT_DBNC_RST_BIT             (0x1 << 1)
> +#define MTK_EINT_DBNC_SET_EN              (0x1 << 0)
> +#define MTK_EINT_NO_OFSET                 0

> +#define MAX_BIT                           32

MAX_BIT==32? Ok, so I was right in saying that the new eint is just the old one
but with more than one instance.

> +#define REG_OFSET                         4
> +#define REG_GROUP                         5
> +#define REG_VAL                           0xFFFFFFFF


> +#define DB_GROUP                          8
> +#define FIRST                             1
> +#define SECOND                            2
> +#define THIRD                             3
> +#define ARRAY_0                           4
> +
> +//#define MTK_EINT_DEBUG

Those definitions are either cryptic or unneeded.
And I'll stop my review here.

To be clear, the response is a huge "NACK"; you really have to redo everything
from scratch, but this time, just implement support for the new design on the base
of this upstream driver.

Regards,
Angelo


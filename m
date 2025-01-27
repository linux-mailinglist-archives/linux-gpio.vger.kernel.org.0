Return-Path: <linux-gpio+bounces-15068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C34A1D59A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 12:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10C257A185E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D152B1FDE05;
	Mon, 27 Jan 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gzg2v/os"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E6C2D1;
	Mon, 27 Jan 2025 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737978511; cv=none; b=FnUwTZ3goJPp4sLtcYr1qKZS4WrarOVOuc+gIVHFc4cSgkOmX/QYVXZM96OLHliU5Uwepcbq6mVPBoheF1eCeT0G3Xh3cVA6WeCps5TtdNpkPob1IBHIaSsTG5Jcbqer48xwoVO0HI/zY9iC8KwRV1915Ergl8keTv0rdmoxC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737978511; c=relaxed/simple;
	bh=lc+C2L2elEfWKiD8GPckPA2FJyMup+IhWEW4zlgFAig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INVEAZXJP1mr5B3gyITiQAxSwWRC5qkd16oJCblXTyaXI+cb2+bfgIt1rV0ZrkeP1++mTDLwCzrWbONF8SeoCIvpWE0mwGXsBvuhv3qSB8Bxvp2zKVOp1kIZNg1UbFwdMsWpywNVQp8pwEZLkk24DmlashnLj5hIWNu4IhUfqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gzg2v/os; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737978507;
	bh=lc+C2L2elEfWKiD8GPckPA2FJyMup+IhWEW4zlgFAig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gzg2v/os61vIFPi7VAU4A/Dvy9J/wCYbsI/vpiIrry+fjO6XL+/NABr8UWmP7c3o2
	 +E+M3bW3V/jygyD7Fi7KDySzISf5Jk4mPh9xcMFYtbHJH/IpmbICdDgCHKJ8ETU9Jb
	 YKO29XB9mfWFxi8J8xtyGCCfKvXR7aOj0X5ePCXAL9PTY/IpRynjpVXrBuJyTRT0xV
	 pZR+bmMmXZXlXaBu45qNC5EK1ELPYlfTD0yCyUCrB0h2D/XlhrcREIUzI72A27d8eP
	 lBl018apjofsBdTuIJdL+PhYSmlkgNQQ9so/RM/+bQI2Av/1D4AFAuHpoH9sdJsnRc
	 C/rvwcQ8MQZPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91FA717E0B18;
	Mon, 27 Jan 2025 12:48:26 +0100 (CET)
Message-ID: <bfce3aea-490b-4311-ad4a-ab567d2a0572@collabora.com>
Date: Mon, 27 Jan 2025 12:48:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
To: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang
 <seann.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
 <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/01/25 03:51, Hao Chang ha scritto:
> The eint num will obtain the operation address through pins.
> Change the traversal method of irq handle from traversing a set of
> registers to traversing one by one.
> 
> Change-Id: I3962b78042d32501a73153201cddf52c6b62a695
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 38 +++++++++++++++++++----------
>   1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 540245c3128d..949a20196f74 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -513,6 +513,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   int mtk_eint_do_init(struct mtk_eint *eint)
>   {
>   	unsigned int size, i, port;
> +	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
>   
>   	/* If clients don't assign a specific regs, let's use generic one */
>   	if (!eint->regs)
> @@ -523,11 +524,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   	if (!eint->base_pin_num)
>   		return -ENOMEM;
>   
> -	if (!eint->pins) {
> +	if (eint->nbase == 1) {
>   		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
>   		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
>   		if (!eint->pins)
> -			return -ENOMEM;
> +			goto err_eint;
>   
>   		eint->base_pin_num[0] = eint->hw->ap_num;
>   		for (i = 0; i < eint->hw->ap_num; i++) {
> @@ -536,34 +537,29 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
>   		}
>   	} else {
> +		eint->pins = hw->soc->eint_pin;
>   		for (i = 0; i < eint->hw->ap_num; i++)
>   			eint->base_pin_num[eint->pins[i].instance]++;
>   	}
>   
>   	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
> -	if (!eint->wake_mask)
> -		return -ENOMEM;
> -
>   	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
> -	if (!eint->wake_mask)
> -		return -ENOMEM;

This error checking was fine. Please keep it correct.

if (!eint->wake_mask) {
	ret = -ENOMEM;
	goto err_wake_mask_alloc;
}

and

if (!eint->cur_mask) {
	ret = -ENOMEM;
	goto err_cur_mask_alloc;
}

> +	if (!eint->wake_mask || !eint->wake_mask)
> +		goto err_eint;
>   
>   	for (i = 0; i < eint->nbase; i++) {
>   		port = (eint->base_pin_num[i] + 31) / 32;
>   		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
> -		if (!eint->wake_mask[i])
> -			return -ENOMEM;
> -
>   		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
> -		if (!eint->cur_mask[i])
> -			return -ENOMEM;
> +		if (!eint->cur_mask[i] || !eint->wake_mask[i])
> +			goto err_eint;

same here

>   	}
>   
>   	eint->domain = irq_domain_add_linear(eint->dev->of_node,
>   					     eint->hw->ap_num,
>   					     &irq_domain_simple_ops, NULL);
>   	if (!eint->domain)
> -		return -ENOMEM;
> +		goto err_eint;
>   
>   	if (eint->hw->db_time) {
>   		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
> @@ -585,6 +581,22 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   					 eint);
>   
>   	return 0;
> +
> +err_eint:
> +	for (i = 0; i < eint->nbase; i++) {
> +		if (eint->wake_mask[i])
> +			devm_kfree(eint->dev, eint->wake_mask[i]);
> +		if (eint->cur_mask[i])
> +			devm_kfree(eint->dev, eint->cur_mask[i]);
> +	}
> +	if (eint->cur_mask)
> +		devm_kfree(eint->dev, eint->cur_mask);
> +	if (eint->wake_mask)
> +		devm_kfree(eint->dev, eint->wake_mask);
> +	if (eint->nbase == 1)
> +		devm_kfree(eint->dev, eint->pins);
> +	devm_kfree(eint->dev, eint->base_pin_num);

...and you should only kfree what was successfully allocated before.

Regards,
Angelo

> +	return -ENOMEM;
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_do_init);
>   




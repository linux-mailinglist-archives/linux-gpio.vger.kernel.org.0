Return-Path: <linux-gpio+bounces-12812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B59C3A97
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB91282D09
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC12216C6A1;
	Mon, 11 Nov 2024 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LffppI7y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9A158535;
	Mon, 11 Nov 2024 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316371; cv=none; b=CxGqzASZKWxcwx+OUqyShTW40BvflZyRJUMjuJ7Dlbi01XBIIG5j0WvHWHmglyiohmmgRB4LfGaJdh8B/qkrgq93STC8UKc2j/EWSPGuf4RGo3uc/pvc9vDCpIVg7Q+ePKH4QyV3K6cwQ6c0P+fQdXKW4cocoJK62612wKR+1bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316371; c=relaxed/simple;
	bh=MSigMWgehOtxpIFFpE8Xr8h3iAivJv7LFCSEM4CCaZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjIAcBMks9QmjhamWvQ9oPhcjq5feRNwuv/7uNx/8lQfWdcY4wSBnarvs6DNQ5CvmPs/ZgCs/KcwMXAAjHZMWs7zMFsOjfZ3QohDCmHGFaHxBBFrUklP02VQYLDoq7el2c+mp5JksutGU7SZFdqif9os1hKl4ZWZG/+VxECFCKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LffppI7y; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id AQTPtyuHNkdV1AQTPtqV7j; Mon, 11 Nov 2024 10:12:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731316361;
	bh=E5adKoLJIzz/ffid1ZIMaHJpYRQg8lqTXgqnfMDx2AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LffppI7ywfAVd3sjvdQxQwRaHPxwMdi/F2n0moYT7mRgQk1bkWCVdm+wbbdWogjgz
	 /VSniLVOEdPfXm3DeXYvgGNuENDNgRUaZXNogfgoQFLHsyVS2sAyJbDwihSZQS4X13
	 PZ9g6pYfmW3xDRtsu83wzQYdUywQ6AWKBoTEa1oEuE/W8fpvpWou2ryGETvJ/tAfyV
	 wzcfrDs1ecEoPuBm4672/OAGDREj7+koCK4776A+KjaRQpEnY1fgk32cgNQwZ51Ne5
	 JN/w0O1vpuCtSxC8bZzO5YiBzJibMHMAdHumcGqb+Hi2nFSNjmi+ePrJ1ruIvtM8Vo
	 oGi4jt78Y1FCg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 11 Nov 2024 10:12:41 +0100
X-ME-IP: 90.11.132.44
Message-ID: <0fd22798-8aa1-4d86-bdaa-c03938972319@wanadoo.fr>
Date: Mon, 11 Nov 2024 10:12:37 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
 linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/11/2024 à 09:53, ot907280 a écrit :
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> 
> Add register address for each pin config.
> Add the function for each pin.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>
> ---

Hi,

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> new file mode 100644
> index 000000000000..9732ede74d9b
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> @@ -0,0 +1,2791 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + *
> + */
> +
> +#ifndef __PINCTRL_MTK_MT8196_H
> +#define __PINCTRL_MTK_MT8196_H
> +

...

> +	MTK_PIN(
> +		292, "veint292",
> +		MTK_EINT_FUNCTION(0, 292),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	)
> +};
> +
> +#endif /* __PINCTRL__MTK_MT8196_H */

Nitpick: there is an extra _ before MTK here.



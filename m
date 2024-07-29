Return-Path: <linux-gpio+bounces-8418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921F93EEDF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFE36B223D5
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38F612EBF2;
	Mon, 29 Jul 2024 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0HI5WJpn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B212D209;
	Mon, 29 Jul 2024 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239210; cv=none; b=MH90N6vVHQekTcEVVlv5CAPIk4CgVmXHrTLt0DgpK59H5KJLs9agz8UylwUVvlEOhnuCnAnGQvVkYDC/fzQx9buItkdsME8kj2ganCOBigQToEm4XF1rduCkJNCqJ96TDygw0KCq+8yDGDyPkTI4Fwk2gw81ytZaiRdZtY1l81E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239210; c=relaxed/simple;
	bh=gbQ6Ez8CLtajORQq6U3RJkBxEyQhQ76lV9EIVahQTWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeIZTdTSXXpvgnVQYhlypBtPLAuxILlHAE46a0j5/ORuP6fqCWPArtTA/DTFegr5+Q+ydVZDhOWAFwnd7+Tlh4sYwcyuocnmp+xmmoOl8PLMU0U5Y9DnHYsMZfq3ZkR0TSlstPEvQlfxRWD6sHLKupoe2oJ5k/XOtti3SDYTX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0HI5WJpn; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239207;
	bh=gbQ6Ez8CLtajORQq6U3RJkBxEyQhQ76lV9EIVahQTWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0HI5WJpn1cqeyzhH1ezN1ik09IcqW6RY19N9EtTsUOTHqcQtPC2IviYXZMfBNx0Bw
	 DZEal83SE1dYl84tgGeDK+IcKn31GV2nq46ZeBPf804tsHEjKXsgKzq0Td/bVZaRDr
	 8hXtunQvLCFsHqpaxIKDgyt0m4SRCTIzxEski39SDUYC2jx5j+wqo3cztuwUqlbsZk
	 z7UGq78Sg9OYqy+EuswUxoVtMZ0byRdD7vcPQntaxoz5CKRL0f4geFAtgtarYMf/Ie
	 mpdwtNqkJTqcdWMlWY4AvdYwOHHXnAWjf3yNOam3VxOIlQDW0wwiI7rh5tqRO2/FTV
	 mITsX5v1Jihdw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 68914378203F;
	Mon, 29 Jul 2024 07:46:46 +0000 (UTC)
Message-ID: <f73bf4de-0795-41a6-a94a-016e85721e2e@collabora.com>
Date: Mon, 29 Jul 2024 09:46:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: mediatek: mt6765: Add virtual GPIOs
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-4-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-4-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add EINT-only virtual GPIOs as done for MT6735
> These pins are needed at least for PWRAP
> 

Those are not virtual - they do exist. For real.

I would, at this point, describe this commit as such:

pinctrl: mediatek: mt6765: Add GPIOs for PWRAP

Introduce missing additional EINT pins, used mainly for the PMIC Wrapper.


> Fixes: 477fecee7ca9 ("pinctrl: mediatek: add MT6765 pinctrl driver")

...and this is an addition, not a fix, so please remove the Fixes tag.

Cheers,
Angelo

> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
> index 772563720461..070af420333b 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
> @@ -1749,6 +1749,72 @@ static struct mtk_pin_desc mtk_pins_mt6765[] = {
>   		DRV_GRP4,
>   		MTK_FUNCTION(0, "GPIO179")
>   	),
> +	MTK_PIN(
> +		180, "GPIO180",
> +		MTK_EINT_FUNCTION(0, 144),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		181, "GPIO181",
> +		MTK_EINT_FUNCTION(0, 145),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		182, "GPIO182",
> +		MTK_EINT_FUNCTION(0, 152),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		183, "GPIO183",
> +		MTK_EINT_FUNCTION(0, 153),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		184, "GPIO184",
> +		MTK_EINT_FUNCTION(0, 154),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		185, "GPIO185",
> +		MTK_EINT_FUNCTION(0, 155),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		186, "GPIO186",
> +		MTK_EINT_FUNCTION(0, 156),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		187, "GPIO187",
> +		MTK_EINT_FUNCTION(0, 157),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		188, "GPIO188",
> +		MTK_EINT_FUNCTION(0, 158),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		189, "GPIO189",
> +		MTK_EINT_FUNCTION(0, 159),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		190, "GPIO190",
> +		MTK_EINT_FUNCTION(0, 147),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	),
>   };
>   
>   #endif /* __PINCTRL_MTK_MT6765_H */



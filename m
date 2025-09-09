Return-Path: <linux-gpio+bounces-25781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7CB4A465
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 10:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BE487A4A6B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 07:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FD7242D70;
	Tue,  9 Sep 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SC5DxzuB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF023ABB3;
	Tue,  9 Sep 2025 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404820; cv=none; b=A3lzlScR+QTPamY2MlETz8keKcc0ZFI3m/XQrxR7wstBHZ6fqO0TdkWzPb8eeUtFtrfC+gepz8bHIhCqa+FNbKpo+Vr3jfAwlGZ6MDsfFMqO61rgLZfMd5hExhaTghAq8ZbqVki4eGK5Zu3ngWqcr1AY5gVFMKEjzmaCMgR6zDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404820; c=relaxed/simple;
	bh=oCLEvvVWTE44t3aDmRT7ZhIFJug4E7QdqqWFMsbwgXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3D/4eG1hmvGO6W7ow0daqN9j7Cv5Flo6tTVcNYqyGPaZ0Mcv7Y0jyEDywGVPxbIE/rNDNIcnNObluQ84ZBgQkPFHu8/1Wi2saxHWsdPwXcsUXEducfjG3GLyqSuJH37Di64sgcXsc0VRjnr990R1Ri1bXJZ6Alv7NuvsU/41GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SC5DxzuB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757404816;
	bh=oCLEvvVWTE44t3aDmRT7ZhIFJug4E7QdqqWFMsbwgXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SC5DxzuB36zfuF0hEiz3OhRCrqpP0wmu3sK9sAFfUcEYCc3enPHy5uzCpayPzsahX
	 luKZrCwgKkPO2OIRlPpv985qyqGnM7o9WplsuAv9P9tzrGoaBmEtkJ3U/IWFEbgNOc
	 3soqSytqBwAbuZEEmCdS5BZAbR+ZDCZlrdqOfP5jam0YXop0NPSF8N+dxPvYuzJunW
	 1gnimL7jrpMY55dWa+j4noaPqrYgzyCusZY2NZiByZ+qUuvdD9nzWp9Ie+RMs9GnID
	 o6QKTnBdcQTPtCntZUN7WmkjHv8jruvk2SEZ3kXVNjKh9WRRJdpIwIPjA/pkU33T/d
	 ZeDvUeefzgvuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65F3A17E0C96;
	Tue,  9 Sep 2025 10:00:16 +0200 (CEST)
Message-ID: <493794af-a1e8-4a4e-a253-2b6b703df53b@collabora.com>
Date: Tue, 9 Sep 2025 10:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pinctrl: mediatek: Add debounce times for MT6878
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/09/25 21:17, Igor Belwon ha scritto:
> MT6878 uses different debounce times than other SoCs. Add them to the
> EINT driver.

The only reason why I can't give you a R-b for this is that you forgot to add
your S-o-b...

Cheers,
Angelo

> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 5 +++++
>   drivers/pinctrl/mediatek/mtk-eint.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 9f175c73613f84b47c0160947f32da7aca7d5a18..c8c5097c11c4d14eb41bdd7f9cb93b4a5756d2b2 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -66,6 +66,11 @@ const unsigned int debounce_time_mt6795[] = {
>   };
>   EXPORT_SYMBOL_GPL(debounce_time_mt6795);
>   
> +const unsigned int debounce_time_mt6878[] = {
> +	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
> +};
> +EXPORT_SYMBOL_GPL(debounce_time_mt6878);
> +
>   static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
>   					 unsigned int eint_num,
>   					 unsigned int offset)
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> index fc31a4c0c77bf28b106943e9292d0dcc425c4922..3cdd6f6310cd0da5aa74623c5f1dbe8f8495d689 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -52,6 +52,7 @@ struct mtk_eint_pin {
>   extern const unsigned int debounce_time_mt2701[];
>   extern const unsigned int debounce_time_mt6765[];
>   extern const unsigned int debounce_time_mt6795[];
> +extern const unsigned int debounce_time_mt6878[];
>   
>   struct mtk_eint;
>   
> 



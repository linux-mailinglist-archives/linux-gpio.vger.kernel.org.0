Return-Path: <linux-gpio+bounces-8421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82793EEED
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D8A280E96
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BE512C552;
	Mon, 29 Jul 2024 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y3qXOj+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E584A2F;
	Mon, 29 Jul 2024 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239323; cv=none; b=jVZR+rzeDNkTSYjkTcLo8ohKtMUy828tD3NEf/NEsDPRTYu+3RduDQfcgKNLvsXwhtsooLTwvddZuoU1CwIdTaCh/dFPDyi4KGbERCxiX3kMyFUGNVMzD+0b9lAZEEOfY+oZbGX1QA3WeDsjRHKdmUQQBBDA6l7eYJgj0jGQEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239323; c=relaxed/simple;
	bh=A8Z6Mxp06bKeJRw0NTJSBTiE6BVE4kHHuIOZ1xZxo+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nob1otdDkvH2bdBIyGxbyXFLAPFg929DodgT2K0WYZP56wDsy+he3Qr7N5Kjggok22trqY4hyisNw+D57YhohK/KugKXysKIA2TzamJiYo/XALmAXc9/ngQifeAEw2sLbEkFm/dkPBx1jewmFiuyOcx/oV5JQtPW6eVdwZZ7rW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y3qXOj+Q; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239320;
	bh=A8Z6Mxp06bKeJRw0NTJSBTiE6BVE4kHHuIOZ1xZxo+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y3qXOj+QQnmdaG9dKCCYDmsA+fwTcvEjrrGuhkIHfggudxrLT2sRIhFE27GAaEekt
	 Rx85dhLyGzv6FKFCbaJY6qrAiyt6ckSa017F6Xb4HPJTdidyc+O0o3Kef4w+9qiDIJ
	 1bKoZKnFQKbTB+JkM33VSY4oC2o+V9ysDgPeqU2ZVSEnOgFWguTEq9+2Zbdf2Uffbn
	 jvZ003zAKna8f8qbtPXDQFJUG3yPOspncCjqZKiP/OjffD+kX1fcMD5uAHo5XPW5PT
	 R559Pie+PgcPGlnecLnPl62kYY10GbABLJhrxmIW0ag1nGV9FPMeE0DMalvuYqWs38
	 6h0We8gp67FIg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B66B8378148F;
	Mon, 29 Jul 2024 07:48:38 +0000 (UTC)
Message-ID: <6cc155fd-c4e6-4c5c-b3c2-d1a3e7b70bf9@collabora.com>
Date: Mon, 29 Jul 2024 09:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] soc: mediatek: mtk-pmic-wrap: Drop CAP reset in
 MT6765
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
 <20240729073428.28983-6-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-6-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> None of the MT6765 reset-controllers have PWRAP reset,
> so remove the requirement of it

Sorry, but that's not true. There is indeed a reset bit for the PWRAP on MT6765.

Which one and where - I have no idea, but I'm sure that there is one :-)

Cheers,
Angelo

> 
> Fixes: 12b079b0fe8b ("soc: mediatek: pwrap: add pwrap driver for mt6765 SoCs")
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index efd9cae212dc..30d74279e27f 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2288,7 +2288,7 @@ static const struct pmic_wrapper_type pwrap_mt6765 = {
>   	.int_en_all = 0xffffffff,
>   	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>   	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> -	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
> +	.caps = PWRAP_CAP_DCM,
>   	.init_reg_clock = pwrap_common_init_reg_clock,
>   	.init_soc_specific = NULL,
>   };




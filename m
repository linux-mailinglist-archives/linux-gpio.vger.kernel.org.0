Return-Path: <linux-gpio+bounces-20446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C76EABF6A0
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 15:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D66017064D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 13:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FD714F117;
	Wed, 21 May 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R62vDqmr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9014658D;
	Wed, 21 May 2025 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835603; cv=none; b=g65PDSo118E2Kya5zQ1h05dHPiqiGu1anm/P28d45qLktQgsv2KVedQ4YZkekducmqjPJd/nFa3h7XqhL+jl4FN2sfQiXErohMnA879Pin2w2yoY6no6qaseyy65wVkLwfMiCG8LSCNudJ5546Z+VMGt7nHkAmAxvuxK9tMBHYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835603; c=relaxed/simple;
	bh=hutYu+1ngX5Dt7IvfZMnK5eZXB31NtkXbIx/qn2SlPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECMomfSiu7T7yZgUK1Iq/HRNaGj1ZK0+zHFkEZYkYAN+TYLK1UkvcmTphMu9fJAImtIp5m3bst0AGkgv8VP4IUla+ifcmIELkcF95gzcAUZ9qh9IYcjO/jf+gFvuXAA2aB9hpX1Lq2C6RxgocuEYd8RaXhqYb+OwVYcPCRRTH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R62vDqmr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747835592;
	bh=hutYu+1ngX5Dt7IvfZMnK5eZXB31NtkXbIx/qn2SlPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R62vDqmrOkMKkmZxrNQeM1WnDBjhH9iGq2aBoELIjuvSW21xQwdOdspMpv9vY2XBn
	 xMlTG2M8DraIIaaBwmThC672MJYyytmXLcyGxoikKpfi0QhJ/6rui18W1vJblW50FZ
	 Qvugdm/jtNygoUE6njUoSB8FUMkXPHGwlo2TY0LUCgIxbFvz9g5QuTVcnZyxqjizJK
	 jSYBMy1xNX5g3uVv+p32u8fn2hGZ+fEy2YM9se/iUTd310tASWUhD8cbWjw9qYoTI9
	 r55n5ABClwoAHRSHB6p/swieW20LjJDQrxiXAsTc9Hnq5o7h2YeNtuoKIq0aVigBQc
	 207PIFL9zBhrg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AD2E17E02BE;
	Wed, 21 May 2025 15:53:12 +0200 (CEST)
Message-ID: <557a5182-4843-4925-953e-09e3b1e41f0c@collabora.com>
Date: Wed, 21 May 2025 15:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hao Chang <ot_chhao.chang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 20/05/25 23:15, Nícolas F. R. A. Prado ha scritto:
> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
> 
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
> 
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
> 
> In order to fix this, since 'struct mtk_pinctrl' was only needed to get
> a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
> of mtk_eint_do_init() so that callers need to supply it, removing
> mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.
> 
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Completely changed approach to make mtk_eint_pin a parameter of
>    mtk_eint_do_init() as suggested by Angelo
> - Link to v1: https://lore.kernel.org/r/20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c              | 26 ++++++++++--------------
>   drivers/pinctrl/mediatek/mtk-eint.h              |  5 +++--
>   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  2 +-
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c    |  2 +-
>   4 files changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..d906a5e4101fb10968035fc48e9cf4a444d063a9 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -22,7 +22,6 @@
>   #include <linux/platform_device.h>
>   
>   #include "mtk-eint.h"
> -#include "pinctrl-mtk-common-v2.h"
>   
>   #define MTK_EINT_EDGE_SENSITIVE           0
>   #define MTK_EINT_LEVEL_SENSITIVE          1
> @@ -505,10 +504,9 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   
> -int mtk_eint_do_init(struct mtk_eint *eint)
> +int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
>   {
>   	unsigned int size, i, port, virq, inst = 0;
> -	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
>   
>   	/* If clients don't assign a specific regs, let's use generic one */
>   	if (!eint->regs)
> @@ -519,7 +517,15 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   	if (!eint->base_pin_num)
>   		return -ENOMEM;
>   
> -	if (eint->nbase == 1) {

Okay, dropping the nbase == 1 is sane, but that statement was actually documenting
the fact that *eint_pin is used only for multi-base EINT case, so please add those
comments:

> +	if (eint_pin) {

		/* EINT with multiple bases */

> +		eint->pins = eint_pin;
> +		for (i = 0; i < eint->hw->ap_num; i++) {
> +			inst = eint->pins[i].instance;
> +			if (inst >= eint->nbase)
> +				continue;
> +			eint->base_pin_num[inst]++;
> +		}
> +	} else {

		/* Single base EINT */

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for fixing this!



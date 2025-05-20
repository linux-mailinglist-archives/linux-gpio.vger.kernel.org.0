Return-Path: <linux-gpio+bounces-20332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779FABD308
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 11:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 154151BA349C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 09:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97937267B90;
	Tue, 20 May 2025 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SVPwpdjE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB551D63FC;
	Tue, 20 May 2025 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732520; cv=none; b=KTL45qUossgdZkkN/jZSxf68jRpsBMzpWEtq+ZWQeIboHryohveGsafiBQauzB698RdyELqUznI88AsszV6X/yiTPqVetiE46EwYEAt+I5WuJhAeQexsHG1bXpRAdiEYILwfkghnOX7aLnl3GTWcqCI0moyum/cDfULUPeF1ZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732520; c=relaxed/simple;
	bh=YOACIVFpfOzkfuJOEv7U1awZi32i31XSCqitokq/3Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORpB9LeC6a6UexaUslZZWLbearh1qru5gJgYQUOF63a2Vk024jscImru8tLR+JTdJfuF99Ik9RUr2xXGDRUr1r+AvGHV4GKPII4uokdpzZFgvcOI6dLAVyZaZN8SLzFYUi+rmdpQz9t/wYegKGl6eeOvFeUbEVlbwULofJjqZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SVPwpdjE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747732514;
	bh=YOACIVFpfOzkfuJOEv7U1awZi32i31XSCqitokq/3Js=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SVPwpdjEA4jgrbChMjQZi+PNrzVL35YcfMnLrMjiiLRzz7thakSS8XAQUS8hVRZrG
	 +qmGZzYz3i8n2LnIjyh2jIkgiahW2HHL8nMzU6/4EIMqOqvs48qLsy15Z+Iz4wn+zB
	 gV1OoGVNojLGrKA1ycn6U/p1ep07r813PaZLwtLzDNOKScPC7umFGbcfnG/6tyg33k
	 JKFkQ7XeUpo6bINTAfJLOid22gMX/KiOFDOndwL+8NxxG2fDO1FExzNo1MYmp4XNo7
	 hwh/9koFpwGA3drEI/cFy8bjX7+hpf+gCWVF0nznxJbi+zxSiA99OYJ7G43ls3lEei
	 8aLwtdkvWxyHw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4E5617E0E89;
	Tue, 20 May 2025 11:15:13 +0200 (CEST)
Message-ID: <2f7dffb0-cddd-44c5-a205-30dbc13f9891@collabora.com>
Date: Tue, 20 May 2025 11:15:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: eint: Fix invalid pointer dereference
 for v1 platforms
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
References: <20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 19/05/25 21:38, Nícolas F. R. A. Prado ha scritto:
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
> In order to fix this, given that this if code block is only relevant for
> platforms with multiple EINT bases, and the previous if block already
> handles the single base case, add an else statement so this if condition
> will never even be evaluated on platforms with a single EINT base, which
> covers all v1 platforms following commit fe412e3a6c97 ("pinctrl:
> mediatek: common-v1: Fix EINT breakage on older controllers").
> 
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

I say that this is going to backfire next time.

I would rather propose, instead....

int mtk_eint_do_init(struct mtk_eint *eint, const struct mtk_eint_pin *eint_pin)
{
	...

	[if (or) else if] (eint_pin) {
		eint->pins = eint_pin;
		... etc
	}
}

...so that we avoid having this issue about referencing two different structures
called with the same name (which is bad from the principle anyway), and no more
mistakes around that in the future.

This also means that we can remove the inclusion of pinctrl-mtk-common-v2.h from
the mtk-eint.c file, as that's the right thing to do: eint should be standalone
and should not depend on ambiguous definitions from pinctrl-mtk-common(-v2).h.

Cheers,
Angelo

> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..9114e0cd9def1bc65558c67317abe67ba63ef1f6 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -531,9 +531,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   			eint->pins[i].index = i;
>   			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
>   		}
> -	}
> -
> -	if (hw && hw->soc && hw->soc->eint_pin) {
> +	} else if (hw && hw->soc && hw->soc->eint_pin) {
>   		eint->pins = hw->soc->eint_pin;
>   		for (i = 0; i < eint->hw->ap_num; i++) {
>   			inst = eint->pins[i].instance;
> 
> ---
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> change-id: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84
> 
> Best regards,




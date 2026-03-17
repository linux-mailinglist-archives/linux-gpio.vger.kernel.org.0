Return-Path: <linux-gpio+bounces-33646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAzUCqVouWmZDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:43:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA72AC323
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3712931BC7EE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1E03E51FE;
	Tue, 17 Mar 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KxwL5XwD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6763E3C7F;
	Tue, 17 Mar 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757715; cv=none; b=Ucp8hbvBkYebO3WKK7QPuGdFdZ+/gEnS6m/xmSaceBo/63OKKe0967ZwK/TiKkbUpGFZvZK43SM2NiAfLSQ5ZydiRMCVORz3AMZVNdv2lKaVXU1ckURtYTEq5YCZKDQmiLisoNYQ7OgHlAyzU7t0oWtCFZwK7sRlgM6fLxlWsKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757715; c=relaxed/simple;
	bh=xgA9BPpIqrsMRDp2X5EBDamcJXXwz037wPU/0xzBjXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTP757RNS81Tw153Olap9tPdcDtJIrmHatqkPWdLt2zL8tJa3zmTjYMdXk5VLzmmjUeKb99WSfmFHbVlhpS8C4YoZ6oIBfV2DMlJhOOaaSaSyZQ+8pwKQRzkAopM+kEBAqmYV6B5ctOtMXwWxAwCz+m4BUhOovH/cgGg3RzES7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KxwL5XwD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773757712;
	bh=xgA9BPpIqrsMRDp2X5EBDamcJXXwz037wPU/0xzBjXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KxwL5XwDzOo2dXu5guQMaRtmYSOakVuYSjawFEVhrmjjgslkFJ0noVqhN1WzvQLBl
	 7iZHFQWsMcCvHGEMCYPD0+FNubqjxdkcGlBUnJU+33NDtX6YAVIPv41MrMaef3GGq1
	 WkaXv6Orc5Aqu4esjTzo5nDrtQ/WwirFrGesMlLp9JwrlYRmmKeuBEkDJy7jEe3Iie
	 jdOdLZwhOdV8DB3E8X+ikCn+0FDL84bFeT84ffg72TUvNqxc9scl3JI41hfZKLzt8+
	 5KSD6aU2c5XYDjfim+xaaEXQ4r/vRKmGld5OZcyH2gtUAqOM/xwH3cxfkhL48O4Go3
	 P71eGIWuPcQwg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDA2317E0E3F;
	Tue, 17 Mar 2026 15:28:31 +0100 (CET)
Message-ID: <4e120931-9ae0-4332-aeb7-ab11926c4e00@collabora.com>
Date: Tue, 17 Mar 2026 15:28:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices
 without EINT
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260317110249.391552-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317110249.391552-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33646-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 80AA72AC323
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 17/03/26 12:02, Luca Leonardo Scorcia ha scritto:
> Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
> the mtk_eint_init function is always called and returns -ENODEV, which
> then bubbles up and causes probe failure.
> 
> To address this only call mtk_eint_init if EINT pins are present.
> 
> Tested on Xiaomi Mi Smart Clock x04g (mt6392).
> 
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

That's right. Not all do - and the ones that don't have eint support also won't
have the pm ops, so no further check is required.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index d6a46fe0cda8..3f518dce6d23 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1135,9 +1135,12 @@ int mtk_pctrl_init(struct platform_device *pdev,
>   		goto chip_error;
>   	}
>   
> -	ret = mtk_eint_init(pctl, pdev);
> -	if (ret)
> -		goto chip_error;
> +	/* Only initialize EINT if we have EINT pins */
> +	if (data->eint_hw.ap_num > 0) {
> +		ret = mtk_eint_init(pctl, pdev);
> +		if (ret)
> +			goto chip_error;
> +	}
>   
>   	return 0;
>   



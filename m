Return-Path: <linux-gpio+bounces-38834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EkuYBPo+Omrr4gcAu9opvQ
	(envelope-from <linux-gpio+bounces-38834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:08:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BE6B526A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:08:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=owfJ3Ygz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38834-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38834-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5456A3082F28
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 08:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EAF320CB1;
	Tue, 23 Jun 2026 08:06:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE223CAE94;
	Tue, 23 Jun 2026 08:06:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202005; cv=none; b=sHmyPZ9SjmjK4yY8iFYayD/VS6FDMhTBtL6YXjiugFNuOCEHFobx9lvbuFrNtN7Lpf3otfCH9xD+Hqd36WRXavtliULUgaNQVXc+ox+uyO8XyR480wra1tBqSbWwsv8FYfoif92DoEIu9lvVFzykrl3/Rk0tYNScwmqG4Piyme4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202005; c=relaxed/simple;
	bh=05sDxDxhH+7UoIrgdabJtlXr867z5VKROPNR6f1UT4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXLrJ0MrKP+qRrbgQAYW2FvHX04K95aqvSFDMbxGM8A4BGaRn9EsA6/8agWfJiT12i0ekjvhPNn4wIOk8AqzoOh0ZMcCHh1vwvoTQWAdkYoIOM15TGPsxls46ArMGkCXnUKRQvS815hW53y51IgoEBR++iz5apb6yAN2S1KvwdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=owfJ3Ygz; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782202001;
	bh=05sDxDxhH+7UoIrgdabJtlXr867z5VKROPNR6f1UT4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=owfJ3Ygz4Dlx/2o5TREY+3za/AJzA8mphrSFgVyPQoi9HTGiZZrHV2+/ej3XnEFZh
	 +CTa6YjU6GHZzR4dtdFA1ZoPuNObDNh8ZH7kFeGjvHwsW4vGaG5sFY/a1caDLRQ5Z4
	 og32giKwkqQ7CGZ3AxAgTzH3TCaZHGyCMWCc0FHZIJFpOog4tLPexsrCY7Oz3R1NQr
	 e98SP4UH8O55uMFya5lLafWNDUqpmF2Jkv3T+33QmFXN0fDKAdFTn8ocZ0Wfrw2eH9
	 Cy0hSS++zxNj8eVk8OHFsJzuWlpTEO0iB58eEfYeID8Yc6YWP/MfDFrPuRQhHlHJvo
	 cM3ElXnOyX75Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 324C117E10FC;
	Tue, 23 Jun 2026 10:06:41 +0200 (CEST)
Message-ID: <24670280-508d-4794-b5f4-1dda825d9289@collabora.com>
Date: Tue, 23 Jun 2026 10:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Restore PINCTRL_MT8189 to tristate
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
 <20260529100308.51271-2-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260529100308.51271-2-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38834-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:justin.yeh@mediatek.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mediatek.com:email,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 775BE6B526A

On 5/29/26 12:02, Justin Yeh wrote:
> Under the GKI + vendor_dlkm model, vendor-specific pinctrl cannot be
> built into the GKI vmlinux. Upstream's recent switch of PINCTRL_MT8189
> to bool prevents building as a loadable module, which breaks DDK module
> usage. Restore tristate so MT8189 pinctrl can be packaged as a kernel
> module in vendor_dlkm.
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

The MODULE_LICENSE change shall come before this one.

Besides - since there's no problem in having the pinctrl drivers as module for
MT8189, I imagine that this is analogously true for all (or most of) the others.

Looks like getting those to build as modules is trivial, too - so, can you at
this point please do the same for all of the MediaTek pinctrl drivers that are
trivial to enable as tristate?

P.S.: After reordering the commits, this one is
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks,
Angelo

> ---
>   drivers/pinctrl/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 4819617d9368..a75434e7e989 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -270,7 +270,7 @@ config PINCTRL_MT8188
>   	  map specific eint which doesn't have real gpio pin.
>   
>   config PINCTRL_MT8189
> -        bool "MediaTek MT8189 pin control"
> +        tristate "MediaTek MT8189 pin control"
>           depends on OF
>           depends on ARM64 || COMPILE_TEST
>           default ARM64 && ARCH_MEDIATEK




Return-Path: <linux-gpio+bounces-39030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7TMRCO9OPmqnDAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 12:05:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841A6CBE8C
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 12:05:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=dR8P3rx5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39030-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39030-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A1BF303CA4D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09C03EA953;
	Fri, 26 Jun 2026 10:04:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994B18B0F;
	Fri, 26 Jun 2026 10:04:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468265; cv=none; b=cJz5GrrFm8BzSimBvAXhuOIS/rOvuumgC1z0ER9gN/nSfbZXThoR7T/VlFrq+jfw2UVJbTjntHWASb5HaZpc81QTBkZmIxW52ji8RvVujurULzb5xTzm0UhMNnHBfCRZMTQYyBj40sMr4fkMbAcKGEiIDhI6YVgS6+wnxsY8BCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468265; c=relaxed/simple;
	bh=ReCFqVhpToxEGsTwmHeMOcGqZ65zmC9b4kBYnQWBNUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNCXH06k5gH2co+UX1pod3OCkxDKHAZU2zs+ZowtysPBH0Vl94TiVyMHPL9C1sYVaeK91u3DJvKLF8Y2iUP7oKdofMWrxbUl8o5bj0Nq6pMujhCQDFQh2ncW2Rix4XvG7BmexHFFAA4uz8d0tDgX7Dj+p8nFX0Ci0YYUAV/W8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dR8P3rx5; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782468256;
	bh=ReCFqVhpToxEGsTwmHeMOcGqZ65zmC9b4kBYnQWBNUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dR8P3rx57/HUhEnpfMIr3OwFel1uxC8cVbfYgwmqN4//ed9ARA+lvLVThPPT2jyoe
	 pWkK9oY8DTaqSikeHpKN5i7aSvkWKtRBYKDBS0f7x5KyVdGVuDvmrEfg2MV4r4fyox
	 G+vsLLZ8SW2b2MIJlBIr6cBG6oV/qO2x1keLQ43YFiFcu14llPpH/kuiZO3b+q247k
	 NP6VEVPPQ5stMmKg7HLY9AoaiGdwLXjiqJMOLHLyodvEU8WGIvcBdsLQ/ePSttJQsf
	 S/fxBMGlVJ8KlEInSlMj1mP1xRuAX69hm95dAhPAIFqoXLGOmoq/p9FuKlh7aCn1RF
	 +BtkzevBLt+/g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7125917E0C88;
	Fri, 26 Jun 2026 12:04:15 +0200 (CEST)
Message-ID: <ad1a6a17-aff4-4dbf-9cdb-62765064b670@collabora.com>
Date: Fri, 26 Jun 2026 12:04:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/32] pinctrl: mediatek: Enable module build support
 for all drivers
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39030-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:justin.yeh@mediatek.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7841A6CBE8C

On 6/26/26 06:00, Justin Yeh wrote:
> Sorry for the quick v4 - v3 was sent with an incomplete cover letter
> (template placeholders) by mistake. This v4 also unifies MODULE_LICENSE
> to consistently use "GPL v2" across all patches.
> 
> This series enables all MediaTek pinctrl drivers to be built as loadable
> kernel modules. This is required for Android GKI (Generic Kernel Image) +
> vendor_dlkm deployments where vendor-specific drivers must be kept separate
> from the GKI vmlinux.
> 
> Each patch adds MODULE_LICENSE("GPL v2") and MODULE_DESCRIPTION() macros where
> missing, and changes the Kconfig option from bool to tristate. This allows
> these drivers to be properly packaged as vendor kernel modules while
> maintaining the existing built-in option.
> 

The entire series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but I'm not sure if one commit for each is ok, makes reverting easy but that
may be too much noise. Should Linus ask for joining them all, feel free to still
keep my R-b tag, as I'd be fine with that as well.

Cheers,
Angelo

> Changes in v4:
>    * Fix cover letter content (v3 accidentally sent with template placeholders)
>    * Unify MODULE_LICENSE to use "GPL v2" consistently across all drivers
>    * Update all commit messages to reflect "GPL v2" instead of "GPL"
> 
> Changes in v3:
>    * Add MODULE_DESCRIPTION() for all drivers (even those that already had MODULE_LICENSE)
>    * Update commit messages to reflect that we're adding MODULE_DESCRIPTION too
> 
> Changes in v2:
>    * Squash MODULE_LICENSE and tristate changes into single patch per driver
>    * Extend fix to all MediaTek pinctrl drivers (32 total), not just MT8189
>    * Add Android GKI + vendor_dlkm context to cover letter
>    * Add MODULE_DESCRIPTION() where it was missing
>    * Add Fixes: tags referencing the original commits that added each driver
> 
> Justin Yeh (32):
>    pinctrl: mediatek: mt8189: Enable module build support
>    pinctrl: mediatek: mt6878: Enable module build support
>    pinctrl: mediatek: mt6893: Enable module build support
>    pinctrl: mediatek: mt7622: Enable module build support
>    pinctrl: mediatek: mt7981: Enable module build support
>    pinctrl: mediatek: mt7986: Enable module build support
>    pinctrl: mediatek: mt7988: Enable module build support
>    pinctrl: mediatek: mt8167: Enable module build support
>    pinctrl: mediatek: mt8173: Enable module build support
>    pinctrl: mediatek: mt8183: Enable module build support
>    pinctrl: mediatek: mt8186: Enable module build support
>    pinctrl: mediatek: mt8188: Enable module build support
>    pinctrl: mediatek: mt8192: Enable module build support
>    pinctrl: mediatek: mt8195: Enable module build support
>    pinctrl: mediatek: mt8196: Enable module build support
>    pinctrl: mediatek: mt8365: Enable module build support
>    pinctrl: mediatek: mt8516: Enable module build support
>    pinctrl: mediatek: mt2701: Enable module build support
>    pinctrl: mediatek: mt7623: Enable module build support
>    pinctrl: mediatek: mt7629: Enable module build support
>    pinctrl: mediatek: mt8135: Enable module build support
>    pinctrl: mediatek: mt8127: Enable module build support
>    pinctrl: mediatek: mt7620: Enable module build support
>    pinctrl: mediatek: mt7621: Enable module build support
>    pinctrl: mediatek: mt76x8: Enable module build support
>    pinctrl: mediatek: rt2880: Enable module build support
>    pinctrl: mediatek: rt305x: Enable module build support
>    pinctrl: mediatek: rt3883: Enable module build support
>    pinctrl: mediatek: mt6397: Enable module build support
>    pinctrl: mediatek: mt2712: Enable module build support
>    pinctrl: mediatek: mt6795: Enable module build support
>    pinctrl: mediatek: mt6797: Enable module build support
> 
>   drivers/pinctrl/mediatek/Kconfig          | 64 +++++++++++------------
>   drivers/pinctrl/mediatek/pinctrl-mt2701.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt2712.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6397.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6795.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6797.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt6878.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6893.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt7620.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7621.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7622.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7623.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7629.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt76x8.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7981.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7986.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt7988.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8127.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8135.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8167.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8173.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8183.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8186.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8188.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8189.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8192.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8195.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-mt8196.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8365.c |  1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8516.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-rt2880.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-rt305x.c |  3 ++
>   drivers/pinctrl/mediatek/pinctrl-rt3883.c |  3 ++
>   33 files changed, 114 insertions(+), 32 deletions(-)
> 



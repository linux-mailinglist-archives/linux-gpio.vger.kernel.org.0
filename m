Return-Path: <linux-gpio+bounces-38833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qbE7JNU+Omrb4gcAu9opvQ
	(envelope-from <linux-gpio+bounces-38833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:07:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E96B5247
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:07:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=dEzAGm84;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38833-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38833-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B04306BCEF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 08:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7663CAE9E;
	Tue, 23 Jun 2026 08:06:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83738C2A0;
	Tue, 23 Jun 2026 08:06:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202003; cv=none; b=kd85EKzSfOd9tqMfm8WmudfAOfCSeExlU5oy8dGgcGuKHuJHI8Davao00Ya5hsY9VI8wZZJWnkL6xASslZqWQeNKjM9O1N1Klp2zTgyfh5KtX2aPSfNzCpUhNb0O+84sX/vfJJu9hcz3YiRTIMUYPzQjrfhULhIz80aFYQuKiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202003; c=relaxed/simple;
	bh=q2relrEzTIVCRZtAr/bd91kPwtipMyKMmyPaD3/aess=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4t46HznmRzqio0QMnIW8Zfkla82t4/4oSriaf1mq2eMr+AWgMBLBAHKSpYJsQYwgdLPzYAs3eCwcbhTLKVygkaetij0nT8OpmXH4oDT7Tg139T/3CMFTxelM/1cxgrgld/8ptIp2Wlxe83iuY+nlBD5baeqErxLZxHDD4gJli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dEzAGm84; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782202000;
	bh=q2relrEzTIVCRZtAr/bd91kPwtipMyKMmyPaD3/aess=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEzAGm846cDEOxZceS9ZX5Z+brcAg8I4pPI7P/ZT8nF6Te6xx1AXVFa2hR4ZqrEEH
	 5iKbTeifvIgC4YgmO7AIgK193fPilrE9LcpinTVJDcMn+ohNVHExfNZ2ik+RTlqw6d
	 8f0oMwVKCF7GKFnF+nNRw6lKhHVrop4Tiuru+OSqofejwRpuDmZDH7HqoV10qG8sBV
	 7GPQzl+tppV/e9zepAF7DldXHr9zzHRSRvleN7ouyLelTnOsDgVY0yPJZTxqJTM+4D
	 ujtCnirqiR3Pwu4BGGB6DHLme9QxlbSR9iGpQEWbdXDu6WrmEgQxtxNUeEA6MLm89s
	 IUDV2bh2buMYA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9608017E1025;
	Tue, 23 Jun 2026 10:06:39 +0200 (CEST)
Message-ID: <36d9b5b3-4db3-4684-960b-651fb453ce1f@collabora.com>
Date: Tue, 23 Jun 2026 10:06:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: mediatek: mt8189: Add MODULE_LICENSE
 declaration
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
 <20260529100308.51271-3-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260529100308.51271-3-justin.yeh@mediatek.com>
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
	TAGGED_FROM(0.00)[bounces-38833-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:justin.yeh@mediatek.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 021E96B5247

On 5/29/26 12:02, Justin Yeh wrote:
> Add missing MODULE_LICENSE("GPL v2") macro to fix modpost error during
> kernel module build. The license identifier matches the SPDX header
> (GPL-2.0) at the top of the file.
> 
> This fixes the following build error:
>    ERROR: modpost: missing MODULE_LICENSE() in pinctrl-mt8189.o
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Please, do this for all MediaTek pinctrl drivers.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



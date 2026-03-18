Return-Path: <linux-gpio+bounces-33746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA4LGVidumngZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:40:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC02BBA47
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E76FE30197D9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78CE3D890F;
	Wed, 18 Mar 2026 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fcZEYG8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2553D88FE;
	Wed, 18 Mar 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837561; cv=none; b=ET1X0E0GMywi4dFRyEp+OSX0w2YZwylTyrCYJuQq//QXKN6rA7WoE3WUx3dpoChJ4r2kG+jM4JCvpyC1aYpFBz69id+rdv82vYe9Dz50PbkrPVHJ1V1wUVutxx5Bae455Ex34MrHLM9oI1q9njmnazYI4tu8t4g9aWPx1XoXz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837561; c=relaxed/simple;
	bh=ajpz9j4PDIG86qR5i5L9xxin8pmlylEmgrk8Tz5D+Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVzDEOpBwk2LSz50LukhXPLxu5MPx3PnPEoeeu7321IAUvxZ9zwWUHq021Z5cihtzNKRNV2Q5/gBA9ozjwsqIKewyVozVG4n4nQY1IL3I4p/1bNiLUBrInuDjCCXsva1yZMo58A8fpuK9oYKXycItMURiDGExg/B0qJ3qwTsKDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fcZEYG8D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837558;
	bh=ajpz9j4PDIG86qR5i5L9xxin8pmlylEmgrk8Tz5D+Gs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fcZEYG8DcYj6oZa2FU1hLemwGfXlzzSOLhaOu4FL4dcD0pP1vyJDPjwmT2xUj6Dxo
	 eiPALZXG6fDTRTCjxTCt9h1U8g/rpO3uvkQL9ymjDrmBCrsTXLXZXmBb7DeC+tyRkc
	 AtB2nsZ6T3rocTCu9/8jk6hwwmNo2XM+TAVEk97AUkrfNLNi9+01ONA/NJ1waMscex
	 OI5JMjHlVHclezUwygGrLx1sSHGsW0yPGVMRLvObzbkWYp36nblk4J8+KkUJeDwDRa
	 Ya/uYJQ24yinY2xXBSuwPJ4sY2qpGsm2CNHOmEjMJhagisZBFLeAcROz3G4iK6FUWt
	 MSGaosIbMixFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A8617E1380;
	Wed, 18 Mar 2026 13:39:17 +0100 (CET)
Message-ID: <8c73ca7d-254c-4b89-9b7a-d67afd6f909e@collabora.com>
Date: Wed, 18 Mar 2026 13:39:17 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392
 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Julien Massot <julien.massot@collabora.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-8-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-8-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33746-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,packett.cool:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66BC02BBA47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> The MT6392 is a regulator found on boards based on the MediaTek
> MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
> connects as a slave to a SoC using SPI, wrapped inside PWRAP.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   drivers/regulator/Kconfig                  |   9 +
>   drivers/regulator/Makefile                 |   1 +
>   drivers/regulator/mt6392-regulator.c       | 487 +++++++++++++++++++++
>   include/linux/regulator/mt6392-regulator.h |  40 ++
>   4 files changed, 537 insertions(+)
>   create mode 100644 drivers/regulator/mt6392-regulator.c
>   create mode 100644 include/linux/regulator/mt6392-regulator.h
> 

..snip..

> +
> +/* The array is indexed by id(MT6392_ID_XXX) */
> +static struct mt6392_regulator_info mt6392_regulators[] = {
> +	MT6392_BUCK("buck_vproc", VPROC, 700000, 1493750, 6250,

s/buck_//g
s/ldo_//g

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




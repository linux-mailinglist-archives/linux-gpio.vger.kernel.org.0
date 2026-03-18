Return-Path: <linux-gpio+bounces-33739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFJtHgedummHZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:39:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 190592BB9B7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC9D530910A8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9827D3009FA;
	Wed, 18 Mar 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Fmltn4dE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BF1D88AC;
	Wed, 18 Mar 2026 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837545; cv=none; b=fj/gC2H4tCk/iGDfb2nPrgJYkoR+ORjdToye+pvLdkN1/Hsx5hezUgwMKdSBBzA9qu0L+NrB6GmSSIQmCh2LOx7a93J9j90Lxa95iJWW16k9mRK4I1ndPevYeRW+uqP2tW0Q/qh8SJhQ8dGxibETcASZbec1U0GFDF1CfikRThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837545; c=relaxed/simple;
	bh=lTMEWViahMYcDND1ZlHeNjNKN5UjGE3UuVMC6wdbkmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EC3DVnzJ5vk1mrBqXybh52VGe6xhQTH966irWEGldHfIZMn2qaFtWqK1Y3HNHtPkyIfY1qubBumEZ480yZo4knrntOsyuU8Jd5mdnewP7ujjDslXbnJL5K2d3Jx0FtrNKhRkUfYC7nR8Rp2qlNzefvUH50XtGkqxuIqC72yU3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Fmltn4dE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837542;
	bh=lTMEWViahMYcDND1ZlHeNjNKN5UjGE3UuVMC6wdbkmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fmltn4dEphq1GagcNAPH41VRKPdBiDiZiC3GFC1ekFi2JilZXwXnmaP46eX05Rp0U
	 uczDZtqikkE1DMTj31XinIRjbk1mT4UG06EXDrF79+6si0MopLJ8Fcp09rk1hufpTM
	 WgZEg+hRmlUTsNZc341s/x7uFgOgBpkAcnG0wVefIBJWUy0k/R/aJNI66rsacE3xoC
	 6v/i3r7uRQG2l4/G0BerPmBXlEBKTY55sNyC2DNHF5zzehuWRhyzfFpU9ekTgn0BJJ
	 YUFp+v7DY5tdS+4Kn8r/IIKUx1CXxbsuNZmZd/IImvlUI0bzRYbhILMhynO32FtTDA
	 Lle+rLAuzZv+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 742D417E137B;
	Wed, 18 Mar 2026 13:39:01 +0100 (CET)
Message-ID: <06467c89-150e-4b02-abf8-2874a4cccddc@collabora.com>
Date: Wed, 18 Mar 2026 13:39:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] input: keyboard: mtk-pmic-keys: add MT6392 support
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Julien Massot <julien.massot@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-7-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-7-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33739-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 190592BB9B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> From: Val Packett <val@packett.cool>
> 
> Add support for the MT6392 PMIC to the keys driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




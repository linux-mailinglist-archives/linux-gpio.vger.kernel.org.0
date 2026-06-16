Return-Path: <linux-gpio+bounces-38590-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EoPKIRpTMWpHgwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38590-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:43:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B76900B3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:43:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nbB3m3hU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38590-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38590-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2050C3017F2B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3195833263A;
	Tue, 16 Jun 2026 13:43:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9F2FFDD5;
	Tue, 16 Jun 2026 13:43:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617416; cv=none; b=Rsj9xfRTC/v3PFWAZTmVYZVrYC5BYCRK3WxfvwDM62EbDTDohcEkn0nBJZW2Emxr3E1zOnkz7GyOiqdQvqNHV+Y26W8PBiykSDDoqSPOGms2PiMvrF+3nQBF7WnW5guMI9p9VI8a4T75rWwZEZ9+N2GPLm0ZiyAvzuy/++ivq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617416; c=relaxed/simple;
	bh=ST2lle1KcnnwV/8PklK2xmFPsEiN1ovOB2uql/ROkUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC6VnI5+pFyLQXa7969l4v8+DA5FmgCom4yY4UkKR4pk3kf8HpLJusiE7ZxIU6GpdSwds7Pm4xHjcV59SsyLHm0I452/XPSBUQdR2DCAERSHwWJLWOdjsoleDzQmhHGzjAYWnsEvgvHmmRbSuxVH0/vTSYxpIjhsiiG7Qmg6/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbB3m3hU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0801F00A3D;
	Tue, 16 Jun 2026 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617414;
	bh=q8iDUL7W0TQmeYxpCd6HKXwGPJyYmHCMd+sglFpYlvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbB3m3hUDC1grbUUzhtcl3F2bp9B05pmaVgqTc0TdCizZL4tT2ccGPTgm7LgN032i
	 Qy1vIIQ9Kz+3G2zNDUFggwOIe2HemGDDfQwBRxIyAzYQHanjtp6ribGBv7iZniToS7
	 AwgTQzHyAkvmJiHSPllY1D2Z014kz+eLivVu4EvN1fN3GFxBdlVzfkJFc7WmqkPGzm
	 KrCOFwoETXL6cN4B9qA8wzzOVQSTLROLxiS3C9n4atqef9vSelS0CQGINxmrvmmN3s
	 IBw8MYRXJk11S9TuqDc9dK1mYQoPPJi8OAo9Lb0o3xri7dbI2mq63CYYxoFTckerqX
	 4Y3+TRA0Ijs0A==
Date: Tue, 16 Jun 2026 08:43:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-kernel@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Sen Chu <sen.chu@mediatek.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <178161741195.2350422.8190069791847704503.robh@kernel.org>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
 <20260615071836.362883-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615071836.362883-2-l.scorcia@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:lee@kernel.org,m:broonie@kernel.org,m:linux-input@vger.kernel.org,m:linux-pm@vger.kernel.org,m:louisalexis.eyraud@collabora.com,m:linux-kernel@vger.kernel.org,m:julien.massot@collabora.com,m:macpaul.lin@mediatek.com,m:krzk+dt@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:akkun11.open@gmail.com,m:angelogioacchino.delregno@collabora.com,m:chen.zhong@mediatek.com,m:parent.f@gmail.com,m:linux-mediatek@lists.infradead.org,m:val@packett.cool,m:linux-arm-kernel@lists.infradead.org,m:matthias.bgg@gmail.com,m:devicetree@vger.kernel.org,m:sean.wang@mediatek.com,m:sen.chu@mediatek.com,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,m:akkun11open@gmail.com,m:parentf@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38590-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,collabora.com,mediatek.com,gmail.com,lists.infradead.org,packett.cool];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC1B76900B3


On Mon, 15 Jun 2026 09:16:07 +0200, Luca Leonardo Scorcia wrote:
> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-gpio+bounces-39376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oU1NOIqARmrCXQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 17:15:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 711556F946E
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 17:15:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HUo7JOYa;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39376-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39376-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88E3C3027358
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81159353A93;
	Thu,  2 Jul 2026 15:14:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC432B981;
	Thu,  2 Jul 2026 15:14:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005285; cv=none; b=aeZgPsMEr9LBPF48peGUuShJg8jJcWNXIxQoFXnf8xIMP6zW32GkRVXLUj0e+ytexoj0LYykk+D64t8aN7NvJcIu+GcN9qwdnUGVrvi0Nl5FJOboaoWomARHNR0ozy4wrf0j3KRR3L8qAeTejG1v2IWCCL8BxkeOmkofg0ZchpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005285; c=relaxed/simple;
	bh=d2YVhtbaFzSgYBANw71BSYMMHHk4SZ1Y76sHIatqV1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCMZAInsOHZcFmsgTcvCEfXU5RBXYinMbD6aEoUJkDTEFyb3NPLLjYJWBiiaqE9KUdZuMyn+SFIiI7TeSSzn9MfVaJD0bkitECgpnmpoZT0kU6KCJZwf+rmIUAwOVIG5f2B1OVSIwH+rsjt16AR0+GusVlwZn+4pdMG3skRZvcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUo7JOYa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A251F000E9;
	Thu,  2 Jul 2026 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005284;
	bh=c3jiJOSpZWo7w985LQh4Y0OVG7Wd0IptXa6TBfu7SkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HUo7JOYaEFRyzC9WdCBlCVlgDUpNNKf60fUSfKcmOEFfPx6Gx/TIWQAqNaTgJ6l95
	 s5d7UbA2rhO7yf1OJWfXmqRbEwUHh1HnVQAz2Y6AReUm2EsqWMUDsXogc1B/cSOmZT
	 b0ZygJ6FBQJf0LlZ+3TSRNuxTcyx0QQj47zR8yUANchvZx5BArgFp3liFOTvhrSvBu
	 mHLHeDFfxw2YKCn16UpvqX4MFOYxEGGYjCoJiYXpUXNT86DCanxssuXq+Ei+I/0B0b
	 Vuo9qq1SewwmZlNtoNtYxp6f91VkU0YZdAqrkBZ32Q7yEYqjzZM7VrbUzHh4AD2Vv6
	 yH01KvWQjWDFg==
Date: Thu, 2 Jul 2026 16:14:36 +0100
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 0/9] Add support for MT6392 PMIC
Message-ID: <20260702151436.GS2108533@google.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:louisalexis.eyraud@collabora.com,m:val@packett.cool,m:julien.massot@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39376-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 711556F946E

On Sun, 21 Jun 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

The MFD pieces look fine to me.

I'm assuming this will go in via MFD.

Just let me know when you have all of the remaining Acks.

-- 
Lee Jones


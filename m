Return-Path: <linux-gpio+bounces-38589-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /qGMI+lTMWqJgwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38589-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:47:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258B690146
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PNZUueQn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38589-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38589-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 134553094FAB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A9B330678;
	Tue, 16 Jun 2026 13:43:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA7212D7C;
	Tue, 16 Jun 2026 13:43:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617382; cv=none; b=uqrERghjx6mKyahtsiU/8dFyXp2UGHTYgLBMBy3YWpBJGgWYDmGj2vZVqt6ecPh+U5bTaOxkKP8kFSgJ5Q7d1LyK/+mbOBL0F+nsYowbHShOJ5pCAinkmrAxorsWjOvn1phBRsja/MI4dGmDLG/AQpY63s49DRqvUDBMKYRbv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617382; c=relaxed/simple;
	bh=y15Ipf+iIGRKuRBcXNk+ZyGkGCPpvE+tgNuodC+FHrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGbh31oeUJ6k1hwO8pMRvFXPQsoOMFzOGNw5fTAvhBQYBiPzXVBa8pTTVJPEjIBv31uzRMK32P3YDnJqTUGJLirKuWFL4LTAAjxxQJqpERlJvadbvQaOrBkYpOVYr+Wr3SIezCgMJokKOjksTSBYuoPi3KQQA1qFgB1SGhUWcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNZUueQn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF891F000E9;
	Tue, 16 Jun 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617380;
	bh=BlUDip4GcgFnSaDcETbB3mXqYyAfrmdK96aHUTtbFQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNZUueQn/N4W6+A2fF7S/sYZIxI8SXTR0Skm5X8h8nfTGlv84Fon2rm/DtaEJg3r3
	 e16LAo5QpqSa3Ajpzs+d+SCI9WeuNBJUWrsVKuRHRyhUesel17fQLiVEbVH0wfilSI
	 Gu+jftp3/UFCJbEzSXLg0SlyZj2XB9n2nnNHlyUDLwpll50BNP6PrRqa/VzW7Q+Kli
	 rPBmDSDe19h5pP3/eJaX273BzmG0LLTdaEDdi+pf1aF+viiZ1gaGBSmZt3/aEihk2e
	 STt9qq3EqUxMY4FxceCxgs63/XTLTB+pgnPPNJmt/3i7Pp9wnaryNn8ghYX57fvpym
	 fQTpXQVmghpbw==
Date: Tue, 16 Jun 2026 08:42:57 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 0/9] Add support for MT6392 PMIC
Message-ID: <20260616134257.GB2335264-robh@kernel.org>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:dmitry.torokhov@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:val@packett.cool,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38589-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3258B690146

On Mon, Jun 15, 2026 at 09:16:06AM +0200, Luca Leonardo Scorcia wrote:
> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.
> 
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.
> 
> These patches enable four functions: keys, regulator, pinctrl and RTC.
> Mono speaker amp will follow later as I need to work further on the
> audio codec.
> 
> I added a handful of device tree improvements to fix some dtbs_check
> errors, added support for the pinctrl device and addressed the comments
> from last year's reviews.
> 
> Please note that patch 0006 and 0008 depend on patch 0005 as they need the
> registers.h file, but belong to different driver areas. I'm not sure if
> I'm supposed to squash them even if they belong to different driver
> areas of if it's fine like this. Any advice is welcome.
> 
> The series has been tested on Xiaomi Mi Smart Clock X04G and on the
> Lenovo Smart Clock 2 CD-24502F.
> 
> Changes in v7:
> - Removed patch 0008 dependency on patch 0003.
> - Reintroduced the regulator driver. In earlier revisions of this series,
>   it was proposed to remove the dedicated compatible for the regulator
>   device [3]. The driver does not use actually it, but it is not possible
>   at this time to remove it from the bindings since it's a required
>   property.
> 
>   Making the regulator-required property conditional was NACKed in [5],
>   with the suggestion to create a separate binding altogether for devices
>   that do not require the compatible property. I tried implementing this,
>   but since the parent device needs to be declared as compatible with
>   mt6323, it leads to a warning in dt_binding_check since mt6323 would
>   be declared as a compatible in both mt6392 and mt6397.
> 
>   In the end the only regulator driver from the mt6397 documentation that
>   still declares an of_match is mt6397-regulator and it does not seem
>   to be necessary, so it should be possible to remove it and make the
>   regulator compatible optional for all regulators, but that change would
>   probably deserve its own separate patch series.

I don't really follow what the issue is here, but compatible should 
never be optional.

Rob


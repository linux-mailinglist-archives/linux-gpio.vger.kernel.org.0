Return-Path: <linux-gpio+bounces-38125-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dD9xI6M7J2rwtgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38125-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:01:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E400B65AD90
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:01:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lAIgMewm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38125-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38125-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 807A23072573
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 21:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91E33AFCFE;
	Mon,  8 Jun 2026 21:56:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F38439D6FD
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 21:56:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955783; cv=none; b=mHI+1CibWRxxPbZ17rMwZb10S4cSmd+1BxDvplTFY7XwVtFXW7ZkYDkpsJbTi2FLx9kVG/xZHnZbK7A1rPHtzNMThlhb+3U21LrZVKitKcfHpliNsbAzRDzP/5UliYf4REWvBgzHfYyEqK1fOTup67RFx7Fd7bIzft13+0EAY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955783; c=relaxed/simple;
	bh=0TDTgI6ajCuMM2ET04h05guwpbF+9TqbCtf0yb5X4O4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrJHfJWruKymbVQNo2uAS4uosbRoMGlT3k2qjI+qYwKmvtQ/pIQbSnIe4v1jackFvC9HSZ7Z5VK+w6iFvCpvYujkE3grPKA13bjfxsHjbQd6mRMs6EQqncQHnidHkmycXOdb0U4MRzUOEDfindSNJt4rd0zd7IVHBJUuL1AYUbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAIgMewm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691F01F0089F
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780955782;
	bh=0TDTgI6ajCuMM2ET04h05guwpbF+9TqbCtf0yb5X4O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lAIgMewmy2AqrOVitnE3g9ROOWy6QFMGahxL4x3X7AiV48Y1UoVpFJDP2+8f3sQlQ
	 bidlXC38fBDBzNMHM9EpBriCsyujrcWYkwZ7+Pnqu0d74mwIKoABVhELattqYP6hdA
	 wHWVHVyrNBHSNMfy0ZeoBBG5RnH/DGAcfMg+0whFVCW0mFBCVD9NW2VkuZpWdcfGyr
	 eo5ZVAWVl4qWeZTT1SoIG50hnNAbkN4228k1svyNX2pXkIn2kiNiQ44qbVn1MvucV5
	 ECAHPP6gBC/GcVy7AiMWI0QIp99nwBTKQT+4vyN2POXnS+VYzZbmzZGJz3KpNG3lEc
	 HZjcNQmMENbgA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso5053218e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:56:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8xwfON73E1xOLygz2BgaO23FvbC7IEqNGL6Kt77RODZuZIAUiEuTta/pl2nVNEQSKiuGnyoAJj7Bix@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++Wu/yCpleXMWGzemCcPaWj1r2/m01l+L4aEbStIhtfX6+GWm
	o3RO+SRg9KzYdzO+eBWJC04kxam5x0h/f5e/MREmgP4V7DbrzYQChHRkpxnVh/pNJFjmgm9HMMs
	fIxYz6L+V6eInlLxodE3CI2LKuo76wjQ=
X-Received: by 2002:ac2:51d2:0:b0:5aa:6a11:3a29 with SMTP id
 2adb3069b0e04-5aa8865d774mr3483769e87.3.1780955781186; Mon, 08 Jun 2026
 14:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531162340.5326-1-l.scorcia@gmail.com>
In-Reply-To: <20260531162340.5326-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 23:56:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+5N53QkGppboN+e4YKa4=proo6PJxrbEUndCtB=zAJg@mail.gmail.com>
X-Gm-Features: AVVi8Cchkr8o6T0GxWTVM7rSwLob_b-bRRivY5EIJqXqcLMh2ZhFlagIXrN1y7M
Message-ID: <CAD++jLn+5N53QkGppboN+e4YKa4=proo6PJxrbEUndCtB=zAJg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8167: Fix Schmitt trigger register
 offset of pins 34-39
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,collabora.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38125-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:sean.wang@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:fparent@baylibre.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E400B65AD90

On Sun, May 31, 2026 at 6:23=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The correct Schmitt trigger register offset for pins 34-39 is 0xA00. Valu=
e
> was verified with SoC data sheet.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Fixes: 82d70627e94a ("pinctrl: mediatek: Add MT8167 Pinctrl driver")

Patch applied.

Yours,
Linus Walleij


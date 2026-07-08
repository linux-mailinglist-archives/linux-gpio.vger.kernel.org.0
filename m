Return-Path: <linux-gpio+bounces-39680-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QzODGBaMTmrBPAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39680-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 19:42:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C157294D4
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 19:42:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GVDBTL44;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39680-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39680-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2715305530F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 17:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3594C0419;
	Wed,  8 Jul 2026 17:38:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EEE49550B;
	Wed,  8 Jul 2026 17:38:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532328; cv=none; b=h89Sbv5EhARax4sa+fS4INA8Hobk/pbcvdtHQQoIPn81xYpRxbKf4BXojTE7RhO4AdI8V7UHJ/r3ZpKdh7ceeX8DaYV4afn9xYzqDh7bKFq93rb5LpxbyIA3X4yiHgNIhFKK7kRwiElQIYsoT4Z6c2iZAs5Hy62M8XwTHXvacA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532328; c=relaxed/simple;
	bh=QnqiApG8RE0444sphlQJTrJsaBejkuQEnHtkQYn2BLg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YfzQTj8M9TgYAVpCN4lSIW+aRvaqVgi1qlpBkBbuWuhE9f0sLPvvpwouY2xbUwhYF490OLdi6/WMlaat+Dm9aStfhQWjF1VOmaV3wlwVcyCTmezGKWpXkJORuWQ069Wa+3o9xNQu5VyjReNAIiy/dmThGZK0k7VVfhKPVxnvQlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVDBTL44; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D74C1F00A3A;
	Wed,  8 Jul 2026 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783532326;
	bh=9V10ZeP0GQsP4iVy9VhSI/lI04caCn9a45QxaUqe0d4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GVDBTL44OP6LCxySK26ft2Tytx+EtFDjg9GBcLEPtmPXNtO4nZrkUiCTksePT/rh3
	 9R4pClvgn9g+HVbv1etI4tL1gUwaoPzNHjUNqgktAKydRY4yACmbneBzRedMNOoXh3
	 qcjiIUT56Rh3exJv5P1IK6WOUqRgFR27VqdiobA3IdVLmf9IGjgIzmgnfFIhQb8pF5
	 PgvP7Dw1y+ZVS4qWTi3+aUZXiA7cEJUB9IJP/yqXSgFC+8NcBqD/OrQ/Auh56PXkxT
	 wAkvhazebXOv6ZkfdfmY+cjIPBzNB2lSg1kokiq9GTohZ1a8k5ZEI/29yvL1RQOrOQ
	 3YxpvjCzYuDhQ==
Date: Wed, 8 Jul 2026 11:38:44 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
    devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 9/9] riscv: defconfig: enable ARCH_ULTRARISC
In-Reply-To: <177995553472.929162.16657480414876825285.b4-reply@b4>
Message-ID: <d23703f7-29c3-c1f9-6f6b-80e155c56746@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com> <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com> <1b822b1e-cf1c-45c7-8109-3e0330911419@kernel.org> <177995553472.929162.16657480414876825285.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39680-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[pjw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:wangjia@ultrarisc.com,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linusw@kernel.org,m:brgl@kernel.org,m:samuel.holland@sifive.com,m:paul.walmsley@sifive.com,m:palmer@sifive.com,m:conor@kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4C157294D4

On Thu, 28 May 2026, Jia Wang wrote:

> On 2026-05-21 22:57 +0200, Krzysztof Kozlowski wrote:
> > On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > > From: Jia Wang <wangjia@ultrarisc.com>
> > > 
> > > Enable `ARCH_ULTRARISC` in the default RISC-V defconfig.
> > > 
> > > Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/
> > 
> > Drop link, not relevant here.
> >
> 
> Will drop the link, thanks.
>  
> > > 
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > > ---
> > >  arch/riscv/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > > index c2c37327b987..9fdc4d1831ed 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -32,6 +32,7 @@ CONFIG_SOC_STARFIVE=y
> > >  CONFIG_ARCH_SUNXI=y
> > >  CONFIG_ARCH_TENSTORRENT=y
> > >  CONFIG_ARCH_THEAD=y
> > > +CONFIG_ARCH_ULTRARISC=y
> > 
> > This patch should be sent with with the patch adding that config option.
> >
> 
> Ack, will include it in the same series as the config option patch.

I've pulled this out, dropped the link, and queued it for v7.2-rc along 
with the arch/riscv/Kconfig patch.


- Paul


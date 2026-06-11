Return-Path: <linux-gpio+bounces-38350-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uuwuD52+KmpOwAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38350-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:56:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C36727F5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 15:56:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NwftpBK5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38350-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38350-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EB8C3003809
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A3340682F;
	Thu, 11 Jun 2026 13:56:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A63DCD87;
	Thu, 11 Jun 2026 13:56:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186200; cv=none; b=PpQI2wCqx81zMvoV8QxmaBh2+AzNCuvL9vrG8yVTyjRKHidF0W+EylOnXU/5x+U/9b5Dcf7c3F4iIhtmd32OqqBoBYJ5moKnR00sWJEJ0TkIOuFgkfhYso7E2ZRJEASVJocGhsslQoIKAiTkKSMnmjrCWvdGVsibUu0iTgc/fqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186200; c=relaxed/simple;
	bh=JAE5ZVkLHEfGEU64Jj1x/kDtLKxcTsw5P5qF0V67EFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cLcrO9PbJcveBR8Qz7gGWvNY4loxqYSxtiGgf2yUj6ZXiTRq5gVuYNahDdPsmGtxKA/I9oGxczufUJb68wAlMZCGtYwXAmmM9+JkSwBRDNIVup3aSGF3BzycuShJQPfF1PfMdeQY+xMALqxRcSSXD8Cgo4NY+PxadaVWGC4De38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwftpBK5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789761F00893;
	Thu, 11 Jun 2026 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186199;
	bh=Tm5i8T8VZHAsFgDZmgdDx63OEi2Pnzx5WTlvbhLyDEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NwftpBK5CQsrefCUB/T7Xk7OemkFlvqXsHpPq927dHUF7OJ0nwVGSlO9Gy8oeGDoj
	 SaLxy8dEs/2skmWCirbLljexcSYRhqfr0IppnxanbAc2wXh7m4mpa1iUXJGjX7vaXU
	 NjIbYIBD9W2bGxRdp+F2Ae2Y/Wn3Hh5xtftUGKrRcoiI9vGwHjNrkGV6Ymi9WZut8Z
	 0dhBKq0Ws0g6bXU0yuCLWoiQm3nO0XpmSAAydBKihgiq2bXHLEtDBgeT7AKcTqR+OG
	 I7z+wzMwZyV0EH+P3OW/fjBUGVAwdi50d7xJJQGP0N2B1CyjtTGbSlSd+2wBTrUzlF
	 sAv/TuyPpayjw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ
 operation
Message-Id: <178118619718.1357770.10179454069567879597.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:56:37 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38350-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,arm.com];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:andre.przywara@arm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C46C36727F5

On Fri, 27 Mar 2026 11:30:03 +0000, Andre Przywara wrote:
> this is the minimal fix version for the GPIO IRQ operation on the
> Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
> which is a major annoyance. Those patches here fix that problem, and
> should go into v7.0 still, if possible.
> I dropped the more involved fixes from v1, the risk for regressions is
> now very low:
> - The quirk flag is just dropped from the A523, not the other SoCs. I
>   confirmed this again with an experiment, for both the primary and
>   secondary pincontroller. This avoids fixing the workaround code for
>   now, which is more involved, but for now unneeded.
> - The DT patch just adds the missing interrupt. The IRQ association was
>   always wrong and never worked, so this can't make it possibly worse.
> Together those two patches (plus the required binding change) fix the
> problem, I would appreciate if this could be taken ASAP, into v7.0 still.
> The generic pinctrl code is now untouched, which makes this also much
> easier to backport, and drops the dependencies on other v7.0-rc fixes.
> 
> [...]

Applied to sunxi/dt-for-7.2 in sunxi, thanks!

[3/3] arm64: dts: allwinner: a523: Add missing GPIO interrupt
      https://git.kernel.org/sunxi/linux/c/6b81aa0c8a4f

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



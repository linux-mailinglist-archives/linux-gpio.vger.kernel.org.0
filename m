Return-Path: <linux-gpio+bounces-37584-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N+9GVbwFmpcxwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37584-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:23:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C62B55E4E07
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88B2D3054FC5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 13:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967D040C5CF;
	Wed, 27 May 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7WnMQxX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1021A407CE5
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887797; cv=none; b=t4fFzPCg7f5waaBL7nte5dj8s7TWogSJc5suckqu8ONIgYXPl2vwSit2DPdawj2i0bXo0O32KhNTcrLGUDDs3ztHVi3B8d/RJ2ItkGewjPd6feRI5D8z7vhIG9tNItsr+gXiLhw1sAJ3sdRHnsCQOnog9oZ0xR4Y/DbbrlT8W8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887797; c=relaxed/simple;
	bh=vL4NlyK6MPiwhS/+QILyLISkt+l2RWDPpZ3wIG7sAs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPbj2e6udM4NZtXuesPrzfjgV7Ny5zB+hUxCw+hhrB8G3Dh6/PnoI1SDYB3RYX2O51WY8KOcNT9p4uq09man7zdDdqWlHgj73Kxt66X4PA7rdNvrUnFIuugv3HoD3x9VDKT9O/cr6k9CnNlTl8KSHlfeWxE2fyfa7LBKR4j00Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7WnMQxX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9EB1F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887794;
	bh=vL4NlyK6MPiwhS/+QILyLISkt+l2RWDPpZ3wIG7sAs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h7WnMQxXODnPy8Wm6rKm/4cpE+nxrmmZUQjVuXFnmZWOmIygeMf6qRYtSRXIycAvC
	 D7k5T1hyoJ6Fk4iHvcq4r+d1exmr9bAXWDT03VpBJDKHqkMSor9QguN17ci5lPGV8d
	 OeDNdQhf9wdJDtecUlcqIziAfQvaClC80pimY5+WhufVTGK2jhYm+DP+y/qK9SbGGW
	 ANdJ017mux9kVOcS4EBpF4qEBzr4pFsRSDZJOzS6s1bKB4FblqbrYLLEyuPwffsw3Q
	 SjWzzySe6Uot57sCW4J/rmHC55UvnPKlxjeea+38mY785Bn8In/X0Rn9fs1vUqZRxz
	 fW//eLd4HdSMA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8721851e2so13092608e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 06:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9b+irrO6bOY6Kt1P1Mr3AvYI5XGflzcTV0ZLpIeVwI/7ULaoqsII5Fm1Fizqid8wV3iZGyvUnvyh58@vger.kernel.org
X-Gm-Message-State: AOJu0Yww34dBhwJ9ncNipa5g7fGHDk/HLzqwVstzlA1QZk6VaoArJXm7
	US8zta1MwAKh1Qxlb/geqmQrKIjGS12DN0Z4+mIVeiEzOBz3IcF+nexnrqEAaKyZGuV/SKFzcyU
	LQ9pvT4guWxWyiHgbUvbGcRwo+KA3hYE=
X-Received: by 2002:ac2:4435:0:b0:5a8:e61c:371c with SMTP id
 2adb3069b0e04-5aa32377c91mr6204628e87.26.1779887792892; Wed, 27 May 2026
 06:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511183017.228595-1-kmayur809@gmail.com>
In-Reply-To: <20260511183017.228595-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:16:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTW4R=d0Kb-8zVtGLRHW2xi-6Ya0ii86njQyO1Us5xpw@mail.gmail.com>
X-Gm-Features: AVHnY4LXQhHna9KsXNe5wSmgS-A9cyLoUH6bq0dDmcU4a9FEAF7f5O6WXxdpc3g
Message-ID: <CAD++jLkTW4R=d0Kb-8zVtGLRHW2xi-6Ya0ii86njQyO1Us5xpw@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37584-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C62B55E4E07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 11, 2026 at 8:30=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-mtk-mt8365.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij


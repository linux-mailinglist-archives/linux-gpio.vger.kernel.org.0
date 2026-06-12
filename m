Return-Path: <linux-gpio+bounces-38388-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qP8YAsqGLGpkSAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38388-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:23:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F467CBC0
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aiR7H8Qq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38388-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38388-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED0DE31300B6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266D937EFEE;
	Fri, 12 Jun 2026 22:23:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D693D25AF
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:23:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302981; cv=none; b=kyEYBcWynoDVb5J8Dhhd7RKQqVy4e6K2lAsoVtgvSGGXiqkMJm2Di+bPfgKcFjHUGVyMBzJIYSxLJhAr7+eBAoGg/Qe1XiIS9JPyDxVHo/yVzSr6qntDy7TyTYBeDK/438Cw03U07XX0JA6fj+iWe6LQ5g5A5Y4BIAinjW80mNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302981; c=relaxed/simple;
	bh=vABprRdHi0+jMSnKJHgOu7qPrGQgpls9Hi+j8cLzctE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiciKNDqFDEw0ZQszbgcI/cyZ1aqEgNSRoT2TgGAhx3J9b7pQ1HNDfPiRaajyHI8zR6WIayO12GCpvz2+v3hCxvHmlIbGDC2Eb9Axaafrky6xIQ/8z7VuOSkGT9Pcfne+DELmf64B1oHlQKj4uFxje/kVTx6qnhwKLjGm849abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiR7H8Qq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B581D1F00ACA
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302979;
	bh=vABprRdHi0+jMSnKJHgOu7qPrGQgpls9Hi+j8cLzctE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aiR7H8QqEcmIZig0yc9a796CB/vlfHlamkRhrEZqns0LD//voS5rIqkf2vgSITXwL
	 lqmlFfoKK+zs0uMszJ46WsPVcojNgTIWU0IR99Bxb3L4SNQt7L2x9h77XjOuUfFARl
	 iqGr6s7YZQOtoND5ewAgLO7Aadl8ajVK7OQPd0cGv1sv3Xga3LKyZ5qxOZNKqryu1Q
	 +TQ54C8YUEhMgnN3YdKPTqZz/n/aW0kB336olU+WrrBVy44ANJ7vk/c7eSOZHPiY5g
	 sy/B9kVBOibRJ/95dnzj/qoV9BYgkpuCNL5gL9qdOS9ODFfUDYTqFQBgb6sQUtiEy1
	 grdI7ogVaFdhg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso1540185e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:22:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/S6X72JsYXv0Ln2BK0+rGB8d4VN5yatsU+EqIZLsVbDCTkm/9rRcmWU+LW4Z1AvJi0GJJdTwcc3VIi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8wu4tLuHIgHs0QDyPnEq1naKTO2cX6Ruoct5G+t8pcl6YgkAz
	RzykpewTYciiU/HpLlCOJWcipm1hA7DXDJ5ras40kfOim0mIWMJ7vZL5wfvDLmVmYfVjklO1rHB
	gEe2rzonMVQT0LZyiRmAj5U+4drCSK6E=
X-Received: by 2002:ac2:4895:0:b0:5aa:6d0e:9d2d with SMTP id
 2adb3069b0e04-5ad2db3aec0mr1112788e87.20.1781302978525; Fri, 12 Jun 2026
 15:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612214939.1883911-1-robh@kernel.org>
In-Reply-To: <20260612214939.1883911-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 13 Jun 2026 00:22:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkbPN_UKj6bVA_jvRFAaDjEKtNo8fKZGDqnym+BcmeKrQ@mail.gmail.com>
X-Gm-Features: AVVi8CepGFY0snqvsoBINOTrVOumoNZcMuGaGS0hHzSaIpqAZRiRaNAz0dBo-S0
Message-ID: <CAD++jLkbPN_UKj6bVA_jvRFAaDjEKtNo8fKZGDqnym+BcmeKrQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Match DT helper types
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38388-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 451F467CBC0

On Fri, Jun 12, 2026 at 11:49=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> The affected pinctrl drivers either check for the presence of a standard
> property or read a property documented with an 8-bit cell encoding.
> Using boolean or u32 helpers for those cases disagrees with the binding.
>
> Use a presence helper for "gpio-ranges" and read
> "microchip,spi-present-mask" with the u8 helper documented by the
> binding.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied because good fix.

Yours,
Linus Walleij


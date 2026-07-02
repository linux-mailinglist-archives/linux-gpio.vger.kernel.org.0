Return-Path: <linux-gpio+bounces-39351-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4DXIFkodRmrbKAsAu9opvQ
	(envelope-from <linux-gpio+bounces-39351-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:11:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2FF6F4A21
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S6849HXj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39351-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39351-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5393144533
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 07:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABE73D524C;
	Thu,  2 Jul 2026 07:59:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD13D170C
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:59:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979197; cv=none; b=f6UeUoO2xjZhIphd7+v/btLHMsSCfYSng6QFcEVzcs1GoMDGO5Mc4dRP71CaP2SzOXrgRnMzWdCG50rBHPfWvRsPxu2Y9cjrzPodyS2fCFh2NZMnX0BFQyzQC6MzecrGCrvfuOS3R1IKgGmplJvGDevwqnqjnchKVIqeTXfLrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979197; c=relaxed/simple;
	bh=+pOyUj3j+WJbAk+4QDGPQikSBUBnu5OmWPd6GlRmAic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/Q7XhhLiX3rsbALV8/fc5lKwrRWGRq/yazVOdCm1ORi76TmB3SEKtM4cBTT2cgCPWa/DydhArE9vaSnz8XiOdPTaP/qTaC6iRTH2B+GXdj0BDNg/5eJoSZmAjiO4XDx0ubxHOVfOgm2lTSD1TchjFdUAP+23ezmtOXQyWE5KTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6849HXj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4151F00A3F
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979196;
	bh=1h+3Fpyke2tX7ZFvdKHeQ4JdNdIQdnDKWaAKP31G/a8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S6849HXj9O8LKKQpSF70YZh+9LnvgLiloLIXi3sEDCfC+KICtsoGW3N0tkxc5Q/jJ
	 clOLMlBFcOTIWDnfiVrOkNyUXMduvxZLZ29m2iHF/b7TazlLMBXWn+SerOBlGmdViH
	 rckRTbr1lq2FcoCBZ4jxxxCNBDjej9tsKf1I/S0zA6WNEv59Brhfi9k1nn3QRheH3b
	 zsH4CD6rfskE90P5QQ6z85O5EojsIFh4dBgaz9BfJQ+4fEyoFO5fPxc7j7tNE3dHWx
	 GtLev8wny4rNPOTrTJim86RaIPoLmLZKYxNQhWErp1ikuaDakAXxP5PBM7cIQll7Ex
	 OnoAHNztJ8rKg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so1237896e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr+aHYkCQyU2yiNo+j2AuZ8/tnj34xILghARXvMqVEwqkrYTHJj/EaXY6rkwsYDtAI9gbquFpq+dKn6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4WQz4TZdr4Z/JJmoZqYK6B02tN5qGZDrrE3hZyNUS6Xs78uPn
	w2UbYJkf5xRkXmS1gIgF345SzYEdhdJWesW6DnToVI9ORyF22Nad5sEcwmsxckvA3ndwpUgp6zT
	AOYax4fQfPZHQ8It+ayaBU2tM59imct0=
X-Received: by 2002:a05:6512:6482:b0:5ae:a3c3:f123 with SMTP id
 2adb3069b0e04-5aec67aa697mr1289406e87.25.1782979194864; Thu, 02 Jul 2026
 00:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-4-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-4-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:59:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLkOspcOBG9DU+OD-++M3kNEviq7pY109Pqpd6V=RoKUEA@mail.gmail.com>
X-Gm-Features: AVVi8CcU8tKaRId_dejrARm-i_U9g0OluvkGMZwVqH98hTd5N0_d2-ckQ2U3Yr8
Message-ID: <CAD++jLkOspcOBG9DU+OD-++M3kNEviq7pY109Pqpd6V=RoKUEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpio: nomadik: use dev_err_probe()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39351-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:theo.lebrun@bootlin.com,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF2FF6F4A21

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> gpio-nomadik depends on a few resources. In one case the reset is taking
> time to show up leading to a boot log containing:
>
> [    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -=
EPROBE_DEFER
>
> Fix by replacing all dev_err() calls that might be made at probe with
> dev_err_probe().
>
> On nomadik platforms, the nmk_gpio_populate_chip() log calls might
> attach their reasons to the gpio or pinctrl device depending on boot
> order.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-35648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCJIOrZp8GkOTQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:03:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B847F8AA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59553305A452
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 07:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB534317163;
	Tue, 28 Apr 2026 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6We98Hu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F4313E07
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362977; cv=none; b=DL4Ze/x17uAiqwa7wMNnElsD9JemZZwPUPNEuVBC7Wqsth3LnHbwek/1Dh0uB68j7Nvsq4g9uc1vOoDMxnwTb8+nCqAT+304eBh1TP91vN9VPZb9v3Q7DI807AJNye02OUS4XdLN5o0KdLGHiwI/r6+9sMVtq74xH3/calGl12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362977; c=relaxed/simple;
	bh=mONgEit9R4vFoFOnQs/B2jlcGJaczQDqVeFYi/9tOPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkjoL/geuiI/jMqkRcIWZ5PQ7WE1Fclotl/3tVWFfC1/pQp6xfqm1CsDJHbTakx9pe/YoztR/W9DCY1nClMuwtF9qTLSzw5alHaEpzTMsi/iGYSJqo+eZTVhg5RK5cHRU4reW0Nxi6u4UYNjJoOsXCJiLba6Tg4ATcyzGRE8Mso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6We98Hu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CFBC2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362977;
	bh=mONgEit9R4vFoFOnQs/B2jlcGJaczQDqVeFYi/9tOPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o6We98HuIasKWwwFlYwhX+BKxoUqi+zrJsC4aBmIZXLt3MH5sAdknnwoyflkpsCGM
	 P1Q9FVIucai16wlwGsICKWarGHDUcq0X8CbbQL7qyp3JkqyoxdnrNR+JEAa49KNaNb
	 +6wcFimWW3XNhkuPuI2YYwg55t/Sg7zHRyahY7GzK1uwd4KN86nP12acSd/GJRwukc
	 ap7W+ZnZ0+48t86WUh+rDfdN+X85rL7Vi9k4rlXprlZ18Hn4LY7YVa+rwjABFMD7w7
	 a1li2Sq9K9MMznS3uz57789JRz3a/pbc2m+TikvLx+Qd+h+WYuBk3yz8usk4un+C4u
	 jDqTcxoz8NtKA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38def541b0bso95265491fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 00:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HCnRXnctiLU6OEFY1Xlxf8ACr+dBaMijy7hBu+RIqwmOVKQ97qiPrUHqasm0SHUEUt6luI9i/YiFG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0B70kUqoAHFATZzC2bmAp0YTAv+uBs3WpZg66Gz0o66iKbZX
	1Tv9OJXzXnpxaEB+cguY1d6X2hxkZCCh/uyJivoMBI7aQK7YrCpLWw07W0dx6GTNI2KZ51eFExD
	gKgGyITTfesEUvHgte4O+HdiVtT/sHIA=
X-Received: by 2002:a05:651c:3252:b0:38e:2822:a264 with SMTP id
 38308e7fff4ca-39240ceb8dcmr6535031fa.12.1777362975988; Tue, 28 Apr 2026
 00:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
In-Reply-To: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 09:56:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-oJuFzDODKnJ+cdxz=SgorAQhSTcJTVQkvnheH=xNPA@mail.gmail.com>
X-Gm-Features: AVHnY4LwETjjfhphkxYPHWzQ2Lf-bDt8NZvOiGfchSau94jYf8YV9Ei_wqqQVfQ
Message-ID: <CAD++jLk-oJuFzDODKnJ+cdxz=SgorAQhSTcJTVQkvnheH=xNPA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ixp4xx: switch to dynamic GPIO base
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AD4B847F8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35648-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 11:43=E2=80=AFPM Mohamed Ayman
<mohamedaymanworkspace@gmail.com> wrote:

> Most IXP4xx platforms are Device Tree-based, and GPIO consumers
> use phandle-based descriptors rather than legacy integer GPIO numbers.
>
> Audit of the IXP4xx platform shows:
> - No gpio_request(), gpio_get_value(), or gpio_set_value() users
>   in arch/arm/mach-ixp4xx/
> - No platform data using fixed GPIO numbers
>
> This switches the gpiochip to dynamic base allocation, aligning
> with modern gpiolib expectations where GPIO numbers are not globally
> fixed and may be assigned dynamically.
>
> Set gpiochip.base =3D -1 to allow gpiolib to assign the GPIO base
> dynamically, avoiding global GPIO number space conflicts.
>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

You're right and you beat me to it! No-one is dependent on the
fixed GPIO numbering for this platform.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


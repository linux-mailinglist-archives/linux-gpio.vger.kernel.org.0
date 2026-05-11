Return-Path: <linux-gpio+bounces-36608-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP9XCVg0AmocpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36608-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:56:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D851554C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EDE3010C12
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9551537E31D;
	Mon, 11 May 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebK0Sbdo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810237E2F3
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529222; cv=none; b=LiyEHSevrCYAL5nYzn44UDSTGnnD/B+kYToxcBpjEK4dWy4dqZLsA6bbIlRn1IQ5dLbaLiQ59HOeILvQKCF+DxdWTUaf9cTDtqTeJGQEg6wFQrmSJS5doLWYZPehvWEmQlEsbFQjjZgopSOYUMWwNKTTNYgcgcOd89/p7urXubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529222; c=relaxed/simple;
	bh=AkyUvnDjUVwu0ehRW6YmoRYu0TitM06XZpADJOqlSXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4iJwiY7/T3O+UabPlOx3gX5CQ7nv906dpGH+DvQK+T3+MJyRGY5UEB0+yQKGZBwPWN5NMtnMioyWXYmNav4Y7rLpB8rt/K+DqgVaA4w+5k+6YhCBPr+3HLCWi5y+VOh84hHujsAnVvVROTDYTeyECncyLqNTIYyg4JwEMFN1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebK0Sbdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05925C2BCF6
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529222;
	bh=AkyUvnDjUVwu0ehRW6YmoRYu0TitM06XZpADJOqlSXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebK0SbdoeyfR8i+AKZ1orwOpeeUa/0ktlqwZuyn0JIKckqxY3tHcBPUayt7y/ERgj
	 Os/+OeUctXXEinBjq8JU5XI/1+lXlERdSWl1yY6mFVXLWosajJlxrCbpq8/MUQkxc1
	 hcb1hAWy4EsD1FvpGHKGhL4LfxCYbRGAGpqdCIUTXbfpq2BFYbuAD8u/RH1e9NzUqs
	 bzzmbQgy68ogiQHQ5HthzAtvYIxXyH7gkEKLTW+AKQ5uo1qmjKfs0RG/JHzn5Uvety
	 lF7+aQ+77naX4458yYO1vrHSi61QKgqV0Tv+qhgNekXRBpGuQLMZkLlRdtF8Kx9BcE
	 g33mbGgyBQUmw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a87782588cso5335703e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:53:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+iH/iN0rrsUE1G0OID3jPUpyUdcUgvPFGodre3KROcSLOwEKOb1Y2b82rJ9y3SSFDsqbFAAvcSX73D@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJ2F2Tsrp06ARiqedtOGQ4ljlHkZjrTLgmDof235vxvjl3qUr
	TCeUMiD63t9HtNDlArtSG6k/CRn7wBMT94vHNfu7QEpwPUpSncMbrhJoyVq1vOGD7Mf1O3VdCok
	HN8ctNIErg7foB5p9zgW/Y49FXdTw5CE=
X-Received: by 2002:a05:6512:3b0a:b0:5a8:7426:d2da with SMTP id
 2adb3069b0e04-5a8b6c9d811mr2796256e87.7.1778529220732; Mon, 11 May 2026
 12:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com> <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
In-Reply-To: <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:53:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm7isu5+u_8cmqT1=5SMgvsKkRBfAdZ+hFs8Pdm2WPEiw@mail.gmail.com>
X-Gm-Features: AVHnY4LW8hc_unMh3VlBSde9ZhxvMHSUjSnWnKej4EvTdQ41plIOD2OZGQsN3tA
Message-ID: <CAD++jLm7isu5+u_8cmqT1=5SMgvsKkRBfAdZ+hFs8Pdm2WPEiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 889D851554C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36608-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Thu, Apr 30, 2026 at 2:57=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > Convert GPIO controllers and their consumers on the PXA platform to usi=
ng
> > "attached" software nodes. Since everything happens in a bord-file, it'=
s
> > quite straightforward. We technically now have a way of passing an
> > unregistered software node to platform_device_register_full() but that
> > requires using struct platform_device_info and since the existing
> > platform devices are either referenced from other places or defined in =
a
> > different compilation unit, I wanted to reduce the impact of the change=
s
> > I can't test and went with the older method.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> If there are no other comments, can this be queued for v7.2?

Are you planning to queue it in the GPIO tree? (I would.)

Otherwise just send a pull request to the SoC tree, I would not
expect the PXA maintainers to be very active and stacking patches
and sending pull requests. But they might surprise me!

Yours,
Linus Walleij


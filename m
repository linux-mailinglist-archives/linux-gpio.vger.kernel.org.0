Return-Path: <linux-gpio+bounces-36511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIIPKOyIAWpJcwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:44:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB39509763
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B9931FBD28
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 07:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF06C37CD31;
	Mon, 11 May 2026 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QODrhCLS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A29374E6D
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484855; cv=none; b=mpeZXzc8nJerRX8SAlSsZ9kDqvuGTGTk7DkuDBtvZQFxVrmxWUJxMQxrrkyhtCfnfm49zBJXtlZ7OTOQbYnW9bSKoZtDJTAXsLhbrt+J/V1yllRv7gIDu+8C0Wn84L3Qai3CBEgyWjUdRgq5QWXvcooIgVpxQvvF06Dx4ypdU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484855; c=relaxed/simple;
	bh=B4rylZ0pC6lG48l4xoOCQ0V4PV1iSRjSAr4YQKXUOms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSZYnSNKOmG9NtsGq2F74MwxSONfOif5jFiadjhEaqshWcG8yX2EW8YdkRsjloOgplVe2ceI4IuuIDhdeiz6OduIilHG3x/W8IZQJkS+uE+FURQV3lLoHdYWOcfNboQiuq7Ctj99tunvqewU0A41Cx9MizL5WEU9iutpXNYMpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QODrhCLS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50474C2BCFD
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778484855;
	bh=B4rylZ0pC6lG48l4xoOCQ0V4PV1iSRjSAr4YQKXUOms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QODrhCLSwretCuN0DDdxnQNOdBs22yPzcgVaALUmJbYvFgkcnXYErYTAomJoS8wuA
	 Lp+QCNb2qr/NIDpvbt7Xo+VfqpdRuABVsNkhlvN4coHkbfZYrjcfV8zcMtvwS6xFfx
	 KzMO2jI2JJ8CebY5z5M53y+VJMc/+NBjFehWyFNLZJmlhvXq7ZtxcRqjnnTWpfJAT3
	 O1mXMgdhMfSG6dPwPUtgM8Ir9oevHUKKtfhi+7QR718cIcAkTIDDjJ5KrPd2eorXCg
	 a6jcdlp57lVi88bAmCxYcMy8XA7QIu5/qhgH5NP9TzZ3sz+aveNwJ4kKEuqVsZj6K2
	 pVty+8m7KcD+A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e800deae4so30226671fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 00:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89/7hbOSM4DRetTJhuep5zOkG89hcGHnhHoSVeZEzynZmoFj7fwKSWZAIs2MbkPUB4fJXRqJHGpacy@vger.kernel.org
X-Gm-Message-State: AOJu0YzqiGiJvcxzBR1UQh2lOheGVE5BL8jcyhdxRuLJ2UJO/DX2euU2
	eEvRJlNGP+ECdreyACW6eb6cVW7ikesYNS7QrU4TRfZgzB9YV4PA0h5m4fa4PoFCOp4f/ckJwqG
	K36emv9p2sT/Lu+na/x2UD7q6wlFlRKD/IPmvtsyfkQ==
X-Received: by 2002:a2e:bd8b:0:b0:38a:3ad8:6f32 with SMTP id
 38308e7fff4ca-3940819faaamr25349851fa.30.1778484853887; Mon, 11 May 2026
 00:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
 <177754249703.2432539.15541841890441225607.b4-ty@b4> <20260430095235.GG1806155@google.com>
In-Reply-To: <20260430095235.GG1806155@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 09:34:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md=eMGA4iSTJmd4_wBBDXEJRcbGyUQd5kjcFC6MGiy_fQ@mail.gmail.com>
X-Gm-Features: AVHnY4ILHl8MND61VMnI0fAhveroexOkWB2WvxgmMaQaCZDxRgNib-AwCAc5sbM
Message-ID: <CAMRc=Md=eMGA4iSTJmd4_wBBDXEJRcbGyUQd5kjcFC6MGiy_fQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpio: timberdale: remove platform data header
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4CB39509763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36511-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, Apr 30, 2026 at 11:52=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 30 Apr 2026, Lee Jones wrote:
>
> > On Fri, 27 Mar 2026 11:49:06 +0100, Bartosz Golaszewski wrote:
> > > There are several GPIO driver header scattered directly under
> > > include/linux/. I'd like to either remove them or move then under
> > > include/linux/gpio/. In case of gpio-timberdale, the platform data
> > > struct can be replaced with generic device properties. This series do=
es
> > > that. It can go either though the MFD tree or GPIO with an Ack from L=
ee.
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
> >       commit: c44d171a52513bfd06b5d847b42b0c1013ddd46e
> > [2/4] mfd: timberdale: set up a software node for the GPIO cell
> >       commit: 2012c0d1b91767b68dedac127c3575cf816313e1
> > [3/4] gpio: timberdale: use device properties
> >       commit: 065d211f9ef7e60c510cbb3663ffdb7ca14efae2
> > [4/4] gpio: timberdale: remove platform data header
> >       commit: 0cb4edca4ed1325ddeb368f80807403cc37edc00
>
> Note to self: ib-mfd-gpio-7.2
>
> --
> Lee Jones

Hi Lee!

I received this notification from b4 but this series never made its
way into linux-next. Is there anything else I should do?

Bart


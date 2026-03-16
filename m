Return-Path: <linux-gpio+bounces-33473-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OxpBfnLt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33473-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:23:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30A296E31
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4500130338AA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD68B38656A;
	Mon, 16 Mar 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaN/++9W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A734EF01
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652744; cv=none; b=RswzDSrqVTfaAbdOCZ/H6EEI+pdHurRtcDRh8TKRfb9Ikd/kLa9V1J/Qr99aoyyf61Y1bStuOKRRpv4OPs1tpYh0A+ZGtVMgNpmUFxfqOIIAKmKuW2qFhXjS/YDo14AtquedNLrCPENpZL3ZFCJcCX8hCODBNah8hTrTCqNBUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652744; c=relaxed/simple;
	bh=q3Agc0zE6zbD+HIDRWjmvZy8lu9KrOk6lzctrtTX3ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npzOwdDevGvl5TRUkwTGiEkfDMP7Na7HLCUjsc/a3pYRcu6HNQpM6F3lfMVR3zfgqePYWLfOI392WyvcUH9njBMXaU6dSbewrck1LoJ4iS0wFp/hZ/etK7pzgvfQOe3eOCuiypu4PS0owZCKQtfGAQBFj9yoVwDz+SLW9GRARxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaN/++9W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1439AC2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652744;
	bh=q3Agc0zE6zbD+HIDRWjmvZy8lu9KrOk6lzctrtTX3ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iaN/++9W0WM2DbUIVXYu4ZUAyvpw6MDW+biDaYO+RouB/ReZoyAS3z/lTljramclX
	 iZdqFJ9DDphhANstvRWEKKVVMdP3rLO5u/7JvGv+0q8KmOYm/0ov/wQlK/o9gOL8Ox
	 PEQjtsOBIwmpBDW346Zpz1v4Pi7qV5apgwyHvQzsSgGK+iouogIyvbtFjmWYAHY9qF
	 FVaKfCjGDuFZRMDc3+NaaUsPRb0Stc49HeAUm9qU7OnhbKUfeaV8XYya1sBX0DJUxo
	 fl+LRS1bNeRVm3bDFVm+NCmJodEQ9wPb8uc7wURYouSdYs5zzntxdYtrw4tdfShpOc
	 zkArH/9F5cX2Q==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a5a37113aso1893317b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:19:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YyKRKnXSnNUToBrX/3FXiRYl/eoRPKRgIUNNHZF6w4aS+kVfV3p
	rNLoVnNcZqeyp8WK9Nx4cBRHbcNLQHjZ0kKnq5fkrGrzLg+LNFJhYXERpR+p7KY4Bnpkb8OniFZ
	im+al3v5PMIh3S7wY2ffRPmsJEmLribw=
X-Received: by 2002:a05:690c:6505:b0:79a:4558:b95d with SMTP id
 00721157ae682-79a4558d299mr39992477b3.56.1773652743407; Mon, 16 Mar 2026
 02:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
In-Reply-To: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:18:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmRR3z5k1uEKT3638VLQd0SOe21VoGizB+5zkoNVeZLfg@mail.gmail.com>
X-Gm-Features: AaiRm52maCapI6MmMxf6GlbB-bkZ3o13W_-ZLlidnneOK6gi3oA8OEmgkrLRLEg
Message-ID: <CAD++jLmRR3z5k1uEKT3638VLQd0SOe21VoGizB+5zkoNVeZLfg@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: kempld: Support get/set multiple and interrupts
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33473-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,dlh.de:email]
X-Rspamd-Queue-Id: 7E30A296E31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 3:31=E2=80=AFPM Alban Bedel <alban.bedel@lht.dlh.de=
> wrote:

> This series update the kempld driver to support current versions of the P=
LD,
> add the get/set multiple ops and implement the interrupt controller.

The series is fine, I think it is worth noticing the following however:

The kempld MFD device is just providing kempld_read8()
kempld_write8() etc. These in turn are not very magical.

If the MFD device was refactored to just use regmap for
read/write of these registers, the whole GPIO driver could
be cut down a lot by using GPIO_REGMAP.

I think this is a common problem with a bunch of
"necessarily different" MFD driver APIs that should be using
regmap but weren't caught during review.

Yours,
Linus Walleij


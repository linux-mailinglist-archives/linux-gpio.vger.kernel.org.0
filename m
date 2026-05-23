Return-Path: <linux-gpio+bounces-37394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIo7Lq1pEWrKlgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 10:47:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 313125BDFE9
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 10:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDF073017F95
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 08:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308D537DAD2;
	Sat, 23 May 2026 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZV45qzOg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D9362133
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526057; cv=none; b=As+3Zln+5lt417MERGAP2uahZkW7VSuo3qYKsxMF3uSGG/kAkiW0xxZ9lvFpUlL7DeHdgj3oTgkt04LD59IQIKZdiSVIvZv8ETl/pkiyJsp4cqpXw6FxF6jm7kaeFb5Os+qGb5I3GXhL/W2Ebv+k12MLSan3MWHd9aVYp4oDBxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526057; c=relaxed/simple;
	bh=ooBZtT5TXbIPt9QanCZKATK4WDHyD2s+LM+1kI/XFBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kW+lsP8ayDZPmerPLgGsVMq2biX/wHqd8GRMnRI9lcJ4/DQiPuiBBLeLaHz/CisuQHGT9nIimzhm/Ob0796U+ocpl847z0c/f/sK2v5I3irR6T4c1Q7GHLWcsRMhSm1hGRxiT8+OZNhTfMw06e8S7gCnz0d7T+WiGWb/bpKT0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZV45qzOg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37281F000E9
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 08:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526055;
	bh=1iuvub9YIs+C3X6ayz4EarhBJ/49/FjO3EGQmaOb/Pc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZV45qzOggyu0VBkW0kLJ9nD5lZ6OtwQhxm+w7dh/w7Z+w6drTgpTTlvjYPBAIxlqs
	 XTgHmZCMVi+srM1n+x++KZzpn8zCK6xQoNMWCn/TunMgPdSNHNcgUd3CYyT8s7w6gh
	 +2pVJEimfINf+j0e7p4qSP1GU6comSFLCp05jpDgRpbpIMcUnPdKnBjmP9LxgipvMZ
	 6lSOKvD/wVhEmra4gjNPR6ZhjlHlTj8PucIV/Y5OIg/oDLuPneWfxnIyPOcuD2KeNA
	 iN1pOEkRkLp7/SLwpKB6yH3c665JelcqoEIgUpQLXTEpfZdwCJ6GcyZSMC+PQtzn2x
	 rpgMmCZMb+vjg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso3484014e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 01:47:35 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJD6hhteuqUCh/xCXiMuF6oxfMyp02FS4Z4TZMmHImhY2reG6U
	QrjNj6pKoqd1x4mF38VGvskKq9NSgLpERZ97hkx/z7qhXQxktdF90stXgm1pGDvUKiY0yC33ENe
	1hbm7Bj11GnCGbLNr8F/55Sm+AHCcGCE=
X-Received: by 2002:a05:6512:3ba2:b0:5a8:d14c:a14d with SMTP id
 2adb3069b0e04-5aa3237dbb0mr2416917e87.18.1779526054535; Sat, 23 May 2026
 01:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779185631.git.geert+renesas@glider.be>
In-Reply-To: <cover.1779185631.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 10:47:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLm3A9mwOdr7RDm6WoZukUuRrpYZdYBN4zJt-yN4RhX+cg@mail.gmail.com>
X-Gm-Features: AVHnY4I2fsIctKcfczNtyCV6aEVPeG_PxHYb9DSOkd8GoLGze9MpDNCiUrjzRCU
Message-ID: <CAD++jLm3A9mwOdr7RDm6WoZukUuRrpYZdYBN4zJt-yN4RhX+cg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.2
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37394-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 313125BDFE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:36=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit c88ab9407986836820848128ce1f90f2fa49da=
95:
>
>   pinctrl: renesas: rzg2l: Fix SMT register cache handling (2026-04-27 11=
:18:04 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.2-tag1
>
> for you to fetch changes up to c7c8352fe569d17e3d379a83075a8ea12168526f:
>
>   pinctrl: renesas: sh-pfc: Implement .pin_config_group_get() callback (2=
026-05-15 11:15:19 +0200)

Pulled in, thanks Geert!

Yours,
Linus Walleij


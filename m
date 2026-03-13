Return-Path: <linux-gpio+bounces-33387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CQRAsEhtGnahgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:40:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DF28528E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D0953054648
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1D93A5447;
	Fri, 13 Mar 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRVMg17X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375338F62A
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412619; cv=none; b=mKDmwjWjWEkR33URFUJlXuRF6hj3Jnmjr577mbxyjeF6XAGl0K2W5wzMw+PurMi7g5Axe5FOak1Qul8etrYT76BnqJs5xJq4LFMx7lknb6GF71fo3E89hc1boT5QwATPyenSrP96xkaXtQmle7Ctd2CMPH8Rky4mhYs7p8wLmSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412619; c=relaxed/simple;
	bh=9pjBoJgsPKEIMBJz0KkJ5Yx4MAxlEzNC4w7UJuUZyVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdIO/QLLrNr7bsVrLlPwOLAUl7nVTRDDRIqKf3kGUFJQZyy9/gB1yZguHxF25JrLZ4yaN+AJiuz2QBLywDHlOzgXYcKqKKx7jfGUOBOaHuO9oDAyqDZCLORgV/NP27YqPd0apWf6sMdhi0TQwBCYSyvSzFIHf3pnRe6r81nN2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRVMg17X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8971AC19421
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773412618;
	bh=9pjBoJgsPKEIMBJz0KkJ5Yx4MAxlEzNC4w7UJuUZyVo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KRVMg17XW1L5+zlreNZ0XMOpSBO24IP95o4Qs6BguKi71KCu9X6Y23ozaALW9Ppz6
	 hlkSftoibZKghrPzJ8wJS0hGMz+f/Xun9r7GGn6RSHy29r1SxUBqUMhDjBkcvl9QOC
	 kBmNFiR84zCOCKLEGWpwczEjF3eCH6lLj/3on6OF3C7rz76A4nNl1SWpgk54vUf2by
	 UVgboRsXWDuu8rStP+Es3NJ6bC7JlkuBa46CtEb/63DL/9c/2jbbDssJw4A70iV5r2
	 GrqXpiz+jCeYjBUJ1OfN7vqS7IwJc/oCTy9cIGlKejCbI+nUm6oI3gLBq0CoylnESp
	 yj9K1PTlVgHcg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so2721904e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxVnakEvXNirrNvv5G4K4tP4Adz+w+3LeKVpHQiW8+op0YuCR4z3p48k1WL5n4izK6tC+z8BNUSmBS@vger.kernel.org
X-Gm-Message-State: AOJu0YwUlDIhbKo/HJoU0QvyhWG0Xfu96ppSnQ+6nGvNEsZdwfPYTYSR
	4Qd4QgKTU8UeQ3EM2d0YdKRtfvDYS82lgwtRoru6WugLDNTAIJovLTDEqpwNu6og07m1wdlcxZX
	r8wlGn4DkBEOg9lxd1ILRCOU+3IrVNYBvUSfWjjaCZw==
X-Received: by 2002:a05:6512:2c07:b0:5a1:45fc:34f4 with SMTP id
 2adb3069b0e04-5a162ae9fc4mr1230702e87.22.1773412617061; Fri, 13 Mar 2026
 07:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313091110.7691-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260313091110.7691-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 15:36:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeCDW6ecNtGpU4=UN_dC3RiEAvgtJpEq0p+vTejGsoT_Q@mail.gmail.com>
X-Gm-Features: AaiRm529Hf2BR9y5nmVfxc59ac_OfM_87FJ2qDJ_wgcteVwGse3Za8-jOjvDL3A
Message-ID: <CAMRc=MeCDW6ecNtGpU4=UN_dC3RiEAvgtJpEq0p+vTejGsoT_Q@mail.gmail.com>
Subject: Re: [GIT PULL] gpio fixes for v7.0-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33387-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F9DF28528E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:11=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Linus,
>
> Please pull the following set of GPIO fixes for the next RC.
>
> Thanks,
> Bartosz
>
> The following changes since commit 11439c4635edd669ae435eec308f4ab8a08048=
08:
>
>   Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-=
fixes-for-v7.0-rc4
>
> for you to fetch changes up to a23463beb3d52815e5f8e61998f5c94f13274544:
>
>   gpio: gpiolib: fix allocation order in hierarchical IRQ domains (2026-0=
3-11 15:21:43 +0100)
>
> ----------------------------------------------------------------
> gpio fixes for v7.0-rc4
>
> - clear the "requested" flag in error path in GPIO core
> - fix a NULL-pointer dereference in GPIO hierarchical IRQ handling
> - driver kerneldoc fixes
>
> ----------------------------------------------------------------
> Barnab=C3=A1s P=C5=91cze (1):
>       gpiolib: clear requested flag if line is invalid
>
> Oleksij Rempel (1):
>       gpio: gpiolib: fix allocation order in hierarchical IRQ domains
>
> Randy Dunlap (2):
>       gpio: timberdale: repair kernel-doc comments
>       gpio: nomadik: repair some kernel-doc comments
>
>  drivers/gpio/gpiolib.c            | 38 +++++++++++++++++++++------------=
-----
>  include/linux/gpio/gpio-nomadik.h | 12 +++++-------
>  include/linux/timb_gpio.h         |  6 +++---
>  3 files changed, 29 insertions(+), 27 deletions(-)

Linus,

Please don't pull this, it turns out the last commit causes a
regression and we need to figure out a different approach. I will redo
the PR next week.

Bartosz


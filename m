Return-Path: <linux-gpio+bounces-33816-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MR+HNb6u2mzqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33816-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:32:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E772CC089
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAA4E30D3C96
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EC73D47CA;
	Thu, 19 Mar 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8H7Bn4s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F2A3D47AA
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927100; cv=none; b=SwlFbjR2BaSRLY8VMvPntZ5O8FsBA+rO17rIdF/og+tFQmvqQ9nTlHBU7BKDOl9/mhzG/tu6z3fYpFkp8njpwKAqyME67QnAf2a6Qs1O4qoy1tgZX5pVbw6GIESVLAIK7eDGNpzyw/VVyAkPdc2ZS7z3LdTMIgfgDr5RyrZooNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927100; c=relaxed/simple;
	bh=dD5ksad63uuh4gEJ4/Y662jSMsg6kUuTPz+nDArXoYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu38Cn7IBDz+hd/04wWn4cwXFK3VTegV8tNSFf7KMV56tJUxeJ5o19xEHK3SLbmzsnymbAnEpMDuCH7dZfleGr+xge/6R8guFZFpbs0rTMUHltQ0SkugjlYcKZKSuO7PP7cbk0yMwrAyz+mpyc975+Os9tU0IFW2byPyQoYsdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8H7Bn4s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88979C2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927100;
	bh=dD5ksad63uuh4gEJ4/Y662jSMsg6kUuTPz+nDArXoYY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u8H7Bn4s8cXdRvXaqQvUwr8ZzI+ZuBQFbIKRdYdnhmOnLneI9IgdzNoMnbHsJw1bC
	 KpYxqJ7qI8ku18YsNJIJai4aQB5YE2fELBfFnZle6XoK1Azh1isvQw3SEXgtwKHSvd
	 IIB5MGMpE5tk8PoK9yxoKFM0FOeExKQENvHOE+skpa+t5kefmMz7/v7SSCwsIU2Kiu
	 m0DQ7+XxnC7vzP2Xh4HvIz/GOsG989uftcbExtQvH+XbN3X+6MHcrI4rz10hyHHbNj
	 2Y843UE9cXt4hc9KgdtO4iiXmV8eYzHGuGw2vMuMSv49K7z+OHE7JouIzIg0u5/y3V
	 yz1rMmY0TuTJQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-794719afcd4so5133437b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 06:31:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YwVw/qjaSLMqrmnOOYbgdr9qeEhGpADs3pQcaBXhwQ8MLED76wh
	ak3FoS8f8+hv7QlPvUs2X2ZceaPenFBby24u5xyT2Ia6oCmc2XKUxrjlFPa1tRP5OxGKexwWpk0
	kPN5dcY1NExb4jxyjsJ4E2CbtIl052fA=
X-Received: by 2002:a05:690c:c50f:b0:798:71ee:2a00 with SMTP id
 00721157ae682-79a71ad35fdmr73447607b3.38.1773927099889; Thu, 19 Mar 2026
 06:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
 <CAD++jLmRR3z5k1uEKT3638VLQd0SOe21VoGizB+5zkoNVeZLfg@mail.gmail.com> <m1cy11h7mp.fsf@lht.dlh.de>
In-Reply-To: <m1cy11h7mp.fsf@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:31:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGztRmm1MtjgwOSm5wBJ0-K1UC8U2SLVtkAgFVJ+s68w@mail.gmail.com>
X-Gm-Features: AaiRm53JTmNCa5tx-DFnEhlSRX6oIemjAEa5B2z-SDWmebqzf75MatNA-w-bNRA
Message-ID: <CAD++jLmGztRmm1MtjgwOSm5wBJ0-K1UC8U2SLVtkAgFVJ+s68w@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: kempld: Support get/set multiple and interrupts
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33816-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.936];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dlh.de:email]
X-Rspamd-Queue-Id: D5E772CC089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 9:20=E2=80=AFAM Alban Bedel <alban.bedel@lht.dlh.de=
> wrote:

> As far as I can tell, to use the regmap GPIO/IRQ those would first need
> to support locking the device accross whole operations. Or they would
> need to expose more of their own implementation to allow driver like
> this one to wrap it with their own locking.

Well regmap supports custom regmap_lock() regmap_unlock()
operations...

See drivers/gpio/gpio-104-dio-48e.c for example.
This one used a raw spinlock, but I'm pretty sure you can just
shunt in your hardware mutex there.

Yours,
Linus Walleij


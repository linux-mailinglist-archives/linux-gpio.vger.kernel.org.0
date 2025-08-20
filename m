Return-Path: <linux-gpio+bounces-24676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC9B2E3DA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7382681AEA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A533EAE4;
	Wed, 20 Aug 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b="P3Ix/CG+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.bues.ch (bues.ch [116.203.120.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13D33A02C;
	Wed, 20 Aug 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.120.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710401; cv=none; b=Ecx8UWHICNocnjoDGDUf1fD6EWIpgF1hqy0te//2vBSkaS6DWsJvzX9trUzBK1jyk1lU+Q4OnoxWftXpqHDIisWslz9WDogNiDsSxyOwOU4h9XLBXrEdn49oLHOT+vUbeFVMhaT6/YFjty7ME+5+EiEd8ZZ9ktOvUlDNhIYoFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710401; c=relaxed/simple;
	bh=qj64TOB/5TJyA+F8gnbV+C+TIwj10ue6VgL1vNx3FS4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rn/MqYEF2SmmFEsn0fjiU6XS/h3QWvqVB3M/mCbVSb4FZI9HU8ESjACD9njoWaUZqEfmXNb3lcrckPtHVZV7jpb4eiEC3/XiO9QsK3qA/eLvc56jmryWnqTwolxJYORRTnCLQwlUB037rK1SFiLqGRwuuRsKFAtv1c9JDto0CZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch; spf=pass smtp.mailfrom=bues.ch; dkim=pass (2048-bit key) header.d=bues.ch header.i=@bues.ch header.b=P3Ix/CG+; arc=none smtp.client-ip=116.203.120.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bues.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bues.ch
Date: Wed, 20 Aug 2025 19:08:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bues.ch; s=main;
	t=1755709874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qj64TOB/5TJyA+F8gnbV+C+TIwj10ue6VgL1vNx3FS4=;
	b=P3Ix/CG+bKZ8eCztNYX9NEzGOCjh+CB2q4tOL5YeBo77KZbDF0nesLo0UQkBq2PFEdFptx
	7zlWS/a5OZIIYrA9U+JcHkT43UikkDhSYnSB5jfzuS9+q9jKViYj2mvgRdrDWhnGcra5pT
	KuQd5+auScDpYTQDxekTeZa5BMSI+AbEW7T+4VMCptcEueWSKxPvLL8UFLBuYL2B03wtvy
	8TAI/XLQ7J22VTHzPPKYoEF0YeuAXIREtK4oFPeF6yPj9IjVK3WlXoZsxWFLukuQFm5Ndf
	mnTOs5b2AV7Zp7BfC5xJ7ze8LCo5AjtqhYaY+Wxx94n2KcOQHdczTnwR1g9K3g==
From: Michael =?UTF-8?B?QsO8c2No?= <mb@bues.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, Hoan Tran
 <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, Daniel
 Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar
 <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli
 <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH 03/16] gpio: bt8xx: Use modern PM macros
Message-ID: <20250820190842.4e3c07ec@barney>
In-Reply-To: <20250820154037.22228-4-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-4-jszhang@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jlj+UyB8B0l7lUKjchj3xEt";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/jlj+UyB8B0l7lUKjchj3xEt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Aug 2025 23:40:24 +0800
Jisheng Zhang <jszhang@kernel.org> wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>=20
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Michael B=C3=BCsch <m@bues.ch>

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/jlj+UyB8B0l7lUKjchj3xEt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmimARsACgkQ9TK+HZCN
iw53uxAAytnVanFnDDU72bYeydk9D/FlxnSQVlQplGz9Sv9WyFxKGYqow2qKqyDK
AWlZAd4aMCkopCnzU53auLsQ47ye5gWiWtNpCysbLDY7U/iL6+cdKAvgJJBaf1fI
hXEfKAvUQq8bjhSxfhxsbVa09xZGG7UEUhE5/dzRdsr4oK2F90PfaHwqMyiYibmf
7kKpf3XYrBJTn7WAsIetWOx2NKglt8GWVpPCg9AqY2r6QbfAfKeqBi/qPEGRurFb
zf0qtLTxoYUUyJti5aH0ClYQ0kZdB5HvOY3mIX4cP0ncLEE+kIoyHCtJjV02jgcA
N2fza9GRVEG0adwvSP+iehkbQgKJpl5QifdS59uHmchgyV3ZorBLtrlKoeeVNohr
DhbkJlrWH5qr9cmH2+mNE344zODtaL+nE5hg8Vc7hC7Mx0K4SrKebHNKlce//7bM
RCkxTbZdQ4R2Q2nP/Q6cQlwps86kiveI3zRQYPldRNBzHZSGS7cTDRKGkTJoh3F6
flGSi32S7a0v7jfJAY+hM8HKgyeMGu9FZawZVwmGBS6wQIbtLL+cDFjMW1HND5eJ
bEQ5UOeRpFaLh4Czw7fvLPNVUFajyynwur5gFuBJns01Amdp5XlFf5I3c87x1IyU
2vgv+kA/wr+dPwpJ5b2ZobRzUbBrsoYm1yOauIhH28EayNHHGII=
=hcGT
-----END PGP SIGNATURE-----

--Sig_/jlj+UyB8B0l7lUKjchj3xEt--


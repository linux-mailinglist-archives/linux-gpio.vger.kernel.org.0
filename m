Return-Path: <linux-gpio+bounces-30282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ACBD0455B
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 17:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6C233105484
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33751F419F;
	Thu,  8 Jan 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aslZS4Zq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A618A956;
	Thu,  8 Jan 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887179; cv=none; b=a4EKgxcwjdozD2jYRvU146uUjVbzJS28RyFAXJrevMC00XhKYG6nWVD+zQO13beFRBi3XoV0RJrzBVVjZCa1uOiiDbAMpJ3bUiEEDnwkcseLjdZXj0LLmJlxBcnP2qI/XtjVZ7DMKGZZvWgTU5Hp/wb5qE9u7tKBUcnRAFaMbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887179; c=relaxed/simple;
	bh=bNyJ0CmxtZ9FIyWOqzzXNE346Q7+uYlatcrueQSIXSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stiUeIzetATbsihWFP8z9vGNsc9Gh0YoHZY0KUa5obICqcUdaMiq2ux15WYK5ztimV+lA5AZl5ZpCMveiMyqz1CoQv3aa93GDDcUL0y/3gRv86ZJUYwp5AQepbjQ8rbSTwLWJXvVLKWZefnyWwKNNMdSc+jYhU8FWsi05cEjefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aslZS4Zq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59D4C116C6;
	Thu,  8 Jan 2026 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887179;
	bh=bNyJ0CmxtZ9FIyWOqzzXNE346Q7+uYlatcrueQSIXSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aslZS4ZqWDyD7796Bkm9euCR6nRDx0XVTYPPGwhN+nC4t0uOqgQo1l1fSm6nO5eiP
	 du2d+8tgG5SpYGdDP40TQdyGxWn6xZauxd6bhNDyWYJ6t7oehMelj84f6hgpJniMXU
	 3NOFmO7dtMemLMgP3oF0jOW9UqU01G128kEVGG5Kz78ZpKk3F0PXbfk7unjz16al9m
	 RGYQuDyFhk5lCVjzBnoz66mAKsA/yXX9V/yx2CEJriYBYH8Z/gzLXvJ6fuurrqPI7X
	 IWH7vO8LmHqXBQ34G32Eg9IXL3I3pTXfUs8cXMrJWWtU28r7xhM5TCrngud18EO3ZM
	 xiOHuyZ7NTH7Q==
Date: Thu, 8 Jan 2026 15:46:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin
 between reset-gpio and gpiolib
Message-ID: <0bce9429-1cff-4a62-bdae-57697daf2920@sirena.org.uk>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3nXzxiUFBDMOrg8"
Content-Disposition: inline
In-Reply-To: <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
X-Cookie: A beer delayed is a beer denied.


--u3nXzxiUFBDMOrg8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 22, 2025 at 11:01:28AM +0100, Bartosz Golaszewski wrote:
> We currently support sharing GPIOs between multiple devices whose drivers
> use either the GPIOLIB API *OR* the reset control API but not both at
> the same time.

We're seeing futher issues which bisect to this patch in today's
next/pending-fixes on db845c:

<1>[   18.348426] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008

...

<4>[   18.799534] Call trace:
<4>[   18.799536]  gpiod_direction_output_nonotify+0x14/0x194 (P)
<4>[   18.799541]  gpiod_configure_flags+0xb0/0x364
<4>[   18.799543]  gpiod_find_and_request+0x144/0x504
<4>[   18.832617]  gpiod_get_index+0x58/0x90
<4>[   18.836657]  devm_gpiod_get_index+0x20/0xb0
<4>[   18.841139]  devm_gpiod_get_optional+0x18/0x34
<4>[   18.845881]  lt9611_probe+0x130/0x488 [lontium_lt9611]

Some prior instances were fixed by:

   https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com/

but that's only in next/master, not next/pending-fixes, and in any case
the issue also appears in next/master which should include them.

git bisect start
# status: waiting for both good and bad commits
# bad: [fc4e91c639c0af93d63c3d5bc0ee45515dd7504a] Add linux-next specific files for 20260108
git bisect bad fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
# status: waiting for good commit(s), bad commit known
# bad: [53ebf42e14b480288f52fa86811bf68703fece4e] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad 53ebf42e14b480288f52fa86811bf68703fece4e
# status: waiting for good commit(s), bad commit known
# good: [f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1] Merge tag 'nfsd-6.19-3' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
git bisect good f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
# good: [a64e2a609fbd406cc424ba13bfcf1941c3b004ea] Merge branch 'for-linus' of https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
git bisect good a64e2a609fbd406cc424ba13bfcf1941c3b004ea
# good: [1d1d206d257d645c8e3b910d69a1d4b0105de146] Merge branch 'fixes' of git://linuxtv.org/media-ci/media-pending.git
git bisect good 1d1d206d257d645c8e3b910d69a1d4b0105de146
# good: [fc6818ad09fcdcd3670755c8dbe9785561f8ef1e] Merge branch 'riscv-dt-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
git bisect good fc6818ad09fcdcd3670755c8dbe9785561f8ef1e
# bad: [158eb9119b536341cf39b07c6f9408c15516f77e] Merge branch 'rust-fixes' of https://github.com/Rust-for-Linux/linux.git
git bisect bad 158eb9119b536341cf39b07c6f9408c15516f77e
# bad: [51018b3e4652074f726aea6cd66e89edcef34e76] Merge branch 'gpio/for-current' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
git bisect bad 51018b3e4652074f726aea6cd66e89edcef34e76
# bad: [014a17deb41201449f76df2b20c857a9c3294a7c] gpio: pca953x: handle short interrupt pulses on PCAL devices
git bisect bad 014a17deb41201449f76df2b20c857a9c3294a7c
# good: [cb0451e33be047fff7137f58d9996370e11fb344] gpio: shared: verify con_id when adding proxy lookup
git bisect good cb0451e33be047fff7137f58d9996370e11fb344
# bad: [a7ac22d53d0990152b108c3f4fe30df45fcb0181] gpiolib: fix race condition for gdev->srcu
git bisect bad a7ac22d53d0990152b108c3f4fe30df45fcb0181
# bad: [49416483a953662aa53c6d9bef651757d4a95ba5] gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib
git bisect bad 49416483a953662aa53c6d9bef651757d4a95ba5
# first bad commit: [49416483a953662aa53c6d9bef651757d4a95ba5] gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib

--u3nXzxiUFBDMOrg8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlf0UMACgkQJNaLcl1U
h9Ck0wf/RCbvsLJcGts6yyi9nVo8WXuoG4KOjuOwIlkPLLMKcpLOfgKVknwZKus4
+Fy535RD7DlGTvvwHYJ9LDL6sld02Nn68VA9NBdEK+BduG5EgHJ93nqJytnUY0P6
B0NAQ6Y1fKqdihFoym6LnIQ1ExTdtZo2lct38HY48H35i07NHAfiOyaMU2ZqNqha
Dq/2tvjOjspYXg0BcC49CxPMAguU5DVrvp/w2y1oUlU0a8qg/Mvdapag0+i1+gnS
OAQNd0xniGhcs8Q0MGHt4ksuqYgjJlfQ2xSjsN/Etb/0vvfovLKgOpqZitUPvWcv
o4Tm9rQ0r0tNCR74tEOOMl/DoK7ssg==
=bZZz
-----END PGP SIGNATURE-----

--u3nXzxiUFBDMOrg8--


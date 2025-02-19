Return-Path: <linux-gpio+bounces-16210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CBA3AFBB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 03:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DEF03A96B3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 02:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033DC189F3B;
	Wed, 19 Feb 2025 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUXk6k3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB5022EE4;
	Wed, 19 Feb 2025 02:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739932939; cv=none; b=hdRMncc/25skCktMYpc4Hraogai3bpDOcGZi4179sPqvRHWikffFOiPPRyR5V2TLUskvAmghe1qN6+0KCJ9kbFWWyV/iMP1V47G+a0gxeoOlLQNrLE0qRX1xn2z9Ug28gT8J5FVd0/77ZUG5IAFwiKokgSmj8XPThqyuWNlZUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739932939; c=relaxed/simple;
	bh=wDYQ3FA4cBf7FLdDEcQFrf0u+0LGDQcHJhctJPI1Weo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntJh+35Q2XtVcCYUooDr6FG+QnjEddAMeHu3e6IUzA7J4Z4tujc3/VFD1K5/XY+Sq9LIYYiLG9LRbKv3d08q9no1JjoF23PyvJrVCFfJrIZloTMtyrA5wOXP4OfJZmczpBbkTL76ITVvbPh1VMwerIWocMtxmVtoqZP6ll7r6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUXk6k3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45C6C4CEE2;
	Wed, 19 Feb 2025 02:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739932939;
	bh=wDYQ3FA4cBf7FLdDEcQFrf0u+0LGDQcHJhctJPI1Weo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUXk6k3aRF/w7peiQs9NnEQUaLKBuf1CQLitgGMexLnI6zLXdrrxYJkDet2WmOg0F
	 RYam++i+f55W5ojzSfHAhJ1+fj8lBs5ExfrJ7FKqfZpL7blpU2y0XYfX+Q78Oa7fVs
	 ZwXvVUdnM2omGMbbsTBAtU/N/sE5yEdca2YVj/PZCc4I/Zw0FkGFiJIH5tFffXkUUo
	 gNOwSW+kcuoyTA+ilwvbute9Ym5DdIgT+kSKuywdCUhVWXwE6NegevbOSkY6rPTRWl
	 2ItSggJkGO7RjehAnx/OHDN08+/eJrkvv3YX0r5lmqP20qYTn2aAVUOWuuL2xYh4tj
	 9Ms5ncC4HPjKg==
Date: Wed, 19 Feb 2025 02:42:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/8] gpiolib: check the return value of
 gpio_chip::get_direction()
Message-ID: <Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoTH4OmsM33qFA8R"
Content-Disposition: inline
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
X-Cookie: Mickey Mouse wears a Spiro Agnew watch.


--aoTH4OmsM33qFA8R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:51:55AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> As per the API contract - gpio_chip::get_direction() may fail and return
> a negative error number. However, we treat it as if it always returned 0
> or 1. Check the return value of the callback and propagate the error
> number up the stack.

This is breaking boot for me on both the original Raspberry Pi and the
Pi 4.  The boot dies without any output on the original Pi, on the Pi 4
the boot seems to die when disabling clocks:

[   11.695534] amba fe201000.serial: deferred probe pending: amba: wait for=
 supplier /soc/gpio@7e200000/uart0-gpio32
[   11.705920] platform leds: deferred probe pending: leds-gpio: Failed to =
get GPIO '/leds/led-act'
[   15.032277] clk: Disabling unused clocks

Full log:

   https://lava.sirena.org.uk/scheduler/job/1126311

I've enclosed a bisect log below, it converges fairly smoothly:

git bisect start
# status: waiting for both good and bad commits
# bad: [67961d4f4e34f5ed1aeebab08f42c2e706837ec5] Merge branch 'for-linux-n=
ext-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad 67961d4f4e34f5ed1aeebab08f42c2e706837ec5
# status: waiting for good commit(s), bad commit known
# good: [6537cfb395f352782918d8ee7b7f10ba2cc3cbf2] Merge tag 'sound-6.14-rc=
4' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
# good: [d59355014fa12fb0033edf64917ac0139cd6423a] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
git bisect good d59355014fa12fb0033edf64917ac0139cd6423a
# good: [35c2c30101bf96517108fe969c4aad9e5c4f3614] Merge branch 'fixes' of =
git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
git bisect good 35c2c30101bf96517108fe969c4aad9e5c4f3614
# bad: [e52d7cc2f41223d070975c370f67686bd3213b41] Merge branch 'perf-tools'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
git bisect bad e52d7cc2f41223d070975c370f67686bd3213b41
# good: [163126388d62798769acd2cd1753839771dc12c6] Merge branch 'hyperv-fix=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
git bisect good 163126388d62798769acd2cd1753839771dc12c6
# good: [5d176a6d15a456002e90e1776648396e7f0d57d3] Merge branch 'fixes' of =
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
git bisect good 5d176a6d15a456002e90e1776648396e7f0d57d3
# bad: [c6d16b526a80a3215164f7e66c704dcb838e1810] Merge branch 'gpio/for-cu=
rrent' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
git bisect bad c6d16b526a80a3215164f7e66c704dcb838e1810
# bad: [81570d6a7ad37033c7895811551a5a9023706eda] gpiolib: protect gpio_chi=
p with SRCU in array_info paths in multi get/set
git bisect bad 81570d6a7ad37033c7895811551a5a9023706eda
# bad: [4e667a1968099c6deadee2313ecd648f8f0a8956] gpio: vf610: add locking =
to gpio direction functions
git bisect bad 4e667a1968099c6deadee2313ecd648f8f0a8956
# bad: [9d846b1aebbe488f245f1aa463802ff9c34cc078] gpiolib: check the return=
 value of gpio_chip::get_direction()
git bisect bad 9d846b1aebbe488f245f1aa463802ff9c34cc078
# first bad commit: [9d846b1aebbe488f245f1aa463802ff9c34cc078] gpiolib: che=
ck the return value of gpio_chip::get_direction()

--aoTH4OmsM33qFA8R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme1RQcACgkQJNaLcl1U
h9DVbQf/WYjVuEHpCsk9z9te+ryRVt9WbuYB2fSXHLxGXMr96gUvUaaARZhRI6ZH
D72Adq+AEHVXPcFP+TWPirQaXK98MfRCfWiKrBs/Ja2jm1p2GYc/BMxo2sfbAHDo
aOKZLWa6XGmBtm0b2mvzCqGYDlFvZeplSKcMeB4XMmhTSfKEZqY3AxG9yHmvaszY
QvgVUJbf2QP+eCWXaEu04HFperUhBHhWJIRkLtz8Exp24eSp1pcXYozgwGAxWORd
EkgyvB8gyG9dxM4I/D/X9QRq/0fwQoL4W7Lewmh6hhwc1s2PjNZnC9rIYjo8WYKz
H0GlzKTD+DnVcXD4yvFdtuePr9vGBA==
=hB13
-----END PGP SIGNATURE-----

--aoTH4OmsM33qFA8R--


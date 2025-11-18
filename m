Return-Path: <linux-gpio+bounces-28667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73666C69FA9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 15:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17A854FBD53
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AACA35CB75;
	Tue, 18 Nov 2025 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrHHHYUL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07F35A94F;
	Tue, 18 Nov 2025 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475656; cv=none; b=KKHmI49AndoUXJGxldBm0fUXhuKRNo+msxCib98TwA3ixnyITqE/cXXOunVSBqr2aKN+IHS4xhBFSfE3v67eNqGpa6zaRbD5JRCUKEI7kL+Ize8C0YCj0UT+V+MixfAS34EuceIPANbsda8gvDaOBnZaNJTpj1x/WtM579QCcWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475656; c=relaxed/simple;
	bh=EzdwBT0I16G5eJM6DmK6r2wyXQKJd9x6ZvKyD1yiOLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyjdVHw6l7OI8aV1tPu8eAC3AhqqYq3/BpPfZzsLSVAN7MIig3AjcJjtwiAsO4cB4ihLf7NOJT47X8F+bM+ZyCVwC/nunOLUVsebDPYp6H5X2SbC7ILDyoSx5dTrAN6vfbwZBfHb3TQCiEw4PPZCcsUWxAIXdL2eopoIkYNHXMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrHHHYUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A82C4CEF5;
	Tue, 18 Nov 2025 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475656;
	bh=EzdwBT0I16G5eJM6DmK6r2wyXQKJd9x6ZvKyD1yiOLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrHHHYULyeeAyWOHL3xltIL/2RyYwFA4IQ58Z3ICX34b1YbhqIiyeGP8CkjDXkZUG
	 wxNXrIhJpDRn4Nd8dBGF7QJM9tBSwLjpI5dxH8kEJslL15Q5jGeMysX7zHDc1RWLxr
	 OTCx3larlmOomTBPkt8QPlkaWvMFgllUcc/HiGzUTQVAwBpmTi4wLc4u8uV1rGLtnd
	 jS21MGVeiJGcqubHgqLRuti5b+TfzJhzLG3MJjRjmlGbpCa2gL+JQSIbXigiRC0VY3
	 vhztyu7/UcakAHJlSqi83IJ8MGX5C64yfxAs4T7xLJCFURqXeFsm/I4PpReeALrTtS
	 kOzCT/xoMWDAQ==
Date: Tue, 18 Nov 2025 14:20:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
 <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KpCqYkQkjjduxtUZ"
Content-Disposition: inline
In-Reply-To: <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
X-Cookie: Protect from light.


--KpCqYkQkjjduxtUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 18, 2025 at 03:13:49PM +0100, Bartosz Golaszewski wrote:

> Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.

> I can't open the link:

> 500 Internal Server Error

> FATAL: remaining connection slots are reserved for non-replication
> superuser connections

> Oops, something has gone wrong!

Retry, it's AI scrapers so those 500 responses are just glitches.

> Any chance you could get the offending line out of this stack trace?

   https://builds.sirena.org.uk/187dac290bfd0741b9d7d5490af825c33fd9baa4/arm64/defconfig/vmlinux.xz

/build/stage/linux/drivers/gpio/gpiolib-shared.c:87

--KpCqYkQkjjduxtUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkcgL8ACgkQJNaLcl1U
h9Aw8Qf7BKlYN82A4Hn0A3YhoC7pHl6/9ZVls6yVRuOZdRxWlqek5IxlKQCbDDUr
oNK8+lusBJz/jg9bPTKvMs3ZuVsjKTvFc3mHMTWVXo0EUWUNf1EGGNpZerfFM+5j
qgAEyvAVdTiO5QVVBagp6ioo7AYR7q/6kUNfT/BkV++RDeBrVI3vnvdrjNPW8PPm
YW/K8NKJBtiN1P/ffBsxeqBPotCLzfcvwDjeo2nZZ6bohr4yVyuMn2O7di023AoE
+cTWnB5Gncf6/bewSEjoyOCkMUxVGUuPkyo/H7byZ+2lxKUBqdXOow7V1xPSThvA
DFO546hKxuy+x32sTmbFBa+DQ7fQIg==
=xzcr
-----END PGP SIGNATURE-----

--KpCqYkQkjjduxtUZ--


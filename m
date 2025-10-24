Return-Path: <linux-gpio+bounces-27595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3CC071DC
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 17:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D31993A2764
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA9632ED52;
	Fri, 24 Oct 2025 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2bHIdre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847F31D364;
	Fri, 24 Oct 2025 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321440; cv=none; b=C9CuZXU11rWFoqPmjqQj9piDI57DP75J6HyxxEV6+yPtB6raEOaMlCngKlJf3/uj8VdAwrrunW1/KAEOs3WlevKqI0t2rUikR3qDOBKK8CRHDMgSDgJh8e0S5N8wcb0EDQVJ7QCc0su1xUIlBdajtfEKVFLidaceThwpE99fx6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321440; c=relaxed/simple;
	bh=y/2p9MvtkqH9Qg/NebfkyrFfV4fKsGJ56PpnL6OBI1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8gUErEt5SHzFGCuUx1oUcbZ+uMOTm7JAmnH/lAgEeegIFEd1Iv8RFljmuiDE5u9AodBoJiTZYvGnLkHBOAVWInzlBv6EE7Pbb9EwCMi4FTk7+Pr6XnRiuEwK1b0shfCOJwluiNKYT7fzz359cpr1pX7kX8cKygXggw5LSGxEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2bHIdre; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2070C4CEFB;
	Fri, 24 Oct 2025 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761321440;
	bh=y/2p9MvtkqH9Qg/NebfkyrFfV4fKsGJ56PpnL6OBI1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2bHIdreGnRexQUR30mWTpCu81eX85MpLWKXCpRNJA98dYcySvdndBlOFYcd9R45B
	 5uJ8t6oVTJ43DbfKwnzVYYo3XV0xRgQyZJxn5mVEGJKbC3n3BActAFsydjWB/+Flcm
	 sXkyMrwiTj7QXwm5OgjJbT1j6dr3MSScxJKGooujQwolNJHYRlEPpESlvJlke6OvC9
	 GALaeY+y32DCBsWTZKer7g3HHgHEaOQLN/0aHr5+z0rDFLj+8LKPDzx5qKhNq5qa0/
	 Kk+Nx8lBV4RKpUM4KV+2mSX8wN4uYbhCUYSzXsNI9TgaX64KCwCtvoaUkPNV2RDQSY
	 Gj7BWMdcEfraA==
Date: Fri, 24 Oct 2025 16:57:11 +0100
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
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 10/10] regulator: make the subsystem aware of shared
 GPIOs
Message-ID: <aPuh16uHcJieSaS1@finisterre.sirena.org.uk>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-10-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KSzs8cR3CPCR8pfX"
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-10-d34aa1fbdf06@linaro.org>
X-Cookie: If in doubt, mumble.


--KSzs8cR3CPCR8pfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:10:49PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> GPIOLIB is now aware of shared GPIOs and - for platforms where access to
> such pins is managed internally - we don't need to keep track of the
> enable count.
>=20
> Once all users in the kernel switch to using the new mechanism, we'll be
> able to drop the internal counting of users from the regulator code.

Acked-by: Mark Brown <broonie@kernel.org>

--KSzs8cR3CPCR8pfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7odYACgkQJNaLcl1U
h9Czzgf/UuNoMQPXZdBLbbDRbzUtokhQvJnF5147crhjmrifiVMNR1IjkSYrfUN0
Z6goll2IBjf8KdgoVDKTun9xYgsWOhd9hApxnL6YyNhvrcRm9YpIc2MmUOIa0Lkz
JeOQVo3S7NXfWJhdcmtGJKO/LzMPpsUlLC5r98dDBs0ij+cUr9oNje4BX3w7pJrH
PJPz9EkboVEn5Se18EiLClDP68bWgKqhLH3ZYLd9pMVR457ruZRd1JG6AmgQ/igX
A9dKEPqz8VPR+zzyw7qcyCHu3to+EOs2jz/TkWxUcDFEDsXA/Ol/igj1OhC6HFax
4quIU27MOKSF9e92h/qYwhx1JL7Uag==
=5bws
-----END PGP SIGNATURE-----

--KSzs8cR3CPCR8pfX--


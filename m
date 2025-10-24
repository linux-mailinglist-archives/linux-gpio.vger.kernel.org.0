Return-Path: <linux-gpio+bounces-27594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC99FC070EC
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 17:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2870A5074FD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 15:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424C832E72C;
	Fri, 24 Oct 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FED6PRF0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53632BF26;
	Fri, 24 Oct 2025 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320806; cv=none; b=E0K4mOKRbbm4maYy5ra8Is3+owjPItrTbCQ6jjW8iJvs8vVJzaCdZn3ql2OqUaru1zj4gM8IG26zA+rFHcZ3eeY+6mFy/5bkNiV3a7OwimBSsvUXa9FLPbODL1bf3e5g00LCUQkpMf/VCwsM5Q0HihOPADr7G3tP2hZXP6WsXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320806; c=relaxed/simple;
	bh=zvtebLkkuQCoQo0QjrHJUw9NfExlupM4hl8VmlJ0P1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARYCLTfwD1oSJFaMAKX5meuTovdwHCJ+qj+ibQRD7qcmlQD4NpoAKpew+lR5pFTKD14oi5zlrvRFzaSQ5HpRj7+2pBBXgxIj1uSPvVE+S/S+pbO5hLLwho0rAZ6OVasMELsBcXSfiamZg6c+3L+xSioJZl1iVEKDS6enVx67qqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FED6PRF0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E90DC4CEF5;
	Fri, 24 Oct 2025 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761320806;
	bh=zvtebLkkuQCoQo0QjrHJUw9NfExlupM4hl8VmlJ0P1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FED6PRF0FA8+nlr/HlLEfF43LNsWs0QIg8r/QjIBGhoIAyWihajGtMu0JKKWtHxH+
	 e4l7iiKcQU+oZMoYTX6dCA5qpzH5rEQKZdCBstaCvvkbC8me+bU1z/V6p0Rczkme19
	 /EG1ohoCeUdv/6oTg1PqcAa/0QLo/m9IEM79oa975Go0Nnozw7KyQCSGgobvUrTI0Y
	 0Fia0LJIiS7mtkKd0S+zwSwXFcuHQ7AQ0J4Mj/IwldDvhmC8HuHKx3Rd8m/rzwTWmS
	 cU5yDaAzGhK9wzlOnfIFNWiR7JtgMor9H36djMVo8ZGVJeyxJ9y5D/9t7+AhqhhjZY
	 0coJmUKg1gQDw==
Date: Fri, 24 Oct 2025 16:46:43 +0100
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
Subject: Re: [PATCH v2 09/10] ASoC: wsa883x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
Message-ID: <aPufYwKl9tO-CpYA@finisterre.sirena.org.uk>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZBvVvXfbmyXlx32a"
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
X-Cookie: If in doubt, mumble.


--ZBvVvXfbmyXlx32a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.

Acked-by: Mark Brown <broonie@kernel.org>

--ZBvVvXfbmyXlx32a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj7n2IACgkQJNaLcl1U
h9D+zAf/bHPneBO59HMxvTqSA7qwe5d18hYIFoClJQyzpVYO40IIpgW7KGAMyuSJ
ZN1w2OW/c17eYWwNHthbQsypcLB2T0myY672FEjYBtli0WV2DInFSDYi+lTu4oEF
0dMt2bGGyXwEWZDwqrM2BNcGPd/4hdQMOnmTntTKz6zDvh33yMozXDdFJegd3x+e
x4y0BpGe1AOPFOTjqg823dFa4EY8i1BWOEj77aR4YmFtAad83mxxxZtB2PwfYDhd
fs3g4W4JTr+6zGsi9KvGsyN9Dzl7uU72wOJZphF4YJe/WW+Ngmy927zfloUeLrth
EGmRsRYyBdElapMKBv9y1Il+ub7mcQ==
=zYnL
-----END PGP SIGNATURE-----

--ZBvVvXfbmyXlx32a--


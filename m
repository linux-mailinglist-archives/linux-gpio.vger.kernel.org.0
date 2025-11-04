Return-Path: <linux-gpio+bounces-28022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FDC3182D
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 15:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 178884ED097
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E387D32E13D;
	Tue,  4 Nov 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbvOoIJ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94480320A04;
	Tue,  4 Nov 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266433; cv=none; b=BhdWAKNrorWEpF4d+LdiXqWSjftdDGAAzsbTXjwavkr8wsO2FpfoJ9JJPSSZ7eoHUba+6eKpGggJKBJrcjK4Qn62HnmYlVU/CyQvRTLQMjnFkvdraHoVfHLFxVmoVzhdbn7d98MA7xsknlw8ITFxz7KfsMFmrRcEILREkvxMSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266433; c=relaxed/simple;
	bh=Do45XQ7URvJcMZIQRLAlTFW17pLJDjXdNJtEHMyDtds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMPvYiO1FV02KK32u0QYiKquGBmHpsDnVLpkOkWA/OL73R7G8JPPf7o+Qs/sV/syhxbNRm3en8zF6CkCnvIj9PR9GSFnalG5PhQt1rbdKaTPqMS3vDpz7y98lzgYYMZGkHAfHtZrQxdPxer7RrZZHQpYrmo8ezIQ9Im/fMP/pYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbvOoIJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9519C4CEF7;
	Tue,  4 Nov 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762266433;
	bh=Do45XQ7URvJcMZIQRLAlTFW17pLJDjXdNJtEHMyDtds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbvOoIJ281DWQPu5dTDNwHAgm2FxaQ8EsfS/xeNuo0CW0N+23ZShrs2XidA8Nff1P
	 R/F0JigHw07kiD7oEG7qhuIn2J9mY2z2kycck0/KCCmxk+AUKKrSygV7XP28acVmUU
	 VH6BdkSVIJY8ma9Y5FZJGhP456Mm7MhUBNZuzh2kxWqaY63eKfYYwrw1AYxBCfb+KW
	 b24RVgmGKvZVXBaOATziZ206XLA+PM9qGe7REehn+2mn9M+O46eq8JtYebwNEpWzBq
	 3L8He0nAklqaZzwDiy+Psz6BFL4YNzU4nDkp4OBkTxvHwVIgDIBCGfu1D7ebQwWYGf
	 R4re2yofwhcvA==
Date: Tue, 4 Nov 2025 14:27:10 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Message-ID: <aQoNPvwUCE9PijJ6@finisterre.sirena.org.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-10-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rbUu32wzqf51oqJk"
Content-Disposition: inline
In-Reply-To: <20251103-s2mpg1x-regulators-v3-10-b8b96b79e058@linaro.org>
X-Cookie: If in doubt, mumble.


--rbUu32wzqf51oqJk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 07:14:49PM +0000, Andr=E9 Draszik wrote:

> REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
> allows a more natural declaration of a voltage range for a regulator,
> in that it expects the minimum and maximum values as voltages rather
> than as selectors.

> Using voltages arguably makes this macro easier to use by drivers and
> code using it can become easier to read compared to
> REGULATOR_LINEAR_RANGE.

It does introduce an additional layer of indirection into the validation
that the configuration is correct, the reason we use selectors is that
they should map directly onto the register in the datasheet.

--rbUu32wzqf51oqJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkKDTIACgkQJNaLcl1U
h9BVGwf9EQ7spdrjlfuI6ElbTY04kwMWnDsffD1LcsX1SlOL4tz8xP8DT2jqRGTj
PIt+2km16qVoxcYSWaLYcVWoiyho5wYTjCPRs3pxmIZbtbDnGlWVZsNPeIwFxqYu
D4JQEOrcrZc6TrSN2anfb8QrCiljJgN3toDogQUxj59dgKAyj0RMTWEFxksDXNLR
Ojm+ySYkLPHSKflFMlaQCpcHEozgSgQ56PASSHkxvr++7kkpdnJNBZ0jNbbgADRM
yBKo+TmFzQl5n8eH/eW8GT2rKi8CG0wqVROvH/E9lUMyk6sxWXWo14IIPx5MMBjX
/5HIg/oT9I3NHuhiPnNWtLfVti4J0g==
=Nlw4
-----END PGP SIGNATURE-----

--rbUu32wzqf51oqJk--


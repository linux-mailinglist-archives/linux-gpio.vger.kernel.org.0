Return-Path: <linux-gpio+bounces-28699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC7C6B86F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 21:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DF5B4E38E3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 20:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE63C2F6194;
	Tue, 18 Nov 2025 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiStUEVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626D2F5332;
	Tue, 18 Nov 2025 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496516; cv=none; b=K1HVJgAymsEQxKijbSto+/P1IP2jT4cPa9Ru82C6wtmrdEM8QpOmRA2zHtKCpd9nks3DAO0kWTwREKjBAmosXdogqGi91t3kMZ8YGvuvkFaMSM/ChwUCV9dTH+wifYvO2fvvBN3mYlrobGZZhoHNJSrtOkd/iNGMkkrISSBE+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496516; c=relaxed/simple;
	bh=I9NJ8QsMmLs8aXR2xzyVxzaKotynHSg15fIr6WYysLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Orvlwfw/9YKcLuOE+ms9O/Ev+v6mnxCkm+riahAJSl5rFzCYC53FOVgzkakFhUZOpcXTp01FgnHnKDNOgxaBKNWxa1I0yVwlG9jtZoe3X8nqkHAUinqDihiF1CR8DgoQax/wp8ebIapECsYXHnFuc7forRHhY3+1q+OjyaH754M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiStUEVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1C2C2BCB3;
	Tue, 18 Nov 2025 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763496515;
	bh=I9NJ8QsMmLs8aXR2xzyVxzaKotynHSg15fIr6WYysLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiStUEVulmMCtlMH0McM2lGZe0BKXYCl9l2kwicQCwyUOVWKPU3q67mewNmqP6xWr
	 FsV7USjITvn0zZJOJWZLPE5lCWcFC6RgUADuEd/9ASo2CsoetKcGPJlvjKY8VWYQS4
	 /6uGLibD3WGjT0s4Vw0e1B2/XekeiAnAD7RARC+LLrwK0WW4WVOiSRoslmq/TRV/gO
	 QhdPfI69wgN4lRe3cxgBskp0+llwIYNmLfehRmjBpwqKmnqipjJHba1hdTe6TZYOOI
	 QDFTfEFZYAU9Dc8krUFUPyeArQv2IusbvaO5RVcFMQT/A4YJbeezi96DkW8274iZbO
	 QEw8IzhbDTQPQ==
Date: Tue, 18 Nov 2025 20:08:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: shared: fix a NULL-pointer dereference
Message-ID: <6a6e7d2b-dfe5-443f-8496-4429bef391a6@sirena.org.uk>
References: <20251118200459.13969-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8XOCS54HyAp+IbE/"
Content-Disposition: inline
In-Reply-To: <20251118200459.13969-1-brgl@bgdev.pl>
X-Cookie: Protect from light.


--8XOCS54HyAp+IbE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 09:04:59PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The fact that CONFIG_OF is enabled does not mean that the device tree is
> populated and that of_root points to a valid device node. Check if it's
> NULL before trying to traverse the tree.

Tested-by: Mark Brown <broonie@kernel.org>

--8XOCS54HyAp+IbE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkc0j0ACgkQJNaLcl1U
h9D+Kwf+KuibnTvtUWPtVDVuPLPaoft+eEjGSWG+54BVFp0VsNmDCR26PeTUYkga
rmbzrWZodVm4Ht6Z0oQmKYIJ0NaLwbnwwZlDxrR+LB5jqQMPsRdUoAUZDOf3O82I
773e9I+GTtUG6aAoZJrcOc6jxB3o8+lBPcORE2VCQy6BMXI4SHJ+TQ+DN53nMZVX
WGUQCneC+WmXeV8pLkHYA5/xI0UtlNwpMyfxo9NGpArdjQThJfSQyv5y0IT5ATZY
iYPHW+MTA2WgYfGq/muEglwhMN83QHaSRPBbpywVs6Cyma8zvBn4ZfCldcNvujfw
WRIantrzrVKk2IafskDup6LuqBD9hA==
=t9Bg
-----END PGP SIGNATURE-----

--8XOCS54HyAp+IbE/--


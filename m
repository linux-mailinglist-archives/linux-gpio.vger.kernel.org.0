Return-Path: <linux-gpio+bounces-25307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A9B3E03D
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32DEE3BDDE8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE2530F53A;
	Mon,  1 Sep 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkWonKTu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3470D218596;
	Mon,  1 Sep 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722940; cv=none; b=HxeL7DbX+JThJ3rFVm4PrfW0wFQPK84qMsOpxhdtvlg92zrVn45lW3W1AbcuQvX6uhTnIEiOiW5762cDU62w0BG9pXWbN4uj1e8KG8XE4zGNAffPEezjekN3jdju/4qloVJLIVs4R+4F5lexgfIJdvvsfx/N+pRVb+xseTIYjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722940; c=relaxed/simple;
	bh=PAYtZO8rvHPxpnmsKxZMRGL3a2TAeTujErtp5EkRzUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvHsX7ROl8Cn0452USwA/4B8ithPg73mB73jLgrvpa3w5wOvTH7Oqyuh8BnEwnE380o6vUg86Z/DrsSM+ybyujUni07EI8KhNqYN/BhLcTpMQtEx2S7Fsxj5lupRfvm9D+je8POnHPfk9EqHqjqM3Zj+G72SYA8CS1EpePZOkyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkWonKTu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8BDC4CEF0;
	Mon,  1 Sep 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756722940;
	bh=PAYtZO8rvHPxpnmsKxZMRGL3a2TAeTujErtp5EkRzUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkWonKTuwJXwZwPxsldkF2+jdXEt6d6brcIcClWo7h5sS5PFjiw6tVkMB5PCv6kOc
	 UFLGAN8SpbSZGAwbMmpHageIXA0lJXx7VnxLaBl4iVubU339KvDguttH9DIW8m77MR
	 FKJTfCYoYXJFY4SUx25FzniWOTQ3HLd1x6Ov8WsO+Y0plSJoNhikjivnRT2H9g7BNt
	 VIOJ+rgmL00E521uaCYVYoSG/3NgL/bvZlxKAnv7QI4wOP/x7lVMFAtYspdR9/e6ds
	 PkfeTbOlx7UdLPmLDJ4BwKfi0DcASgrAmYs5rkn/aZbxouKDrLIYB3H1IYpd+ZhAa4
	 AQKQD3+dU7Kow==
Date: Mon, 1 Sep 2025 11:35:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: tlv320dac33: switch to gpiod api
Message-ID: <7de59d85-a72e-4afa-b3d7-8729e22f4c3f@sirena.org.uk>
References: <20250901035956.1195081-1-alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0pbq1X1Bu6UZ70ua"
Content-Disposition: inline
In-Reply-To: <20250901035956.1195081-1-alex.t.tran@gmail.com>
X-Cookie: Auction:


--0pbq1X1Bu6UZ70ua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 08:59:56PM -0700, Alex Tran wrote:
> Changelog:
> - Changed reset GPIO setup that uses 'gpio_request' and
>   'gpio_direction_output' to use 'devm_gpio_request_one' instead=20
>   for legacy support.
> - Convert to gpio descriptor for use.
> - Better error handling with 'gpiod_set_value'.
> - Removed cleanup of reset gpio as gpiod api is now used.
>=20
>=20
> - Performed full conversion to gpiod with 'devm_gpiod_get_optional'.
> - Removed struct 'tlv320dac33_platform_data' as it is
>   not used in the kernel.
> - Removed file 'tlv320dac33-plat.h' as it was not included
>   anywhere outside this driver.
> - Removed 'power_gpio' and added 'reset_gpiod'.
> - Added default value for dac33->burst_bclkdiv as it can't be 0 (2-17).
>   See <https://www.ti.com/lit/ds/symlink/tlv320dac32.pdf>

This is a set of separate changes which as covered in
submitting-patches.rst should each be split into individual patches,
this makes things much easier to review.

As also covered in submitting-patches.rst any inter-version changelogs
should go after the --- so they can be removed by tooling.

--0pbq1X1Bu6UZ70ua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi1dvYACgkQJNaLcl1U
h9D9sQf/fvSmTxKv27Nx3uUb+QHN1k5uJGC6hMwPvA/X+F26IX4scR1QPiGoVdf2
w3Sa5sbaPBeZAak88tCD07XDQ6wUldxd/UhAJbO4Ggvhv4k8cw5WDA0tvFchxnPA
96WK07tdJtlXFH3gFMhXGOk//knMLqVnqcUZlL+4r3G5V+GrSAHBVNLFAaVU8t5Q
RYem39bkzoNfMuKYeFEnPqp95IcbzsKQYcJJCKhraJv+jPCuyV7tL8yjNG+Sp3aC
A2GMKsjHJ4RJQnL6PYddjUhaYlc77Rlfp6AnhAkVT9SVn/8atvYt1qI+G5fFR5DC
MRqCJ0CGuNTZOOUoYsTPe/75CgDARw==
=xZKN
-----END PGP SIGNATURE-----

--0pbq1X1Bu6UZ70ua--


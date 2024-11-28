Return-Path: <linux-gpio+bounces-13336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A19DB78C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 13:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFD7163370
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 12:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B021519CC11;
	Thu, 28 Nov 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP2GI/AH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BB19ADA2;
	Thu, 28 Nov 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732796909; cv=none; b=KKJCcCXeKgB0wqabQBog5q/Y1ZZGVLBo5cFVDtTBnDs5B9NPCgY/JaiStHghwFUwLshTerBzAKz9RQGTcaX1CmKWbTXbNqq+nMxEkgi3Ugl1u3EZ0fivovppkokFbPOTl+ZUr+TA7w5mp5PtUDhsuD+FfK8oahjV+tKuJsuXnHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732796909; c=relaxed/simple;
	bh=MHc7zFRNdcoYDHMMyGXUp65o6fUhD22xiGSStCZ2fGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohh1/jKrtxX70tGrqN3Uf25XG0/78mytGNhZaWUzLd42lNZix+fQdGXtXSIRo86duPTLu/YHeUwNnqEFM3/ehCoqQPRECso68APZICH5v07p8UeOHtMYnmudSzaYNSiAx7DTDTiRYnI61D/J5PJ/9VKxmw2QtvvKedvc5y27fmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP2GI/AH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C94EC4CECE;
	Thu, 28 Nov 2024 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732796909;
	bh=MHc7zFRNdcoYDHMMyGXUp65o6fUhD22xiGSStCZ2fGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OP2GI/AH9EdlmoPyIxqSeDnR9e4mKju3AHGUhh97t24dAh09SDwJBhE32aXLBzVCW
	 NTgP73nxKohq+hWy7hywd0EpULCCKJeauzYVCyocErAsKNOzg4kXcrJvKSgUNE04fk
	 4W/wBchONMdUVbIbOa8q52gF4878ei0PgbbDopqMMXi7e00hdtLEAF4ojAoziBgi9/
	 pwFrMMAfW9B8eHeP0h1Wdv5EgZNMXKVOb7qaPdOheP4CI3QPwhwPB9NjcPBouKKHGc
	 hu7XgKqS4isGQqSkE0+AoALZWTtOuUpDUGJNWaKScPvM60lpz/fiyiJ6z4WScJ37rC
	 6Fe/vEBgxzWbg==
Date: Thu, 28 Nov 2024 12:28:24 +0000
From: Mark Brown <broonie@kernel.org>
To: haibo.chen@nxp.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
	marek.vasut@gmail.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] gpio: pca953x: do not enable regmap cache when there
 is no regulator
Message-ID: <f71643eb-ee9c-4b39-af26-738ae82fd4bd@sirena.org.uk>
References: <20241128020042.3124957-1-haibo.chen@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l04+5UwyAsztrhVZ"
Content-Disposition: inline
In-Reply-To: <20241128020042.3124957-1-haibo.chen@nxp.com>
X-Cookie: Close cover before striking.


--l04+5UwyAsztrhVZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2024 at 10:00:42AM +0800, haibo.chen@nxp.com wrote:

> Regmap cache mechanism is enabled in default. Thus, IO expander wouldn't
> handle GPIO set really before resuming back.

> But there are cases need to toggle gpio in NO_IRQ stage.
> e.g. To align with PCIe specification, PERST# signal connected on the IO
> expander must be toggled during PCIe RC's NO_IRQ_RESUME.

> Do not enable the regmap cache when IO expander doesn't have the regulator
> during system PM. That means the power of IO expander would be kept on,
> and the GPIOs of the IO expander can be toggled really during system PM.

Aside from the fact that the device will always have a regulator (power
isn't optional) this is obviously not related to any sequencing needs
that you have on resume.  It might happen to work on your system, but it
will potentially break other systems which do actually need the
registers restoring but don't have a regulator explicitly defined and
will fail to do anything on a system with ordering requirements that do
have one defined.  The fix for this is to make this driver resume early
if it's needed by other things that run in the resume sequence.

> -	reg = devm_regulator_get(dev, "vcc");
> -	if (IS_ERR(reg))
> -		return dev_err_probe(dev, PTR_ERR(reg), "reg get err\n");
> +	reg = devm_regulator_get_optional(dev, "vcc");
> +	if (IS_ERR(reg)) {

This is obviously buggy, the main supply for the device is not going to
be optional.

--l04+5UwyAsztrhVZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdIYecACgkQJNaLcl1U
h9BgNAf/dTR8Fzvk8LYCiJ/tU5uFh6TXYHDwWOp0ZMpPqUPcM6UbZkCkSJxbOwut
kLASTbXndT33wz+o8HgkiX5+aB2hN61CJFbPDp/FmXXN9I6sp/rQQVyJMxMm8JRE
Kp8D+aSAqZlIkEcBllEmxAbVFOZRNfxWP9cTRQqXRNHJOurMJf1aoPFBmhsXN8sa
6vQ9gJZxM7tOPMkeCTmNQ4HsNZYFVzImBAhvx3QGEo5HATG0+atay0WG0N6wUsuD
lOfF3bJqAJE88/Cx3AhOTxjbHtNNvXVtS6SHxMZC4bOb3h8MuAFJXYRa921v4eg0
rpCv8UE5zNlaI3CIRXQkOfJYk2+gPg==
=5hum
-----END PGP SIGNATURE-----

--l04+5UwyAsztrhVZ--


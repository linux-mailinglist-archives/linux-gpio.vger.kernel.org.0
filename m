Return-Path: <linux-gpio+bounces-26476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A36B91BA4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09AA0422FD1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147F621ADB7;
	Mon, 22 Sep 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gibikQpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF401547E7;
	Mon, 22 Sep 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551483; cv=none; b=Q1BLcN5m3rH5AbqkmSJuuOvLdCPCXNBW606N3gp/qnpssUyivTAdoe1CXEj48pbweKnvHUP6Kukkm8cHUqCB9hgaml/4ArTvOedFWfZ0jd2rRgcVfwtYw+LUFH+O3v6pPvfFlPw/4RCaeHx0HONksFe6c1o73vSpQbqETZzeGHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551483; c=relaxed/simple;
	bh=n6j2HBeI7P++2A4vEo/7nr18JuJhi4dzRcmp+pxR+qo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=Qenb0GmerjDxyv3Y0Rj2Yg11CBWuCW8TAkfBvbACBcrUoW1VAnQkrhJiF54Y0tKa8AB4tkLvs8Iyh7goIRsGvKjrZyjA70y97UlHwYA2OX5evD6+DWwpmlBzyBJtvxjc1CjTv/NCREMVva0X3ZyvfdhaqmZW1y6aXLGJrvOgHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gibikQpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C17C4CEF0;
	Mon, 22 Sep 2025 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758551483;
	bh=n6j2HBeI7P++2A4vEo/7nr18JuJhi4dzRcmp+pxR+qo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=gibikQpasqOlnlnc0BFXXZerGqrPZLZ1u8ZhzbDEHlwlGmYLrkVatGPWCxmKbA525
	 uEoKdWy8l6XaScxRUvwKpOTyNk2GQHsb9yHjy9SqCUpPsTEwTfxcK3d2uX5piJnKqX
	 bNjOJsz4RkBdnLKGtugOSj+5plu5sZT053mCpSyEstyoL4pMf4rF2423m0fLzlU7Vv
	 sqeklAGTD2Jq3U2Qo15MsbMjAlByCwJelMv+dprI61Mfs7tEvE7kNVK3Q4AAQ+YqSh
	 ojVaikiQcJ2NtmlF37VZur79KoGQkR7V0T5iIm3RInby4D2/g+ftGOIYrcPOEzGEcn
	 FbnJvqQOfa3Qg==
Content-Type: multipart/signed;
 boundary=f956d6cccf0b57b84ee20053b25104b1ec48e1430d988842b38315809f52;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 22 Sep 2025 16:31:18 +0200
Message-Id: <DCZEH0LV61DM.1G2AROXKGOWBR@kernel.org>
Subject: Re: [PATCH v5 06/12] gpio: regmap: fix memory leak of gpio_regmap
 structure
Cc: "Frank Li" <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo" <shawnguo@kernel.org>,
 "Lee Jones" <lee@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
 <20250922142427.3310221-7-ioana.ciornei@nxp.com>
In-Reply-To: <20250922142427.3310221-7-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--f956d6cccf0b57b84ee20053b25104b1ec48e1430d988842b38315809f52
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> The gpio_regmap structure is leaked on the error path. Fix this by
> jumping to the appropriate kfree instead of returning directly.
>
> Fixes: db305161880a ("gpio: regmap: Allow ngpio to be read from the prope=
rty")
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Suggested-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--f956d6cccf0b57b84ee20053b25104b1ec48e1430d988842b38315809f52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNFdtxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g0DwF9H6aVPsWrIWXfIV3w34KCRnJBE3vXGa6r
YzEUmVyN17OX/nB/okq8660PGFA2xDu0AX9b4KGMuu7IX9wIIz3xY3q3951HAtB2
eSONUcOXqVPWdSLr4xsrwQSUWYhuCDB2gWY=
=L7E1
-----END PGP SIGNATURE-----

--f956d6cccf0b57b84ee20053b25104b1ec48e1430d988842b38315809f52--


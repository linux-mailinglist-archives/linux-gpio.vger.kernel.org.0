Return-Path: <linux-gpio+bounces-21408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBCFAD5C0F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 18:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260EC1894E46
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 16:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3431F582E;
	Wed, 11 Jun 2025 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duQbIDmM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F81E521A;
	Wed, 11 Jun 2025 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659138; cv=none; b=P+r4viBxV9rTNvxuMVjYvtZxAUq9WpOe+BeUM5LdgcZ+Mbm21svfbhv/1TP8gOit8z0nvw4m706HXGwWGMzOsJ443KR+d6H8drQCTVkNufasBUwgUEGhxsmoF4AJj7TogHLceUVpy8RJSMg7YWdFnE+T1IdHwsdH+Vh7o8kcsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659138; c=relaxed/simple;
	bh=JoKvHcd/16FOMfJ8hZS2otWQ1fq0YEBXKYnmBQ5qxos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3iBo4JzThsLQrEbNDXSfb5cK1gfkJwSSUSygiHDFlxKfcvTLZU/7HGwhr9u+8Yr9Ar/HBYQ53RZeAKRH7PLAEwaEsdqTQmFhT1epywWI25nrDujpHbFrl0rrnQYpOrjmLyDrg3V/4/IX5Ido0PDGeKuISe/72kVJi+wirzVvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duQbIDmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B85C4CEEA;
	Wed, 11 Jun 2025 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659136;
	bh=JoKvHcd/16FOMfJ8hZS2otWQ1fq0YEBXKYnmBQ5qxos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duQbIDmML9WvmIyfdCPqarFvaytffHe4zKpMK0erbva9VbrUlErgN/6KcJi4OyCA7
	 AN4DOtRiELMvi4IvMnKWVfkrD44EOr4cgyg12PZFlhvvCnuXmlgUXctRBNxlkg7NvZ
	 Zn6fqbk5jhLnKDtn0FlKO0DJKbJ9U4MpM5KKc62GOFXRPFBUjlpEWIxZoMneaszy5U
	 nk+2HWCa+0dsE9UkEF7TRsOorBHwcjDY0w7Iap3O+EcdS3hcbpzG/PkmsRwLNX9zWw
	 clCwiLW/Wy2K+Q1KoMqG92sy56+6ak8cxblNoL6NqJ4Jv473Iy7X7fyWRrYgu27Db8
	 vkq4KbbBM1IOQ==
Date: Wed, 11 Jun 2025 17:25:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC
Message-ID: <20250611-ion-barrette-1e43f2620c03@spud>
References: <20250611133137.1686183-1-mwalle@kernel.org>
 <20250611133137.1686183-2-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NPyqz6VEAkXZBKkJ"
Content-Disposition: inline
In-Reply-To: <20250611133137.1686183-2-mwalle@kernel.org>


--NPyqz6VEAkXZBKkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 03:31:33PM +0200, Michael Walle wrote:
> The TPS652G1 is a stripped down version of the TPS65224. From a software
> point of view, it lacks any voltage monitoring, the watchdog, the ESM
> and the ADC.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NPyqz6VEAkXZBKkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmt+wAKCRB4tDGHoIJi
0qOfAP9B2sAwIv6xmvc26A60sTqWMV2cr7IVjvVfmX7DHSkg/wD/QjCLgH9LDlwO
hmaJmmJp9+R/hjvg0es3TISpx02CFgU=
=uyTT
-----END PGP SIGNATURE-----

--NPyqz6VEAkXZBKkJ--


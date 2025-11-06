Return-Path: <linux-gpio+bounces-28224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE96C3CF63
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 18:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BAEF3B4CF6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 17:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D9434F27F;
	Thu,  6 Nov 2025 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbWiZrWj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788E9302CB9;
	Thu,  6 Nov 2025 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451237; cv=none; b=drq8903pPRW/pgS6F5FAdFH276ZXLgCOlelRp69aX6GfI/yj1Wv8dMLd32I6IMROyTq+u/s6dhwNL2AIplukecIa1W++NxTo2TZTeATb4pNBen2p4aDrLrP7Xb3F674H51YARLE0O1M5k2B9lLYGpQ1iU/QextGRC2lQEgcHAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451237; c=relaxed/simple;
	bh=/LEeDzLJRYE2r2N+metFxjEYaagZ6NINjIeF5iQDh4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmmkcpprDauzejmHiyBUEpWfFz/fCfmFqqJoJ31zCHOb0rbVUXTRFm6CHJ0Fh3idwYg0vQrer1S8PdTY4fafd0oAygf0iIiE70qzXzhxr0o1ZWKtRReJChUfcZIOz4eobY+7K5WMM4VAAWiIs2+q8c5fcL9rfvoEdacRNHML5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbWiZrWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5050C4CEFB;
	Thu,  6 Nov 2025 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762451237;
	bh=/LEeDzLJRYE2r2N+metFxjEYaagZ6NINjIeF5iQDh4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbWiZrWjAwQ6I/4uXUNy2SVW0oZBNutX4rTh4Sv/ER7EgCbYnMOjJTGKnfKtET44w
	 lH+5mPM56eRoU65ukFWBa1WtJl7EvncewcNuIy0GgXNceDG9iIH9Equ0Vp2sVuBy0T
	 HAKnJXchXg+unQaMsZn7hc+gFv18re2ZjOY7Hz4CCjTOwD+g1Vl6HPyrR6fFgxpeDU
	 Jd4lHUJ1qkmTsyAkxVC5Gjv3jcunRGcelFKTpM+Iz8M/Dh4wSkiJw23eXlU+dShyYT
	 eMqHzQUI9B+fXWOw+JMUu4UPgN+PzMKtCssl0gegsaiSf9hZgJmWa2dCFgfx4tuOEz
	 n14czvuH4gMUw==
Date: Thu, 6 Nov 2025 17:47:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: gpio: add gpio-line-mux controller
Message-ID: <20251106-handgrip-snoring-8e584fc97d3d@spud>
References: <20251105163610.610793-1-jelonek.jonas@gmail.com>
 <20251105163610.610793-2-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJbGYoscspRqwJeE"
Content-Disposition: inline
In-Reply-To: <20251105163610.610793-2-jelonek.jonas@gmail.com>


--DJbGYoscspRqwJeE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2025 at 04:36:09PM +0000, Jonas Jelonek wrote:
> Add dt-schema for a gpio-line-mux controller which exposes virtual
> GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.
>=20
> The gpio-line-mux controller is a gpio-controller, thus has mostly the
> same semantics. However, it requires a mux-control to be specified upon
> which it will operate.
>=20
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

> +  muxed-gpios:

v5: - renamed "shared" to "muxed" to avoid confusion with Bartosz' work
    - dropped Reviewed-by of Krzysztof due to binding change

FWIW, I wouldn't bother dropping the tag for something this simple.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +    maxItems: 1
> +    description:
> +      GPIO which is the '1' in 1-to-many and is shared by the virtual GP=
IOs
> +      and controlled via the mux.

--DJbGYoscspRqwJeE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzfIAAKCRB4tDGHoIJi
0q0LAP9I7LAPO3ZNVR4Unc/5FmdRcCuhCG/uXxOh4N0mkZ+x/gEAos+sUM9xMU8C
THuRavzXcJBYcMPueVZ+FTgnvSJJDwE=
=GLU/
-----END PGP SIGNATURE-----

--DJbGYoscspRqwJeE--


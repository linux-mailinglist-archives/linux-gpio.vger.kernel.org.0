Return-Path: <linux-gpio+bounces-21540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F988AD8BA0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B0216A9FE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602D02D5C88;
	Fri, 13 Jun 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oR0qDPoR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD922DA0C;
	Fri, 13 Jun 2025 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816463; cv=none; b=Z/9DdReZLZqKZtYGEqOvxWcCqKjkb7JVmEw5m8NSDLProL83DS/8IdN5v+BwpkSKAalpvTxJ5R8/kCB/A5SgpE1e3UDaB6rqmsYfGEe5ZPJS+rrjgpFnLSLE7aRp0PZwiVsvExvGHYWATim9W0/bFaNerURCt2Nu67h4BxiklLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816463; c=relaxed/simple;
	bh=zmixJqT+qnhq9tOVUyzq9GN1CmEoe3UJnls0UqSmEEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUwByuiHebSngxnoIPioPXog0zv/C2F6f/F82hNDwOAoQrIVIwDYo/rKp/fAclnrxBDkW5HPBC+gkWep6oNVWGNcaqLtwK9QL3H+8BNYk9JcznNxSgDQYp0r1kQqXXp2kv3V0Tl0LrE2/syKI+seIgld7vkF9Rv69JCUs0JsBMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oR0qDPoR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D764C4CEE3;
	Fri, 13 Jun 2025 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749816462;
	bh=zmixJqT+qnhq9tOVUyzq9GN1CmEoe3UJnls0UqSmEEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oR0qDPoRWfpDHBJQO6hyV7QEIZbpkE4nst8WWHkhc3FIkWfPOLb9CmVLUbf2KCafM
	 c1MJxCVgNRz8Kaug2d1LTaOiG59sgNiPTV4uyOMTXQMoOgpsfRDdrOVb3ccfucqSUI
	 BzrUwo7+9xfz3j15iszoU/XkIsU9N9oK5a7NiSiwa2K1f0k1BBN2UDSH8995lmfGSg
	 OIe8PINoMX9385fJC8nwiablTqjODVDGMWoPxfSvM+4AzDJQBGJxCcSbS0VuZ8o8gJ
	 HRbAcyI+7TUAOyf0+x6n2cKy0+LBqoyzQFanLh4XErVFuZPkSeifyCMftAdX6rL6F/
	 /+zjfs15GX7sg==
Date: Fri, 13 Jun 2025 13:07:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 7/7] regulator: tps6594-regulator: Add TI TPS652G1
 PMIC regulators
Message-ID: <735fc700-9cfe-474a-8c9a-8469e95bfb72@sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-8-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8PGlkFG+A9i0O2ul"
Content-Disposition: inline
In-Reply-To: <20250613114518.1772109-8-mwalle@kernel.org>
X-Cookie: Use extra care when cleaning on stairs.


--8PGlkFG+A9i0O2ul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 01:45:18PM +0200, Michael Walle wrote:
> The TI TPS652G1 is a stripped down version of the TPS65224 PMIC. It
> doesn't feature the multiphase buck converter nor any voltage
> monitoring. Due to the latter there are no interrupts serviced. In case
> of the TPS652G1 any interrupt related setup is just skipped.

Acked-by: Mark Brown <broonie@kernel.org>

--8PGlkFG+A9i0O2ul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMFIgACgkQJNaLcl1U
h9DDEQf/eMQAHNhzuQ6xi46PDQvyLcZ9nFF42j1GjBneMlZ0FTdvARSKnbCasrq8
ouQNDIW4yGET8wK5e+rUTXPK5U5uvTe/jPzecw8lD4FzXlI7vJDO6N7VxkKkP5sg
VKwqup2HXonwFeDV8BI8QRwp2m5n+S1AVEx4Yu/IBFZF89boZPHoiiRStxafOLRw
By14D68K9zkA4EAffiTmpMkM6HcDx/nbQcEqzG03rr5r0Ahza7W5tV/QsS5dYBMO
Q+QsHcB8UeqnxuEr5uAAvPlCR2xclnrBzRfOShdXPA15nksF4B6Akve50Qq6VafB
/+T/UoPPjIWVjbEJi8qMgmPiONLl3A==
=DTgi
-----END PGP SIGNATURE-----

--8PGlkFG+A9i0O2ul--


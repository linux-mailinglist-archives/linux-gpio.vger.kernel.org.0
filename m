Return-Path: <linux-gpio+bounces-28223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF551C3CE8F
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 18:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0CCF4E3690
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 17:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01CB34C98F;
	Thu,  6 Nov 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPnTsvEg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12AF336EF7;
	Thu,  6 Nov 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451005; cv=none; b=i2ptX8VKDSS/hC1GHLZISMi2BzPM1f2uycyMPe9cSAfCNJ4oR5f5sTpYwFQ9Bn482dNZgj/5ihaapD/3DvLw3vrWsiGdyJeXStY3Ms9RdUYCf6IdYfSNtpcOWqfjPJEsbHiujtBtbbsbsga25ij6hWsRXCRBFOnLiDcq4M7tWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451005; c=relaxed/simple;
	bh=RYg6fgvglOEUOS0tGf68vRf9+3J6E84/lSBqd1aI1sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g19H69yCvtMrNbCFQ4uGOFXb9gaKxXuWQdSkUgxxqUiYvrltkNhfhFH/XGJFMhiPwg5Z+q6l2NvM7ntl61k7k/w5ta8zdOepGc2kRcXWaQRAdK+dXwRUs1ilqArFS5/SFlzaTNCSb1L8JwbN8nCTUsQNd5D8DcvBIqOaDSiFOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPnTsvEg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1992C116B1;
	Thu,  6 Nov 2025 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762451005;
	bh=RYg6fgvglOEUOS0tGf68vRf9+3J6E84/lSBqd1aI1sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPnTsvEgCJHP5uPcj0x5eVXQi3cMNZ3Qh0DH6GuT2Brcz4OAEObzwAJFdboPG/gLX
	 8GSHcYXT4Noef9AFiK1iBJDo8YlryvJdp0kxSD1sV2+gROS0x+l6Lv7F7TbTkhL6ll
	 KJyhAn7zGvRZpQpU2xOXGt1lI7N4mwWaaZzdb6T4ypEaPz+apFQ4Gau8pm2iDkkGrb
	 XhCb5DKYZfYBditTwh/GpFgDqFcLaEjy4sNqxMPOu4QHrVDxwInnT7D4LzblzB4sMm
	 zopAbMSwiK5hI/KA/AIeAN/EUF3QskeLr+5n66PxysHmlJ3EacoVgpy/0lUsbcaFtb
	 mxPaP5xiSPlEw==
Date: Thu, 6 Nov 2025 17:43:19 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
Message-ID: <20251106-strewn-carport-a33a8b812794@spud>
References: <20251105195007.199229-1-linux@fw-web.de>
 <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
 <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxHVsfn4TTebUpw9"
Content-Disposition: inline
In-Reply-To: <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>


--kxHVsfn4TTebUpw9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 10:01:41AM +0100, AngeloGioacchino Del Regno wrote:
> Il 05/11/25 21:01, Frank Wunderlich ha scritto:
> > Am 5. November 2025 20:50:01 MEZ schrieb Frank Wunderlich <linux@fw-web=
=2Ede>:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >=20
> > > Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
> > >=20
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@col=
labora.com>
> >=20
> > Seems Angelos RB tag is missing "a" in "Gioacchino" in email
> >=20
> > Got error:
> > said: 550 5.1.1 User does not exist -
> > <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command)
> >=20
> > maybe this can be fixed while applying?
> >=20
> > regards Frank
>=20
> Eh, have I typoed my own name?
>=20
> So cool. Lol
>=20
> Just in case it's needed:
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

I have a vim macro to a) save my hands typing lots of tags b) make sure
I don't typo. ;)


--kxHVsfn4TTebUpw9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzeNwAKCRB4tDGHoIJi
0sEBAQDh3ELz8Pk02klEc4eajrCSPIBQRJI5YYEM84+8jup61wD/TIDv3g+lbIbM
UpPplLaIvc9wo+kbqV2fcUYFO7jELAY=
=yvxB
-----END PGP SIGNATURE-----

--kxHVsfn4TTebUpw9--


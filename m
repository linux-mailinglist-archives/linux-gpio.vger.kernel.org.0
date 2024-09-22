Return-Path: <linux-gpio+bounces-10351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617A97E3A6
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 23:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1B451F214B7
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 21:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6045A75804;
	Sun, 22 Sep 2024 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCB0tw6a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C696CDCC;
	Sun, 22 Sep 2024 21:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727039246; cv=none; b=qy5C4icQQ0f6frlNAMSlm1C4Xim+xH2b+OMngr0/2p0VZKXG7x9H3jcbJWR3FVuJScEDURPiMxe4NqhSjdJWX3e/yxzrOsf+5rd1y/l0PGl6H5O0C5yfm3KWcn1eRYgNWQMwblbvSH5EDGYVtRA6obcKQhlT1DNKTAne0IdOsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727039246; c=relaxed/simple;
	bh=iAx6L2MGr8BaCtXgXJQSgo9kvlQ36ER0uk1+M8/wDqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTbn0NUSZj7ZBTIswK4Fv62uONWUEZdjZDwxwpZicd5tq32I7WLDuedNv1Q9KEmNHrR5ScISREZlKfhE3tGU8pumG7+IchgH+ixWUSjZ/SFFnKMtdL2MGRkEq/AtfpjLvxE/oqCcNjFt2svrOsRfbYukG6Oo6WdqWcG/px+L5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCB0tw6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9218CC4CEC3;
	Sun, 22 Sep 2024 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727039245;
	bh=iAx6L2MGr8BaCtXgXJQSgo9kvlQ36ER0uk1+M8/wDqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCB0tw6anJVisS//HzOEcJbbh/Ws8UdMCRObDVohZnKyGObuBZBSfGv453Flru0ox
	 5HAreAnO9i7aZ43dLeEZ+xgXKi487eAqBU3iEJNqsB6PZ7FXwCEZ1uIgLEtOK1HNkn
	 a0ozjUQ9RynWqLLU3MJODsxkP/rvL50zRlavwZS7xnkxMSk5VtW80BMFIAqNIpW8VL
	 tzzRcR+B5nmEmtk2iWvp0o7yA4cH8h0SLHrT15xlE3pIIozkUXXoH3GbOipIAXLQS8
	 3LDA0ANxF2vKe8Jqx03y6shOsAhlHPuCGNJ0Ji0SING6i15iHndFt31E7MR2Vd3Oi/
	 n5RspgBhqLS/g==
Date: Sun, 22 Sep 2024 22:07:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20240922-plug-legible-74f56d898123@spud>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
 <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
 <20240921-party-glass-bfb7099c7ded@spud>
 <e6u3kui5md4km5xvjzlq5cfgwvtb73c763uep4j5ysaokmmucr@gz5nxiebg7gu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n2XM9bOSw6qP83qD"
Content-Disposition: inline
In-Reply-To: <e6u3kui5md4km5xvjzlq5cfgwvtb73c763uep4j5ysaokmmucr@gz5nxiebg7gu>


--n2XM9bOSw6qP83qD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 22, 2024 at 11:04:22PM +0200, Krzysztof Kozlowski wrote:
> On Sat, Sep 21, 2024 at 10:58:46PM +0100, Conor Dooley wrote:
> > On Fri, Sep 20, 2024 at 03:40:31PM +0200, Krzysztof Kozlowski wrote:
> > > On 20/09/2024 15:33, Andrei Stefanescu wrote:

> > > >>> +properties:
> > > >>> +  compatible:
> > > >>> +    items:
> > > >>> +      - const: nxp,s32g2-siul2-gpio
> > > >>
> > > >> Commit message and binding description say s32g2 and s32g3, but th=
ere's
> > > >> only a compatible here for g2.
> > > >=20
> > > > Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 S=
oCs. I plan
> > > > to reuse the same compatible when I add the SIUL2 GPIO device tree =
node for
> > > > the S32G3 boards. Would that be ok?
> > >=20
> > > There are only few exceptions where re-using compatible is allowed. W=
as
> > > S32G on them? Please consult existing practice/maintainers and past r=
eviews.
>=20
> Just in case this was not clear - comment "please consult existing..."
> was towards Andrei, not you Conor.

Oh I know, I was just passing through and figured I may as well leave a
comment repeating what I said on the other devices :)

> > Pretty sure I had a similar conversation about another peripheral on
> > these devices, and it was established that these are not different fusi=
ngs
> > etc, but rather are independent SoCs that reuse an IP core. Given that,
> > I'd expect to see a fallback compatible used here, as is the norm.
>=20
> Yep.
>=20
> Best regards,
> Krzysztof
>=20

--n2XM9bOSw6qP83qD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvCHCAAKCRB4tDGHoIJi
0hBKAQC/8pbTdYd/TpUPOHUkfwiU4L5fZC8oY8Iu3BZvw8p/AQD+NA3k3HP4qya+
rjLFLsP8gz2spdWHIoH7Kg4r0KmatAk=
=OFKD
-----END PGP SIGNATURE-----

--n2XM9bOSw6qP83qD--


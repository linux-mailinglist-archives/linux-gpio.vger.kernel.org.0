Return-Path: <linux-gpio+bounces-27042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2CBD34CC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 122CE345FF3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B480922FAFD;
	Mon, 13 Oct 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLLcCoCg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADFC20458A;
	Mon, 13 Oct 2025 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760363739; cv=none; b=RljcObv+aZHwEHJ6nfJJ77YUAQWei61kqLWulmosy5eL9nbQrILxnD8TbDwciqWQax4bdAGm+CwZCeq6ttSoWXsZVyuCjdEsnLmxyfkbtKTbv2OPdAqkPNEswUyvrFsuz1kBVCCgb4+UfEL8aHln1JhmhJzS3KyZxTRdyn6gR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760363739; c=relaxed/simple;
	bh=Xdbch9NHZYMJEpq/uRrya74shnx/1YmhdwzB4a9Mcxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFbnOsKYWiAWHBJoaXrXA+5dQEK4Wl2dZrmnYWOOmyT5S/Q+yVr7C9bULtusATrazqn9c1S3buPcWZISWJlMC/b4gysDekVQoAhfezb3eqGYQHiOB7c9gXr6Ei/XkUQEaCL/4haUaE3juVHe2lNAFSKVPurvdyLYl1PqEsftcRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLLcCoCg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692C5C4CEE7;
	Mon, 13 Oct 2025 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760363737;
	bh=Xdbch9NHZYMJEpq/uRrya74shnx/1YmhdwzB4a9Mcxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLLcCoCgng3m89B2OEXBV39QABBwxxv5OZBa+LRU63ik6oFlNvmQs2WaOJ6mxSGKN
	 XNCsnVco2/KnURndMPIJC9EmnuOTYj2e6UTi0iMntH/5hhFRm6PNe17yQNVry//6QR
	 jtymX8oZbR1ReD9ab2HKQ1uhVQUKMPa8TQvBZBMgI1LRhZv/kjC8nQ/uLwcCrb/W8g
	 hfmtxdfX+VWwkxipWJlHuIzrfZPsdtkAcEIJA9S7RXAvBBtSE70bH50/3dI3eaYI42
	 rfqqCGWOizA2PIP4JKnj8Twgy4ZkIqRqkcEkgQQl14/SnS6chBm3Cxg3IO4cL4JY3/
	 1T1IciFQZmG+Q==
Date: Mon, 13 Oct 2025 14:55:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
Message-ID: <20251013-prune-deflector-b10b84425a33@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
 <20251001-unfreeze-ludicrous-9d744548bf65@spud>
 <20251009-amendable-trimming-da31551d730b@spud>
 <CACRpkdYssH8zObJTUH2VVB7FrVFmJUd+Ea7etTGbicQgkuU=CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B0CMDnHp19mviuJL"
Content-Disposition: inline
In-Reply-To: <CACRpkdYssH8zObJTUH2VVB7FrVFmJUd+Ea7etTGbicQgkuU=CA@mail.gmail.com>


--B0CMDnHp19mviuJL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 03:27:57PM +0200, Linus Walleij wrote:
> On Thu, Oct 9, 2025 at 5:55=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>=20
> > So, what I ended up doing is moving the "gpio2" stuff to use
> > functions/groups as your gemini stuff does, so each function contains
> > one group containing all the pins it needs - except for the gpio
> > function which contains analogues for each of the function's groups.
>=20
> I don't know exactly what you mean by this, but if it entails any

All I meant is that the functions for non-gpio things contain a group
with the pins they need, up to 10 groups for 10 non-gpio functions, and
that the gpio function, since each pin can do gpio and exactly one other
function, contains 10 groups, all of which are identical to a group
already defined for the non-gpio function. That's instead of having one
huge group with all 32 pins.

> entanglement of the GPIO function with another function, then
> there is the recent patch from Bartosz in commit
> 11aa02d6a9c222260490f952d041dec6d7f16a92
> which makes it possible to give the pin control framework
> an awareness of what a GPIO function is by reading hardware
> properties, and that it is sometimes separate from other functions.

That is unrelated, but interesting. What I don't really understand from
the commit message itself is whether this is useful if the pinctrl
driver is not also acting as a gpiochip driver. In my case, the pinctrl
hardware is not capable of doing anything more than muxing functions,
and the gpio function I talk about means routing a "real" gpio
controller's IO to the pins controlled by the driver I am talking about.
The 2 in "gpio 2" refers to the specific controller.
The rest of that thread makes it seem like this is intended for some
qcom devices where the pinctrl hardware is also a gpiochip.

Cheers,
Conor.

--B0CMDnHp19mviuJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO0EwAAKCRB4tDGHoIJi
0vQDAQCV4pltI9IR+yTitYsiAGw3E2j8OAkihYWyHe3i4cwdiAEAor61XC06ylaj
RcCy0q7R8JTUIrtu5Onbjoq84aHpnwA=
=TVMB
-----END PGP SIGNATURE-----

--B0CMDnHp19mviuJL--


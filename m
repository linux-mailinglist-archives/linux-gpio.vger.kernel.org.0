Return-Path: <linux-gpio+bounces-10806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87798F864
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 23:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 288CBB21DD9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 21:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA251B85C7;
	Thu,  3 Oct 2024 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM/4axmF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF61AB506;
	Thu,  3 Oct 2024 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727989317; cv=none; b=nwKXd8F3qpqmrF/Ytnny3J86y0lwW5N3IBEqFml0MlbRcZvN7e9cFI5OMlZOCUj9/pStr0+bmqqsiAbvTA+v/+zSJP3dlnf/fvBxazh9L+NaQTciiT0a40xwYjowEClxr2DxrdQx9mK08j3BQvBAIGPnX0oy2yZWmIg9CEsW9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727989317; c=relaxed/simple;
	bh=8eh574O4F9l+mKqRltFV+olJd6g3O6Fay42ID4YMX2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1faqxgzvXda9fG1ytLi10QJEfNcyVh4G+qyCgr8tIORjl72ZjyzdE6mGUq5X6sR6sjlPg+cbwT3KkOs6yubl2AeUHJp6N3SA+bTyiLMJ4EBjfmremHby0tBk6onQSMalDa/FcYC17tzfso91SeGw85QU1z8ijTCLWvWVyHkJO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM/4axmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0444FC4CECC;
	Thu,  3 Oct 2024 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727989316;
	bh=8eh574O4F9l+mKqRltFV+olJd6g3O6Fay42ID4YMX2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PM/4axmFF0+7VXZB/glU985zwWmYbSL1v8BvxDrgS3+WkyM2CRYLqYgMhkVmNAN53
	 Lc9D9XcHTVUbIMNZM4cMtxX8IKF+3oY/9ZiNnFXpOaScmv07wd7ic/WJH02qewlfQU
	 rK5uCNCmS9Mirm5kTedGuv3uvAcTbhcM9l1/eBEQZy7djMw9QQYlmYjoIYYaNHWRey
	 nOZGqhwgvPqOkKYZAvCX6OTLebLdzvcoGOFTaKkixqTlDQbjZWAe/2QOH3PiZbxQHu
	 EOYvWzZ2+I1n7t5J2PxpOwWdVPI+MPA54kRNX575iBGlKCD/XH3lauRa40hIcLP4Pf
	 8pOHmzy1a0Hkg==
Date: Thu, 3 Oct 2024 22:01:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20241003-overall-unblended-7139b17eae23@spud>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
 <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
 <20240930-shortness-unedited-650f7996e912@spud>
 <20240930-bamboo-curliness-eb4787b81ea3@spud>
 <20d46ef0-8c58-407d-9130-3c961dd1656f@oss.nxp.com>
 <230e575e-b8b6-4671-a37a-085fef761240@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K9R0DwJtUt9wGfTI"
Content-Disposition: inline
In-Reply-To: <230e575e-b8b6-4671-a37a-085fef761240@oss.nxp.com>


--K9R0DwJtUt9wGfTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2024 at 01:22:35PM +0300, Andrei Stefanescu wrote:
> Hi Conor,
>=20
> >>>>>
> >>>>> Huh, I only noticed this now. Are you sure that this is a correct
> >>>>> representation of this device, and it is not really part of some sy=
scon?
> >>>>> The "random" nature of the addresses  and the tiny sizes of the
> >>>>> reservations make it seem that way. What other devices are in these
> >>>>> regions?
> >>>
> >>> Thanks for your answer to my second question, but I think you missed =
this
> >>> part here ^^^
> >>
> >> Reading it again, I think you might have answered my first question,
> >> though not explicitly. The regions in question do both pinctrl and gpi=
o,
> >> but you have chosen to represent it has lots of mini register regions,
> >> rather than as a simple-mfd type device - which I think would be the
> >> correct representation. .
> >=20
> > Yes, SIUL2 is mostly used for pinctrl and GPIO. The only other uses cas=
e is
> > to register a nvmem device for the first two registers in the SIUL2 MID=
R1/MIDR2
> > (MCU ID Register) which tell us information about the SoC (revision,
> > SRAM size and so on).
> >=20
> > I will convert the SIUL2 node into a simple-mfd device and switch the
> > GPIO and pinctrl drivers to use the syscon regmap in v5.
>=20
> I replied in the other patch series
> https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.=
com/
> that I actually decided to unify the pinctrl&GPIO drivers instead of maki=
ng
> them mfd_cells.

Yeah, I'm sorry I didn't reply to that sooner. I was being a lazy shit,
and read a book instead of replying yesterday. Almost did it again today
too...

To answer the question there, about simple-mfd/syscon not being quite
right:
I guess you aren't a simple-mfd, but this region does seem to be an mfd
to me, given it has 3 features. I wouldn't object to this being a single
node/device with two reg regions, given you're saying that the SIUL2_0
and SIUL2_1 registers both are required for the SIUL2 device to work but
are in different regions of the memory map.

> I have a question regarding the NVMEM driver that I mentioned earlier. I =
haven't
> yet created a patch series to upstream it but I wanted to discuss about it
> here since it relates to SIUL2 and, in the future, we would like to upstr=
eam it
> as well.
>=20
> We register a NVMEM driver for the first two registers of SIUL2 which can
> then be read by other drivers to get information about the SoC. I think
> there are two options for integrating it:
>=20
> - Separate it from the pinctrl&GPIO driver as if it were part of a differ=
ent
> IP. This would look something like this in the device tree
>=20
> /* SIUL2_0 base address is 0x4009c000 */
> /* SIUL2_1 base address is 0x44010000 */
>=20
> nvmem1@4009c000 {
> 	/* The registers are 32bit wide but start at offset 0x4 */
> 	reg =3D <0x4009c000 0xc>;
> 	[..]
> };
>=20
> pinctrl-gpio@4009c010 {
> 	reg =3D <0x4009c010 0xb84>,  /* SIUL2_0 32bit registers */
> 	      <0x4009d700 0x50>,   /* SIUL2_0 16bit registers */
> 	      <0x44010010 0x11f0>, /* SIUL2_1 32bit registers */
> 	      <0x4401170c 0x4c>,   /* SIUL2_1 16bit registers */ =20
> 	[..]
> };
>=20
> nvmem2@0x44010000 {
> 	reg =3D <0x44010000 0xc>;
> 	[..]
> }
>=20
> - have the nvmem as an mfd cell and the pinctrl&GPIO as another mfd cell
>=20
> The first option keeps the nvmem completely separated from pinctrl&GPIO
> but it makes the pinctrl&GPIO node start at an "odd" address. The second =
one
> more accurately represents the hardware (since the functionality is part =
of
> the same hardware block) but I am not sure if adding the mfd layer would =
add
> any benefit since the two functionalities don't have any shared resources=
 in
> common.

That's kinda what mfd is for innit, multiple (disparate) functions. I'm
not sure that you need an nvmem child node though, you may be able to
"just" ref nvmem.yaml, but I am not 100% sure how that interacts with
the pinctrl child node you will probably want to house pinctrl
properties in. The mfd driver would be capable of registering drivers
for each of the functions, you don't need to have a child node and a
compatible to register them. Cos of that, you shouldn't really require
a child node for GPIO, the gpio controller properties could go in the
mfd node itself.

--K9R0DwJtUt9wGfTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZv8GPgAKCRB4tDGHoIJi
0gfaAQCK6A6FyKv8heEKlrefSlhG3fuedIfwM1oYYR5XcOSwlwEAhspxpxTZ7SIz
HAtpUFOcJqqJf8c3/88JGym5xb29IA0=
=+j7w
-----END PGP SIGNATURE-----

--K9R0DwJtUt9wGfTI--


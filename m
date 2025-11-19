Return-Path: <linux-gpio+bounces-28836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0CC70968
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 19:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 48028353244
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59814327BF5;
	Wed, 19 Nov 2025 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jasoe0T+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8E311977;
	Wed, 19 Nov 2025 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575612; cv=none; b=BqbO66d8xRZvEu4yWSSQe1g2pxORpU2b0Fso9sJFA5aCqEjyt/qs6obgFIHhZLzmf7JUruWjKh1yvSVwqBDaWzjz9/GCRG9pxw57NhJZ1wptfLwY2U6p/rDlKSzQ+AicUeEqD6aYXBQ6xCOgVPGCczOa+Yl2e4kdgosoL6aWEIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575612; c=relaxed/simple;
	bh=0XYBCK2oG6dqBdc8VsoGOLDcIEb3yM7OtqIWFtmwPfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICwiTzjgQnLmvXzQ/slg8sCypEfeYw9ioRX3vgiLRfL7pgu8RJCwVtQZzAmiC4IzipgMB8/los+ZUnQlzUuntl8ty8+KVfz0OsPFrJyRluxvbhDzBoaiSCMDIpM6jQ6VMbXlkQFhB3PW/FnLw9Ehd0mc5getsdfasywp/bycU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jasoe0T+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3DAC4CEF5;
	Wed, 19 Nov 2025 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575610;
	bh=0XYBCK2oG6dqBdc8VsoGOLDcIEb3yM7OtqIWFtmwPfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jasoe0T+XgqtreEQ4GMFKjwjEoRdE+lZhPq434RQN224A9XwLeg7sORYz/VMDYc9h
	 srTLTGYSIuk4pcRpFAKqK8UafRMxBNAhJaIrFwn5OMJv/4L2FvHKIrvVC47RZ+zn7U
	 8FmjZ65zStQ+h2rFoj3ETcFjcKfC9bnTxmBhdfOC7myglDv7Nx80aErydy8kkSBm+m
	 65+QkuDBtjp6sHEHhoXw82tUdyFGrWnlVDFWCikrN2BJLxxX5B4Tv3hCemRzu+iA5l
	 UHuib1geVHXfeJQDgkYZnrIWCVKb/hKHyYOTj56IuvwhYO8FLinxQV85WUu/K2m/Fd
	 wZnkSybMqA3Bg==
Date: Wed, 19 Nov 2025 18:06:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC v1 0/4] Microchip mpfs/pic64gx pinctrl part 2
Message-ID: <20251119-citadel-shrine-fabc3fb309ac@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <CACRpkdZuopbAyHaZQpeGh0+V7v6Cg5uJwscmVPCfjHghNbPymg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7cGKj/xRk4uz6Oy"
Content-Disposition: inline
In-Reply-To: <CACRpkdZuopbAyHaZQpeGh0+V7v6Cg5uJwscmVPCfjHghNbPymg@mail.gmail.com>


--c7cGKj/xRk4uz6Oy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 01:16:16PM +0100, Linus Walleij wrote:
> On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > Got the other driver that I was talking about here for you...
> > It's in RFC state because I'd like to get some feedback on the approach
> > while I try to figure out a) what ibufmd is
>=20
> I was going to ask about that :D
>=20
> > and b) how the bank voltage
> > interacts with the schmitt trigger setting.
>=20
> Please check if "bank voltage" is somewhat analogous to
> this generic config:
>=20
> * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
>  *      supplies, the argument to this parameter (on a custom format) tel=
ls
>  *      the driver which alternative power source to use.

It's not pin based, the whole bank it is connected to has to be changed.
I'm not entirely sure if I want the driver to be able to control this at
all (at least not right now) because I don't know exactly what the
ramifications of changing it away from what the configuration tool
decided that it was are. Probably it could be done, but I don't know how
safe it is to change, as I think most of these kinds of settings were
never really seen as something "application" software would change
(linux is an application from the perspective of the design folks),
since it was all modifiable from the MSS configuration tool.

> > There's some specific @Linus questions in the driver, mostly where I was
> > unsure about how config bits should be handled and looking around at
> > other drivers wasn't sufficient because they did different things.
>=20
> I tried to answer as best I could.

Cool, thanks.

> > Finally, on the dt side, this was using the pinmux property before the
> > other drivers were submitted, but I didn't really like it to begin with
> > (shoving two things into entries of the same property gives me the ick).
> > I moved to using pins + function which at least looks prettier in the
> > devicetree.
>=20
> I think this looks way better than any pinmux properties.
>=20
> > I had been hoping that I could move to some sort of generic
> > dt_node_to_map function, but I couldn't figure out one that'd work
> > without creating groups in the driver. If there is, I'd love to get rid
> > of the custom dt_node_to_map stuff.
>=20
> It seems like something that could be added to the core
> (drivers/pinctrl/devicetree.c), if you feel like and have time for going
> the extra mile. Maybe it would be simple to move some drivers
> over to using it if done right.

Yeah I might, especially if it pushes people away from these pinmux
properties! Might also just submit this as-is and do it on top, depends
on what stuff I have going on.

>=20
> > I want to avoid doing having set groups, because of the number of
> > possible configurations in the MSS Configurator FPGA tool is fairly
> > large, and I believe that MSS Configurator actually undersells the
> > number of possible combinations for ease of use.
>=20
> FPGA:s often have this "phone exchange" property.
>=20
> > I haven't tested that
> > and the driver technically doesn't support it, but I feel like not tryi=
ng
> > to define groups statically and using pins instead would permit those
> > combos in the future should that use case ever materialise.
>=20
> It makes sense for a driver for this type of very flexible hardware.


Thanks for taking a look.

--c7cGKj/xRk4uz6Oy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4HNgAKCRB4tDGHoIJi
0gWkAQDhGI8MtFeVMIWnJpxiVN8LhHlfMg3bXVbXqF+JQmOR2AD7B4YxYC6ruaSO
UkkmL6gYmDhnsLv8qnAzY04Wr3wpiws=
=lbBs
-----END PGP SIGNATURE-----

--c7cGKj/xRk4uz6Oy--


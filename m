Return-Path: <linux-gpio+bounces-29246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EBCA3295
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 11:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B83D43037CEF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 10:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A60A3328EA;
	Thu,  4 Dec 2025 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3UGbDct"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83732FD667;
	Thu,  4 Dec 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842856; cv=none; b=OdE61o7aOCvBn6hjkrl5lx8Hg9O9Ez+ZLFsNRj63yFe8liCfNDS6cd0MKTxuvlj8AZmPsvhdNOLIrfQIl+Bg3IvekeyO1BG+Tdc51ISus8Q1Bjg+3fVU3+Q8SQUXIYyBs/WGt/4j6ot9TApsazxf7idrT8kD21nPbAf+ddGhm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842856; c=relaxed/simple;
	bh=vnvcqBbgBbXO/FQD7oe2r3e/pL9m0Ve6cbipFc1XpHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE+VBeNewY3zxaYA0Meb/XkiMT9aPW6DjjDKEfnbw7HtBXuf/VF/is3hDQVue998ArT/WntQ1omP2SBoJhhxn2xR1w3zu4NNOcMmCL5mUB3ebDCO1YrBLXCZkv/ikmRYhbdcPtj8+pyAD1+p8xRPDdsxEu7kOHeiT+RsHQcfkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3UGbDct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673FCC113D0;
	Thu,  4 Dec 2025 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764842856;
	bh=vnvcqBbgBbXO/FQD7oe2r3e/pL9m0Ve6cbipFc1XpHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d3UGbDcthbv2CNszBXKtvqi9BshLOQgzjrjWE6evEwhddgdl/Snae/1FHX5WwDJ36
	 cEBCfAmVjTKq+NUnWP7jlMS0Jm/ZikAp/mmvne+RN7bWgX2CF1HyGHwQlPB+z8Vrk+
	 61c+LSVlB5ACmn1Q21vGx1wh3bBmEZrp+0srD48XDrbcgqZ6FrGWmTx44adInGdR1b
	 Q8+0VxWB0X7ladyp3IVOGof68QDBtT5QKqxIuppL99kveLhj3RBjUTtIRaMJY87vac
	 Foz1Phr/B/0sYN1MdIGa6U4CLXAtr4+fBvNItZwHDOu6aq5+b2oxD8y4mguiFmxRqQ
	 DNniEjNxDTVLA==
Date: Thu, 4 Dec 2025 10:07:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Yulin Lu <luyulin@eswincomputing.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: add CONFIG_OF dependencies for microchip drivers
Message-ID: <20251204-mantra-letdown-1b2bcd1e6c6e@spud>
References: <20251204095024.1031947-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kRoy/eNgFW+61V/c"
Content-Disposition: inline
In-Reply-To: <20251204095024.1031947-1-arnd@kernel.org>


--kRoy/eNgFW+61V/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2025 at 10:50:14AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The two newly added drivers fail to link on builds without
> CONFIG_OF:
>=20
> x86_64-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pi=
nconf_generic_dt_node_to_map_all':
> pinctrl-pic64gx-gpio2.c:(.text+0xc9): undefined reference to `pinconf_gen=
eric_dt_node_to_map'
> x86_64-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinc=
onf_generic_dt_node_to_map_all':
> pinctrl-mpfs-iomux0.c:(.text+0xc9): undefined reference to `pinconf_gener=
ic_dt_node_to_map'
>=20
> Add a Kconfig dependencies.
>=20
> Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kRoy/eNgFW+61V/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTFdYwAKCRB4tDGHoIJi
0q8RAP9VxeJiunVJdrN3eiC/1uLJ1ugT5jFbVZktC8kYaI33dAD8CHjgJFZ2i/Yz
oM2hhAlmOGr0v6Aq/hG3TheYu+5YAwo=
=NyMZ
-----END PGP SIGNATURE-----

--kRoy/eNgFW+61V/c--


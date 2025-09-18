Return-Path: <linux-gpio+bounces-26335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41241B85BE1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1092A3AD5A5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B8030F95C;
	Thu, 18 Sep 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXiFlSiW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDDF241664;
	Thu, 18 Sep 2025 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210251; cv=none; b=AHeaXE/n/Q5S3TqEWGKpuePY673MG0K2gO6L3EnWky6Ty1jVwNyF1UzxngDm/RyK1uq1THwZ2aPjv7yuyOiZBVLU4FXHx7Ao6mZFmACb376SprvisJDGKBBB8klUrnOtvdFikt+jCljt+BDAG6M3wmkmSpCSXdBjUVUgwRloNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210251; c=relaxed/simple;
	bh=tpJdUy658P5YF/fVJhhaxfaTyQ08vPkxRDewxQoBSE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoPHqCe4j2A42Wqpqfw0QovNN3JTQYeY7HCBqkIZwcbn1msO68PF/z29zAHJRApx0DS1/2bUCjW9fBMcYOZpAbxZZPIuTE370D0W2ie9+YO/sHNTF1EOgM0mO3YU4sr4aiGodMBTC5taEyM9HnwcXML9GGL2/kNDl6PVRganLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXiFlSiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED18C4CEE7;
	Thu, 18 Sep 2025 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758210251;
	bh=tpJdUy658P5YF/fVJhhaxfaTyQ08vPkxRDewxQoBSE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXiFlSiWPN/jd00XkoTuTuOsVZOaBjjivIiydILnBdEdVrOOiqcoISG7COM1pgnHG
	 e4jojCyWKdT6TZJvfbtjfNQ5i1Dm3Kfjxd+rpSSRzf+5X3p4nTpCzy5tzleA/mudJ5
	 yUxHlNgGoSZV+7gl2gXqG5A9RqKvUtgTQgWGpMgBMw/y6KsimYAPHf957JW2mpDG0w
	 +WOgk5yewNlju6yxfSrx//po1lg83Rk+nyNPTdkvjfaJ4cFAXVS4I8c+RAyqPE0lNA
	 ZsV0ibmLbnUtTPzcyLIwKHgnjQa8lQxrw+xbuZ48PFEpkr5bLsxu9BNm/jSuhn/WMH
	 lr4PUyz5R0uDw==
Date: Thu, 18 Sep 2025 16:44:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <20250918-flakily-thermos-5404fb4bcd1a@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-7-herve.codina@bootlin.com>
 <20250918-majestic-mockup-0a0e090db0a7@spud>
 <20250918171502.411c3527@bootlin.com>
 <20250918-education-resource-aac71b87e979@spud>
 <20250918173915.730bc3db@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g68d72vrRyzL1c0c"
Content-Disposition: inline
In-Reply-To: <20250918173915.730bc3db@bootlin.com>


--g68d72vrRyzL1c0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 05:39:15PM +0200, Herve Codina wrote:
> On Thu, 18 Sep 2025 16:26:59 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Thu, Sep 18, 2025 at 05:15:02PM +0200, Herve Codina wrote:
> > > Hi Conor,
> > >=20
> > > On Thu, 18 Sep 2025 16:06:04 +0100
> > > Conor Dooley <conor@kernel.org> wrote:
> > >  =20
> > > > On Thu, Sep 18, 2025 at 12:40:04PM +0200, Herve Codina (Schneider E=
lectric) wrote: =20
> > > > > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > > > > interruption lines are multiplexed by the GPIO Interrupt Multiple=
xer in
> > > > > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > > > >=20
> > > > > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > > > > IRQ lines out of the 96 available to wire them to the GIC input l=
ines.
> > > > >=20
> > > > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bo=
otlin.com>
> > > > > ---
> > > > >  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++=
++++++
> > > > >  1 file changed, 87 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/soc/renesas=
/renesas,rzn1-gpioirqmux.yaml   =20
> > > >=20
> > > > This is an interrupt controller, please move it to that subdirector=
y. =20
> > >=20
> > > Not so sure. It is a nexus node. It routes interrupt signals to the
> > > interrupt controller (interrupt-map) but it is not an interrupt contr=
oller
> > > itself.
> > >=20
> > > I am not sure that it should be moved to the interrupt-controller
> > > directory. =20
> >=20
> > Your node name choice disagrees with you!
>=20
> Oups, you're right, my bad.
>=20
> What do you think if I change the node name from "interrupt-controller" to
> "interrupt-mux" in the next iteration?

I guess, sure.

--g68d72vrRyzL1c0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwoxQAKCRB4tDGHoIJi
0jFNAP4xJmmLU+gZmga5PGWHKSiPcZR/DO1+lOCYuQ1p+r2hYQEA+J8VHH8E6mzp
QoLnIs5KKJLjyTyZ0wk5EBF5ZbO9Twg=
=Cfpi
-----END PGP SIGNATURE-----

--g68d72vrRyzL1c0c--


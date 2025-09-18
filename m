Return-Path: <linux-gpio+bounces-26330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80302B8595A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FAF47B1533
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB12630F939;
	Thu, 18 Sep 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d47hQZzP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6B30F80C;
	Thu, 18 Sep 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209225; cv=none; b=lyUkgx9eKo9YoOxzTAOLTaCE7TevRXfA5PSmeBrZO87ocBFsyq1zCIPtvVdZpuhyfvAiF4PvzOgkXXwBXAkyB719LiQy3UbpteLasAvTvaUTnwgnIZaP9TMzNPBHyYG1KqdB7SEowINqJLEAZtoY1H/zJomEzNq+eNx54HwD/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209225; c=relaxed/simple;
	bh=BwqLfcPI4fqGMrRKoHaz7EZY8YKsYs2WAMxp5J73LSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEYIAPrs0Hmy88n9p1wclR7m+/RFVY+Ok78IP7mOKnvflblr++WOx/EjF56Hb1IETpOgm7CAXQsf1iKPiIQvjYAaGgz4mud03uvst4kgZ6xNwIywffxKux3ksYCOAFH0PhYM0kiKD9yNwdPYw82ggMvHB2ooc0ojCJrB/4pfKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d47hQZzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4557DC4CEEB;
	Thu, 18 Sep 2025 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758209225;
	bh=BwqLfcPI4fqGMrRKoHaz7EZY8YKsYs2WAMxp5J73LSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d47hQZzPAIdH5mldPmUZH1IaZjVHNjMIpaGYdWoCs1oLr+6Tcxp9t8bMvuLu9gFEX
	 lo+6brZG4IkWpzP/S3cUAVOjQrScbGC7Y5uCGuO5+s88oqc+30Jdi+8//okEH01f89
	 85402JQ0/0K0U8B+w8PhY4YwZO9tf/OcyQhDrxJrllRDoGdR21TGOS6CVkez6ioeSK
	 cdJjfZ4RiNrrQdljWW2p4sFo8z54nwCL1ALgo06kZasrnpCCTyEIMDiIsw46sVHSZ5
	 G8Hh7Olv1zI/rjZvF2lSnSidLuI7YJAR81E9GmRs/H3sb7eV2LSCBjRinpLhVS52pO
	 GwmwKUMIcFF+Q==
Date: Thu, 18 Sep 2025 16:26:59 +0100
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
Message-ID: <20250918-education-resource-aac71b87e979@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-7-herve.codina@bootlin.com>
 <20250918-majestic-mockup-0a0e090db0a7@spud>
 <20250918171502.411c3527@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="04PZPDVvYnUHAPS9"
Content-Disposition: inline
In-Reply-To: <20250918171502.411c3527@bootlin.com>


--04PZPDVvYnUHAPS9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 05:15:02PM +0200, Herve Codina wrote:
> Hi Conor,
>=20
> On Thu, 18 Sep 2025 16:06:04 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Thu, Sep 18, 2025 at 12:40:04PM +0200, Herve Codina (Schneider Elect=
ric) wrote:
> > > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > > interruption lines are multiplexed by the GPIO Interrupt Multiplexer =
in
> > > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > >=20
> > > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > >=20
> > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootli=
n.com>
> > > ---
> > >  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++++++=
++
> > >  1 file changed, 87 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/renesas/ren=
esas,rzn1-gpioirqmux.yaml =20
> >=20
> > This is an interrupt controller, please move it to that subdirectory.
>=20
> Not so sure. It is a nexus node. It routes interrupt signals to the
> interrupt controller (interrupt-map) but it is not an interrupt controller
> itself.
>=20
> I am not sure that it should be moved to the interrupt-controller
> directory.

Your node name choice disagrees with you!

--04PZPDVvYnUHAPS9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwkwwAKCRB4tDGHoIJi
0mK2AQCYPHl4rF871L3zpt0NZtb7tH1ZVhuOQg0+r0MqiY6UyQEA2Dn0unSyWBQs
L4iJKiNqXKFSDPbUt3IAV/KTVPzZeQY=
=aBup
-----END PGP SIGNATURE-----

--04PZPDVvYnUHAPS9--


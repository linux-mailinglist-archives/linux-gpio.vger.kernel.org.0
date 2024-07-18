Return-Path: <linux-gpio+bounces-8283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BC934F5D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 16:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC038281944
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 14:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B181422D9;
	Thu, 18 Jul 2024 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChxK4r2t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4DB2AF18;
	Thu, 18 Jul 2024 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314082; cv=none; b=Fmcb2LjAf0I6xML1xZX96eX4zmD8Mfn69XBv2hZZxLZp85kNI+amDnCtK/JdX4ZAzCwu9HeFw1DSGUaf9ScI+2DiPaUfuT3cFNWktqD7s+ApUdnc3x2a/vpCCyDKgXG+loqDtG1TLdqrfTSBWRdbT0SeWEAtlu7+pbtxBV+X5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314082; c=relaxed/simple;
	bh=oktHw+Aidz4Fg60CXE1tH/jufeVVrplYn4ZfHl/Bp2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeuEXxjHh0SG19LaWvrvdoofHPgpBPI3MjTx3LcbQMqXaHnCxM5+4mjZ+P4JnFrZ+xJVLXZGvVjamUBMlraeRrPfQkrM0q+hs12Hc+pA128UDRopowkIM0uD1kuEh6v2+9FqC6i/dvTDKgokT7FMvGwYISUppGFL9+Q5Y9JqrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChxK4r2t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B5AC116B1;
	Thu, 18 Jul 2024 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721314082;
	bh=oktHw+Aidz4Fg60CXE1tH/jufeVVrplYn4ZfHl/Bp2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChxK4r2tQY8L2nUM30qQ19IcAaPhBbwD21ypizYRC/3oQiy3COcD9b4A6XTz23w6K
	 BL9VAj0rm5NQ4n8VqikFggWOyRtoP5m0g8LANkUttEuKita0QdwBNcY4Zwlvifu+qd
	 wNzFG5kxWaYKhzed9c6mL04FYXEzM25fnSgQS1FfaX3AOfKv56ofTzq36VIRjTPiZv
	 bIHGtp4BwGWnuSTn9FtHIBxsNpxafK2lNsS35ouZwFw4diZMEsjq8gtFiLAciJfhMX
	 anrz0OrH5GSiv+P/+EPBUkrRgRaH2ZwKFgPhYoO6ubhJwadEf8xIFgIvRQ/v1sEHKO
	 2ut89S9uJrG/A==
Date: Thu, 18 Jul 2024 15:47:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Bough Chen <haibo.chen@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: Re: Question about gpio-hog
Message-ID: <20240718-smudge-splashy-6e8addc80c02@spud>
References: <DU0PR04MB949657D9575090C71714D2A090AC2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xhRrOPu2DSsdfLUQ"
Content-Disposition: inline
In-Reply-To: <DU0PR04MB949657D9575090C71714D2A090AC2@DU0PR04MB9496.eurprd04.prod.outlook.com>


--xhRrOPu2DSsdfLUQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 03:40:49AM +0000, Bough Chen wrote:
> Hi All,
>=20
> I have a question of =E2=80=98gpio-hog=E2=80=99, the property gpio-hog se=
ems to be used in GPIO node rather than in users device node, so we can=E2=
=80=99t use the device-link feature.
> (sorry for resend, I use text/plain messages this time)
>=20
> e.g.
>=20
> pcal6524: gpio@22 {=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=80=A6
> =E3=80=80=E3=80=80=E3=80=80/* usdhc3 and QSPI share the same pin, here se=
lect SD3 pins */
> =E3=80=80=E3=80=80=E3=80=80usdhc3-qspi-sel-hog {
> =E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80gpio-hog;
> =E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80gpios =3D <16 GPIO_=
ACTIVE_HIGH>;
> =E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80=E3=80=80output-high;
> =E3=80=80=E3=80=80=E3=80=80};
> =E3=80=80=E3=80=80=E3=80=80=E2=80=A6
> };
>=20
> &usdhc3 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=80=A6
> }
>=20
> The board share the pins of usdhc3 and QSPI, a MUX use one GPIO pad from =
one I2C GPIO expander to control the selection.
> So before usdhc3 probe, need to make sure the gpio-hog is configed. Which=
 means usdhc3 need to depend on usdhc3-qspi-sel-hog.
>=20
> To achieve that, I can add a fake GPIO properties like below:
> &usdhc3{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=E2=80=A6
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hog-gpio =3D <&pcal6524 16 GPIO_ACTIVE_HIGH=
>;
> }
>=20
> Usdhc driver do not handle the hog-gpio, just use this fake hog-gpio to l=
et the usdhc3 depends on pcal6524 IO expander. Make sure when usdhc driver =
probe, already select the usdhc3 pads on board.
>=20
> But this will trigger the DT check warning if related device binding has =
=E2=80=9C=E2=80=9CadditionalProperties: false=E2=80=9D =C2=A0or=C2=A0 =E2=
=80=9CunevaluatedProperties: false=E2=80=9D.
>=20
> Can this be acceptable? Any thoughts for this case? I think this might be=
 common user case for gpio-hog.

I've got no idea what this device you're talking about is - but it seems
to me like the "hog-gpio" property is what you should be doing (although
probably called something like "enable-gpios" instead.
What you would do is send a patch for the dt-binding for this device,
adding a property, in which case the *Properties: false will stop
warning.

>=20
>=20
> Best Regards
> Bough Chen
>=20
>=20
> Best Regards
> Bough Chen
>=20
> Mobile:=20

btw, you might want to remove your phone number from the footer when
sending to public mailing lists.

Cheers,
Conor.

--xhRrOPu2DSsdfLUQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpkrHQAKCRB4tDGHoIJi
0hekAP9r7PWSfFQIRahe8TkyZ4HTdLFkCvqPOe7LVyTSjG0w6wD8DChrPvHVwTo9
plHrQGtk0DugZGI5NgcWH+KRGS7XsQ0=
=OOlq
-----END PGP SIGNATURE-----

--xhRrOPu2DSsdfLUQ--


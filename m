Return-Path: <linux-gpio+bounces-6187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5B8BDF58
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 12:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C7121C219F0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 10:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C37614E2F0;
	Tue,  7 May 2024 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0BAXgGj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8414D443;
	Tue,  7 May 2024 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076318; cv=none; b=IkVnr60WeGfo/IaFoHyTJvodeOlcoCWdAxzCrL0fVOXZTF+w+BP0GwsgnZ76saVYSEIWkJYMIKxKp65OYTeyUO/O1Z90GSY+nSE7AwtUMeFIjScImOjzPT0YburDOaUyMK52WzJSVy2towc9BXuTqm5OgPiPJEY6eWJk344fZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076318; c=relaxed/simple;
	bh=wjyf3Y9/PEfHLCo6ul7OYK2A98nnXByMH3n8zsXTdJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkbvgnljM3J5js7Tz1j2WNjrAMAb03ENJMbLvk6TUUuzfQQZ8xuDKGya4J4KrvPMkucC037X9o+qeEoq8Lpr6ff0E3FRgeBqeO8pJvrxV4Am9mn/Ob8X0uvVLgG3pvU1MYQQKRIpq4fn4fUskZPDR24pXa/Bh5+xPLKpGduYS/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0BAXgGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553D3C2BBFC;
	Tue,  7 May 2024 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715076317;
	bh=wjyf3Y9/PEfHLCo6ul7OYK2A98nnXByMH3n8zsXTdJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0BAXgGjZlgdwer+U0T5C9p+b6/JpacxQw5HHcsSokG2GOLP2AVsXg+mUxC4T1imU
	 beUN1xKIggEcCIijv9OCPLhrVutNnOsjzUGJzAbj+/g32JTjLFuvupC/ml43ne4w8a
	 XXl6Tbdm5zYIvNYuB/Gp2v4l7bX6SbWAjiptHHW1GyF7esO2EaNqnsm7nlsNldD2hN
	 /5B1AF9VyshwToIAV6h42iu/wOcKfwcUrm5HMKYpkHILY6MllqLSw9l0G8UjHsapds
	 SlRge/ISNHyiuUY1VqtXhBMhRx4Cf3eBtIDDIa1DBdqiMZMxHOrjFW2k61XNnlpGFz
	 flwY9qmNmv/SA==
Date: Tue, 7 May 2024 12:05:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com, lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: airoha: en7581: Add gpio controller nodes
Message-ID: <Zjn82thKKLx7juup@lore-desk>
References: <2d27e1ad360dec2c3d78d9800bc93ecb6f9b50c5.1714573214.git.lorenzo@kernel.org>
 <CAMRc=MeQp6FFhXSr1HbvVAd+D3wOsmtLvoxjt7QmT2a=NNTHmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vYM6OgB8S48O9dfD"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeQp6FFhXSr1HbvVAd+D3wOsmtLvoxjt7QmT2a=NNTHmA@mail.gmail.com>


--vYM6OgB8S48O9dfD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, May 1, 2024 at 4:26=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:
> >
> > Introduce the Airoha EN7581 gpio nodes in Airoha EN7581 dtsi
> >
> > Tested-by: Rajeev Kumar <Rajeev.Kumar@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > This patch is based on the following pending patch:
> > https://patchwork.kernel.org/project/spi-devel-general/patch/189790802f=
3ba1a80c4ab5e064b2425e5a360098.1714571980.git.lorenzo@kernel.org/
> > ---
> >  arch/arm64/boot/dts/airoha/en7581.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/d=
ts/airoha/en7581.dtsi
> > index 98c2a86086e1..5d0d76cecfe0 100644
> > --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> > +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> > @@ -178,5 +178,25 @@ spi_nand: nand@0 {
> >                                 spi-rx-bus-width =3D <2>;
> >                         };
> >                 };
> > +
> > +               gpio0: gpio@1fbf0200 {
>=20
> These labels are not used anywhere.
>=20
> Bart

ack. Let's drop this patch for the moment, I am planning to the work gpio
support.

Regards,
Lorenzo

>=20
> > +                       compatible =3D "airoha,en7523-gpio";
> > +                       reg =3D <0 0x1fbf0204 0 0x4>,
> > +                             <0 0x1fbf0200 0 0x4>,
> > +                             <0 0x1fbf0220 0 0x4>,
> > +                             <0 0x1fbf0214 0 0x4>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <2>;
> > +               };
> > +
> > +               gpio1: gpio@1fbf0270 {
> > +                       compatible =3D "airoha,en7523-gpio";
> > +                       reg =3D <0 0x1fbf0270 0 0x4>,
> > +                             <0 0x1fbf0260 0 0x4>,
> > +                             <0 0x1fbf0264 0 0x4>,
> > +                             <0 0x1fbf0278 0 0x4>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <2>;
> > +               };
> >         };
> >  };
> > --
> > 2.44.0
> >

--vYM6OgB8S48O9dfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZjn82gAKCRA6cBh0uS2t
rN0FAQCAVoXHlIcBroTElixujJu2yBPhfZhClfkTqv+xExVAjQD9F375rXktpi4C
1RaCO08FwVabt67pvsxleUGnu3NtWgs=
=xoIT
-----END PGP SIGNATURE-----

--vYM6OgB8S48O9dfD--


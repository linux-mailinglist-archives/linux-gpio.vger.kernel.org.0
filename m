Return-Path: <linux-gpio+bounces-9001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C3795BEA0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 21:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08169B214D1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 19:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32C31D0DC2;
	Thu, 22 Aug 2024 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9bADXjh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F763EC5;
	Thu, 22 Aug 2024 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724353363; cv=none; b=RyT0Lp07TeR88ShRkVxWSt0WbPoi/TJVro0nldKmXxFBHC5QwQLieLkYbPsounm6xPt2cftBv+h3+8Fmuot+UMXTQ50Vhd6Jd/Ghs0Q/8gxc95UBdVSxlczt56RFr+pSxRoU1VlutaBb9Ue7aDRSjfLcaPsZWXAjN8iXAu5NxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724353363; c=relaxed/simple;
	bh=xkJxuhgb78n4FuOPdIwcmBi1eA/Yu0psL+bwoB8zMA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chmTomIwjaAeurm66TWqzAEXInvk6b60AiZCsMnvKgD5PJq+8keu1SrucU1sNBj1b3HAOfN4AE2Tr1oDZZtYePjLT99b8cNzsQvvlVutA+YBDdn+ldCocIh1i2i87aRmp7kOt9YOCGtF9ieljBVskMKLykbY+xSsqHS1j3Q34hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9bADXjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4C2C32782;
	Thu, 22 Aug 2024 19:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724353363;
	bh=xkJxuhgb78n4FuOPdIwcmBi1eA/Yu0psL+bwoB8zMA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9bADXjhnhFV9D6FC7d7Oi2kbTHMS/q2RGBnT9miyH5POy5PnigNWky8RoFcgQAYl
	 K5IZ0zonP123H8Qt0k08l5k71aPOfRWXbAV6z0zqGi5wwmSlxq8lU5r8G7VrDgxodr
	 h9nsHwJWs1S74Z94y27or9ExB0VM5JYK8GbdacOQpPRM1gB3Pl1Q1KjzKHMCeYGI99
	 eWFleMcUDJS4IFArGb3Sn+jwUKkw/fZeL50V0mbGloBi5E/2wd9FOKOFqwFQJ0tMVu
	 09iYREQP2HP9yK/Ia34b/rdngLyAS3rVAS0r3yqYskdSHDQJEVS7bKXr/QygBECsGM
	 ciB6LN4o7mF6Q==
Date: Thu, 22 Aug 2024 21:02:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZseLT2roso_L7UG4@lore-desk>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="diazt744lIJbkc3n"
Content-Disposition: inline
In-Reply-To: <20240822-taste-deceptive-03d0ad56ae2e@spud>


--diazt744lIJbkc3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 22, Conor Dooley wrote:
> On Thu, Aug 22, 2024 at 11:40:52AM +0200, Lorenzo Bianconi wrote:
> > Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> > controller.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > +  reg:
> > +    items:
> > +      - description: IOMUX base address
> > +      - description: LED IOMUX base address
> > +      - description: GPIO flash mode base address
> > +      - description: GPIO flash mode extended base address
> > +      - description: IO pin configuration base address
> > +      - description: PCIE reset open-drain base address
> > +      - description: GPIO bank0 register base address
> > +      - description: GPIO bank0 second control register base address
> > +      - description: GPIO bank1 second control register base address
> > +      - description: GPIO bank1 register base address
>=20
> > +      pinctrl@1fa20214 {
> > +        compatible =3D "airoha,en7581-pinctrl";
> > +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> > +              <0x0 0x1fa2027c 0x0 0x8>,
> > +              <0x0 0x1fbf0234 0x0 0x4>,
> > +              <0x0 0x1fbf0268 0x0 0x4>,
> > +              <0x0 0x1fa2001c 0x0 0x50>,
> > +              <0x0 0x1fa2018c 0x0 0x4>,
> > +              <0x0 0x1fbf0200 0x0 0x18>,
> > +              <0x0 0x1fbf0220 0x0 0x4>,
> > +              <0x0 0x1fbf0260 0x0 0x8>,
> > +              <0x0 0x1fbf0270 0x0 0x28>;
> > +        reg-names =3D "iomux", "led-iomux",
> > +                    "gpio-flash-mode", "gpio-flash-mode-ext",
> > +                    "ioconf", "pcie-rst-od",
> > +                    "gpio-bank0", "gpio-ctrl1",
> > +                    "gpio-ctrl2", "gpio-bank1";
>=20
> before looking at v1:
> I would really like to see an explanation for why this is a correct
> model of the hardware as part of the commit message. To me this screams
> syscon/MFD and instead of describing this as a child of a syscon and
> using regmap to access it you're doing whatever this is...
>=20
> after looking at v1:
> AFAICT the PWM driver does not currently exist in mainline, so I am now
> doubly of the opinion that this needs to be an MFD and a wee bit annoyed
> that you didn't include any rationale in your cover letter or w/e for
> not going with an MFD given there was discussion on the topic in v1.

based on the reply from Rob I was thinking it is fine to just reduce the nu=
mber
of IO mappings, sorry for that.

>=20
> Thanks,
> Conor.

clock, pinctrl and pwm controllers need to map 3 main memory areas:
- chip-scu: <0x0 0x1fa20000 0x0 0x384>
  it is used by the clock driver for fixed freq clock configuration,
  by the pinctrl driver for io-muxing (and by the future pon drivers)
- scu: <0x1fb00020 0x0 0x94c>
  it is used by the clock/rst driver
- gpio: <0x1fbf0200 0x0 0xbc>
  it is used by the pinctrl driver to implement gpio/irq controller and
  by the pwm driver.

I guess we can model chip_scu as single syscon node used by clock and pinct=
rl
while pwm can be a child of the pinctrl node. Something like:

=2E..

chip_scu: chip-scu@1fa20000 {
	compatible =3D "airoha,en7581-chip-scu", "syscon";
	reg =3D <0x0 0x1fa20000 0x0 0x384>;
};

scuclk: clock-controller@1fb00020 {
	compatible =3D "airoha,en7581-scu";
	reg =3D <0x1fb00020 0x0 0x94c>;
	airoha,chip-scu =3D <&chip_scu>;
	...
};

pio: pinctrl@1fbf0200 {
	compatible =3D "airoha,en7581-pinctrl", "simple-mfd", "syscon";
	reg =3D <0x1fbf0200 0x0 0xbc>;
	airoha,chip-scu =3D <&chip_scu>;
	....

	pwm {
		compatible =3D "airoha,en7581-pwm";
		...
	};
};

=2E..

Does it work for you?

Regards,
Lorenzo

--diazt744lIJbkc3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZseLTwAKCRA6cBh0uS2t
rGKnAQCZ+o4MIMWsRuzvGOZSrG1NdV6hktrlDyjEJQ5C2jFzYAEAu4nxBgW+EpZW
RRqyuyYxUDBvOoQ4vFB7hMODbQlKmQo=
=1h0o
-----END PGP SIGNATURE-----

--diazt744lIJbkc3n--


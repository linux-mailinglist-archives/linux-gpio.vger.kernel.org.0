Return-Path: <linux-gpio+bounces-8721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F383F94F317
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 18:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3212D1C21267
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 16:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B89187335;
	Mon, 12 Aug 2024 16:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhSrpplF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB26130E27;
	Mon, 12 Aug 2024 16:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723479213; cv=none; b=O8iQRZC2thsGC/clm9k0BABxKb0ER1oETHh4snH1Z3WkAI9quDMqGpr6nAuRFgdv+n7puKIj3M6QqnytzsLvkDvcarWm/RMBBw4yZcoHoYm1uy7G1+Hil9iHOPk3Tdc73XR49/PdW7sBA0FQT8ah1t3fq1Cb4VAgsjT/RlcJt/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723479213; c=relaxed/simple;
	bh=0YjTgfH3hHB0i3WXLphUYB3PzSTXzdLghJd8Rv3Ffaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMdp9GmrvobJj9OXWIs4xdpxYSIas0bwfT2E9r344ilXJUIIIgPJqNmktS6EYCfsi9AOxDn9BbjBIsIi8odGqzh2rpW6tuHKJlj1nT8rv0bKyUxvhZuZycoVMHuWaLco4MfMRF9U6YmMFvcDwBVhzRXrANUc/jSmx7TGcN7dxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhSrpplF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F4BC32782;
	Mon, 12 Aug 2024 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723479213;
	bh=0YjTgfH3hHB0i3WXLphUYB3PzSTXzdLghJd8Rv3Ffaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhSrpplFKEYwtlVk144Qnb8h6EgRQApUaHgFeIzJ5rs43Qfcz8fhW/dkaEb+7Nt8z
	 rqh4DVYf4igXuO0rM8BQTq2xhjR3SOa2cYOUkeUtF2rBPoTBHyFBoeF4SasAAPZWJ3
	 /uY8fnW4neVjRNvNGUbf45h+AMGfj68syPoslq2NUjo/K9fJduRzrKTY3UJ8Mocwxk
	 t+W+iR5bLko/qUffP5PTtVImPXvg3hE2ADeLvg72O0hMh8T6gf3M2g+WKruUvxIKlG
	 8tyFukIH8gXw3pQOCx2KtB3MCJUX0P8ZRPodoDudjTgEvsTw1uEO327Z5BM7qiiwSD
	 x9NcN6ClbhvUQ==
Date: Mon, 12 Aug 2024 17:13:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3576 pinctrl bindings
Message-ID: <20240812-decibel-abdomen-90354e0ad4e6@spud>
References: <20240808164132.81306-1-detlev.casanova@collabora.com>
 <20240808164132.81306-2-detlev.casanova@collabora.com>
 <20240809-dexterity-attention-8376b3b16d59@spud>
 <22382840.EfDdHjke4D@trenzalore>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="puv11dB6IoxYMEpS"
Content-Disposition: inline
In-Reply-To: <22382840.EfDdHjke4D@trenzalore>


--puv11dB6IoxYMEpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2024 at 01:53:16PM -0400, Detlev Casanova wrote:
> On Friday, 9 August 2024 10:58:38 EDT Conor Dooley wrote:
> > On Thu, Aug 08, 2024 at 12:39:55PM -0400, Detlev Casanova wrote:
> > > Add the compatible string as well as the optional rockchip,sys-grf fi=
eld.
> >=20
> > Optional for all rockchip devices supported by this binding, or just the
> > one you're adding?
>=20
> It is only optionally used by rk3576. I can add it in an 'if:', or update=
 the=20
> description with somthing like "It is used on rk3576 for i3c software=20
> controlled weak pull-up"

And if/else that restricts it to where it is available please.

>=20
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > >=20
> > >  .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml      | 7 +++++=
++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml ind=
ex
> > > 20e806dce1ecb..cd527ccc9e6bf 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> > >=20
> > > @@ -45,6 +45,7 @@ properties:
> > >        - rockchip,rk3368-pinctrl
> > >        - rockchip,rk3399-pinctrl
> > >        - rockchip,rk3568-pinctrl
> > >=20
> > > +      - rockchip,rk3576-pinctrl
> > >=20
> > >        - rockchip,rk3588-pinctrl
> > >        - rockchip,rv1108-pinctrl
> > >        - rockchip,rv1126-pinctrl
> > >=20
> > > @@ -54,6 +55,12 @@ properties:
> > >      description:
> > >        The phandle of the syscon node for the GRF registers.
> > >=20
> > > +  rockchip,sys-grf:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      The phandle of the syscon node for the SYS GRF registers.
> > > +      It is used for i3c software controlled weak pull-up.
> > > +
> > >=20
> > >    rockchip,pmu:
> > >      $ref: /schemas/types.yaml#/definitions/phandle
> > >      description:
>=20
>=20
>=20
>=20

--puv11dB6IoxYMEpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZro0qAAKCRB4tDGHoIJi
0kTXAQDyKDk5IqP6NphVJj1ZkDK5QCADbb+uzV5TA37RTt+HHgEAvaubL5mfaR+X
heIH+qlN/7beb49IzJi3Kvx5wCZqXgE=
=c1VS
-----END PGP SIGNATURE-----

--puv11dB6IoxYMEpS--


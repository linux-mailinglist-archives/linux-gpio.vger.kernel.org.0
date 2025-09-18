Return-Path: <linux-gpio+bounces-26326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C933BB8564A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 16:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D64E77A3BF4
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 14:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1773F30C62E;
	Thu, 18 Sep 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcWhgwzJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF121A0711;
	Thu, 18 Sep 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758207443; cv=none; b=QyIMK7VC8YF3YVnSv2EgckWWmemcYw3X0+oz9RQ9ls2G59p1NSgtvpiECVQQmlfkRLWo4BvnhOqm4nK2bgVUohYPNkmHgpOkQCA9+wpc+2uk7tb197B2Ph85unctIiuxAOe0HMOVaaVY5L5/9Kggdd6MSki+fybREBG6tnQ9o8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758207443; c=relaxed/simple;
	bh=9qcMiKQOAovuoaEjP9TACZofJi5AHs2TyY3m1XiwKHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx+6HEUEILdrDCMzFI6FVM1ye96Ux5SZ6lZgUAz0beWZtz11e8gbd7InUNx1nBOPN11BGjsfJoFGIrvSa0dvDUDeyLcQJDzuq46L7axqVTFPUgSmy+sEk9/aVX8RkzJvjEXjcJfPBVs7OgLP+26Xah8PoiJSR1RVmegaVimepog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcWhgwzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F79AC4CEE7;
	Thu, 18 Sep 2025 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207443;
	bh=9qcMiKQOAovuoaEjP9TACZofJi5AHs2TyY3m1XiwKHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcWhgwzJWNeLbMXfOHQfs9m9qODa2qJ9eXsEW/rvGbSvNN+o90pqpCyKlgjJq3ged
	 kMSWut0ZkH3W+6xNNKupWPsfCP/nmlN6baUAxFHP4cRZwHtJcbvNlavy9qNeriWEX5
	 JCCrvpJ6nMvxH2t2cDGVzLYeDcA6EZ+msN6ntF0oJNFho2e4aQAxga3TtX9/yez+Xc
	 ipas8NUaTQM7ZtFKrP7RQar40xeVh91KeJTYBqlCJCHdRNHbmy6V2VVFVaA47i5eNE
	 EfSaLkOP9xeRYQJTDwA6Ema1upog/TAm7CoQpBnJPhqCEW6ySC1DIBuvYV8kgFsIpv
	 GPjd+sCVyMpgA==
Date: Thu, 18 Sep 2025 15:57:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: fsl,fpga-qixis-i2c: add support
 for LX2160ARDB FPGA
Message-ID: <20250918-falsify-walk-2d8d1831141d@spud>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-3-ioana.ciornei@nxp.com>
 <20250917-document-enhance-4a6cb6053882@spud>
 <hp5cothkqfs7hbviesjz3mxr76tjxolnccweuqpfwxs5m7aiqo@uer253tr67z2>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YXff6/cSOKFu56ap"
Content-Disposition: inline
In-Reply-To: <hp5cothkqfs7hbviesjz3mxr76tjxolnccweuqpfwxs5m7aiqo@uer253tr67z2>


--YXff6/cSOKFu56ap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 02:44:06PM +0300, Ioana Ciornei wrote:
> On Wed, Sep 17, 2025 at 08:19:42PM +0100, Conor Dooley wrote:
> > On Wed, Sep 17, 2025 at 12:04:14PM +0300, Ioana Ciornei wrote:
> > > Extend the list of supported compatible strings with fsl,lx2160ardb-f=
pga.
> > >=20
> > > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > > two GPIO controllers, accept the necessary GPIO pattern property.
> > > At the same time, add the #address-cells and #size-cells properties as
> > > valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> > > addressable.
> > >=20
> > > This is necessary because when defining child devices such as the GPIO
> > > controller described in the added example, the child device needs a t=
he
> > > reg property to properly identify its register location in the parent
> > > I2C device address space.
> > >=20
> > > Impose this restriction for the new compatible through an if-statemen=
t.
> > >=20
> > > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Enforce a unit address on the child gpios nodes (remove the ?)
> > > - Enforce the use of unit addresses by having #address-size and
> > >   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> > > Changes in v3:
> > > - Replace the trivial-gpio reference with an explicit mention of the
> > >   accepted child gpio compatible.
> > > - Reword the commit message.
> > > - Add the 'else' case to the if statement.
> > >=20
> > >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 58 +++++++++++++++++=
++
> > >  1 file changed, 58 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i=
2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > > index 28b37772fb65..e889dac052e7 100644
> > > --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > > +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > > @@ -22,6 +22,13 @@ properties:
> > >                - fsl,lx2160aqds-fpga
> > >            - const: fsl,fpga-qixis-i2c
> > >            - const: simple-mfd
> > > +      - const: fsl,lx2160ardb-fpga
> >=20
> > How come this is not compatible with fsl,fpga-qixis-i2c ? Seems like
> > that device has a feature subset of that one, given your changes here.
>=20
> The feature set exposed by the devices is highly dependent on the board
> type, meaning that even though the FPGA found on the LX2160AQDS board
> (fsl,lx2160aqds-fpga) works in the same way in terms of access over I2C
> as the one found on the LX2160ARDB (fsl,lx2160ardb-fpga added here), the
> register map inside the device space its different since there are
> different on-board devices to be controlled.

Okay, please cover that in your commit message. With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--YXff6/cSOKFu56ap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwdzgAKCRB4tDGHoIJi
0vUlAP0VjnEENTcq6jqZ7JzTz9qG2ZP/WhPq63Gs6UIfFNm/xwD7BEXl/9TaxRxr
BuegGH+dt3DDqiQTEe0/rfEr6SOM7gY=
=m3tR
-----END PGP SIGNATURE-----

--YXff6/cSOKFu56ap--


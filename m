Return-Path: <linux-gpio+bounces-10583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFA98A81F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 17:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BDA5B28CE4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B953192598;
	Mon, 30 Sep 2024 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbsO7g4P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F31922E5;
	Mon, 30 Sep 2024 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708837; cv=none; b=eg4yfm7JFTbtE2iOU6sCFQ3655o5gHWB0aHscdZrs1JlgJ41CqcZud3SuDZtEa1D1ghmmXU8ip5xFf1IP05LgjjcDgLS5Qh7wKsr44ryTsD+2tXxRI/5AbS7PvwvjBj0h2MYMpYjqcZRgW3UIW6R97KMfDLIm8r3UPIx1KFjZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708837; c=relaxed/simple;
	bh=1mdFYVUyk9PvCk+d9I1dqxT4nmATsY89D3M/XmBH7uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2tZxQ3Vyn6qiG3+FUqphICKbfl+kuhsr6deZaG+FTL3P1FUZILjhtwxvL9r3YyTAl15/82RADKmsdKn+l0ApfWUfWP5Ce0zArcq/vExZokqaXm47/hCnuTUNJddlhXfDULwmYvEmTF0EmGijAxNv8uiuYY8HWg95xJVNCJD0aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbsO7g4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9C0C4CEC7;
	Mon, 30 Sep 2024 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727708836;
	bh=1mdFYVUyk9PvCk+d9I1dqxT4nmATsY89D3M/XmBH7uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbsO7g4P6V1MhXPMCtd91iXqb8ha/RVg8lmgjLW925cTpYbI3mpRZ84Xz0/MohUsX
	 Ld1gGAeJfc+LkO75un+qB7jmW2XXDRTMsu6htxU2QuRyN1MfaA4rp5R2GYmkz4+zW0
	 2Sv+Nwbd+Wi2h5qtWAuNYA5CaH51HMxWfdDQdEg7s+X663VTrlBEu8j0nOnU8YFCrH
	 Z88RdWG3GdBTXJNziXCDExlsn/pxYu9moA5v8mHQ//q0ODO57Bf/2ctSXY4qkpUoqQ
	 1oQBJyXrWwgEFiV1KZf3ZsMcS01zYgyLT7Wq238czM+Oir3uMlutX77iL4migCeWHN
	 xUE5W2RWnGrRw==
Date: Mon, 30 Sep 2024 16:07:08 +0100
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
Message-ID: <20240930-bamboo-curliness-eb4787b81ea3@spud>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
 <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
 <20240930-shortness-unedited-650f7996e912@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rI5CiW6I9ZSnzML4"
Content-Disposition: inline
In-Reply-To: <20240930-shortness-unedited-650f7996e912@spud>


--rI5CiW6I9ZSnzML4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 04:00:57PM +0100, Conor Dooley wrote:
> On Fri, Sep 27, 2024 at 10:13:54AM +0300, Andrei Stefanescu wrote:
> > Hi Conor,
> >=20
> > Thank you very much for the prompt review!
> >=20
> > On 26/09/2024 18:38, Conor Dooley wrote:
> > > On Thu, Sep 26, 2024 at 05:31:19PM +0300, Andrei Stefanescu wrote:
> > >> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> > >>
> > >> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> > >> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > >> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > >> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> > >=20
> > > What's up with this SoB chain? You're the author what did
> > > the other 3 people do? Are they missing co-developed-by tags?
> >=20
> > Yes, thank you for suggesting it! I will also add Co-developed-by tags
> > for them. In the end it should look like this:
> >=20
> > Co-developed-by: Phu Luu An <phu.luuan@nxp.com>
> > Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >=20
> > >> +
> > >> +examples:
> > >> +  - |
> > >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > >> +    #include <dt-bindings/interrupt-controller/irq.h>
> > >> +
> > >> +    gpio@4009d700 {
> > >> +        compatible =3D "nxp,s32g2-siul2-gpio";
> > >> +        reg =3D <0x4009d700 0x10>,
> > >> +              <0x44011700 0x18>,
> > >> +              <0x4009d740 0x10>,
> > >> +              <0x44011740 0x18>,
> > >> +              <0x44010010 0xb4>,
> > >> +              <0x44011078 0x80>;
> > >=20
> > > Huh, I only noticed this now. Are you sure that this is a correct
> > > representation of this device, and it is not really part of some sysc=
on?
> > > The "random" nature of the addresses  and the tiny sizes of the
> > > reservations make it seem that way. What other devices are in these
> > > regions?
>=20
> Thanks for your answer to my second question, but I think you missed this
> part here ^^^

Reading it again, I think you might have answered my first question,
though not explicitly. The regions in question do both pinctrl and gpio,
but you have chosen to represent it has lots of mini register regions,
rather than as a simple-mfd type device - which I think would be the
correct representation. .

Cheers,
Conor.

>=20
> > >=20
> > > Additionally, it looks like "opads0" and "ipads0" are in a different
> > > region to their "1" equivalents. Should this really be represented as
> > > two disctint GPIO controllers?
> >=20
> > I will add a bit more context regarding the hardware.
> >=20
> > The hardware module which implements pinctrl & GPIO is called SIUL2.
> > For both S32G2 and S32G3 we have the same version of the module and=20
> > it is integrated in the same way. Each SoC has two SIUL2 instances which
> > mostly have the same register types and only differ in the number
> > of pads associated to them:
> >=20
> > - SIUL2_0 mapped at address 0x4009c000, handling pins 0 - 101
> > - SIUL2_1 mapped at address 0x44010000, handling pins 112 - 190
> >=20
> > There are multiple registers for the SIUL2 modules which are important
> > for pinctrl & GPIO:
> >=20
> > - MSCR (Multiplexed Signal Configuration Register)
> >   It configures the function of a pin and some
> >   pinconf properties:
> >     - input buffer
> >     - output buffer
> >     - open-drain
> >     - pull-up/pull-down
> >     - slew rate
> >   Function 0 means the pin is to be used as a GPIO.
> >=20
> > - IMCR (Input Multiplexed Signal and Configuration Register)
> >   If the signal on this pad is to be read by another hardware
> >   module, this register is similar to a multiplexer, its value
> >   configures which pad the hardware will link to the module.
> >   As an example let's consider the I2C0 SDA line. It has one
> >   IMCR associated to it. Below are its possible pins and
> >   corresponding IMCR values:
> >     pin 16 <- 2
> >     pin 24 <- 7
> >     pin 31 <- 3
> >     pin 122 <- 4=20
> >       (Note that MSCR122 is part of SIUL2_1 but the IMCR for
> >        I2C0_SDA is part of SIUL2_0)
> >     pin 153 <- 5
> >     pin 161 <- 6
> >   The IMCR values should be aligned with the function bits in the
> >   MSCR bits. If we want to use pin 122 for I2C0_SDA we will configure
> >   the function bits in MSCR122 and write the value 4 to the I2C0_SDA
> >   IMCR.=20
> >=20
> > - PGPDO/PGPDI Parallel GPIO Pad Data Out/In
> >   16 bit registers where each bit(besides some gaps) represents
> >   a GPIO's output/input value
> >=20
> > - DISR0, DIRER0, IREER0, IFEER0
> >   These registers are used for: status, enable, rising/falling edge
> >   configuration for interrupts. We have 32 interrupts called EIRQ and
> >   each interrupt has one or more pads associated with it (controlled
> >   by an IMCR register per EIRQ).
> >=20
> >   However, one important thing to note is that even though there are
> >   EIRQs for SIUL2_0 pads, all the interrupt registers mentioned above
> >   are only present in SIUL2_1.
> >=20
> > Because of mixed pins (I2C0_SDA in the example above with the MSCR
> > in SIUL2_1 for pad 122 and the IMCR in SIUL2_0) and the interrupt
> > configuration registers in SIUL2_1 we decided to have a single
> > driver instance.
> >=20
> > >=20
> > >=20
> > > Cheers,
> > > Conor.
> > >=20
> >=20
> > Best regards,
> > Andrei
> >=20



--rI5CiW6I9ZSnzML4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvq+nAAKCRB4tDGHoIJi
0iQdAQDpVmzuFtiWSE3Ed5Pn+Tzm5lXzptDhPwqs5ffBQtwd3wEAt7HQn7QqknYP
n+uLRcALZudJ6e7jYxDU3DZjIF3ueAM=
=Wd+D
-----END PGP SIGNATURE-----

--rI5CiW6I9ZSnzML4--


Return-Path: <linux-gpio+bounces-10582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4613198A80D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 17:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7631C2309A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F08190052;
	Mon, 30 Sep 2024 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiAWCsUk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3431CFA9;
	Mon, 30 Sep 2024 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708463; cv=none; b=UMeUdPPjJsh82Fafncqn94Dk7AEoO7329WKKX8zH68iBZ8yMfzJzG3VokTejzRxaTSGKhZhTlyrLcNTKmn3idT3xbkbSyhrNWj1WDf8YknYqtRSG4GyIKVeTINQR8d6LviHzwko4Stq3DFasNMMnHBC/4+o9E9fXr3R1lNYOXy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708463; c=relaxed/simple;
	bh=eohE6QCObep88wykExC/gfzu1IpD4jbaR8BG3GtP1Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuMqJNCSNa/UlIuTRS0ekZyYmU42UDjmNdK24rsKNlYRDr9Y8JPGydrTP3Qc6qETJO+Y8DTAQJU7g4VJecK6y81L+d397twcgXsIEZ1RqMYIgghUCcEaNgwmYpHJKjYLfhw+fHKxSZ6TqDPa2CM5yLLd8ksn3NrIcMOCSCS/84w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiAWCsUk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C62C4CEC7;
	Mon, 30 Sep 2024 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727708462;
	bh=eohE6QCObep88wykExC/gfzu1IpD4jbaR8BG3GtP1Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiAWCsUkUogRQgFUOjRzTChQGzUNcImiaZO0kaN2QxvNiOThYXbpKlI5fo+ExMfZS
	 /90bIfUh+bwgt7TeLd+UHumn8FxBpuBgE+mOoUjeoPprSrY7f+3p/i6Wc8LZJHogxi
	 qdbLegcP3cZHBhe5j6wGxUYFz95qJxUabVs4skRK3xYR4eDg27xeppTz+gd7MDGiDl
	 Pm5D700V/MnUdEODmqIyLFmAf4rr8bQ5PfZH+ulN25Dmp/OBeb1Yg3kBI95ftlSKTm
	 D/1AA8AmvV2ukVDBTB1uR6RvvwEiL/qNqYSffHlXuXRkAK1EsVGHDhX9orLfLrteKz
	 nBhM9Azr5pm1w==
Date: Mon, 30 Sep 2024 16:00:57 +0100
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
Message-ID: <20240930-shortness-unedited-650f7996e912@spud>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
 <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ks3nvjHvnjWNbDgx"
Content-Disposition: inline
In-Reply-To: <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>


--ks3nvjHvnjWNbDgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:13:54AM +0300, Andrei Stefanescu wrote:
> Hi Conor,
>=20
> Thank you very much for the prompt review!
>=20
> On 26/09/2024 18:38, Conor Dooley wrote:
> > On Thu, Sep 26, 2024 at 05:31:19PM +0300, Andrei Stefanescu wrote:
> >> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> >>
> >> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> >> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> >> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >=20
> > What's up with this SoB chain? You're the author what did
> > the other 3 people do? Are they missing co-developed-by tags?
>=20
> Yes, thank you for suggesting it! I will also add Co-developed-by tags
> for them. In the end it should look like this:
>=20
> Co-developed-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>=20
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    gpio@4009d700 {
> >> +        compatible =3D "nxp,s32g2-siul2-gpio";
> >> +        reg =3D <0x4009d700 0x10>,
> >> +              <0x44011700 0x18>,
> >> +              <0x4009d740 0x10>,
> >> +              <0x44011740 0x18>,
> >> +              <0x44010010 0xb4>,
> >> +              <0x44011078 0x80>;
> >=20
> > Huh, I only noticed this now. Are you sure that this is a correct
> > representation of this device, and it is not really part of some syscon?
> > The "random" nature of the addresses  and the tiny sizes of the
> > reservations make it seem that way. What other devices are in these
> > regions?

Thanks for your answer to my second question, but I think you missed this
part here ^^^

> >=20
> > Additionally, it looks like "opads0" and "ipads0" are in a different
> > region to their "1" equivalents. Should this really be represented as
> > two disctint GPIO controllers?
>=20
> I will add a bit more context regarding the hardware.
>=20
> The hardware module which implements pinctrl & GPIO is called SIUL2.
> For both S32G2 and S32G3 we have the same version of the module and=20
> it is integrated in the same way. Each SoC has two SIUL2 instances which
> mostly have the same register types and only differ in the number
> of pads associated to them:
>=20
> - SIUL2_0 mapped at address 0x4009c000, handling pins 0 - 101
> - SIUL2_1 mapped at address 0x44010000, handling pins 112 - 190
>=20
> There are multiple registers for the SIUL2 modules which are important
> for pinctrl & GPIO:
>=20
> - MSCR (Multiplexed Signal Configuration Register)
>   It configures the function of a pin and some
>   pinconf properties:
>     - input buffer
>     - output buffer
>     - open-drain
>     - pull-up/pull-down
>     - slew rate
>   Function 0 means the pin is to be used as a GPIO.
>=20
> - IMCR (Input Multiplexed Signal and Configuration Register)
>   If the signal on this pad is to be read by another hardware
>   module, this register is similar to a multiplexer, its value
>   configures which pad the hardware will link to the module.
>   As an example let's consider the I2C0 SDA line. It has one
>   IMCR associated to it. Below are its possible pins and
>   corresponding IMCR values:
>     pin 16 <- 2
>     pin 24 <- 7
>     pin 31 <- 3
>     pin 122 <- 4=20
>       (Note that MSCR122 is part of SIUL2_1 but the IMCR for
>        I2C0_SDA is part of SIUL2_0)
>     pin 153 <- 5
>     pin 161 <- 6
>   The IMCR values should be aligned with the function bits in the
>   MSCR bits. If we want to use pin 122 for I2C0_SDA we will configure
>   the function bits in MSCR122 and write the value 4 to the I2C0_SDA
>   IMCR.=20
>=20
> - PGPDO/PGPDI Parallel GPIO Pad Data Out/In
>   16 bit registers where each bit(besides some gaps) represents
>   a GPIO's output/input value
>=20
> - DISR0, DIRER0, IREER0, IFEER0
>   These registers are used for: status, enable, rising/falling edge
>   configuration for interrupts. We have 32 interrupts called EIRQ and
>   each interrupt has one or more pads associated with it (controlled
>   by an IMCR register per EIRQ).
>=20
>   However, one important thing to note is that even though there are
>   EIRQs for SIUL2_0 pads, all the interrupt registers mentioned above
>   are only present in SIUL2_1.
>=20
> Because of mixed pins (I2C0_SDA in the example above with the MSCR
> in SIUL2_1 for pad 122 and the IMCR in SIUL2_0) and the interrupt
> configuration registers in SIUL2_1 we decided to have a single
> driver instance.
>=20
> >=20
> >=20
> > Cheers,
> > Conor.
> >=20
>=20
> Best regards,
> Andrei
>=20

--ks3nvjHvnjWNbDgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvq9KAAKCRB4tDGHoIJi
0vmHAQDZkEsvWqk9bF65pY+mP7V4lxNXaDOc2Y3zZQ2x4yhxPwEAlTF5ibAwpY74
4llBQ4d9tup2Szwhs4An5BnJEm0SSwA=
=BZuW
-----END PGP SIGNATURE-----

--ks3nvjHvnjWNbDgx--


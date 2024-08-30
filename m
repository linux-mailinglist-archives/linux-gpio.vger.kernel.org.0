Return-Path: <linux-gpio+bounces-9449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB2965FAF
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 12:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18FDC1F21BC1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A6218FC9D;
	Fri, 30 Aug 2024 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qi3JE0Is"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD6917DFF3;
	Fri, 30 Aug 2024 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725015335; cv=none; b=VN7yI9nSdGiJAG2qK7gDYuy1NaHdpmfQn1xRBY6FpF9xcLu2U1mov8EjHE3kVQwGnzPvyiBpogQ34+7YUk9BL5jn6qzOfZSScrfKBi6+ylQNW2E0EmgH/2aF2rQgUeOYuYJJuKNF25yhIr9csrGT2HoQm+XCoN0CuY2kNPDEAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725015335; c=relaxed/simple;
	bh=WiGHYqQ3xuBvbimQ4RqLRQywBEUVEijfKbSvmrPedj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaWZ+7YRV1SxUh64u5WuO5QtkJk60OSqcdoApQ5CMjjnlMv2+CsiUZIxpYdX2QXZvBeiQjv8WH7Pnc6d5hbYinsWi8kH6e1Mrjagrc7c2k9UkjsNpPlGU9xs/MAv5wGb3BXhUZsBqm2kL7CYYvMa0epOX8qyrWzccVdt8e7Jav8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qi3JE0Is; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94486C4CEC2;
	Fri, 30 Aug 2024 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725015335;
	bh=WiGHYqQ3xuBvbimQ4RqLRQywBEUVEijfKbSvmrPedj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qi3JE0Is0KSULRu+fHNrtUz2DyqQgaeXzDIGycaqMRW3M7Y/EmT74mQyMS1sU87ye
	 KGHIO83AP2PCPYyko+OIe6/mL6Etc4gb50kgEXVnW44Jlgm4tbn1buj1W8bzD/KSLD
	 6GewoEWUoTFR+KOqysHF5g6WwYgbUjR+EBsMOFlbl98oe6ypzCBfVVm1F54opEwSRV
	 UKvGLSTh1yj5MB40y7PBMKurc1+3ciV1yhYI+krxr6XAwidltjcF481DWyTFhk4J37
	 Z22rXE0rcEep5BGKVYla/u3JntoVAz2YK/uEvvumgssZleJ7IBxFKGjOHeNUWluFxn
	 fkbiwEMm4C+rQ==
Date: Fri, 30 Aug 2024 12:55:32 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZtGlJBORZaFm_77K@lore-desk>
References: <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
 <66d187f1.050a0220.3213d8.ad53@mx.google.com>
 <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IYN2kXd47Q+edkfX"
Content-Disposition: inline
In-Reply-To: <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>


--IYN2kXd47Q+edkfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]

> >>>
> >>> Hi Rob, thanks a lot for the hint, I hope we can finally find a solut=
ion
> >>> on how to implement this.
> >>>
> >>> In Documentation the block is called GPIO Controller. As explained it=
 does
> >>> expose pinctrl function AND pwm (with regs in the middle)
> >>>
> >>> Is this semplification really needed? It does pose some problem driver
> >>> wise (on where to put the driver, in what subsystem) and also on the
> >>
> >> Sorry, but no, dt-bindings do not affect the driver at all in such way.
> >> Nothing changes in your driver in such aspect, no dilemma where to put
> >> it (the same place as before).
> >>
> >=20
> > Ok, from the proposed node structure, is it problematic to move the
> > gpio-controller and -cells in the pinctrl node? And also the pwm-cells
> > to the pwm node?
>=20
> The move is just unnecessary and not neat. You design DTS based on your
> drivers architecture and this is exactly what we want to avoid.
>=20
> > This is similar to how it's done by broadcom GPIO MFD [1] that also
>=20
> There are 'reg' fields, which is the main problem here. I don't like
> that arguments because it entirely misses the discussions - about that
> binding or other bindings - happening prior to merge.
>=20
> > expose pinctrl and other device in the same register block as MFD
> > childs.
> >=20
> > This would be the final node block.
> >=20
> >                 mfd@1fbf0200 {
> >                         compatible =3D "airoha,en7581-gpio-mfd";
> >                         reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> >=20
> >                         interrupt-parent =3D <&gic>;
> >                         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> >=20
> >                         pio: pinctrl {
> >                                 compatible =3D "airoha,en7581-pinctrl";
> >=20
> >                                 gpio-controller;
> >                                 #gpio-cells =3D <2>;
> >=20
> >                                 interrupt-controller;
> >                                 #interrupt-cells =3D <2>;
>=20
> No resources here...

ack. iiuc, all the properties will be in the parent node (mfd) and we will
have just the compatible strings in the child ones, right? Something like:

		mfd@1fbf0200 {
			compatible =3D "airoha,en7581-gpio-mfd";
			reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
			gpio-controller;
			#gpio-cells =3D <2>;

			...
			#pwm-cells =3D <3>;

			pio: pinctrl {
				compatible =3D "airoha,en7581-pinctrl";
			};

			pwm: pwm {
				compatible =3D "airoha,en7581-pwm";
			};
		};

>=20
> >                         };
> >=20
> >                         pwm: pwm {
> >                                 compatible =3D "airoha,en7581-pwm";
> >=20
> >                                 #pwm-cells =3D <3>;
> >                                 status =3D "disabled";
>=20
> And why is it disabled? No external resources. There is no benefit of
> this node.

This is just a copy-paster error.

Regards,
Lorenzo

>=20
> >                         };
> >                 };
> >=20
> > I also link the implementation of the MFD driver [2]
> >=20
> > [1] https://elixir.bootlin.com/linux/v6.10.7/source/Documentation/devic=
etree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> > [2] https://github.com/Ansuel/linux/blob/airoha-mfd/drivers/mfd/airoha-=
en7581-gpio-mfd.c
>=20
>=20
> Best regards,
> Krzysztof
>=20

--IYN2kXd47Q+edkfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZtGlJAAKCRA6cBh0uS2t
rFzQAP4mYUCwg1JRcirltoinC6e9pS7gd5QYY6CO37on5nvrvQEAnfzJf6uwCbLw
wY4Eg/KVWSaHIB8anfeZPF6f9L4DyAc=
=nxyD
-----END PGP SIGNATURE-----

--IYN2kXd47Q+edkfX--


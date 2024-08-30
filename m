Return-Path: <linux-gpio+bounces-9450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D314C965FE9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 13:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A3371F24080
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0934319ABC2;
	Fri, 30 Aug 2024 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GA5zSlZj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15019ABBB;
	Fri, 30 Aug 2024 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725015724; cv=none; b=RDw9vxi2sQUuWW1JwUacAR4XFi4u2up90U0CADJBDHPzjFBJKwJpKaYe+5MY3K9q/qSDmkCH+Nt07xFBL6O4v+mXq+KUf2k6HmZ1ac1yOVHAL56q38owl0DP6R1SGxlxq3tdMzcJfFz+Z/1UOEcLMh7McvP0FkV1zUf2SfDSE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725015724; c=relaxed/simple;
	bh=TDfK2OXLeyP1NsBRvK2CqLKE67BvroyGJQRQiZTW4AU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/H37y46XmwUZTt2s0xvbIB4JAWg7McBPHIloL20R0/BOffyMaTVWVEMbX2ZsdikLfgx8kbdFzyyWoP6vVTTQeknG/5l2ER6pccqZf9sxCaj3KRX5tuiVYtOfR9rLA/SVEGMz+GpFY23TUWbBr8eluisAEm9R1VpcMMAx1LyfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GA5zSlZj; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725015722; x=1756551722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TDfK2OXLeyP1NsBRvK2CqLKE67BvroyGJQRQiZTW4AU=;
  b=GA5zSlZjlBK05UcOa8fkVjUK5neWkXsGAq6gHusApf9Ggw8NZYc91jB6
   LyhgDK0SS8bH9n7iE2EQC2ETmGv6jBGn8A13uqKqjl38/Mr8Xw9paJ7jw
   gz8Yx4ttjkiOEJ4VHCMEjfAFfDr5C4rNmjdUoQmcE98R4+/srjbIjtRO8
   yOxUOVFk7p8nuVD9sfe63kiYJV7DVfmksbxcL+XcQNcsn0i/NTk6IuEBC
   2WIrw3PdKBBIjAcUoSoz26NTn7xw0pEBnXA0G0E9sVKJ8bdcyb4tXuyWt
   G3nSERceBswJkSdoOux4BVvh+/4j0xA7fUq5Yn/W+KLfBfc9oKLWrCW1f
   Q==;
X-CSE-ConnectionGUID: 491UwJ12S2WuGIiIBwqZ7Q==
X-CSE-MsgGUID: OvBJOUT7RViFE4CCask+Fw==
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="asc'?scan'208";a="198533155"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Aug 2024 04:02:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 30 Aug 2024 04:01:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 30 Aug 2024 04:01:50 -0700
Date: Fri, 30 Aug 2024 12:01:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Christian Marangi
	<ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>, Lorenzo Bianconi
	<lorenzo.bianconi83@gmail.com>, Conor Dooley <conor@kernel.org>, Benjamin
 Larsson <benjamin.larsson@genexis.eu>, Linus Walleij
	<linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@airoha.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240830-payphone-unexposed-75eed532c14d@wendy>
References: <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
 <66d187f1.050a0220.3213d8.ad53@mx.google.com>
 <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>
 <ZtGlJBORZaFm_77K@lore-desk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BTdQ0ZNkxqHmGinK"
Content-Disposition: inline
In-Reply-To: <ZtGlJBORZaFm_77K@lore-desk>

--BTdQ0ZNkxqHmGinK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 12:55:32PM +0200, Lorenzo Bianconi wrote:
> [...]
>=20
> > >>>
> > >>> Hi Rob, thanks a lot for the hint, I hope we can finally find a sol=
ution
> > >>> on how to implement this.
> > >>>
> > >>> In Documentation the block is called GPIO Controller. As explained =
it does
> > >>> expose pinctrl function AND pwm (with regs in the middle)
> > >>>
> > >>> Is this semplification really needed? It does pose some problem dri=
ver
> > >>> wise (on where to put the driver, in what subsystem) and also on the
> > >>
> > >> Sorry, but no, dt-bindings do not affect the driver at all in such w=
ay.
> > >> Nothing changes in your driver in such aspect, no dilemma where to p=
ut
> > >> it (the same place as before).
> > >>
> > >=20
> > > Ok, from the proposed node structure, is it problematic to move the
> > > gpio-controller and -cells in the pinctrl node? And also the pwm-cells
> > > to the pwm node?
> >=20
> > The move is just unnecessary and not neat. You design DTS based on your
> > drivers architecture and this is exactly what we want to avoid.
> >=20
> > > This is similar to how it's done by broadcom GPIO MFD [1] that also
> >=20
> > There are 'reg' fields, which is the main problem here. I don't like
> > that arguments because it entirely misses the discussions - about that
> > binding or other bindings - happening prior to merge.
> >=20
> > > expose pinctrl and other device in the same register block as MFD
> > > childs.
> > >=20
> > > This would be the final node block.
> > >=20
> > >                 mfd@1fbf0200 {
> > >                         compatible =3D "airoha,en7581-gpio-mfd";
> > >                         reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> > >=20
> > >                         interrupt-parent =3D <&gic>;
> > >                         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIG=
H>;
> > >=20
> > >                         pio: pinctrl {
> > >                                 compatible =3D "airoha,en7581-pinctrl=
";
> > >=20
> > >                                 gpio-controller;
> > >                                 #gpio-cells =3D <2>;
> > >=20
> > >                                 interrupt-controller;
> > >                                 #interrupt-cells =3D <2>;
> >=20
> > No resources here...
>=20
> ack. iiuc, all the properties will be in the parent node (mfd) and we will
> have just the compatible strings in the child ones, right? Something like:
>=20
> 		mfd@1fbf0200 {
> 			compatible =3D "airoha,en7581-gpio-mfd";
> 			reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> 			gpio-controller;
> 			#gpio-cells =3D <2>;
>=20
> 			...
> 			#pwm-cells =3D <3>;
>=20
> 			pio: pinctrl {
> 				compatible =3D "airoha,en7581-pinctrl";
> 			};
>=20
> 			pwm: pwm {
> 				compatible =3D "airoha,en7581-pwm";
> 			};
> 		};


Didn't Rob basically tell you how to do it earlier in the thread?
What you've got now makes no sense, the compatibles only exist in that
to probe drivers, which you can do from the mfd driver with
mfd_add_devices() or w/e that function is called.

Cheers,
Conor.

--BTdQ0ZNkxqHmGinK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtGmfwAKCRB4tDGHoIJi
0sEcAQCQDluOGutoHHSxi1RRVaYRPSJP0f1MJmoiZYp/4PI/ugD+IRBsC22377IK
Ef6OU0NVQVpsYSIGHZUMn0A7WR8tYwM=
=YVf8
-----END PGP SIGNATURE-----

--BTdQ0ZNkxqHmGinK--


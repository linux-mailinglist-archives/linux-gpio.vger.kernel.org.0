Return-Path: <linux-gpio+bounces-12467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D09B9424
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 16:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DAE21C20DC2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 15:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4771C2DB2;
	Fri,  1 Nov 2024 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHVtaRm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABE4778E
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730474217; cv=none; b=lFD7fFir8U3d7YCj9BZrEZ6QhdM+bLvIBgq8Bsc0lWZ0pkTnc4lRYQ0vMkGA/rakXtjCb3ccs9pBDJSW6TLHCW6RTZrdPJ3ihsWOoIKTJsoloxcZhTyFNYcjR8O6OFCiEMxgberWMrknR08ZYmE9Lnq+bzZDbK0HEdqN5r8Nv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730474217; c=relaxed/simple;
	bh=tomTIodgvtOS/r8tCig5+r70aPfPaOkftHuth7jHWD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ruq8xqvkAUHNKi7zA1t68tklSKiNn2L7R02ZgFSiQBLTPths5lk9yFU9kTNbXmTv+7JgqFx7ZKPwRvgpBA/J3P0Q5azSli7ejfLTTqSSAxHACbf3V3vjJUSpkNBlc6qbVfNWeMDuVaI53S6iH3Q2kgNzWDXc05JCcB2sN/WdBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHVtaRm+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A93AC4CECD;
	Fri,  1 Nov 2024 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730474217;
	bh=tomTIodgvtOS/r8tCig5+r70aPfPaOkftHuth7jHWD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHVtaRm+iK2FKGTvkgr8ehJH8u8O9qBxYrhpZ/LADHzblJiBCUGCmyNb8cp60TQXs
	 zPUiEO3OYHH52uksJpGKu02ugZCeJMrCZowFZBU1QJEwIPK4Oi/wk9z0uHMZbF+oio
	 hyPzbirI0dN8KP8skxIQy/Ghlr9crQCg6Ybp1TLn/sDpxN14e4v+cYrb2Bf9rlexLH
	 Y4x4WvxTaxCIakHq1zAZuMwNsqe2XwA0H4zYwfW/rhErCjT429R+t5VFzz4iDxS1qn
	 j+7COSFcOQrwA0r4kYUTvr6O2FI2tGYhzrYRwrRxDPGxrj6TkIy3Poi2tKDpiLkn3f
	 +VIawMerAfmHQ==
Date: Fri, 1 Nov 2024 15:16:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241101-impeding-outpour-e68b980c14b8@spud>
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud>
 <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
 <20241101-cadmium-speed-78ff7577347a@spud>
 <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>
 <20241101-affirm-evict-bbd862b08832@spud>
 <CAMRc=MfSOUCFBjqeHwyMgKmNWb4==4=kwdT+aUtPHWKuiWm0aA@mail.gmail.com>
 <20241101-culprit-ascend-de1a8f1967d7@spud>
 <CAMRc=MfhwPij=t+PBicHCE6xsfBxYeKK1+r5UKMZ5vqHAbuZ2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g8cPArKqsTu9FEC6"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfhwPij=t+PBicHCE6xsfBxYeKK1+r5UKMZ5vqHAbuZ2w@mail.gmail.com>


--g8cPArKqsTu9FEC6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 03:32:16PM +0100, Bartosz Golaszewski wrote:
> On Fri, Nov 1, 2024 at 3:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Fri, Nov 01, 2024 at 02:47:51PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Nov 1, 2024 at 2:37=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > > >
> > > > On Fri, Nov 01, 2024 at 02:09:06PM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kernel=
=2Eorg> wrote:
> > > > > >
> > > > > > On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski w=
rote:
> > > > > > > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@k=
ernel.org> wrote:
> > > > > >
> > > > > > > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_directi=
on_input;
> > > > > > > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direct=
ion_output;
> > > > > > > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direc=
tion;
> > > > > > > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > > > > > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > > > > > > +       mpfs_gpio->gc.base =3D -1;
> > > > > > > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> > > > > > >
> > > > > > > The "ngpios" property will be parsed by GPIO core so no need =
to set it.
> > > > > >
> > > > > > Are you sure it'll work here? I tried dropping the ngpios parsi=
ng, but I
> > > > > > get:
> > > > > > gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed =
to register, -22
> > > > > >
> > > > > > That's coming from the device_property_read_u32(dev, "ngpios", =
&ngpios);
> > > > > > in gpiochip_get_ngpios(). Checking against the bluefield driver=
 and the
> > > > > > code in gpiochip_add_data_with_key(), it's not immediately obvi=
ous what
> > > > > > I am missing.
> > > > >
> > > > > Does dev have an fwnode correctly assigned? What does dev_fwnode(=
dev) return?
> > > >
> > > > It's not a null pointer or something obviously wrong by virtue of b=
eing
> > > > null-adjacent, it is a virtual address but not one that %ps can ide=
ntify.
> > >
> > > This is an OF system right? If you do dev_of_node(dev), does the
> > > returned node->name show the OF node you expect?
> >
> > Yes.
>=20
> I mean inside gpiochip_get_ngpios(), sorry for confusion.

That is what I checked actually, didn't think you'd ask me to check the
one in probe that works.

> > > Does it have the
> > > "ngpios" property? Can you read it with of_property_read_u32()?
> >
> > No, EINVAL there too.
>=20
> I assume the node is not assigned correctly. What if in your probe you
> do: gc->fwnode =3D dev_fwnode(dev)?

Makes no difference, same probe failure as before...


=2E..but I just realised something: ngpios isn't a required property for
this device as it has a default of 32 and 32 is how many gpios this
controller has. Simple oversight, hours wasted. That's always the way of
it I suppose. The core code can't be used here I suppose, since ngpios
is optional.

--g8cPArKqsTu9FEC6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyTwxQAKCRB4tDGHoIJi
0m3+AP0XBHShmnjJ2v/O/Ze2MN2hk6ClZWlhaLyXP8jqktK49wD+Jv4N3fOeNA8S
ag5EQ5vxggU5RLtIEEteumhpaTWsxwQ=
=qJvd
-----END PGP SIGNATURE-----

--g8cPArKqsTu9FEC6--


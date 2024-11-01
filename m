Return-Path: <linux-gpio+bounces-12462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0A9B9229
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 14:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B3B1C21699
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14AB19E997;
	Fri,  1 Nov 2024 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lcvp/NQe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB70195811
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468261; cv=none; b=JPpm2VGS+tp61VSIzzCbALKRoxvgRVIYnOut354v0fVQJZyQAicYqdsaHudO0VpJYCaanwMbDZAPK7wyWXf47He373drMLZf0YMzOkdL0f/z/7ZZ3TU3hIZGYymAWGWw8txeKczm49h5+fug0n9K4rz+G11GiRYtpDFzM8AVDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468261; c=relaxed/simple;
	bh=FyPZaLHBSJbkUwKwjn73pAWSZSRRAfTLWf2oqm/ajkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxsOkn7xF7zuiZq79LRMjSPoFEcDaFwd9PFYxj+wigNRCjLgglGVwpdzSxyWXWsUh61wVGKoiH2lWcpxcoioJHOEdywJKL19WHQ8qVX+FSoNH7vJ1Jj46VXBPVfvOHf48VizoLeuePOmNoeHYW/PmCTScSCrll+1SupH7ODk7WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lcvp/NQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769ABC4CECD;
	Fri,  1 Nov 2024 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730468261;
	bh=FyPZaLHBSJbkUwKwjn73pAWSZSRRAfTLWf2oqm/ajkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lcvp/NQeLG2Y4JiExbOZl5R2yIdmKvfoslwcUMsbyvNiuoikAe7RLrzz/1dvottuV
	 Aj3Gw+TvxYxHX5NeVx+51Xw28MJrIqaAMWj9EpSMNHgJfItt7RJqFLhrnKssQH9StF
	 gzfC3yT+L3uwErEtfOD4PBHJjCJaDZyp4A1lN/tTd53CEoVeWjF6gb1vGxky3/oRKw
	 CyyZOXCFrsHO715TgJ80z2azNtagAm3SIqbJYV2rHLAfxV0PUopHRTjAeYwEoDdgLF
	 5JKgQ/9FLXiYspGbeBZ9BmSdaBmrrLpWZTTC97Lmx2PpdfEe/4mJUlhe+1SYeWnHgi
	 b+AazWFDbHskg==
Date: Fri, 1 Nov 2024 13:37:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241101-affirm-evict-bbd862b08832@spud>
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud>
 <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
 <20241101-cadmium-speed-78ff7577347a@spud>
 <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FX3wWjLonG+qNU/x"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>


--FX3wWjLonG+qNU/x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 02:09:06PM +0100, Bartosz Golaszewski wrote:
> On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> >
> > > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_input;
> > > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_outp=
ut;
> > > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> > > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > > +       mpfs_gpio->gc.base =3D -1;
> > > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> > >
> > > The "ngpios" property will be parsed by GPIO core so no need to set i=
t.
> >
> > Are you sure it'll work here? I tried dropping the ngpios parsing, but I
> > get:
> > gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed to regis=
ter, -22
> >
> > That's coming from the device_property_read_u32(dev, "ngpios", &ngpios);
> > in gpiochip_get_ngpios(). Checking against the bluefield driver and the
> > code in gpiochip_add_data_with_key(), it's not immediately obvious what
> > I am missing.
>=20
> Does dev have an fwnode correctly assigned? What does dev_fwnode(dev) ret=
urn?

It's not a null pointer or something obviously wrong by virtue of being
null-adjacent, it is a virtual address but not one that %ps can identify.

--FX3wWjLonG+qNU/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyTZoQAKCRB4tDGHoIJi
0rklAPoDIxXS4Ev6HAE/KzlQ/9UhhYQpolpLFcUXW830fGJUhwD/V7JY4AMT43WD
MWtUnbyO2KxD5E9cR//V7sZJluy0fAM=
=IcNA
-----END PGP SIGNATURE-----

--FX3wWjLonG+qNU/x--


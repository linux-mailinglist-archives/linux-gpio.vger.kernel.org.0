Return-Path: <linux-gpio+bounces-28939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A77ACC7891D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 847383621A5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2276346767;
	Fri, 21 Nov 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQdr8ZMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688D275AFF;
	Fri, 21 Nov 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722019; cv=none; b=pKH7euJNRXvaxYmLri1Goadz1Id1Tlk64Xf0ZRX+Hq1xX8GL2kh3qVxarpwxT28LfQRWAcBEcV0VQS1V2GXNIZbyx2gZp9lqM15MKFNvmppHepo1ptDIYT/pv01f0t4adTiN/ZPD4aQwM/BzVfnxN7VRYxQyYqbsNQ8eqpILVoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722019; c=relaxed/simple;
	bh=IY7GKSwUDc964CV9W4zkczN113qk2pJQBKtZUin5/Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPjFqiCZ1AUmRdb9CpRMC+xGMfXqlf+o52puOd8RJK3p+2OyC+lQT4Zjyie/NpfqnS3h9GJcl/uGSfzdUTIvC/ypRljF8GuKIE3OJX+tXjddeovH/5CainWFKP6anaIDJzbCUPA+OwRi1a73I+cRwUaLrXvxhWw9VGUYNhivnGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQdr8ZMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46416C4CEF1;
	Fri, 21 Nov 2025 10:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763722019;
	bh=IY7GKSwUDc964CV9W4zkczN113qk2pJQBKtZUin5/Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQdr8ZMN3vMm/65ROOuoj2jbdYyDmxCKlQpD02CAOU7YslNTWNmFahFkpXkE8Y2Xc
	 A9n32PFwpx9KEdotOuicx8rjAVk+YVqLtTd+Hq8xhuZNihxjPQAGGX2BWGvFdv8EIE
	 q2u2JY3i0ujYRhmLzPpsKBB2s0Yzd6ZGB9CLtdTa1m9oSYkhTcn01feba6FdzooDpM
	 RbjIUNOFzYlL97rDOwhcSBxLiq+HD5b9H7hPpkbubn/bX5iz529xHdWJU9myG1I6cd
	 ys1VNpFUdoq0+BubJ4VMFGmkptP0k3sGnL8bRx3Dphk3LvIq3XgBp8n2WgN0VcnweU
	 xYrIPrZRcGDag==
Date: Fri, 21 Nov 2025 10:46:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251121-epidermis-overdue-1ebb1bb85e36@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud>
 <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud>
 <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="InPS5/iTnJJVQXkm"
Content-Disposition: inline
In-Reply-To: <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>


--InPS5/iTnJJVQXkm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 12:13:21AM +0100, Linus Walleij wrote:
> On Thu, Nov 20, 2025 at 1:26=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> > On Wed, Nov 19, 2025 at 10:48:07PM +0100, Linus Walleij wrote:
> > > On Wed, Nov 19, 2025 at 7:23=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
>=20
> > > I looked at the bindings that look like this and are not 1:1 to the
> > > in-kernel configs:
> > >
> > >   input-schmitt-enable:
> > >     type: boolean
> > >     description: enable schmitt-trigger mode
> > >
> > >   input-schmitt-disable:
> > >     type: boolean
> > >     description: disable schmitt-trigger mode
> > >
> > >   input-schmitt-microvolt:
> > >     description: threshold strength for schmitt-trigger
> > >
> > > 1. input-schmitt is missing! But it is right there in
> > > drivers/pinctrl/pinconf-generic.c ... All DTS files appear to be
> > > using input-schmitt-enable/disable and -microvolt.
> > >
> > > 2. input-schmitt-microvolt should probably be used separately
> > > to set the voltage threshold and can be used in conjunction
> > > with input-schmitt-enable in the same node. In your case
> > > you probably don't want to use it at all and disallow it.
> > >
> > > They are all treated individually in the parser.
> > >
> > > Maybe we could patch the docs in pinconf-generic.h to make it clear t=
hat
> > > they are all mutually exclusive.
> > >
> > > The DT parser is a bit primitive for these.
> > > For example right now it is fine with the schema
> > > to set input-schmitt-enable and input-schmitt-disable at the same tim=
e, and
> > > the result will be enabled because of parse order :/
> >
> > > The real trick would be to also make the
> > > schema in Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > make them at least mutually exclusive and deprecate the
> > > input-schmitt that noone is using, maybe that is simpler than I think?
> >
> > I think that this is probably what to do. Mutual exclusion isn't
> > difficult to set up there and if there's no property for "input-schmitt"
> > then deprecating it sounds pretty reasonable?
>=20
> Yeah I agree.
>=20
> Do you want to look into it?
>=20
> Otherwise it becomes my problem now that I've noticed it :D

Yeah, it's just a binding patch here I think, so yeah I'll do it.

>=20
> Yours,
> Linus Walleij

--InPS5/iTnJJVQXkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSBDHgAKCRB4tDGHoIJi
0hYBAQDXuNTU27ZqIQsjPEhhDcO+EPC/JLRa+0NWQs/gnzgtMwD+KVdxXEM0NizJ
1GePWgRXDY50JkyRmHjNltWiQjb/kQY=
=z8bd
-----END PGP SIGNATURE-----

--InPS5/iTnJJVQXkm--


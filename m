Return-Path: <linux-gpio+bounces-27359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C2BF59C4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E4B04842CB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED6832D0EF;
	Tue, 21 Oct 2025 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkbD2bAP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915432C954;
	Tue, 21 Oct 2025 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040054; cv=none; b=I2rvSMGxwueEzIVcclJLhqOBWQqzXgnsX+oeSz+BXUTgINDZ8enp7XyDnwK77otliiShWjxD/cam6W8fZq15ymmTAd6I1G7ELd408AIowkC0nxLmqLg93BM9BMM6jBqXt8nFIL1sdQBwgUek6bVre9swO0ohqrlKqSUZYTogbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040054; c=relaxed/simple;
	bh=grsSk6JOFb4LzCZHTNqtKo5QS081O8N3QJpHDUdA948=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2UjaahmyVpu7dbK1cF2RH9oVvg6c1bETAWlikyVuPozII2nXirhONia6ysoyhtRQPM9/W6p3cYRGfMb0vgSEbNqa2EvjLsxOdHPOAAgBRDPmGqqdsiMEb/HZHkmPa+BOyJBDIJHHYz9zbRwMmWxNKVpttSlxjGGS2KeXViL/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkbD2bAP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7935C4CEF1;
	Tue, 21 Oct 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761040054;
	bh=grsSk6JOFb4LzCZHTNqtKo5QS081O8N3QJpHDUdA948=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkbD2bAPfXF2n0nkCw/W+EGwkCINGUgh2hEhbGKjZP+mIhyU+Q6pAMdsoJzcK2set
	 W8c3CACKE6ilqdOIoEuYMYRIqD8DgkBcBpb1uz1Yi2IIU+iGW2KLOUrvpiXPeC6Ljc
	 gdN/zQMnzizliu5GnrHXRFQUe0XmQXvoGJUMfSY7swy7vE8Wi+QtQUbZ95V0ZlgTHW
	 FAF4o/DtmsZ3eJxWK2uMrHKCifI8HnhmQoFy8QIlrM1hmCXq19gGBPoG5wvrl8CMQg
	 WTYHgVh/9HJvEZhFGDnTQkwnTeXJXAmZglNCZW+K/eLi57ZpGVvbYSXnmcyZNIACF7
	 RYsQdfLoKzbhQ==
Date: Tue, 21 Oct 2025 10:47:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v2 0/5] Microchip mpfs/pic64gx pinctrl
Message-ID: <20251021-distaste-antelope-d7354c0c35c0@spud>
References: <20251014-retype-limit-e6cbe901aa07@spud>
 <CACRpkdadawJmrED-dPpnm+MKD1ndt4V86GOebkiQzU=d+-vHjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dnC6cNxknIm06Wgb"
Content-Disposition: inline
In-Reply-To: <CACRpkdadawJmrED-dPpnm+MKD1ndt4V86GOebkiQzU=d+-vHjA@mail.gmail.com>


--dnC6cNxknIm06Wgb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:05:53PM +0200, Linus Walleij wrote:
> On Tue, Oct 14, 2025 at 4:36=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > From: Conor Dooley <conor.dooley@microchip.com>
>=20
> > Following from my RFC recently [0] I've got a v2 here that's implemented
> > the change from using the pinmux property to using functions and groups
> > that you asked for Linus.
>=20
> Overall I'm very happy with what I see, I see there are some comments
> and my only comment would be to add
>=20
> depends on ARCH_MICROCHIP || COMPILE_TEST
>=20
> on the drivers so they get some proper compile testing, and I expect
> we can apply v3.

Oh, that's a silly one to forget about. I'll do that and just delete the
TODO line that I had in there, since you've not objected to the macro
use.

Thanks,
Conor.

--dnC6cNxknIm06Wgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPdWsgAKCRB4tDGHoIJi
0jSkAQCyjibnJnvvkNa7iuQt94NcFI5OB9Nm3Ju0V2DI3csuPAEAj3cEpIPOWoxJ
aFEp8uNa3Xp+OIrWLSU15jGOyfNa1QQ=
=8AMt
-----END PGP SIGNATURE-----

--dnC6cNxknIm06Wgb--


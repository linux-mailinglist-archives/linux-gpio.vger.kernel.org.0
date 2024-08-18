Return-Path: <linux-gpio+bounces-8781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8716955CF0
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 16:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76C16281458
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 14:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55517E792;
	Sun, 18 Aug 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMyeaN6K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2381FDA;
	Sun, 18 Aug 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723990936; cv=none; b=O8U28L+RUkn4/neUVMP761CTU5diGF/1PaNOoMc/Vom+W0KNTOSzN5HbGxjBueKtuIvSAwG8G5HWSuVy9CHBgSrP60P4/1+A+/qo8BrAgf5/yEDNSYWbUQ0kSshBpSWdhUlhOYwm8zLli7KH8OVOkDrStwiKAXu0lSwCN+DiN1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723990936; c=relaxed/simple;
	bh=bS8ze1d0ffQtXAWwdn7UmuJx/sv0gAVsbFsxPJ/9qWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh/p4IowEMDaOZpy5qFfQPpayU1T58UmcZh07AUhbFSc7Phcpg+0oi1qCWXnFDm85EGJK8mxHHBEtDQ9ZQPiwH/PME0HR8lhosM0cvBqZhYgAKLC2qJ36k91eSOePhv3rRrM9wgvlbJnb0Q/QXRLVbVsAMJ/X1CGWbq1TuraeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMyeaN6K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB2BC32786;
	Sun, 18 Aug 2024 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723990936;
	bh=bS8ze1d0ffQtXAWwdn7UmuJx/sv0gAVsbFsxPJ/9qWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMyeaN6K0vCXdW3b0EH79I/mIztfWQTpDdTc5VASsqSnCn2xrY1DKct9HJ6o2WEv0
	 tRaT+ih1+YeoklkXoaRxK1NRbX+ZU8H9Y2yl6DDitLFiQHc6byM8QdCMNEMFNwW0jS
	 VooXAVt52TBsttcw5xHOiXE29u85iIF5P+9nuqvbcyzRHgtxo9hCdsnXVntAQV6uRf
	 SFUuvjpM7LBEVwY9BSwzqkJ06Q2NZ472yunGidodW8oPGoz89xHtLKEMkCABMz35dZ
	 f2+UL5dkFSs8xFp/I/ditoN2guTc3p5uDEfNyDENgBuoxlAm0O+QM3k2TLocn0QEyx
	 WbLcOd8nO8pEA==
Date: Sun, 18 Aug 2024 16:22:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZsIDkg0qWb9tXNqt@lore-rh-laptop>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="slFC9PSxrwsRPZ5Z"
Content-Disposition: inline
In-Reply-To: <20240816225257.GA2411475-robh@kernel.org>


--slFC9PSxrwsRPZ5Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Aug 13, 2024 at 10:06:41AM +0200, Benjamin Larsson wrote:
> > On 2024-08-12 08:48, Krzysztof Kozlowski wrote:
> > > > +      pio: pinctrl@1fa20214 {
> > > > +        compatible =3D "airoha,en7581-pinctrl";
> > > > +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> > > > +              <0x0 0x1fa2027c 0x0 0x8>,
> > > > +              <0x0 0x1fbf0234 0x0 0x4>,
> > > > +              <0x0 0x1fbf0268 0x0 0x4>,
> > > > +              <0x0 0x1fa2001c 0x0 0x50>,
> > > > +              <0x0 0x1fa2018c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0204 0x0 0x4>,
> > > > +              <0x0 0x1fbf0270 0x0 0x4>,
> > > > +              <0x0 0x1fbf0200 0x0 0x4>,
> > > > +              <0x0 0x1fbf0220 0x0 0x4>,
> > > > +              <0x0 0x1fbf0260 0x0 0x4>,
> > > > +              <0x0 0x1fbf0264 0x0 0x4>,
> > > > +              <0x0 0x1fbf0214 0x0 0x4>,
> > > > +              <0x0 0x1fbf0278 0x0 0x4>,
> > > > +              <0x0 0x1fbf0208 0x0 0x4>,
> > > > +              <0x0 0x1fbf027c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0210 0x0 0x4>,
> > > > +              <0x0 0x1fbf028c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0290 0x0 0x4>,
> > > > +              <0x0 0x1fbf0294 0x0 0x4>,
> > > > +              <0x0 0x1fbf020c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0280 0x0 0x4>,
> > > > +              <0x0 0x1fbf0284 0x0 0x4>,
> > > > +              <0x0 0x1fbf0288 0x0 0x4>;
> > > Why are you mapping individual registers? At least half of these are
> > > continuous.
> >=20
> > Hi, this is by design because of the register placement in the gpio blo=
ck
> > and the fact that the pwm functionality is intermixed in there also. As
> > example the following registers are all GPIOCTRL:
> >=20
> > <0x0 0x1fbf0200 0x0 0x4>,
> > <0x0 0x1fbf0220 0x0 0x4>,
> > <0x0 0x1fbf0260 0x0 0x4>,
> > <0x0 0x1fbf0264 0x0 0x4>,
> >=20
> > To simplify the driver code logic the complexity is moved to the dts be=
cause
> > of that.
>=20
> DT to OS is an ABI. Don't put the complexity there. The driver is easy=20
> to change.
>=20
> Lot's of h/w blocks are just bit soup. This is not special. If a few=20
> regions is helpful, then that would be fine.

ack, I guess we can try to move the complexity in the driver, at least for
gpio-irq controllers, merging regs whenever possible. I will work on it.

Regards,
Lorenzo

>=20
> Rob

--slFC9PSxrwsRPZ5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsIDjwAKCRA6cBh0uS2t
rKwDAPwLD5UGwPDlmvE5WXgaS68NnJV73UgsZQXE/EfO79rNjgEAyvez/nIMzjtu
hVwwFHOPnVs4z/vLiJ+SiZsG/lMGdQM=
=jtGx
-----END PGP SIGNATURE-----

--slFC9PSxrwsRPZ5Z--


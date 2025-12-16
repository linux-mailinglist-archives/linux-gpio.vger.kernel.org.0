Return-Path: <linux-gpio+bounces-29595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB363CC04C2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 01:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14EB93017EF7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 00:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B9DEACD;
	Tue, 16 Dec 2025 00:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIkdHao+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F4336B;
	Tue, 16 Dec 2025 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843511; cv=none; b=Gq6024UywrSGdOiXmc6ZI8Lf5FwFfZwOq5OJTnMV7ERY0OMjQzXxhfl5IOANpkZusA4Hjit+5hfoIPFKaCeSXOmHsqvblZEfgLeDfWe3trQADidx5+A+V1CZX7ctDdbwGqXZfjHUEe90q4h6mSMJJnJOis9p++GBNhnCk5QqoxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843511; c=relaxed/simple;
	bh=LJhx7W/W6voccLzCJ3OlzUKuTDdqlnqRvF+0+Fs3Ndg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqlMLr1Pgs6iRHLwYOx6CdP2ggw7LQxedlZEpFi9gOv5aHBrVHGM8b42cJer8CtW/gVGktZI2ZQMNz+EG8Wth0RRoL1hGSLJVK3KF7/Ic3jo6vorteUZz1z4n0s2AgCAnUtmbJZrjEbe6wNKaL8k9hgeNUaF665WbpZcRzHhpK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIkdHao+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD37AC4CEF5;
	Tue, 16 Dec 2025 00:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765843510;
	bh=LJhx7W/W6voccLzCJ3OlzUKuTDdqlnqRvF+0+Fs3Ndg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIkdHao+A3DaGCD4A28Dg7JqAHFsQYRHKKbz4m/RlRoWcAzcMH0WkwkWAYH8ZQDgT
	 wzfNRrtG8czgE5M9kg1tJGGvpkVb9/JfBL4T2XqVc9r9lATJWdM01kHcB8tllAyhEk
	 WSfs4YfbqEkN76LMG7I71OYyCa1wXcAe2RN9CVzSbAssBdwjBqn84J/BEBZxNLASJl
	 ZHz1uOZXVNozwDOC9NqXzsFy+s5IglIqbWHW2vFyjjK4aFVEy+fZkZX8X956hGBhZj
	 EooslNMgQtWH7aiiu+vBEMMXYOonTmz/gXOKkXgH/xWlekgfsqP3rrXl9qQE2Uq8JM
	 plQYbS8lAwU7g==
Date: Tue, 16 Dec 2025 00:05:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: Add compatible string opencores,gpio to
 gpio-mmio
Message-ID: <20251216-area-commuting-d20343c98fce@spud>
References: <20251214180158.3955285-1-shorne@gmail.com>
 <20251214180158.3955285-2-shorne@gmail.com>
 <20251215-skillet-perceive-2b564a29ed71@spud>
 <aUBWMbKLMWO2Wv_B@antec>
 <aUBi0Fid8vF-G8Wl@antec>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bIdgZ0CC1Xivo1pc"
Content-Disposition: inline
In-Reply-To: <aUBi0Fid8vF-G8Wl@antec>


--bIdgZ0CC1Xivo1pc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 07:34:40PM +0000, Stafford Horne wrote:
> On Mon, Dec 15, 2025 at 06:40:49PM +0000, Stafford Horne wrote:
> > On Mon, Dec 15, 2025 at 04:57:45PM +0000, Conor Dooley wrote:
> > > On Sun, Dec 14, 2025 at 06:01:41PM +0000, Stafford Horne wrote:
> > > > In FPGA Development boards with GPIOs we use the opencores gpio ver=
ilog
> > > > rtl.  This is compatible with the gpio-mmio.  Add the compatible st=
ring
> > > > to allow as below.
> > > >=20
> > > > Example:
> > > >=20
> > > >         gpio0: gpio@91000000 {
> > > >                 compatible =3D "opencores,gpio", "brcm,bcm6345-gpio=
";
> > >=20
> > > What you have done below does not permit this, it only permits
> > > opencores,gpio in isolation.
> > > pw-bot: changes-requested
> >=20
> > Understood, I was not familar with the new schema. I was trying to foll=
ow what
> > was seen in some other patches, now I see where I went wrong.  I will f=
ix this
> > and use the schema validation tools to verify.
> >=20
> > Thanks for pointing it out.
>=20
> I think the below is correct. But, would this be ok to put in one patch?
>=20
> I do:
>   - Convert compatible from simple enum to oneOf.
>   - Add items: for the openrisc,gpio compatiblity string.
>=20
>  properties:
>    compatible:
> -    enum:
> -      - brcm,bcm6345-gpio
> -      - ni,169445-nand-gpio
> -      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO con=
troller
> -      - intel,ixp4xx-expansion-bus-mmio-gpio
> +    oneOf:

> +      - const: brcm,bcm6345-gpio
> +      - const: ni,169445-nand-gpio
> +      - const: wd,mbl-gpio # Western Digital MyBook Live memory-mapped G=
PIO controller
> +      - const: intel,ixp4xx-expansion-bus-mmio-gpio

This is fine, but keep the enum instead of making these into a bunch of
const entries. IOW, just put a - in front of the existing enum: and
reindent it to be correct under the oneOf.

> +      - items:
> +          - enum:
> +              - opencores,gpio
> +          - const: brcm,bcm6345-gpio

--bIdgZ0CC1Xivo1pc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUCiMgAKCRB4tDGHoIJi
0tJJAQDPP7IUyjpfrVRCrN1DBjIkm1Wgwun0jxfuFzSGrHiObAD+Ns3gpbcNgIc+
6rzW60Cumuuy+qnrAZUBUGVHsD1D4A8=
=R5UD
-----END PGP SIGNATURE-----

--bIdgZ0CC1Xivo1pc--


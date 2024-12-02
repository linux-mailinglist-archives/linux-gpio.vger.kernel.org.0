Return-Path: <linux-gpio+bounces-13419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6539E07A3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 16:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D05DC17A133
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5094D20B20C;
	Mon,  2 Dec 2024 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6Itpbhg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316120B1FF;
	Mon,  2 Dec 2024 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153074; cv=none; b=Wx4qxhQJddv8cjYKrNa2k9dFMUkQOfVndqdb6xhs1y94aB07IDsZG8zNZLoeTTI39+l2SimF543viak5qjSvZsncaqD/pmAVdiCLnZDlGml4CrSKEyt4PMkTnM4j07VQhtgNKftGgctiPosVP29Y0qUdVOFKtixtAMQlVXeaUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153074; c=relaxed/simple;
	bh=XYQ0z1Uam77lItbs5TmeenkmhhhYCbef5wkE8j7DNxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfgK8ZjF0ezKfqC2I32ZFNVK6SWw/CDdljaW4eIaAjWAvSHpaHu3oJCoOsCU+QqHnGTX6uDydDZACKYeABteieOg9dM/iK7aJoBCMIFK1PHc87CcH8XlZUzfFD2Vogp8R1V8OUDoTxXCfxVOujO0ae6zYhvnh6UqvhAnkZvMWtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6Itpbhg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED517C4CED1;
	Mon,  2 Dec 2024 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733153073;
	bh=XYQ0z1Uam77lItbs5TmeenkmhhhYCbef5wkE8j7DNxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6Itpbhg32uZaAfl/yleMRcAyuFbk6hyY6q62CjSVT5ePkBcDTqgCHMQflCRZPk3M
	 mS7yABdBHT0BwG2EFPgBmiZaN+/l2JUlG4zdXhFOD7Ogq4aBLnI7qFXDKJqUIzto9D
	 lATKQwjmIsLNaRhRU+p8KxkOl4cY1wyskRvCZFvvXo0GhKusl62rhNtUAb7LVlHUpH
	 DKjyzFmiu2dAdvHzb2VI8GOOD7gvqGB7E9zcfT7sJwsz/b503QjgNsurAdHPHryYhx
	 fIK9u421jmN5QOPoXjC3innffMfVLT2HiNHnJyDvEGsx9qbKoyXhuBfNdSdbFdbB2c
	 5o7Xfgsz1Bg2w==
Date: Mon, 2 Dec 2024 16:24:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
Message-ID: <20241202-goose-of-pragmatic-sympathy-3fbbe7@houat>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
 <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="u7k2sfuk7gzxc7b7"
Content-Disposition: inline
In-Reply-To: <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>


--u7k2sfuk7gzxc7b7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 04:20:46PM +0100, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:31, Dave Stevenson wrote:
> > Fixes up errors on HDMI and interrupt controllers that weren't
>=20
> What errors? I can't find anything in the commit. Describe the error.
>=20
> > noticed before merging.
> >=20
> > Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline suppor=
t to BCM2712")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boo=
t/dts/broadcom/bcm2712.dtsi
> > index 39305e0869ec..f42fad2d8b37 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
> >  			#size-cells =3D <0>;
> >  		};
> > =20
> > -		bsc_irq: intc@7d508380 {
> > +		bsc_irq: interrupt-controller@7d508380 {
>=20
>=20
> Do not mix cleanups with bugfixes.
>=20
> BTW, do not mix DTS to DRM. DRM has its own development style. DTS
> *cannot* be merged there, so combining these series is not welcomed and
> leads to issues (like DRM applying DTS!).

When did that ever happen?

Maxime

--u7k2sfuk7gzxc7b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ03RLgAKCRAnX84Zoj2+
dgeyAX9OFiJpZFQbio0wgmyjERHOVqZ0QnzuwU8/l4uYS3Js8d451pGqbMSkwSuV
y4TIeoEBf1bUqFd30CrhbLvlNqnr2LgNABbYjWU0AzVWN6SzLXWEYk4U7injMDWQ
ojUpgGixPg==
=czBy
-----END PGP SIGNATURE-----

--u7k2sfuk7gzxc7b7--


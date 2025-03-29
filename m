Return-Path: <linux-gpio+bounces-18102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E8A755C7
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 11:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06663AF60E
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672C31B85C5;
	Sat, 29 Mar 2025 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="9AvfLB+E";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="mcxzM+8i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279981AAA23;
	Sat, 29 Mar 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743245966; cv=fail; b=m3qTCPA+RQDFh6wJJzj8gnjaIRltSwgKyTU3rXYglE5keuW/30iZ1XCtW49w5Zfv1IFFLXisq+0ABVl/G8HakKtdDlbqEFJRa5H3jG7FPv7t1/YTRU+SVzDJmnf4HZH1Cdm/Afs7kU3fFVUkFN7y0BB0mljZuOBE+WMpVS107sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743245966; c=relaxed/simple;
	bh=g0GlwfKoo9aeW6pbqwuqAE4oHj1qeNRAIM9irlJcJqg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dYUhO7whfyuLnvyyv4YqXzUShA4/G8bOG6Qxc1XqCUivulwPlOdetEy6AAuTyZiSm9Etnxcr61VJcT37Q7UeL+qDEnp4r8rI8EYhEOpUNiKJbH0LOxq/NPcIgt4PnW2UvV00ipyJk67g0GzQvDHecFUq/bt72pk5Mj240QlWUQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=9AvfLB+E; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=mcxzM+8i; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 4381E480AF4;
	Sat, 29 Mar 2025 06:59:17 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1743245957;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=RHO3yWxTen8cfAxy9aOWoO+AnpnPzPOoPnTKVT1ntBI=;
 b=9AvfLB+Et/5KT+V1EPnYq3i/sfxqn9q2R0SPH7C+gylHhfzjeUHw+UdrvYTRLshTUKiJH
 ZuMskWo1xZIagl7Aw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1743245957;
	cv=none; b=rliDB0OilO6hcbFYZ5wffqU3XC9D4HQ/30AuFkoNqnYBpscKA54wXGJJ8C+1TLIc0RuTj14agEZjpjH9dechhYjs7bJLqqFiJpXZhKEArF3B4+KvEWloyeCydk/V5BI5bLIcpbyC+1bn5FSB+VvjjqT2t8rbaSPxaGV1H/bpmrDeZe8fXxs1OwsaW9E249HgRj2wJwR/uf+QP7DTtzKaZGlycRk6HjemntO5+1sfX4S0VAr43HWYMpJfv4ILehe9ijxZej2GLK2Jm+C/2jfmX1BCAzlQLnuyUdA4B4iIVGbh/c4Q7hUh9SFVC8pB/8jAn692lkTk1b2pRwo65dOKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1743245957; c=relaxed/simple;
	bh=g0GlwfKoo9aeW6pbqwuqAE4oHj1qeNRAIM9irlJcJqg=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=R8jL5gL1+GOkJd3MZiucVyjOqiuHJSepx0dxy9cQ43L1Y68PPHpv2NZbIdnzNFCKvbkB3ZaAEn9Vc4W90H97ztVyp6Gk87cIOlVNkpx1hcRr2ONb2oEut7DJyrgv5aFGhR8uiJ9S6sq3U0W1HxzTp/Qx7Fxokxn8uJfaRT/7h/hjnsIk2rPU8F9713oBSaxSJcn95RO3knvbnZDS4rmCB2zPeugj7cb8yx4DY5195M9gVB7eGcgx57mGmzyEjiJ51Tuw8C1xIfjv2s0RK96jW3QNkusPRZZ7paJ4P1d0nzElQvAgsA2PGvyQnltAnUibr7A3AEs1I/zAxEprO9oG1w==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1743245957;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=RHO3yWxTen8cfAxy9aOWoO+AnpnPzPOoPnTKVT1ntBI=;
 b=mcxzM+8iKkqGtmGR85cxdbvTDoRxCcLSwuEfhXe+N8M9xRkKHDNmXJqiE9cSpKr2Gw/nY
 /ejk3xUwtQKmvtsnq5YR8EwZUSyBt/jD1CPlxlZASM5yGGDtlxXUEq3+MfMFyKfd176wD/3
 k77vvB0/fubyuY72tBgT+F7U8IJsD5VDplEmofqtMjcmPY561LaJTboDEqOef8QwNZrm7OM
 m1ThulyzheohevPuo0zhXGWDJWTUFKQX0iYUWDO8rfj1Q0AEXk7qrK/Ik1WaMlXwBPCkajS
 mpnMQ4CVVLoQPkc1ZSdWDt+z44aSvJC9q1CMGJKJjeWCOFKYSGgOWXMzR6mw==
Received: by srv8.prv.sapience.com (Postfix) id 023B228011C;
	Sat, 29 Mar 2025 06:59:16 -0400 (EDT)
Message-ID: <d4204a3c44b31c6527b91558f9691b6a05faaadc.camel@sapience.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed -> pincntrl patch?
From: Genes Lists <lists@sapience.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 29 Mar 2025 06:59:10 -0400
In-Reply-To: <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com>
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
				 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
				 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
			 <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-uOpdoYz45Z3bDOU1DBh5"
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-uOpdoYz45Z3bDOU1DBh5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-03-16 at 08:48 -0400, Genes Lists wrote:
> On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
> > On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists
> > <lists@sapience.com> said:
> > > On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> > > > ......
>=20
> >=20
> > There are two problems here. The issue you're seeing is fixed in
> > next but
> > not in mainline due to my omission. I will send a patch for that.
> >=20
> > On the other hand, the pinctrl driver in question should be fixed
> > too.
> > Can you try the following change:
> >=20
> > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> > b/drivers/pinctrl/intel/pinctrl-intel.c
> > index d889c7c878e2..0c6925b53d9f 100644
> > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > @@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
> > gpio_chip *chip, unsigned int offset)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin =3D intel_gpio_to_pin(pc=
trl, offset, NULL, NULL);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pin < 0)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * For pins configured to functions other than
> > GPIO, default
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * to the safe INPUT value.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return GPIO_LINE_DIRECTION_IN;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D intel_get_padcfg(pct=
rl, pin, PADCFG0);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!reg)
> >=20
> > ?
> >=20
> > FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
> > return value of gpio_chip::get_direction()").
> >=20
> > Bart
>=20
> Hi Bart - I don't see this pincntrl patch in mainline yet - =C2=A0what's
> your thinking on this?
>=20
> thanks!
>=20
(resending in plain text - sorry about that)

Hi Bart - I don't see this pincntrl patch in linus tree -  what's your
thinking around this?

thanks!


--=20
Gene

--=-uOpdoYz45Z3bDOU1DBh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ+fSfgAKCRA5BdB0L6Ze
27DLAP9ivUZRhlunSDMd4YRgEp+Q4UEeuCrxotIOZjz8/qV3/gD9HQhZvvAE8jlc
0SeGbrTDQewCYFetqURFov5HhaK1nA8=
=aYQz
-----END PGP SIGNATURE-----

--=-uOpdoYz45Z3bDOU1DBh5--


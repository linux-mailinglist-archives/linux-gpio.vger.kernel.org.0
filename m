Return-Path: <linux-gpio+bounces-27310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A3BF1BAE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 16:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC4E3B9534
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 14:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAA13112B4;
	Mon, 20 Oct 2025 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJ9NiPkm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364831BCA1C;
	Mon, 20 Oct 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969280; cv=none; b=kcjA+AvC04P4/5MTlyPEH/WVjNvqE82OyBD2hH2DAVJ0scUqbpeOUg3VSSASJT0MlckNG5EIXW7Zaeks2K+7rIIvJN28OAN9kknyT6vs6/bzR9c9+anGHvNUW15dZLiXwK0o2524QrnNOLW7XXmju86WmSTEMebi1w4sGPCJOEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969280; c=relaxed/simple;
	bh=1qzxelxdfoCjIEpwVkCC0duIL4FdlaZx+A7TRz7WOMw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=mi5LCNPzVW1SBxs03UgvuuHhTqwKjYhDw9k7wPeGcVUFMYm+7zaYk2H7XgV54cC9FCTFLRVYiG+6l0jSHk72r2CI9mVYr72/vTv3Hbbeh9luELuJm9DsAGe7VcNSKmnlYfBz0C2hlfYjFSC5K6hnKIKm6TDkXfI96bJBmYbywVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJ9NiPkm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCD3C113D0;
	Mon, 20 Oct 2025 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760969279;
	bh=1qzxelxdfoCjIEpwVkCC0duIL4FdlaZx+A7TRz7WOMw=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=jJ9NiPkmepYLdaunld4tWNTPzCet3noZ9oMlOFR866oDylMabwwi/tyCcndmCrkqg
	 YcCZYo5retoIulvzR/Sglr69YLv90AqbFsCGU/Pnbrlbayvi4Ny4v2MDjgATj0f99A
	 oRruPob3bWfcCoo1ln8zSi1SB0BTBIutsGpE+0beUwbcI4A6Gnh8y7KXg83LUA1c5E
	 ZI6LG02VuCJucqs5LG8bcnSGepGWStxRyg5MXNMGwWG+gyjpLTG9In8X21Rxolrtkp
	 c/RgoKJ6kuu7E3RSxEANMxQvv33ohhOjTQfaP4Pcjw9IZpeXBe4YR9PCyKC7/pFZTn
	 RMx+/k4K+6QdA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=83dd8af9965a11d8004a383cbd71deb877bb9867a8d43971278444bb079d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 20 Oct 2025 16:07:47 +0200
Message-Id: <DDN7I9IKD3DZ.31YWBI683TKT7@kernel.org>
Subject: Re: [RFC PATCH 1/2] gpio: regmap: Force writes for aliased data
 regs
Cc: <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sander Vanheule" <sander@svanheule.net>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20251020115636.55417-1-sander@svanheule.net>
 <20251020115636.55417-2-sander@svanheule.net>
 <DDN63XH3EQ2Q.1BKBHJTQQASHO@kernel.org>
 <6bf0198d6e67a67e9f72fd27de86d65dc926d041.camel@svanheule.net>
In-Reply-To: <6bf0198d6e67a67e9f72fd27de86d65dc926d041.camel@svanheule.net>

--83dd8af9965a11d8004a383cbd71deb877bb9867a8d43971278444bb079d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Oct 20, 2025 at 3:25 PM CEST, Sander Vanheule wrote:
> Hi Michael,
>
> On Mon, 2025-10-20 at 15:02 +0200, Michael Walle wrote:
>> Hi Sander,
>>=20
>> On Mon Oct 20, 2025 at 1:56 PM CEST, Sander Vanheule wrote:
>> > GPIO chips often have data input and output fields aliased to the same
>> > offset. Since gpio-regmap performs a value update before the direction
>> > update (to prevent glitches), a pin currently configured as input may
>> > cause regmap_update_bits() to not perform a write.
>> >=20
>> > This may cause unexpected line states when the current input state
>> > equals the requested output state:
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OUT=C2=A0=C2=A0 IN=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 OUT
>> > =C2=A0=C2=A0=C2=A0 DIR ''''''\...|.../''''''
>> >=20
>> > =C2=A0=C2=A0=C2=A0 pin ....../'''|'''\......
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1) (2) (3)
>> >=20
>> > =C2=A0=C2=A0=C2=A0 1. Line was configurad as out-low, but is reconfigu=
red to input.
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 External logic results in high va=
lue.
>> > =C2=A0=C2=A0=C2=A0 2. Set output value high. regmap_update_bits() sees=
 the value is
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 already high and discards the reg=
ister write.
>> > =C2=A0=C2=A0=C2=A0 3. Line is switched to output, maintaining the stal=
e output config
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (low) instead of the requested co=
nfig (high).
>> >=20
>> > By switching to regmap_write_bits(), a write of the requested output
>> > value can be forced, irrespective of the read state. Do this only for
>> > aliased registers, so the more efficient regmap_update_bits() can stil=
l
>> > be used for distinct registers.
>>=20
>> Have you looked at the .volatile_reg callback of the regmap api?
>> You might use the same heuristics, i.e. .reg_dat_base =3D=3D .reg_set_ba=
se
>> to implement that callback. That way you'd just have to
>> (unconditionally) set that callback in gpio_regmap_register() and
>> regmap should take care of the rest.
>
> Maybe I'm missing something here, but I'm not sure what difference that w=
ould
> make. .volatile_reg is part of the regmap config, so when gpio_regmap_reg=
ister()
> is called, the regmap has already been created. We can't change the
> .volatile_reg callback (and we shouldn't, it's up to the user to define i=
t).

Ha, yes ofc, you're right. It seems I really need some more sleep.

> FWIW, I did test this with a regmap config that marks the aliased data re=
gisters
> as volatile. The issue isn't that an invalid cache is being read. The pro=
blem is
> that writes are being optimized away when they shouldn't:
>
>    1. Read register from hardware (volatile) or cache (non-volatile).
>    2. Update bits in mask to requested value
>    3. Write updated value to hardware if:
>          A. This is a forced write (i.e. regmap_write_bits), or
>          B. The updated value differs from the original.
>
> Marking the register as volatile doesn't change the behavior, only the so=
urce of
> the initial value _regmap_update_bits() uses. Step 3B is the problematic =
one
> when using regmap_update_bits(). Per the diagram above, the comparison ma=
y
> happen against an input value differing from the (invisible) output state=
, which
> would hide the state change.

Ah, now I got it. Thanks for the explanation. Let me get back to
your initial patch tomorrow.

-michael

--83dd8af9965a11d8004a383cbd71deb877bb9867a8d43971278444bb079d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPZCNBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gsBQF8C33Sss4zBacpSJUE8Gv4+2f/M6XiSVwh
kg914lKwV2kr2+VE9cTIKsgfcegO8OiDAYDVzLaefPzaVHUksJCZbgBUC/M1/9hO
fou3AGFo70XDyQBPkWNwTPcn7yf0F/8Q94Q=
=uypP
-----END PGP SIGNATURE-----

--83dd8af9965a11d8004a383cbd71deb877bb9867a8d43971278444bb079d--


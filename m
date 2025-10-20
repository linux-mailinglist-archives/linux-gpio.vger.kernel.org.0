Return-Path: <linux-gpio+bounces-27307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2FBF167B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 15:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 68A9534D2A4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77962F60DD;
	Mon, 20 Oct 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWbj9mz2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273D2D46C0;
	Mon, 20 Oct 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965332; cv=none; b=mCpm1P4/0PXWTcjVwR+zuftDiYl2TgJLndWkJdmtzsDw0D2PWdD4x0YQHrQryp1kcAmcfWxZWCjgUszGARDIgmMabpalmaJ1YJvvc9kfQxIa3kJdtKGiRFs7Jxz4Bb6mXDzCgdIb5F4532O1ipR9OLcGVHyxhsShtd+C7ujbhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965332; c=relaxed/simple;
	bh=fA58aW8BdyZnMz9d5uDeFZ5SOHA+USSdJOe/kO7tuA4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=AunFuDl/bf96uYKYj29Kvj+utjx3PSEqiwa/RGp86WEoBGYC+M4A+l4wlx1BA3/XfWLgAPx+FQgJg9UWY0JJqRX/8zP+tniYI5kwS2BGphfIGD/8xv/OsjQ4dqOCMCccAGhYsxxQJEThtx4Piz9gbDCwCT25/2MNkiJCe9IYTCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWbj9mz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D065C113D0;
	Mon, 20 Oct 2025 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760965332;
	bh=fA58aW8BdyZnMz9d5uDeFZ5SOHA+USSdJOe/kO7tuA4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=SWbj9mz2Ec5okgibbI2NbPi377Po4GefjcdJgDhKPeZ8zQ2TRJBJ+s87jsVFNxXmo
	 eVPFcTrFH8nP+JFXXcADYWxr8rt8/gc7bBl4Hn6EQYW38oqSQ7SA7FoCzm3ZmT/qmW
	 lc0b33tnbffhSUznyPW88Yhq2yyxMdGIuVwJcWay6JH8xDKLGTRr3wk5ao4g+fexrg
	 dkYbXNkYO4V7sjlhxooxMwASqOAXmnmri7LC8jAmVMYqho1ofqua5jT6HoRshSfwuc
	 Y7y7NyL73innCAEM6sY5Opnq8ri07n+xZ/neXyJaAZRzk3vWkUgklivWO9y5y6msQq
	 83BuazOJwBcPw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a39dce9ec1eceab46245b4c418543b65dcd2935add5e9cab185f3d5a4abd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 20 Oct 2025 15:02:03 +0200
Message-Id: <DDN63XH3EQ2Q.1BKBHJTQQASHO@kernel.org>
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
In-Reply-To: <20251020115636.55417-2-sander@svanheule.net>

--a39dce9ec1eceab46245b4c418543b65dcd2935add5e9cab185f3d5a4abd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Sander,

On Mon Oct 20, 2025 at 1:56 PM CEST, Sander Vanheule wrote:
> GPIO chips often have data input and output fields aliased to the same
> offset. Since gpio-regmap performs a value update before the direction
> update (to prevent glitches), a pin currently configured as input may
> cause regmap_update_bits() to not perform a write.
>
> This may cause unexpected line states when the current input state
> equals the requested output state:
>
>         OUT   IN      OUT
>     DIR ''''''\...|.../''''''
>
>     pin ....../'''|'''\......
>              (1) (2) (3)
>
>     1. Line was configurad as out-low, but is reconfigured to input.
>        External logic results in high value.
>     2. Set output value high. regmap_update_bits() sees the value is
>        already high and discards the register write.
>     3. Line is switched to output, maintaining the stale output config
>        (low) instead of the requested config (high).
>
> By switching to regmap_write_bits(), a write of the requested output
> value can be forced, irrespective of the read state. Do this only for
> aliased registers, so the more efficient regmap_update_bits() can still
> be used for distinct registers.

Have you looked at the .volatile_reg callback of the regmap api?
You might use the same heuristics, i.e. .reg_dat_base =3D=3D .reg_set_base
to implement that callback. That way you'd just have to
(unconditionally) set that callback in gpio_regmap_register() and
regmap should take care of the rest.

-michael

--a39dce9ec1eceab46245b4c418543b65dcd2935add5e9cab185f3d5a4abd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPYyyxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iGUgGAprWEC7dNZlhio/7HdCzcUIyvqzPddM82
AKPwj3OhnjyKqAgyNZRomXdGxtU3Nti4AYCR9UNDrNloYOho0cHUMCfAhc9zAW0s
e4WdM202ZuniZ2dCA7WdX4svC5nFh5wPDP4=
=qjoq
-----END PGP SIGNATURE-----

--a39dce9ec1eceab46245b4c418543b65dcd2935add5e9cab185f3d5a4abd--


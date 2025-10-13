Return-Path: <linux-gpio+bounces-27026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF201BD2C46
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76E084EE8C0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7192571A5;
	Mon, 13 Oct 2025 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkVyQxiP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB142566E2;
	Mon, 13 Oct 2025 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760354578; cv=none; b=DIYk15TJTClTkX8e+DSYA7d8Bg/EWbptrYQz6rOXaJl0blBjsXEl3/RKJEGgFkFvWJO2tgYSfcyuQ0oaRkQUbT/xUbYm9z6ZZspYxMgqyDzWEj3UPPO6U0H2vyLfLfy7/COm/30BycCGEuMvmY/DfOmGYD5yVslc7oN4+s+ptjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760354578; c=relaxed/simple;
	bh=KbCxcwDKL/GeB6jYxqFpthgYhe0x51XcSoROJKA1bcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llRSUJih0NzXqkHXn1XYHRn+acGsVZywD2Wj6fH5aw4of6x4I4DKxq2RH1IDvdiZ2WtxefehW5JXiBZFg+VeTtPpkYEKNfDoErk9LZ8dChVbeS7nWxm6fhqYSpByDrl0qyOO91u1fGaggbPcnyTA9UGi4f/6sTOxw63Xcw9I5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkVyQxiP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77012C4CEE7;
	Mon, 13 Oct 2025 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760354578;
	bh=KbCxcwDKL/GeB6jYxqFpthgYhe0x51XcSoROJKA1bcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkVyQxiP6SBRCfwtjiU4btUhBaAZTplgo0MDDLbyVDzkfd8V1iKrD7pPpi91ZamHf
	 tFBPp6bmt/2lX03lN44A/yuyi4y/o7yaTXJM5xEo+dTCkIQfwAAvYFHv7K57FUDRqr
	 VL8IHfv6j97A0loxRRYuQKna9xhosd5+tbkpco6vKoD0kUISrA9xb8ajZZuYs3k+/z
	 Fj9JoxY711s2d1dRv+7cbPbCA9hAVtfn5QstGAL9XowKfuHd45IV+tVARJQvfU/DBW
	 iFlZPI3XbMkExg7yW2xoTa860bveQAB1r8gkBWug26qaKU4ploqTw68LO4WZqSSWdz
	 VEDv8RUsma4PA==
Date: Mon, 13 Oct 2025 12:22:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 2/5] dt-bindings: pinctrl: add pic64gx "gpio2" pinmux
Message-ID: <20251013-grouped-dictation-83e84fb989db@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <20250926-gilled-muppet-6ac08937cea6@spud>
 <CACRpkdYoECsAGwUno0b_nz-iBB=iwO0Js_6k4O5k+xhig2NYkg@mail.gmail.com>
 <20251001-grunge-unroll-d7a48294570a@spud>
 <CACRpkdYi_n0VcN78eTCty+rVvTnSPFa-pRGOw1LFziBd_2vwBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtasDuPLUQ3We/is"
Content-Disposition: inline
In-Reply-To: <CACRpkdYi_n0VcN78eTCty+rVvTnSPFa-pRGOw1LFziBd_2vwBw@mail.gmail.com>


--vtasDuPLUQ3We/is
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 12:56:42PM +0200, Linus Walleij wrote:
> On Wed, Oct 1, 2025 at 5:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>=20
> > tbh, I found it hard to understand the "line" between using a pinmux
> > property and where stuff should be described in groups or functions in a
> > driver. What is that line?
>=20
> There is no such line, basically what I like as pin control maintainer
> is what exists in the documentation with groups and functions.
>=20
> Then various driver maintainers have pushed me around since
> day 1 because they think it is much more convenient to just
> have some single value to poke into a register.
>=20
> I have come to accept both because the discussions just
> go on forever. I'm not a very stern person, "those are my
> principles, if you don't like them, I have others".

Right, I see. Currently I have 3 drivers, two being what are here. Both
of those I have converted to use functions and groups. The third retains
the pinmux property, mostly because of the number of functions that each
pin can be routed due to being an FPGA. I'll send the first two in the
coming day or two and see what to do about the third. It's got much more
going on and no internal pressure to get it working, unlike these the
first two that folks have expressed a need for.

> Essentially it is a question about what the device tree is for:
> is it just for (outline) description and configuration of hardware
> for a specific system, i.e. where everything that is not
> system-specific should be encoded into the driver, or is it
> for dumping all kind of various SoC-specific stuff into, without
> abstraction. There is no clear line there either, and that is
> part of the problem here.

Now that I have some understanding about how this stuff works, I can
start whinging about people using these pinmux properties if you want.
I'm probably biased by my own laziness and not wanting to write out
dozens and dozens of groups etc, but in cases where there's only two or
three functions per pin, using functions/groups seems like the way to
go..

--vtasDuPLUQ3We/is
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOzhCQAKCRB4tDGHoIJi
0vJ6AP0Wvyxrd3vF1/OoRe5E5Nr3jSD9r6/aGd0S3T/CxCzbiAEAtRF+HCqd8SRp
qUpKANswOri7Zhu502fUXfaYVvnxiwc=
=KEDO
-----END PGP SIGNATURE-----

--vtasDuPLUQ3We/is--


Return-Path: <linux-gpio+bounces-8537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF09459A0
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 10:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F492B22890
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 08:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AEF1C0DF7;
	Fri,  2 Aug 2024 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwm8/92Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A41C0DF2;
	Fri,  2 Aug 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722586117; cv=none; b=W31mSbZpXQXK6sm2LFZsdhPNUfjudvs2Y19sUN8pjK1DNiCGO9UTw/fqWOwfbjnwOLCm1MCHCSDl2+An6oIlkgOSVkOCkg4V+yCVfZZdP1qUtbUKpVTR/3JssAeZdS/OMXMj3yIPfA0DMOQICDAGIMdlboDdblUCDkz4jHwu9E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722586117; c=relaxed/simple;
	bh=FsH3wdtcvgjhgqn/vSYrToks9tDfFD/g6p47+4HujaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWtuceWPqxvZ9MjmRWMSwsEAwGJ6SIskbz/zpadnRK7KIoPLCHhxqUiThTkgEHQJEt/dWny6gI8hwt7EP5JGTh2nocULbdeB/hnR8pv2XPZecTZiXAMc3pgaBzt5VeB/2fPE6ncqkRpUaz515R1KJDq6ZTqb4HcxVYK3w1suwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwm8/92Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E191C32782;
	Fri,  2 Aug 2024 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722586117;
	bh=FsH3wdtcvgjhgqn/vSYrToks9tDfFD/g6p47+4HujaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwm8/92ZOEienicTuhNeHn1BDzsUuaqNfkgUmv7ZS/UVNhlkK8lyge0Viw9rT223I
	 l+yFXEzO+PUYPeeFhNAntoTMz5pAIjZ9nIL/o4u/OVs+iEyr4C7GswpSbDHK1P86jc
	 k107v7h8c2I+JuT3bkKtRQ+w2UdIVW0ThJH46cXrmgEaAK5gjqzRQ8zQeEICkbdC1R
	 NuNK68ASsCQ8UM11W4sc+9JdIso37yG3cI5SHkj8l/zOQd00zeVDJ/TjWIezKwryU0
	 Q1tMbr5alcN33lMXyUgBskpxEKSrt6fpZI9XLV5afs0CTmJK2xzuyNtq2ipNf5ewAN
	 Byds7sIy/BBcg==
Date: Fri, 2 Aug 2024 09:08:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
Message-ID: <20240802-rippling-clubbing-5318f914f16a@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy>
 <87le1k8oq2.ffs@tglx>
 <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
 <87r0b82i57.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xOPLd7jspMNzpBg/"
Content-Disposition: inline
In-Reply-To: <87r0b82i57.ffs@tglx>


--xOPLd7jspMNzpBg/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2024 at 08:49:08PM +0200, Thomas Gleixner wrote:
> On Thu, Aug 01 2024 at 16:09, Conor Dooley wrote:
> > On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
> >> > +	/*
> >> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt fr=
om
> >> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
> >>=20
> >> This is not a coherent sentence.
> >
> > It should read "controller 0 or 1;s interrupt is muxed". Does that make

Heh, I even typoed here, the ; should be a '.

> > more sense to you?
>=20
> No: If a bit is set in the mux, GPIO the corresponding...
>=20
> I'm already failing at 'GPIO'. My parser expects a verb there :)

Ah, so double mistake in the sentence. s/GPIO// I suppose. An updated
comment could be:

"If a bit is set in the mux, the corresponding interrupt from GPIO
controller 2 is direct and controller 0 or 1's interrupt is muxed"

--xOPLd7jspMNzpBg/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqyUAAAKCRB4tDGHoIJi
0tJiAQDK/ooWrAM9WcdKj0bqR5Zx9ER6sCblcL1m6FezXQWh7wEAiwKCvoyld4er
8BIEk1XDwZm2ul8Wx7vA1q98pn9HHwQ=
=8fH1
-----END PGP SIGNATURE-----

--xOPLd7jspMNzpBg/--


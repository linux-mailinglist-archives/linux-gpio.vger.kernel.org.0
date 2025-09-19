Return-Path: <linux-gpio+bounces-26398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81FB8A09D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 16:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 591B316B857
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809D3313E11;
	Fri, 19 Sep 2025 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bo+ti9sV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743031062E
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292870; cv=none; b=lZ8u1QQMy3HHRBEjbW1zH7q4Pty3KwCjnT2fAhUK9AlSbeLL/+uKHKzqirwTRxfxisX7+34jWDgPABv98oO4Jud0gYj28TCZsA6X95jLiB0KryHYtegRd5pbJ9nXwfdDkCnMQj4Epm5UOL8+mGOd8VSDG+XgNWIlepiWXT+8VE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292870; c=relaxed/simple;
	bh=vg+VLVnVm1/uOlgwx6+NHyakWpf7CT1+wvh0cm/sJhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIbojfB83dHlUJctVeI2pH1BSNPs1gwwB/MwwMNFKmWKiG0YK7RiYAlLUw4Fc+w3QTVlIkjeGiS4j5rpshDl9e8CoTkVBV/anGQEqIZS4gLcMKX1AavFwuDj6wYU6ZsEj2rfvlTS7cj19Bzoz/DNlHqaM8EEvxCsykKV6/SajRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bo+ti9sV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vg+V
	LVnVm1/uOlgwx6+NHyakWpf7CT1+wvh0cm/sJhQ=; b=bo+ti9sVXAtjzg/a3wLp
	2r4Qt1xEKhK2iVNYSy4O3V0EUAy0vmeoCRdZzhtaKnwTtFhLkCC6vmRwiW5vMGhP
	InB8LHgIUa7+6VMcEnw3sbShIlu7kl2r3vi3rrCRSGfXxpZEBRPEk84lkPsexw2C
	ZX1tIk6rdvdecNxzl+pft/m0AmJNedTAxM+6uTt4+GJNsXc/lw+dAa3Aw5vm17gZ
	cP2KiPyWNXdW0jvGH3S+O6EKewW6SYcbOfpMdDDq8FxzXLdJxB+F0Guu3QUOCJGr
	PAakYORziKajsMb9UGcrI5GK4nBZMDmrDQq+NcTlUyN4O/sKU7qEGxxbCN6/qDl6
	iw==
Received: (qmail 3951065 invoked from network); 19 Sep 2025 16:41:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 16:41:05 +0200
X-UD-Smtp-Session: l3s3148p1@zjuldSg/IyVtKPID
Date: Fri, 19 Sep 2025 16:41:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <aM1rgY9CCF54c_Pg@shikoro>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-9-herve.codina@bootlin.com>
 <aM0llhn054OI9rA8@ninjato>
 <20250919155910.4d106256@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cI7BpyPbBSmbEbfX"
Content-Disposition: inline
In-Reply-To: <20250919155910.4d106256@bootlin.com>


--cI7BpyPbBSmbEbfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 'interrupt-map' is a required property. If the board doesn't use any interrupt
> GPIO, its dts has no reason to set the interrupt-map.

Why is 'interrupt-map' then a required property? Can we drop it from the
requirements?


--cI7BpyPbBSmbEbfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNa4AACgkQFA3kzBSg
KbbH5A/+KFV1JaIWgdLWXWHARzjzFnlQtriKenzhqLJBCz4lQU+Mzb5VeB7p7ys7
kTu2fYEhPy5TZYH7BTBmQlt/DT9oD9IuvAyzCA7jBDRcI0gBLwNIAUzd6MkIVjTU
88qzoij2nyjRQgDe9qwTx12eu2MnD8s86qp18lTjLsSoMoGdcg9R10rsK0wC3s5J
NEzPQa/WjFReCXS4yPrNk9OWHBXOZs+IW4dLPP9dF9EIkJRUvr0Z72nco7T9f0Rv
4RuGrZdbc0PbseDiYFxFeG8ajxwZEu9CS69jpoO4zmmQOD75VaCV+tR9O+3fDQJW
ZETEIw4uOwpUlF+oWpq4X6tAeUyRBy4KX4OBnfbbkpdiQnfIfvzQf1U9D+Pi9j39
lfR36k7PxBCsMJ0wmVfJcIDhtKNKBUnBWe8UHyDXW79lLU9+eLPn7+FYQEUZnSt2
2oaCRgfXKAwKCK7AWMnKoUTvkxDWEPCMwCFLUoKhrF0xBOUWue7UFwzCUMpgXowm
6pyV8V7886NqBnCpEojZ2rwVBwx2C/HhdFgYc6dSJwmDazB+AUor4Ix290W6NzF3
PWn2ynIEtiVNSGp2g7R0X7uexRMNr1jUp1IQoMYT81+F3WNxZ+ypGnny/dBnGEac
gKbLs/0lWgA11ijNXck092CTdQw1iRBCMEIILOvYzLEjxI8dryE=
=lIeI
-----END PGP SIGNATURE-----

--cI7BpyPbBSmbEbfX--


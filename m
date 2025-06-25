Return-Path: <linux-gpio+bounces-22147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4405AE7B7D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B237166253
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A02027F183;
	Wed, 25 Jun 2025 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ew9ezQma"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4CB27F18F
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842392; cv=none; b=pBngS7BNVcrNxwpWHbuZRq8wrkBEuFV6/RzzFBm6KkPFwg2b/cg0KVPHMjgFtIT6nPJ+KndfZHQpwD8GKXGttk2oYOFCCVY4LevVBqHt6MxD0OS4Bm46HCxs0jXcuZSp5NPX333Jt8NwouatyGsF1SHZt9Wm8GhACmkuYsueJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842392; c=relaxed/simple;
	bh=aZwqj1IyvwUO1EpESArwH2fbuf8xQjTmU4cVnMdchic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc0ayyz2DXTJ1dOl6z02cdduPnSlYoEVu6JrFVyezV5qcXAKPQpc0eHLAbplOsdmqaDuHXLSL6/mhh5pK1dJ4oLNZrzS3PUfb8Z6X4y2AGnO3fHQKziZUa/KlYvPfj9iisuwzP66gdS0ss9kNolczeWy9u9WjAKmafpzxXbE15g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ew9ezQma; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FFIq
	Lj8IywxBDyPkj3J+PsAoAlFAJPnFh8XLA/X9FJ4=; b=ew9ezQmaovupUxC1BQ/7
	+vO6MhZCfCfLn+UuAsXpVuzjwepbpIFu2h4oXRfhLiAM0IMS5SySH2YdeYBrR+94
	iinJtsgz8f190MVLz6t5P8qYP0LucdBKZY5u+woitgnIFYmL6PqW2C3W60OJ2DbH
	OiKNvlgZvob1tj8Sab00Yk2JbH5Biv+3M3Fm6b/n1X9w4j8RRNUJ2Fa+ccsmu9D6
	07XcJcZzqCIlmzGlrZ8QfPKea8k+ng+bLMdOgbhdSa6SFjaqvbcnM9EgEvb3r0bW
	voHRBPipB6JAd0UbheIoQDofVPvq7jHYs5BO6BRmp/Wh65Y74hUnYBIzo1tupjDM
	sA==
Received: (qmail 584775 invoked from network); 25 Jun 2025 11:06:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 11:06:24 +0200
X-UD-Smtp-Session: l3s3148p1@4y9awmE4cKxtKDAs
Date: Wed, 25 Jun 2025 11:06:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: rcar: Remove checks for empty bankmasks
Message-ID: <aFu8D43qSu6ZtTXs@shikoro>
References: <cover.1750838486.git.geert+renesas@glider.be>
 <29fb200d3f92e79cdd5ce4048d2847c265f337b4.1750838486.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uV04KxvBUf3aZkL6"
Content-Disposition: inline
In-Reply-To: <29fb200d3f92e79cdd5ce4048d2847c265f337b4.1750838486.git.geert+renesas@glider.be>


--uV04KxvBUf3aZkL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 10:05:46AM +0200, Geert Uytterhoeven wrote:
> The GPIO core never passes empty bankmasks to the callbacks for handling
> multiple signals at once.  Remove the superfluous checks, and refactor
> the code.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice cleanup!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--uV04KxvBUf3aZkL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbvAsACgkQFA3kzBSg
KbaJvBAAj84JLFUQouNJAUWAzSULUpOPibEbogckQDgyHz0UUIdT3NQ5aF2Ije27
/Ogyb9QUBosaLX3cAa3hSqsBS/4RPphcEm26IYE0KjbarG4UNFEwrTeInvmvYoUq
fiQSeP0CxHL66iWYvav4P/9iAG+0Updna5KCjymJ37EDTSQCZA0sX9pmnur/wPw9
g7ia9sbdaEnBPO3h8MuX5H6X7OuShbQGT+H957UDPK80QcPvOBrEhm1qcDTKPjBp
/DaRFoUHIu+BqoShNqEvhpu+r/2zL7+2mQPFnbZAJWfaGjJRU83oQq9s+Ar71oY6
9diGbA6ZH9J8TGAkcv5I+TH7VHgT9tY6OJgsg0hT40SrNdvrxwYDaS0dBFZnktSI
XD2DA59S/1QWVhnEuDE9hQ/mtyE1CWTU+hsC/xWMl0p2R7A1Th+RsUf/h6qP1UVo
3UOXVbyuY6NV2qC5yRiryzyFF3z9pbeAv9w5nBm+yTDdMnDVATQcjPdoO76351pQ
PlT+9BRhxogd99Zt13sdxvqIfnliRIUl7v8X64WKj4W//4xX7elJnNm5bOQejsbh
MdaWnIzlIPixmtMcT4BAXoU94cmDYpuP5KxfQCnpCyEjd1WvySuF9BBlTdXc40DK
rh9KZhc2r4Y+1KhxgYk13DQvqVCyE2iT4XoI4bXBNabRNbnLf/A=
=LkLS
-----END PGP SIGNATURE-----

--uV04KxvBUf3aZkL6--


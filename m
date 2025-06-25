Return-Path: <linux-gpio+bounces-22148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C2AE7B88
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F42303A3173
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971BD285CA8;
	Wed, 25 Jun 2025 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fGQDeYH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7441C1ADB
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842515; cv=none; b=h8Ryea2kP9fRHp8dh9kHh33f4qoFw4DQeStR9vFLEIeskklijvpeD9FxmLov81GvxVhW26u6Kmr63bP0l9zoBeReHrklmuxMcyOdip30xY8o7LE2oZZwhIuwucyl5hl+NIcqi4mI7ie1pRNMFbNPuvZAzzG37tDVzTU05bN1HRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842515; c=relaxed/simple;
	bh=zN1usWj43+V6Jo3+MDoN3iVY/dvqjbE5h6UQStML7jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMpaMpNNybI1b8v2zjj4HnsNDLp7Z5w6/fgs60ROv2pOrBOcyK7jSREsLYCjAGUor9WJ2dmdmljOjWaHnVybvzwVKMaYXW5dVZTEXEeHAqihboVnZlUBgb1a16+EHlHrx2t09tcSSx0B4cqXo3OwuPF2D66ee8RiSx+zrIxcJpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fGQDeYH1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dbTa
	ayJBitt6tVyuHzNz0a/aYeYuKOQLW1GxfmfsUh8=; b=fGQDeYH1qda6fZ86FXsg
	COcpripJiYFKTjByxZqjVq6J825SPtxDxGCd9GenfQd+Iydl2VDVJKh6O4Iv9r27
	6kmK63ZVbCnqus88Zz4NEM+PnBnfjHL2/DrKQrlMtlXdGyKEise2A8hZQgxP3ppn
	31n1BM5lXpF88lbiCw6xHSbZnJn9MAUKkUtBUjNdRCYtbDmv2+WMqOd8uj1Sgiep
	IhgXx65Cck1Cl2Y4yvONReM9qNtTyNCayjcAj+Dhq2l0Khob5V6hCSN98OvTsgUP
	5jrKQY7zUGQGcUOgsivHEIfh9vWjxgpZIJ4S/CN8s6VojwVB5KmVNdqI+jG8TMxt
	ag==
Received: (qmail 585369 invoked from network); 25 Jun 2025 11:08:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 11:08:29 +0200
X-UD-Smtp-Session: l3s3148p1@HSPIyWE4atZtKDAs
Date: Wed, 25 Jun 2025 11:08:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: rcar: Use new line value setter callbacks
Message-ID: <aFu8jGLZJnr25jad@shikoro>
References: <cover.1750838486.git.geert+renesas@glider.be>
 <f09a0481fc0ddafb9aa05d903fbb42ef52332c03.1750838486.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3epwuTk4uOzT+U0t"
Content-Disposition: inline
In-Reply-To: <f09a0481fc0ddafb9aa05d903fbb42ef52332c03.1750838486.git.geert+renesas@glider.be>


--3epwuTk4uOzT+U0t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 10:05:47AM +0200, Geert Uytterhoeven wrote:
> struct gpio_chip now has callbacks for setting line values that return
> integers, so they can indicate failures.  Convert the driver to using
> them.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Even found the hidden 'unsigned' to 'unsigned int' conversion ;)

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--3epwuTk4uOzT+U0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbvIwACgkQFA3kzBSg
KbY1Ug//QWib6SreRwTtDEbWnAR585Ph8hzC/58q0MoiRASxtbABTndnwXjCbrY3
UfbMlrE8S0pXL41u7ogpa62kV9VkQHBHCGo6PjfLcNmK/pyfhW95VRonF6usoh1B
bvWNEwv0XqLPvB+eYXH053WEirEeUQiUTzlcy0VX9Daz3bMpFfL4K4pRy9YKEiQY
+jFODpqIB08+SmZfPKiwQMhcyFFXvz98HPzTSTNiJPixyPjQX2St1fgzM9ATWn9i
slPZvph7Y3bmO0eFg0adQGhN9gM5AF73iXYZTlIRziZBUZ91AYqIdR4hIBCYB/n5
fMMwSvvdiVtNWJPe5HslaupTZ3NYVkXQ1La9AaeTTYilCgyWEI5J93PUDwa7xyYS
Ec9YCD5OstDqzIZgygdYzbFHBmq8fCW1Ome5CNPZkgUg+Tmk+Pg0liBy+0pprGG9
fRGEwIi0CeUrSfRjIWfsLSILoV6s1QZK2F5jArCBx74L0zawYxEN7JrnDInQNkKm
uRB4+qV7t7Iec49HKCRhYpCo9YOdhB8iCodEra58VH3UVIqZEqmacDUnM7+66RpP
pgXp8Sdh0x5wrtGOp4zhc2nPbW+8Lrjo5vdlKu065ZNzNM8YBmqCtfm64RUTnJ2u
+VUCIaIS7dO30j0r0IcgRqdRuXKyYwMQEQAGIS2dJwZopDNDG0M=
=jF4v
-----END PGP SIGNATURE-----

--3epwuTk4uOzT+U0t--


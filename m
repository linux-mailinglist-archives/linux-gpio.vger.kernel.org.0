Return-Path: <linux-gpio+bounces-26397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBDB8A085
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 16:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701F53A97D1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01BD30F7E3;
	Fri, 19 Sep 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I55mI9xr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC2423BCF3
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292813; cv=none; b=HKgmuzNl0O6bEwT7cwfqL/eNORLHktt9OUemnHzNrPVMzjVL8FacA8pygbNAOdURNFeJbyoo7LiaXLRlTpcjLYlK7RJ3RaA3OH8ps7eiPjIQDEYmoecAaZ//9OIg8dR3BOIwygUwpfa2aVljxY9oM5q5mTN0luH5uayXHfZm7dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292813; c=relaxed/simple;
	bh=OuJgZQPrT3qPzmfLiDjXnFf/ZhzJWaKiOrvxB6TEg88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTH05FMiYt0wONAZC3FWA8dl7o4pCdk4FA39RsJ7QeRfm5ZAO6QIocWREiamhTFzMWVHjQu/nkaPY7KawiBJQ5xRBRGi5J5gbikjpN1zcJMJOZsV1HhN7uFnAOZAbapypQnleM0/tKD3VSy5gQbJB8Sq5T4j8FHhF+cZeQnPuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I55mI9xr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aMz2
	qyB22U+lq9dp0GoWHHFUbASxQzpgfP2d3vrLpbs=; b=I55mI9xrPuMdiw8CbUpc
	UHHLhjyA3VGipimsoNw3xQU23RjmEEwVn568/Y+p5qc1qAbNmmnjT67UvFEVxRCn
	6Ne84l//s1tgYF6ac4KNCB2uffZefoU/fwXg/vzWuxbAeBg92lwwlZ/QzreaSnSv
	Q/cVJuEBQWGecnbtodxT5+BN4BfEGtj2jfoJ8pDjAc6IY5T4nJ27oHt8FLJh022C
	ykx9F2FnLq8fYiusqfCmrCDOBSlqC/bA40aQlnux6JWCfKVtRGcMaHhxlCoTAq8O
	VO0IzwZ/MDLP+t+gnxFIP8Mzv0BtJzto7+yhCOvtZf2MAQjHiKf3uBjGk/7+wB0l
	FA==
Received: (qmail 3950640 invoked from network); 19 Sep 2025 16:40:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 16:40:07 +0200
X-UD-Smtp-Session: l3s3148p1@gFAqcig/VlJtKPID
Date: Fri, 19 Sep 2025 16:40:06 +0200
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
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aM1rRuiJH9dlwBjL@shikoro>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-8-herve.codina@bootlin.com>
 <aM0lU01x1w2wB3LG@ninjato>
 <20250919151448.14f8719a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t2Wx4OLguoeAkJCv"
Content-Disposition: inline
In-Reply-To: <20250919151448.14f8719a@bootlin.com>


--t2Wx4OLguoeAkJCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Rob asked to use only interrupt-map and use directly the interrupt-map index as
> the hardware index:
>   https://lore.kernel.org/lkml/20250801111753.382f52ac@bootlin.com/

I agree with that. Currently an interrupt-map entry looks like:

	interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,

And the number after GIC_SPI determines the index register, no? Can't we
simply say 'index = <SPI_nr_from_dt> - 103' incl. some sanity checks?


--t2Wx4OLguoeAkJCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNa0IACgkQFA3kzBSg
Kbbwaw/8CZKfPrxNCc2ATSpkToC1wxq06i0+Ll/FugMGgZywOxXD1l6fLSD1BURl
Jilvgr1aGzxc0ywLsVk2zDnF/Eb92wqhumR9vmoM5HDC5qHJM23PkMikmUwOshe9
9Miy0CkZG/k43yTVyr5ygHBVJ7aXOcdrKzgOtgK74x0QjIUeyMhhBhcPTUUjMAKZ
b4dl8FCM/uPu6rDa3DgB2FJyypJ910/ZXDQH2ANFnZjKiKXz8gnTzXjbrJsx03Yi
lDwJDNuEadfa9MMpgvbqFSyvulAOhiSYPYfLTqIO9VlJ/FM+zTjY3KKzbnEdbfJo
7m25RnjEpM6gqVo8I+oM1dPwb/HTh68Btbxf1rgabSbd+bxjlXSyq9NUovjfJBey
3xdMkhV19hoUrxZcCeKixejRFkYqnHOkRp6qNhWq6m6Tw68PMqgy5JVfsn8r+ZNX
lj3y9Y0RGYkYsBlZf40x7zZ5Y5O8bRAHQSv5X6htyfFIChERmX3uMVQbDKui9LHL
Z1FQe+9OTPtRoHmHRvRRIOzy9sua9ufI6+8Anbis+L36+6Jjpfw7jrkYde7L866h
WCIcYZWleAGPE3kjUZLdRLDzhauDV4nrA50T49x8ZPOCWis6xQsW/U8AWyszeHIr
/JqTSH0H6nZbLTN0ETyt3la2PWTYOCTuHxyh0s667Llcy8y2MQI=
=duSE
-----END PGP SIGNATURE-----

--t2Wx4OLguoeAkJCv--


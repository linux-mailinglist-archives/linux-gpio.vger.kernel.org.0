Return-Path: <linux-gpio+bounces-26363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A3B88957
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 976457BC41C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0007330748D;
	Fri, 19 Sep 2025 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R8FLyzgk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88083307499
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274497; cv=none; b=skcjb6CLd0gVIMLjdCwPE37nN2f2vZ1z6QRnKumZrnLnnGT0f2hIC1j018tMk4bXHSl2iIaJTRMyf04ug18XnNIIQAIX6ARh6+DGO3lsMoQ1Wl/oWvdvm0pDKGS+zL4x+7muFi69nKrHnizh/8jqwrtESScMnRkDW6Q6gOQ2wGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274497; c=relaxed/simple;
	bh=2BdxvO+LipVZeGNgRKipvDky26JtE7RkzgLeGlqZKQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9gx5hi9kM7y7d7XFwT5ZEBfUaf3WV5Pt/XrODqwteEgbJJng7iKDFn/wUf/UNCwOJYuuKy1TMS/oUWSPveoxPoz0Qh5cXYKia0ubp/W5p3n8G/IUmrUPs0ZfXU/juUfm388wEl+28+o+PViaGo+26Z0iVcSyXwGbUguoN2Lk7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R8FLyzgk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JncH
	VkJM8tsT4MR8AdGnli8kK73nfD/36fL18vXO7C0=; b=R8FLyzgkDcm/d4hyYFYW
	iWvwCAvlNyuEv+CZdMqWnPELgsoJvxV/I2nVjyr4drJ5cbKaJUi4V3nxkkS7IQmK
	n4jgzYOn00Ew3pKGh16OIQla2fZ5a3L3noNGjnYdhXmVuXFuX5KZ6a6X2i0eSNOV
	iIGPSC0lB2oYnDaFawb1R9Ga3yNoiOFMc7VyXBTYPZFI1+UKWN3cJL7Cch32feT0
	7XH4kzHmWTb80hNOqfQzQnb/kPH846mb/EyNZmz0Ktgu5L7av6t5btfJv9JqjUi8
	60p2VLT+zmmfhY06eUhrZuOVchmC6fL8ejWGC+xNzom7xdCxgpNH2GL+ODJ5hV/R
	Ww==
Received: (qmail 3862907 invoked from network); 19 Sep 2025 11:34:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 11:34:51 +0200
X-UD-Smtp-Session: l3s3148p1@rb97LiQ/HpAujns7
Date: Fri, 19 Sep 2025 11:34:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
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
Subject: Re: [PATCH v3 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <aM0ju74JJbjliQAl@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JK9kzNSXnbkqaaBc"
Content-Disposition: inline
In-Reply-To: <20250918104009.94754-7-herve.codina@bootlin.com>


--JK9kzNSXnbkqaaBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +  interrupt-map:
> +    description:
> +      Specifies the mapping from external GPIO interrupt lines to the output
> +      interrupts. The array items have to be ordered with the first item
> +      related to the output line 0 (IRQ 103), the next one to the output line 1
> +      (IRQ 104) and so on up to the output line 8 (IRQ 110).

maxItems 8?

> +        /*
> +         * The child interrupt number is computed using the following formula:
> +         *    gpio_bank * 32 + gpio_number
> +         *
> +         * with:
> +         *    - gpio_bank: The GPIO bank number
> +         *          - 0 for GPIO0A,
> +         *          - 1 for GPIO1A,
> +         *          - 2 for GPIO2A
> +         *    - gpio_number: Number of the gpio in the bank (0..31)
> +         */

I wonder if this comment wouldn't be better in the interrupt-map
description above?


--JK9kzNSXnbkqaaBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNI7cACgkQFA3kzBSg
KbZCcxAAgxPZf4AePiR6qG8VJErIxYZXJ1X3aC0TU9YmDAjfdJjijyML5QKP2j5z
qz2qBimHfUWZWH66HbxU3ymVo1ruY8SROMQ5RqoORL53KYqQiKI9ewc73F3eIkzf
eYXHtulP7jMZ8xrKxYV1PNgUhxhgfigEkS5oDzT7oh8azv23JJmDrGbh7Q3EPxqH
/XCaKwWOlE5MlZVeTWCfhbTW1V86kPxZcjF+41vqIsExpIZZgdD2hYVZphg7r3KM
Zvby6ndv81+EFMwuhO6DfXX+cKCoPsG3X4V6+zUdpa2ApgtHSbD2dxkF6WgZ6UmQ
fvLjcqlsyi+JeUOqcPAO/jtY+lqcavocbr58QrqHH0bdWrfhMWjfGiXvPNbeliuv
mixY07nFnF986HrXWVC4HXpiODeclvaAQFmKV8HoJFeEAahfGMiDqb58wSF3JL50
n8BV0ipFoW/jMv66UVXRsGnM4EJxakBd5x7mwNbUKXhCLtBqeL3Y75sPe8Qtx3cF
nCjb86/jsSWz18tiHyr0RAOxEf8GVM3zTj+JBpgf9bJ5xgT/aDeDRDvyqXHph4MO
pY4PO3CdIkcihfPmyJ0/EBQurc9DPmR3iHNjYReo/GIGaHsEy9RMwCu4zvS3/BfZ
BhfUkl5WjtB+OKJYSVBqr/DScKbQRk8XVEC7ZKCzrrK7ieWQwuY=
=mFbO
-----END PGP SIGNATURE-----

--JK9kzNSXnbkqaaBc--


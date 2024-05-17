Return-Path: <linux-gpio+bounces-6449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A488C88E6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 17:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D6C1C2086F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 15:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84436F08A;
	Fri, 17 May 2024 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iI1+Agzr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05586EB4D
	for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957881; cv=none; b=oU0PXQKHZ8wH8gn+P/wiX7uwPoIr05dITFZ7kPCdtURzTiY9VXRHJgzLzIv+71pzvdOvecxLSqGe7RAIvmtbj09U8Ia1Res82Eyg+zRYivfDjnLYrVhpUWPGp4ZmNaS05eaKXT1qyoB96LeHkYJ6h1aoF7qKcYnrmVUSvrNnKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957881; c=relaxed/simple;
	bh=J9El9DMi7Aqogcqwn4M72J4HZnCmiEhSU8KAHVlqz1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GazEIkQpfG0Xp1UXan1XtG6RA49S9Z6bJUnmLhYG0RtU6i2vSjLnRBUISVUnIAdx2qxVpI8nBkK8KS9OyqpV7wB6fiRKFToU1opsVuYYGvQ1AAxc1l7hvg3Ok1Wx87CUAm8xhVDhaLIrawsLqK1il9zl4j3+JwLOF5VpfMyPstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iI1+Agzr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vl1S
	7NNfcQ1ji6oiWuXr42CZ86hhRSPk2gAQwY+aK9g=; b=iI1+AgzrWh7TGlxnr1LR
	18S+FljBpQQw+aF3Jw4mPoEz4FkEmIZPCxFt1l5pXLZYhYODMHE8ZNHI0YoZeaC+
	QfIg8BJR0YoiyFQmCFR1L8pXDuKXv7UeEOY+Gp7GWOZ9VjKSxRFSw1xkVBlER8to
	PFRI3gw5AToslyyu7UeSGnTykuU7MfbALmY4Sd8VrHLGz2NSBj5xy58bzjPz1H+G
	xAx7J5T5K9mgYjgA4DI3yj5teqhOzM2V9n+VIa/LT7Y7wUljPrfFcjo1A0bhe1PB
	SAGJMNaZtmbl4BbHGxOhPQRHBpDENtOWQGoT+MWIj/OCOExEwIQOP6BGw6vVKy9p
	Kw==
Received: (qmail 3529926 invoked from network); 17 May 2024 16:57:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 May 2024 16:57:57 +0200
X-UD-Smtp-Session: l3s3148p1@4KG6k6cY0ohehhtP
Date: Fri, 17 May 2024 16:57:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 00/13] Analog Devices Inc. Automotive Audio Bus (A2B)
 support
Message-ID: <ucrnnveh2n3nhonbhvpxy7sl3ffaj3cdcx7pnb2h4dj5cwsznh@gfssqshjortk>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="exc5fy2rgxjrvidu"
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>


--exc5fy2rgxjrvidu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>   On subordinate nodes the I2C interface functions in controller
>   (master) mode, providing an additional I2C adapter to the host for
>   each subordinate node connected to the A2B bus.

I am not sure I got this right? That would mean for an I2C adapter on a
subordinate node, that there might be targets connected to only that
subordinate node? How do its messages go to the host machine? Is I2C
encapsulated over I2C? I probably missed something.


--exc5fy2rgxjrvidu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZHcHUACgkQFA3kzBSg
KbYkSg//VsE4vNwHgpYpmukjdTai3yWCL7jcPpvdxCdL77d/laRwaHRS/Uda2G2K
MzkvfPugEynMx6QI1PNbeSu+yDgPQqpvweLp6Ija6u6FQ/gSKEozbM6sHFONJGZS
9PFwvBgRYqTidARUDPdI2vWaZHtZVQ8ERnnFKu/aQI9JTiHIoKoHrj26yR7XYK+r
9doFP50GQyUCcEOESZxwfdF/vhECFNnxkaEjoN6XXZlFy3xFZU3CHlk/2dpwb5sE
IxFFcJ7lPRRCijpM7WGmGcOhHgn0Fq7fZdCdmYIPAq07JVvuAFZlsqm9GMIxYbdH
CzZ+aOhlTroOitpWT0Dmar/Quci7jtL/DQqN5kL9mCn4ShF7JZT90qkV8kZ/EdmK
X2o3yQdSXIlDExRMAQYZ/KaNtxOdFpNjFxqzTxG066wiiHQlpEAKG8XVQh7KMNBV
C+GOBwGcl0aefgLuxgjZcnpnSrBJ+/2d+KnUpIDR2yLcpgTyzM0+jhkoDtujbS/A
ljHcw4FrHiG3GpnjtX4iXhcippoUXHWK5yAQkLKJbNFvTGf5RCoAp5ZQQLSrLUqR
SAFWE5rcZfxjOiGeuYwzCvnXk68p3s9wbqwZZoZhweSS7pmPhRiyYWq5sMfNyHSM
IrXGvesfjslIhXd8otw+ItGouLRoA1s0xBFD35mSeR7zwJKkGLs=
=HB+b
-----END PGP SIGNATURE-----

--exc5fy2rgxjrvidu--


Return-Path: <linux-gpio+bounces-18089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60541A7494D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 12:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E134188FC23
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E5221ABD7;
	Fri, 28 Mar 2025 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BMvwXtjr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDD21ABA6
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161811; cv=none; b=oLRY2Z7IUOC12vmYCnDwbWqRmmL1eIXUkAUKB8Q7XrdGR5cYaVyIvIA63T4CfOzt8wIGrknBcfLJ6VXnim+8xnYLxo4O0s1vWn/GsqXVyPUEsZmIeJiEUlhSkUaMfoReNAA8GWZciNalKQKqEXEsK5aTMfGgvqqULQD/UgB+/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161811; c=relaxed/simple;
	bh=7CdE6abmdcbIw4a9HvwViWR/CuAR0UsUHY0bcNpvB9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co4QrCqBagaqr8ECvF2Fbgiuq7I9f+7Y8qT5lJQh7nyw7PtUJMydT92VQkccEocGmYFvlIKvkm8Tr+0N6I4Is5OvOP7sfv8zU106QnsZATVEBqm5N8J1lK47QrXhyZcLgv/ZnxQcXRZEhIX+XF/36ylSIR+3r7GAXEiSvGuf548=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BMvwXtjr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QO5L
	8F6Tv6G7jsBGSkmzV4B+MnJEKpypQ7BBXhNe5uo=; b=BMvwXtjrsCO2KFxfDJQj
	RssVT0PKDnfrEWRxUThKN2A5e9tmgp14gHgIbXgzLpQa4sLafXKdFWGT3OgWNwAd
	YoCaa5HUgn4TrQ81GK96sGwiia2TCba53RH8wYqXhkr4A5HMjTlAm+DN87GW4ZKG
	P9Uye3Qd6jJTTfS0qnIlMO3cKq9qe/81rz/X8TjNP8uxRL5ox7HyLl3w46oCIyR9
	tIgss4JKiwHLUoxVe0Rh6Dh1qWLNWYNOgq8arHYHtT6qJxPuftkftONH1Xy4XUdZ
	mYIjCFKzz7iC2STfyvVvDYIdO4Yf4awtdQV93K5p9dqx77oraWQvbZlRuHZUoJtm
	Vw==
Received: (qmail 226379 invoked from network); 28 Mar 2025 12:36:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 12:36:44 +0100
X-UD-Smtp-Session: l3s3148p1@vogefGUx3T1tKjIj
Date: Fri, 28 Mar 2025 12:36:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Message-ID: <Z-aJy23ZyXq9lTrV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
 <Z-VETFWFT5NksD7J@ninjato>
 <6fa375d2-5ba8-4b2b-8a54-f28b3cbedcfb@kernel.org>
 <Z-WAZ_IlMBB3XbTN@ninjato>
 <de0f7848-1fe7-451f-b48b-e20fbf3d0c2b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rbVViYxK8BFEIzsn"
Content-Disposition: inline
In-Reply-To: <de0f7848-1fe7-451f-b48b-e20fbf3d0c2b@kernel.org>


--rbVViYxK8BFEIzsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> We do not speak about same things. I speak of review being ignored for
> multiple revisions in one patchset and then another patchset sending
> exactly the same pattern.

True, we are talking about two different things...

> Each of these contributors were not changing here anything, it's like
> not their job. It looks like this will never get fixed, because each
> person wants to just get their stuff merged, so let's ignore the
> reviewers comments.

... this is the technical part where you are correct. I am not arguing
against it and the issue is currently being worked on as I write this
mail.

Then, there is the communicative part which got me. A response like
"NAK, I am not applying this until you finally fix the issue. And I am
getting angry for being ignored the n-th time" is totally fine and clear
enough. We can escalate that internally. But generalizing Renesas and
ignoring that there are individual people there, trying to fix way more
issues than this particular one, is what I percieved from your responses
and what I considered above the line. And yes, I am aware that you are
also doing a hell of a job going through all these DT and binding
patches which I think are difficult to review.

For me, we are entering the space where we can leave it like this and
maybe discuss details over a drink at the next conference. You are
invited then!

Happy hacking,

   Wolfram


--rbVViYxK8BFEIzsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfmiccACgkQFA3kzBSg
KbZDvQ/3XUkMk0S3lualMv9+xB2AAfnJrhcA40zPXXl0VsEhKi2c8C+VsIllpelq
mKMzoYZIki4mrXjJNSrEyQ/DqMTYeTlW2khVn+2qhGFZlAfbQh4zenvd+XkSGF/u
JuKaG+IO0lj/rxnodhEPpjgOVODZXj2UhAOWTAGvGLozTkxoOLhCEYbGfhjEwL4N
6f/G59wpFBYYhTUnYMMNqXZwZC71HZohhoY3hV8EBTKaZCcHV20S3DjEKxhJv0bu
APNVjQLYlUg2LP+fyzhGqx9cAy6f5cRz4929/assP5Ga819bVxyxt/LOS7H2nn3v
ma61v1RwaHwCjLx5xPvy+ZQS5FrtaljioWowZ7XNCytGvOtAxsRLQbcOZSc9kkqb
LNlPqsy8aqdIBoVzwflVAESfYEMyC9Rn2BlJM0hKp1JS6nHqxkwUjanBzRHrXgDw
Ya+b9vFJs0nImFcwYO3BbZwghcC4s0bs6ATdoUW7qfaeIWrwMb6JpZ05MejO6jIf
h3xaaDzsw3OeiEYvxV8K4b+Ogor2dKIisgga4jY4D9hR8c10tr5K+khz9DfvXXKg
zHD/o+2qIk4JRGwYUL/ZG94Et7tGbBn8OMEeTvvgKm2q8idTHkI3e1rowq2tkC9F
6bJ/F2IIBC7AJy+Gw2WVFwnlD2BLE/HtfixdAHvi9rE5Thnj5A==
=7p2i
-----END PGP SIGNATURE-----

--rbVViYxK8BFEIzsn--


Return-Path: <linux-gpio+bounces-26822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB6BBE020
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 14:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F404A1894107
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 12:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0D027D782;
	Mon,  6 Oct 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngQAkhFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11B2905;
	Mon,  6 Oct 2025 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753178; cv=none; b=FRvzM+pS2pP30KE49+cFcd+lsXiJP9RfpwrmwzxxkUr8N8X2hHEZ0qRaWIRrjJ+PEg6NBBjo+nRme5FIDnOHgHYOvjKCk5jEhYz40W0Ng5dM3nrZ4E/Bcc7DQVGvBPzoLzv9X2LBgYzSDsB5rNyTxQMS43D+C2GFKAh2Liyy2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753178; c=relaxed/simple;
	bh=Z6wafg2QwsuXq7WoC2lKdb5ppvY0nwE7Df6gak0UIg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opkBSvkJHP+Wtd1VNUQgPhJ9zHcuP1zRGXGVZrAqsIXCWf+5+KvwUuH6+xD04iFIwMchi5Saci4y6r5jVGYwKKKu7/rbEM5jTlmAtJbYGS3bQPWk0PiDy2nsem4SnC4wON2uF5gvBSUPjj/Z2NeZY0i8e+LaNaMT7MiKUyxpmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngQAkhFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1A3C4CEF5;
	Mon,  6 Oct 2025 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759753178;
	bh=Z6wafg2QwsuXq7WoC2lKdb5ppvY0nwE7Df6gak0UIg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngQAkhFmSP7SRB8JHkFxUzhtWlW+1qWIuECHxF3MXxp5gU2xRgmAkpgP3n/108fJe
	 rmql6SeToRQUUT+XF1V4Auu/v6ksjdgv1m+sh3mv2cJtkJjJDkWT9dPqp/6MAj8DK8
	 N7I+7Vdntgdi7bRLJMM9wdJN2b1CK14wO49xipehkGx92x9ZZsnhW8HZyn9rdomtyX
	 d95EiRQI8ql1VheLGGjA8hp6/srzJBNW0egkVx2/QatYxJoUiW4GKZLkiyr5h6ve7H
	 ZmXDsfJj7aUW4V/fitw3HouVkkSzSlCNUVIqn6ElUydSnhB6i8t6psEO7/Y9rC8yFj
	 8Lvv6gnWCgH6g==
Date: Mon, 6 Oct 2025 13:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <5550fc25-b571-489c-9855-5a9b08822c0e@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVznfU2XOoE/mFMu"
Content-Disposition: inline
In-Reply-To: <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
X-Cookie: You must be present to win.


--TVznfU2XOoE/mFMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 04, 2025 at 02:31:16PM +0100, Srinivas Kandagatla wrote:

> Isn't the main issue here is about not using a correct framework around
> to the gpios that driver uses. ex: the codec usecase that you are
> refering in this is using gpio to reset the line, instead of using a
> proper gpio-reset control. same with some of the gpio-muxes. the problem
> is fixed once such direct users of gpio are move their correct frameworks.

It's common to have GPIO controls for other things, mutes for example.

--TVznfU2XOoE/mFMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjjs9EACgkQJNaLcl1U
h9B7ygf+Nk+FdgamUTpfwmlLaO+GIiuF8L1iwF53ymUmyUQHcvWpf2IMsk5oIfBB
EsMVkL2c77ZuLy5ehS6ywdt8irgeG3DZt4aMI9UqYvHwsoN5IgsIcFKc6DV6wNZN
kYVD53ZLD3hJGlY40sYdcZ/gJPnChAFHPgXCTqXtZPAFauDxrgY6MP6cD5W7sJpI
brFXuZ2OUQr76vPSpOm3cfSbWSIiV1wInqr5yqxcmtBkhFJJ7+3d/veBKClywuvV
hfIGxgwx3mNhUbhJQZcbxecrN3+3gb7UM/lf+eNjNWveK+EfF+EW6fHl8FzL7Gpn
i83NmntXGVFA8LF57NmHwnjt6rJrHA==
=4eQ9
-----END PGP SIGNATURE-----

--TVznfU2XOoE/mFMu--


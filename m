Return-Path: <linux-gpio+bounces-26611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32CBA377D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B018B6258EA
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ED6279DA3;
	Fri, 26 Sep 2025 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpxeCM8E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5171225A35;
	Fri, 26 Sep 2025 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885641; cv=none; b=eAx2/h+Rxv9zSijGXTbkwW/GooDp7xdF9zzseNOnqnVaEaJlI8soFb958eCKiMcw1GSeS2DjeYXQBL3QONEK8yCn3sA6HQn7oG2u6PYuE939AlMyn/JTCOLxtaR4NrVlLNnUZXvfWTXcEn1A/Y2P96TRfv24jN/MFJrc8SYqAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885641; c=relaxed/simple;
	bh=c7XM5Cp6e5ot+aV345F+WYOKm/Hfl/9T18HNuk9qmEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua0xdLx6lv1t6MjDJxp61SK5SXAx9+z26diLrh1XertgWNHiqahxDZJpvGUPNtYKzLoKM+05w/qkmt6qI0D69UWzrnJL+sExP8TK32jI62k66BQSxZqHfwUYdzUU8zyzSL/tm24jh/dA3Y1D+F0okow2yqIIKc0ChsO/zbLaJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpxeCM8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FDAC4CEF4;
	Fri, 26 Sep 2025 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758885641;
	bh=c7XM5Cp6e5ot+aV345F+WYOKm/Hfl/9T18HNuk9qmEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpxeCM8Eb8U82a7Pj0UhpWw/5khoG5JXgSS8+XZqhYG1hfBzVXAdhv7KP9Ycl5uTX
	 h9fTo8/VU0QClfOcacO19w8jjiCoXOHTnsSvLumAcNbd2TJOAlDQAtAQv+4nIlDcVG
	 3JDmrXwxYSplJZUeqt4rx2SE3bfPjfL21QIyGRQ5fhKsRleIw6WMfzPSFGD7p4COVh
	 4u0cJnHKcHZwpEf+8lwF0J181QauW8LIRAYUg2b5mhXYmdD5iqFb5sVEk3Cn2KdmDg
	 u3ZF3T7fIwHfxW47vjwmF5n5FDmrX5gMn3CFW6WHt1jdt3nUKrkrUfNj3p8g4TBbyG
	 X7BHMn/zXdQ4w==
Date: Fri, 26 Sep 2025 12:20:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril.Jean@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: mpfs: fix setting gpio direction to output
Message-ID: <20250926-outsmart-galvanize-ac2078557e57@spud>
References: <20250925-boogieman-carrot-82989ff75d10@spud>
 <175888059620.38209.6546087887696517521.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hr2UoKeytqTZDB2w"
Content-Disposition: inline
In-Reply-To: <175888059620.38209.6546087887696517521.b4-ty@linaro.org>


--Hr2UoKeytqTZDB2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 11:57:30AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
>=20
> On Thu, 25 Sep 2025 16:39:18 +0100, Conor Dooley wrote:
> > mpfs_gpio_direction_output() actually sets the line to input mode.
> > Use the correct register settings for output mode so that this function
> > actually works as intended.
> >=20
> > This was a copy-paste mistake made when converting to regmap during the
> > driver submission process. It went unnoticed because my test for output
> > mode is toggling LEDs on an Icicle kit which functions with the
> > incorrect code. The internal reporter has yet to test the patch, but on
> > their system the incorrect setting may be the reason for failures to
> > drive the GPIO lines on the BeagleV-fire board.
> >=20
> > [...]
>=20
> I'm about to send my last PR with fixes for v6.17 and this hasn't been
> in next even for a day so let me queue this for v6.18 and it will get
> backported once it's upstream next week.


Ye, that's not a problem. It's an "always been broken" thing, so no real
rush. Thanks!

--Hr2UoKeytqTZDB2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNZ3BQAKCRB4tDGHoIJi
0vdVAQC450FuGTZX1Fl8Vjzn4qKrLcWlwaBPXJqzYkuFW8cdMQEAvIN/tLEIUbCa
qKHyddxOB6gipmSkhMm4baDJmDiBCwo=
=sDAR
-----END PGP SIGNATURE-----

--Hr2UoKeytqTZDB2w--


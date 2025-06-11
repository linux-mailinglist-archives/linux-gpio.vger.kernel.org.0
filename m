Return-Path: <linux-gpio+bounces-21367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4BDAD528B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551F4189AEBC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519812750E4;
	Wed, 11 Jun 2025 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FT8xB5QZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CBF2749C2
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638669; cv=none; b=pK3HM4yKq1l6pjmdybPJSJbWtZTfQNv6RWDQ54lzJKZzb0jmy1tsxKpxX2XMTDEoeeAk/JgRBfw35DBEM2KskicKTmn/4ZqHybNOuH2IEjqeI/TZ+XHF3fV6N2tzt/F/X5jDXhhH8bVS2W/HQQV0fOXsWDUI6eWFKH8kyIMnqjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638669; c=relaxed/simple;
	bh=5osS7sA8uiLOyq1ZOLmO7Mg7tci9YLluKF/Md1o2sCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBlWTujRsi7m25PcgsCk90hyta/DPVYlkSjbbzWNfUbaQjmWaSNkubIpUTfYcGWSj66rrqsFtmhBgkDqbPz+rUwNzRZaamDe9mq3xuuxPwOb1wE3mmSHr7CH/KHQm3eJ2HE8krtOEm2zXBA3ncPjBq1NN9pMHNyTsv3eA4baRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FT8xB5QZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5osS
	7sA8uiLOyq1ZOLmO7Mg7tci9YLluKF/Md1o2sCY=; b=FT8xB5QZP4V/XqItEUIg
	7kRO/fu+4WSJrCeC8Sr2yefjCt15u038uvLC0ecSTgnsCvKdkCIDIdxZzigSoMpl
	suZNoOR6KrNcCWTOVgjzN5WuToLmRSG89+YhfBrLGYFSnquYs6/RGLsAWrfotmwi
	6mxBeTh/X5lkvZ2SEsMsplT1zUFHyohme22iUsIUXR4hyH+K7DGO1tJmn8pxBwPi
	5pZixd4Qg20CsVveL0+MxryDbTNBIVsvuy0SSrb7UUzonMS4dPZpfeU66Lf9dmpM
	V2xnGfl/3GC/XeW2EPNyjjA164bCYOEEpXuF/exD7CPPkgOAiTairOhfMt6nAVk6
	gw==
Received: (qmail 3208399 invoked from network); 11 Jun 2025 12:44:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 12:44:25 +0200
X-UD-Smtp-Session: l3s3148p1@Em0af0k3OpcujnuC
Date: Wed, 11 Jun 2025 12:44:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: rzv2m: use new GPIO line value setter
 callbacks
Message-ID: <aEleCNuFRmMWGMu7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
 <20250611-gpiochip-set-rv-pinctrl-renesas-v1-4-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pgMNL4E+S76JB3TK"
Content-Disposition: inline
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-4-ad169a794ef0@linaro.org>


--pgMNL4E+S76JB3TK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 09:27:55AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--pgMNL4E+S76JB3TK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJXggACgkQFA3kzBSg
KbbV7w/+NEqPv4JYNPBoU+KIg0B+PDk3HzXCKIV7bwtpg3izGxqPn+RgSYEB1INW
eRCSEsPliFFxgKkl1Vmb7mhNVx7HJIftU2nUPLWph+9W65o8f40tYLBGXZdu0ggb
15i0j248h851gbDK6VqvqhEx1LQ7WOqcku2j9ERmspcZ67S+hoZZpvmTIvMEOlGi
6lMb72WvX+oHvOUoT/N0FET3qZaKrtpi0w4jkxnYH1kcdANUUt5PVHUtp9gQiomT
fLXuqDlIOR9VPPmxJG4SAqFqmyi6JHd9Os6HRVkHZnqwTo8VLaHdHjNJa8rr1BbE
RoAs0A1Tl0Sgdst2vIHpqkmWvgESR2TSLuFw3eXrSMa/M9+CZDuOPhjTXWK5txNu
ovvaM5U/k+LW1duW6PeWX4TXBNm5+d+qtYht//jRTP2zBh37kOv/mgS5vmtmtOQM
AJDXsKq/u2BzMsLAkHhs1M2cFqB05AXDV0K+Ez1m+bsDbQSEAoJXgE+lrBKPR9z1
O7IFn00wQKkw0ETdfe4T1aYFfG+aCNZhDWivNQjYMkapQqCF9XE0oxpgFGzhjBg9
0lV8p59d+CQTpJpwqMBwvAY/FqeNIPuHAZvHVRVbMslvYcYvijrgQuEfJkBT4KyS
FXiYGQzB/VLIjmVJaqeg3lkxpXIdZLBZh+rRzMSl4hx+Ez5DlSc=
=HW95
-----END PGP SIGNATURE-----

--pgMNL4E+S76JB3TK--


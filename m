Return-Path: <linux-gpio+bounces-21363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C1AD523A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DCEB7A97FE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E56826A1CC;
	Wed, 11 Jun 2025 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WtB9za5y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE626A0C7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638508; cv=none; b=OzB3LkO/3O49N4SwhBsW/Y4mT44BQdmUisaypiixGIFAjK6R/SyTz665Ac57dGC9VlJ258OsVQjwnNLN8ev7Cz1gKu2tzE43eFovr5ZMc2LHiE1CugI17lvldMdQHsPtSYBPZ+vn4PIGMvXYWjlOX9kX2O55XaA6EQYSb1U8KaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638508; c=relaxed/simple;
	bh=SMTIEUhlk1Qql+Wk+qwYCVs4oXyhBBCMyyJNUy6nTEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl536PM1XarAg3EF4lcbW1KoJmqybxVdmKSjhIkQ9EPPD9QpYiYVNN6W3jcqky11UqMfr6yPIDS5g9z23TlN+c9BdwB0UPJRRdDZXe+bRiiWBCmp/fEKZuRHJbQL4Om/p+z8rPV/YYw+sC/NWen78GjyG9UvJTsrkzPraXNXjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WtB9za5y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SMTI
	EUhlk1Qql+Wk+qwYCVs4oXyhBBCMyyJNUy6nTEY=; b=WtB9za5y+5pl3EqnKcEi
	vlASVV84Bi3XBatSpjzjhNi/u7JWbfFxbFTd3XBDbdllZgtS7jR/ULjeDW2rndG5
	Sw8BLuAykp5TziF/4xI6AYMMlK5YeENYEhJ37aHGkCT9gjQEw2bZWrzykDPhyLZR
	Tnre8AsKFRsiqllecwLzr8msSM0R1CRmvgkbAoGwkVR8hjEU0zc1XpC6V461itwz
	hv+2CWQoFY9R41l6jtyzGmNqQphO8vYAOu4gQevLAcjuJOdSXCg78nNmNePSj0dn
	wEsvSeIDnbT1+P4ZIhZnp302u3XB5/18QCU0dYIpHmX4aW9fA7C/JtH8Wrakz2b6
	lg==
Received: (qmail 3207417 invoked from network); 11 Jun 2025 12:41:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 12:41:42 +0200
X-UD-Smtp-Session: l3s3148p1@uT1qdUk3iIoujnuC
Date: Wed, 11 Jun 2025 12:41:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: rza1: use new GPIO line value setter
 callbacks
Message-ID: <aEldZpGD_bns-FBQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
 <20250611-gpiochip-set-rv-pinctrl-renesas-v1-3-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gZkUIpqQEyVNo8iT"
Content-Disposition: inline
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-3-ad169a794ef0@linaro.org>


--gZkUIpqQEyVNo8iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 09:27:54AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gZkUIpqQEyVNo8iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJXWYACgkQFA3kzBSg
KbZqiQ/8CAJrH/4+en4nktdPsP2Arkd1Ih7EgYEBB9XPnn/0uJTKZeg9aTkcO4/1
d7RYi51/6uRjtVV+0TjNgHZJPwJ1z9f8G9mlfD25DTKarw1GdgnDbvTtx0MXaeNA
WmN8UOakCUU0gUnybXEHyW+uCc6RIPfYlQl7jG62ZODNQPxvdNMTdXmr64q2wlSV
1Txq8/9YrVNgM0uSHgI60uYZPGR6WF2oBpivQ3sQmS5Vk0nVnKPUaF/HLJZg7CvY
Kmtq4nk3OAol7AZCxFCcU+JDOc4U8/4dYawjMYyL7Raux2Y+4mQBbw89/bYW0Yei
9DPrPcsjwyP8vwki8iikFiOmnDgSOEAk+tX/iEh5qbZO9YB7RflINmjd2Bjj6u6K
ejLA/hC/lx2QOIaofqAqgT4RoJ9Nj06aHebaHXqnUAwD/z9PGUm+tsO0wkGAU2Yr
CkHDSFxZB35lipVcPmeW64BJBiBhDIWMt1B2AR+n4uzvWqpj978/ZD0lF6UcR4bS
0GbMCO3xrxgfne9tqA9/u4SiXIAN80E13/ii1HV69P03lfATZyKJTbjmX0MgJWH0
u/p/LiznCIzToysBEypmurbKt/vWvcOq2Bw8rRMbh5UgFAZlWiRWMK1qYpSIlNo7
JsIvWvjYQzBIgWfL4G4iXrkwdDvloUXQycOIy9fTXIGTuCdxWv4=
=Lu76
-----END PGP SIGNATURE-----

--gZkUIpqQEyVNo8iT--


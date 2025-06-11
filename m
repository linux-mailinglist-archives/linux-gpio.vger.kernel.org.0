Return-Path: <linux-gpio+bounces-21361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4634AD5225
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727053A2995
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCEA26A0BD;
	Wed, 11 Jun 2025 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LhtajO8m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193025A344
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638390; cv=none; b=puubZv7MOAI8mm7eYkTLv0dDbaYHrp3mSRUKH8EABQRZMN5zGavcZyHYQS5Ve5ooI319uof1Bo8dII53FuZMTNYzgmxFHufRFDtYtBBj3B/WVMRL0J+S9AmH76VCHQZMomW+fvyFcN9yHOuynszfxEHcciRePIVNlDptRB7aUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638390; c=relaxed/simple;
	bh=uGMUMHxFQCUGsonCVqrahKBjFMn8KED3ThrrX01SBSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FR3D3jfukVSJpmpT7xWfz2EkEMkp0Sih7bcXZX6ovZcopYjQIYd2njciP+hU5CpOWBNmHmvxRev+El2y58MGza5aSqI9Zl9u92UE/cK0YwERgxOhMEiY2ppDKGWAd+6jeKP11eC6DWp84Ne9fPWa84gxksuIXh/e4yyILyZU0iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LhtajO8m; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uGMU
	MHxFQCUGsonCVqrahKBjFMn8KED3ThrrX01SBSs=; b=LhtajO8mJC5W7DZ5RSm+
	n2lXHw2rOP8PjpeWZBE4YEd1BLYfC8iYCZMrTyBt8GHQ/ZK5k7jIcOnMfAqYTJnr
	OmapZ7LEb3WHgqdvUCdKlbqRhYfLlYh+KHrmZbL3NrU2qOLu2jFVP0q5Dnd2uCSg
	PPRT99V9HpvePYVaYUxiK+90La7rnY2qyhSF/iRwpzr1tpW19/Yl1NK5cY/ypkEJ
	PXvNFP39SdGjLAsSSdmW8LG4uu8tAXSW5PHL3ef1cJbYSV2SuvxArKr3dFawHx76
	iyR4D0+ZSQpK6VKrhIlSE9Zxq9ua7/bsVx8u2/VO7YKNnWR8WSS+o//ZWCVWcdNJ
	Yg==
Received: (qmail 3206855 invoked from network); 11 Jun 2025 12:39:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 12:39:45 +0200
X-UD-Smtp-Session: l3s3148p1@1/9obkk3bpwujnuC
Date: Wed, 11 Jun 2025 12:39:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: renesas: use new GPIO line value setter
 callbacks
Message-ID: <aElc8A6JI5639Qv2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
 <20250611-gpiochip-set-rv-pinctrl-renesas-v1-1-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NfXtYj+XXyXC+0Dn"
Content-Disposition: inline
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-1-ad169a794ef0@linaro.org>


--NfXtYj+XXyXC+0Dn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 09:27:52AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--NfXtYj+XXyXC+0Dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJXOwACgkQFA3kzBSg
KbYNww//XBad062sJcpw+QFkihlJ6boWzPKkoYT1qBJpn0StpPCp1BflSvkwhk/O
oJednrEeXd8YfKvkF5LT7wcTdhKu8MRx1eHLEFRcTkU7k4Y6Qh8Et8xJqbgKanRI
M2STDzNRdfo3ykhTk7fmi2ss3d0gNguTitQ+ib6tbgjGbukRJZNYT0/CGrLvyhKz
YzTohhau1dMjjKPmrEDmDoghPsmtNV8U9otoRCeBw5zSWyJzOmBwcpSW/fysA0zI
H077aVOHWzSmyIFnarjzq1zR1S5J1wozpJrty1UiSGskJJj5GjU+VZGGXanI6Weh
lyRW5MIkHgabE8cyNwiu/YA3wG3NNIvb4UIVb7DFHWMr4k21ZXDRltfshaEj9lMr
vuti5MX8D77+kERM3/6w/s5PJyR0CfQCOrPJa3XWI2c7Fr7FHYJJAayIOgKrA2Pg
OW7uA9Vq3JC/qVsriBzimyCd3eotYi+Tuo0FiU1VXLPVFn+sIQwYdiBHO6hmbTrp
KpNN7nMsK2zVsmmsOji3YIczvihq+aQjpZHQo3U4pufAt82A1+49rEPuf0+z43Zu
N6zFaTAqRKO9OG/aRwjZLWM6AKyOfogjP1PL73LtRe2JlYrQqQJu9JITNjqb/JNd
Q76LXz5VylAuD1716iUeqOL6w6DzA3GVaBrjoSgLryIN2kRJ5pI=
=kJLV
-----END PGP SIGNATURE-----

--NfXtYj+XXyXC+0Dn--


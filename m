Return-Path: <linux-gpio+bounces-21496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F7AD8401
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 09:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D973AB771
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 07:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BE02C3266;
	Fri, 13 Jun 2025 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MSC1dE1r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615613B58C
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749799367; cv=none; b=jfEsGoI33cumAsrkdPIwk3JscI0t3x53kxtKMOtUz6EsWPljFQx0y5H74wol6InWr4n7wd9D4kZxoT9lDNFVLIwLus8dz6DF2AxDMFWN43XcSgoPUxZef4kTmckFjnYeoplqyRqvxrparGdTzdQUcTBkh7h+J9VNFU2mLRTsloo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749799367; c=relaxed/simple;
	bh=b3lB0rcM9VOkECT6kNBX2H73+BzxMx1FRcYjmAgtr2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPSmqvt3LT4lf6RjhRzgo3QbBPuDB/VYPpnTW5YKl0RYZwJy642sMMIaOCtTUFpFTFm7hoTfbCF736ICnTVqUajPsvKNLuUX624Lan6CGCef8DJAoqwKQ1KBYa4GzmZPO2dwSuYutyeX9F/4E4P5d4LiY2qr2E/qUikZIxSSKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MSC1dE1r; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b3lB
	0rcM9VOkECT6kNBX2H73+BzxMx1FRcYjmAgtr2I=; b=MSC1dE1re8ahddE/Ncwf
	qx5WDrUnFvJlCkSRNJHHdm+9/9s/9ABeBTpo8AMgiw6XP5a/xqdI9iZVFOkQVrfK
	QWo2asGAIwaJ4RxB5nvXdxLcUmrRskWkCtNc23XFvXh2PGeObnjnAWtrMG99GM7T
	4U1NWDs096+L6pDtJ2SPoT03Heu/h0cNXKNML4TJ3UQrEX6SDeRrqlRia0gB87+d
	glKffrB3I24+BD7TtM9uHPaD/Kt7PP+wvtclp0/BQkOE1lnm0cm6YCFU4NvIeoF9
	Zxfg4MLNXvH1wZu+YfJI2U2fiUzedbhl1h04Lb7p0BEiRWjSop3vU2lu6oPsYrox
	ZQ==
Received: (qmail 122092 invoked from network); 13 Jun 2025 09:22:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2025 09:22:38 +0200
X-UD-Smtp-Session: l3s3148p1@MN8z6W43cLYgAwDPXy2/ACpZfVCNKldR
Date: Fri, 13 Jun 2025 09:22:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fully open-code compatible
 for grepping
Message-ID: <aEvRuTTMO6DMl-Mx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gKr9pJH9WT+fA8Xg"
Content-Disposition: inline
In-Reply-To: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>


--gKr9pJH9WT+fA8Xg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 09:16:28AM +0200, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gKr9pJH9WT+fA8Xg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhL0bUACgkQFA3kzBSg
KbY+IA//ef7jNGLhdkKLtTjvVJwVY2f72YXu2V215beViViJAKesgITfPKnuCMKY
C5Ci6PihI0PNhezH/0Tib1P/wULxQxuWIe5k8SNslqgoJtOpEDtACKWa7hWt9pxT
JYtsOU6soGRyqavOPll1Th65axt0/ZFI4UkBf02TWaW76bF6m7jcaZxZoExrPm3Q
JXxFmfRqKoBet98aRb0+NvSdhQVTh5dq1kRTknx/u9oUmlP06pEKHYlSBuhRiomo
yZCMJZefNkCGbkwQbqSFwgslHg995OVNedO3X5oUKz5yhL1yor9vZA0wi1wFhqUk
pcOSzMuuEaKDsGZlVQoxwOD+I4qz0ijeAx40nApQPWZPIDgVrC2rRtIAHLlRtOHj
PJEhUSbNfI2n0YMNkK3B1OZc0/0ITE+9m2+lRwdMaeEXg1hHMDP3lNfmGmriV/Ze
WhxMB1rW6GpTuF3942NO8VEeQsnRJiyXYXFhZ0iCJ9iaOn7qA1Yj2bRQbdpQrmZU
B14bR/Ynj+7YcjXla+tC6HmiCVbRhzOmerMzxrUorg0OKKhH408SKQ+zZb7tKKHE
qOpk4n2r8AJQAwE5zVLmei6pQz+PANxxUIJE0nr73vSk7NB8JLJ33MJmtIS5DIGP
eLiyHPzrx51UBGjAjlpwIxYX0RF2R8ZuCGHzxASWBOeSo/4kJcQ=
=KPLM
-----END PGP SIGNATURE-----

--gKr9pJH9WT+fA8Xg--


Return-Path: <linux-gpio+bounces-28111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD0C35AAD
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 13:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B293562622
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1D7314B94;
	Wed,  5 Nov 2025 12:34:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB65315760
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346055; cv=none; b=mbovlouGY5QPlDRi6b6gSByK5y9dXcG7qra6lbaUrg6ZFNqbavG37EfRj3PjS6Cevz2dj3gxu8xfn2rEvX8HfqaYnNJXnXTTRMby79Kx/VUMyqb6SH4XRUpu5uWK3dXaHhuG9nzwmMGPeR5/FpITN1whO9OZKxvQ/kqR3f6QK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346055; c=relaxed/simple;
	bh=gCn5g/zKNokWUSs7zi6RB7++8iJp66x+WsOsStoRHpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKDt4mHRzvvfafqKsOper2qVmYQXE7e2oXNnNzRqVTupOOqq2gVRiCdJY2Ve/vX5uJXAWR5CR1plXcF1wu05+iSTGKEF5x9EznvzboSMxTijgA8BzI1AP08bDaLjGuhVgYgfoDRLn2X0s0+0dPhaR27pYOvNKVnVLQ6hkrZ3wDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vGci5-0002pr-I7; Wed, 05 Nov 2025 13:33:57 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vGci4-007C4y-3B;
	Wed, 05 Nov 2025 13:33:57 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A4A534984AD;
	Wed, 05 Nov 2025 12:33:56 +0000 (UTC)
Date: Wed, 5 Nov 2025 13:33:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v7 0/2] clk: add support for TI CDCE6214
Message-ID: <20251105-faithful-carmine-bat-257e39-mkl@pengutronix.de>
References: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zkha7kfojqx7pggw"
Content-Disposition: inline
In-Reply-To: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org


--zkha7kfojqx7pggw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/2] clk: add support for TI CDCE6214
MIME-Version: 1.0

On 01.10.2025 10:12:52, Sascha Hauer wrote:
> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM.
>
> This series adds a common clk framework driver for this chip along with
> the dt-bindings document. The cdce6214 needs several pins to be
> configured for different input/output modes which are abstracted with a
> pinctrl driver.
>
> In v5 I tried to split up the patch into a non controversial part (to be
> applied) and a part which needs more discussion (to be applied later).
> That was not very well received, so I merged it back in v6. I didn't
> mention that explicitly in v6, so doing it now.
>
> v7 contains only small changes, mostly binding updates requested by Rob.

Stephen, can you have a look at this driver?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zkha7kfojqx7pggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkLRC0ACgkQDHRl3/mQ
kZxqYggAnHJDddCzeqWgG147r7JWWDFTfHfEFiDVWIp0YDRhKWDG65s68wtn+abi
iz8fl/ZgilSA0arzB+3KuOd0o9Oq+TWoQnQSvzizXTWEC2h3om6ftKTQyKaeLTJ9
s4ytynRL5yOsWmfzfCzK//uzdtSl0f6G8QcN/xCIwJBFktfKgSDM6slvTcFjLkkR
6B3dUaef+cKmo+tWEsUSV2zUXhz/xT6kM/mvDUQXQ4s8Qy+J5PE3dj1/pM0bk4u4
3o/7KM7LRYR9xc3b7E9vqxqjwh86ywI/pHo+hZhSMzoEunEKqPU84O4U4hgGsCQ3
kJwhpH4C46uYjsjss6luSJ1tqbi00w==
=9R3o
-----END PGP SIGNATURE-----

--zkha7kfojqx7pggw--


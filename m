Return-Path: <linux-gpio+bounces-28596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6147C649C2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 15:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF9DA34C19C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 14:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE2F3321A0;
	Mon, 17 Nov 2025 14:12:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827A31DA55
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388758; cv=none; b=ZOAb8U0Yp03ExBbkL2dJSclPfo3ULViKHq038uvOkS7vQ7M/e5QF5VxRBa1sHLnBRdimnGIig0ZfFlUWX2pEySdZu0iiENiuxd3l1FFkiYksfyDgSdm/iIoFPThQ+xcrGe0M31ENp+6SaqEe0LMM/tk8Oc2Qy1Q/w+Fq/cKNXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388758; c=relaxed/simple;
	bh=E9wGSAl01MkYX7OuYqjw49nofROLsJTy7Q1ZZnDa6JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaEj15JSsOPRY8pRCZgQtx64/UmLnzeptOKkyznOaPC7BN2WXidthHOrmkc/BvHgAMwd7nYs2ljYP4TJQFoZt91uCrjJUolyc6w+1peSuvHk2X96RJdtc8wFKfTtA5HTqH4Kj7ql4LG2ip34tTvufr7mjuoJSD+BHlmn2VdgGnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKzxs-0003Tl-KF; Mon, 17 Nov 2025 15:12:20 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKzxs-000vTz-0Z;
	Mon, 17 Nov 2025 15:12:20 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C21C04A15CA;
	Mon, 17 Nov 2025 14:12:19 +0000 (UTC)
Date: Mon, 17 Nov 2025 15:12:14 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v7 0/2] clk: add support for TI CDCE6214
Message-ID: <20251117-agouti-of-striking-fruition-189cbe-mkl@pengutronix.de>
References: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ej22dhfzg73hwiko"
Content-Disposition: inline
In-Reply-To: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org


--ej22dhfzg73hwiko
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/2] clk: add support for TI CDCE6214
MIME-Version: 1.0

Hello Stephen,

can you please take a look at this patch?

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
>
> Sascha
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

regards,
Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ej22dhfzg73hwiko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkbLTsACgkQDHRl3/mQ
kZxSaAf/c0heYgMPx050XyGZozc+EXXEMqdVYrYV9ZDtrPRzSjFU4o5tDGpMJgUV
32mASGSYDD3tvIeNWfu1tg/6uxpj8ANF3XjKEU/+ra7Env8Eswq5iQNPUh+l7Nkc
AMYV/vksGjQtRi97WP0KaKwM1cGPkW2wUjkBlrVGevpXgsCX+xLgET0NBzdj35NO
jN/tGJk29EjNjBxVzDu1Fhq6rH8zeYzrMmMghiuXVInTMCRkrFRRU547hXHCYisr
qTAQPl78+E6JolRO4ZPlt1IMErFLYz4GKPUqW/4rYzzWhDqrLZ8znsIq8vmO9jbU
47dFWDW3VmyCpG46jEFsnC+vpihJig==
=EDCk
-----END PGP SIGNATURE-----

--ej22dhfzg73hwiko--


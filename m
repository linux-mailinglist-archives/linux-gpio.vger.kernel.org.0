Return-Path: <linux-gpio+bounces-2939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F284962B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8831B1F243A2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A6A125A5;
	Mon,  5 Feb 2024 09:16:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3656125A6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707124571; cv=none; b=X8fKUkKhEiAnaWna7xjYI4aUEJoHZGPhs7GVSia0vxxpA6+kXNcXVc7A4NyjFpMz+wRzZn5+jnvKhJuao55ZVoivLtg/bT5sUuRsj83HOjM409kZkF6e8tmAk/vzi6/QHFvVz4xACbUjYaEiOTuG43sjHofEjGsiMZwlfNNChjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707124571; c=relaxed/simple;
	bh=IxpHtcbA09VFc1PalsDZWPfLzIghz12+9ze3N8X96gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5ZR+xjEuMYYLkJ4Fz6gS6ZAMgNC0MH+GxIh8C5FUhfnQ/jx7yp4A1lEDgBQFMr6ptPQXAXDX8+dd/KwTqJBhd7jrJmhrGhyqwOaaEtJUnF0wqkaqj813a7Mo25fHlaZIsTehZ2ph6tZwQ11Q1Q0eDF1utrP04mClhgkC7wPNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rWv55-0000Xx-Af; Mon, 05 Feb 2024 10:15:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rWv54-004bOw-G4; Mon, 05 Feb 2024 10:15:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rWv54-00FKq6-1H;
	Mon, 05 Feb 2024 10:15:58 +0100
Date: Mon, 5 Feb 2024 10:15:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, andy.shevchenko@gmail.com, 
	Angelo Compagnucci <angelo.compagnucci@gmail.com>, Philip Howard <phil@gadgetoid.com>, Sean Young <sean@mess.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Nicola Di Lieto <nicola.dilieto@gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: pwm: Add pwm-gpio
Message-ID: <zxzck6nm2xxakobwj4mk4x3vrz76c7dmlwgplhhunuzr25oeok@lc3kngblfmnz>
References: <20240204220851.4783-1-wahrenst@gmx.net>
 <20240204220851.4783-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rcnd4re5dzypugcp"
Content-Disposition: inline
In-Reply-To: <20240204220851.4783-2-wahrenst@gmx.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org


--rcnd4re5dzypugcp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Feb 04, 2024 at 11:08:50PM +0100, Stefan Wahren wrote:
> +  "#pwm-cells":
> +    const: 3
> +
> +  gpios:
> +    description:
> +      GPIO to be modulated
> +    maxItems: 1

Given that we have 3 PWM cells (so there is an u32 that specifies the
pwm_chip's line number) it would be obvious to allow several GPIOs. But
I guess we can extend this easily if and when the need arises.

Otherwise I'm happy with this patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rcnd4re5dzypugcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXAp00ACgkQj4D7WH0S
/k6piAf9GadB2hhVdUycy5/DYs9wGmQnpDOpBQfyxEnYkOX+lh2U3Z4SoL7PO0rB
AJmVKKFsnzbIjscQCtGJS38ymvhsMnho01i/pXeeI2OHc18EgFmZHcQoXzRvrgoT
FprH3YeXdkWuSiWBZVr45QF1exy6ODtPJfiWq1lsZZC0gtNg3egB9q3GLvOb8Fic
QWkCHgeJbDKovhW3HbPAQCIWdMDDz2qYSVCbJgzVfDl3KaaALV1+weLb5WtsetTT
PDv5ia1jakS7GrDaTb+yIUzbmvsztIxTo20L9IIRrIibdHeE2qVc3OGZAK5nBT+L
sBYFySX+iIncfMiybdiBbE+HoXPCJw==
=exGd
-----END PGP SIGNATURE-----

--rcnd4re5dzypugcp--


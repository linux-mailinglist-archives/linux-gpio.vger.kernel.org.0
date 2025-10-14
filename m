Return-Path: <linux-gpio+bounces-27101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EABD9F2B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5C5F503727
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDA431577D;
	Tue, 14 Oct 2025 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="am+9dNza"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC8314D28
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451113; cv=none; b=i867+0znajYVn2DIXb7A0qxJcPdCXWoL9yWMyIne3lr/1xqdVs/M13cJ0vCOCzJ+0o5J/+JbfPBpEahewk+xdgwywqNP0glOPfoZiU+WvlqQKbCoHVSFb6HvHNTsgHS39iYwiPuRf6hCek6yJtCt4zFkopOpGeSJvo2VWnXw5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451113; c=relaxed/simple;
	bh=GGOhZ1NXIRRoAoZGDFUicG1X0jtUluhE6casgPV7Plc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhmzqIj3+lBxMY8EJxvOJNrtoEJ+8TJdCWwOAl68Qpv8D47x29FU89T3nxjsQpOzRLnG6hcRidU7NUSVT2ufFdHFBl9Cci8CInhMZf3/QvAboVrEWWdo7s8hj0YmlPetX1G3Yj7SWYbXaPHbTPUZHa0Y+7Qo3/Roge9da99MfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=am+9dNza; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JA70
	9D9aV0KbFeBaMznF8xTPGfm+uYBwz4IbBSpqZJI=; b=am+9dNzahdt5tu0crpn7
	5hVp/evaxZy+IFAMG6vbMSrwTOLnxu4Kg1r0OUIbkJJtBrS3ilYzsd3PRX2orMpR
	DrZQaLU6avBNsxSnTZcz2rFHC2ukgXuSO4nZqRPp4mmHHdpnydkRGrrq50moGxM3
	DdENGYDTy094+GLUCFUTmEx4MTcy2OvAXXv6WvwQhH9yevY11ys1Y5OdALsqkHQA
	nYPyfnWwdkYZRXIwClS+sjkCB7DtJhVyK+WR/Rcqhyz9t5bntD90hzKL8fWE+RxC
	8AQXZickcaDxIVvrfCXgLbVhn1LFsHn18B+loUwZR66pLQc/tGcJDCzsfAEvRVUw
	JA==
Received: (qmail 2994204 invoked from network); 14 Oct 2025 16:11:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 16:11:47 +0200
X-UD-Smtp-Session: l3s3148p1@sc7e9h5BOmptKPEV
Date: Tue, 14 Oct 2025 16:11:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aO5aIoCEL-XbpBTp@shikoro>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-8-herve.codina@bootlin.com>
 <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CuF9VfcvHd9s/QRP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>


--CuF9VfcvHd9s/QRP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static const struct of_device_id irqmux_of_match[] =3D {
> > +       { .compatible =3D "renesas,rzn1-gpioirqmux", },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, irq_mux_of_match);
>                            ^^^^^^^^^^^^^^^^
>                            irqmux_of_match
>=20
> Interestingly, this built fine for me before, presumably until commit
> 5ab23c7923a1d2ae ("modpost: Create modalias for builtin modules")
> in v6.18-rc1.

This should be fixed in v4 already as a side effect of my request for a
better namespace prefix.


--CuF9VfcvHd9s/QRP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjuWh4ACgkQFA3kzBSg
KbZRuA/7BuKC3Z6RBFXzV9CIArQv4AqqCtQlaRBI/qLaFUfjWyQXmeIkLeW75wb+
xqQVm68JWSVljqXUIH696tWIPscmQOlagSHvFg5uPhNbpr8x6T4JTrQD4/idEQSG
YtFYHutMdUZtis+ijBELlefGg0YP2kjy/O0dngiEanbrUJAPYpFk3xERfPWHzOG9
VUgzwlT8wQSQNyuish/tjcL/hjtJB5zKO/zk65TYi4/iZmyeq/PrOFBWImvAQHAh
xinJcoEaqF0zDgWr7kXHdOjZz0LrUZmVHbzuNwyLt/iLlW/ZIyMPnzK120ZCdk3W
dTtb/6KR0BfUjK2SCfUg7i/oY397PTn1ssLilefcIC+/EqDbIYFHRvhXrnm62dM7
dchZM7YyLQXmv2lfXRAurXRKrruRMmFOXOUUKA3wJNgzTC2XtWg++BVA35zxvV7M
Ap5t5Dv3808VY78Dkfv4IqxGkdyOcyOvLou0tHHRE7WDQy/4xVlwVRzLs15v5eQO
7BEsvdJJqsgco0kxpPuQ6te8qc3zw9PUPr2xmqdP69LKBfWRV6Gql9dU56oOE2RT
oZrjmFcFUzl1t2XMd6Rxc/2sk737BACIYKDD77EwFnJzyfrvV8z4IcdWoVj6IuXn
cQ9v1zV2r47fSKkQaY3wv4li+sEx4TYDHJ1b3DJdVrHQOlvFl9Q=
=20ED
-----END PGP SIGNATURE-----

--CuF9VfcvHd9s/QRP--


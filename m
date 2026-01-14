Return-Path: <linux-gpio+bounces-30527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2CD1DD23
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004933028FCC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A4738A29B;
	Wed, 14 Jan 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hAqs1iwy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48E3876BA
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385026; cv=none; b=a5pP9pb2Pd1errxwzCFnS7Ffm64l0WZ2/ZUEDEg4+3HplCN2xf1Zc5wEwOxKBYhmlV1mFeGdEq2HMB2S4UGls6MmVek1LbkMyW1NttuEGL32lyv+sZhB47325BdjfGm2xNZE6XqNJGbCqFSQL9X9OABKY9xshqT80tXcP3/bd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385026; c=relaxed/simple;
	bh=xFXwXbndum4DM1yShsTEt0zwByD1YnmTZ7MG+j/+am8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prkaVCUarff+NvQZ+8ttSqyJ6N5cDiwrqSO/CUYdEYRdLA65qT1aXoJqKAcShVSjoJc399aNoBF4D4fj/dwt4tkWAHbFBBnwftRPaPZy9BHGJGgBYkqaBinhhT5sdA/EPH3mw1F8sNw4GVPH5cUdIG6RLBAeql06sQ0tZCmmpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hAqs1iwy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xFXw
	Xbndum4DM1yShsTEt0zwByD1YnmTZ7MG+j/+am8=; b=hAqs1iwy/dr87Ng3xI9E
	lFaxr5OAm8LC+ZrlnPSCGKVBkOCrkxdCdOTrxMTTopaYICJL2hS9Lt0lXVd895LM
	16nTkOpcwOW7/EbrH+P3ZyWhjeMdrdi/jqfeBEoyQQpwkvKEng2/HFfmEMzzoGVT
	0weGSDbdj6xK1Nu0syIB7S2g5BMxlaP7g1QYZEBHo9usc6dmgICVmSJRS9lHMt/q
	2pWx/7yb4ny+akwrhj0Gj4I8Hj5aqmSzrXW+QpEN3c2k9O+RCjMDQNLAoAshGfzd
	fSbmIIP7fgiKRb+hMKtZDMsTLCRWN2IToSzGDG0YcGESXVi+zoHahU7KBKfobkch
	6A==
Received: (qmail 2072906 invoked from network); 14 Jan 2026 11:03:42 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 11:03:42 +0100
X-UD-Smtp-Session: l3s3148p1@9dYYOVZIaoEujnsM
Date: Wed, 14 Jan 2026 11:03:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aWdp_jMVUBN04is3@ninjato>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="to7JUS+GYslzhu9x"
Content-Disposition: inline
In-Reply-To: <20260114093938.1089936-1-herve.codina@bootlin.com>


--to7JUS+GYslzhu9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Rob, Thomas, this series is blocked waiting for your feedback and your
> acks if you are okay.

This was a little hidden between the other text, so let me emphasize
that these acks are needed. The other option is to send the irq stuff
and the SoC stuff seperately.


--to7JUS+GYslzhu9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnaf4ACgkQFA3kzBSg
KbbtEQ/8C0Como31I09MrGQi4ij7SiPMAQ0vrzKs0HYlyyeot8oMboKH8gFT/x1L
Igy+pl5xgGtR13xfVWytY2I46od0XdH/jIvTEAsZmaBcelbubyHAxxaIzA7SlMwT
yJz103L5S/6wMQyS5q2m3Ms9/oN9eydwHdS/QNkV4umQPusK6zeqRVyfUqTakiDL
KyfNR6AHeTrQEy/mrCCO54GPBzmF1/x7cD5MPoEOkINXC0xriWjJNp6pn/N7izVN
9+vLRfylBZsVVBV/jTRjBv2zx9Op12m3smvo0ZxGDjRU3HeCkraE40854ZE9h5lC
LxXyuEuKzACOey4tSy10OZs2Z3QeiDbi9GjzosyFzzJRei3TlViNmf0NxIR54pOU
cfRqCKKQcDSwmORAWwtzY25o5cefRYJGnDWXw/axUG1nen/J2jqrV3AD3tGAf7uz
Zzz4SQg0L9Z3r9+WdpAXl6doZgRPFMZanVbFpC9EZiw4ULotlvMYxVzJqQM2YLFy
7ulh0irGDqiE0Qn8eXbVT+bI1mqWBe2HSa8AlBYdl/Fk1qhnGvYDEUJGvCEAAdv+
fAnxXruyImXZgLT5DaNNeUQZu0Kb9GQo1Rru0toyvLWOZf/ggt4X7PTChBWH1uA9
LI2RKlkgyB1LFz9U9BdApfHJW4/CG3q08g1iDWbRO+ZjzsXTlMw=
=9qkV
-----END PGP SIGNATURE-----

--to7JUS+GYslzhu9x--


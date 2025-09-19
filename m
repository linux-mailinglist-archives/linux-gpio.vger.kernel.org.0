Return-Path: <linux-gpio+bounces-26362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EEB87ED1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 07:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6B41C83406
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 05:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA57A2517AF;
	Fri, 19 Sep 2025 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dfnG49GD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E32153D2
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758260521; cv=none; b=XsfwxajX8DrAFZ4JyFTxhEeeRMNjv7TyX5NOhNo3UJGSTBXiZLjUtYq2ij6A9hR4Ib9+YCnjhpwq0fG4lUAJQSPABO2XFTFapyzL8AXWpiskez02Fp8e5pbS5NsPg7Ie9Betv4MR2HEEUNXNrQGfqXBnXB7WK1nrinqO8HOBegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758260521; c=relaxed/simple;
	bh=4q4/rw5mnD3aV6CATtWOIIeUTbmfcdY4ZrTuAkDyrvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdphNgQEVRiE1okHNKA7Vvmwi+LmRL4bDoSDnznd4qCsFISBlWovMGdDSWxFFVJXWtgp4G93LO/4ogtjQy/v6ghj3+q+9WzsaVcSnZ9hyICXgdvLtqqS6yWGn25MaKsu6PN2I8bjXpzgJZE/ma/j9D7z7ze+FdnxvZ5w8MeCDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dfnG49GD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4q4/
	rw5mnD3aV6CATtWOIIeUTbmfcdY4ZrTuAkDyrvQ=; b=dfnG49GDha8fXT56thxG
	XT9hTOWvzhhtDVXTQaTEElgu+xxb7CvyzHzWrTOMcp70IxkaYpOQM0Kya1+sr4BV
	29aJn76ePhww7F5y4DuTxut1uZ9HMR8KjAQM/asoay8F+jUEossNINNzc6+uYhFt
	EdZShvQgd8QpfhnxATVhItcQeC2ybTVyLUpRZnsI5yyrxFkncIdy4iQ6U2pm5sT5
	S+/U0hoP5bE5f/VnsWRH4JwZq3FS/3245jK0A1QmojcR5a5/e4J/UES0jN7NWJkq
	n+BVaxt3CLe/aLjYbMcUHghx0CM3vyqiOzOQRjeT36A0EZ7nVolAIa/tZ81/S2bf
	Kg==
Received: (qmail 3787594 invoked from network); 19 Sep 2025 07:41:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 07:41:49 +0200
X-UD-Smtp-Session: l3s3148p1@yJAV7SA//tgujnsa
Date: Fri, 19 Sep 2025 07:41:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH v3 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aMztGzYMHEPL1GVt@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NCAvgYw1zCajOLr"
Content-Disposition: inline
In-Reply-To: <20250918104009.94754-1-herve.codina@bootlin.com>


--+NCAvgYw1zCajOLr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.

I want to test this series today. From a glimpse, I might have some
comments, so please wait a little before resending.


--+NCAvgYw1zCajOLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjM7RcACgkQFA3kzBSg
KbZqVQ//Z+JQrYUTEYKiVUYjRP3/e3VPEoOzJNLrPBAT0k4udThHiHECeEV72V/j
jQEv/o2rOTQ8/tR9cN4F8ZbBhbA3LmnLDj3msnHZK4t54ZmrG4DFM0shZYNx8F5y
iHjBIa/YRoC0Fp0udz9PI2yzDgteKNUJ0WiDqEa5R73OHR54Go6VFTunIe3bujMC
CU5uKDs14GFxU3K43GKJEaqxf+oF2Xc9M0mslmGsCDCuGRkA4gIM04WwUSEqvmHr
sXj+v0W6rnhNqtmyHu2ndvr8FTjzSF1hL0AUvwfa6y4hL3knb5XQTuTr5774ZdT/
7wH7m++QJh5YtolMlWvEiGim5+zyBziRyeJxyIm2c164piYWavyfJvJb/vn3KIHM
IxMuKo1VOt/oL6C5dSrSnlvGAHedRf9sU0Nkja/reAcUcBF/l7RChTUnzEqg0DEf
OiXFHpUZrFjXRli040DhILDe3UAszFf4DavvOwzkngYl2YGoFchLano7ws5yxBMC
oa7HL/51xlW7DGgwGm7SHQ5Rx93z/ZJyY8/uB3+RA1nyVBl4C8qYq5CVOiWQrnna
sWvVwbNly46K613UZdCCw4nlJWQvPR4oxdXIUZZCWRCdDVeF11nzEHbBgzIOGAux
jHLh1HMewT/wxlue9Nr6dtQJYKa9QMKdD/MhIQzC8+oqgqEFD8A=
=I+cJ
-----END PGP SIGNATURE-----

--+NCAvgYw1zCajOLr--


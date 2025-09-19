Return-Path: <linux-gpio+bounces-26368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFACB889FC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DC977BDE0E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2CC2FD1A5;
	Fri, 19 Sep 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZX8a5Sow"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50262F3C02
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275002; cv=none; b=BeikBzX0v1UZO2MBbLklpP428Sc6+vCx6IOvMeD0P0uULBUDe0qO7Lnzyp7We1vJK73UeK0lSZ9vpDjPVpCTz1B2WUSowvLDG+CjHytt3jmTFNs6FT5iWDVm2Q82aMsKH5pFrcYSGCM6xXurPN322FI5KhDclDJIa4cGKkYenhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275002; c=relaxed/simple;
	bh=60NtjgMIr/fPONTfqK1ZBb6YnegEjn+kGbb9Vemyc4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjaYcuTjrdDfRWlCMsJi9Ny77gqbKHpHWBnLcmdG6BbkpMnQR/8Zd0pKVLzuLV6M5DLM0iz8rkOhjCLO7wwao+hgComuIRac4M821XJ2ZCsnEbIP7WLOP0R8/dBA431elyYH/tazZVQF+rpTTNOAaeUrqfn6vGNhDxElboT23WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZX8a5Sow; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=60Nt
	jgMIr/fPONTfqK1ZBb6YnegEjn+kGbb9Vemyc4E=; b=ZX8a5Sow/OQ5YIYvILeK
	y+rysDu/6C/2T4ziTDjgzza1KIvQ4henV3skgh+JcOkp/hjjIzJHLZDYTgSvlR5N
	fTBmR+QON0BtpFbj7jc39C8EELxrrUZ1aFywcao17u3yWaWGI+V+fGC+oAhWMBWG
	fm3WJDqD/ikv8E8CplR8MyVM1clxhbPp/pcuXcJ0NWcEwg+hkEqRUA/IWt07aBCC
	zZ7jsv61OnLKuSIJ9GGcjTbS7zQhNQMoTV0gD3SM65TrtfG1yD74m0UqGMecg8Mv
	TsLqMQBjwhb00cmXP6HxeEjbASgGRnTzJfnDJhxpJQ/Krszai9QSN4fnzc1op1AH
	cQ==
Received: (qmail 3865830 invoked from network); 19 Sep 2025 11:43:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 11:43:18 +0200
X-UD-Smtp-Session: l3s3148p1@p7CwTCQ/+K0ujns7
Date: Fri, 19 Sep 2025 11:43:18 +0200
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
Message-ID: <aM0ltldIXG5gwsDn@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <aMztGzYMHEPL1GVt@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QU2Z4x1Hv3rzPMHz"
Content-Disposition: inline
In-Reply-To: <aMztGzYMHEPL1GVt@ninjato>


--QU2Z4x1Hv3rzPMHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 07:41:47AM +0200, Wolfram Sang wrote:
>=20
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
>=20
> I want to test this series today. From a glimpse, I might have some
> comments, so please wait a little before resending.

Despite the comments, the series works fine, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--QU2Z4x1Hv3rzPMHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNJbYACgkQFA3kzBSg
Kbbq7w//YcN45BjkpG3rbOkLdu3JH0IpBfCsD0aj0ZyvmTihWWPmeSCE/WL/WKVV
8UHvqlTYPDAbnP/BQvmDnVV34TdRBXSYyXFKaJqsPTuG7wG+xDwzrZVvglUHWtap
KrKjS865c0RHt5edzTUoiABm/gt+6ItrY3avzW9+/5uxXLchfuhDKF//8kkfrgQM
VRSgfFF2v1CmTnUWdFIbp3JOzszhxZxpTjvH4BHGbyBocFXmVT92mO6+y0YivOKI
UQWptvh9JsJnRpVm4S7oWTyrBAKPT0GAatu32eTe8in2z0LKTSOBlSUCEEPspnk5
XVaCxSeMREsMANlWJLNHC1Qn5n6yeVncYWxVcraIGU+4YuAKDOkm+HeEeVQ6borQ
aZxvdfPU3S2oJFUrkn3KOARQvysM3waoQmuABFQB5hsaehwfb9chAifQBqi5u4IO
RVkizwASE8wrajO830SHSSC7BQTrdcJJeaow+/Ywjip+J81X97ESsdELB3B0cX5+
4NwBXiL45YO3RA6ZpCyessiZL8hHiPU94BTDjto+JgzaCMR5Y2eOHX1z/eYb5jsn
mcG3uju49rbIxQNZWR6WuiwL9zP2rBW6+a6gLzihSeBz82tj4ICAkxUxEE+rl+nS
s8G4icEAmBuyzDN5P49urkz3NtGiCP5zrVYlA6khyc+Noss0xCU=
=VNsa
-----END PGP SIGNATURE-----

--QU2Z4x1Hv3rzPMHz--


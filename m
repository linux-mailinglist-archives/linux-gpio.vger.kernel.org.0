Return-Path: <linux-gpio+bounces-26369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCAAB88AB0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B7BC7B9BFB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58E3233D7B;
	Fri, 19 Sep 2025 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aGTX5dgb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F65247291
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275701; cv=none; b=Nv1PDBPMbzMxlYhubLXmhf5apoSTTCcvyeKm+J7qYHApZi5QpJrl3AAxfK1yHCiraAmXAwHOJxDWIz5K1lCMKGWCEkaQ+CCM0zoE6QWYR+ZvSsqbXhz/47SOoWHf55c9166LDg7m7yy/nYcu9lzkT9nhtwMVHE2YI8IOTYEMVlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275701; c=relaxed/simple;
	bh=MvmrAl1ATHFWac8Tpv52s521t9y4X6Hgzdf78L+S8w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERMbjgBWaci750+FPH717a1jNFWsT75HfRmBGi4ozK9eTcejlPjs8udQSgQy66WBXWnOvglMFdrprYmjSvk0qxq2e2Vyvk0T+8hwVHwnIGYvDFrqI++Yp3mJ6MCWaD49Le9mhpgi0eNJV73CkFC97V5mebmoZ0MLxhj50OX03aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aGTX5dgb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Mvmr
	Al1ATHFWac8Tpv52s521t9y4X6Hgzdf78L+S8w8=; b=aGTX5dgbExFxrvRXC5Ew
	c9PWaOKcAYDUmh3Gjnfcrtsf2MFW0H7xUxoF5HY146squ27/p25xFYrLnq2RKbST
	Ow18cw0LQbqZtt+fdYQyQvPEDUU9pfaZhJ20mUClGHN390hX4OUcwSXlA5Zw/m58
	LNL8XTAIZPF7Ns+zgS4qVVJ029+v0IRPV+9SoU1Q5nxb0U561HQMovH7rNxk0AtA
	/KzlNJuAwt/oCo2qEKqq7zHac601VNXohFwFQs0Fq9H3rJTSOWuH8QzX2RAuNar9
	aHwqeq8oBr7vRtqNuIhL4ckYBU220q6hLztYKLEx26F9OI3RHXoM3AJHVueInNZW
	tQ==
Received: (qmail 3869250 invoked from network); 19 Sep 2025 11:54:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 11:54:57 +0200
X-UD-Smtp-Session: l3s3148p1@fqdVdiQ/xJAujns7
Date: Fri, 19 Sep 2025 11:54:56 +0200
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
Message-ID: <aM0ocJOCjctW6Lad@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <aMztGzYMHEPL1GVt@ninjato>
 <aM0ltldIXG5gwsDn@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VdkSnDAtQt1emg5P"
Content-Disposition: inline
In-Reply-To: <aM0ltldIXG5gwsDn@ninjato>


--VdkSnDAtQt1emg5P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 11:43:18AM +0200, Wolfram Sang wrote:
> On Fri, Sep 19, 2025 at 07:41:47AM +0200, Wolfram Sang wrote:
> >=20
> > > This series adds support for GPIO and GPIO IRQ mux available in the
> > > RZ/N1 SoCs.
> >=20
> > I want to test this series today. From a glimpse, I might have some
> > comments, so please wait a little before resending.
>=20
> Despite the comments, the series works fine, so:
>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

To be more precise: I actually tested patches 1, 5, 6, 7, 8.

Maybe I can test patch 4 later today on my RZ/A1-Genmai.


--VdkSnDAtQt1emg5P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNKHAACgkQFA3kzBSg
KbZurw/9HE6nFqkyzux+2lwg+RZ2bBk9E30AmavFY/BHZ8UsetX4KwHnTdWIgK4N
CN849P3UTH7LGwBiLywYdOmSQqldrDg9mwX6W1II2xtK7Rmgh6Kwv/7VpOkmxe4s
fkF0qLnKKKxJ4/cxk0V1MolT9CmcIRLk+q8rQgmpanR8mJyk6HYJ5EWP9F+OyRT4
gTFUvUfxjiSfX9OJE1ECA9RmlI10hxmnrakXJoF/E/rOl5zU+aQJ48Sr5zydb+qP
pUvqxUXqTAFtZnWwYvJ64E/qAA1H/NXRccwcgGKifz8/OHk4RuyTAc7nI55o/Ucg
FGOK2YAboJzQYU82RD/vWP5hIbxz1DP/RpcMROjpN5Bbl+oDb3uCBr8aWgox3cdt
H5/APuA1G0OffBSOhlUnM+W62ODlxJA1oaK3CGS8SjILhWYjgDD1YwF/vqj9RMGx
lrL0FM3lawKYgvBkYTj6T66pT8ZCCKPCQx+GZ/QhDiNGS6C99DCYv/CeVkLzi2C5
EhjgFpXUjQfv0NrwDvrsztjD5HUjdqdG/7aAPDjqvsdphKNbACsiURURRFpaeoH6
pcWp4qqnU1GGl+rVzs00cbJ7Sto19NJik5WLDQbmU2DLl8+OsBlWW6qr7nERguQZ
6Ahh5LuXtYDgCGlyTvne0n3H+oXNKbfcU2ML74kCV2VCmynK4iI=
=+u4y
-----END PGP SIGNATURE-----

--VdkSnDAtQt1emg5P--


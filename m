Return-Path: <linux-gpio+bounces-10233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810F97B502
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 23:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B49C1C229FD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 21:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A7F18D655;
	Tue, 17 Sep 2024 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+IeerCj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED48B148828;
	Tue, 17 Sep 2024 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726607422; cv=none; b=OuJVpMiFQhEUhBiM06jVzx6eILKeOyrvXkJxW1U0ARxfFkKYAueuJtGDCn2hpYJwjqlJ0koe0ynLp+Ntvc2KqopZ1TQ+sSZGaLxON+7QdnS7WjE/K9SJavsGG9nYm/0eI0kBwlZe2zdoqlE5hQENgnj8LXWXCRg+YMfMt1XFnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726607422; c=relaxed/simple;
	bh=0+1Kk8qbnQpvx/WTrWcAecTadUQe/6CkxewPFVE67f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8S6QbVvCckY2HmxEKT1cCr26oipmncNqf0pt85VIzTc3dd8y8p7b1JB8lLxvY5BpvE4KzADRd+1KNBkQ+K3eA2AoSrGwsgODu5+h1NAsBuGlPurBtEsyhGdtUD9GTu7jpGdURrT3ZyRq9iOrVAuugP2zx/bMWwADoK3gxkyqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+IeerCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8368C4CEC5;
	Tue, 17 Sep 2024 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726607421;
	bh=0+1Kk8qbnQpvx/WTrWcAecTadUQe/6CkxewPFVE67f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+IeerCjUCjrDlkF+ZG++13Tno4MgaBhi202Htzlv88wmkFSredyg2zc+RExWjX/J
	 Y3/aJtLP31WYS1s1gs4LsPmbECVV1PTaH1tbNa+o12k90KBTDYvlGqXrqiLKTTYJD5
	 tqBbcLbSIk/CQBRLpU+PQiWo7Olg8l2m9D234ACNO/LxUyfeZohCosX45R6uMUVKpX
	 KO8yADgQCI40F2f+jFSJIjMb6OoPk0ODwqYNeNz2kt0xRKlHy74xRVfb5YOYns0DAl
	 JyT7guFRCMgdNCruMGXrMUMo5ditXGEzLVkpJdt7p+YVlrsxOj9ij/qjAJlQuJe2Pf
	 uu1grnJqdSk0w==
Date: Tue, 17 Sep 2024 22:10:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Message-ID: <20240917-appease-angelfish-7ae6490f3dd9@squawk>
References: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
 <20240917-lan969x-pinctrl-v2-1-ea02cbc56831@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaFozI3L4Cl0p1Ja"
Content-Disposition: inline
In-Reply-To: <20240917-lan969x-pinctrl-v2-1-ea02cbc56831@microchip.com>


--jaFozI3L4Cl0p1Ja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 02:45:40PM +0200, Daniel Machon wrote:
> Lan969x is going to reuse the existing Ocelot pinctrl driver - document
> that by adding compatible strings for the different SKU's that we
> support.
>=20
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--jaFozI3L4Cl0p1Ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZunwPgAKCRB4tDGHoIJi
0r5CAP9nkg4MqFxcQWXAXSDB29vqTFeIHZse1degYU92eUEDcAD9ERB+KS1RYS6Q
snKzldKIgd4RVWUeb9oa/TkQtMs1fw8=
=So0U
-----END PGP SIGNATURE-----

--jaFozI3L4Cl0p1Ja--

